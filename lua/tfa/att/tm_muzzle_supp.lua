if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Suppressor"
ATTACHMENT.Icon = "entities/ins2_att_br_supp.png"
ATTACHMENT.ShortName = "SUPP"

ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Less firing noise",
	TFA.AttachmentColors["+"], "Less muzzle flash",
	TFA.AttachmentColors["-"], "10% more spread"
}

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["suppressor"] = {
			["active"] = true
		},
		["standard_barrel"] = {
			["active"] = false
		}
	},
	["WElements"] = {
		["suppressor"] = {
			["active"] = true
		},
		["standard_barrel"] = {
			["active"] = false
		}
	},
	["Primary"] = {
		["Spread"] = function(wep, stat) return stat * 1.1 end,
		["Sound"] = function(wep, stat) return wep.Primary.SilencedSound or stat end
	},
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
	["MuzzleAttachmentMod"] = function(wep, stat) return wep.MuzzleAttachmentSilenced or stat end,
	["Silenced"] = true
}

function ATTACHMENT:Attach(wep)
	wep.Silenced = true
	wep:SetSilenced(wep.Silenced)
end

function ATTACHMENT:Detach(wep)
	wep.Silenced = false
	wep:SetSilenced(wep.Silenced)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
