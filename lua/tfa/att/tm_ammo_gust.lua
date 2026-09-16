if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Gust Shells"
ATTACHMENT.ShortName = "GUST"
ATTACHMENT.Icon = "entities/ammo_gust.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Your weapon now knocks you backwards after firing",
	TFA.AttachmentColors["-"], "250% more spread"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
        ["Knockback"] = function(wep, stat) return stat + 275 end,
		["Spread"] = function(wep, stat) return stat * 3.5 end,
		["IronAccuracy"] = function(wep, stat) return stat * 3.5 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
