if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".22 LR"
ATTACHMENT.ShortName = ".22"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "22 Long Rifle Conversion",
	TFA.AttachmentColors["+"], "15% more RPM",
	TFA.AttachmentColors["-"], "20% less damage",
	TFA.AttachmentColors["-"], "50% more horizontal recoil",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["RPM"] = function(wep, stat) return 1035 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 1.5 end,
		["Sound"] = function( wep, stat ) return Sound("TFA_INS2.INSS_MP5A5.Fire.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2.INSS_MP5A5.Fire_Suppressed.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end