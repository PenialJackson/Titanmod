local activeGamemode = GetGlobal2String("ActiveGamemode", "FFA")

local randPrimary = {}
local randSecondary = {}
local randMelee = {}

ggLadder = {}
local ggRandMelee = {}

local fiestaPrimary
local fiestaSecondary
local fiestaMelee

local randOverkill = {}

local intermissionLength = GetConVar("sv_tm_intermission_length")

util.AddNetworkString("NotifyCranked")

if activeGamemode == "FFA" then
	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end
end

if activeGamemode == "Fiesta" then
	local fiestaTime = GetConVar("sv_tm_mode_fiesta_shuffle_length")

	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end

	fiestaPrimary = randPrimary[math.random(#randPrimary)]
	fiestaSecondary = randSecondary[math.random(#randSecondary)]
	fiestaMelee = randMelee[math.random(#randMelee)]

	SetGlobal2Int("FiestaTime", fiestaTime:GetInt() + intermissionLength:GetInt())

	function ShuffleFiestaLoadout()
		SetGlobal2Int("FiestaTime", fiestaTime:GetInt() + GetGlobal2Int("FiestaTime"))
		fiestaPrimary = randPrimary[math.random(#randPrimary)]
		fiestaSecondary = randSecondary[math.random(#randSecondary)]
		fiestaMelee = randMelee[math.random(#randMelee)]

		for k, v in ipairs(player.GetHumans()) do
			v:SetNWString("loadoutPrimary", fiestaPrimary)
			v:SetNWString("loadoutSecondary", fiestaSecondary)
			v:SetNWString("loadoutMelee", fiestaMelee)

			if v:Alive() then
				v:StripWeapons()
				v:Give(v:GetNWString("loadoutPrimary"))
				v:Give(v:GetNWString("loadoutSecondary"))
				v:Give(v:GetNWString("loadoutMelee"))
			end
		end
	end

	function CreateFiestaTimer()
		timer.Create("FiestaShuffle", fiestaTime:GetInt(), 0, ShuffleFiestaLoadout)
	end
end

if activeGamemode == "Gun Game" then
	local gunGameSize = GetConVar("sv_tm_mode_gungame_ladder_size")

	for _, v in ipairs(WEAPONS) do
		if v[3] == "melee" then
			table.insert(ggRandMelee, v[1])
		end
	end

	local ggWeaponArray = WEAPONS
	local itemsAdded = 0
	table.Shuffle(ggWeaponArray)

	for _, v in ipairs(ggWeaponArray) do
		if (v[3] == "primary" or v[3] == "secondary") and v[1] != "st_stim_pistol" and v[1] != "swat_shield" and v[1] != "tfa_ins2_ak400" and v[1] != "tfa_ins2_cq300" and v[1] != "tfa_ins2_ump45" and v[1] != "tfa_ins2_eftm4a1" and v[1] != "tfa_howa_type_64" and v[1] != "rust_bow" and v[1] != "rust_crossbow" and itemsAdded < (gunGameSize:GetInt() - 1) then
			table.insert(ggLadder, {v[1], ggRandMelee[math.random(#ggRandMelee)]})
			itemsAdded = itemsAdded + 1
		end
	end
	table.insert(ggLadder, {ggRandMelee[math.random(#ggRandMelee)]})
end

if activeGamemode == "Shotty Snipers" then
	for _, v in ipairs(WEAPONS) do
		if v[4] == "sniper" and v[1] != "rust_bow" and v[1] != "rust_crossbow" and v[1] != "tfa_ins2_saiga_spike" then
			table.insert(randPrimary, v[1])
		elseif v[4] == "shotgun" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end
end

if activeGamemode == "Cranked" then
	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end
end

if activeGamemode == "KOTH" then
	local kothScore = GetConVar("sv_tm_mode_koth_score")
	local kothInterval = GetConVar("sv_tm_mode_koth_score_interval")

	hook.Add("InitPostEntity", "KOTHSpawn", function()
		local kothOBJ = ents.Create("tm_koth_obj")
		kothOBJ:Spawn()
	end )

	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end

	SetGlobal2Bool("tm_hillstatus", "Empty")
	hillOccupants = {}

	timer.Create("HillScoring", kothInterval:GetFloat(), 0, function()
		if table.IsEmpty(hillOccupants) or table.Count(hillOccupants) > 1 or GetGlobal2Bool("tm_matchended") or GetGlobal2Bool("tm_intermission") then return end

		hillOccupants[1]:SetNWInt("playerScore", hillOccupants[1]:GetNWInt("playerScore") + kothScore:GetInt())
		hillOccupants[1]:SetNWInt("playerScoreMatch", hillOccupants[1]:GetNWInt("playerScoreMatch") + kothScore:GetInt())
	end)

	function HillStatusCheck()
		if table.Count(hillOccupants) == 1 then
			SetGlobal2String("tm_hillstatus", "Occupied")
			SetGlobal2Entity("tm_entonhill", hillOccupants[1])
		elseif table.Count(hillOccupants) > 1 then
			SetGlobal2String("tm_hillstatus", "Contested")
		else
			SetGlobal2String("tm_hillstatus", "Empty")
		end
	end
end

if activeGamemode == "Quickdraw" then
	for _, v in ipairs(WEAPONS) do
		if v[3] == "secondary" and v[1] != "rust_bow" and v[1] != "swat_shield" and v[1] != "st_stim_pistol" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end
end

if activeGamemode == "VIP" then
	local vipScore = GetConVar("sv_tm_mode_koth_score")
	local vipInterval = GetConVar("sv_tm_mode_koth_score_interval")

	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end

	local vip
	timer.Create("VIPScoring", vipInterval:GetFloat(), 0, function()
		vip = GetGlobal2Entity("tm_vip", NULL)
		if vip == NULL then
			if GetGlobal2Bool("tm_intermission") then return end

			local connectedPlayers = {}
			for k, v in RandomPairs(player.GetAll()) do
				if v:Alive() then
					table.insert(connectedPlayers, v)
				end
			end

			SetGlobal2Entity("tm_vip", connectedPlayers[1])

			return
		end

		vip:SetNWInt("playerScore", vip:GetNWInt("playerScore") + vipScore:GetInt())
		vip:SetNWInt("playerScoreMatch", vip:GetNWInt("playerScoreMatch") + vipScore:GetInt())
	end)
end

if activeGamemode == "Overkill" then
	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randOverkill, v[1])
		elseif v[3] == "secondary" then
			table.insert(randOverkill, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end

	table.Shuffle(randOverkill)
end

if activeGamemode == "Fisticuffs" then
	for _, v in ipairs(WEAPONS) do
		if v[3] == "primary" then
			table.insert(randPrimary, v[1])
		elseif v[3] == "secondary" then
			table.insert(randSecondary, v[1])
		elseif v[3] == "melee" then
			table.insert(randMelee, v[1])
		end
	end
end

-- setting up functions depeneding on the gamemode being played, this does not look pretty, but it will stop us from running a shit ton of if statements to check which gamemode is being played
-- FFA, Shotty Snipers & KOTH
if activeGamemode == "FFA" or activeGamemode == "Shotty Snipers" or activeGamemode == "KOTH" then
	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutPrimary"))
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))

		ply:SetAmmo(1, "Grenade")
	end

	function HandlePlayerKill(ply, victim)
		return
	end

	function HandlePlayerDeath(ply, weaponName)
		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end
end

-- Fiesta
if activeGamemode == "Fiesta" then
	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutPrimary", fiestaPrimary)
		ply:SetNWString("loadoutSecondary", fiestaSecondary)
		ply:SetNWString("loadoutMelee", fiestaMelee)
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutPrimary"))
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))
		ply:SetAmmo(1, "Grenade")
	end

	function HandlePlayerKill(ply, victim)
	end

	function HandlePlayerDeath(ply, weaponName)
	end
end

-- Gun Game
if activeGamemode == "Gun Game" then
	local gunGameSize = GetConVar("sv_tm_mode_gungame_ladder_size")

	function HandlePlayerInitialSpawn(ply)
		ply:SetNWInt("ladderPosition", 0)
	end

	function HandlePlayerSpawn(ply)
		local wepToGive = ggLadder[ply:GetNWInt("ladderPosition") + 1]
		ply:Give(wepToGive[1])

		if (ply:GetNWInt("ladderPosition") == (gunGameSize:GetInt() - 1)) == false then
			ply:Give(wepToGive[2])
		end
	end

	function HandlePlayerKill(ply, victim, weaponName)
		if not ply:IsPlayer() or (ply == victim) then return end

		if (ply:GetNWInt("ladderPosition") == (gunGameSize:GetInt() - 1)) == false then
			if weaponName == "Tanto" or weaponName == "Mace" or weaponName == "KM-2000" or weaponName == "Bowie Knife" or weaponName == "Butterfly Knife" or weaponName == "Carver" or weaponName == "Dagger" or weaponName == "Fire Axe" or weaponName == "Fists" or weaponName == "Karambit" or weaponName == "Kukri" or weaponName == "M9 Bayonet" or weaponName == "Nunchucks" or weaponName == "Red Rebel" or weaponName == "Tri-Dagger" then return end
		end

		ply:SetNWInt("ladderPosition", ply:GetNWInt("ladderPosition") + 1)
		ply:StripWeapons()

		if ply:GetNWInt("ladderPosition") >= gunGameSize:GetInt() then
			EndMatch()

			return
		end

		local wepToGive = ggLadder[ply:GetNWInt("ladderPosition") + 1]
		ply:Give(wepToGive[1])

		if (ply:GetNWInt("ladderPosition") == (gunGameSize:GetInt() - 1)) == true then
			net.Start("SendNotification")
				net.WriteString(ply:Nick() .. " has reached the knife!")
				net.WriteString("gungame")
			net.Broadcast()

			return
		end

		ply:Give(wepToGive[2])
	end

	function HandlePlayerDeath(ply, weaponName)
		if (weaponName == "Tanto" or weaponName == "Mace" or weaponName == "KM-2000" or weaponName == "Bowie Knife" or weaponName == "Butterfly Knife" or weaponName == "Carver" or weaponName == "Dagger" or weaponName == "Fire Axe" or weaponName == "Fists" or weaponName == "Karambit" or weaponName == "Kukri" or weaponName == "M9 Bayonet" or weaponName == "Nunchucks" or weaponName == "Red Rebel" or weaponName == "Tri-Dagger" or weaponName == "Suicide") and ply:GetNWInt("ladderPosition") != 0 then
			ply:SetNWInt("ladderPosition", ply:GetNWInt("ladderPosition") - 1)
		end
	end
end

-- Cranked
if activeGamemode == "Cranked" then
	local runSpeedCVar = GetConVar("sv_tm_player_speed_run")
	local crankedTime = GetConVar("sv_tm_mode_cranked_state_length")
	local crankedMult = GetConVar("sv_tm_mode_cranked_state_buff_mult")

	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutPrimary"))
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))

		ply:SetAmmo(1, "Grenade")

		if timer.Exists(ply:SteamID() .. "CrankedTimer") then
			timer.Remove(ply:SteamID() .. "CrankedTimer")
		end
	end

	function HandlePlayerKill(ply, victim)
		-- player buffs once they become "cranked"
		if ply:GetRunSpeed() <= runSpeedCVar:GetInt() then
			ply:SetRunSpeed(ply:GetRunSpeed() * crankedMult:GetFloat())
			ply:SetWalkSpeed(ply:GetWalkSpeed() * crankedMult:GetFloat())
			ply:SetLadderClimbSpeed(ply:GetLadderClimbSpeed() * crankedMult:GetFloat())
			ply:SetCrouchedWalkSpeed(ply:GetCrouchedWalkSpeed() * crankedMult:GetFloat())
		end

		net.Start("NotifyCranked")
		net.Send(ply)

		timer.Create(ply:SteamID() .. "CrankedTimer", crankedTime:GetInt(), 1, function()
			if GetGlobal2Bool("tm_matchended") == true then return end

			local crankedExplosion = ents.Create("env_explosion")
			crankedExplosion:SetPos(ply:GetPos())
			crankedExplosion:Spawn()
			crankedExplosion:Fire("Explode")
			crankedExplosion:SetKeyValue("IMagnitude", 150)

			net.Start("SendNotification")
				net.WriteString("You ran out of Cranked time and blew up, kill others to prevent this!")
				net.WriteString("time")
			net.Send(ply)
		end)
	end

	function HandlePlayerDeath(ply, weaponName)
		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))

		if timer.Exists(ply:SteamID() .. "CrankedTimer") then
			timer.Remove(ply:SteamID() .. "CrankedTimer")
		end
	end
end

-- Quickdraw
if activeGamemode == "Quickdraw" then
	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))

		ply:SetAmmo(1, "Grenade")
	end

	function HandlePlayerKill(ply, victim)
		return
	end

	function HandlePlayerDeath(ply, weaponName)
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end
end

-- VIP
if activeGamemode == "VIP" then
	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutPrimary"))
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))

		ply:SetAmmo(1, "Grenade")
	end

	function HandlePlayerKill(ply, victim)
		if victim == GetGlobal2Entity("tm_vip", NULL) then
			SetGlobal2Entity("tm_vip", ply)
		end
	end

	function HandlePlayerDeath(ply, weaponName)
		if weaponName == "Suicide" then
			local connectedPlayers = {}

			for _, v in RandomPairs(player.GetAll()) do
				if v:Alive() then
					table.insert(connectedPlayers, v)
				end
			end

			SetGlobal2Entity("tm_vip", connectedPlayers[1])
		end

		ply:SetNWString("loadoutPrimary", randPrimary[math.random(#randPrimary)])
		ply:SetNWString("loadoutSecondary", randSecondary[math.random(#randSecondary)])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end
end

-- Overkill
if activeGamemode == "Overkill" then
	function HandlePlayerInitialSpawn(ply)
		table.Shuffle(randOverkill)

		ply:SetNWString("loadoutPrimary", randOverkill[1])
		ply:SetNWString("loadoutSecondary", randOverkill[2])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutPrimary"))
		ply:Give(ply:GetNWString("loadoutSecondary"))
		ply:Give(ply:GetNWString("loadoutMelee"))

		ply:SetAmmo(1, "Grenade")
	end

	function HandlePlayerKill(ply, victim)
		return
	end

	function HandlePlayerDeath(ply, weaponName)
		table.Shuffle(randOverkill)

		ply:SetNWString("loadoutPrimary", randOverkill[1])
		ply:SetNWString("loadoutSecondary", randOverkill[2])
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end
end

if activeGamemode == "Fisticuffs" then
	function HandlePlayerInitialSpawn(ply)
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end

	function HandlePlayerSpawn(ply)
		ply:Give(ply:GetNWString("loadoutMelee"))
	end

	function HandlePlayerKill(ply, victim)
		return
	end

	function HandlePlayerDeath(ply, weaponName)
		ply:SetNWString("loadoutMelee", ply:GetNWString("chosenMelee"))
	end
end
