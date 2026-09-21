TM.STATS = TM.STATS or {}

local plyMeta = FindMetaTable("Player")

EFGM.STATS["Level"] = {
	["name"] = "Level",
	["type"] = "integer",
	["default"] = 1,

	["showProfile"] = true,
	["showLeaderboard"] = true
}

if CLIENT then return end

local expCurveBase = 750

function ExpForLevel(lvl)
	local exp = expCurveBase

	if lvl < 1 then return exp end

	for currentLvl = 2, lvl do
		local increment = currentLvl <= 60 and 75 + 25 * math.min(math.floor(currentLvl / 10), 5) or 25

		exp = exp + increment
	end

	return exp
end

function LevelFromExp(exp)
	local lvl = 1
	local expNeeded = expCurveBase

	while exp >= expNeeded do
		exp = exp - expNeeded
		lvl = lvl + 1
		expNeeded = ExpForLevel(lvl)
	end

	return lvl, exp
end

function CheckForPlayerLevel(ply)
	if ply:GetNWInt("playerLevel") == 60 then return end
	local curExp = ply:GetNWInt("playerXP")
	local curLvl = ply:GetNWInt("playerLevel")

	if (curExp >= ply:GetNWInt("playerXPToNextLevel")) then
		curExp = curExp - ply:GetNWInt("playerXPToNextLevel")
		ply:SetNWInt("playerLevel", curLvl + 1)
		ply:SetNWInt("playerXP", curExp)

		ply:SetNWInt("playerXPToNextLevel", ExpForLevel(curLvl + 1))

		net.Start("SendNotification")
			net.WriteString("You are now level " .. curLvl + 1 .. "!")
			net.WriteString("level")
		net.Send(ply)
	end
end
