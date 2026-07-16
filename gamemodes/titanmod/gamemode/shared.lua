TM = TM or {}

GM.Name = "Titanmod"
GM.Author = "Penial"
GM.Email = "glass campers on tm_mall turning around to see a bald man crouching with a AA-12"
GM.Website = "https://github.com/PenialJackson/Titanmod"

TM.GAMEMODE = CreateConVar("tm_gamemode", "1", FCVAR_REPLICATED + FCVAR_NOTIFY, "Changes the desired gamemode, requires a map reload.", 1, 10):GetInt()
