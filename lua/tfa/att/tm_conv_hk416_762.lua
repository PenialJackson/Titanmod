if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "7.62"
ATTACHMENT.ShortName = "7.62"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "7.62×51mm conversion",
	TFA.AttachmentColors["+"], "100% more damage",
	TFA.AttachmentColors["-"], "50% less RPM",
	TFA.AttachmentColors["-"], "100% more recoil"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 2 end,
		["RPM"] = function(wep, stat) return 425 end,
		["KickUp"] = function(wep, stat) return stat * 2 end,
		["KickHorizontal"] = function(wep, stat) return stat * 2 end,
		["KickDown"] = function(wep, stat) return stat * 2 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2.HK416.1.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2.HK416.2.CONV") end,
		["Automatic"] = function(wep, stat) return false end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
