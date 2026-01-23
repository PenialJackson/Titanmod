if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "8mm"
ATTACHMENT.ShortName = "8mm"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "8mm Kurz Conversion",
	TFA.AttachmentColors["+"], "20% more damage",
	TFA.AttachmentColors["-"], "40% less RPM",
	TFA.AttachmentColors["-"], "40% more recoil",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.2 end,
		["RPM"] = function(wep, stat) return 400 end,
		["KickUp"] = function( wep, stat ) return stat * 1.4 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 1.4 end,
		["Sound"] = function( wep, stat ) return Sound("Weapon_mp40.1.CONV") end,
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end