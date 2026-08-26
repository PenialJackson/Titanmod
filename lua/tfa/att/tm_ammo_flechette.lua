if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Flechette Shells"
ATTACHMENT.ShortName   = "FLECH"
ATTACHMENT.Icon        = "entities/flechetterounds.png"

ATTACHMENT.Description = {
    TFA.AttachmentColors["+"], "25% less spread",
    TFA.AttachmentColors["+"], "8 additional pellets",
    TFA.AttachmentColors["-"], "60% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
        ["IronAccuracy"] = function(wep, stat) return stat * 0.75 end,
        ["Spread"] = function(wep, stat) return stat * 0.75 end,
        ["NumShots"] = function(wep, stat) return stat + 8 end,
        ["Damage"] = function(wep, stat) return stat * 0.4 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
