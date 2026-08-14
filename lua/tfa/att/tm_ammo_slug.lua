if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Slug Round"
ATTACHMENT.ShortName = "SLUG"
ATTACHMENT.Icon = "entities/tfa_ammo_slug.png"

ATTACHMENT.Description = {
	TFA.Attachments.Colors["+"], "50% less spread",
	TFA.Attachments.Colors["-"], "30% less damage",
	TFA.Attachments.Colors["-"], "One pellet"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function(wep, stat) return wep.Primary_TFA.NumShots * stat * 0.7 end,
		["NumShots"] = function(wep, stat) return 1 end,
		["Spread"] = function(wep, stat) return stat * 0.5 end,
		["IronAccuracy"] = function(wep, stat) return 0 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
