if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".45 ACP"
ATTACHMENT.ShortName = ".45"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".45 ACP conversion",
	TFA.AttachmentColors["+"], "80% more RPM",
	TFA.AttachmentColors["+"], "50% faster reload time",
	TFA.AttachmentColors["-"], "25% less damage",
	TFA.AttachmentColors["-"], "40% more spread",
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.75 end,
		["RPM"] = function(wep, stat) return 545 end,
		["Spread"] = function(wep, stat) return stat * 1.4 end,
		["Sound"] = function(wep, stat) return Sound("TFA_DOI_ENFIELD.1.CONV") end
	},
	["SequenceRateOverride"] = {
		["base_fire_end"] = 1.8,
		["iron_fire_end"] = 1.8,
		["reload_insert"] = 1.8
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
