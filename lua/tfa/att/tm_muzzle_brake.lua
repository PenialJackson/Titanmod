if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Muzzle Brake"
ATTACHMENT.Icon = "entities/r6s_muzzlebreak.png"
ATTACHMENT.ShortName = "BRAKE"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "10% less vertical recoil",
	TFA.AttachmentColors["-"], "5% more spread"
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["muzzle_brake"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["muzzle_brake"] = {
			["active"] = true
		}
	},
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.9 end,
		["KickDown"] = function(wep, stat) return stat * 0.9 end,
		["Spread"] = function(wep, stat) return stat * 1.05 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
