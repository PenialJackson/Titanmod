hook.Add("PlayerFootstep", "MuteCrouchFootsteps", function(ply)
	if !ply:Crouching() then return end

	return true
end)

hook.Add("PlayerDeathSound", "OverrideDeathSound", function()
	return true
end)
