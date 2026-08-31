if engine.ActiveGamemode() != "titanmod" then return end

if SERVER then
	AddCSLuaFile()
end

DEFINE_BASECLASS("tm_gun_base")

SWEP.SoundMats = {
	[MAT_DEFAULT]		= Sound("darky_rust.bone-knife-strike"),
	[MAT_WOOD]			= Sound("darky_rust.hammer_impact_wood"),
	[MAT_ALIENFLESH]	= Sound("darky_rust.bone-knife-strike-soft"),
	[MAT_BLOODYFLESH]	= Sound("darky_rust.bone-knife-strike-soft"),
	[MAT_FLESH]			= Sound("darky_rust.bone-knife-strike-soft"),
}

SWEP.SecondaryAttack = function(self) end
SWEP.AltAttack = false

function SWEP:SmackEffect(trace, dmg)
	if self:GetStat("SwingHitAnimation") then
		self:PlaySwing(self:GetStat("SwingHitAnimation"))
	end

	local atk = dmg:GetAttacker()
	local hitent = trace.Entity

	self:EmitSoundNet(self.SoundMats[trace.MatType] or self.SoundMats[MAT_DEFAULT])

	return BaseClass.SmackEffect(self, trace, dmg)
end

SWEP.Primary.Projectile = "rust_throwable"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Ammo = "none"
SWEP.Primary.AmmoConsumption = 1

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.AmmoConsumption = 1
SWEP.Secondary.Automatic = true

SWEP.IronSightsPos = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably
SWEP.IronSightsAng = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably

SWEP.Primary.MaxCombo = -1
SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- ANI = mdl, HYBRID = lua but continue idle, Lua = stop mdl animation

SWEP.ThrowGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
SWEP.DMGMultiplier = 10
SWEP.ProjectileMass = 1
SWEP.ProjectileGravityMultiplier = 0.75

local PullIdleSnd = "darky_rust.compound-bow-held-stress-loop"

function SWEP:Initialize()
	hook.Add("KeyRelease", self, self.ReleaseHook)
	BaseClass.Initialize(self)
end

function SWEP:PlaySwing(...) -- slowdown
	local owner = self:GetOwner()

	if not owner.RustSlowDown2 and not owner.RustSlowDown then
		owner.RustSlowDown2 = true
		owner.RustWalkSpeed = owner:GetWalkSpeed()
		owner.RustRunSpeed = owner:GetRunSpeed()
		owner:SetWalkSpeed(owner.RustWalkSpeed*0.5)
		owner:SetRunSpeed(owner.RustWalkSpeed*0.5)
	end

	timer.Simple(0.7, function()
		if IsValid(owner) and owner.RustSlowDown2 then
			owner:SetWalkSpeed(owner.RustWalkSpeed)
			owner:SetRunSpeed(owner.RustRunSpeed)
			owner.RustSlowDown2 = nil
		end
	end)


	BaseClass.PlaySwing(self, ...)
end

function SWEP:SetupDataTables(...)
	BaseClass.SetupDataTables(self, ...)

	self:NetworkVarTFA("Bool", "Pull")
	self:NetworkVarTFA("Float", "PullTime")
end

function SWEP.ReleaseHook(ent, ply, key)
	if not ent:IsValid() then return end

	if ent:GetOwner() == ply and key == IN_ATTACK2 then
		ent:ResetPull()
		ent.Keydown = false
	end
end

function SWEP:ResetPull()
	if not IsFirstTimePredicted() then return end

	self.PullStarted = false
	if PullIdleSnd then self:StopSound(PullIdleSnd) end

	if self:GetPull() then
		self:SetPull(false)
		self:SendViewModelSeq(self.IronAnimation["out"].value)
		self:SetHoldType(self.HoldType)

		self:SetNextPrimaryFire(CurTime() + 0.5)
	end

	self:SetIronSightsRaw(false)
	self:SetLastIronSightsPressed(CurTime())
end

function SWEP:Think()
	if not self.Keydown and self:GetPull() or self:GetSprintProgress() > 0.1 then
		self:ResetPull()
	end

	BaseClass.Think(self)
end

function SWEP:PrimaryAttack()
	if self:GetPull() then
		self:Throw()
		self:SetNextPrimaryFire(CurTime() + self.IronAnimation["shoot"].delay_after_shoot)
	else
		if not self.Keydown then
			BaseClass.PrimaryAttack(self)

			if self:GetOwner():IsPlayer() then
				self:GetOwner():DoAnimationEvent(self.ThrowGesture)
			end
		end
	end
end

function SWEP:SecondaryAttack()
	self.Keydown = true
	local owner = self:GetOwner()
	local CT = CurTime()
	if not TFA.Enum.ReadyStatus[self:GetStatus()] then return end
	if self:GetNextPrimaryFire() > CT then return end
	if self:GetSprintProgress() > 0.1 then return end
	if self.Primary.Ammo != "none" and not (owner:GetAmmoCount(self.Primary.Ammo) + self:Clip1() > 0) then return end
	if self:GetPull() then return end

	self.PullStarted = true
	self:SetIronSightsRaw(true)
	self:SetLastIronSightsPressed(CT)

	self:SetHoldType(self.IronSightHoldTypeOverride)
	self:SendViewModelSeq(self.IronAnimation["in"].value, nil, nil, -CT)

	timer.Simple(self.IronAnimation["in"].delay_to_shoot, function()
		if not self:IsValid() then return end
		if not self.PullStarted then return end

		CT = CurTime()

		if self.IronAnimation["reset"] then
			self:SendViewModelSeq(self.IronAnimation["reset"].value, nil, nil, -CT)

			timer.Simple(self.IronAnimation["in"].idle_in, function()
				if not self:IsValid() then return end
				if not self.PullStarted then return end
				self:EmitSound(PullIdleSnd)
			end)
		end

		self:SetPullTime(CT)
		self:SetPull(true)

		if self:Clip1() == 0 then
			owner:RemoveAmmo(1, self.Primary.Ammo)
			self:SetClip1(1)
		end
	end)

	self:SetNextPrimaryFire(CurTime() + self.IronAnimation["in"].delay_to_shoot+0.2)
end

function SWEP:Throw()
	if not IsFirstTimePredicted() then return end
	self:SendViewModelSeq(self.IronAnimation["shoot"].value, nil, nil, -CurTime())
	self:SetPull(false)
	self.PullStarted = false

	if PullIdleSnd then self:StopSound(PullIdleSnd) end

	self:SetStatus(TFA.Enum.STATUS_SHOOTING)
	self:SetStatusEnd(CurTime() + self.IronAnimation["shoot"].delay_to_shoot)
	if self.Primary.Sound then self:EmitSound(self.Primary.Sound) end

	if self:GetOwner():IsPlayer() then
		self:GetOwner():DoAnimationEvent(self.ThrowGesture)
	end

	if SERVER then
		timer.Simple(self.IronAnimation["shoot"].delay_to_shoot, function()
			if not self:IsValid() then return end


			local ent = ents.Create(self:GetStat("Primary.Projectile"))
			local ang = self:GetOwner():EyeAngles()

			-- ang:RotateAroundAxis(ang:Right(), math.Rand(0, 0.5) - 0.25)
			-- ang:RotateAroundAxis(ang:Up(), math.Rand(0, 0.5) - 0.25)

			local dir = ang:Forward()

			if ent:IsValid() then
				ent:SetPos(self:GetOwner():GetShootPos())
				ent:SetAngles(self:GetOwner():EyeAngles()+Angle(self:GetStat("Primary.ProjectileStartAng"),0,0))
				ent:SetModel(self:GetStat("Primary.ProjectileModel"))
				ent:SetPhysicsAttacker(self:GetOwner())
				ent:SetOwner(self:GetOwner())
				ent.damage = 500 * self.DMGMultiplier
				ent.spinny = self:GetStat("Primary.ProjectileSpin")
				ent.ProjMass = self.ProjectileMass
				ent.GravityMultiplier = self.ProjectileGravityMultiplier
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				local vel = self:GetStat("Primary.ProjectileVelocity") * self.DMGMultiplier

				if IsValid(phys) then
					phys:SetVelocity(dir * vel)
				end

				self:GetOwner():SetAnimation(PLAYER_ATTACK1)
				ent:SetLocalAngularVelocity(Angle(100, 200, 50))
				self:TakePrimaryAmmo(1)

				if self.Primary.Ammo == "none" then
					self:GetOwner():StripWeapon(self:GetClass())
					ent:SetNW2String("ClassName", self:GetClass())
				else
					ent:SetNW2String("ClassName", self:GetPrimaryAmmoType())
					if self.Primary.Ammo == "XBowBolt" and self.Attachments[1].sel == 1 then
						ParticleEffectAttach("rust_fire", PATTACH_POINT_FOLLOW, ent, 1)
					end
				end

				if vel >= 2000 then
					ent.trail = util.SpriteTrail(ent, 0, Color(255, 255, 255), false, 12, 0, 0.15, 1/12 * 0.5, "trails/laser")
				else
					self:EmitSound("darky_rust.throw-item-small")
				end
			end
		end)
	end
end

function SWEP:ToggleInspect()
	if not self.Keydown then
		BaseClass.ToggleInspect(self)
	end
end

function SWEP:ProcessHoldType(...)
	if not self.Keydown then
		return BaseClass.ProcessHoldType(self, ...)
	end
end

