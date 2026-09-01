include("shared.lua")

TM.CLIENT = TM.CLIENT or {}

include("config.lua")
include("enums.lua")
include("util.lua")

local ogLocalPlayer = LocalPlayer
local lcply = ogLocalPlayer()

function LocalPlayer()
	return lcply or NULL
end

hook.Add("InitPostEntity", "LPCache", function()
	lcply = ogLocalPlayer()
end)

local cScrW = ScrW()
local cScrH = ScrH()

function ScrW()
	return cScrW
end

function ScrH()
	return cScrH
end

local math = math
local scale = GetConVar("tm_hud_scale")

TM.ScreenScale = function(size)
	local ratio = (ScrW() / ScrH() <= 1.8) and (ScrW() / 1920.0) or (ScrH() / 1080.0)
	local scaled = size * ratio * scale:GetFloat()
	return size > 0 and math.max(1, scaled) or math.min(-1, scaled)
end

TM.ScreenScaleRounded = function(size)
	local ratio = (ScrW() / ScrH() <= 1.8) and (ScrW() / 1920.0) or (ScrH() / 1080.0)
	local scaled = size * ratio * scale:GetFloat()
	return size > 0 and math.max(1, math.floor(scaled)) or math.min(-1, math.floor(scaled))
end

TM.MenuScale = function(size)
	local ratio = (ScrW() / ScrH() <= 1.8) and (ScrW() / 1920.0) or (ScrH() / 1080.0)
	local scaled = size * ratio
	return size > 0 and math.max(1, scaled) or math.min(-1, scaled)
end

TM.MenuScaleRounded = function(size)
	local ratio = (ScrW() / ScrH() <= 1.8) and (ScrW() / 1920.0) or (ScrH() / 1080.0)
	local scaled = size * ratio
	return size > 0 and math.max(1, math.floor(scaled)) or math.min(-1, math.floor(scaled))
end

hook.Add("OnScreenSizeChanged", "ClearScalingCache", function(_, _, newW, newH)
	cScrW = newW
	cScrH = newH
end)

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/shared/*.lua", "GAME", "nameasc")) do
	include("shared/" .. f)
end

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/client/*.lua", "GAME", "nameasc")) do
	include("client/" .. f)
end

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/vgui/*.lua", "GAME", "nameasc")) do
	include("vgui/" .. f)
end

function GM:InitPostEntity()
	net.Start("PlayerInitialSpawn")
	net.SendToServer()
end

if GetConVar("tm_render_hands"):GetInt() == 0 then
	hook.Add("PreDrawPlayerHands", "DisableHandRendering", function()
		return true
	end)
end

cvars.AddChangeCallback("tm_render_hands", function(_, _, new)
	if new == "1" then
		hook.Remove("PreDrawPlayerHands", "DisableHandRendering")
	else
		hook.Add("PreDrawPlayerHands", "DisableHandRendering", function() return true end)
	end
end)

function UpdatePopOutPos(panel, sideH, sideV, x, y)
	if sideH == true then
		panel:SetX(math.Clamp(x + 15, 10, ScrW() - panel:GetWide() - 10))
	else
		panel:SetX(math.Clamp(x - panel:GetWide() - 15, 10, ScrW() - panel:GetWide() - 10))
	end

	if sideV == true then
		panel:SetY(math.Clamp(y + 15, 60, ScrH() - panel:GetTall() - 20))
	else
		panel:SetY(math.Clamp(y - panel:GetTall() + 15, 60, ScrH() - panel:GetTall() - 20))
	end
end

-- override ear animation
function GM:GrabEarAnimation()
end

-- smooth derma scrolling
local length = 0.4
local ease = 0.25
local amount = 60

hook.Add("PreGamemodeLoaded", "SmoothScrolling", function()
	local function sign(num) return num > 0 end

	local function getBiggerPos(signOld, signNew, old, new)
		if signOld != signNew then return new end
		if signNew then return math.max(old, new) else return math.min(old, new) end
	end

	local dermaCtrs = vgui.GetControlTable("DVScrollBar")
	local tScroll = 0
	local newerT = 0

	function dermaCtrs:AddScroll(dlta)
		self.Old_Pos = nil
		self.Old_Sign = nil

		local OldScroll = self:GetScroll()
		dlta = dlta * amount

		local anim = self:NewAnimation(length, 0, ease)
		anim.StartPos = OldScroll
		anim.TargetPos = OldScroll + dlta + tScroll
		tScroll = tScroll + dlta

		local ctime = RealTime()
		local doing_scroll = true
		newerT = ctime

		anim.Think = function(a, pnl, fraction)
			local nowpos = Lerp(fraction, a.StartPos, a.TargetPos)
			if ctime == newerT then
				self:SetScroll(getBiggerPos(self.Old_Sign, sign(dlta), self.Old_Pos, nowpos))
				tScroll = tScroll - (tScroll * fraction)
			end

			if doing_scroll then
				self.Old_Sign = sign(dlta)
				self.Old_Pos = nowpos
			end

			if ctime != newerT then doing_scroll = false end
		end

		return math.Clamp(self:GetScroll() + tScroll, 0, self.CanvasSize) != self:GetScroll()
	end

	derma.DefineControl("DVScrollBar", "Smooth Scrollbar", dermaCtrs, "Panel")
end)

-- custom viewmodel inertia
local lastEyeAng = Angle(0, 0, 0)
local lastAngDiff = Angle(0, 0, 0)
local currentOffset = Angle(0, 0, 0)
local moveOffset = Angle(0, 0, 0)
local overshootDecay = 0

	local function ApplyAllOffsets(ply, pos, ang)
		local isAiming = (IsValid(weapon) and (type(weapon.GetIronSights) == "function" and weapon:GetIronSights())) or ply:KeyDown(IN_ATTACK2)

		if not IsValid(ply) or not ply:Alive() or isAiming then return pos, ang end

		local ft = FrameTime()

		local inertiaSpeed = 6
		local baseTilt     = 2.5
		local strafeTilt   = 3
		local overshootStr = 1.2

		local curEye = ply:EyeAngles()
		if lastEyeAng.p == 0 and lastEyeAng.y == 0 and lastEyeAng.r == 0 then
			lastEyeAng = curEye
			lastAngDiff = Angle(0, 0, 0)
		end

		local angDiff = curEye - lastEyeAng
		angDiff:Normalize()

		local targetCamOffset = Angle(-angDiff.p * baseTilt, 0, angDiff.y * baseTilt)

		local lastSpeed = math.max(math.abs(lastAngDiff.p), math.abs(lastAngDiff.y))
		local curSpeed  = math.max(math.abs(angDiff.p), math.abs(angDiff.y))
		local decel = lastSpeed - curSpeed

		if decel > 0.08 then
			local overshootP = -lastAngDiff.p * (overshootStr * 0.12)
			local overshootR =  lastAngDiff.y * (overshootStr * 0.12)
			overshootDecay = math.min(1, overshootDecay + decel * 4)
			targetCamOffset = targetCamOffset + Angle(overshootP * overshootDecay, 0, overshootR * overshootDecay)
		end

		if overshootDecay > 0 then
			overshootDecay = Lerp(ft * 4, overshootDecay, 0)
		end

		local safeSpeed = math.Clamp(ft * inertiaSpeed, 0, 100)
		currentOffset = LerpAngle(safeSpeed, currentOffset, targetCamOffset)

		lastEyeAng = curEye
		lastAngDiff = angDiff

		local mvRight = ply:KeyDown(IN_MOVERIGHT)
		local mvLeft  = ply:KeyDown(IN_MOVELEFT)

		local targetMoveRoll = 0

		if mvRight then
			targetMoveRoll = strafeTilt
		elseif mvLeft then
			targetMoveRoll = -strafeTilt
		else
			targetMoveRoll = 0
		end

		local vel = ply:GetVelocity()
		local speed2d = vel:Length2D()
		if speed2d > 5 and (mvRight or mvLeft) then
			local rightDir = ply:EyeAngles():Right()
			local rightDot = vel:Dot(rightDir) / speed2d
			targetMoveRoll = Lerp(0.5, targetMoveRoll, rightDot * strafeTilt)
		end

		moveOffset.r = Lerp(ft * 4, moveOffset.r, targetMoveRoll)

		ang:RotateAroundAxis(ang:Right(), currentOffset.p)
		local wep = ply:GetActiveWeapon()
		local rollOffset = currentOffset.r + moveOffset.r
		if IsValid(wep) and wep.ViewModelFlip then
			rollOffset = -rollOffset
		end
		ang:RotateAroundAxis(ang:Forward(), rollOffset)

		return pos, ang
	end

hook.Add("CalcViewModelView", "ViewmodelInertia", function(weapon, vm, oldPos, oldAng, pos, ang)
	local ply = LocalPlayer()

	if not IsValid(ply) or not ply:Alive() then return end

	ApplyAllOffsets(ply, pos, ang)
end)

-- custom screen shake
local lastExtraRecoilTime = 0
local shakeMult = 0.33
local shakeSpeed = 0.67

local lastMagCapacity = 0
local lastWeapon = nil

local ExtraScreenShakeTime = 0
local ExtraScreenShakeDuration = 0
local ExtraScreenShakeStrength = 0
local ExtraScreenShakeViewOffset = Angle(0, 0, 0)

local function ApplyExtraRecoil(weapon)
	if not IsValid(weapon) or not weapon.IsTFAWeapon then return end

	local currentTime = CurTime()
	if currentTime - lastExtraRecoilTime < 0.05 then return end

	lastExtraRecoilTime = currentTime

	local kickUp = weapon.Primary.KickUp or 0
	local kickDown = weapon.Primary.KickDown or 0
	local kickHorizontal = weapon.Primary.KickHorizontal or 0
	local staticRecoilFactor = weapon.Primary.StaticRecoilFactor or 0
	local extraRecoilAmount = (kickUp + kickDown + kickHorizontal + staticRecoilFactor) * 2

	local rpm = weapon.Primary.RPM or 600
	local RPMDuration = math.min((60 / rpm) + 0.1, 0.2)

	ExtraScreenShakeDuration = RPMDuration * shakeSpeed
	ExtraScreenShakeStrength = (extraRecoilAmount / 2) * shakeMult

	ExtraScreenShakeTime = ExtraScreenShakeDuration
	ExtraScreenShakeViewOffset = Angle(0, 0, 0)
end

local function DetectExtraRecoilFiring()
	local ply = LocalPlayer()
	if not IsValid(ply) then return end

	local weapon = ply:GetActiveWeapon()

	if not IsValid(weapon) or not weapon.IsTFAWeapon then
		lastMagCapacity = 0
		lastWeapon = nil
		return
	end

	local currentMagCapacity = weapon:Clip1() or 0

	if weapon != lastWeapon then
		lastMagCapacity = currentMagCapacity
		lastWeapon = weapon
		return
	end

	if currentMagCapacity < lastMagCapacity then
		ApplyExtraRecoil(weapon)
		lastMagCapacity = currentMagCapacity
	else
		lastMagCapacity = currentMagCapacity
	end

	if ExtraScreenShakeTime > 0 then
		ExtraScreenShakeTime = math.max(0, ExtraScreenShakeTime - FrameTime())

		local timeProgress = ExtraScreenShakeTime / ExtraScreenShakeDuration
		local rollAngle = math.sin(timeProgress * math.pi * 4) * ExtraScreenShakeStrength * timeProgress

		ExtraScreenShakeViewOffset = Angle(0, 0, rollAngle)
	else
		ExtraScreenShakeViewOffset = Angle(0, 0, 0)
	end
end

hook.Add("CalcView", "TFA_ExtraScreenShake_View", function(ply, origin, angles, fov, znear, zfar)
	if ExtraScreenShakeViewOffset.roll ~= 0 then
		angles:Add(ExtraScreenShakeViewOffset)
	end
end)

timer.Create("ExtraRecoilFireDetectionLoop", 0.001, 0, DetectExtraRecoilFiring)
