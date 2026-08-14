if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "7.62"
ATTACHMENT.ShortName = "7.62"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], "7.62×51mm conversion",
	TFA.AttachmentColors["+"], "15% more damage",
	TFA.AttachmentColors["-"], "25% less RPM",
	TFA.AttachmentColors["-"], "30% more recoil"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.175 end,
		["RPM"] = function(wep, stat) return 600 end,
		["KickUp"] = function(wep, stat) return stat * 1.3 end,
		["KickDown"] = function(wep, stat) return stat * 1.3 end,
		["KickHorizontal"] = function(wep, stat) return stat * 1.3 end,
		["Sound"] = function(wep, stat) return Sound("bf3_g53.Single.CONV") end,
		["SilencedSound"] = function(wep, stat) return Sound("TFA_INS2_G3A3.2.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
