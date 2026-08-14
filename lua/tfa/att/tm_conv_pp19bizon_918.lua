if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9x18"
ATTACHMENT.ShortName = "9x18"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9x18 Makarov conversion",
	TFA.AttachmentColors["+"], "20% more damage",
	TFA.AttachmentColors["-"], "30% less RPM",
	TFA.AttachmentColors["-"], "45% more recoil"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.2 end,
		["RPM"] = function(wep, stat) return 500 end,
		["KickUp"] = function(wep, stat) return stat * 1.45 end,
		["KickDown"] = function(wep, stat) return stat * 1.45 end,
		["KickHorizontal"] = function(wep, stat) return stat * 1.45 end,
		["Sound"] = function(wep, stat) return Sound("weapons/fas2_ppbizon/bizon_fire1_conv2.wav") end,
		["SilencedSound"] = function(wep, stat) return Sound("weapons/fas2_ppbizon/bizon_suppressed_fire1_conv2.wav") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
