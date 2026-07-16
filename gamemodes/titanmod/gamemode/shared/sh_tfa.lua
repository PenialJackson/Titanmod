hook.Add("TFA_GetStat", "AdjustTFAWepStats", function(weapon, stat, value)
	if stat == "Primary.RecoilResetTime" then return 0.2 end

	if stat == "TracerCount" then return 0 end
	if stat == "TracerName" then return "nil" or false end
	if stat == "DisableChambering" then return true end
	if stat == "CrouchRecoilMultiplier" then return 0.8 end
	if stat == "CrouchSpreadMultiplier" then return 0.7 end
	if stat == "IronSightsReloadEnabled" then return true end
	if stat == "IronSightsReloadLock" then return false end

	if stat == "Secondary.IronFOV" then return 70 end
	if stat == "Secondary.Point_Shooting_FOV" then return 70 end

	if stat == "Primary.Range" then return 0.6 * (3280 * 16) end
	if stat == "Primary.RangeFalloff" then return 1 end
end)

-- disable specific TFA attachments
hook.Add("TFABase_ShouldLoadAttachment", "DisableUBGL", function(id, path)
	if id and (id == "ins2_fg_gp25" or id == "ins2_fg_m203" or id == "r6s_flashhider_2" or id == "r6s_h_barrel" or id == "am_gib" or id == "am_magnum" or id == "am_match" or id == "flashlight" or id == "flashlight_lastac" or id == "ins2_eft_lastac2" or id == "tfa_at_fml_flashlight" or id == "un_flashlight" or id == "ins2_ub_flashlight") then
		return false
	end
end)

function TFA.Particles.Initialize() end

if CLIENT then
	-- forcefully disable the use of the TFA crosshair
	hook.Add("TFA_DrawCrosshair", "DisableTFACrosshair", function(ply) return true end)

	-- force users selected FOV when spectating
	hook.Add("TFA_TranslateFOV", "DisableClientFOVChange", function(ply)
		local localPly = LocalPlayer()
		if localPly:Alive() then return end

		if localPly:GetInfoNum("tm_customfov", 0) == 1 then
			return localPly:GetInfoNum("tm_customfov_value", 100)
		else
			return localPly:GetInfoNum("fov_desired", 75)
		end
	end)
end

hook.Add("PreRegisterSWEP", "TFAOverride", function(swep, class)
	if SWEP.Base != "tfa_gun_base" and SWEP.Base != "tm_knife_base" and SWEP.Base != "rust_throwable_melee_base" then return end
end)
