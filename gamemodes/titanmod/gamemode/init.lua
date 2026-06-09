AddCSLuaFile("shared.lua")
include("shared.lua")

TM.SERVER = TM.SERVER or {}

AddCSLuaFile("config.lua")
include("config.lua")
AddCSLuaFile("enums.lua")
include("enums.lua")

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/shared/*.lua", "GAME", "nameasc")) do
	AddCSLuaFile("shared/" .. f)
	include("shared/" .. f)
end

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/server/*.lua", "GAME", "nameasc")) do
	include("server/" .. f)
end

AddCSLuaFile("cl_init.lua")

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/client/*.lua", "GAME", "nameasc")) do
	AddCSLuaFile("client/" .. f)
end

for _, f in ipairs(file.Find("gamemodes/titanmod/gamemode/vgui/*.lua", "GAME", "nameasc")) do
	AddCSLuaFile("vgui/" .. f)
end
