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

cvars["player_gravity_mult"] = {
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
	default = 165,
	replicated = true
}

cvars["player_speed_slide_mult"] = {
	default = 1,
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

cvars["deathcam"] = {
	default = 1,
	replicated = true,
	min = 0,
	max = 1,
	userinfo = true
}

-- client
cvars["menu_sfx"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["hit_sfx"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["hit_sfx_style"] = {
	client = true,
	default = 0,
	min = 0,
	max = 5
}

cvars["kill_sfx"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["kill_sfx_style"] = {
	client = true,
	default = 0,
	min = 0,
	max = 5
}

cvars["kill_headshot_sfx_style"] = {
	client = true,
	default = 0,
	min = 0,
	max = 5
}

cvars["music"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["music_volume"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["sensitivity_1x"] = {
	client = true,
	default = 80,
	min = 0,
	max = 200
}

cvars["sensitivity_2x"] = {
	client = true,
	default = 50,
	min = 0,
	max = 200
}

cvars["sensitivity_4x"] = {
	client = true,
	default = 25,
	min = 0,
	max = 200
}

cvars["sensitivity_5x"] = {
	client = true,
	default = 20,
	min = 0,
	max = 200
}

cvars["sensitivity_6x"] = {
	client = true,
	default = 12,
	min = 0,
	max = 200
}

cvars["sensitivity_transition"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["fov"] = {
	client = true,
	default = 0,
	min = 0,
	max = 1,
	userinfo = true
}

cvars["fov_amount"] = {
	client = true,
	default = 100,
	min = 100,
	max = 144,
	userinfo = true
}

cvars["fov_sprint"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1,
	userinfo = true
}

cvars["autosprint"] = {
	client = true,
	default = 0,
	min = 0,
	max = 1,
	userinfo = true
}

cvars["autosprint_delay"] = {
	client = true,
	default = 0,
	min = 0,
	max = 1,
	userinfo = true
}

cvars["render_hands"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["deathcam"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1,
	userinfo = true
}

cvars["lensflare"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["screenflashes"] = {
	client = true,
	default = 1,
	min = 0,
	max = 1
}

-- binds
cvars["nade"] = {
	bind = true,
	default = KEY_4,
	userinfo = true
}

cvars["grapple"] = {
	bind = true,
	default = KEY_Q,
	userinfo = true
}

cvars["menu"] = {
	bind = true,
	default = KEY_M,
	userinfo = true
}

cvars["primary"] = {
	bind = true,
	default = KEY_1,
	userinfo = true
}

cvars["secondary"] = {
	bind = true,
	default = KEY_2,
	userinfo = true
}

cvars["melee"] = {
	bind = true,
	default = KEY_3,
	userinfo = true
}

-- hud
cvars["enable"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["font"] = {
	hud = true,
	default = "Bender"
}

cvars["scale"] = {
	hud = true,
	default = 1,
	min = 0.25,
	max = 2
}

cvars["bounds_x"] = {
	hud = true,
	default = 10,
	min = 0,
	max = 480
}

cvars["bounds_y"] = {
	hud = true,
	default = 10,
	min = 0,
	max = 270
}

cvars["text_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["text_color_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["text_color_b"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["killfeed"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["health_size"] = {
	hud = true,
	default = 450,
	min = 100,
	max = 1000
}

cvars["health_offset_x"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1920
}

cvars["health_offset_y"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1080
}

cvars["equipment_offset_x"] = {
	hud = true,
	default = 525,
	min = 0,
	max = 1920
}

cvars["equipment_offset_y"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1080
}

cvars["equipment_anchor"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 2
}

cvars["killfeed_style"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["killfeed_limit"] = {
	hud = true,
	default = 6,
	min = 0,
	max = 10
}

cvars["killfeed_offset_x"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1920
}

cvars["killfeed_offset_y"] = {
	hud = true,
	default = 40,
	min = 0,
	max = 1080
}

cvars["killfeed_opacity"] = {
	hud = true,
	default = 80,
	min = 0,
	max = 255
}

cvars["hints_loadout"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["killtracker"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["keypressoverlay"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["keypressoverlay_x"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1920
}

cvars["keypressoverlay_y"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1080
}

cvars["keypressoverlay_inactive_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["keypressoverlay_inactive_color_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["keypressoverlay_inactive_color_b"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["keypressoverlay_actuated_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["keypressoverlay_actuated_color_g"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["keypressoverlay_actuated_color_b"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["velocityoverlay"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["velocityoverlay_x"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1920
}

cvars["velocityoverlay_y"] = {
	hud = true,
	default = 190,
	min = 0,
	max = 1080
}

cvars["obj_scale"] = {
	hud = true,
	default = 1,
	min = 0.25,
	max = 3
}

cvars["obj_empty_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_color_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_color_b"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_occupied_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_occupied_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_occupied_b"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["obj_empty_contested_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["obj_empty_contested_g"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["obj_empty_contested_b"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["crosshair"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_style"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_gap"] = {
	hud = true,
	default = 4,
	min = 0,
	max = 100
}

cvars["crosshair_size"] = {
	hud = true,
	default = 8,
	min = 0,
	max = 100
}

cvars["crosshair_thickness"] = {
	hud = true,
	default = 2,
	min = 0,
	max = 100
}

cvars["crosshair_dot"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["crosshair_outline"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["crosshair_opacity"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["crosshair_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["crosshair_color_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["crosshair_color_b"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["crosshair_outline_color_r"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["crosshair_outline_color_g"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["crosshair_outline_color_b"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["crosshair_show_t"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_show_b"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_show_l"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_show_r"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["crosshair_sprint"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 1
}

cvars["hitmarker"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["hitmarker_gap"] = {
	hud = true,
	default = 8,
	min = 0,
	max = 100
}

cvars["hitmarker_size"] = {
	hud = true,
	default = 8,
	min = 0,
	max = 100
}

cvars["hitmarker_thickness"] = {
	hud = true,
	default = 2,
	min = 0,
	max = 100
}

cvars["hitmarker_opacity"] = {
	hud = true,
	default = 200,
	min = 0,
	max = 255
}

cvars["hitmarker_duration"] = {
	hud = true,
	default = 2.5,
	min = 0.5,
	max = 5
}

cvars["hitmarker_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["hitmarker_color_g"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["hitmarker_color_b"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["hitmarker_head_color_r"] = {
	hud = true,
	default = 255,
	min = 0,
	max = 255
}

cvars["hitmarker_head_color_g"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["hitmarker_head_color_b"] = {
	hud = true,
	default = 0,
	min = 0,
	max = 255
}

cvars["notifications"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

cvars["voiceindicator"] = {
	hud = true,
	default = 1,
	min = 0,
	max = 1
}

local prefixClient = "tm_"
local prefixBinds = "tm_bind_"
local prefixHUD = "tm_hud_"
local prefixServer = "sv_tm_"

local cvarsClient = {}
local cvarsBinds = {}
local cvarsHUD = {}
local cvarsServer = {}

for cvar, data in pairs(cvars) do
	if data.client and CLIENT then
		local name = prefixClient .. cvar
		table.insert(cvarsClient, name)
		CreateClientConVar(name, data.default, data.save != false, data.userinfo, data.helptext, data.min, data.max)
	elseif data.hud then
		local name = prefixHUD .. cvar
		table.insert(cvarsClient, name)
		CreateClientConVar(name, data.default, data.save != false, data.userinfo, data.helptext, data.min, data.max)
	elseif data.bind then
		local name = prefixBinds .. cvar
		table.insert(cvarsBinds, name)
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

	local function ResetSettingsBinds()
		for _, cvar in pairs(cvarsBinds) do
			RunConsoleCommand(cvar, GetConVar(cvar):GetDefault())
		end
	end
	concommand.Add("tm_binds_reset", function() ResetSettingsBinds() end)

	local function ResetSettingsHUD()
		for _, cvar in pairs(cvarsHUD) do
			RunConsoleCommand(cvar, GetConVar(cvar):GetDefault())
		end
	end
	concommand.Add("tm_hud_reset", function() ResetSettingsHUD() end)
end

local function ResetSettingsServer()
	for _, cvar in pairs(cvarsServer) do
		GetConVar(cvar):Revert()
	end
end
concommand.Add("sv_tm_settings_reset", function() ResetSettingsServer() end)
