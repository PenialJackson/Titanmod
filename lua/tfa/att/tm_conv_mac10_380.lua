if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".380"
ATTACHMENT.ShortName = "380"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".380 ACP conversion",
	TFA.AttachmentColors["+"], "30% more RPM",
	TFA.AttachmentColors["-"], "10% less damage",
	TFA.AttachmentColors["-"], "50% more recoil"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.90 end,
		["RPM"] = function(wep, stat) return 1444 end,
		["KickUp"] = function(wep, stat) return stat * 1.5 end,
		["KickDown"] = function(wep, stat) return stat * 1.5 end,
		["KickHorizontal"] = function(wep, stat) return stat * 1.5 end,
		-- ["Sound"] = function(wep, stat) return Sound("weapons/cw_mac10/MAC_WZ_conv.wav") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
