if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Slug Ammunition"
ATTACHMENT.ShortName = "Slug"
ATTACHMENT.Description = { TFA.Attachments.Colors["+"], "Much lower spread", TFA.Attachments.Colors["-"], "30% less damage", "One pellet"  }
ATTACHMENT.Icon = "entities/tfa_ammo_slug.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return wep.Primary_TFA.NumShots * stat * 0.7 end,
		["NumShots"] = function( wep, stat ) return 1, true end,
		["Spread"] = function( wep, stat ) return .045, true end,
		["IronAccuracy"] = function( wep, stat ) return 0, true end,
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end