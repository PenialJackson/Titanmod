-- allows the player to test the look and feel of their customized kill/death/level up UI's
function HUDTestKill(ply, cmd, args)
	net.Start("NotifyKill")
		net.WriteEntity(ply)
		net.WriteString("KRISS Vector")
		net.WriteFloat(math.random(20, 60))
		net.WriteInt(math.random(1, 2), 5)
		net.WriteInt(math.random(1, 10), 10)
	net.Send(ply)
end
concommand.Add("tm_hud_testkill", HUDTestKill)

function HUDTestDeath(ply, cmd, args)
	net.Start("NotifyDeath")
		net.WriteEntity(ply)
		net.WriteString("KRISS Vector")
		net.WriteFloat(math.random(20, 60))
		net.WriteInt(math.random(1, 2), 5)
	net.Send(ply)
end
concommand.Add("tm_hud_testdeath", HUDTestDeath)

function HUDTestLevelUp(ply, cmd, args)
	net.Start("SendNotification")
		net.WriteString("You are now level " .. math.random(1, 60) .. "!")
		net.WriteString("level")
	net.Send(ply)
end
concommand.Add("tm_hud_testlevelup", HUDTestLevelUp)

-- allows the player to wipe their account and start fresh
function PlayerAccountWipe(ply, cmd, args)
	if ply:GetNWBool("mainmenu") == false then return end

	ply:SetNWInt("playerKills", 0)
	ply:SetNWInt("playerDeaths", 0)
	ply:SetNWInt("playerScore", 0)
	ply:SetNWInt("matchesPlayed", 0)
	ply:SetNWInt("matchesWon", 0)
	ply:SetNWInt("highestKillStreak", 0)
	ply:SetNWInt("highestKillGame", 0)
	ply:SetNWInt("farthestKill", 0)
	ply:SetNWInt("playerLevel", 1)
	ply:SetNWInt("playerPrestige", 0)
	ply:SetNWInt("playerXP", 0)
	ply:SetNWInt("playerXPToNextLevel", 750)
	ply:SetNWString("chosenPlayermodel", "models/player/Group03/male_02.mdl")
	ply:SetNWString("chosenPlayercard", "cards/default/construct.png")
	ply:SetNWString("chosenPlayercard", "chosenMelee")
	ply:SetNWInt("playerAccoladeHeadshot", 0)
	ply:SetNWInt("playerAccoladeSmackdown", 0)
	ply:SetNWInt("playerAccoladeLongshot", 0)
	ply:SetNWInt("playerAccoladePointblank", 0)
	ply:SetNWInt("playerAccoladeOnStreak", 0)
	ply:SetNWInt("playerAccoladeBuzzkill", 0)
	ply:SetNWInt("playerAccoladeClutch", 0)

	for i = 1, #WEAPONS do
		ply:SetNWInt("killsWith_" .. WEAPONS[i][1], 0)
	end
end
concommand.Add("tm_wipeplayeraccount_cannotbeundone", PlayerAccountWipe)

function ImportHUDCode(ply, cmd, args)
	local code = args[1]
	local var = {}

	if code == nil then return end

	for s in string.gmatch(code, "[^-]+") do
		table.insert(var, s)
	end

	if table.Count(var) != 57 then
		net.Start("SendNotification")
			net.WriteString("Failed HUD import (" .. table.Count(var) .. " vars), code may be from older TM version.")
			net.WriteString("warning")
		net.Send(ply)

		return
	end

	net.Start("SendNotification")
		net.WriteString("Successfully imported HUD!")
		net.WriteString("success")
	net.Send(ply)
end
concommand.Add("tm_importhudcode_cannotbeundone", ImportHUDCode)
