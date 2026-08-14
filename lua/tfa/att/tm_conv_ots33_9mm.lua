if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9mm"
ATTACHMENT.ShortName = "9mm"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9mm conversion",
	TFA.AttachmentColors["+"], "33% less recoil",
	TFA.AttachmentColors["-"], "10% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.9 end,
		["KickUp"] = function(wep, stat) return stat * 0.67 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.67 end,
		["KickDown"] = function(wep, stat) return stat * 0.67 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2.OTS33.Fire.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2.OTS33.Fire_Suppressed.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
