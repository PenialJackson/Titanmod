if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.56"
ATTACHMENT.ShortName = "5.56"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.56×45mm conversion",
	TFA.AttachmentColors["+"], "75% less recoil",
	TFA.AttachmentColors["-"], "25% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.75 end,
		["KickUp"] = function(wep, stat) return stat * 0.25 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.25 end,
		["KickDown"] = function(wep, stat) return stat * 0.25 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2_RFB.1.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2_RFB.2.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
