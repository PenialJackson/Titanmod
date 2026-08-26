if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Point Shooting"
ATTACHMENT.ShortName   = "POINT"
ATTACHMENT.Icon        = "entities/tfa_tactical_point_shooting.png"

ATTACHMENT.Description = {
    TFA.AttachmentColors["+"], "30% faster ADS speed",
	TFA.AttachmentColors["-"], "60% of spread while ADSing"
}

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["IronAccuracy"] = function(wep, stat) return wep.Primary.Spread * 0.6 end
	},
	["IronSightsPos"] = function(wep, stat) return wep.IronSightsPos_Point_Shooting or stat end,
	["IronSightsAng"] = function(wep, stat) return wep.IronSightsAng_Point_Shooting or stat end,
	["IronSightTime"] = function(wep, stat) return stat * 0.7 end,
	["DrawCrosshairIS"] = true
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
