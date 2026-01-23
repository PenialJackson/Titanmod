if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".45 ACP"
ATTACHMENT.ShortName = ".45"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".45 ACP Conversion",
	TFA.AttachmentColors["+"], "45% more damage",
	TFA.AttachmentColors["-"], "65% less RPM",
	TFA.AttachmentColors["-"], "25% more recoil",
	TFA.AttachmentColors["-"], "25% more spread",
	TFA.AttachmentColors["-"], "Flipped recoil pattern"
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.45 end,
		["RPM"] = function(wep, stat) return stat * 0.65 end,
		["Spread"] = function(wep, stat) return stat * 1.25 end,
		["KickUp"] = function( wep, stat ) return stat * -1.25 end,
		["KickDown"] = function( wep, stat ) return stat * -1 end,
		["KickHorizontal"] = function( wep, stat ) return stat * -1.25 end,
		["Sound"] = function( wep, stat ) return Sound("TFA_INS2_KRISSV.1.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2_KRISSV.2.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end