local gameEnded = false
local matchStartPopupSeen = false
local feedArray = {}
local chatArray = {}

local hudEnable = GetConVar("tm_hud_enable"):GetBool()
local hudScale = GetConVar("tm_hud_scale"):GetFloat()
local hudX = GetConVar("tm_hud_bounds_x"):GetInt()
local hudY = GetConVar("tm_hud_bounds_y"):GetInt()
local hudTextR = GetConVar("tm_hud_text_color_r"):GetInt()
local hudTextG = GetConVar("tm_hud_text_color_g"):GetInt()
local hudTextB = GetConVar("tm_hud_text_color_b"):GetInt()

local music = GetConVar("tm_music"):GetBool()
local musicVolume = GetConVar("tm_music_volume"):GetFloat()

local crosshair = GetConVar("tm_hud_crosshair"):GetBool()
local crosshairStyle = GetConVar("tm_hud_crosshair_style"):GetInt()
local crosshairGap = GetConVar("tm_hud_crosshair_gap"):GetInt()
local crosshairSize = GetConVar("tm_hud_crosshair_size"):GetInt()
local crosshairThickness = GetConVar("tm_hud_crosshair_thickness"):GetInt()
local crosshairDot = GetConVar("tm_hud_crosshair_dot"):GetBool()
local crosshairOutline = GetConVar("tm_hud_crosshair_outline"):GetBool()
local crosshairOpacity = GetConVar("tm_hud_crosshair_opacity"):GetInt()
local crosshairR = GetConVar("tm_hud_crosshair_color_r"):GetInt()
local crosshairG = GetConVar("tm_hud_crosshair_color_g"):GetInt()
local crosshairB = GetConVar("tm_hud_crosshair_color_b"):GetInt()
local crosshairOutlineR = GetConVar("tm_hud_crosshair_outline_color_r"):GetInt()
local crosshairOutlineG = GetConVar("tm_hud_crosshair_outline_color_g"):GetInt()
local crosshairOutlineB = GetConVar("tm_hud_crosshair_outline_color_b"):GetInt()
local crosshairShowTop = GetConVar("tm_hud_crosshair_show_t"):GetBool()
local crosshairShowBottom = GetConVar("tm_hud_crosshair_show_b"):GetBool()
local crosshairShowLeft = GetConVar("tm_hud_crosshair_show_l"):GetBool()
local crosshairShowRight = GetConVar("tm_hud_crosshair_show_r"):GetBool()
local crosshairSprint = GetConVar("tm_hud_crosshair_sprint"):GetBool()

local hitmarker = GetConVar("tm_hud_hitmarker"):GetBool()
local hitmarkerGap = GetConVar("tm_hud_hitmarker_gap"):GetInt()
local hitmarkerSize = GetConVar("tm_hud_hitmarker_size"):GetInt()
local hitmarkerThickness = GetConVar("tm_hud_hitmarker_thickness"):GetInt()
local hitmarkerOpacity = GetConVar("tm_hud_hitmarker_opacity"):GetInt()
local hitmarkerDuration = GetConVar("tm_hud_hitmarker_duration"):GetFloat()
local hitmarkerR = GetConVar("tm_hud_hitmarker_hit_color_r"):GetInt()
local hitmarkerG = GetConVar("tm_hud_hitmarker_hit_color_g"):GetInt()
local hitmarkerB = GetConVar("tm_hud_hitmarker_hit_color_b"):GetInt()
local hitmarkerHeadR = GetConVar("tm_hud_hitmarker_head_color_r"):GetInt()
local hitmarkerHeadG = GetConVar("tm_hud_hitmarker_head_color_g"):GetInt()
local hitmarkerHeadB = GetConVar("tm_hud_hitmarker_head_color_b"):GetInt()

local healthX = GetConVar("tm_hud_health_offset_x"):GetInt()
local healthY = GetConVar("tm_hud_health_offset_y"):GetInt()

local equipmentX = GetConVar("tm_hud_equipment_offset_x"):GetInt()
local equipmentY = GetConVar("tm_hud_equipment_offset_y"):GetInt()

local killfeed = GetConVar("tm_hud_killfeed"):GetBool()
local killfeedX = GetConVar("tm_hud_killfeed_offset_x"):GetInt()
local killfeedY = GetConVar("tm_hud_killfeed_offset_y"):GetInt()
local killfeedStyle = GetConVar("tm_hud_killfeed_style"):GetBool()
local killfeedLimit = GetConVar("tm_hud_killfeed_limit"):GetInt()
local killfeedOpacity = GetConVar("tm_hud_killfeed_opacity"):GetInt()

local keyoverlay = GetConVar("tm_hud_keypressoverlay"):GetBool()
local keyoverlayX = GetConVar("tm_hud_keypressoverlay_x"):GetInt()
local keyoverlayY = GetConVar("tm_hud_keypressoverlay_y"):GetInt()
local keyoverlayActuatedR = GetConVar("tm_hud_keypressoverlay_actuated_color_r"):GetInt()
local keyoverlayActuatedG = GetConVar("tm_hud_keypressoverlay_actuated_color_g"):GetInt()
local keyoverlayActuatedB = GetConVar("tm_hud_keypressoverlay_actuated_color_b"):GetInt()
local keyoverlayInactiveR = GetConVar("tm_hud_keypressoverlay_inactive_color_r"):GetInt()
local keyoverlayInactiveG = GetConVar("tm_hud_keypressoverlay_inactive_color_g"):GetInt()
local keyoverlayInactiveB = GetConVar("tm_hud_keypressoverlay_inactive_color_b"):GetInt()

local velocityoverlay = GetConVar("tm_hud_velocityoverlay"):GetBool()
local velocityoverlayX = GetConVar("tm_hud_velocityoverlay_x"):GetInt()
local velocityoverlayY = GetConVar("tm_hud_velocityoverlay_y"):GetInt()

local objScale = GetConVar("tm_hud_obj_scale"):GetFloat()
local objEmptyR = GetConVar("tm_hud_obj_empty_color_r"):GetInt()
local objEmptyG = GetConVar("tm_hud_obj_empty_color_g"):GetInt()
local objEmptyB = GetConVar("tm_hud_obj_empty_color_b"):GetInt()
local objOccupiedR = GetConVar("tm_hud_obj_occupied_color_r"):GetInt()
local objOccupiedG = GetConVar("tm_hud_obj_occupied_color_g"):GetInt()
local objOccupiedB = GetConVar("tm_hud_obj_occupied_color_b"):GetInt()
local objContestedR = GetConVar("tm_hud_obj_contested_color_r"):GetInt()
local objContestedG = GetConVar("tm_hud_obj_contested_color_g"):GetInt()
local objContestedB = GetConVar("tm_hud_obj_contested_color_b"):GetInt()

local sfxHit = GetConVar("tm_hit_sfx"):GetBool()
local sfxKill = GetConVar("tm_kill_sfx"):GetBool()
local sfxHitStyle = GetConVar("tm_hit_sfx_style"):GetInt()
local sfxKillStyle = GetConVar("tm_kill_sfx_style"):GetInt()
local sfxKillHeadStyle = GetConVar("tm_kill_headshot_sfx_style"):GetInt()

local notifications = GetConVar("tm_hud_notifications"):GetBool()

local screenfx = GetConVar("tm_screenflashes"):GetBool()

local bindGrapple = GetConVar("tm_bind_grapple"):GetInt()
local bindNade = GetConVar("tm_bind_nade"):GetInt()
local bindMenu = GetConVar("tm_bind_menu"):GetInt()

local reloadBind = input.LookupBinding("+reload") or "Reload Bind"

local hillColor
local objIndicatorColor

local timeUntilSelfDestruct = 0

local intermissionLength = GetConVar("sv_tm_intermission_length")
local gunGameSize = GetConVar("sv_tm_mode_gungame_ladder_size")
local crankedTime = GetConVar("sv_tm_mode_cranked_state_length")
local voting = GetConVar("sv_tm_voting")

local function MatchStartPopup()
	if GetGlobalInt("tm_matchtime", 0) - CurTime() > (GetGlobalInt("tm_matchtime", 0) - intermissionLength:GetInt()) then return end

	local gm = string.upper(GAMEMODES.MODES[TM.GAMEMODE].name)
	local desc
	local winCondition

	matchStartPopupSeen = true

	surface.SetFont("HUD_AmmoCountSmall")
	local popupW, popupH = select(1, surface.GetTextSize(gm))

	if gm == "FFA" then
		desc = "Eliminate other players"
		winCondition = "Get the most score to WIN"
	elseif gm == "CRANKED" then
		desc = "Eliminate other players, movement boost on kill"
		winCondition = "Get the most score to WIN"
	elseif gm == "GUN GAME" then
		desc = "Eliminate other players to advance to the next weapon"
		winCondition = "Get a kill with every each to WIN"
	elseif gm == "SHOTTY SNIPERS" then
		desc = "Eliminate other players with snipers and shotguns"
		winCondition = "Get the most score to WIN"
	elseif gm == "FIESTA" then
		desc = "Eliminate other players with constantly changing loadouts"
		winCondition = "Get the most score to WIN"
	elseif gm == "QUICKDRAW" then
		desc = "Eliminate other players with secondaries"
		winCondition = "Get the most score to WIN"
	elseif gm == "KOTH" then
		desc = "Capture and defend the objective"
		winCondition = "Get the most score to WIN"
	elseif gm == "VIP" then
		desc = "Track down and kill the VIP, defend the status for yourself"
		winCondition = "Get the most score to WIN"
	elseif gm == "OVERKILL" then
		desc = "Eliminate other players with no weapon restrictions"
		winCondition = "Get the most score to WIN"
	elseif gm == "FISTICUFFS" then
		desc = "Eliminate other players with melee weapons"
		winCondition = "Get the most score to WIN"
	end

	if IsValid(gamemodePopup) then gamemodePopup:Remove() end
	if IsValid(gamemodeInfo) then gamemodeInfo:Remove() end

	gamemodePopup = vgui.Create("DPanel", GetHUDPanel())
	gamemodePopup:SetSize(popupW + TM.ScreenScale(8), 0)
	gamemodePopup:SetX(ScrW() / 2 - (popupW / 2))
	gamemodePopup:MoveToFront()

	gamemodePopup:SizeTo(popupW + TM.ScreenScale(8), popupH - TM.ScreenScale(8), 1, 0, 0.1)

	function gamemodePopup:Paint(w, h)
		BlurPanel(gamemodePopup, 5)
		gamemodePopup:SetY(gamemodePopup:GetTall())

		surface.SetDrawColor(255, 255, 255, 128)
		surface.DrawRect(0, 0, gamemodePopup:GetWide(), TM.ScreenScale(1))

		surface.SetDrawColor(0, 0, 0, 75)
		surface.DrawRect(0, 0, gamemodePopup:GetWide(), gamemodePopup:GetTall())

		draw.DrawText(gm, "HUD_AmmoCountSmall", w / 2, TM.ScreenScale(-2), COLORS.white, TEXT_ALIGN_CENTER)
	end

	local textW = 0

	timer.Create("addAdditionalPopupInfo", 1.5, 1, function()
		if !IsValid(gamemodePopup) then return end

		surface.SetFont("HUD_Health")
		local descTextW, descTextH = select(1, surface.GetTextSize(desc))
		local winTextW, winTextH = select(1, surface.GetTextSize(winCondition))

		textW = math.max(descTextW, winTextW)

		gamemodeInfo = vgui.Create("DPanel", GetHUDPanel())
		gamemodeInfo:SetSize(0, descTextH + winTextH + TM.ScreenScale(2))
		gamemodeInfo:SetY(gamemodePopup:GetTall() + popupH)

		gamemodeInfo:SizeTo(textW + TM.ScreenScale(16), descTextH + winTextH + TM.ScreenScale(2), 0.75, 0, 0.1)

		function gamemodeInfo:Paint(w, h)
			BlurPanel(gamemodeInfo, 5)
			gamemodeInfo:SetX(ScrW() / 2 - (textW / 2))

			surface.SetDrawColor(255, 255, 255, 128)
			surface.DrawRect(0, 0, gamemodeInfo:GetWide(), TM.ScreenScale(1))

			surface.SetDrawColor(0, 0, 0, 75)
			surface.DrawRect(0, 0, gamemodeInfo:GetWide(), gamemodeInfo:GetTall())

			draw.DrawText(desc, "HUD_Health", w / 2, 0, COLORS.white, TEXT_ALIGN_CENTER)
			draw.DrawText(winCondition, "HUD_Health", w / 2, descTextH, COLORS.white, TEXT_ALIGN_CENTER)
		end
	end)

	timer.Create("removeGamemodePopup", 6.5, 1, function()
		if !IsValid(gamemodePopup) or !IsValid(gamemodeInfo) then return end

		gamemodePopup:SizeTo(popupW + TM.ScreenScale(8), 0, 0.75, 0, 0.1, function()
			gamemodePopup:Remove()
		end)

		gamemodeInfo:SizeTo(textW + TM.ScreenScale(16), 0, 0.25, 0, 0.1, function()
			gamemodeInfo:Remove()
		end)
	end)
end

net.Receive("PlayerSpawn", function(len)
	RunConsoleCommand("r_cleardecals")

	if !IsValid(LocalPlayer()) then return end
	if hudEnable then return end

	if TM.GAMEMODE != GAMEMODES.IDS.GUNGAME and TM.GAMEMODE != GAMEMODES.IDS.FISTICUFFS then
		ShowLoadoutOnSpawn()
	end

	if matchStartPopupSeen == false then
		MatchStartPopup()
	end
end)

hook.Add("RenderScreenspaceEffects", "IntermissionPostProcess", function()
	if GetGlobalInt("tm_matchtime", 0) - CurTime() < (GetGlobalInt("tm_matchtime", 0) - intermissionLength:GetInt()) then
		hook.Remove("RenderScreenspaceEffects", "IntermissionPostProcess")

		if LocalPlayer():Alive() then
			MatchStartPopup()
		end
	end

	local intTime = (GetGlobalInt("tm_matchtime", 0) - CurTime()) - (GetGlobalInt("tm_matchtime", 0) - intermissionLength:GetInt())
	local pp = (-intTime / intermissionLength:GetInt()) + 1

	local intermissionpp = {
		["$pp_colour_contrast"] = math.max(0.5, pp),
		["$pp_colour_colour"] = pp,
	}

	if LocalPlayer():Alive() != true then return end

	DrawColorModify(intermissionpp)
end )

function HUDIntermission()
	if !LocalPlayer():Alive() then return end
	if gameEnded then return end

	draw.DrawText("Match begins in", "HUD_WepNameKill", ScrW() / 2, ScrH() / 2 - TM.ScreenScale(110), COLORS.white, TEXT_ALIGN_CENTER)
	draw.DrawText(math.Round(GetGlobalInt("tm_matchtime", 0) - CurTime()) - (GetGlobalInt("tm_matchtime", 0) - intermissionLength:GetInt()), "HUD_IntermissionText", ScrW() / 2, ScrH() / 2 - TM.ScreenScale(100), COLORS.white, TEXT_ALIGN_CENTER)
	draw.DrawText("[" .. string.upper(input.GetKeyName(bindMenu)) .. "] return to menu", "HUD_WepNameKill", ScrW() / 2, ScrH() - TM.ScreenScale(200), COLORS.white, TEXT_ALIGN_CENTER)
end

local function CrosshairStateUpdate(wep)
	local gap = 0
	local velocity = tostring(math.Round(LocalPlayer():GetVelocity():Length()))

	if wep != NULL and type(wep.Primary.Spread) == "number" then
		if wep:GetIronSights() and wep:GetStat("DrawCrosshairIS") == true then
			return 0
		else
			gap = gap + wep:GetStat("Primary.Spread") * 300

			if LocalPlayer():KeyDown(IN_ATTACK) then
				gap = gap + 5
			end
		end
	end

	if LocalPlayer():OnGround() and LocalPlayer():Crouching() or LocalPlayer():GetSliding() then
		return math.Clamp(math.Round(gap - 5), 0, 100)
	end

	if !LocalPlayer():OnGround() then
		gap = gap + 7
	end

	gap = gap + velocity / 55

	return math.Clamp(math.Round(gap), 0, 100)
end

local modeName = GAMEMODES.MODES[TM.GAMEMODE].name

local function RenderInfo()
	local timeText = string.FormattedTime(GetGlobalInt("tm_matchtime", 0) - CurTime() + 1, "%02i:%02i") or "00:00"
	draw.DrawText(modeName .. " | " .. timeText, "HUD_Health", ScrW() / 2, TM.ScreenScale(-5) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)

	if TM.GAMEMODE == GAMEMODES.IDS.GUNGAME then
		draw.DrawText(gunGameSize:GetInt() - LocalPlayer():GetNWInt("ladderPosition") .. " kills left", "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
	elseif TM.GAMEMODE == GAMEMODES.IDS.FIESTA and (GetGlobalInt("FiestaTime", 0) - CurTime()) > 0 then
		draw.DrawText(string.FormattedTime(math.Round(GetGlobalInt("FiestaTime", 0) - CurTime() + 0.5), "%02i:%02i"), "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
	elseif TM.GAMEMODE == GAMEMODES.IDS.CRANKED and timeUntilSelfDestruct != 0 then
		draw.DrawText(timeUntilSelfDestruct, "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
	elseif TM.GAMEMODE == GAMEMODES.IDS.KOTH then
		if GetGlobalString("tm_hillstatus") == "Occupied" then
			draw.DrawText(GetGlobalEntity("tm_entonhill"):Nick(), "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		else
			draw.DrawText(GetGlobalString("tm_hillstatus"), "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		end
	elseif TM.GAMEMODE == GAMEMODES.IDS.VIP then
		if GetGlobalEntity("tm_vip") != NULL then
			draw.DrawText(GetGlobalEntity("tm_vip"):Nick(), "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)

			if GetGlobalEntity("tm_vip") != LocalPlayer() then
				draw.DrawText(math.Round(LocalPlayer():GetPos():Distance(GetGlobalEntity("tm_vip"):GetPos()) * 0.01905) .. "m", "HUD_Health", ScrW() / 2, TM.ScreenScale(105) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
			end
		else
			draw.DrawText("No VIP", "HUD_Health", ScrW() / 2, TM.ScreenScale(25) + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		end
	end

	if TM.GAMEMODE == GAMEMODES.IDS.KOTH then
		if GetGlobalString("tm_hillstatus") == "Empty" then
			hillColor = Color(objEmptyR, objEmptyG, objEmptyB, 3)
			objIndicatorColor = Color(objEmptyR, objEmptyG, objEmptyB, 175)

			surface.SetDrawColor(255, 255, 255, 100)
			surface.SetMaterial(MATS.hillEmpty)
		elseif GetGlobalString("tm_hillstatus") == "Occupied" then
			hillColor = Color(objOccupiedR, objOccupiedG, objOccupiedB, 3)
			objIndicatorColor = Color(objOccupiedR, objOccupiedG, objOccupiedB, 175)

			surface.SetDrawColor(objOccupiedR, objOccupiedG, objOccupiedB, 100)
			surface.SetMaterial(MATS.hillEmpty)
		else
			hillColor = Color(objContestedR, objContestedG, objContestedB, 3)
			objIndicatorColor = Color(objContestedR, objContestedG, objContestedB, 175)

			surface.SetDrawColor(objContestedR, objContestedG, objContestedB, 100)
			surface.SetMaterial(MATS.hillEmpty)
		end

		surface.DrawTexturedRect(ScrW() / 2 - TM.ScreenScale(21), TM.ScreenScale(60) + hudY, TM.ScreenScale(42), TM.ScreenScale(42))

		surface.SetMaterial(MATS.hillBorder)
		surface.SetDrawColor(objIndicatorColor)

		if LocalPlayer():GetNWBool("onOBJ") then
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		end
	elseif TM.GAMEMODE == GAMEMODES.IDS.VIP then
		surface.SetMaterial(MATS.hillBorder)
		surface.SetDrawColor(objOccupiedR, objOccupiedG, objOccupiedB, 175)

		if GetGlobalEntity("tm_vip", NULL) == LocalPlayer() then
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		end

		surface.SetDrawColor(objOccupiedR, objOccupiedG, objOccupiedB, 225)
		surface.SetMaterial(MATS.hillEmpty)
		surface.DrawTexturedRect(ScrW() / 2 - TM.ScreenScale(24), TM.ScreenScale(57) + hudY, TM.ScreenScale(48), TM.ScreenScale(48))
	end

	if TM.GAMEMODE == GAMEMODES.IDS.CRANKED and timeUntilSelfDestruct != 0 and LocalPlayer():Alive() then
		surface.SetDrawColor(50, 50, 50, 80)
		surface.DrawRect(ScrW() / 2 - TM.ScreenScale(75), TM.ScreenScale(60) + hudY, TM.ScreenScale(150), TM.ScreenScale(10))

		surface.SetDrawColor(objContestedR, objContestedG, objContestedB, 80)
		surface.DrawRect(ScrW() / 2 - TM.ScreenScale(75), TM.ScreenScale(60) + hudY, TM.ScreenScale(150) * (timeUntilSelfDestruct / crankedTime:GetInt()), TM.ScreenScale(10))
	end

	if GetGlobalBool("tm_matchended") == true then
		draw.DrawText("Match has ended", "HUD_GunPrintName", ScrW() / 2, ScrH() / 2 - TM.ScreenScale(104), COLORS.white, TEXT_ALIGN_CENTER)
		draw.DrawText("Sit tight, another match is about to begin!", "HUD_Health", ScrW() / 2, ScrH() / 2 - TM.ScreenScale(18), COLORS.white, TEXT_ALIGN_CENTER)
	end
end

local function RenderKillFeed()
	surface.SetFont("HUD_StreakText")
	for k, v in pairs(feedArray) do
		if v[2] == 1 and v[2] != nil then
			surface.SetDrawColor(150, 50, 50, killfeedOpacity)
		else
			surface.SetDrawColor(50, 50, 50, killfeedOpacity)
		end

		local nameLength = select(1, surface.GetTextSize(v[1]))
		local feedEntryPadding = !killfeedStyle and TM.ScreenScale(-20) or TM.ScreenScale(20)

		surface.DrawRect(killfeedX, ScrH() - TM.ScreenScale(20) + ((k - 1) * feedEntryPadding) - killfeedY, nameLength + TM.ScreenScale(5), TM.ScreenScale(20))
		draw.DrawText(v[1], "HUD_StreakText", TM.ScreenScale(2) + killfeedX, ScrH() - TM.ScreenScale(22) + ((k - 1) * feedEntryPadding) - killfeedY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_LEFT)
	end
end

local adsFade = 1
local dyn = 0

-- HUD lerp functinos
local smoothDyn = 0
local startDyn = 0
local newDyn = 0
local oldDyn = 0
local function LerpCrosshair()
	smoothDyn = Lerp((SysTime() - startDyn ) / 0.07, oldDyn, newDyn)

	if newDyn != dyn then
		if (smoothDyn != dyn) then newDyn = smoothDyn end
		oldDyn = newDyn
		startDyn = SysTime()
		newDyn = dyn
	end
end

local smoothHP = 0
local startHP = 0
local newHP = 0
local oldHP = 0
local function LerpHealth()
	smoothHP = Lerp((SysTime() - startHP ) / 0.1, oldHP, newHP)

	if newHP != health then
		if (smoothHP != health) then newHP = smoothHP end
		oldHP = newHP
		startHP = SysTime()
		newHP = health
	end
end

local function RenderCrosshair()
	local weapon = LocalPlayer():GetActiveWeapon()
	if !IsValid(weapon) then return end

	LerpCrosshair()

	if (type(weapon.GetIronSights) == "function" and weapon:GetIronSights() and weapon:GetStat("DrawCrosshairIS") == false) or (type(weapon.GetCustomizing) == "function" and weapon:GetCustomizing()) or (LocalPlayer():IsSprinting() and LocalPlayer():OnGround() and crosshairSprint == 0) then
		adsFade = math.Clamp(adsFade - 7 * RealFrameTime(), 0, 1)
	else
		adsFade = math.Clamp(adsFade + 4 * RealFrameTime(), 0, 1)
	end

	if crosshairStyle then
		dyn = CrosshairStateUpdate(weapon)
		LerpCrosshair()
	else
		dyn = 0
	end

	local centerX = ScrW() / 2
	local centerY = ScrH() / 2

	if crosshair then
		if crosshairOutline then
			surface.SetDrawColor(crosshairOutlineR, crosshairOutlineG, crosshairOutlineB, crosshairOpacity * adsFade)

			if crosshairShowRight then surface.DrawRect(centerX + (crosshairGap + smoothDyn) - 1, centerY - math.floor(crosshairThickness / 2) - 1, crosshairSize + 2,  crosshairThickness + 2) end
			if crosshairShowLeft == 1 then surface.DrawRect(centerX - (crosshairGap + smoothDyn) - crosshairSize + crosshairThickness % 2 - 1, centerY - math.floor(crosshairThickness / 2) - 1, crosshairSize + 2,  crosshairThickness + 2) end
			if crosshairShowBottom == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2) - 1, centerY + (crosshairGap + smoothDyn) - 1, crosshairThickness + 2, crosshairSize + 2) end
			if crosshairShowTop == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2) - 1, centerY - crosshairSize - (crosshairGap + smoothDyn) + crosshairThickness % 2 - 1, crosshairThickness + 2, crosshairSize + 2) end
			if crosshairDot == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2) - 1, centerY - math.floor(crosshairThickness / 2) - 1, crosshairThickness + 2, crosshairThickness + 2) end
		end

		surface.SetDrawColor(crosshairR, crosshairG, crosshairB, crosshair["opacity"] * adsFade)

		if crosshairShowRight == 1 then surface.DrawRect(centerX + (crosshairGap + smoothDyn), centerY - math.floor(crosshairThickness / 2), crosshairSize,  crosshairThickness) end
		if crosshairShowLeft == 1 then surface.DrawRect(centerX - (crosshairGap + smoothDyn) - crosshairSize + crosshairThickness % 2, centerY - math.floor(crosshairThickness / 2), crosshairSize,  crosshairThickness) end
		if crosshairShowBottom == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2), centerY + (crosshairGap + smoothDyn), crosshairThickness, crosshairSize) end
		if crosshairShowTop == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2), centerY - crosshairSize - (crosshairGap + smoothDyn) + crosshairThickness % 2, crosshairThickness, crosshairSize) end
		if crosshairDot == 1 then surface.DrawRect(centerX - math.floor(crosshairThickness / 2), centerY - math.floor(crosshairThickness / 2), crosshairThickness, crosshairThickness) end
	end
end

local hitmarkerFade = 0
local hitType = false

local function RenderHitmarkers()
	hitmarkerFade = math.Clamp(hitmarkerFade - 7 * RealFrameTime(), 0, hitmarkerDuration)

	if !hitType then
		surface.SetDrawColor(hitmarkerR, hitmarkerG, hitmarkerB, hitmarkerOpacity * math.min(1, hitmarkerFade))
	else
		surface.SetDrawColor(hitmarkerHeadR, hitmarkerHeadG, hitmarkerHeadB, hitmarkerOpacity * math.min(1, hitmarkerFade))
	end

	draw.NoTexture()

	surface.DrawTexturedRectRotated(centerX - hitmarkerGap, centerY - hitmarkerGap, hitmarkerThickness * math.min(1, hitmarkerFade), hitmarkerSize, 45)
	surface.DrawTexturedRectRotated(centerX + hitmarkerGap, centerY- hitmarkerGap, hitmarkerThickness * math.min(1, hitmarkerFade), hitmarkerSize, 135)
	surface.DrawTexturedRectRotated(centerX + hitmarkerGap, centerY + hitmarkerGap, hitmarkerThickness * math.min(1, hitmarkerFade), hitmarkerSize, 225)
	surface.DrawTexturedRectRotated(centerX - hitmarkerGap, centerY + hitmarkerGap, hitmarkerThickness * math.min(1, hitmarkerFade), hitmarkerSize, 315)
end

local function RenderHealth()
	local maxHealth = LocalPlayer():GetMaxHealth()
	local health = math.Clamp(LocalPlayer():Health(), 0, maxHealth)

	LerpHealth()

	surface.SetDrawColor(50, 50, 50, 80)
	surface.DrawRect(healthX + hudX, ScrH() - TM.ScreenScale(30) - healthY - hudY, TM.ScreenScale(450), TM.ScreenScale(30))

	if health <= (maxHealth / 1.5) then
		if health <= (maxHealth / 3) then
			surface.SetDrawColor(180, 100, 100, 120)
		else
			surface.SetDrawColor(180, 180, 100, 120)
		end
	else
		surface.SetDrawColor(100, 180, 100, 120)
	end

	surface.DrawRect(healthX + hudX, ScrH() - TM.ScreenScale(30) - healthY - hudY, TM.ScreenScale(450) * (math.max(0, smoothHP) / maxHealth), TM.ScreenScale(30))
	draw.DrawText(health, "HUD_Health", TM.ScreenScale(450) + healthX + hudX - TM.ScreenScale(10), ScrH() - TM.ScreenScale(30) - healthY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_RIGHT)
end

local function RenderLoadout()
	local weapon = LocalPlayer():GetActiveWeapon()
	if !IsValid(weapon) then return end

	draw.DrawText(weapon:GetPrintName(), "HUD_GunPrintName", ScrW() - hudX, ScrH() - TM.ScreenScale(50) - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_RIGHT)

	local clip = weapon:Clip1()

	if IsValid(clip) then
		local ammoColor = Color(hudTextR, hudTextG, hudTextB)
		local ammoText = tostring(clip)

		if clip >= 0 then
			if clip == 0 then
				ammoColor = COLORS.red
				ammoText = "0"
			end
		elseif (weapon:GetStat("InfiniteAmmo") and !weapon:GetStat("IsThrowable")) or TM.GAMEMODE == GAMEMODES.IDS.GUNGAME or TM.GAMEMODE == GAMEMODES.IDS.FISTICUFFS then
			ammoText = "∞"
		else
			ammoText = "[" .. string.upper(reloadBind) .. "] THROW"
		end

		draw.DrawText(ammoText, "HUD_AmmoCount", ScrW() - hudX, ScrH() - TM.ScreenScale(165) - hudY, ammoColor, TEXT_ALIGN_RIGHT)
	end

	local grappleText = string.upper(input.GetKeyName(bindGrapple))
	local nadeText = string.upper(input.GetKeyName(bindNade))

	if LocalPlayer():GetAmmoCount("Grenade") > 0 then
		surface.SetMaterial(MATS.grappleIcon)

		if Lerp((LocalPlayer():GetNWFloat("linat", CurTime()) - CurTime()) * 0.2, 0, 500) == 0 and !IsValid(LocalPlayer():SetNWEntity("lina", stando)) then
			surface.SetDrawColor(COLORS.white)
		else
			surface.SetDrawColor(255, 200, 200, 100)
			grappleText = tostring(math.floor(LocalPlayer():GetNWFloat("linat", CurTime()) - CurTime() + 1))
		end

		surface.DrawTexturedRect(equipmentX + hudX - TM.ScreenScale(45), ScrH() - TM.ScreenScale(40) - equipmentY - hudY, TM.ScreenScale(35), TM.ScreenScale(40))
		draw.DrawText(grappleText, "HUD_StreakText", equipmentX + hudX - TM.ScreenScale(27), ScrH() - TM.ScreenScale(65) - equipmentY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)

		surface.SetMaterial(MATS.nadeIcon)
		surface.SetDrawColor(COLORS.white)
		surface.DrawTexturedRect(equipmentX + hudX + TM.ScreenScale(10), ScrH() - TM.ScreenScale(40) - equipmentY - hudY, TM.ScreenScale(35), TM.ScreenScale(40))

		draw.DrawText(nadeText, "HUD_StreakText", equipmentX + hudX + TM.ScreenScale(27), ScrH() - TM.ScreenScale(65) - equipmentY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
	else
		surface.SetMaterial(MATS.grappleIcon)

		if Lerp((LocalPlayer():GetNWFloat("linat", CurTime()) - CurTime()) * 0.2, 0, 500) == 0 and !IsValid(LocalPlayer():SetNWEntity("lina", stando)) then
			surface.SetDrawColor(COLORS.white)
		else
			surface.SetDrawColor(255, 200, 200, 100)
			grappleText = tostring(math.floor(LocalPlayer():GetNWFloat("linat", CurTime()) - CurTime() + 1))
		end

		if equipAnchor == "left" then
			surface.DrawTexturedRect(equipmentX + hudX - TM.ScreenScale(45), ScrH() - TM.ScreenScale(40) - equipmentY - hudY, TM.ScreenScale(35), TM.ScreenScale(40))
			draw.DrawText(grappleText, "HUD_StreakText", equipmentX + hudX - TM.ScreenScale(27.5), ScrH() - TM.ScreenScale(65) - equipmentY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		elseif equipAnchor == "center" then
			surface.DrawTexturedRect(equipmentX + hudX - TM.ScreenScale(17), ScrH() - TM.ScreenScale(40) - equipmentY - hudY, TM.ScreenScale(35), TM.ScreenScale(40))
			draw.DrawText(grappleText, "HUD_StreakText", equipmentX + hudX, ScrH() - TM.ScreenScale(65) - equipmentY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		else
			surface.DrawTexturedRect(equipmentX + hudX + TM.ScreenScale(10), ScrH() - TM.ScreenScale(40) - equipmentY - hudY, TM.ScreenScale(35), TM.ScreenScale(40))
			draw.DrawText(grappleText, "HUD_StreakText", equipmentX + hudX + TM.ScreenScale(27), ScrH() - TM.ScreenScale(65) - equipmentY - hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_CENTER)
		end
	end
end

local fColor = COLORS.white
local lColor = COLORS.white
local bColor = COLORS.white
local rColor = COLORS.white
local jColor = COLORS.white
local sColor = COLORS.white
local cColor = COLORS.white

local function KPOKeyCheck()
	local actuatedColor = Color(keyoverlayActuatedR, keyoverlayActuatedG, keyoverlayActuatedB)
	local inactiveColor = Color(keyoverlayInactiveR, keyoverlayInactiveG, keyoverlayInactiveB)

	if LocalPlayer():KeyDown(IN_FORWARD) then fColor = actuatedColor else fColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_MOVELEFT) then lColor = actuatedColor else lColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_BACK) then bColor = actuatedColor else bColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_MOVERIGHT) then rColor = actuatedColor else rColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_JUMP) then jColor = actuatedColor else jColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_SPEED) then sColor = actuatedColor else sColor = inactiveColor end
	if LocalPlayer():KeyDown(IN_DUCK) then cColor = actuatedColor else cColor = inactiveColor end
end

local function RenderKPO()
	KPOKeyCheck()

	surface.SetMaterial(MATS.keyIcon)

	surface.SetDrawColor(fColor)
	surface.DrawTexturedRect(TM.ScreenScale(48) + keyoverlayX + hudX, 0 + keyoverlayY + hudY, TM.ScreenScale(42), TM.ScreenScale(42))

	surface.SetDrawColor(lColor)
	surface.DrawTexturedRect(0 + keyoverlayX + hudX, TM.ScreenScale(48) + keyoverlayY + hudY, TM.ScreenScale(42), TM.ScreenScale(42))

	surface.SetDrawColor(bColor)
	surface.DrawTexturedRect(TM.ScreenScale(48) + keyoverlayX + hudX, TM.ScreenScale(48) + keyoverlayY + hudY, TM.ScreenScale(42), TM.ScreenScale(42))

	surface.SetDrawColor(rColor)
	surface.DrawTexturedRect(TM.ScreenScale(96) + keyoverlayX + hudX, TM.ScreenScale(48) + keyoverlayY + hudY, TM.ScreenScale(42), TM.ScreenScale(42))

	surface.SetMaterial(MATS.keyIconLong)

	surface.SetDrawColor(jColor)
	surface.DrawTexturedRect(0 + keyoverlayX + hudX, TM.ScreenScale(96) + keyoverlayY + hudY, TM.ScreenScale(138), TM.ScreenScale(42))

	surface.SetMaterial(MATS.keyIconMed)

	surface.SetDrawColor(sColor)
	surface.DrawTexturedRect(0 + keyoverlayX + hudX, TM.ScreenScale(144) + keyoverlayY + hudY, TM.ScreenScale(66), TM.ScreenScale(42))

	surface.SetDrawColor(cColor)
	surface.DrawTexturedRect(TM.ScreenScale(72) + keyoverlayX + hudX, TM.ScreenScale(144) + keyoverlayY + hudY, TM.ScreenScale(66), TM.ScreenScale(42))

	draw.DrawText("W", "HUD_StreakText", TM.ScreenScale(69) + keyoverlayX + hudX, TM.ScreenScale(10) + keyoverlayY + hudY, fColor, TEXT_ALIGN_CENTER)
	draw.DrawText("A", "HUD_StreakText", TM.ScreenScale(21) + keyoverlayX + hudX, TM.ScreenScale(58) + keyoverlayY + hudY, lColor, TEXT_ALIGN_CENTER)
	draw.DrawText("S", "HUD_StreakText", TM.ScreenScale(69) + keyoverlayX + hudX, TM.ScreenScale(58) + keyoverlayY + hudY, bColor, TEXT_ALIGN_CENTER)
	draw.DrawText("D", "HUD_StreakText", TM.ScreenScale(117) + keyoverlayX + hudX, TM.ScreenScale(58) + keyoverlayY + hudY, rColor, TEXT_ALIGN_CENTER)
	draw.DrawText("JUMP", "HUD_StreakText", TM.ScreenScale(69) + keyoverlayX + hudX, TM.ScreenScale(106) + keyoverlayY + hudY, jColor, TEXT_ALIGN_CENTER)
	draw.DrawText("RUN", "HUD_StreakText", TM.ScreenScale(33) + keyoverlayX + hudX, TM.ScreenScale(154) + keyoverlayY + hudY, sColor, TEXT_ALIGN_CENTER)
	draw.DrawText("DUCK", "HUD_StreakText", TM.ScreenScale(105) + keyoverlayX + hudX, TM.ScreenScale(154) + keyoverlayY + hudY, cColor, TEXT_ALIGN_CENTER)
end

local function RenderVelocity()
	draw.DrawText(tostring(math.Round(LocalPlayer():GetVelocity():Length())) .. " u/s", "HUD_Health", velocityoverlayX + hudX, velocityoverlayY + hudY, Color(hudTextR, hudTextG, hudTextB), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

local kothInfo = KOTHPOS[game.GetMap()] or {origin = Vector(0, 0, 0), size = Vector(0, 0, 0)}
local origin = kothInfo.origin
local size = kothInfo.size

local playerAngle
local indiFade = 1

local function RenderKOTH()
	local weapon = LocalPlayer():GetActiveWeapon()

	render.SetColorMaterial()

	if LocalPlayer():GetNWBool("onOBJ") then
		render.DrawBox(origin - Vector(0, 0, -2), angle_zero, -size, size - Vector(0, 0, size[3] * 2), hillColor)

		return
	end

	render.DrawBox(origin, angle_zero, -size, size, hillColor)

	playerAngle = LocalPlayer():EyeAngles()
	playerAngle:RotateAroundAxis(playerAngle:Forward(), 90)
	playerAngle:RotateAroundAxis(playerAngle:Right(), 90)

	cam.IgnoreZ(true)
		cam.Start3D2D(origin, playerAngle, origin:Distance(LocalPlayer():GetPos()) * 0.0015 * objHUD["scale"])
			if IsValid(weapon) and (type(weapon.GetIronSights) == "function" and weapon:GetIronSights()) then
				indiFade = math.Clamp(indiFade - 7 * RealFrameTime(), 0, 1)
			else
				indiFade = math.Clamp(indiFade + 4 * RealFrameTime(), 0, 1)
			end

			draw.WordBox(0, TM.ScreenScale(8), TM.ScreenScale(-14), "Hill", "HUD_StreakText", Color(0, 0, 0, 10 * indiFade), Color(hudTextR, hudTextG, hudTextB, 255 * indiFade), TEXT_ALIGN_CENTER)
			draw.WordBox(0, 0, TM.ScreenScale(11), math.Round(origin:Distance(LocalPlayer():GetPos()) * 0.01905, 0) .. "m", "HUD_Health", Color(0, 0, 0, 10 * indiFade), Color(hudTextR, hudTextG, hudTextB, 255 * indiFade), TEXT_ALIGN_CENTER)
		cam.End3D2D()
	cam.IgnoreZ(false)
end

local kothPFP
local kothPFPUpdated = false

local function InitKOTH()
	if TM.GAMEMODE != GAMEMODES.IDS.KOTH then return end
	if IsValid(kothPFP) then return end

	kothPFP = vgui.Create("AvatarImage", GetHUDPanel())
	kothPFP:SetPos(ScrW() / 2 - TM.ScreenScale(21), TM.ScreenScale(60) + hudY)
	kothPFP:SetSize(TM.ScreenScale(42), TM.ScreenScale(42))
	kothPFP:Hide()
end
InitKOTH()

local function DrawKOTH()
	if TM.GAMEMODE != GAMEMODES.IDS.KOTH then return end
	if gameEnded then return end
	if !hudEnable then return end

	RenderKOTH()
end
hook.Add("PostDrawTranslucentRenderables", "DrawKOTH", DrawKOTH())

local function UpdateKOTH()
	if TM.GAMEMODE != GAMEMODES.IDS.KOTH then return end

	if GetGlobalBool("tm_intermission") or gameEnded or !hudEnable then
		kothPFP:Hide()

		return
	end

	kothPFP:SetY(TM.ScreenScale(60) + hudY)

	local status = GetGlobalString("tm_hillstatus")

	if status == "Empty" or status == "Contested" then
		kothPFP:Hide()
		kothPFPUpdated = false
	else
		if !kothPFPUpdated then
			kothPFP:SetPlayer(GetGlobalEntity("tm_entonhill"), 184)
		end

		kothPFPUpdated = true

		kothPFP:Show()
	end
end

local vipPFP
local currentVIP = NULL

local function InitVIP()
	if TM.GAMEMODE != GAMEMODES.IDS.VIP then return end
	if IsValid(vipPFP) then return end

	vipPFP = vgui.Create("AvatarImage", GetHUDPanel())
	vipPFP:SetPos(ScrW() / 2 - TM.ScreenScale(21), TM.ScreenScale(60) + hudY)
	vipPFP:SetSize(TM.ScreenScale(42), TM.ScreenScale(42))
	vipPFP:Hide()
end
InitVIP()

local function UpdateVIP()
	if TM.GAMEMODE != GAMEMODES.IDS.VIP then return end

	if GetGlobalBool("tm_intermission") or gameEnded or !hudEnable then
		vipPFP:Hide()

		return
	end

	vipPFP:SetY(TM.ScreenScale(60) + hudY)

	local vip = GetGlobalEntity("tm_vip", NULL)

	if vip == NULL then
		vipPFP:Hide()
		currentVIP = vip
	else
		if currentVIP != vip then
			vipPFP:SetPlayer(vip, 184)
		end

		vipPFP:Show()
	end
end

local function DrawHUD()
	UpdateKOTH()
	UpdateVIP()

	if gameEnded then return end
	if !hudEnable then return end

	if GetGlobalBool("tm_intermission") then
		HUDIntermission()

		return
	end

	-- always
	RenderInfo()
	if killfeed then RenderKillFeed() end

	-- gamemodes
	if TM.GAMEMODE == GAMEMODES.IDS.KOTH then RenderKOTH() end

	-- alive
	if LocalPlayer():Alive() then
		if crosshair then RenderCrosshair() end
		if hitmarker then RenderHitmarkers() end
		RenderHealth()
		RenderLoadout()
		if keyoverlay then RenderKPO() end
		if velocityoverlay then RenderVelocity() end
	end
end
hook.Add("HUDPaint", "DrawHUD", DrawHUD)

net.Receive("SendNotification", function(len)
	if !notifications then return end
	if !hudEnable then return end

	local notiText = net.ReadString()
	local notiType = net.ReadString()

	surface.SetFont("HUD_Health")
	local textLength = select(1, surface.GetTextSize(notiText))

	local notiIcon
	local notiColor
	local notiSecondaryColor

	if notiType == "time" then
		surface.PlaySound("tmui/timenotif.wav")
		notiIcon = MATS.notiClockIcon
		notiColor = Color(100, 0, 0, 125)
		notiSecondaryColor = Color(255, 0, 0, 50)
	elseif notiType == "level" then
		if convars["screen_flashes"] == 1 then
			LocalPlayer():ScreenFade(SCREENFADE.IN, Color(255, 255, 0, 25), 0.3, 0)
		end

		surface.PlaySound("tmui/levelup.wav")
		notiIcon = MATS.notiLevelIcon
		notiColor = Color(100, 100, 0, 125)
		notiSecondaryColor = Color(255, 255, 0, 50)
	elseif notiType == "gungame" then
		surface.PlaySound("tmui/timenotif.wav")
		notiIcon = MATS.notiKnifeIcon
		notiColor = Color(100, 0, 100, 125)
		notiSecondaryColor = Color(255, 0, 255, 50)
	elseif notiType == "warning" then
		surface.PlaySound("tmui/warning.wav")
		notiIcon = MATS.notiWarningIcon
		notiColor = Color(100, 0, 0, 125)
		notiSecondaryColor = Color(255, 0, 0, 50)
	elseif notiType == "success" then
		surface.PlaySound("tmui/success.wav")
		notiIcon = MATS.notiSuccessIcon
		notiColor = Color(0, 100, 0, 125)
		notiSecondaryColor = Color(0, 255, 0, 50)
	end

	if IsValid(notif) then notif:Remove() end

	notif = vgui.Create("DPanel", GetHUDPanel())
	notif:SetSize(0, TM.ScreenScale(42))
	notif:SizeTo(textLength + TM.ScreenScale(64), TM.ScreenScale(42), 1, 0, 0.1)
	notif:SetY(hudY)

	function notif:Paint(w, h)
		BlurPanel(self, 3)

		self:SetX(ScrW() - self:GetWide() - hudX)

		surface.SetDrawColor(Color(255, 255, 255, 155))
		surface.DrawRect(0, 0, w, TM.ScreenScale(1))
		surface.DrawRect(0, h - TM.ScreenScale(1), w, TM.ScreenScale(1))
		surface.DrawRect(0, 0, TM.ScreenScale(1), h)
		surface.DrawRect(w - TM.ScreenScale(1), 0, TM.ScreenScale(1), h)

		surface.SetDrawColor(notiColor)
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())

		surface.SetDrawColor(notiSecondaryColor)
		surface.DrawRect(0, 0, TM.ScreenScale(42), TM.ScreenScale(42))

		surface.SetMaterial(notiIcon)
		surface.SetDrawColor(COLORS.white)
		surface.DrawTexturedRect(TM.ScreenScale(3), TM.ScreenScale(3), TM.ScreenScale(36), TM.ScreenScale(36))

		draw.DrawText(notiText, "HUD_Health", TM.ScreenScale(52), TM.ScreenScale(5), COLORS.white, TEXT_ALIGN_LEFT)
	end

	timer.Create("removeNotification", 6.5, 1, function()
		notif:SizeTo(textLength + TM.ScreenScale(64), 0, 0.75, 0, 0.1, function()
			notif:Remove()
		end)
	end)
end)

function DrawTarget()
	return false
end
hook.Add("HUDDrawTargetID", "HidePlayerInfo", DrawTarget)

function DrawWeaponInfo()
	return false
end
hook.Add("HUDWeaponPickedUp", "WeaponPickedUp", DrawWeaponInfo)

function DrawAmmoInfo()
	return false
end
hook.Add("HUDAmmoPickedUp", "AmmoPickedUp", DrawAmmoInfo)

function DrawItemInfo()
	return false
end
hook.Add("HUDItemPickedUp", "ItemPickedUp", DrawItemInfo)

function HideHUD(name)
	for _, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", "CHudZoom", "CHudVoiceStatus", "CHudDamageIndicator", "CHUDQuickInfo", "CHudCrosshair", "CHudWeaponSelection"}) do
		if name == v then
			return false
		end
	end
end
hook.Add("HUDShouldDraw", "HideDefaultHUD", HideHUD)

local function VoiceIcon()
	surface.SetDrawColor(Color(255, 255, 255, 155))
	surface.DrawRect(ScrW() / 2 - TM.ScreenScale(21), TM.ScreenScale(115) + matchHUD["y"], TM.ScreenScale(42), TM.ScreenScale(1))

	surface.SetDrawColor(65, 155, 80, 115)
	surface.SetMaterial(MATS.micIcon)
	surface.DrawTexturedRect(ScrW() / 2 - TM.ScreenScale(21), TM.ScreenScale(115) + matchHUD["y"], TM.ScreenScale(42), TM.ScreenScale(42))
end

hook.Add("PlayerStartVoice", "ImageOnVoice", function(voipPly)
	if LocalPlayer() != voipPly then return true end

	hook.Add("HUDPaint", "VoiceIndicator", VoiceIcon)
	return true
end)

hook.Add("PlayerEndVoice", "ImageOnVoice", function()
	hook.Remove("HUDPaint", "VoiceIndicator")
end)

net.Receive("SendHitmarker", function(len)
	if !hitmarker then return end

	local hit_reg = "hitsound/hit_" .. sfxHit .. ".wav"
	local hit_reg_head = "hitsound/hit_head_" .. sfxHit .. ".wav"

	local hitgroup = net.ReadUInt(4)
	local soundFile

	if (hitgroup == HITGROUP_HEAD) then
		hitType = true
		soundFile = hit_reg_head
	else
		hitType = false
		soundFile = hit_reg
	end

	hitmarkerFade = hitmarkerDuration
	surface.PlaySound(soundFile)
end)

net.Receive("KillFeedUpdate", function(len)
	if !killfeed then return end

	local playersInAction = net.ReadString()
	local victimLastHitIn = net.ReadInt(5)
	local attacker = net.ReadString()
	local streak = net.ReadInt(10)

	table.insert(feedArray, {playersInAction, victimLastHitIn})

	if table.Count(feedArray) >= (killfeedLimit + 1) then
		table.remove(feedArray, 1)
	end

	timer.Create(playersInAction .. math.Round(CurTime()), 8, 1, function()
		table.remove(feedArray, 1)
	end)

	if streak % 5 == 0 and streak > 0 then
		table.insert(feedArray, {attacker .. " is on a " .. streak .. " killstreak", 0})

		if table.Count(feedArray) >= (killfeedLimit + 1) then
			table.remove(feedArray, 1)
		end

		timer.Create(attacker .. streak .. math.Round(CurTime()), 8, 1, function()
			table.remove(feedArray, 1)
		end)
	end
end)

local multiArray = {}

net.Receive("NotifyKill", function(len)
	if !hudEnable then return end
	if gameEnded then return end

	local killedPlayer = net.ReadEntity()
	local killedWith = net.ReadString()
	local killedFrom = net.ReadFloat()
	local lastHitIn = net.ReadInt(5)
	local killStreak = net.ReadInt(10)

	local accoladeList = ""

	if IsValid(killNotif) then killNotif:Remove() end
	if IsValid(DeathNotif) then DeathNotif:Remove() end

	killNotif = vgui.Create("DPanel", GetHUDPanel())
	killNotif:SetSize(ScrW(), 0)
	killNotif:SetX(0)
	killNotif:SetY(TM.ScreenScale(335))

	killNotif:SizeTo(ScrW(), TM.ScreenScale(200), 0.5, 0, 0.1)

	local skullHolder = vgui.Create("DPanel", killNotif)
	skullHolder:Center()
	skullHolder:SetPaintBackgroundEnabled(false)

	if lastHitIn == 1 then
		accoladeList = accoladeList .. "Headshot +20 | "

		table.insert(multiArray, 1)
	else

		table.insert(multiArray, 0)
	end

	for k, v in pairs(multiArray) do
		skullHolder:SetSize(k * TM.ScreenScale(55), TM.ScreenScale(50))
		skullHolder:SetY(TM.ScreenScale(55))
		skullHolder:Center()

		KillIcon = vgui.Create("DImage", skullHolder)
		KillIcon:SetPos((k - 1) * TM.ScreenScale(55) + TM.ScreenScale(2.5), 0)
		KillIcon:SetSize(TM.ScreenScale(50), 0)
		KillIcon:SetImage("icons/killicon.png")
		KillIcon:SizeTo(TM.ScreenScale(50), TM.ScreenScale(50), 0.75, 0, 0.1)

		if v == 1 then
			KillIcon:SetImageColor(COLORS.red)
		else
			KillIcon:SetImageColor(COLORS.white)
		end
	end

	if LocalPlayer():Health() <= 15 then
		accoladeList = accoladeList .. "Clutch +20 | "
	end

	if killedFrom >= 40 then
		accoladeList = accoladeList .. "Longshot +" .. killedFrom .. " | "
	end

	if killedFrom <= 3 then
		accoladeList = accoladeList .. "Point Blank +20 | "
	end

	if killedWith == "Tanto" or killedWith == "Mace" or killedWith == "KM-2000" or killedWith == "Bowie Knife" or killedWith == "Butterfly Knife" or killedWith == "Carver" or killedWith == "Dagger" or killedWith == "Fire Axe" or killedWith == "Fists" or killedWith == "Karambit" or killedWith == "Kukri" or killedWith == "M9 Bayonet" or killedWith == "Nunchucks" or killedWith == "Red Rebel" or killedWith == "Tri-Dagger" or killedWith == "Thrown Knife" then
		accoladeList = accoladeList .. "Smackdown +20 | "
	end

	if killStreak >= 3 then
		onstreakScore = 10 * killStreak
		accoladeList = accoladeList .. "On Streak +" .. onstreakScore .. " | "
	end

	if killedPlayer:GetNWInt("killStreak") >= 3 then
		buzzkillScore = 10 * killedPlayer:GetNWInt("killStreak")
		accoladeList = accoladeList ..  "Buzz Kill +" .. buzzkillScore .. " | "
	end

	local streakColor
	local orangeColor = Color(255, 200, 100)
	local redColor = Color(255, 50, 50)
	local rainbowSpeed = 160
	local rainbowColor = HSVToColor((CurTime() * rainbowSpeed) % 360, 1, 1)

	-- dynamic text color depending on the killstreak of the player
	if killStreak <= 2 then
		streakColor = COLORS.white
	elseif killStreak <= 4 then
		streakColor = orangeColor
	elseif killStreak <= 6 then
		streakColor = redColor
	end

	killNotif.Paint = function(self, w, h)
		if !IsValid(killedPlayer) then killNotif:Remove() return end
		if killStreak >= 7 then streakColor = rainbowColor end
		rainbowColor = HSVToColor((CurTime() * rainbowSpeed) % 360, 1, 1)

		if killStreak > 1 then draw.SimpleText(killStreak .. " Kills", "HUD_StreakText", w / 2, TM.ScreenScale(25), streakColor, TEXT_ALIGN_CENTER) end
		draw.SimpleText(killedPlayer:Nick(), "HUD_PlayerNotiName", w / 2, TM.ScreenScale(100), COLORS.white, TEXT_ALIGN_CENTER)
		draw.SimpleText(string.sub(accoladeList, 1, -4), "HUD_StreakText", w / 2, TM.ScreenScale(160), COLORS.white, TEXT_ALIGN_CENTER)
	end

	killNotif:Show()
	killNotif:MakePopup()
	killNotif:SetMouseInputEnabled(false)
	killNotif:SetKeyboardInputEnabled(false)

	if sounds["kill_enabled"] == 1 then
		if lastHitIn == 1 then surface.PlaySound("hitsound/kill_" .. sounds["hs_kill"] .. ".wav") else surface.PlaySound("hitsound/kill_" .. sounds["kill"] .. ".wav") end
	end

	timer.Create("killNotification", 3.5, 1, function()
		if IsValid(killNotif) then
			killNotif:MoveTo(0, ScrH(), 0.5, 0, 0.15)
			killNotif:SizeTo(ScrW(), 0, 0.5, 0, 0.1, function()
				killNotif:Remove()
				table.Empty(multiArray)
			end)
			KillIcon:SizeTo(TM.ScreenScale(50), 0, 0.25, 0, 0.1, function()
				KillIcon:Remove()
			end)
		end
	end)
end )

-- displays after a player dies to another player
net.Receive("NotifyDeath", function(len)
	if timer.Exists("CrankedTimeUntilDeath") then hook.Remove("Think", "CrankedTimeLeft") end
	timeUntilSelfDestruct = 0
	if convars["hud_enable"] == 0 then return end
	if gameEnded then return end

	local killedBy = net.ReadEntity()
	local killedWith = net.ReadString()
	local killedFrom = net.ReadFloat()
	local lastHitIn = net.ReadInt(5)
	local respawnTimeLeft = 4

	if IsValid(killNotif) then killNotif:Remove() end
	if IsValid(DeathNotif) then DeathNotif:Remove() end

	table.Empty(multiArray)



	timer.Create("respawnTimeHideHud", 4, 1, function()
		DeathNotif:Remove()
		hook.Remove("Think", "ShowRespawnTime")
	end)

	hook.Add("Think", "ShowRespawnTime", function() if timer.Exists("respawnTimeHideHud") then respawnTimeLeft = math.Round(timer.TimeLeft("respawnTimeHideHud"), 1) end end)

	DeathNotif = vgui.Create("DFrame")
	DeathNotif:SetSize(ScrW(), TM.ScreenScale(300))
	DeathNotif:SetX(0)
	DeathNotif:SetY(ScrH() - TM.ScreenScale(335))
	DeathNotif:SetTitle("")
	DeathNotif:SetDraggable(false)
	DeathNotif:ShowCloseButton(false)
	DeathNotif:SetAlpha(0)

	DeathNotif:AlphaTo(255, 0.05, 0)

	DeathNotif.Paint = function(self, w, h)
		if !IsValid(killedBy) then DeathNotif:Remove() return end

		if lastHitIn == 1 then
			draw.SimpleText(killedFrom .. "m" .. " HS", "HUD_WepNameKill", w / 2 + TM.ScreenScale(10), TM.ScreenScale(151), COLORS.red, TEXT_ALIGN_LEFT)
		else
			draw.SimpleText(killedFrom .. "m", "HUD_WepNameKill", w / 2 + TM.ScreenScale(10), TM.ScreenScale(151), COLORS.white, TEXT_ALIGN_LEFT)
		end

		draw.SimpleText("Killed by", "HUD_StreakText", w / 2, TM.ScreenScale(-3), COLORS.white, TEXT_ALIGN_CENTER)
		draw.SimpleText("|", "HUD_PlayerDeathName", w / 2, TM.ScreenScale(117.5), COLORS.white, TEXT_ALIGN_CENTER)
		draw.SimpleText("|", "HUD_PlayerDeathName", w / 2, TM.ScreenScale(142), COLORS.white, TEXT_ALIGN_CENTER)
		draw.SimpleText(killedBy:Nick(), "HUD_PlayerDeathName", w / 2 - TM.ScreenScale(10), TM.ScreenScale(117.5), COLORS.white, TEXT_ALIGN_RIGHT)
		draw.SimpleText(killedWith, "HUD_PlayerDeathName", w / 2 + TM.ScreenScale(10), TM.ScreenScale(117.5), COLORS.white, TEXT_ALIGN_LEFT)

		if killedBy:Health() <= 0 then
			draw.SimpleText("DEAD", "HUD_WepNameKill", w / 2 - TM.ScreenScale(10), TM.ScreenScale(151), COLORS.red, TEXT_ALIGN_RIGHT)
		else
			draw.SimpleText(killedBy:Health() .. "HP", "HUD_WepNameKill", w / 2 - TM.ScreenScale(10), TM.ScreenScale(151), COLORS.white, TEXT_ALIGN_RIGHT)
		end

		draw.SimpleText("Respawning in " .. respawnTimeLeft .. "s", "HUD_StreakText", w / 2 - TM.ScreenScale(10), TM.ScreenScale(192), COLORS.white, TEXT_ALIGN_CENTER)
		draw.SimpleText("Press [" .. string.upper(input.GetKeyName(convars["menu_bind"])) .. "] to open menu", "HUD_WepNameKill", w / 2, TM.ScreenScale(211), COLORS.white, TEXT_ALIGN_CENTER)
	end

	KilledByCallingCard = vgui.Create("DImage", DeathNotif)
	KilledByCallingCard:SetPos(ScrW() / 2 - TM.ScreenScale(120), TM.ScreenScale(20))
	KilledByCallingCard:SetSize(TM.ScreenScale(240), TM.ScreenScale(80))
	if IsValid(killedBy) then KilledByCallingCard:SetImage(killedBy:GetNWString("chosenPlayercard"), "cards/color/black.png") end

	KilledByPlayerProfilePicture = vgui.Create("AvatarImage", KilledByCallingCard)
	KilledByPlayerProfilePicture:SetPos(TM.ScreenScale(5), TM.ScreenScale(5))
	KilledByPlayerProfilePicture:SetSize(TM.ScreenScale(70), TM.ScreenScale(70))
	KilledByPlayerProfilePicture:SetPlayer(killedBy, 184)

	if convars["screen_flashes"] == 1 then
		LocalPlayer():ScreenFade(SCREENFADE.IN, Color(255, 0, 0, 45), 0.3, 0)
	end

	DeathNotif:Show()
	DeathNotif:MakePopup()
	DeathNotif:SetMouseInputEnabled(false)
	DeathNotif:SetKeyboardInputEnabled(false)
end)

-- displays to all players when a map vote begins
net.Receive("EndOfGame", function(len)
	gameEnded = true

	local winningPlayer
	local wonMatch = false
	local mapPicked = 0
	local mapPickedName = ""
	local gamemodePicked
	local mapDecided = false
	local gamemodeDecided = false
	local decidedMap
	local decidedMode
	local VOIPActive = false
	local MuteActive = false
	local bonusXP = 750

	net.Receive("MapVoteSkipped", function(len)
		decidedMap = net.ReadString()
		decidedMode = net.ReadInt(5)
	end)

	if IsValid(killNotif) then killNotif:Remove() end
	if IsValid(DeathNotif) then DeathNotif:Remove() end
	if IsValid(EndOfGameUI) then EndOfGameUI:Remove() end
	if IsValid(kothPFP) then kothPFP:Remove() end
	if IsValid(VIPPFP) then VIPPFP:Remove() end

	hook.Remove("Think", "UpdateKOTHPFP")
	hook.Remove("Think", "UpdateVIPPFP")
	hook.Remove("PlayerStartVoice", "ImageOnVoice")
	hook.Remove("PlayerEndVoice", "ImageOnVoice")

	hook.Add("Think", "RenderEORBehindPauseMenu", function()
		if !IsValid(EndOfGameUI) then return end

		if !gui.IsGameUIVisible() then
			EndOfGameUI:Show()
		else
			EndOfGameUI:Hide()
		end
	end)

	local firstMap = net.ReadString()
	local secondMap = net.ReadString()
	local thirdMap = net.ReadString()
	local firstMode = net.ReadInt(5)
	local secondMode = net.ReadInt(5)

	local firstMapName
	local firstMapThumb
	local secondMapName
	local secondMapThumb
	local thirdMapName
	local thirdMapThumb
	local decidedMapName
	local decidedMapThumb
	local firstModeName
	local firstModeDesc
	local secondModeName
	local secondModeDesc
	local decidedModeName

	for _, t in ipairs(MAPS) do
		if firstMap == t[1] then
			firstMapName = t[2]
			firstMapThumb = t[3]
		end

		if secondMap == t[1] then
			secondMapName = t[2]
			secondMapThumb = t[3]
		end

		if thirdMap == t[1] then
			thirdMapName = t[2]
			thirdMapThumb = t[3]
		end
	end

	for id, info in ipairs(GAMEMODES.MODES) do
		if firstMode == id then
			firstModeName = info.name
			firstModeDesc = info.desc
		end

		if secondMode == id then
			secondModeName = info.name
			secondModeDesc = info.desc
		end
	end

	local timeUntilNextMatch = 33
	local VotingActive = false

	local connectedPlayers = player.GetHumans()

	if TM.GAMEMODE == GAMEMODES.IDS.GUNGAME then
		table.sort(connectedPlayers, function(a, b) return a:GetNWInt("ladderPosition") > b:GetNWInt("ladderPosition") end)
	else
		table.sort(connectedPlayers, function(a, b) return a:GetNWInt("playerScoreMatch") > b:GetNWInt("playerScoreMatch") end)
	end

	local gradLColor
	local gradRColor

	if math.random(0, 1) == 0 then
		gradLColor = Color(100, 0, 255, 6)
		gradRColor = Color(100, 255, 255, 12)
	else
		gradLColor = Color(100, 255, 255, 6)
		gradRColor = Color(100, 0, 255, 12)
	end

	timer.Create("timeUntilNextMatch", 32, 1, function()
		hook.Add("Think", "RenderBehindPauseMenu", function()
			if !IsValid(LoadingPrompt) then return end
			if !gui.IsGameUIVisible() then LoadingPrompt:Show() else LoadingPrompt:Hide() end
		end)

		LoadingPrompt = vgui.Create("DFrame")
		LoadingPrompt:SetSize(ScrW(), ScrH())
		LoadingPrompt:Center()
		LoadingPrompt:SetTitle("")
		LoadingPrompt:SetDraggable(false)
		LoadingPrompt:ShowCloseButton(false)
		LoadingPrompt:SetDeleteOnClose(false)
		LoadingPrompt:MakePopup()

		LoadingPrompt.Paint = function(self, w, h)
			BlurPanel(LoadingPrompt, 10)
			surface.SetDrawColor(35, 35, 35, 165)
			surface.DrawRect(0, 0, LoadingPrompt:GetWide(), LoadingPrompt:GetTall())

			surface.SetMaterial(MATS.gradientL)
			surface.SetDrawColor(gradLColor)
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

			surface.SetMaterial(MATS.gradientR)
			surface.SetDrawColor(gradRColor)
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

			draw.SimpleText("LOADING NEXT MATCH", "QuoteText", w / 2, h / 2, COLORS.white, TEXT_ALIGN_CENTER)
		end
	end)

	timer.Create("ShowVotingMenu", 8, 1, function() StartVotingPhase() end)

	-- determine who won the match
	for k, v in ipairs(connectedPlayers) do
		if k == 1 then
			winningPlayer = v
		end
	end

	if winningPlayer == LocalPlayer() then
		wonMatch = true
		bonusXP = 1500
	end

	local expandTime = 4

	local anchorAnim = ScrH() / 2 - TM.MenuScale(110)
	timer.Create("ExpandDetails", expandTime, 1, function()
		anchorAnim = ScrH() / 2 - TM.MenuScale(220)
		ExpandDetails()
	end)

	function HideHudPostGame(name)
		for _, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", "CHudZoom", "CHudVoiceStatus", "CHudDamageIndicator", "CHUDQuickInfo", "CHudCrosshair"}) do
			if name == v then return false end
		end
	end
	hook.Add("HUDShouldDraw", "HideDefaultHudPostGame", HideHudPostGame)

	local MatchEndMusic
	local textAnim = ScrH()
	local textAnimTwo = ScrH()
	local levelAnim = 0
	local xpCountUp = 0
	local quote = QUOTES[math.random(#QUOTES)]

	if wonMatch == true then
		LocalPlayer():ScreenFade(SCREENFADE.OUT, Color(50, 50, 0, 190), 1, 7)
		MatchEndMusic = CreateSound(LocalPlayer(), "music/matchvictory_" .. math.random(1, 3) .. ".mp3")
		MatchEndMusic:Play()
		MatchEndMusic:ChangeVolume(convars["music_volume"] * 0.75)

		MatchWinLoseText = vgui.Create("DPanel")
		MatchWinLoseText:SetSize(TM.MenuScale(800), TM.MenuScale(220))
		MatchWinLoseText:SetPos(ScrW() / 2 - TM.MenuScale(400), ScrH())
		MatchWinLoseText:MakePopup()
		MatchWinLoseText.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
			textAnim = math.Clamp(textAnim - TM.MenuScale(1500) * FrameTime(), anchorAnim, ScrH())
			MatchWinLoseText:SetY(textAnim)

			draw.SimpleText("VICTORY", "MatchEndText", w / 2, h / 2 - TM.MenuScale(90), COLORS.white, TEXT_ALIGN_CENTER)
			draw.SimpleText(quote, "QuoteText", w / 2, h / 2 + TM.MenuScale(60), COLORS.white, TEXT_ALIGN_CENTER)
		end
	else
		LocalPlayer():ScreenFade(SCREENFADE.OUT, Color(50, 0, 0, 190), 1, 7)
		MatchEndMusic = CreateSound(LocalPlayer(), "music/matchdefeat_" .. math.random(1, 3) .. ".mp3")
		MatchEndMusic:Play()
		MatchEndMusic:ChangeVolume(convars["music_volume"])

		MatchWinLoseText = vgui.Create("DPanel")
		MatchWinLoseText:SetSize(TM.MenuScale(800), TM.MenuScale(220))
		MatchWinLoseText:SetPos(ScrW() / 2 - TM.MenuScale(400), ScrH())
		MatchWinLoseText:MakePopup()
		MatchWinLoseText.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
			textAnim = math.Clamp(textAnim - TM.MenuScale(1500) * FrameTime(), anchorAnim, ScrH())
			MatchWinLoseText:SetY(textAnim)

			draw.SimpleText("DEFEAT", "MatchEndText", w / 2, h / 2 - TM.MenuScale(90), COLORS.white, TEXT_ALIGN_CENTER)
			draw.SimpleText(quote, "QuoteText", w / 2, h / 2 + TM.MenuScale(60), COLORS.white, TEXT_ALIGN_CENTER)
		end
	end

	function ExpandDetails()
		DetailsPanel = vgui.Create("DPanel")
		DetailsPanel:SetSize(TM.MenuScale(800), TM.MenuScale(220))
		DetailsPanel:SetPos(ScrW() / 2 - TM.MenuScale(400), ScrH())
		DetailsPanel:MakePopup()
		DetailsPanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
			textAnimTwo = math.Clamp(textAnimTwo - TM.MenuScale(3000) * FrameTime(), ScrH() / 2, ScrH())
			DetailsPanel:SetY(textAnimTwo)
			if LocalPlayer():GetNWInt("playerLevel") != 60 then
				levelAnim = math.Clamp(levelAnim + (LocalPlayer():GetNWInt("playerXP") / LocalPlayer():GetNWInt("playerXPToNextLevel")) * FrameTime(), 0, LocalPlayer():GetNWInt("playerXP") / LocalPlayer():GetNWInt("playerXPToNextLevel"))
				xpCountUp = math.Clamp(xpCountUp + LocalPlayer():GetNWInt("playerXP") * FrameTime(), 0, LocalPlayer():GetNWInt("playerXP"))

				surface.SetDrawColor(30, 30, 30, 150)
				surface.DrawRect(w / 2 - TM.MenuScale(300), TM.MenuScale(50), TM.MenuScale(600), TM.MenuScale(15))
				surface.SetDrawColor(255, 255, 255)
				surface.DrawRect(w / 2 - TM.MenuScale(300), TM.MenuScale(50), levelAnim * TM.MenuScale(600), TM.MenuScale(15))
				draw.SimpleText(LocalPlayer():GetNWInt("playerLevel"), "StreakText", w / 2 - TM.MenuScale(300), TM.MenuScale(25), COLORS.white, TEXT_ALIGN_LEFT)
				draw.SimpleText(LocalPlayer():GetNWInt("playerLevel") + 1, "StreakText", w / 2 + TM.MenuScale(300), TM.MenuScale(25), COLORS.white, TEXT_ALIGN_RIGHT)
				draw.SimpleText(math.Round(xpCountUp) .. " / " .. LocalPlayer():GetNWInt("playerXPToNextLevel") .. "XP  ^", "StreakText", (w / 2 - TM.MenuScale(295)) + (levelAnim * TM.MenuScale(600)), TM.MenuScale(75), COLORS.white, TEXT_ALIGN_RIGHT)
				draw.SimpleText("Earned " .. LocalPlayer():GetNWInt("playerScoreMatch") .. "XP + " .. bonusXP .. "XP Bonus", "StreakText", w / 2, TM.MenuScale(100), COLORS.white, TEXT_ALIGN_CENTER)
			else
				levelAnim = math.Clamp(levelAnim + (1 / 1) * FrameTime(), 0, 1)

				surface.SetDrawColor(30, 30, 30, 150)
				surface.DrawRect(w / 2 - TM.MenuScale(300), TM.MenuScale(50), TM.MenuScale(600), TM.MenuScale(15))
				surface.SetDrawColor(255, 255, 255)
				surface.DrawRect(w / 2 - TM.MenuScale(300), TM.MenuScale(50), levelAnim * TM.MenuScale(600), TM.MenuScale(15))
				draw.SimpleText("MAX LEVEL", "StreakText", w / 2, TM.MenuScale(25), COLORS.white, TEXT_ALIGN_CENTER)
				draw.SimpleText("Prestige at the Main Menu", "StreakText", w / 2, TM.MenuScale(65), COLORS.white, TEXT_ALIGN_CENTER)
			end
		end
	end

	hook.Add("Think", "VotingTimerUpdate", function() if timer.Exists("timeUntilNextMatch") then timeUntilNextMatch = math.Round(timer.TimeLeft("timeUntilNextMatch")) end end)

	EndOfGameUI = vgui.Create("DFrame")
	EndOfGameUI:SetSize(ScrW(), ScrH())
	EndOfGameUI:SetPos(0, 0)
	EndOfGameUI:SetTitle("")
	EndOfGameUI:SetDraggable(false)
	EndOfGameUI:ShowCloseButton(false)
	EndOfGameUI:MakePopup()
	EndOfGameUI.Paint = function(self, w, h)
		if VotingActive == false then return end
		BlurPanel(EndOfGameUI, 10)
		draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50, 225))
		if timeUntilNextMatch > 10 then
			draw.SimpleText("Voting ends in " .. timeUntilNextMatch - 10 .. "s", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(55), COLORS.white, TEXT_ALIGN_LEFT)
			draw.SimpleText("Match begins in " .. timeUntilNextMatch .. "s", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(30), COLORS.white, TEXT_ALIGN_LEFT)
		else
			draw.SimpleText("Match begins in " .. timeUntilNextMatch .. "s", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(30), COLORS.white, TEXT_ALIGN_LEFT)
		end
		if VOIPActive == true then draw.DrawText("MIC ENABLED", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(235), Color(0, 255, 0), TEXT_ALIGN_LEFT) else draw.DrawText("MIC DISABLED", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(235), Color(255, 0, 0), TEXT_ALIGN_LEFT) end
		if MuteActive == false then draw.DrawText("NOT MUTED", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(260), Color(0, 255, 0), TEXT_ALIGN_LEFT) else draw.DrawText("MUTED", "MainMenuLoadoutWeapons", TM.MenuScale(485), ScrH() - TM.MenuScale(260), Color(255, 0, 0), TEXT_ALIGN_LEFT) end
		draw.SimpleText("Had fun?", "MainMenuLoadoutWeapons", TM.MenuScale(700), ScrH() - TM.MenuScale(55), COLORS.white, TEXT_ALIGN_LEFT)

		surface.SetFont("MainMenuLoadoutWeapons")
		for k, v in pairs(chatArray) do
			surface.SetDrawColor(25, 25, 25, 100)
			local textLength = select(1, surface.GetTextSize(v))

			surface.DrawRect(TM.MenuScale(485), TM.MenuScale(50) + ((k - 1) * TM.MenuScale(35)), textLength + TM.MenuScale(5), TM.MenuScale(30))
			draw.SimpleText(v, "MainMenuLoadoutWeapons", TM.MenuScale(487), TM.MenuScale(64) + ((k - 1) * TM.MenuScale(35)), COLORS.white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end

	function StartVotingPhase()
		if IsValid(MatchWinLoseText) then MatchWinLoseText:Remove() end
		if IsValid(DetailsPanel) then DetailsPanel:Remove() end

		LocalPlayer():SetDSP(0)
		MatchEndMusic:ChangeVolume(0.2)
		VotingActive = true

		local EndOfGamePanel = vgui.Create("DPanel", EndOfGameUI)
		EndOfGamePanel:SetSize(TM.MenuScale(475), ScrH())
		EndOfGamePanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
		end

		local MatchInformationPanel = vgui.Create("DPanel", EndOfGamePanel)
		MatchInformationPanel:Dock(TOP)
		MatchInformationPanel:SetSize(0, TM.MenuScale(50))
		MatchInformationPanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
			draw.SimpleText("MATCH RESULTS", "GunPrintName", TM.MenuScale(237.5), TM.MenuScale(-3), COLORS.white, TEXT_ALIGN_CENTER)
		end

		local modeOneVotes = 0
		local modeTwoVotes = 0
		local mapOneVotes = 0
		local mapTwoVotes = 0
		local mapThreeVotes = 0
		local VotingPanel = vgui.Create("DPanel", EndOfGamePanel)
		VotingPanel:Dock(BOTTOM)
		VotingPanel:SetSize(0, TM.MenuScale(290))
		VotingPanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
			if mapDecided == false then
				if GetGlobalInt("VotesOnMapOne", 0) != 0 or GetGlobalInt("VotesOnMapTwo", 0) != 0 or GetGlobalInt("VotesOnMapThree", 0) != 0 then
					mapOneVotes = math.Round(GetGlobalInt("VotesOnMapOne", 0) / (GetGlobalInt("VotesOnMapOne", 0) + GetGlobalInt("VotesOnMapTwo", 0) + GetGlobalInt("VotesOnMapThree", 0)) * 100)
					mapTwoVotes = math.Round(GetGlobalInt("VotesOnMapTwo") / (GetGlobalInt("VotesOnMapTwo", 0) + GetGlobalInt("VotesOnMapOne", 0) + GetGlobalInt("VotesOnMapThree", 0)) * 100)
					mapThreeVotes = math.Round(GetGlobalInt("VotesOnMapThree") / (GetGlobalInt("VotesOnMapThree", 0) + GetGlobalInt("VotesOnMapOne", 0) + GetGlobalInt("VotesOnMapTwo", 0)) * 100)
				end
				if mapPicked == 1 then draw.RoundedBox(0, TM.MenuScale(10), TM.MenuScale(80), TM.MenuScale(145), TM.MenuScale(5), Color(50, 125, 50, 75)) end
				if mapPicked == 2 then draw.RoundedBox(0, TM.MenuScale(165), TM.MenuScale(80), TM.MenuScale(145), TM.MenuScale(5), Color(50, 125, 50, 75)) end
				if mapPicked == 3 then draw.RoundedBox(0, TM.MenuScale(320), TM.MenuScale(80), TM.MenuScale(145), TM.MenuScale(5), Color(50, 125, 50, 75)) end
				draw.SimpleText("MAP VOTE", "GunPrintName", w / 2, TM.MenuScale(5), COLORS.white, TEXT_ALIGN_CENTER)

				draw.SimpleText(firstMapName, "MainMenuLoadoutWeapons", TM.MenuScale(10), TM.MenuScale(260), COLORS.white, TEXT_ALIGN_LEFT)
				draw.SimpleText(secondMapName, "MainMenuLoadoutWeapons", w / 2, TM.MenuScale(260), COLORS.white, TEXT_ALIGN_CENTER)
				draw.SimpleText(thirdMapName, "MainMenuLoadoutWeapons", TM.MenuScale(465), TM.MenuScale(260), COLORS.white, TEXT_ALIGN_RIGHT)
				draw.SimpleText(mapOneVotes .. "% | " .. mapTwoVotes .. "% | " .. mapThreeVotes .. "%", "StreakText", w / 2, TM.MenuScale(55), COLORS.white, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("NEXT MAP", "GunPrintName", w / 2, TM.MenuScale(5), COLORS.white, TEXT_ALIGN_CENTER)
				draw.SimpleText(decidedMapName, "MainMenuLoadoutWeapons", w / 2, TM.MenuScale(255), COLORS.white, TEXT_ALIGN_CENTER)
			end
		end

		local GamemodePanel = vgui.Create("DPanel", EndOfGamePanel)
		GamemodePanel:Dock(BOTTOM)
		GamemodePanel:SetSize(0, TM.MenuScale(100))
		GamemodePanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
			if gamemodeDecided == false then
				if GetGlobalInt("VotesOnModeOne", 0) != 0 or GetGlobalInt("VotesOnModeTwo", 0) != 0 then
					modeOneVotes = math.Round(GetGlobalInt("VotesOnModeOne", 0) / (GetGlobalInt("VotesOnModeOne", 0) + GetGlobalInt("VotesOnModeTwo", 0)) * 100)
					modeTwoVotes = math.Round(GetGlobalInt("VotesOnModeTwo") / (GetGlobalInt("VotesOnModeTwo", 0) + GetGlobalInt("VotesOnModeOne", 0)) * 100)
				end
				if gamemodePicked == 1 then draw.RoundedBox(0, TM.MenuScale(10), TM.MenuScale(62.5), TM.MenuScale(175), TM.MenuScale(9), Color(50, 125, 50, 75)) end
				if gamemodePicked == 2 then draw.RoundedBox(0, TM.MenuScale(290), TM.MenuScale(62.5), TM.MenuScale(175), TM.MenuScale(9), Color(50, 125, 50, 75)) end
				draw.SimpleText("GAMEMODE VOTE", "GunPrintName", w / 2, TM.MenuScale(5), COLORS.white, TEXT_ALIGN_CENTER)
				draw.SimpleText(modeOneVotes .. "% | " .. modeTwoVotes .. "%", "StreakText", w / 2, TM.MenuScale(72), COLORS.white, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("NEXT MODE", "GunPrintName", w / 2, TM.MenuScale(5), COLORS.white, TEXT_ALIGN_CENTER)
				draw.SimpleText(decidedModeName, "MainMenuLoadoutWeapons", w / 2, TM.MenuScale(65), COLORS.white, TEXT_ALIGN_CENTER)
			end
		end

		local MapChoice = vgui.Create("DImageButton", VotingPanel)
		local MapChoiceTwo = vgui.Create("DImageButton", VotingPanel)
		local MapChoiceThree = vgui.Create("DImageButton", VotingPanel)
		local ModeChoice = vgui.Create("DButton", GamemodePanel)
		local ModeChoiceTwo = vgui.Create("DButton", GamemodePanel)

		MapChoice:SetPos(TM.MenuScale(10), TM.MenuScale(85))
		MapChoice:SetText("")
		MapChoice:SetSize(TM.MenuScale(145), TM.MenuScale(175))
		MapChoice:SetImage(firstMapThumb)
		MapChoice:SetDepressImage(false)
		MapChoice.DoClick = function()
			net.Start("ReceiveMapVote")
				net.WriteString(firstMap)
				net.WriteString(mapPickedName)
				net.WriteUInt(1, 3)
				net.WriteUInt(mapPicked, 3)
			net.SendToServer()

			mapPicked = 1
			mapPickedName = firstMap

			surface.PlaySound("buttons/button15.wav")

			MapChoice:SetEnabled(false)
			MapChoiceTwo:SetEnabled(true)
			MapChoiceThree:SetEnabled(true)
		end

		MapChoiceTwo:SetPos(TM.MenuScale(165), TM.MenuScale(85))
		MapChoiceTwo:SetText("")
		MapChoiceTwo:SetSize(TM.MenuScale(145), TM.MenuScale(175))
		MapChoiceTwo:SetImage(secondMapThumb)
		MapChoiceTwo:SetDepressImage(false)
		MapChoiceTwo.DoClick = function()
			net.Start("ReceiveMapVote")
				net.WriteString(secondMap)
				net.WriteString(mapPickedName)
				net.WriteUInt(2, 3)
				net.WriteUInt(mapPicked, 3)
			net.SendToServer()

			mapPicked = 2
			mapPickedName = secondMap

			surface.PlaySound("buttons/button15.wav")

			MapChoice:SetEnabled(true)
			MapChoiceTwo:SetEnabled(false)
			MapChoiceThree:SetEnabled(true)
		end

		MapChoiceThree:SetPos(TM.MenuScale(320), TM.MenuScale(85))
		MapChoiceThree:SetText("")
		MapChoiceThree:SetSize(TM.MenuScale(145), TM.MenuScale(175))
		MapChoiceThree:SetImage(thirdMapThumb)
		MapChoiceThree:SetDepressImage(false)
		MapChoiceThree.DoClick = function()
			net.Start("ReceiveMapVote")
				net.WriteString(thirdMap)
				net.WriteString(mapPickedName)
				net.WriteUInt(3, 3)
				net.WriteUInt(mapPicked, 3)
			net.SendToServer()

			mapPicked = 3
			mapPickedName = thirdMap

			surface.PlaySound("buttons/button15.wav")

			MapChoice:SetEnabled(true)
			MapChoiceTwo:SetEnabled(true)
			MapChoiceThree:SetEnabled(false)
		end

		ModeChoice:SetPos(TM.MenuScale(10), TM.MenuScale(70))
		ModeChoice:SetText(firstModeName)
		ModeChoice:SetSize(TM.MenuScale(175), TM.MenuScale(30))
		ModeChoice:SetTooltip(firstModeDesc)
		ModeChoice.DoClick = function()
			net.Start("ReceiveModeVote")
				net.WriteInt(firstMode, 5)
				net.WriteInt(secondMode, 5)
				net.WriteUInt(1, 2)
			net.SendToServer()

			gamemodePicked = 1

			surface.PlaySound("buttons/button15.wav")

			ModeChoice:SetEnabled(false)
			ModeChoiceTwo:SetEnabled(true)
		end

		ModeChoiceTwo:SetPos(TM.MenuScale(290), TM.MenuScale(70))
		ModeChoiceTwo:SetText(secondModeName)
		ModeChoiceTwo:SetSize(TM.MenuScale(175), TM.MenuScale(30))
		ModeChoiceTwo:SetTooltip(secondModeDesc)
		ModeChoiceTwo.DoClick = function()
			net.Start("ReceiveModeVote")
				net.WriteInt(secondMode, 5)
				net.WriteInt(firstMode, 5)
				net.WriteUInt(2, 2)
			net.SendToServer()

			gamemodePicked = 2

			surface.PlaySound("buttons/button15.wav")

			ModeChoice:SetEnabled(true)
			ModeChoiceTwo:SetEnabled(false)
		end

		function MapVoteCompleted()
			for _, m in ipairs(MAPS) do
				if decidedMap == m[1] then
					decidedMapName = m[2]
					decidedMapThumb = m[3]
				end
			end

			for id, info in ipairs(GAMEMODES.MODES) do
				if decidedMode == id then
					decidedModeName = info.name
				end
			end

			mapDecided = true
			gamemodeDecided = true
			MapChoice:Remove()
			MapChoiceTwo:Remove()
			MapChoiceThree:Remove()
			ModeChoice:Remove()
			ModeChoiceTwo:Remove()

			local DecidedMapThumb = vgui.Create("DImage", VotingPanel)
			DecidedMapThumb:SetPos(TM.MenuScale(150), TM.MenuScale(70))
			DecidedMapThumb:SetSize(TM.MenuScale(175), TM.MenuScale(175))
			DecidedMapThumb:SetImage(decidedMapThumb)
		end

		if !voting:GetBool() then
			MapVoteCompleted()
		end

		net.Receive("MapVoteCompleted", function(len)
			decidedMap = net.ReadString()
			decidedMode = net.ReadInt(5)
			MapVoteCompleted()
		end )

		local DiscordButton = vgui.Create("DButton", EndOfGameUI)
		DiscordButton:SetPos(TM.MenuScale(700), ScrH() - TM.MenuScale(35))
		DiscordButton:SetText("")
		DiscordButton:SetSize(TM.MenuScale(255), TM.MenuScale(100))
		local textAnim = 0
		DiscordButton.Paint = function()
			if DiscordButton:IsHovered() then
				textAnim = math.Clamp(textAnim + TM.MenuScale(200) * FrameTime(), 0, TM.MenuScale(20))
			else
				textAnim = math.Clamp(textAnim - TM.MenuScale(200) * FrameTime(), 0, TM.MenuScale(20))
			end
			draw.DrawText("JOIN THE DISCORD!", "MainMenuLoadoutWeapons", textAnim, TM.MenuScale(5), Color(114, 137, 218), TEXT_ALIGN_LEFT)
		end
		DiscordButton.DoClick = function()
			surface.PlaySound("tmui/buttonclick.wav")
			gui.OpenURL("https://discord.gg/GRfvt27uGF")
		end

		local VOIPButton = vgui.Create("DImageButton", EndOfGameUI)
		VOIPButton:SetPos(TM.MenuScale(485), ScrH() - TM.MenuScale(205))
		VOIPButton:SetImage("icons/mutedmicrophoneicon.png")
		VOIPButton:SetSize(TM.MenuScale(80), TM.MenuScale(80))
		VOIPButton:SetTooltip("Toggle Microphone")
		VOIPButton.DoClick = function()
			surface.PlaySound("tmui/buttonclick.wav")
			if permissions.IsGranted("voicerecord") == true then
				if (VOIPActive == false) then
					VOIPActive = true
					VOIPButton:SetImage("icons/microphoneicon.png")
					permissions.EnableVoiceChat(true)
				else
					VOIPActive = false
					VOIPButton:SetImage("icons/mutedmicrophoneicon.png")
					permissions.EnableVoiceChat(false)
				end
			else
				permissions.EnableVoiceChat(true)
			end
		end

		local MuteButton = vgui.Create("DImageButton", EndOfGameUI)
		MuteButton:SetPos(TM.MenuScale(575), ScrH() - TM.MenuScale(205))
		MuteButton:SetImage("icons/muteicon.png")
		MuteButton:SetSize(TM.MenuScale(80), TM.MenuScale(80))
		MuteButton:SetTooltip("Toggle Mute")
		MuteButton.DoClick = function()
			surface.PlaySound("tmui/buttonclick.wav")
			if (MuteActive == false) then
				MuteActive = true
				MuteButton:SetImage("icons/mutedmuteicon.png")

				net.Start("ReceivePostGameMute")
					net.WriteBool(true)
				net.SendToServer()
			else
				MuteActive = false
				MuteButton:SetImage("icons/muteicon.png")

				net.Start("ReceivePostGameMute")
					net.WriteBool(false)
				net.SendToServer()
			end
		end

		local ChatTextBox = vgui.Create("DTextEntry", EndOfGameUI)
		ChatTextBox:SetPos(TM.MenuScale(485), TM.MenuScale(5))
		ChatTextBox:SetSize(TM.MenuScale(200), TM.MenuScale(35))
		ChatTextBox:SetPlaceholderText("Press ENTER to send message")
		ChatTextBox.OnEnter = function(self)
			if self:GetValue() == "" then return end
			RunConsoleCommand("say", self:GetValue())
		end

		local PlayerScrollPanel = vgui.Create("DScrollPanel", EndOfGamePanel)
		PlayerScrollPanel:Dock(FILL)
		PlayerScrollPanel:SetSize(EndOfGamePanel:GetWide(), 0)
		PlayerScrollPanel.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
		end

		local sbar = PlayerScrollPanel:GetVBar()
		sbar:SetHideButtons(true)
		function sbar:Paint(w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
		end
		function sbar.btnGrip:Paint(w, h)
			draw.RoundedBox(0, TM.MenuScale(5), TM.MenuScale(8), TM.MenuScale(5), h - TM.MenuScale(16), Color(255, 255, 255, 175))
		end

		PlayerList = vgui.Create("DListLayout", PlayerScrollPanel)
		PlayerList:SetSize(PlayerScrollPanel:GetWide(), PlayerScrollPanel:GetTall())

		for k, v in ipairs(connectedPlayers) do
			-- constants for basic player information, much more optimized than checking every frame
			if !IsValid(v) then return end
			local name = v:Nick()
			local prestige = v:GetNWInt("playerPrestige")
			local level = v:GetNWInt("playerLevel")
			local frags = v:Frags()
			local deaths = v:Deaths()
			local ratio
			local score = v:GetNWInt("playerScoreMatch")

			surface.SetFont("Health")
			local nameLength = select(1, surface.GetTextSize(name .. " | " .. "P" .. prestige .. " L" .. level))

			-- format the K/D Ratio of a player, stops it from displaying INF when the player has gotten a kill, but has also not died yet
			if v:Frags() <= 0 then
				ratio = 0
			elseif v:Frags() >= 1 and v:Deaths() == 0 then
				ratio = v:Frags()
			else
				ratio = v:Frags() / v:Deaths()
			end

			local ratioRounded = math.Round(ratio, 2)

			local PlayerPanel = vgui.Create("DPanel", PlayerList)
			PlayerPanel:SetSize(PlayerList:GetWide(), TM.MenuScale(125))
			PlayerPanel:SetPos(0, 0)
			PlayerPanel.Paint = function(self, w, h)
				if !IsValid(v) then return end
				if k == 1 then draw.RoundedBox(0, 0, 0, w, h, Color(150, 150, 35, 40)) else draw.RoundedBox(0, 0, 0, w, h, Color(35, 35, 35, 40)) end

				draw.SimpleText(name .. " | " .. "P" .. prestige .. " L" .. level, "Health", TM.MenuScale(10), 0, COLORS.white, TEXT_ALIGN_LEFT)
				draw.SimpleText(frags, "Health", TM.MenuScale(285), TM.MenuScale(35), Color(0, 255, 0), TEXT_ALIGN_LEFT)
				draw.SimpleText(deaths, "Health", TM.MenuScale(285), TM.MenuScale(60), Color(255, 0, 0), TEXT_ALIGN_LEFT)
				draw.SimpleText(ratioRounded .. "", "Health", TM.MenuScale(285), TM.MenuScale(85), Color(255, 255, 0), TEXT_ALIGN_LEFT)
				draw.SimpleText(score, "Health", TM.MenuScale(427), TM.MenuScale(85), COLORS.white, TEXT_ALIGN_RIGHT)

				surface.SetFont("CaliberText")
				local roleLength = 0
				local mutedLength = 0

				if usergroup == "dev" then
					draw.SimpleText("(dev)", "CaliberText", nameLength + TM.MenuScale(15), TM.MenuScale(5), Color(205, 255, 0), TEXT_ALIGN_LEFT)
					roleLength = select(1, surface.GetTextSize("(dev)"))
				elseif usergroup == "mod" then
					draw.SimpleText("(mod)", "CaliberText", nameLength + TM.MenuScale(15), TM.MenuScale(5), Color(255, 0, 100), TEXT_ALIGN_LEFT)
					roleLength = select(1, surface.GetTextSize("(mod)"))
				elseif usergroup == "contributor" then
					draw.SimpleText("(contributor)", "CaliberText", nameLength + TM.MenuScale(15), TM.MenuScale(5), Color(0, 110, 255), TEXT_ALIGN_LEFT)
					roleLength = select(1, surface.GetTextSize("(contributor)"))
				end

				if v:IsMuted() then
					draw.SimpleText("(muted)", "CaliberText", nameLength + roleLength + TM.MenuScale(15), TM.MenuScale(5), Color(255, 0, 0), TEXT_ALIGN_LEFT)
					mutedLength = select(1, surface.GetTextSize("(muted)"))
				end

				if v:GetFriendStatus() == "friend" then
					draw.SimpleText("(friend)", "CaliberText", nameLength + roleLength + mutedLength + TM.MenuScale(15), TM.MenuScale(5), Color(0, 255, 0), TEXT_ALIGN_LEFT)
					mutedLength = select(1, surface.GetTextSize("(friend)"))
				end
			end

			local KillsIcon = vgui.Create("DImage", PlayerPanel)
			KillsIcon:SetPos(TM.MenuScale(260), TM.MenuScale(42))
			KillsIcon:SetSize(TM.MenuScale(20), TM.MenuScale(20))
			KillsIcon:SetImage("icons/killicon.png")

			local DeathsIcon = vgui.Create("DImage", PlayerPanel)
			DeathsIcon:SetPos(TM.MenuScale(260), TM.MenuScale(67))
			DeathsIcon:SetSize(TM.MenuScale(20), TM.MenuScale(20))
			DeathsIcon:SetImage("icons/deathicon.png")

			local KDIcon = vgui.Create("DImage", PlayerPanel)
			KDIcon:SetPos(TM.MenuScale(260), TM.MenuScale(92))
			KDIcon:SetSize(TM.MenuScale(20), TM.MenuScale(20))
			KDIcon:SetImage("icons/ratioicon.png")

			local ScoreIcon = vgui.Create("DImage", PlayerPanel)
			ScoreIcon:SetPos(TM.MenuScale(432), TM.MenuScale(92))
			ScoreIcon:SetSize(TM.MenuScale(20), TM.MenuScale(20))
			ScoreIcon:SetImage("icons/scoreicon.png")

			local PlayerCallingCard = vgui.Create("DImage", PlayerPanel)
			PlayerCallingCard:SetPos(TM.MenuScale(10), TM.MenuScale(35))
			PlayerCallingCard:SetSize(TM.MenuScale(240), TM.MenuScale(80))

			if IsValid(v) then PlayerCallingCard:SetImage(v:GetNWString("chosenPlayercard"), "cards/color/black.png") end

			local PlayerProfilePicture = vgui.Create("AvatarImage", PlayerPanel)
			PlayerProfilePicture:SetPos(TM.MenuScale(15), TM.MenuScale(40))
			PlayerProfilePicture:SetSize(TM.MenuScale(70), TM.MenuScale(70))
			PlayerProfilePicture:SetPlayer(v, 184)

			-- allows the players profile to be clicked to display various options revolving around the specific player
			PlayerProfilePicture.OnMousePressed = function()
				local Menu = DermaMenu()

				local profileButton = Menu:AddOption("Open Steam Profile", function() gui.OpenURL("http://steamcommunity.com/profiles/" .. v:SteamID64()) end)
				profileButton:SetIcon("icon16/page_find.png")

				Menu:AddSpacer()

				local statistics = Menu:AddSubMenu("View Stats")
				local accolades = Menu:AddSubMenu("View Accolades")
				local weaponstatistics = Menu:AddSubMenu("View Weapon Stats")
				local weaponKills = weaponstatistics:AddSubMenu("Kills With")
				weaponKills:SetMaxHeight(ScrH() / 1.5)

				statistics:AddOption("Prestige " .. v:GetNWInt("playerPrestige") .. " Level " .. v:GetNWInt("playerLevel"))
				statistics:AddOption("Score: " .. v:GetNWInt("playerScore"))
				statistics:AddOption("Kills: " .. v:GetNWInt("playerKills"))
				statistics:AddOption("Deaths: " .. v:GetNWInt("playerDeaths"))
				statistics:AddOption("K/D Ratio: " .. math.Round(v:GetNWInt("playerKills") / v:GetNWInt("playerDeaths"), 3))
				statistics:AddOption("Highest Killstreak: " .. v:GetNWInt("highestKillStreak"))
				statistics:AddOption("Highest Kill Game: " .. v:GetNWInt("highestKillGame"))
				statistics:AddOption("Farthest Kill: " .. v:GetNWInt("farthestKill") .. "m")
				statistics:AddOption("Matches Played: " .. v:GetNWInt("matchesPlayed"))
				statistics:AddOption("Matches Won: " .. v:GetNWInt("matchesWon"))
				statistics:AddOption("W/L Ratio: " .. math.Round((v:GetNWInt("matchesWon") / v:GetNWInt("matchesPlayed")) * 100) .. "%")
				accolades:AddOption("Headshot Kills: " .. v:GetNWInt("playerAccoladeHeadshot"))
				accolades:AddOption("Smackdowns (Melee Kills): " .. v:GetNWInt("playerAccoladeSmackdown"))
				accolades:AddOption("Clutches (Kills with less than 15 HP): " .. v:GetNWInt("playerAccoladeClutch"))
				accolades:AddOption("Longshots: " .. v:GetNWInt("playerAccoladeLongshot"))
				accolades:AddOption("Point Blanks: " .. v:GetNWInt("playerAccoladePointblank"))
				accolades:AddOption("On Streaks (Kill Streaks Started): " .. v:GetNWInt("playerAccoladeOnStreak"))
				accolades:AddOption("Buzz Kills (Kill Streaks Ended): " .. v:GetNWInt("playerAccoladeBuzzkill"))
				for i = 1, #WEAPONS do
					weaponKills:AddOption(WEAPONS[i][2] .. ": " .. v:GetNWInt("killsWith_" .. WEAPONS[i][1]))
				end

				Menu:AddSpacer()

				local copyMenu = Menu:AddSubMenu("Copy...")
				copyMenu:AddOption("Copy Name", function() SetClipboardText(v:Nick()) end):SetIcon("icon16/cut.png")
				copyMenu:AddOption("Copy SteamID64", function() SetClipboardText(v:SteamID64()) end):SetIcon("icon16/cut.png")

				if v != LocalPlayer() then
					local muteToggle = Menu:AddOption("Mute Player", function(self)
						if v:IsMuted() then v:SetMuted(false) else v:SetMuted(true) end
					end)

					if v:IsMuted() then muteToggle:SetIcon("icon16/sound.png") muteToggle:SetText("Unmute Player") else muteToggle:SetIcon("icon16/sound_mute.png") muteToggle:SetText("Mute Player") end
				end

				Menu:Open()
			end
		end
	end

	EndOfGameUI:Show()
	gui.EnableScreenClicker(true)
end )

net.Receive("SendChatMessage", function(len)
	local text = net.ReadString()
	table.insert(chatArray, text)
end)

-- updates the players time until self destruct on Cranked
net.Receive("NotifyCranked", function(len)
	timeUntilSelfDestruct = crankedTime:GetInt()

	timer.Create("CrankedTimeUntilDeath", crankedTime:GetInt(), 1, function()
		hook.Remove("Think", "CrankedTimeLeft")
	end)

	hook.Add("Think", "CrankedTimeLeft", function()
		if timer.Exists("CrankedTimeUntilDeath") then
			timeUntilSelfDestruct = math.Round(timer.TimeLeft("CrankedTimeUntilDeath"))
		end
	end)
end)

local loadoutHint = GetConVar("tm_hud_hints_loadout"):GetBool()

function ShowLoadoutOnSpawn()
	if !loadoutHint then return end

	local primaryWeapon = ""
	local secondaryWeapon = ""
	local meleeWeapon = ""

	for _, wep in ipairs(WEAPONS) do
		local id = wep[1]
		local name = wep[2]

		if id == LocalPlayer():GetNWString("loadoutPrimary") then
			primaryWeapon = name
		end

		if id == LocalPlayer():GetNWString("loadoutSecondary") then
			secondaryWeapon = name
		end

		if id == LocalPlayer():GetNWString("loadoutMelee") then
			meleeWeapon = name
		end
	end

	if primaryWeapon == "" and secondaryWeapon == "" and meleeWeapon == "" then return end

	notification.AddProgress("LoadoutText", "Loadout:\n" .. primaryWeapon .. "\n" .. secondaryWeapon .. "\n" .. meleeWeapon)

	timer.Simple(2.5, function()
		notification.Kill("LoadoutText")
	end)
end
