if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9x21"
ATTACHMENT.ShortName = "9x21"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9x21mm Conversion",
	TFA.AttachmentColors["+"], "50% more RPM",
	TFA.AttachmentColors["-"], "20% less damage",
	TFA.AttachmentColors["-"], "85% more recoil",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["RPM"] = function(wep, stat) return 900 end,
		["KickUp"] = function( wep, stat ) return stat * 1.85 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 1.85 end,
		["KickDown"] = function( wep, stat ) return stat * 1.85 end,
		["Sound"] = function( wep, stat ) return Sound("TFA_INS2.CZ75.1.CONV") end,
		["SilencedSound"] = function( wep, stat ) return Sound("TFA_INS2.CZ75.2.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
