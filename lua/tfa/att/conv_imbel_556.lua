if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.56"
ATTACHMENT.ShortName = "5.56"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.56×45mm Conversion",
	TFA.AttachmentColors["+"], "15% more RPM",
	TFA.AttachmentColors["+"], "40% less recoil",
	TFA.AttachmentColors["-"], "20% less damage",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["RPM"] = function(wep, stat) return 750 end,
		["KickUp"] = function( wep, stat ) return stat * 0.6 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 0.6 end,
		["KickDown"] = function( wep, stat ) return stat * 0.6 end,
		["Sound"] = function( wep, stat ) return Sound("TFA_INS2_ImbelIA2.1.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2_ImbelIA2.Supp_1.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end