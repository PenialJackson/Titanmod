TM = TM or {}

GM.Name = "Titanmod"
GM.Author = "Penial"
GM.Email = "glass campers on tm_mall turning around to see a bald man crouching with a AA-12"
GM.Website = "https://github.com/PenialJackson/Titanmod"

local gamemode = CreateConVar("tm_gamemode", "1", FCVAR_REPLICATED, "Changes the desired gamemode, requires a map reload.", 1, 10):GetInt()

for mode, info in pairs(GAMEMODES) do
	if info.id == gamemode then
		TM.GAMEMODE = mode

		return
	end
end
