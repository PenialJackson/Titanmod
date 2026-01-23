if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".280"
ATTACHMENT.ShortName = ".280"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".280 British Conversion",
	TFA.AttachmentColors["+"], "50% less recoil",
	TFA.AttachmentColors["-"], "20% less damage",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.75 end,
		["KickUp"] = function( wep, stat ) return stat * 0.5 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 0.5 end,
		["KickDown"] = function( wep, stat ) return stat * 0.5 end,
		["Sound"] = function( wep, stat ) return Sound("TFA_INS2.FAL.Fire.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2.FAL.Fire_Suppressed.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end