if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".45 ACP"
ATTACHMENT.ShortName = ".45"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".45 ACP conversion",
	TFA.AttachmentColors["+"], "100% more RPM",
	TFA.AttachmentColors["-"], "150% more recoil",
	TFA.AttachmentColors["-"], "150% more spread"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["RPM"] = function(wep, stat) return 500 end,
		["Spread"] = function(wep, stat) return stat * 2.5 end,
		["KickUp"] = function(wep, stat) return stat * 2.5 end,
		["KickDown"] = function(wep, stat) return stat * 2.5 end,
		["KickHorizontal"] = function(wep, stat) return stat * 2.5 end,
		["Sound"] = function(wep, stat) return Sound("TFA_DOI_WEBLEY.1.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
