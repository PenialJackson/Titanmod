-- removing unneccessary server hook
if SERVER then
	hook.Add("Initialize", "SVHookRemoval", function()
		if timer.Exists("CheckHookTimes") then timer.Remove("CheckHookTimes") end
	end)
end

if CLIENT then
	-- optimized indexs
	local function RWEnt()
		local M_Entity = FindMetaTable("Entity")
		local E_GetTable = M_Entity.GetTable

		local val
		local et
		function M_Entity:__index(key)
			val = M_Entity[key]
			if val != nil then return val end

			et = E_GetTable(self)
			if et then
				return et[key]
			end
		end
	end

	local function RWPly()
		local M_Player = FindMetaTable("Player")
		local M_Entity = FindMetaTable("Entity")
		local E_GetTable = M_Entity.GetTable

		local val
		local pt
		function M_Player:__index(key)
			val = M_Player[key]
			if val != nil then return val end

			val = M_Entity[key]
			if val != nil then return val end

			pt = E_GetTable(self)
			if pt then
				return pt[key]
			end
		end
	end

	local function RWWep()
		local M_Weapon = FindMetaTable("Weapon")
		local M_Entity = FindMetaTable("Entity")
		local E_GetTable = M_Entity.GetTable
		local E_GetOwner = M_Entity.GetOwner

		local val
		local wt
		function M_Weapon:__index(key)
			val = M_Weapon[key]
			if val != nil then return val end

			val = M_Entity[key]
			if val != nil then return val end

			if key == "Owner" then return E_GetOwner(self) end

			wt = E_GetTable(self)
			if wt then
				return wt[key]
			end
		end
	end

	RWEnt()
	RWPly()
	RWWep()

	-- removing unneccessary client hooks
	hook.Add("InitPostEntity", "CLHookRemoval", function()
		hook.Remove("RenderScene", "RenderSuperDoF")
		hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
		hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
		hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
		hook.Remove("Think", "DOFThink")
		hook.Remove("PostDrawEffects", "RenderWidgets")
	end)

	-- remove widget code every tick
	local function CLTickRemoval(ent)
		if ent:IsWidget() then
			hook.Add("PlayerTick", "TickWidgets", function(pl, mv) widgets.PlayerTick(pl, mv) end)
			hook.Remove("OnEntityCreated", "WidgetCreated")
		end
	end
	hook.Add("OnEntityCreated", "WidgetCreated", CLTickRemoval)
end

-- optimized surface and draw functions
if SERVER or SurfaceRewrite then return end
SurfaceRewrite = true

local surface = surface
local Color = Color
local color_white = color_white

local TEXT_ALIGN_CENTER	= 1
local TEXT_ALIGN_RIGHT = 2
local TEXT_ALIGN_BOTTOM	= 4

local surface_SetFont = surface.SetFont
local surface_GetTextSize = surface.GetTextSize
local surface_SetTextPos = surface.SetTextPos
local surface_SetTextColor = surface.SetTextColor
local surface_DrawText = surface.DrawText
local surface_SetTexture = surface.SetTexture
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_DrawTexturedRectRotated = surface.DrawTexturedRectRotated
local surface_GetTextureID = surface.GetTextureID

local string_sub = string.sub

local math_ceil = math.ceil

local Tex_Corner8 = surface_GetTextureID("gui/corner8")
local Tex_Corner16 = surface_GetTextureID("gui/corner16")

local CachedFontHeights = {}
local function draw_GetFontHeight(font)
	if CachedFontHeights[font] then return CachedFontHeights[font] end

	surface_SetFont(font)
	local _, h = surface_GetTextSize("W")
	CachedFontHeights[font] = h

	return h
end

local function draw_SimpleText(text, font, x, y, colour, xalign, yalign)
	surface_SetFont(font)

	if xalign == TEXT_ALIGN_CENTER then
		local w, _ = surface_GetTextSize(text)
		x = x - w / 2
	elseif xalign == TEXT_ALIGN_RIGHT then
		local w, _ = surface_GetTextSize(text)
		x = x - w
	end

	if yalign == TEXT_ALIGN_CENTER then
		local h = draw_GetFontHeight(font)
		y = y - h / 2
	elseif yalign == TEXT_ALIGN_BOTTOM then
		local h = draw_GetFontHeight(font)
		y = y - h
	end

	surface_SetTextPos(x, y)
	if colour then surface_SetTextColor(colour.r, colour.g, colour.b, colour.a) else surface_SetTextColor(255, 255, 255, 255) end
	surface_DrawText(text)
end

local function draw_DrawText(text, font, x, y, colour, xalign )
	local curX = x
	local curY = y
	local curString = ""

	surface_SetFont(font)
	local sizeX, lineHeight = surface_GetTextSize("\n")

	for i = 1, #text do
		local ch = string_sub(text, i, i)
		if ch == "\n" then
			if #curString > 0 then draw_SimpleText(curString, font, curX, curY, colour, xalign) end

			curY = curY + lineHeight / 2
			curX = x
			curString = ""
		elseif ch == "\t" then
			if #curString > 0 then draw_SimpleText(curString, font, curX, curY, colour, xalign) end
			local tmpSizeX, _ =  surface_GetTextSize(curString)
			curX = math_ceil( (curX + tmpSizeX) / 50 ) * 50
			curString = ""
		else
			curString = curString .. ch
		end
	end
	if #curString > 0 then draw_SimpleText(curString, font, curX, curY, colour, xalign) end
end

local function draw_Text(tab)
	local text = tab.text
	local font = tab.font or "DermaDefault"
	local x = tab.pos[1] or 0
	local y = tab.pos[2] or 0
	local xalign = tab.xalign
	local yalign = tab.yalign

	surface_SetFont(font)

	if xalign == TEXT_ALIGN_CENTER then
		local w, _ = surface_GetTextSize(text)
		x = x - w / 2
	elseif xalign == TEXT_ALIGN_RIGHT then
		local w, _ = surface_GetTextSize(text)
		x = x - w
	end

	if yalign == TEXT_ALIGN_CENTER then
		local h = draw_GetFontHeight(font)
		y = y - h / 2
	end

	surface_SetTextPos(x, y)

	if tab.color then surface_SetTextColor(tab.color) else surface_SetTextColor(255, 255, 255, 255) end
	surface_DrawText(text)
end

function draw.TextShadow(tab, distance, alpha)

	alpha = alpha or 200

	local color = tab.color
	local pos 	= tab.pos
	tab.color = Color(0, 0, 0, alpha)
	tab.pos = {pos[1] + distance, pos[2] + distance}

	draw_Text(tab)

	tab.color = color
	tab.pos = pos

	draw_Text(tab)
end

function draw.TexturedQuad(tab)
	surface_SetTexture(tab.texture)
	surface_SetDrawColor(tab.color or color_white)
	surface_DrawTexturedRect(tab.x, tab.y, tab.w, tab.h)
end

function draw.SimpleTextOutlined(text, font, x, y, colour, xalign, yalign, outlinewidth, outlinecolour)
	local steps = (outlinewidth * 2) / 3
	if steps < 1 then steps = 1 end

	for _x = -outlinewidth, outlinewidth, steps do
		for _y = -outlinewidth, outlinewidth, steps do
			draw_SimpleText(text, font, x + _x, y + _y, outlinecolour, xalign, yalign)
		end
	end

	draw_SimpleText(text, font, x, y, colour, xalign, yalign)
end

draw.GetFontHeight = draw_GetFontHeight
draw.SimpleText = draw_SimpleText
draw.DrawText = draw_DrawText
draw.Text = draw_Text
