if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.45"
ATTACHMENT.ShortName = "5.45"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.45x39mm conversion",
	TFA.AttachmentColors["+"], "50% less recoil",
	TFA.AttachmentColors["+"], "25% less spread",
	TFA.AttachmentColors["-"], "20% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["Spread"] = function(wep, stat) return stat * 0.75 end,
		["KickUp"] = function(wep, stat) return stat * 0.5 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.5 end,
		["KickDown"] = function(wep, stat) return stat * 0.5 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2_AKS.1.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2_AKS.2.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
