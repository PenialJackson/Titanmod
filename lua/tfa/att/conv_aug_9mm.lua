if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9mm"
ATTACHMENT.ShortName = "9mm"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9mm Conversion",
	TFA.AttachmentColors["+"], "30% more RPM",
	TFA.AttachmentColors["-"], "15% less damage",
	TFA.AttachmentColors["-"], "45% more spread",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.85 end,
		["RPM"] = function(wep, stat) return 925 end,
		["Spread"] = function( wep, stat ) return stat * 1.45 end,
		["Sound"] = function( wep, stat ) return Sound("qbu88_1.Single.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2_M4A1.2.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end