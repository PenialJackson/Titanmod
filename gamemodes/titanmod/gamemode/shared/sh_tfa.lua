-- disable particles
function TFA.Particles.Initialize() end

if CLIENT then
	-- forcefully disable the use of the TFA crosshair
	hook.Add("TFA_DrawCrosshair", "DisableTFACrosshair", function(ply) return true end)

	-- force users selected FOV when spectating
	hook.Add("TFA_TranslateFOV", "DisableClientFOVChange", function(ply)
		if LocalPlayer():Alive() then return end

		if LocalPlayer():GetInfoNum("tm_customfov", 0) == 1 then
			return LocalPlayer():GetInfoNum("tm_customfov_value", 100)
		else
			return LocalPlayer():GetInfoNum("fov_desired", 75)
		end
	end)
end
