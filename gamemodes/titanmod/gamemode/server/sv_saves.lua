local table = table
local player = player

hook.Add("Initialize", "InitPlayerNetworking", function()
	-- PlayerData64 is a really bad name and I don't want any conflicts to happen
	if sql.TableExists("PlayerData64") then
		if !ColumnExists("PlayerData64", "SteamID") or !ColumnExists("PlayerData64", "Key") or !ColumnExists("PlayerData64", "Value") then return end
		sql.Query("ALTER TABLE PlayerData64 RENAME TO tmplayerdata;")
	end

	sql.Query("CREATE TABLE IF NOT EXISTS tmplayerdata (id INTEGER, key TEXT, value TEXT);")

	-- new patch structure
	if ColumnExists("tmplayerdata", "SteamName") then
		sql.Query("ALTER TABLE tmplayerdata RENAME TO tmplayerdata_OLD;")

		sql.Query("CREATE TABLE IF NOT EXISTS tmplayerdata (id INTEGER, key TEXT, value TEXT);")
		sql.Query([[
			INSERT INTO tmplayerdata (id, key, value)
			SELECT SteamID, Key, Value FROM tmplayerdata_OLD;
		]])

		sql.Query("DROP TABLE tmplayerdata_OLD;")
	end

	-- transfer to new player progression
	local prestigeQuery = sql.Query("SELECT * FROM tmplayerdata WHERE key = playerPrestige;")

	if prestigeQuery then
		local ids = {}
		local xpPerPrestige = ExpForLevel(60)

		for _, column in ipairs(prestigeQuery) do
			local id = tonumber(column.id)
			if ids[id] == true then continue end

			local prestige = column.value
			local level = sql.QueryValue("SELECT value FROM tmplayerdata WHERE id = " .. SQLStr(id) .. " AND key = playerLevel;")
			local score = sql.QueryValue("SELECT value FROM tmplayerdata WHERE id = " .. SQLStr(id) .. " AND key = playerScore;")
			local matchTotal = sql.QueryValue("SELECT value FROM tmplayerdata WHERE id = " .. SQLStr(id) .. " AND key = matchesPlayed;")
			local matchWins = sql.QueryValue("SELECT value FROM tmplayerdata WHERE id = " .. SQLStr(id) .. " AND key = matchesWon;")

			local xp = 0

			if prestige > 0 then
				xp = xp + (xpPerPrestige * prestige)
			end

			if level > 1 then
				xp = xp + ExpForLevel(level)
			end

			if score > 0 then
				xp = xp + score
			end

			if matchTotal > 0 then
				xp = xp + (750 * matchTotal)
			end

			if matchWins > 0 then
				xp = xp + (750 * matchWins)
			end

			local newLevel, newXP = LevelFromExp(xp)

			sql.Query("UPDATE tmplayerdata SET value = " .. SQLStr(newLevel) .. " WHERE id = " .. SQLStr(id) .. " AND key = playerLevel;")
			sql.Query("UPDATE tmplayerdata SET value = " .. SQLStr(newXP) .. " WHERE id = " .. SQLStr(id) .. " AND key = playerXP;")
			sql.Query("DELETE FROM tmplayerdata WHERE id = " .. SQLStr(id) .. " AND key = playerPrestige;")

			ids[id] = true
		end

		ids = {}
	end
end)

local modelFiles = {}
local cardFiles = {}
local meleeFiles = {}

local tempCMD = nil
local tempNewCMD = nil

for i = 1, #MODELS do
	table.insert(modelFiles, MODELS[i][1])
end

for i = 1, #CARDS do
	table.insert(cardFiles, CARDS[i][1])
end

for i = 1, #GEAR do
	table.insert(meleeFiles, GEAR[i][1])
end

local function InitializeNetworkInt(ply, query, key, value)
	if query == "new" then
		ply:SetNWInt(key, tonumber(value))
		return tonumber(value)
	end

	for _, v in ipairs(query) do
		if key == v.key then
			ply:SetNWInt(key, tonumber(v.value))
			return tonumber(v.value)
		end
	end

	ply:SetNWInt(key, tonumber(value))
	return tonumber(value)
end

local function InitializeNetworkString(ply, query, key, value)
	if query == "new" then
		ply:SetNWString(key, tostring(value))
		return tostring(value)
	end

	for _, v in ipairs(query) do
		if key == v.key then
			ply:SetNWString(key, tostring(v.value))
			return tostring(v.value)
		end
	end

	ply:SetNWString(key, tostring(value))
	return tostring(value)
end

local function UninitializeNetworkInt(ply, query, key)
	local id64 = ply:SteamID64()
	local value = tonumber(ply:GetNWInt(key))

	if query == "new" then
		tempNewCMD = tempNewCMD .. "(" .. SQLStr(id64) .. ", " .. SQLStr(key) .. ", " .. SQLStr(value) .. "), "
		return
	end

	for _, v in ipairs(query) do
		if key == v.key then
			tempCMD = tempCMD .. "WHEN " .. SQLStr(key) .. " THEN " .. SQLStr(value) .. " "
			return
		end
	end

	tempNewCMD = tempNewCMD .. "(" .. SQLStr(id64) .. ", " .. SQLStr(key) .. ", " .. SQLStr(value) .. "), "
end

local function UninitializeNetworkString(ply, query, key)
	local id64 = ply:SteamID64()
	local value = tostring(ply:GetNWString(key))

	if query == "new" then
		tempNewCMD = tempNewCMD .. "(" .. SQLStr(id64) .. ", " .. SQLStr(key) .. ", " .. SQLStr(value) .. "), "
		return
	end

	for _, v in ipairs(query) do
		if key == v.key then
			tempCMD = tempCMD .. "WHEN " .. SQLStr(key) .. " THEN " .. SQLStr(value) .. " "
			return
		end
	end

	tempNewCMD = tempNewCMD .. "(" .. SQLStr(id64) .. ", " .. SQLStr(key) .. ", " .. SQLStr(value) .. "), "
end

function SetupPlayerData(ply)
	local id64 = ply:SteamID64()
	local query = sql.Query("SELECT key, value FROM tmplayerdata WHERE id = " .. SQLStr(id64) .. ";")

	if query == nil then
		query = "new"
	end

	InitializeNetworkString(ply, query, "chosenPlayermodel", "models/player/Group03/male_02.mdl")
	InitializeNetworkString(ply, query, "chosenPlayercard", "cards/default/construct.png")
	InitializeNetworkString(ply, query, "chosenMelee", "tfa_km2000_knife")
	InitializeNetworkInt(ply, query, "playerKills", 0)
	InitializeNetworkInt(ply, query, "playerDeaths", 0)
	InitializeNetworkInt(ply, query, "playerScore", 0)
	InitializeNetworkInt(ply, query, "matchesPlayed", 0)
	InitializeNetworkInt(ply, query, "matchesWon", 0)
	InitializeNetworkInt(ply, query, "highestKillStreak", 0)
	InitializeNetworkInt(ply, query, "highestKillGame", 0)
	InitializeNetworkInt(ply, query, "farthestKill", 0)
	InitializeNetworkInt(ply, query, "playerLevel", 1)
	InitializeNetworkInt(ply, query, "playerXP", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeHeadshot", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeSmackdown", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeLongshot", 0)
	InitializeNetworkInt(ply, query, "playerAccoladePointblank", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeOnStreak", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeBuzzkill", 0)
	InitializeNetworkInt(ply, query, "playerAccoladeClutch", 0)
	for id, _ in pairs(WEAPONS) do
		InitializeNetworkInt(ply, query, "killsWith_" .. id, 0)
	end

	local lvl = ply:GetNWInt("playerLevel")
	local expForNextLvl = ExpForLevel(lvl)

	if expForNextLvl then
		ply:SetNWInt("playerXPToNextLevel", expForNextLvl)
	end

	-- checks for potential save file corruption and will fix it accordingly
	if not table.HasValue(modelFiles, ply:GetNWString("chosenPlayermodel")) then
		ply:SetNWString("chosenPlayermodel", "models/player/Group03/male_02.mdl")
	end

	if not table.HasValue(cardFiles, ply:GetNWString("chosenPlayercard")) then
		ply:SetNWString("chosenPlayercard", "cards/default/construct.png")
	end

	if not table.HasValue(meleeFiles, ply:GetNWString("chosenMelee")) then
		ply:SetNWString("chosenMelee", "tfa_km2000_knife")
	end
end

function SavePlayerData(ply)
	if DEBUG:GetBool() then return end

	if tempNewCMD != nil or tempCMD != nil then return end -- shouldn't be possible but just to be safe
	local id64 = ply:SteamID64()
	local query = sql.Query("SELECT key, value FROM tmplayerdata WHERE id = " .. SQLStr(id64) .. ";")

	if query == nil then
		query = "new"
	end

	tempNewCMD = "INSERT INTO tmplayerdata (id, key, value) VALUES"
	tempCMD = "UPDATE tmplayerdata SET value = CASE key "

	sql.Begin()

	UninitializeNetworkInt(ply, query, "playerKills")
	UninitializeNetworkInt(ply, query, "playerDeaths")
	UninitializeNetworkInt(ply, query, "playerScore")
	UninitializeNetworkInt(ply, query, "matchesPlayed")
	UninitializeNetworkInt(ply, query, "matchesWon")
	UninitializeNetworkInt(ply, query, "highestKillStreak")
	UninitializeNetworkInt(ply, query, "highestKillGame")
	UninitializeNetworkInt(ply, query, "farthestKill")
	UninitializeNetworkInt(ply, query, "playerLevel")
	UninitializeNetworkInt(ply, query, "playerXP")
	UninitializeNetworkString(ply, query, "chosenPlayermodel")
	UninitializeNetworkString(ply, query, "chosenPlayercard")
	UninitializeNetworkString(ply, query, "chosenMelee")
	UninitializeNetworkInt(ply, query, "playerAccoladeOnStreak")
	UninitializeNetworkInt(ply, query, "playerAccoladeBuzzkill")
	UninitializeNetworkInt(ply, query, "playerAccoladeLongshot")
	UninitializeNetworkInt(ply, query, "playerAccoladePointblank")
	UninitializeNetworkInt(ply, query, "playerAccoladeSmackdown")
	UninitializeNetworkInt(ply, query, "playerAccoladeHeadshot")
	UninitializeNetworkInt(ply, query, "playerAccoladeClutch")
	for id, _ in pairs(WEAPONS) do
		UninitializeNetworkInt(ply, query, "killsWith_" .. id)
	end

	tempNewCMD = string.sub(tempNewCMD, 1, -3) .. ";"
	tempCMD = tempCMD .. "ELSE value END WHERE id = " .. SQLStr(id64) .. ";"

	if tempNewCMD != "INSERT INTO tmplayerdata (id, key, value) VALU;" then
		sql.Query(tempNewCMD)
	end

	if tempCMD != "UPDATE tmplayerdata SET value = CASE key ELSE value END WHERE id = " .. SQLStr(id64) .. ";" then
		sql.Query(tempCMD)
	end

	sql.Commit()

	tempCMD = nil
	tempNewCMD = nil
end

function GM:PlayerDisconnected(ply)
	SavePlayerData(ply)
end

function GM:ShutDown()
	for _, v in ipairs(player.GetHumans()) do
		SavePlayerData(v)
	end
end
