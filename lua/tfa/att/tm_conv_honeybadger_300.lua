if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".300"
ATTACHMENT.ShortName = ".300"
ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".300 AAC Blackout Conversion",
	TFA.AttachmentColors["+"], "15% more damage",
	TFA.AttachmentColors["-"], "20% less RPM",
	TFA.AttachmentColors["-"], "100% more vertical recoil",
}
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return stat * 1.15 end,
		["RPM"] = function(wep, stat) return 640 end,
		["KickUp"] = function( wep, stat ) return stat * 2 end,
		["KickDown"] = function( wep, stat ) return stat * 2 end,
		["LoopSound"] = function( wep, stat ) return Sound("TFA_INS2.CQ300.Loop.CONV") end,
		["LoopSoundSilenced"] = function( wep, stat ) return Sound("TFA_INS2.CQ300.Loop_Sil.CONV") end,
		["LoopSoundTail"] = function( wep, stat ) return Sound("TFA_INS2.CQ300.LoopTail.CONV") end,
		["LoopSoundTailSilenced"] = function( wep, stat ) return Sound("TFA_INS2.CQ300.LoopTail_Sil.CONV") end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
