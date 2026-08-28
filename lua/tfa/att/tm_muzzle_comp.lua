if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Compensator"
ATTACHMENT.Icon = "entities/r6s_flashhider.png"
ATTACHMENT.ShortName = "COMP"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "10% less horizontal recoil",
	TFA.AttachmentColors["-"], "5% more spread"
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["muzzle_comp"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["muzzle_comp"] = {
			["active"] = true
		}
	},
	["Primary"] = {
		["KickHorizontal"] = function(wep, stat) return stat * 0.9 end,
		["Spread"] = function(wep, stat) return stat * 1.05 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
