if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Heavy Barrel"
ATTACHMENT.Icon = "entities/ins2_att_br_heavy.png"
ATTACHMENT.ShortName = "HEAVY"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "5% less recoil",
	TFA.AttachmentColors["-"], "10% slower ADS speed"
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["muzzle_heavy"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["muzzle_heavy"] = {
			["active"] = true
		}
	},
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.95 end,
		["KickDown"] = function(wep, stat) return stat * 0.95 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.95 end
	},
	["IronSightTime"] = function(wep, stat) return stat * 1.1 end
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
