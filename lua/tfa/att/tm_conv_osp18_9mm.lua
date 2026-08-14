if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9mm"
ATTACHMENT.ShortName = "9mm"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "9mm conversion",
	TFA.AttachmentColors["+"], "30% less recoil",
	TFA.AttachmentColors["-"], "15% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.85 end,
		["RPM"] = function(wep, stat) return 600 end,
		["KickUp"] = function(wep, stat) return stat * 0.7 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.7 end,
		["KickDown"] = function(wep, stat) return stat * 0.7 end,
		["Sound"] = function(wep, stat) return Sound("TFA_L4D2.OSP18.1.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
