include("shared.lua")

TM.CLIENT = TM.CLIENT or {}

include("config.lua")
include("enums.lua")

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

TM.HUDScale = function(size)
	local ratio = (ScrW() / ScrH() <= 1.8) and (ScrW() / 1920.0) or (ScrH() / 1080.0)
	local scaled = size * ratio * scale:GetFloat()
	return size > 0 and math.max(1, scaled) or math.min(-1, scaled)
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
	-- EFGM.HUD.Padding = paddingCVar:GetInt() * (4 * (newW / 1920.0))
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
