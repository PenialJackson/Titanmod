if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Gust Shells"
ATTACHMENT.ShortName = "GUST"
ATTACHMENT.Icon = "entities/ammo_gust.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Your weapon now knocks you backwards after firing",
	TFA.AttachmentColors["+"], "8 additional pellets",
	TFA.AttachmentColors["-"], "40% less damage",
	TFA.AttachmentColors["-"], "120% more spread"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
        ["Knockback"] = function(wep, stat) return stat + 275 end,
        ["NumShots"] = function(wep, stat) return stat + 8 end,
		["Damage"] = function(wep, stat) return stat * 0.60 end,
		["Spread"] = function(wep, stat) return stat * 2.2 end,
		["IronAccuracy"] = function(wep, stat) return stat * 2.2 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
