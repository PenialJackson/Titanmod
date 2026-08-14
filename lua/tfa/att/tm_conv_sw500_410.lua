if engine.ActiveGamemode() != "titanmod" then return end

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".410 Bore Gauge"
ATTACHMENT.ShortName = "410"
ATTACHMENT.Icon = "attachments/conversion.png"

ATTACHMENT.Description = {
	TFA.AttachmentColors["="], ".410 Bore Gauge conversion",
	TFA.AttachmentColors["+"], "5 additional pellets",
	TFA.AttachmentColors["+"], "25% less recoil",
	TFA.AttachmentColors["+"], "50% more spread recovery",
	TFA.AttachmentColors["-"], "85% less damage",
	TFA.AttachmentColors["-"], "65% more spread"
}

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {
		[1] = 1
	},
	["VElements"] = {
		["500_shells"] = {
			["active"] = false
		},
		["410_shells"] = {
			["active"] = true
		}
	},
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.75 end,
		["KickDown"] = function(wep, stat) return stat * 0.75 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.75 end,
		["Damage"] = function(wep, stat) return stat * 0.15 end,
		["NumShots"] = function(wep, stat) return stat * 5 end,
		["Spread"] = function(wep, stat) return stat * 1.65 end,
		["IronAccuracy"] = function(wep, stat) return wep.Primary.Spread * 1.65 end,
		["SpreadRecovery"] = function(wep, stat) return stat * 1.5 end
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
