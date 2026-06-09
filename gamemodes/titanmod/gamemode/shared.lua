TM = TM or {}

GM.Name = "Titanmod"
GM.Author = "Penial"
GM.Email = "glass campers on tm_mall turning around to see a bald man crouching with a AA-12"
GM.Website = "https://github.com/PikachuPenial/Titanmod"

if !ConVarExists("tm_gamemode") then CreateConVar("tm_gamemode", "0", FCVAR_REPLICATED + FCVAR_NOTIFY, "Changes the desired gamemode, will be replaced with gamemode voting eventually", 0, 9) end

if GetConVar("tm_gamemode"):GetInt() <= 0 then
	SetGlobal2String("ActiveGamemode", "FFA")
elseif GetConVar("tm_gamemode"):GetInt() == 1 then
	SetGlobal2String("ActiveGamemode", "Cranked")
elseif GetConVar("tm_gamemode"):GetInt() == 2 then
	SetGlobal2String("ActiveGamemode", "Gun Game")
elseif GetConVar("tm_gamemode"):GetInt() == 3 then
	SetGlobal2String("ActiveGamemode", "Shotty Snipers")
elseif GetConVar("tm_gamemode"):GetInt() == 4 then
	SetGlobal2String("ActiveGamemode", "Fiesta")
elseif GetConVar("tm_gamemode"):GetInt() == 5 then
	SetGlobal2String("ActiveGamemode", "Quickdraw")
elseif GetConVar("tm_gamemode"):GetInt() == 6 then
	SetGlobal2String("ActiveGamemode", "KOTH")
elseif GetConVar("tm_gamemode"):GetInt() == 7 then
	SetGlobal2String("ActiveGamemode", "VIP")
elseif GetConVar("tm_gamemode"):GetInt() == 8 then
	SetGlobal2String("ActiveGamemode", "Overkill")
elseif GetConVar("tm_gamemode"):GetInt() >= 9 then
	SetGlobal2String("ActiveGamemode", "Fisticuffs")
end
