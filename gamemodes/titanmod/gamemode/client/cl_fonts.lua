local customFont = GetConVar("tm_hud_font")

local function CreateFonts()
	-- MENUS
	surface.CreateFont("GunPrintName", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(56)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("MainMenuLoadoutWeapons", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(26)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("MainMenuDescription", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(24)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("MainMenuTitle", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(45)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("MatchEndText", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(180)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("QuoteText", {
		font = "Tahoma",
		size = math.ceil(TM.MenuScale(22)),
		weight = 200,
		antialias = true,
		italic = true,
		extended = true
	})

	surface.CreateFont("AmmoCountESmall", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(48)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("AmmoCountSmall", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(96)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("OptionsHeader", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(64)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("Health", {
		font = "Tahoma",
		size = math.ceil(TM.MenuScale(30)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("StreakText", {
		font = "Tahoma",
		size = math.ceil(TM.MenuScale(22)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("TitleText", {
		font = "BenderBold",
		size = math.ceil(TM.MenuScale(32)),
		weight = 550,
		antialias = true,
		extended = true
	})

	surface.CreateFont("CaliberText", {
		font = "Tahoma",
		size = math.ceil(TM.MenuScale(18)),
		weight = 550,
		antialias = true,
		extended = true
	})

	surface.CreateFont("PlayerNotiName", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(52)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("SettingsLabel", {
		font = "Arial",
		size = math.ceil(TM.MenuScale(38)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("Menu_GModNotify", {
		font = "Bender",
		size = math.ceil(TM.MenuScale(22)),
		weight = 500,
		antialias = true,
		extended = true
	})

	-- HUD
	surface.CreateFont("HUD_GunPrintName", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(56)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_AmmoCount", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(128)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_WepNameKill", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(28)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_Health", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(30)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_StreakText", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(22)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_PlayerNotiName", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(52)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_PlayerDeathName", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(36)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("HUD_IntermissionText", {
		font = customFont:GetString(),
		size = math.ceil(TM.HUDScale(180)),
		weight = 600,
		antialias = true,
		outline = true,
		extended = true
	})

	surface.CreateFont("HUD_AmmoCountSmall", {
		font = "Arial",
		size = math.ceil(TM.HUDScale(96)),
		weight = 500,
		antialias = true,
		extended = true
	})

	surface.CreateFont("GModNotify", {
		font = customFont:GetString(),
		size = math.ceil(TM.MenuScale(22)),
		weight = 500,
		antialias = true,
		extended = true
	})
end

CreateFonts()

hook.Add("OnScreenSizeChanged", "RefreshFonts", function(_, _, _, _)
	timer.Simple(3, function()
		CreateFonts()
	end)
end)

cvars.AddChangeCallback("tm_hud_scale", function()
	CreateFonts()
end)
