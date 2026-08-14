if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9mm"
ATTACHMENT.ShortName = "9mm"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9mm conversion",
	TFA.AttachmentColors["+"], "45% more RPM",
	TFA.AttachmentColors["-"], "20% less damage",
	TFA.AttachmentColors["-"], "45% more spread"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["RPM"] = function(wep, stat) return 950 end,
		["Spread"] = function(wep, stat) return stat * 1.45 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2.ACRC.CONV.1") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2.ACRC.CONV.2") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
