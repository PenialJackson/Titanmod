if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Dragon's Breath Shells"
ATTACHMENT.ShortName   = "DRGN"
ATTACHMENT.Icon        = "entities/dragon_breach_shell.png"

ATTACHMENT.Description = {
    TFA.Attachments.Colors["+"], "6 additional pellets",
    TFA.Attachments.Colors["-"], "66% more spread",
	TFA.Attachments.Colors["-"], "33% less damage"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["DamageType"] = function(wep, stat) return bit.bor(stat or 0, DMG_BURN) end,
        ["NumShots"] = function(wep, stat) return stat + 6 end,
		["Spread"] = function(wep, stat) return stat * 1.66 end,
		["IronAccuracy"] = function(wep, stat) return stat * 1.66 end,
		["Damage"] = function(wep, stat) return stat * 0.6 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
