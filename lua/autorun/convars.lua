if engine.ActiveGamemode() != "titanmod" then return end

local cvars = {}

-- server
cvars["match_length"] = {
	default = 600,
	replicated = true
}

cvars["intermission_length"] = {
	default = 30,
	replicated = true
}

cvars["xp_mult"] = {
	default = 1,
	replicated = true
}

cvars["unlock_all"] = {
	default = 0,
	replicated = true,
	min = 0,
	max = 1
}

cvars["player_hp_max"] = {
	default = 100,
	replicated = true
}

cvars["player_hp_regen"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1
}

cvars["player_hp_regen_interval"] = {
	default = 0.1,
	replicated = true
}

cvars["player_hp_regen_amount"] = {
	default = 1,
	replicated = true
}

cvars["player_hp_regen_cooldown"] = {
	default = 3.5,
	replicated = true
}

cvars["player_gravity"] = {
	default = 1,
	replicated = true
}

cvars["player_speed_walk"] = {
	default = 165,
	replicated = true
}

cvars["player_speed_run"] = {
	default = 275,
	replicated = true
}

cvars["player_speed_crouch_mult"] = {
	default = 0.6,
	replicated = true
}

cvars["player_speed_climb"] = {
	default = 155,
	replicated = true
}

cvars["player_speed_slide_mult"] = {
	default = 1.55,
	replicated = true
}

cvars["player_slide_duration"] = {
	default = 1,
	replicated = true
}

cvars["player_jump_mult"] = {
	default = 1,
	replicated = true
}

cvars["player_crouch_time_enter_mult"] = {
	default = 1,
	replicated = true
}

cvars["player_crouch_time_exit_mult"] = {
	default = 1,
	replicated = true
}

cvars["player_crouch_time_exit_mult"] = {
	default = 1,
	replicated = true
}

cvars["player_jump_sliding"] = {
	default = 0,
	replicated = true,
	min = 0,
	max = 1
}

cvars["player_custom_movement"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1
}

cvars["mode_fiesta_shuffle_length"] = {
	default = 30,
	replicated = true
}

cvars["mode_gungame_ladder_size"] = {
	default = 26,
	replicated = true
}

cvars["mode_cranked_state_length"] = {
	default = 25,
	replicated = true
}

cvars["mode_cranked_state_buff_mult"] = {
	default = 1.33,
	replicated = true
}

cvars["mode_koth_score"] = {
	default = 15,
	replicated = true
}

cvars["mode_koth_score_interval"] = {
	default = 1,
	replicated = true
}

cvars["mode_vip_score"] = {
	default = 10,
	replicated = true
}

cvars["mode_vip_score_interval"] = {
	default = 1,
	replicated = true
}

cvars["grapple_cooldown"] = {
	default = 15,
	replicated = true
}

cvars["grapple_cooldown_kill_reduction"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1
}

cvars["grapple_cooldown_kill_reduction_amount"] = {
	default = 10,
	replicated = true
}

cvars["grapple_range"] = {
	default = 850,
	replicated = true
}

cvars["voice_range"] = {
	default = 1000,
	replicated = true
}

cvars["voting"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1
}

cvars["death_camera"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1
}

if CLIENT then
	CreateClientConVar("tm_menusounds", 1, true, false, "Enable/disable the menu sounds", 0, 1)
	CreateClientConVar("tm_hitsounds", 1, true, false, "Enable/disable the hitsounds", 0, 1)
	CreateClientConVar("tm_killsound", 1, true, false, "Enable/disable the kill confirmation sound", 0, 1)
	CreateClientConVar("tm_musicvolume", 1, true, false, "Increase or lower the volume of music", 0, 1)
	CreateClientConVar("tm_hitsoundtype", 0, true, false, "Switch between the multiple styles of hitsounds", 0, 5)
	CreateClientConVar("tm_killsoundtype", 0, true, false, "Switch between the multiple styles of kill sounds", 0, 5)
	CreateClientConVar("tm_headshotkillsoundtype", 0, true, false, "Switch between the multiple styles of kill sounds when getting a headshot kill", 0, 5)
	CreateClientConVar("tm_nadebind", KEY_4, true, true, "Determines the keybind that will begin cocking a grenade")
	CreateClientConVar("tm_grapplebind", KEY_G, true, true, "")
	CreateClientConVar("tm_mainmenubind", KEY_M, true, true, "Determines the keybind that will open the main menu")
	CreateClientConVar("tm_quickswitching", 1, true, true, "Enable/disable quick weapon switching via keybinds", 0, 1)
	CreateClientConVar("tm_primarybind", KEY_1, true, true, "Determines the keybind that will quick switch to your primary weapon")
	CreateClientConVar("tm_secondarybind", KEY_2, true, true, "Determines the keybind that will quick switch to your secondary weapon")
	CreateClientConVar("tm_meleebind", KEY_3, true, true, "Determines the keybind that will quick switch to your melee")
	CreateClientConVar("tm_hidestatsfromothers", 0, true, true, "Determines if other players can see and/or compare your stats", 0, 1)
	CreateClientConVar("tm_screenflashes", 1, true, false, "Enable/disable sudden screen flashes on certain occasions (mainly dying and leveling up)", 0, 1)
	CreateClientConVar("tm_lensflare", 1, true, false, "Enable/disable lens flare effects", 0, 1)
	CreateClientConVar("tm_deathcam", 1, true, true, "Enable/disable the custom death camera when killed by another player", 0, 1)
	CreateClientConVar("tm_customfov", 0, true, true, "Enable/disable Titanmod's custom FOV system", 0, 1)
	CreateClientConVar("tm_customfov_value", 100, true, true, "Adjust the players FOV while using Titanmod's custom FOV system", 100, 144)
	CreateClientConVar("tm_customfov_sprint", 1, true, true, "Increase the players FOV while sprinting", 0, 1)
	CreateClientConVar("tm_sensitivity_1x", 80, true, true, "Adjust the sensitivity when using iron sights/low zoom optics", 1, 100)
	CreateClientConVar("tm_sensitivity_2x", 50, true, true, "Adjust the sensitivity when using medium zoom optics", 1, 100)
	CreateClientConVar("tm_sensitivity_4x", 25, true, true, "Adjust the sensitivity when using medium-high zoom optics", 1, 100)
	CreateClientConVar("tm_sensitivity_6x", 12, true, true, "Adjust the sensitivity when using high zoom optics", 1, 100)
	CreateClientConVar("tm_sensitivity_transition", 1, true, true, "Adjust the style of transition between different zoom sensitivities", 0, 1)
	CreateClientConVar("tm_renderhands", 1, true, false, "Enable/disable the rendering of your own hands", 0, 1)
	CreateClientConVar("tm_autosprint", 0, true, true, "Enable/disable automatic sprinting while moving", 0, 1)
	CreateClientConVar("tm_autosprint_delay", 0.25, true, true, "Adjust the time between pressing a mouse button and being able to auto sprint again", 0.25, 0.50)

	CreateClientConVar("tm_hud_enable", 1, true, false, "Enable/disable any custom HUD elements created by the gamemode", 0, 1)
	CreateClientConVar("tm_hud_scale", 1, true, false, "Adjust the scale for all HUD items", 0.5, 2)
	CreateClientConVar("tm_hud_bounds_x", 15, true, false, "Adjust the HUD bounds on the X axis, moving all hud elements from the edge of your screen", 0, 480)
	CreateClientConVar("tm_hud_bounds_y", 15, true, false, "Adjust the HUD bounds on the Y axis, moving all hud elements from the edge of your screen", 0, 270)
	CreateClientConVar("tm_hud_text_color_r", 255, true, false, "Adjusts the red coloring of the HUD text", 0, 255)
	CreateClientConVar("tm_hud_text_color_g", 255, true, false, "Adjusts the green coloring of the HUD text", 0, 255)
	CreateClientConVar("tm_hud_text_color_b", 255, true, false, "Adjusts the blue coloring of the HUD text", 0, 255)
	CreateClientConVar("tm_hud_enablekillfeed", 1, true, false, "Enable/disable the kill feed", 0, 1)
	CreateClientConVar("tm_hud_font", "Bender", true, false, "Enable/disable any custom HUD elements created by the gamemode")
	CreateClientConVar("tm_hud_ammo_style", 0, true, false, "Adjusts the style and look of the ammo counter", 0, 1)
	CreateClientConVar("tm_hud_ammo_bar_color_r", 150, true, false, "Adjusts the red coloring for the ammo bar", 0, 255)
	CreateClientConVar("tm_hud_ammo_bar_color_g", 100, true, false, "Adjusts the green coloring for the ammo bar", 0, 255)
	CreateClientConVar("tm_hud_ammo_bar_color_b", 50, true, false, "Adjusts the blue coloring for the ammo bar", 0, 255)
	CreateClientConVar("tm_hud_health_size", 450, true, false, "Adjusts the size of the players health bar", 100, 1000)
	CreateClientConVar("tm_hud_health_offset_x", 0, true, false, "Adjusts the X offset of the players health bar", 0, 1920)
	CreateClientConVar("tm_hud_health_offset_y", 0, true, false, "Adjusts the Y offset of the players health bar", 0, 1080)
	CreateClientConVar("tm_hud_health_color_high_r", 100, true, false, "Adjusts the red coloring for the health bar while on high health", 0, 255)
	CreateClientConVar("tm_hud_health_color_high_g", 180, true, false, "Adjusts the green coloring for the health bar while on high health", 0, 255)
	CreateClientConVar("tm_hud_health_color_high_b", 100, true, false, "Adjusts the blue coloring for the health bar while on high health", 0, 255)
	CreateClientConVar("tm_hud_health_color_mid_r", 180, true, false, "Adjusts the red coloring for the health bar while on medium health", 0, 255)
	CreateClientConVar("tm_hud_health_color_mid_g", 180, true, false, "Adjusts the green coloring for the health bar while on medium health", 0, 255)
	CreateClientConVar("tm_hud_health_color_mid_b", 100, true, false, "Adjusts the blue coloring for the health bar while on medium health", 0, 255)
	CreateClientConVar("tm_hud_health_color_low_r", 180, true, false, "Adjusts the red coloring for the health bar while on low health", 0, 255)
	CreateClientConVar("tm_hud_health_color_low_g", 100, true, false, "Adjusts the green coloring for the health bar while on low health", 0, 255)
	CreateClientConVar("tm_hud_health_color_low_b", 100, true, false, "Adjusts the blue coloring for the health bar while on low health", 0, 255)
	CreateClientConVar("tm_hud_equipment_offset_x", 525, true, false, "Adjusts the X offset of the players equipment UI", 0, 1920)
	CreateClientConVar("tm_hud_equipment_offset_y", 0, true, false, "Adjusts the Y offset of the players equipment UI", 0, 1080)
	CreateClientConVar("tm_hud_equipment_anchor", 0, true, false, "Adjusts the anchoring of the players equipment UI", 0, 2)
	CreateClientConVar("tm_hud_killfeed_style", 0, true, false, "Switch the killfeed entries between ascending and descending", 0, 1)
	CreateClientConVar("tm_hud_killfeed_limit", 6, true, false, "Limit the amount of kill feed entries that are shown at one time", 1, 10)
	CreateClientConVar("tm_hud_killfeed_offset_x", 0, true, false, "Adjusts the X offset of the kill feed", 0, 1920)
	CreateClientConVar("tm_hud_killfeed_offset_y", 40, true, false, "Adjusts the Y offset of the kill feed", 0, 1080)
	CreateClientConVar("tm_hud_killfeed_opacity", 80, true, false, "Adjusts the background opacity of a kill feed entry", 0, 255)
	CreateClientConVar("tm_hud_killdeath_offset_x", 0, true, false, "Adjusts the X offset of the kill and death UI", -960, 960)
	CreateClientConVar("tm_hud_killdeath_offset_y", 335, true, false, "Adjusts the Y offset of the kill and death UI", 0, 1080)
	CreateClientConVar("tm_hud_kill_iconcolor_r", 255, true, false, "Adjusts the red coloring for the kill icon", 0, 255)
	CreateClientConVar("tm_hud_kill_iconcolor_g", 255, true, false, "Adjusts the green coloring for the kill icon", 0, 255)
	CreateClientConVar("tm_hud_kill_iconcolor_b", 255, true, false, "Adjusts the blue coloring for the kill icon", 0, 255)
	CreateClientConVar("tm_hud_reloadhint", 1, true, false, "Enable/disable the reload text when out of ammo", 0, 1)
	CreateClientConVar("tm_hud_loadouthint", 1, true, false, "Enable/disable the loadout info displaying on player spawn", 0, 1)
	CreateClientConVar("tm_hud_killtracker", 0, true, false, "Enable/disable the weapon specific kill tracking on the UI", 0, 1)
	CreateClientConVar("tm_hud_keypressoverlay", 0, true, false, "Enable/disable the keypress overlay (shows which keys are being pressed on your screen)", 0, 1)
	CreateClientConVar("tm_hud_keypressoverlay_x", 0, true, false, "Adjusts the X offset of the keypress overlay", 0, 1920)
	CreateClientConVar("tm_hud_keypressoverlay_y", 0, true, false, "Adjusts the Y offset of the keypress overlay", 0, 1080)
	CreateClientConVar("tm_hud_keypressoverlay_inactive_r", 255, true, false, "Adjusts the red coloring for a inactive key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_keypressoverlay_inactive_g", 255, true, false, "Adjusts the green coloring for a inactive key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_keypressoverlay_inactive_b", 255, true, false, "Adjusts the blue coloring for a inactive key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_keypressoverlay_actuated_r", 255, true, false, "Adjusts the red coloring for a actuated key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_keypressoverlay_actuated_g", 0, true, false, "Adjusts the green coloring for a actuated key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_keypressoverlay_actuated_b", 0, true, false, "Adjusts the blue coloring for a actuated key on the keypress overlay", 0, 255)
	CreateClientConVar("tm_hud_velocitycounter", 0, true, false, "Enable/disable a velocity counter", 0, 1)
	CreateClientConVar("tm_hud_velocitycounter_x", 0, true, false, "Adjusts the X offset of the FPS and ping counter", 0, 1920)
	CreateClientConVar("tm_hud_velocitycounter_y", 190, true, false, "Adjusts the Y offset of the FPS and ping counter", 0, 1080)
	CreateClientConVar("tm_hud_velocitycounter_r", 255, true, false, "Adjusts the red coloring for the FPS and ping counter", 0, 255)
	CreateClientConVar("tm_hud_velocitycounter_g", 255, true, false, "Adjusts the green coloring for the FPS and ping counter", 0, 255)
	CreateClientConVar("tm_hud_velocitycounter_b", 255, true, false, "Adjusts the blue coloring for the FPS and ping counter", 0, 255)
	CreateClientConVar("tm_hud_obj_scale", 1, true, false, "Adjusts the scale of the font used on objective-based HUD elements", 0.5, 3)
	CreateClientConVar("tm_hud_obj_color_empty_r", 255, true, false, "Adjusts the red coloring for the objective object when empty", 0, 255)
	CreateClientConVar("tm_hud_obj_color_empty_g", 255, true, false, "Adjusts the green coloring for the objective object when empty", 0, 255)
	CreateClientConVar("tm_hud_obj_color_empty_b", 255, true, false, "Adjusts the blue coloring for the objective object when empty", 0, 255)
	CreateClientConVar("tm_hud_obj_color_occupied_r", 255, true, false, "Adjusts the red coloring for the objective object when occupied", 0, 255)
	CreateClientConVar("tm_hud_obj_color_occupied_g", 255, true, false, "Adjusts the green coloring for the objective object when occupied", 0, 255)
	CreateClientConVar("tm_hud_obj_color_occupied_b", 0, true, false, "Adjusts the blue coloring for the objective object when occupied", 0, 255)
	CreateClientConVar("tm_hud_obj_color_contested_r", 255, true, false, "Adjusts the red coloring for the objective object when contested", 0, 255)
	CreateClientConVar("tm_hud_obj_color_contested_g", 0, true, false, "Adjusts the green coloring for the objective object when contested", 0, 255)
	CreateClientConVar("tm_hud_obj_color_contested_b", 0, true, false, "Adjusts the blue coloring for the objective object when contested", 0, 255)
	CreateClientConVar("tm_hud_dmgindicator", 1, true, false, "Enable/disable damage indicators", 0, 1)
	CreateClientConVar("tm_hud_dmgindicator_color_r", 255, true, false, "Adjusts the red coloring for the damage indicator", 0, 255)
	CreateClientConVar("tm_hud_dmgindicator_color_g", 0, true, false, "Adjusts the green coloring for the damage indicator", 0, 255)
	CreateClientConVar("tm_hud_dmgindicator_color_b", 0, true, false, "Adjusts the blue coloring for the damage indicator", 0, 255)
	CreateClientConVar("tm_hud_dmgindicator_opacity", 85, true, false, "Adjusts the opacity for the damage indicator", 0, 255)
	CreateClientConVar("tm_hud_crosshair", 1, true, false, "Enable/disable the crosshair", 0, 1)
	CreateClientConVar("tm_hud_crosshair_style", 1, true, false, "Adjusts the crosshair style", 0, 1)
	CreateClientConVar("tm_hud_crosshair_gap", 4, true, false, "Adjusts the crosshair gap", 0, 100)
	CreateClientConVar("tm_hud_crosshair_size", 8, true, false, "Adjusts the crosshair size", 0, 100)
	CreateClientConVar("tm_hud_crosshair_thickness", 2, true, false, "Adjusts the crosshair thickness", 0, 100)
	CreateClientConVar("tm_hud_crosshair_dot", 0, true, false, "Enable/disable the crosshair dot", 0, 1)
	CreateClientConVar("tm_hud_crosshair_outline", 0, true, false, "Enable/disable the crosshair outline", 0, 1)
	CreateClientConVar("tm_hud_crosshair_opacity", 255, true, false, "Adjusts the crosshair opacity", 0, 255)
	CreateClientConVar("tm_hud_crosshair_color_r", 255, true, false, "Adjusts the red coloring for the crosshair", 0, 255)
	CreateClientConVar("tm_hud_crosshair_color_g", 255, true, false, "Adjusts the green coloring for the crosshair", 0, 255)
	CreateClientConVar("tm_hud_crosshair_color_b", 255, true, false, "Adjusts the blue coloring for the crosshair", 0, 255)
	CreateClientConVar("tm_hud_crosshair_outline_color_r", 0, true, false, "Adjusts the red coloring for the crosshair outline", 0, 255)
	CreateClientConVar("tm_hud_crosshair_outline_color_g", 0, true, false, "Adjusts the green coloring for the crosshair outline", 0, 255)
	CreateClientConVar("tm_hud_crosshair_outline_color_b", 0, true, false, "Adjusts the blue coloring for the crosshair outline", 0, 255)
	CreateClientConVar("tm_hud_crosshair_show_t", 1, true, false, "Enable/disable the top of the crosshair", 0, 1)
	CreateClientConVar("tm_hud_crosshair_show_b", 1, true, false, "Enable/disable the bottom of the crosshair", 0, 1)
	CreateClientConVar("tm_hud_crosshair_show_l", 1, true, false, "Enable/disable the left of the crosshair", 0, 1)
	CreateClientConVar("tm_hud_crosshair_show_r", 1, true, false, "Enable/disable the right of the crosshair", 0, 1)
	CreateClientConVar("tm_hud_crosshair_sprint", 0, true, false, "Enable/disable the crosshair while sprinting", 0, 1)
	CreateClientConVar("tm_hud_hitmarker", 1, true, false, "Enable/disable the hitmarker", 0, 1)
	CreateClientConVar("tm_hud_hitmarker_gap", 8, true, false, "Adjusts the hitmarker gap", 0, 100)
	CreateClientConVar("tm_hud_hitmarker_size", 8, true, false, "Adjusts the hitmarker size", 0, 100)
	CreateClientConVar("tm_hud_hitmarker_thickness", 2, true, false, "Adjusts the hitmarker thickness", 0, 20)
	CreateClientConVar("tm_hud_hitmarker_opacity", 200, true, false, "Adjusts the hitmarker opacity", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_duration", 2.5, true, false, "Adjusts the hitmarker opacity", 1, 5)
	CreateClientConVar("tm_hud_hitmarker_color_hit_r", 255, true, false, "Adjusts the red coloring for the hitmarker", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_color_hit_g", 255, true, false, "Adjusts the green coloring for the hitmarker", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_color_hit_b", 255, true, false, "Adjusts the blue coloring for the hitmarker", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_color_head_r", 255, true, false, "Adjusts the red coloring for the hitmarker on a headshot", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_color_head_g", 0, true, false, "Adjusts the green coloring for the hitmarker on a headshot", 0, 255)
	CreateClientConVar("tm_hud_hitmarker_color_head_b", 0, true, false, "Adjusts the blue coloring for the hitmarker on a headshot", 0, 255)
	CreateClientConVar("tm_hud_notifications", 1, true, false, "Enable/disable HUD notifications", 0, 1)
	CreateClientConVar("tm_hud_voiceindicator", 1, true, false, "Enable/disable the voice indicator", 0, 1)
end

local prefixClient = "tm_"
local prefixServer = "sv_tm_"

local cvarsClient = {}
local cvarsServer = {}

for cvar, data in pairs(cvars) do
	if data.client and CLIENT then
		local name = prefixClient .. cvar
		table.insert(cvarsClient, name)
		CreateClientConVar(name, data.default, data.save != false, data.userinfo, data.helptext, data.min, data.max)
	else
		local name = prefixServer .. cvar
		local flags = FCVAR_NONE

		if data.save != false then flags = flags + FCVAR_ARCHIVE end
		if data.replicated then flags = flags + FCVAR_REPLICATED end
		if data.userinfo then flags = flags + FCVAR_USERINFO end

		table.insert(cvarsServer, name)
		CreateConVar(name, data.default, flags, data.helptext, data.min, data.max)
	end
end

if CLIENT then
	local function ResetSettingsClient()
		for _, cvar in pairs(cvarsClient) do
			RunConsoleCommand(cvar, GetConVar(cvar):GetDefault())
		end
	end
	concommand.Add("tm_settings_reset", function() ResetSettingsClient() end)
end

local function ResetSettingsServer()
	for _, cvar in pairs(cvarsServer) do
		GetConVar(cvar):Revert()
	end
end
concommand.Add("sv_tm_settings_reset", function() ResetSettingsServer() end)
