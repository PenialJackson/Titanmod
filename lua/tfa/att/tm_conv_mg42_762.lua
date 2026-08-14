if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "7.62"
ATTACHMENT.ShortName = "7.62"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "7.62×51mm conversion",
	TFA.AttachmentColors["+"], "20% more damage",
	TFA.AttachmentColors["-"], "35% less RPM",
	TFA.AttachmentColors["-"], "35% more recoil"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.2 end,
		["RPM"] = function(wep, stat) return 700 end,
		["KickUp"] = function(wep, stat) return stat * 1.35 end,
		["KickDown"] = function(wep, stat) return stat * 1.35 end,
		["KickHorizontal"] = function(wep, stat) return stat * 1.35 end,
		["Sound"] = function(wep, stat) return Sound("Weapon_MG42.1.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
