if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.45"
ATTACHMENT.ShortName = "5.45"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.45x39mm conversion",
	TFA.AttachmentColors["+"], "45% less recoil",
	TFA.AttachmentColors["+"], "20% less spread",
	TFA.AttachmentColors["-"], "15% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.85 end,
		["Spread"] = function(wep, stat) return stat * 0.8 end,
		["KickUp"] = function(wep, stat) return stat * 0.55 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.55 end,
		["KickDown"] = function(wep, stat) return stat * 0.55 end,
		["Sound"] = function(wep, stat) return Sound("Weapon_MG34.1.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
