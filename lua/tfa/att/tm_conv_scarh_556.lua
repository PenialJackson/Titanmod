if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "5.56"
ATTACHMENT.ShortName = "5.56"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "5.56×45mm conversion",
	TFA.AttachmentColors["+"], "30% more RPM",
	TFA.AttachmentColors["+"], "40% less recoil",
	TFA.AttachmentColors["-"], "30% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 0.7 end,
		["RPM"] = function(wep, stat) return 650 end,
		["KickUp"] = function(wep, stat) return stat * 0.6 end,
		["KickDown"] = function(wep, stat) return stat * 0.6 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.6 end,
		["Sound"] = function(wep, stat) return Sound("TFA_INS2.SCAR_SSR.Fire.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2.SCAR_SSR.Fire_Suppressed.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
