if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.56"
ATTACHMENT.ShortName = "5.56"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.56×45mm conversion",
	TFA.AttachmentColors["+"], "20% less RPM",
	TFA.AttachmentColors["+"], "20% more recoil",
	TFA.AttachmentColors["-"], "15% more damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.15 end,
		["RPM"] = function(wep, stat) return 720 end,
		["KickUp"] = function(wep, stat) return stat * 1.2 end,
		["KickDown"] = function(wep, stat) return stat * 1.2 end,
		["KickHorizontal"] = function(wep, stat) return stat * 1.2 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
