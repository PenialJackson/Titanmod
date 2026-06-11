-- fuck me
local possibleSpawnEnts = {
	["info_player_start"] = true,
	["info_player_deathmatch"] = true,
	["info_player_combine"] = true,
	["info_player_rebel"] = true,
	["info_coop_spawn"] = true,
	["info_player_counterterrorist"] = true,
	["info_player_terrorist"] = true,
	["info_player_axis"] = true,
	["info_player_allies"] = true,
	["gmod_player_start"] = true,
	["info_player_teamspawn"] = true,
	["ins_spawnpoint"] = true,
	["aoc_spawnpoint"] = true,
	["dys_spawn_point"] = true,
	["info_player_pirate"] = true,
	["info_player_viking"] = true,
	["info_player_knight"] = true,
	["diprip_start_team_blue"] = true,
	["diprip_start_team_red"] = true,
	["info_player_red"] = true,
	["info_player_blue"] = true,
	["info_player_coop"] = true,
	["info_player_human"] = true,
	["info_player_zombie"] = true,
	["info_player_zombiemaster"] = true,
	["info_player_fof"] = true,
	["info_player_desperado"] = true,
	["info_player_vigilante"] = true,
	["info_survivor_rescue"] = true,
	["info_player_attacker"] = true,
	["info_player_defender"] = true,
	["info_ff_teamspawn"] = true
}

local possibleSpawns = {}

hook.Add("InitPostEntity", "GetSuitableSpawnpoints", function()
	for _, ent in ipairs(ents.GetAll()) do
		if (possibleSpawnEnts[ent:GetClass()]) then
			possibleSpawns[#possibleSpawns + 1] = ent
		end
	end
end)

hook.Add("PlayerSelectSpawn", "HideoutSpawning", function(_)
	if possibleSpawns[1] == nil then return false end

	for i = 1, #possibleSpawns do
		local spawn = possibleSpawns[math.random(#possibleSpawns)]
		local entities = ents.FindInSphere(spawn:GetPos(), 512)
		local blocked = false

		for _, e in ipairs(entities) do
			if !e:IsPlayer() or !e:Alive() then continue end
			blocked = true
			break
		end

		if !blocked then return spawn end
	end

	-- fallback
	local plys = player.GetHumans()
	local safestSpawn = nil
	local maxMinDistance = -1

	for i = 1, #possibleSpawns do
		local spawn = possibleSpawns[math.random(#possibleSpawns)]
		local minDistance = math.huge

		for _, ply in ipairs(plys) do
			if ply:Alive() then
				local distance = spawn:GetPos():DistToSqr(ply:GetPos())
				minDistance = math.min(minDistance, distance)
			end
		end

		if minDistance > maxMinDistance then
			maxMinDistance = minDistance
			safestSpawn = spawn
		end
	end

	return safestSpawn
end)
