--[[
	Titanmod Config File
	This is primarily for server owners that are trying to fine tune their experience.
	If you do not understand what a certain setting does, I would recommend not changing it.
]]--

DEBUG = CreateConVar("tm_developer", "0", FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_NOTIFY, "Enables Sandbox features on server start and enables certain debugging tools, having this enabled will disable progression for all players", 0, 1)

if DEBUG:GetBool() then
	DeriveGamemode("sandbox")
end

local UseConfigConvars = true   -- Disables the legacy Config, and allows sv_ ConVars to adjust the Titanmod Config.

if UseConfigConvars then
	playerHealth = GetConVar("sv_tm_player_health"):GetInt()
	playerSpeedMulti = GetConVar("sv_tm_player_speed_multi"):GetFloat()
	playerGravityMulti = GetConVar("sv_tm_player_gravity_multi"):GetFloat()
	playerJumpMulti = GetConVar("sv_tm_player_jump_multi"):GetFloat()
	playerDuckStateMulti = GetConVar("sv_tm_player_duckstate_multi"):GetFloat()
	playerCrouchWalkSpeedMulti = GetConVar("sv_tm_player_crouchwalkspeed_multi"):GetFloat()
	playerSlideSpeedMulti = GetConVar("sv_tm_player_slide_speed_multi"):GetFloat()
	playerSlideDuration = GetConVar("sv_tm_player_slide_duration"):GetFloat()
	healthRegeneration = GetConVar("sv_tm_player_healthregen_enable"):GetBool()
	healthRegenSpeed = GetConVar("sv_tm_player_healthregen_speed"):GetFloat()
	healthRegenDamageDelay = GetConVar("sv_tm_player_healthregen_damagedelay"):GetFloat()
	forceDisableProgression = GetConVar("sv_tm_progression_forcedisable"):GetBool()
	xpMultiplier = GetConVar("sv_tm_progression_xp_multi"):GetFloat()
	usePrimary = GetConVar("sv_tm_ffa_use_primary"):GetBool()
	useSecondary = GetConVar("sv_tm_ffa_use_secondary"):GetBool()
	useMelee = GetConVar("sv_tm_ffa_use_melee"):GetBool()
	fiestaShuffleTime = GetConVar("sv_tm_fiesta_shuffle_time"):GetInt()
	ggLadderSize = GetConVar("sv_tm_gungame_ladder_size"):GetInt()
	crankedSelfDestructTime = GetConVar("sv_tm_cranked_selfdestruct_time"):GetInt()
	crankedBuffMultiplier = GetConVar("sv_tm_cranked_buff_multi"):GetFloat()
	kothScoringInterval = GetConVar("sv_tm_koth_scoring_interval"):GetInt()
	kothScore = GetConVar("sv_tm_koth_score"):GetFloat()
	vipScoringInterval = GetConVar("sv_tm_vip_scoring_interval"):GetInt()
	vipScore = GetConVar("sv_tm_vip_score"):GetFloat()
	grappleCooldown = GetConVar("sv_tm_grapple_cooldown"):GetInt()
	grappleKillReset = GetConVar("sv_tm_grapple_killreset"):GetBool()
	grappleRange = GetConVar("sv_tm_grapple_range"):GetInt()
	proxChatRange = GetConVar("sv_tm_voip_range"):GetInt()
	matchVoting = GetConVar("sv_tm_matchvoting"):GetBool()
	customMovement = GetConVar("sv_tm_player_custommovement"):GetBool()
	jumpSliding = GetConVar("sv_tm_player_jumpsliding"):GetBool()
	deathCamera = GetConVar("sv_tm_deathcam"):GetBool()
	matchLengthTime = GetConVar("tm_matchlengthtimer"):GetInt()
else
	-- player settings
	playerHealth = 100              -- The max health of the player
	playerSpeedMulti = 1            -- The multiplier for the speed of the player (affects walking, sprinting, crouching, sliding, and ladder climbing speeds)
	playerGravityMulti = 1          -- The multiplier for the strength of gravity affecting the player
	playerJumpMulti = 1             -- The multiplier for the strength of the players jump
	playerDuckStateMulti = 1        -- The multiplier of the speed at which the player enters/exits a crocuh after the key is pressed/released
	playerCrouchWalkSpeedMulti = 1  -- The multiplier of the players wakling speed while crouched
	playerSlideSpeedMulti = 1.55    -- The multiplier of the players speed while sliding
	playerSlideDuration = 1         -- The time (in seconds) that a players slide lasts
	healthRegeneration = true       -- Enable or disable health regeneration on players after not taking damage for a set amount of time
	healthRegenSpeed = 0.12         -- The speed of the players health regeneration
	healthRegenDamageDelay = 3.5    -- The time (in seconds) from when the player was last hit to begin health regeneration

	-- progression settings
	forceDisableProgression = false -- Any progress or unlocks made during a play session will be reset upon leaving
	xpMultiplier = 1                -- Multiplies all sources of XP (kills, accolades, and more)

	-- universal settings
	usePrimary = true               -- Enable primary weapons for the players loadout
	useSecondary = true             -- Enable secondary weapons for the players loadout
	useMelee = true                 -- Enable melee weapons for the players loadout
	grappleCooldown = 15            -- The cooldown (in sceonds) of the grappling hook after being used

	-- fiesta settings
	fiestaShuffleTime = 30          -- Sets the amount of weapons a player needs to get kills with to win a match

	-- gun game settings
	ggLadderSize = 26               -- Sets the amount of weapons a player needs to get kills with to win a match

	-- cranked settings
	crankedSelfDestructTime = 25    -- Sets the amount of weapons a player needs to get kills with to win a match
	crankedBuffMultiplier = 1.33    -- The multiplier for the buffs that being Cranked gives to a player

	-- king of the hill settings
	kothScoringInterval = 1         -- The time (in seconds) that a hill check is done, this is repeating (obviously)
	kothScore = 15                  -- Sets the amount of score that is given to a player standing on the hill

	-- VIP settings
	vipScoringInterval = 1          -- The time (in seconds) that a VIP check is done, this is repeating (obviously)
	vipScore = 15                   -- Sets the amount of score that is given to the VIP

	-- mechanic settings
	grappleKillReset = true         -- Enable or disable the grapple cooldown reset on a player kill
	grappleRange = 850              -- The length (in units) that the grappling hook can travel too before despawning
	proxChatRange = 1000            -- The thresehold in distance where players can hear other players over proximity voice chat
	matchVoting = true              -- Enable or disable the end of match map and gamemode vote (disabling this will select a map and gamemode at random after a match ends)
	customMovement = true           -- Enable or disable Titanmod's custom movement mechanics (wall running/jumping, sliding, vaulting)
	jumpSliding = false             -- Removes the jump sliding patch, making movement more in line with older Titanmod versions
	deathCamera = true              -- Enable or disable Titanmod's custom death camera on a players death (showing the killers POV after a death), this can still be disabled by players client-side

	matchLengthTime = GetConVar("tm_matchlengthtimer"):GetInt()    -- The time in seconds until a map vote starts, can be replaced with a whole number to override the ConVar
end

-- convars
if SERVER then
	RunConsoleCommand("sbox_noclip", "0")

	RunConsoleCommand("sv_accelerate", "16")
	RunConsoleCommand("sv_airaccelerate", "1000")

	RunConsoleCommand("sv_tfa_damage_multiplier", "1.00")
	RunConsoleCommand("sv_tfa_recoil_mul_p", "0.8")
	RunConsoleCommand("sv_tfa_recoil_mul_p_npc", "0.8")
	RunConsoleCommand("sv_tfa_recoil_mul_y", "0.8")
	RunConsoleCommand("sv_tfa_recoil_mul_y_npc", "0.8")
	RunConsoleCommand("sv_tfa_recoil_viewpunch_mul", "0.8")
	RunConsoleCommand("sv_tfa_spread_multiplier", "0.65")

	RunConsoleCommand("sv_tfa_allow_dryfire", "1")
	RunConsoleCommand("sv_tfa_ammo_detonation", "0")
	RunConsoleCommand("sv_tfa_ammo_detonation_chain", "0")
	RunConsoleCommand("sv_tfa_ammo_detonation_mode", "0")
	RunConsoleCommand("sv_tfa_arrow_lifetime", "30")
	RunConsoleCommand("sv_tfa_attachments_alphabetical", "0")
	RunConsoleCommand("sv_tfa_attachments_enabled", "1")
	RunConsoleCommand("sv_tfa_backcompat_patchswepthink", "0")
	RunConsoleCommand("sv_tfa_ballistics_bullet_damping_air", "1.00")
	RunConsoleCommand("sv_tfa_ballistics_bullet_damping_water", "3.00")
	RunConsoleCommand("sv_tfa_ballistics_bullet_life", "10.00")
	RunConsoleCommand("sv_tfa_ballistics_bullet_velocity", "1.00")
	RunConsoleCommand("sv_tfa_ballistics_custom_gravity", "0")
	RunConsoleCommand("sv_tfa_ballistics_custom_gravity_value", "0")
	RunConsoleCommand("sv_tfa_ballistics_enabled", "0")
	RunConsoleCommand("sv_tfa_ballistics_mindist", "-1")
	RunConsoleCommand("sv_tfa_ballistics_substeps", "1")
	RunConsoleCommand("sv_tfa_bullet_doordestruction", "1")
	if game.GetMap() == "tm_mall" then
		RunConsoleCommand("sv_tfa_bullet_doordestruction", "0")
	end
	RunConsoleCommand("sv_tfa_bullet_doordestruction_keep", "1")
	RunConsoleCommand("sv_tfa_bullet_penetration", "1")
	RunConsoleCommand("sv_tfa_bullet_penetration_power_mul", "0.7")
	RunConsoleCommand("sv_tfa_bullet_randomseed", "0")
	RunConsoleCommand("sv_tfa_bullet_ricochet", "0")
	RunConsoleCommand("sv_tfa_cmenu", "1")
	RunConsoleCommand("sv_tfa_damage_mult_max", "1")
	RunConsoleCommand("sv_tfa_damage_mult_min", "1")
	RunConsoleCommand("sv_tfa_damage_multiplier_npc", "1.00")
	RunConsoleCommand("sv_tfa_default_clip", "1000")
	RunConsoleCommand("sv_tfa_door_respawn", "-1")
	RunConsoleCommand("sv_tfa_dynamicaccuracy", "1")
	RunConsoleCommand("sv_tfa_first_draw_anim_enabled", "0")
	RunConsoleCommand("sv_tfa_force_multiplier", "1")
	RunConsoleCommand("sv_tfa_fx_penetration_decal", "1")
	RunConsoleCommand("sv_tfa_holdtype_dynamic", "1")
	RunConsoleCommand("sv_tfa_jamming", "0")
	RunConsoleCommand("sv_tfa_melee_doordestruction", "1")
	RunConsoleCommand("sv_tfa_melee_blocking_stun_enabled", "1")
	RunConsoleCommand("sv_tfa_melee_blocking_stun_time", "0.65")
	RunConsoleCommand("sv_tfa_melee_blocking_anglemult", "1")
	RunConsoleCommand("sv_tfa_melee_blocking_deflection", "1")
	RunConsoleCommand("sv_tfa_melee_blocking_timed", "1")
	RunConsoleCommand("sv_tfa_melee_damage_ply", "1")
	RunConsoleCommand("sv_tfa_nearlyempty", "1")
	RunConsoleCommand("sv_tfa_npc_burst", "0")
	RunConsoleCommand("sv_tfa_npc_randomize_atts", "0")
	RunConsoleCommand("sv_tfa_penetration_hardlimit", "50")
	RunConsoleCommand("sv_tfa_penetration_hitmarker", "0")
	RunConsoleCommand("sv_tfa_range_modifier", "0.85")
	RunConsoleCommand("sv_tfa_recoil_legacy", "0")
	RunConsoleCommand("sv_tfa_scope_gun_speed_scale", "0")
	RunConsoleCommand("sv_tfa_soundscale", "1")
	RunConsoleCommand("sv_tfa_spread_legacy", "0")
	RunConsoleCommand("sv_tfa_sprint_enabled", "1")
	RunConsoleCommand("sv_tfa_unique_slots", "1")
	RunConsoleCommand("sv_tfa_weapon_strip", "0")
	RunConsoleCommand("sv_tfa_weapon_weight", "1")
	RunConsoleCommand("sv_tfa_worldmodel_culldistance", "20")

	RunConsoleCommand("tpf_sv_light_forward_offset", "-20")
	RunConsoleCommand("tpf_sv_max_bright", "255")
	RunConsoleCommand("tpf_sv_max_farz", "750")
	RunConsoleCommand("tpf_sv_max_fov", "75")

	if DEBUG:GetBool() then
		RunConsoleCommand("fingrap_Cooldowng", "0")
	else
		RunConsoleCommand("fingrap_Cooldowng", grappleCooldown)
	end

	RunConsoleCommand("fingrap_range", grappleRange)

	timer.Simple(5, function() -- delaying by 5 seconds because it literally just doesn't work unless I delay the ConVar, thanks Source engine lmao
		RunConsoleCommand("sk_fraggrenade_radius", "400")
		RunConsoleCommand("sk_npc_dmg_fraggrenade", "160")
	end)
end

if CLIENT then
	RunConsoleCommand("cl_tfa_3dscope", "1")
	RunConsoleCommand("cl_tfa_3dscope_overlay", "0")
	RunConsoleCommand("cl_tfa_3dscope_quality", "0")
	RunConsoleCommand("cl_tfa_attachments_persist_enabled", "1")
	RunConsoleCommand("cl_tfa_ballistics_fx_bullet", "1")
	RunConsoleCommand("cl_tfa_ballistics_fx_tracers_adv", "1")
	RunConsoleCommand("cl_tfa_ballistics_fx_tracers_mp", "0")
	RunConsoleCommand("cl_tfa_ballistics_fx_tracers_style", "2")
	RunConsoleCommand("cl_tfa_ballistics_mp", "1")
	RunConsoleCommand("cl_tfa_fx_ads_dof_hd", "0")
	RunConsoleCommand("cl_tfa_fx_ejectionsmoke", "0")
	RunConsoleCommand("cl_tfa_fx_ejectionlife", "0")
	RunConsoleCommand("cl_tfa_fx_gasblur", "0")
	RunConsoleCommand("cl_tfa_fx_impact_enabled", "0")
	RunConsoleCommand("cl_tfa_fx_impact_ricochet_enabled", "0")
	RunConsoleCommand("cl_tfa_fx_impact_ricochet_sparklife", "0")
	RunConsoleCommand("cl_tfa_fx_impact_ricochet_sparks", "0")
	RunConsoleCommand("cl_tfa_fx_muzzleflashsmoke", "0")
	RunConsoleCommand("cl_tfa_fx_muzzlesmoke", "0")
	RunConsoleCommand("cl_tfa_fx_muzzlesmoke_limited", "1")
	RunConsoleCommand("cl_tfa_fx_rtscopeblur_intensity", "0.01")
	RunConsoleCommand("cl_tfa_fx_rtscopeblur_mode", "0")
	RunConsoleCommand("cl_tfa_fx_rtscopeblur_passes", "1")
	RunConsoleCommand("cl_tfa_gunbob_custom", "1")
	RunConsoleCommand("cl_tfa_gunbob_invertsway", "1")
	RunConsoleCommand("cl_tfa_gunbob_intensity", "0.65")
	RunConsoleCommand("cl_tfa_hud_ammodata_fadein", "0.20")
	RunConsoleCommand("cl_tfa_hud_enabled", "0")
	RunConsoleCommand("cl_tfa_hud_fallback_enabled", "0")
	RunConsoleCommand("cl_tfa_hud_hangtime", "1")
	RunConsoleCommand("cl_tfa_hud_hitmarker_3d_shotguns", "0")
	RunConsoleCommand("cl_tfa_hud_hitmarker_enabled", "0")
	RunConsoleCommand("cl_tfa_hud_hitmarker_fadetime", "0.04")
	RunConsoleCommand("cl_tfa_hud_hitmarker_solidtime", "0.10")
	RunConsoleCommand("cl_tfa_hud_keybindhints_enabled", "0")
	RunConsoleCommand("cl_tfa_inspect_hide", "0")
	RunConsoleCommand("cl_tfa_inspect_hide_hud", "0")
	RunConsoleCommand("cl_tfa_inspect_hide_in_screenshots", "0")
	RunConsoleCommand("cl_tfa_inspect_newbars", "0")
	RunConsoleCommand("cl_tfa_inspect_spreadinmoa", "1")
	RunConsoleCommand("cl_tfa_inspection_bokeh_radius", "0.010")
	RunConsoleCommand("cl_tfa_ironsights_resight", "1")
	RunConsoleCommand("cl_tfa_ironsights_responsive", "0")
	RunConsoleCommand("cl_tfa_ironsights_responsive_timer", "0.1750")
	RunConsoleCommand("cl_tfa_ironsights_toggle", "0")
	RunConsoleCommand("cl_tfa_laser_color_b", "0")
	RunConsoleCommand("cl_tfa_laser_color_g", "0")
	RunConsoleCommand("cl_tfa_laser_color_r", "255")
	RunConsoleCommand("cl_tfa_laser_trails", "1")
	RunConsoleCommand("cl_tfa_legacy_shells", "0")
	RunConsoleCommand("cl_tfa_scope_sensitivity_3d", "2")
	RunConsoleCommand("cl_tfa_viewbob_animated", "1")
	RunConsoleCommand("cl_tfa_viewbob_intensity", "1.00")
	RunConsoleCommand("cl_tfa_viewmodel_flip", "0")
	RunConsoleCommand("cl_tfa_viewmodel_multiplier_fov", "1")
	RunConsoleCommand("cl_tfa_viewmodel_nearwall", "1")
	RunConsoleCommand("cl_tfa_viewmodel_offset_fov", "0")
	RunConsoleCommand("cl_tfa_viewmodel_offset_x", "1.00")
	RunConsoleCommand("cl_tfa_viewmodel_offset_y", "1")
	RunConsoleCommand("cl_tfa_viewmodel_offset_z", "0")
	RunConsoleCommand("cl_tfa_viewmodel_vp_enabled", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_max_vertical", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_max_vertical_is", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_pitch", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_pitch_is", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_vertical", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_vertical_is", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_yaw", "1")
	RunConsoleCommand("cl_tfa_viewmodel_vp_yaw_is", "1")

	RunConsoleCommand("cl_vmanip_voicechat", "0")

	RunConsoleCommand("tpf_sv_light_forward_offset", "-20")
	RunConsoleCommand("tpf_sv_max_bright", "255")
	RunConsoleCommand("tpf_sv_max_farz", "750")
	RunConsoleCommand("tpf_sv_max_fov", "75")
	RunConsoleCommand("tpf_should_load_defaults", "0")
	RunConsoleCommand("tpf_cl_bright", "255")
	RunConsoleCommand("tpf_cl_farz", "750")
	RunConsoleCommand("tpf_cl_fov", "75")
	RunConsoleCommand("tpf_cl_shadows", "0")

	RunConsoleCommand("cl_tfa_rms_muzzleflash_dynlight", "1")
	if game.GetMap() == "tm_initial" or game.GetMap() == "tm_rust" or game.GetMap() == "tm_shipment" then
		RunConsoleCommand("cl_tfa_rms_muzzleflash_dynlight", "0")
	end
end
