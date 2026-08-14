if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "7.63"
ATTACHMENT.ShortName = "7.63"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "7.63x25mm Mauser conversion",
	TFA.AttachmentColors["+"], "75% less recoil",
	TFA.AttachmentColors["+"], "50% less spread",
	TFA.AttachmentColors["-"], "20% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.8 end,
		["Spread"] = function(wep, stat) return stat * 0.5 end,
		["KickUp"] = function(wep, stat) return stat * 0.25 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.25 end,
		["KickDown"] = function(wep, stat) return stat * 0.25 end,
		["Sound"] = function(wep, stat) return Sound("weapons/tfa_ppsh41/mp5k_fp_conv2.wav") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
