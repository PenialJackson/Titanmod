if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".50 BMG"
ATTACHMENT.ShortName = "BMG"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".50 BMG conversion",
	TFA.AttachmentColors["+"], "75% more damage",
	TFA.AttachmentColors["-"], "300% more recoil",
	TFA.AttachmentColors["-"], "300% more spread"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.75 end,
		["Spread"] = function(wep, stat) return stat * 3 end,
		["KickUp"] = function(wep, stat) return stat * 3 end,
		["KickHorizontal"] = function(wep, stat) return stat * 3 end,
		["KickDown"] = function(wep, stat) return stat * 3 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2.DEAGLE.CONV.1") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2.DEAGLE.CONV.2") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
