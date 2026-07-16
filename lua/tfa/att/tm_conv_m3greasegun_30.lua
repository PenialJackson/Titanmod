if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".30"
ATTACHMENT.ShortName = ".30"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".30 Carbine Conversion",
	TFA.AttachmentColors["+"], "15% more damage",
	TFA.AttachmentColors["-"], "200% more recoil",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.15 end,
		["KickUp"] = function( wep, stat ) return stat * 3 end,
		["KickDown"] = function( wep, stat ) return stat * 3 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 3 end,
		["Sound"] = function( wep, stat ) return Sound("Weapon_m3grease.1.CONV") end,
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
