if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.45"
ATTACHMENT.ShortName = "545"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.45x39mm Conversion",
	TFA.AttachmentColors["+"], "60% less recoil",
	TFA.AttachmentColors["+"], "20% less spread",
	TFA.AttachmentColors["-"], "20% less RPM",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["RPM"] = function(wep, stat) return 400 end,
		["Spread"] = function( wep, stat ) return stat * 0.8 end,
		["KickUp"] = function( wep, stat ) return stat * 0.4 end,
		["KickHorizontal"] = function( wep, stat ) return stat * 0.4 end,
		["KickDown"] = function( wep, stat ) return stat * 0.4 end,
		["LoopSound"] = function( wep, stat ) return Sound("TFA_Howa_LOOP.1.CONV") end,
		["LoopSoundTail"] = function( wep, stat ) return Sound("TFA_Howa_TAIL.1.CONV") end
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
