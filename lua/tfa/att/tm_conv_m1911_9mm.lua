if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9mm"
ATTACHMENT.ShortName = "9mm"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9mm Conversion",
	TFA.AttachmentColors["+"], "40% less recoil",
	TFA.AttachmentColors["-"], "20% less damage",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["RPM"] = function(wep, stat) return 600 end,
		["KickUp"] = function( wep, stat ) return stat * 0.6 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 0.6 end,
		["KickDown"] = function( wep, stat ) return stat * 0.6 end,
		["Sound"] = function( wep, stat ) return Sound("Weapon_Nam_M1911.1.CONV") end,
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
