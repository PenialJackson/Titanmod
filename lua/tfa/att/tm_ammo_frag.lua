if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Frag Shells"
ATTACHMENT.ShortName = "FRAG"
ATTACHMENT.Icon = "entities/tfa_ammo_fragshell.png"

ATTACHMENT.Description = {
	TFA.Attachments.Colors["+"], "100% more damage",
	TFA.Attachments.Colors["-"], "Halved pellets"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep, stat) return bit.bor(stat or 0, DMG_BLAST) end,
		["Damage"] = function(wep, stat) return stat * 2 end,
		["NumShots"] = function(wep, stat) return stat / 2 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
