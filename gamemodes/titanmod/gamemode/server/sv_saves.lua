local table = table
local player = player

hook.Add("Initialize", "InitPlayerNetworking", function()
	-- PlayerData64 is a really bad name and I don't want any conflicts to happen
	if sql.TableExists("PlayerData64") then
		if !ColumnExists("PlayerData64", "SteamID") or !ColumnExists("PlayerData64", "Key") or !ColumnExists("PlayerData64", "Value") then return end
		sql.Query("ALTER TABLE PlayerData64 RENAME TO TMPlayerData64;")
	end

	sql.Query("CREATE TABLE IF NOT EXISTS TMPlayerData64 (SteamID INTEGER, Key TEXT, Value TEXT);")

	-- new patch structure
	if ColumnExists("TMPlayerData64", "SteamName") then
		sql.Query("ALTER TABLE TMPlayerData64 RENAME TO TMPlayerData64_OLD;")

		sql.Query("CREATE TABLE IF NOT EXISTS TMPlayerData64 (SteamID INTEGER, Key TEXT, Value TEXT);")
		sql.Query([[
			INSERT INTO TMPlayerData64 (SteamID, Key, Value)
			SELECT SteamID, Key, Value FROM TMPlayerData64_OLD;
		]])

		sql.Query("DROP TABLE TMPlayerData64_OLD;")
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
		if key == v.Key then
			ply:SetNWInt(key, tonumber(v.Value))
			return tonumber(v.Value)
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
		if key == v.Key then
			ply:SetNWString(key, tostring(v.Value))
			return tostring(v.Value)
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
		if key == v.Key then
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
		if key == v.Key then
			tempCMD = tempCMD .. "WHEN " .. SQLStr(key) .. " THEN " .. SQLStr(value) .. " "
			return
		end
	end

	tempNewCMD = tempNewCMD .. "(" .. SQLStr(id64) .. ", " .. SQLStr(key) .. ", " .. SQLStr(value) .. "), "
end

function SetupPlayerData(ply)
	local id64 = ply:SteamID64()
	local query = sql.Query("SELECT Key, Value FROM TMPlayerData64 WHERE SteamID = " .. id64 .. ";")
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

	for k, v in ipairs(LEVELARRAY) do
		if ply:GetNWInt("playerLevel") == k and v != "prestige" then
			ply:SetNWInt("playerXPToNextLevel", v)
		end
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
	local query = sql.Query("SELECT Key, Value FROM TMPlayerData64 WHERE SteamID = " .. id64 .. ";")
	if query == nil then
		query = "new"
	end

	tempNewCMD = "INSERT INTO TMPlayerData64 (SteamID, Key, Value) VALUES"
	tempCMD = "UPDATE TMPlayerData64 SET Value = CASE Key "

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
	tempCMD = tempCMD .. "ELSE Value END WHERE SteamID = " .. id64 .. ";"

	if tempNewCMD != "INSERT INTO TMPlayerData64 (SteamID, Key, Value) VALU;" then
		sql.Query(tempNewCMD)
	end

	if tempCMD != "UPDATE TMPlayerData64 SET Value = CASE Key ELSE Value END WHERE SteamID = " .. id64 .. ";" then
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
