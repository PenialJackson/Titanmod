GAMEMODES = {
	["ffa"] = {
		id = 1,
		name = "FFA",
		desc = "Kill others with randomly generated loadouts",
		special = false,
		popupDesc = "Eliminate other players",
		popupWinCondition = "Get the most score to WIN"
	},

	["cranked"] = {
		id = 2,
		name = "Cranked",
		desc = "Kills grant increased movement capabilities",
		special = true,
		popupDesc = "Eliminate other players, movement boost on kill",
		popupWinCondition = "Get the most score to WIN"
	},

	["gun_game"] = {
		id = 3,
		name = "Gun Game",
		desc = "Progress throguh a ladder of weapons",
		special = false,
		popupDesc = "Eliminate other players to advance to the next weapon",
		popupWinCondition = "Get a kill with every each to WIN"
	},

	["shotty_snipers"] = {
		id = 4,
		name = "Shotty Snipers",
		desc = "Loadouts always consisting of a sniper and a shotgun",
		special = true,
		popupDesc = "Eliminate other players with snipers and shotguns",
		popupWinCondition = "Get the most score to WIN"
	},

	["fiesta"] = {
		id = 5,
		name = "Fiesta",
		desc = "Everyone shares the same loadout, with a new loadout being given periodically",
		special = false,
		popupDesc = "Eliminate other players with constantly changing loadouts",
		popupWinCondition = "Get the most score to WIN"
	},

	["quickdraw"] = {
		id = 6,
		name = "Quickdraw",
		desc = "Secondary weapons only",
		special = false,
		popupDesc = "Eliminate other players with secondaries",
		popupWinCondition = "Get the most score to WIN"
	},

	["koth"] = {
		id = 7,
		name = "KOTH",
		desc = "Stand on the hill to periodically earn extra score",
		special = true,
		popupDesc = "Capture and defend the objective",
		popupWinCondition = "Get the most score to WIN"
	},

	["vip"] = {
		id = 8,
		name = "VIP",
		desc = "Fight over the VIP status, earning extra score",
		special = true,
		popupDesc = "Track down and kill the VIP to take the crown",
		popupWinCondition = "Get the most score to WIN"
	},

	["overkill"] = {
		id = 9,
		name = "Overkill",
		desc = "No traditional loadout restrictions",
		special = false,
		popupDesc = "Eliminate other players with no loadout restrictions",
		popupWinCondition = "Get the most score to WIN"
	},

	["fisticuffs"] = {
		id = 10,
		name = "Fisticuffs",
		desc = "Melee weapons only",
		special = true,
		popupDesc = "Eliminate other players with melee weapons",
		popupWinCondition = "Get the most score to WIN"
	}
}

MAPS = {
	["tm_arctic"] = {
		name = "Arctic",
		thumbnail = "maps/thumb/tm_arctic.png",
		compact = false,
		kothOrigin = Vector(504, 384, 320),
		kothSize = Vector(120, 112, 64)
	},

	["tm_bridge"] = {
		name = "Bridge",
		thumbnail = "maps/thumb/tm_bridge.png",
		compact = false,
		kothOrigin = Vector(-3552, 96, 484),
		kothSize = Vector(224, 288, 64)
	},

	["tm_corrugated"] = {
		name = "Corrugated",
		thumbnail = "maps/thumb/tm_corrugated.png",
		compact = false,
		kothOrigin = Vector(192, 516, 188),
		kothSize = Vector(64, 252, 60)
	},

	["tm_cradle"] = {
		name = "Cradle",
		thumbnail = "maps/thumb/tm_cradle.png",
		compact = false,
		kothOrigin = Vector(0, 0, 0),
		kothSize = Vector(64, 256, 64)
	},

	["tm_disequilibrium"] = {
		name = "Disequilibrium",
		thumbnail = "maps/thumb/tm_disequilibrium.png",
		compact = false,
		kothOrigin = Vector(-280, 1940, 1064),
		kothSize = Vector(96, 100, 72)
	},

	["tm_grid"] = {
		name = "Grid",
		thumbnail = "maps/thumb/tm_grid.png",
		compact = false,
		kothOrigin = Vector(0, -1408, -560),
		kothSize = Vector(128, 256, 112)
	},

	["tm_initial"] = {
		name = "Initial",
		thumbnail = "maps/thumb/tm_initial.png",
		compact = true,
		kothOrigin = Vector(-136, 0, 68),
		kothSize = Vector(104, 128, 68)
	},

	["tm_legacy"] = {
		name = "Legacy",
		thumbnail = "maps/thumb/tm_legacy.png",
		compact = true,
		kothOrigin = Vector(-352, -416, 512),
		kothSize = Vector(148, 148, 64)
	},

	["tm_liminal_pool"] = {
		name = "Liminal Pool",
		thumbnail = "maps/thumb/tm_liminal_pool.png",
		compact = false,
		kothOrigin = Vector(0, 1184, 144),
		kothSize = Vector(128, 176, 80)
	},

	["tm_mall"] = {
		name = "Mall",
		thumbnail = "maps/thumb/tm_mall.png",
		compact = false,
		kothOrigin = Vector(2180, 1536, 72),
		kothSize = Vector(108, 216, 64)
	},

	["tm_mephitic"] = {
		name = "Mephitic",
		thumbnail = "maps/thumb/tm_mephitic.png",
		compact = false,
		kothOrigin = Vector(960, -320, 2748),
		kothSize = Vector(96, 96, 60)
	},

	["tm_nuketown"] = {
		name = "Nuketown",
		thumbnail = "maps/thumb/tm_nuketown.png",
		compact = true,
		kothOrigin = Vector(-89, 238, 128),
		kothSize = Vector(108, 120, 64)
	},

	["tm_oxide"] = {
		name = "Oxide",
		thumbnail = "maps/thumb/tm_oxide.png",
		compact = false,
		kothOrigin = Vector(550, 1800, -176),
		kothSize = Vector(192, 144, 64)
	},

	["tm_rig"] = {
		name = "Rig",
		thumbnail = "maps/thumb/tm_rig.png",
		compact = false,
		kothOrigin = Vector(-1024, -1024, -584),
		kothSize = Vector(256, 256, 128)
	},

	["tm_rust"] = {
		name = "Rust",
		thumbnail = "maps/thumb/tm_rust.png",
		compact = true,
		kothOrigin = Vector(608, 1252, -196),
		kothSize = Vector(164, 144, 128)
	},

	["tm_sanctuary"] = {
		name = "Sanctuary",
		thumbnail = "maps/thumb/tm_sanctuary.png",
		compact = false,
		kothOrigin = Vector(-472, 888, 10),
		kothSize = Vector(152, 168, 90)
	},

	["tm_shipment"] = {
		name = "Shipment",
		thumbnail = "maps/thumb/tm_shipment.png",
		compact = true,
		kothOrigin = Vector(0, 0, 64),
		kothSize = Vector(64, 64, 64)
	},

	["tm_shoot_house"] = {
		name = "Shoot House",
		thumbnail = "maps/thumb/tm_shoot_house.png",
		compact = true,
		kothOrigin = Vector(-168, -437, 192),
		kothSize = Vector(168, 116.5, 63.5)
	},

	["tm_station"] = {
		name = "Station",
		thumbnail = "maps/thumb/tm_station.png",
		compact = false,
		kothOrigin = Vector(-300, 496, 468),
		kothSize = Vector(108, 264, 62)
	},

	["tm_villa"] = {
		name = "Villa",
		thumbnail = "maps/thumb/tm_villa.png",
		compact = false,
		kothOrigin = Vector(128, -880, -64),
		kothSize = Vector(128, 112, 64)
	},

	["tm_wreck"] = {
		name = "Wreck",
		thumbnail = "maps/thumb/tm_wreck.png",
		compact = false,
		kothOrigin = Vector(244, -192, 8),
		kothSize = Vector(140, 112, 80)
	}
}

WEPCLASSES = {}
WEPCLASSES.Primary = 1
WEPCLASSES.Secondary = 2
WEPCLASSES.Melee = 3
WEPCLASSES.None = 4

WEPTYPES = {}
WEPTYPES.Rifle = 1
WEPTYPES.SMG = 2
WEPTYPES.LMG = 3
WEPTYPES.Shotgun = 4
WEPTYPES.Sniper = 5
WEPTYPES.Pistol = 6
WEPTYPES.Melee = 7
WEPTYPES.Explosive = 8
WEPTYPES.Special = 9
WEPTYPES.None = 10

WEAPONS = {
	["tfa_ins2_aa12"] = {name = "AA-12", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_ins2_acrc"] = {name = "ACR", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_aek971"] = {name = "AEK-971", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_ak12"] = {name = "AK-12", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_akms"] = {name = "AK-47", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_aks_r"] = {name = "AKS-74U", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_cold_war_american180"] = {name = "American-180", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_abakan"] = {name = "AN-94", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_ar57"] = {name = "AR-57", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_inss_asval"] = {name = "AS-VAL", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_pd2_ash12"] = {name = "ASh-12", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_fml_csgo_aug"] = {name = "AUG A2", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_wpn_avt40"] = {name = "AVT-40", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_cod_accuracy_international_l115a3"] = {name = "AWM", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_warface_ax308"] = {name = "AX-308", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_barrett_m98_bravo"] = {name = "Barrett M98B", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_mx4"] = {name = "Beretta Mx4", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["rust_bow"] = {name = "Bow", class = WEPCLASSES.Secondary, type = WEPTYPES.Special},
	["tfa_bo3_bowiezm"] = {name = "Bowie Knife", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_br99"] = {name = "BR99", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_doibren"] = {name = "Bren", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_bo3_butterfly"] = {name = "Butterfly Knife", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_bo3_bowie"] = {name = "Carver", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_m4_9mm"] = {name = "Colt 9mm", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_coonan_357"] = {name = "Coonan .357", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["rust_crossbow"] = {name = "Crossbow", class = WEPCLASSES.Primary, type = WEPTYPES.Special},
	["tfa_ins2_cz75"] = {name = "CZ 75", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_cz805"] = {name = "CZ 805", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["yurie_eft_semin_push_dagger"] = {name = "Dagger", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_deagle"] = {name = "Desert Eagle", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_warface_amp_dsr1"] = {name = "DSR-50", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_dualmac"] = {name = "Dual MAC-10s", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_l4d2_skorpion_dual"] = {name = "Dual Skorpions", class = WEPCLASSES.Primary, type = WEPTYPES.Pistol},
	["tfa_ins2_famas"] = {name = "FAMAS", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_doifg42"] = {name = "FG42", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_bo3_axe"] = {name = "Fire Axe", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_bo3_fists"] = {name = "Fists", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_fiveseven_eft"] = {name = "Five-seveN", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_codww2_flamethrower"] = {name = "Flamethrower", class = WEPCLASSES.Primary, type = WEPTYPES.Special},
	["tfa_ins2_fn_2000"] = {name = "FN 2000", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_fn_fal"] = {name = "FN FAL", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_fnp45"] = {name = "FNP-45", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_g28"] = {name = "G28", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_g36a1"] = {name = "G36A1", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_wpn_g3a3"] = {name = "G3A3", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_wpn_imigalilarm"] = {name = "Galil", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_glk_gen4"] = {name = "Glock 17", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["grenade"] = {name = "Grenade", class = WEPCLASSES.None, type = WEPTYPES.Explosive},
	["tfa_ins2_groza"] = {name = "Groza", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_gsh18"] = {name = "GSH-18", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_hk416"] = {name = "HK416", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_fml_hk53"] = {name = "HK53", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_cq300"] = {name = "Honey Badger", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_howa_type_64"] = {name = "Howa Type 64", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_imbelia2"] = {name = "Imbel IA2", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_warface_cheytac_m200"] = {name = "Intervention", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["ryry_tfa_chainsaw"] = {name = "KAC ChainSAW", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_doi_kar98k"] = {name = "Kar98k", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_karambit"] = {name = "Karambit", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_km2000_knife"] = {name = "KM-2000", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_krissv"] = {name = "KRISS Vector", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_coldwar_ks23"] = {name = "KS-23", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_ins2_ksg"] = {name = "KSG", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["yurie_eft_united_cutlery_m48_kukri"] = {name = "Kukri", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_l85a2"] = {name = "L85", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_doi_enfield"] = {name = "Lee Enfield", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_doilewis"] = {name = "Lewis Gun", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_zm_lr300"] = {name = "LR-300", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_doi_garand"] = {name = "M1 Garand", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_usurper"] = {name = "M134 Minigun", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_m14retro"] = {name = "M14", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	[""] = {name = "M1911", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_doim1918"] = {name = "M1918", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_doim1919"] = {name = "M1919", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_minimi"] = {name = "M249", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_doim3greasegun"] = {name = "M3 Grease Gun", class = WEPCLASSES.Secondary, type = WEPTYPES.SMG},
	["tfa_ins2_colt_m45"] = {name = "M45A1", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_eftm4a1"] = {name = "M4A1", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_nam_m79"] = {name = "M79", class = WEPCLASSES.Primary, type = WEPTYPES.Explosive},
	["tfa_ins2_m9"] = {name = "M9", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ilopn_m9_phrobis"] = {name = "M9 Bayonet", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["bocw_mac10_alt"] = {name = "MAC-10", class = WEPCLASSES.Secondary, type = WEPTYPES.SMG},
	["tfa_ararebo_bf1"] = {name = "Mace", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_pm"] = {name = "Makarov", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_tfre_maresleg"] = {name = "Mare's Leg", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_fml_lefrench_mas38"] = {name = "Mas 38", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_doimg34"] = {name = "MG34", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_doimg42"] = {name = "MG42", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_mk14ebr"] = {name = "MK 14 EBR", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_mk23"] = {name = "MK 23", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_fml_inss_mk18"] = {name = "MK18", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_swmodel10"] = {name = "Model 10", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_mosin_nagant"] = {name = "Mosin Nagant", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_doimp40"] = {name = "MP40", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_mp443"] = {name = "MP-443", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ww1_mp18"] = {name = "MP18", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_inss2_hk_mp5a5"] = {name = "MP5", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_mp5k"] = {name = "MP5K", class = WEPCLASSES.Secondary, type = WEPTYPES.SMG},
	["tfa_ins2_mp7"] = {name = "MP7", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_warface_bt_mp9"] = {name = "MP9", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_jw_tti_mpx"] = {name = "MPX", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_mr96"] = {name = "MR-96", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_pd2_remington_msr"] = {name = "MSR", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_mc255"] = {name = "MTs225", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_bocw_nailgun"] = {name = "Nailgun", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_nova"] = {name = "Nova", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_bo3_nunchucks"] = {name = "Nunchucks", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_l4d2_osp18"] = {name = "OSP-18", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_ots_33_pernach"] = {name = "OTs-33 Pernach", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_doiowen"] = {name = "Owen Gun", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_p320_m18"] = {name = "P320", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_fml_p90_tac"] = {name = "P90", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_blast_pindadss2"] = {name = "Pindad SS2", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_pkp"] = {name = "PKP", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_pm9"] = {name = "PM-9", class = WEPCLASSES.Secondary, type = WEPTYPES.SMG},
	["tfa_fas2_ppbizon"] = {name = "PP-19 Bizon", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_nam_ppsh41"] = {name = "PPSH", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ww2_pbz39"] = {name = "PzB 39", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_norinco_qbz97"] = {name = "QBZ-97", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_qsz92"] = {name = "QSZ-92", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["yurie_eft_red_rebel_axe"] = {name = "Red Rebel", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_remington_m870"] = {name = "Remington M870", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_ins2_rfb"] = {name = "RFB", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["swat_shield"] = {name = "Riot Shield", class = WEPCLASSES.Secondary, type = WEPTYPES.Melee},
	["tfa_ins2_rpg7_scoped"] = {name = "RPG-7", class = WEPCLASSES.Primary, type = WEPTYPES.Explosive},
	["tfa_ins2_rpk_74m"] = {name = "RPK-74M", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_s&w_500"] = {name = "S&W 500", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_izh43sw"] = {name = "Sawed Off", class = WEPCLASSES.Secondary, type = WEPTYPES.Shotgun},
	["tfa_ins2_scar_h_ssr"] = {name = "SCAR-H", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_scarl"] = {name = "SCAR-L", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_sc_evo"] = {name = "Scorpion Evo", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_l4d2_skorpion"] = {name = "Skorpion", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_sks"] = {name = "SKS", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_spas12"] = {name = "SPAS-12", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_ins2_spectre"] = {name = "Spectre M4", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_saiga_spike"] = {name = "Spike X1S", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_sr25_eft"] = {name = "SR-25", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_sr2m_veresk"] = {name = "SR-2M", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_doisten"] = {name = "Sten", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_nam_stevens620"] = {name = "Stevens 620", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_doistg44"] = {name = "StG 44", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_wpn_kacstoner"] = {name = "Stoner LMG A1", class = WEPCLASSES.Primary, type = WEPTYPES.LMG},
	["tfa_ins2_sv98"] = {name = "SV-98", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_warface_orsis_t5000"] = {name = "T-5000", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_japanese_exclusive_tanto"] = {name = "Tanto", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins_sandstorm_tariq"] = {name = "Tariq", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["st_stim_pistol"] = {name = "TCo Stim Pistol", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_doithompsonm1928"] = {name = "Thompson M1928", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_doithompsonm1a1"] = {name = "Thompson M1A1", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_tridagger"] = {name = "Tri-Dagger", class = WEPCLASSES.Melee, type = WEPTYPES.Melee},
	["tfa_ins2_typhoon12"] = {name = "Typhoon F12", class = WEPCLASSES.Primary, type = WEPTYPES.Shotgun},
	["tfa_ins2_ump45"] = {name = "UMP", class = WEPCLASSES.Primary, type = WEPTYPES.SMG},
	["tfa_ins2_usp_match"] = {name = "USP", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_imi_uzi"] = {name = "Uzi", class = WEPCLASSES.Secondary, type = WEPTYPES.SMG},
	["tfa_ins2_vhsd2"] = {name = "VHS-D2", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle},
	["tfa_ins2_wa2000"] = {name = "WA-2000", class = WEPCLASSES.Primary, type = WEPTYPES.Sniper},
	["tfa_ins2_walther_p99"] = {name = "Walther P99", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_doi_webley"] = {name = "Webley", class = WEPCLASSES.Secondary, type = WEPTYPES.Pistol},
	["tfa_ins2_xm8"] = {name = "XM8", class = WEPCLASSES.Primary, type = WEPTYPES.Rifle}
}

LEVELARRAY = {}
LEVELARRAY[1] = 750 -- +75 XP
LEVELARRAY[2] = 825
LEVELARRAY[3] = 900
LEVELARRAY[4] = 975
LEVELARRAY[5] = 1050
LEVELARRAY[6] = 1125
LEVELARRAY[7] = 1200
LEVELARRAY[8] = 1275
LEVELARRAY[9] = 1350
LEVELARRAY[10] = 1450 -- +100 XP
LEVELARRAY[11] = 1550
LEVELARRAY[12] = 1650
LEVELARRAY[13] = 1750
LEVELARRAY[14] = 1850
LEVELARRAY[15] = 1950
LEVELARRAY[16] = 2050
LEVELARRAY[17] = 2150
LEVELARRAY[18] = 2250
LEVELARRAY[19] = 2350
LEVELARRAY[20] = 2475 -- +125 XP
LEVELARRAY[21] = 2600
LEVELARRAY[22] = 2725
LEVELARRAY[23] = 2850
LEVELARRAY[24] = 2975
LEVELARRAY[25] = 3100
LEVELARRAY[26] = 3225
LEVELARRAY[27] = 3350
LEVELARRAY[28] = 3475
LEVELARRAY[29] = 3600
LEVELARRAY[30] = 3750 -- +150 XP
LEVELARRAY[31] = 3900
LEVELARRAY[32] = 4050
LEVELARRAY[33] = 4200
LEVELARRAY[34] = 4350
LEVELARRAY[35] = 4500
LEVELARRAY[36] = 4650
LEVELARRAY[37] = 4800
LEVELARRAY[38] = 4950
LEVELARRAY[39] = 5100
LEVELARRAY[40] = 5275 -- +175 XP
LEVELARRAY[41] = 5450
LEVELARRAY[42] = 5625
LEVELARRAY[43] = 5800
LEVELARRAY[44] = 5975
LEVELARRAY[45] = 6150
LEVELARRAY[46] = 6325
LEVELARRAY[47] = 6500
LEVELARRAY[48] = 6675
LEVELARRAY[49] = 6850
LEVELARRAY[50] = 7050 -- +200 XP
LEVELARRAY[51] = 7250
LEVELARRAY[52] = 7450
LEVELARRAY[53] = 7650
LEVELARRAY[54] = 7850
LEVELARRAY[55] = 8050
LEVELARRAY[56] = 8250
LEVELARRAY[57] = 8450
LEVELARRAY[58] = 8650
LEVELARRAY[59] = 8850
LEVELARRAY[60] = "prestige"

GEAR = {}
GEAR[1] = {"tfa_bo3_fists", "Fists", "models/weapons/bo3_melees/fists/w_fists.mdl", "default", "default", "default"}
GEAR[2] = {"tfa_km2000_knife", "KM-2000", "models/weapons/w_km2000_knife.mdl", "default", "default", "default"}
GEAR[3] = {"tfa_ararebo_bf1", "Mace", "models/weapons/w_ararebo.mdl", "default", "default", "default"}
GEAR[4] = {"tfa_japanese_exclusive_tanto", "Tanto", "models/weapons/w_tanto_knife.mdl", "default", "default", "default"}
GEAR[5] = {"yurie_eft_semin_push_dagger", "Dagger", "models/yurie/eft/weapons/world/push_dagger.mdl", "melee", 100, 45}
GEAR[6] = {"tfa_ins2_tridagger", "Tri-Dagger", "models/weapons/w_tridagger_dooktr.mdl", "melee", 200, 90}
GEAR[7] = {"tfa_ilopn_m9_phrobis", "M9 Bayonet", "models/weapons/w_knife_m9_phrobis.mdl", "melee", 300, 135}
GEAR[8] = {"tfa_bo3_bowiezm", "Bowie Knife", "models/weapons/bo3_melees/bowiezm/w_bowiezm.mdl", "melee", 400, 180}
GEAR[9] = {"yurie_eft_united_cutlery_m48_kukri", "Kukri", "models/yurie/eft/weapons/world/m48_kukri.mdl", "melee", 500, 225}
GEAR[10] = {"tfa_bo3_bowie", "Carver", "models/weapons/bo3_melees/bowie/w_bowie.mdl", "melee", 600, 315}
GEAR[11] = {"tfa_karambit", "Karambit", "models/weapons/w_knife_karambit.mdl", "melee", 700, 360}
GEAR[12] = {"tfa_bo3_butterfly", "Butterfly Knife", "models/weapons/bo3_melees/butterfly/w_butterfly.mdl", "melee", 800, 405}
GEAR[13] = {"tfa_bo3_nunchucks", "Nunchucks", "models/weapons/bo3_melees/nunchucks/w_nunchucks.mdl", "melee", 900, 450}
GEAR[14] = {"tfa_bo3_axe", "Fire Axe", "models/weapons/bo3_melees/axe/w_axe.mdl", "melee", 1000, 495}
GEAR[15] = {"yurie_eft_red_rebel_axe", "Red Rebel", "models/yurie/eft/weapons/world/dmm_rebel_adze_axe.mdl", "melee", 1100, 540}

MODELS = {}
MODELS[1] = {"models/player/Group03/male_02.mdl", "Male", "default", "default"}
MODELS[2] = {"models/player/Group03/female_02.mdl", "Female", "default", "default"}
MODELS[3] = {"models/player/Group01/male_03.mdl", "Casual Male", "default", "default"}
MODELS[4] = {"models/player/mossman.mdl", "Casual Female", "default", "default"}
MODELS[5] = {"models/player/Group03m/male_05.mdl", "Doctor", "default", "default"}
MODELS[6] = {"models/player/Group03m/female_06.mdl", "Nurse", "default", "default"}
MODELS[7] = {"models/player/barney.mdl", "Barney", "default", "default"}
MODELS[8] = {"models/player/kleiner.mdl", "Kleiner", "default", "default"}
MODELS[9] = {"models/player/Group01/male_07.mdl", "Male 07", "kills", 50}
MODELS[10] = {"models/buff.mdl", "Buff", "kills", 100}
MODELS[11] = {"models/player/alyx.mdl", "Alyx", "kills", 150}
MODELS[12] = {"models/player/hostage/hostage_04.mdl", "Scientist", "kills", 250}
MODELS[13] = {"models/dannio/pm/elonmusk.mdl", "X Man", "kills", 375}
MODELS[14] = {"models/player/gman_high.mdl", "GMan", "kills", 500}
MODELS[15] = {"models/player/amir/amir_v2.mdl", "Amir", "kills", 750}
MODELS[16] = {"models/player/p2_chell.mdl", "Chell", "kills", 1000}
MODELS[17] = {"models/sazuma/mahoraga.mdl", "Mahoraga", "kills", 1250}
MODELS[18] = {"models/player/leet.mdl", "Badass", "kills", 1500}
MODELS[19] = {"models/player/arctic.mdl", "Frozen", "streak", 5}
MODELS[20] = {"models/player/riot.mdl", "Riot", "streak", 10}
MODELS[21] = {"models/player/gasmask.mdl", "Hazard Suit", "streak", 15}
MODELS[22] = {"models/player/police.mdl", "Officer", "streak", 20}
MODELS[23] = {"models/player/combine_soldier_prisonguard.mdl", "Cobalt Soilder", "streak", 25}
MODELS[24] = {"models/walterwhite/playermodels/walterwhitechem.mdl", "Drug Dealer", "streak", 30}
MODELS[25] = {"models/halo2/spartan_red.mdl", "Red", "matches", 1}
MODELS[26] = {"models/bunny/doctor_house/Doctor_House.mdl", "House", "matches", 3}
MODELS[27] = {"models/Splinks/Hotline_Miami/Jacket/Drive/Player_jacket_Drive.mdl", "Drive", "matches", 5}
MODELS[28] = {"models/subtact/motoaki_tanigo/yagoo_pm.mdl", "Yagoo", "matches", 10}
MODELS[29] = {"models/konnie/asapgaming/modernwarfare/grinchghillie.mdl", "Grinch", "matches", 20}
MODELS[30] = {"models/dizcordum/fallen_set.mdl", "Fallen", "matches", 35}
MODELS[31] = {"models/player/murphmash/verbaleli_pm.mdl", "Outer Space", "matches", 50}
MODELS[32] = {"models/timbleweebs/azura/azura_cyberpunk_pm.mdl", "Ethereal", "matches", 75}
MODELS[33] = {"models/player/chimp/chimp.mdl", "Le Monk", "matches", 100}
MODELS[34] = {"models/gruchk/oc/cool_skeleton.mdl", "Bones", "matches", 150}
MODELS[35] = {"models/halo2/spartan_blue.mdl", "Blue", "wins", 1}
MODELS[36] = {"models/humans/group03/chemsuit.mdl", "Radioactive", "wins", 3}
MODELS[37] = {"models/COW MW22 Horangi/Horangi.mdl", "Horangi", "wins", 5}
MODELS[38] = {"models/dap_blood/playermodel/dap_blood.mdl", "V1", "wins", 10}
MODELS[39] = {"models/florian/comission/helljumper/helljumper.mdl", "Helljumper", "wins", 20}
MODELS[40] = {"models/player/zombie_fast.mdl", "Infected", "wins", 50}
MODELS[41] = {"models/paynamia/bms/gordon_survivor_player.mdl", "Gordon", "headshot", 25}
MODELS[42] = {"models/munch/mace/Mace.mdl", "Mace", "headshot", 50}
MODELS[43] = {"models/player/darky_m/rust/arctic_hazmat.mdl", "Arctic", "headshot", 100}
MODELS[44] = {"models/player/eft/shturman/eft_shturman/models/eft_shturman_pm.mdl", "Shturman", "headshot", 250}
MODELS[45] = {"models/player/darky_m/rust/scientist.mdl", "Cobalt", "smackdown", 20}
MODELS[46] = {"models/survivors/Payday3/Jacket_PM.mdl", "Jacket", "smackdown", 40}
MODELS[47] = {"models/titanfall2_playermodel/kanepm.mdl", "Kane", "smackdown", 80}
MODELS[48] = {"models/auditor/r6s/707/vigil/chr_707_vigil.mdl", "Vigil", "smackdown", 160}
MODELS[49] = {"models/player/combine_super_soldier.mdl", "Super Soilder", "clutch", 15}
MODELS[50] = {"models/patrickbateman/Playermodels/patrickbateman.mdl", "Bateman", "clutch", 30}
MODELS[51] = {"models/player/darky_m/rust/spacesuit.mdl", "Spacesuit", "clutch", 75}
MODELS[52] = {"models/us_airforce/jetpilot_usaf.mdl", "Pilot", "clutch", 150}
MODELS[53] = {"models/player/john_marston.mdl", "Martson", "longshot", 20}
MODELS[54] = {"models/player/darky_m/rust/hazmat.mdl", "Hazmat", "longshot", 40}
MODELS[55] = {"models/player/darky_m/rust/nomad.mdl", "Nomad", "longshot", 80}
MODELS[56] = {"models/mark2580/payday2/pd2_gs_elite_player.mdl", "Elite", "longshot", 160}
MODELS[57] = {"models/maxpayne3/ufe/ufepm.mdl", "UFE", "pointblank", 20}
MODELS[58] = {"models/starwarsbf1/Scoutrooper.mdl", "Scout", "pointblank", 40}
MODELS[59] = {"models/kyo/ghot.mdl", "Ghost", "pointblank", 80}
MODELS[60] = {"models/mark2580/payday2/pd2_cloaker_player.mdl", "Cloaker", "pointblank", 169}
MODELS[61] = {"models/Krueger_PlayerModel/Zaper/Krueger_Body.mdl", "Krueger", "killstreaks", 20}
MODELS[62] = {"models/player/tabspeasant.mdl", "Wobbler", "killstreaks", 40}
MODELS[63] = {"models/captainbigbutt/vocaloid/miku_classic.mdl", "Miku", "killstreaks", 80}
MODELS[64] = {"models/theboys/homelander.mdl", "Homelander", "killstreaks", 160}
MODELS[65] = {"models/player/voikanaa/snoop_dogg.mdl", "Snoop", "buzzkills", 20}
MODELS[66] = {"models/pacagma/humans/heroes/imc_hero_viper_player.mdl", "Viper", "buzzkills", 40}
MODELS[67] = {"models/auditor/titanfall2/cooper/chr_jackcooper.mdl", "Cooper", "buzzkills", 80}
MODELS[68] = {"models/auditor/re2/chr_hunk_pmrig.mdl", "Hunk", "buzzkills", 160}

CARDS = {}
CARDS[1] = {"cards/default/barrels.png", "Barrels", "", "default", "default"}
CARDS[2] = {"cards/default/carbon.png", "Carbon", "", "default", "default"}
CARDS[3] = {"cards/default/construct.png", "Construct", "", "default", "default"}
CARDS[4] = {"cards/default/flare.png", "Flare", "", "default", "default"}
CARDS[5] = {"cards/default/flattywood.png", "Fattywood", "", "default", "default"}
CARDS[6] = {"cards/default/grapple.png", "Grapple", "", "default", "default"}
CARDS[7] = {"cards/default/industry.png", "Industry", "", "default", "default"}
CARDS[8] = {"cards/default/monkey.png", "Le Monk", "", "default", "default"}
CARDS[9] = {"cards/default/overhead.png", "Overhead", "", "default", "default"}
CARDS[10] = {"cards/default/specops.png", "Spec Ops", "", "default", "default"}
CARDS[11] = {"cards/default/stargazing.png", "Stargazing", "", "default", "default"}
CARDS[12] = {"cards/default/strobe.png", "Strobe", "", "default", "default"}
CARDS[13] = {"cards/kills/kill50.png", "Pistoling", "", "kills", 50}
CARDS[14] = {"cards/kills/kill200.png", "Smoke", "", "kills", 200}
CARDS[15] = {"cards/kills/kill500.png", "Titan", "", "kills", 500}
CARDS[16] = {"cards/kills/kill1000.png", "Hardened", "", "kills", 1000}
CARDS[17] = {"cards/kills/kill2000.png", "Leader", "", "kills", 2000}
CARDS[18] = {"cards/kills/kill3000.png", "Specialist", "", "kills", 3000}
CARDS[19] = {"cards/kills/streak5.png", "Convoy", "", "streak", 5}
CARDS[20] = {"cards/kills/streak10.png", "Expedition", "", "streak", 10}
CARDS[21] = {"cards/kills/streak15.png", "On Fire", "", "streak", 15}
CARDS[22] = {"cards/kills/streak20.png", "Artillery", "", "streak", 20}
CARDS[23] = {"cards/kills/streak25.png", "Timed", "", "streak", 25}
CARDS[24] = {"cards/kills/streak30.png", "Nuclear", "", "streak", 30}
CARDS[25] = {"cards/kills/matches1.png", "Noob", "", "matches", 1}
CARDS[26] = {"cards/kills/matches5.png", "Luke Warm", "", "matches", 5}
CARDS[27] = {"cards/kills/matches20.png", "Utility", "", "matches", 20}
CARDS[28] = {"cards/kills/matches50.png", "Lurking", "", "matches", 50}
CARDS[29] = {"cards/kills/matches100.png", "Expert", "", "matches", 100}
CARDS[30] = {"cards/kills/matches200.png", "Complete", "", "matches", 200}
CARDS[31] = {"cards/kills/wins1.png", "Victor", "", "wins", 1}
CARDS[32] = {"cards/kills/wins3.png", "Finish Line", "", "wins", 3}
CARDS[33] = {"cards/kills/wins10.png", "Confetti", "", "wins", 10}
CARDS[34] = {"cards/kills/wins20.png", "Improving", "", "wins", 20}
CARDS[35] = {"cards/kills/wins50.png", "Red Carpet", "", "wins", 50}
CARDS[36] = {"cards/kills/wins100.png", "Proud", "", "wins", 100}
CARDS[37] = {"cards/accolades/headshot1.png", "Headshot", "", "headshot", 50}
CARDS[38] = {"cards/accolades/headshot2.png", "Hunter", "", "headshot", 100}
CARDS[39] = {"cards/accolades/headshot3.png", "Icon", "", "headshot", 200}
CARDS[40] = {"cards/accolades/headshot4.png", "NODs", "", "headshot", 400}
CARDS[41] = {"cards/accolades/smackdown1.png", "Karambit", "", "smackdown", 25}
CARDS[42] = {"cards/accolades/smackdown2.png", "Samuri", "", "smackdown", 50}
CARDS[43] = {"cards/accolades/smackdown3.png", "Beach", "", "smackdown", 100}
CARDS[44] = {"cards/accolades/smackdown4.png", "Execution", "", "smackdown", 200}
CARDS[45] = {"cards/accolades/clutch1.png", "Deagle", "", "clutch", 30}
CARDS[46] = {"cards/accolades/clutch2.png", "Magnum", "", "clutch", 60}
CARDS[47] = {"cards/accolades/clutch3.png", "KRISS", "", "clutch", 100}
CARDS[48] = {"cards/accolades/clutch4.png", "FN", "", "clutch", 180}
CARDS[49] = {"cards/accolades/longshot1.png", "Downhill", "", "longshot", 30}
CARDS[50] = {"cards/accolades/longshot2.png", "Stalker", "", "longshot", 60}
CARDS[51] = {"cards/accolades/longshot3.png", "Highrise", "", "longshot", 100}
CARDS[52] = {"cards/accolades/longshot4.png", "Tactical", "", "longshot", 180}
CARDS[53] = {"cards/accolades/pointblank1.png", "Showers", "", "pointblank", 45}
CARDS[54] = {"cards/accolades/pointblank2.png", "Full Auto", "", "pointblank", 90}
CARDS[55] = {"cards/accolades/pointblank3.png", "Live Fire", "", "pointblank", 150}
CARDS[56] = {"cards/accolades/pointblank4.png", "Dual Wield", "", "pointblank", 275}
CARDS[57] = {"cards/accolades/killstreaks1.png", "Soilder", "", "killstreaks", 40}
CARDS[58] = {"cards/accolades/killstreaks2.png", "Badass", "", "killstreaks", 90}
CARDS[59] = {"cards/accolades/killstreaks3.png", "Skulls", "", "killstreaks", 160}
CARDS[60] = {"cards/accolades/killstreaks4.png", "Radiation", "", "killstreaks", 270}
CARDS[61] = {"cards/accolades/buzzkills1.png", "Wobblers", "", "buzzkills", 40}
CARDS[62] = {"cards/accolades/buzzkills2.png", "POV", "", "buzzkills", 90}
CARDS[63] = {"cards/accolades/buzzkills3.png", "Preperation", "", "buzzkills", 160}
CARDS[64] = {"cards/accolades/buzzkills4.png", "Twin Flame", "", "buzzkills", 270}
CARDS[65] = {"cards/color/red.png", "Red", "Solid red color", "color", "color"}
CARDS[66] = {"cards/color/orange.png", "Orange", "Solid orange color", "color", "color"}
CARDS[67] = {"cards/color/yellow.png", "Yellow", "Solid yellow color", "color", "color"}
CARDS[68] = {"cards/color/lime.png", "Lime", "Solid lime color", "color", "color"}
CARDS[69] = {"cards/color/cyan.png", "Cyan", "Solid cyan color", "color", "color"}
CARDS[70] = {"cards/color/blue.png", "Blue", "Solid blue color", "color", "color"}
CARDS[71] = {"cards/color/purple.png", "Purple", "Solid magenta color", "color", "color"}
CARDS[72] = {"cards/color/pink.png", "Pink", "Solid pink color", "color", "color"}
CARDS[73] = {"cards/color/brown.png", "Brown", "Solid brown color", "color", "color"}
CARDS[74] = {"cards/color/gray.png", "Gray", "Solid gray color", "color", "color"}
CARDS[75] = {"cards/color/white.png", "White", "Solid white color", "color", "color"}
CARDS[76] = {"cards/color/black.png", "Black", "Solid black color", "color", "color"}
CARDS[77] = {"cards/mastery/aa12.png", "Close Up", "AA-12", "mastery", "tfa_ins2_aa12"}
CARDS[78] = {"cards/mastery/acr.png", "Posted Up", "ACR", "mastery", "tfa_ins2_acrc"}
CARDS[79] = {"cards/mastery/aek971.png", "Stalker", "AEK-971", "mastery", "tfa_ins2_aek971"}
CARDS[80] = {"cards/mastery/ak12.png", "Inspection", "AK-12", "mastery", "tfa_ins2_ak12"}
CARDS[81] = {"cards/mastery/ak47.png", "Sunset", "AK-47", "mastery", "tfa_ins2_akms"}
CARDS[82] = {"cards/mastery/aks74u.png", "Loaded", "AKS-74U", "mastery", "tfa_ins2_aks_r"}
CARDS[83] = {"cards/mastery/american180.png", "Tangerine", "American-180", "mastery", "tfa_cold_war_american180"}
CARDS[84] = {"cards/mastery/an94.png", "Hijacked", "AN-94", "mastery", "tfa_ins2_abakan"}
CARDS[85] = {"cards/mastery/ar57.png", "Ghost", "AR-57", "mastery", "tfa_ins2_ar57"}
CARDS[86] = {"cards/mastery/asval.png", "Obesa", "AS-VAL", "mastery", "tfa_inss_asval"}
CARDS[87] = {"cards/mastery/ash12.png", "Interstellar", "ASh-12", "mastery", "tfa_pd2_ash12"}
CARDS[88] = {"cards/mastery/auga2.png", "Lightning", "AUG A2", "mastery", "tfa_fml_csgo_aug"}
CARDS[89] = {"cards/mastery/avt40.png", "Embers", "AVT-40", "mastery", "tfa_ins2_wpn_avt40"}
CARDS[90] = {"cards/mastery/awm.png", "Dust II", "AWM", "mastery", "tfa_cod_accuracy_international_l115a3"}
CARDS[91] = {"cards/mastery/ax308.png", "Range", "AX-308", "mastery", "tfa_ins2_warface_ax308"}
CARDS[92] = {"cards/mastery/barrettm98b.png", "Ready", "Barrett M98B", "mastery", "tfa_ins2_barrett_m98_bravo"}
CARDS[93] = {"cards/mastery/berettamx4.png", "House", "Barrett Mx4", "mastery", "tfa_ins2_mx4"}
CARDS[94] = {"cards/mastery/bow.png", "Cargo Ship", "Bow", "mastery", "rust_bow"}
CARDS[95] = {"cards/mastery/bowieknife.png", "Zombie", "Bowie Knife", "mastery", "tfa_bo3_bowiezm"}
CARDS[96] = {"cards/mastery/br99.png", "Rouge", "BR99", "mastery", "tfa_ins2_br99"}
CARDS[97] = {"cards/mastery/bren.png", "Flank", "Bren", "mastery", "tfa_doibren"}
CARDS[98] = {"cards/mastery/butterfly.png", "Bliss", "Butterfly Knife", "mastery", "tfa_bo3_butterfly"}
CARDS[99] = {"cards/mastery/carver.png", "Fungal", "Carver", "mastery", "tfa_bo3_bowie"}
CARDS[100] = {"cards/mastery/colt9mm.png", "Magazines", "Colt 9mm", "mastery", "tfa_ins2_m4_9mm"}
CARDS[101] = {"cards/mastery/coonan.png", "Strip", "Coonan .357", "mastery", "tfa_coonan_357"}
CARDS[102] = {"cards/mastery/crossbow.png", "Arrows", "Crossbow", "mastery", "rust_crossbow"}
CARDS[103] = {"cards/mastery/cz75.png", "Nuke", "CZ 75", "mastery", "tfa_ins2_cz75"}
CARDS[104] = {"cards/mastery/cz805.png", "Showcase", "CZ 805", "mastery", "tfa_ins2_cz805"}
CARDS[105] = {"cards/mastery/dagger.png", "Fish", "Dagger", "mastery", "yurie_eft_semin_push_dagger"}
CARDS[106] = {"cards/mastery/deserteagle.png", "Mag Check", "Desert Eagle", "mastery", "tfa_ins2_deagle"}
CARDS[107] = {"cards/mastery/dsr50.png", "Arena", "DSR-50", "mastery", "tfa_ins2_warface_amp_dsr1"}
CARDS[108] = {"cards/mastery/dualmac.png", "Lars", "Dual MAC-10s", "mastery", "tfa_dualmac"}
CARDS[109] = {"cards/mastery/dualskorpion.png", "Celestial", "Dual Skorpions", "mastery", "tfa_l4d2_skorpion_dual"}
CARDS[110] = {"cards/mastery/famas.png", "Siege", "Famas", "mastery", "tfa_ins2_famas"}
CARDS[111] = {"cards/mastery/fg42.png", "Glint", "FG42", "mastery", "tfa_doifg42"}
CARDS[112] = {"cards/mastery/fireaxe.png", "Sunrise", "Fire Axe", "mastery", "tfa_bo3_axe"}
CARDS[113] = {"cards/mastery/fists.png", "Blood", "Fists", "mastery", "tfa_bo3_fists"}
CARDS[114] = {"cards/mastery/fiveseven.png", "Galactic", "Five-seveN", "mastery", "tfa_ins2_fiveseven_eft"}
CARDS[115] = {"cards/mastery/flamethrower.png", "Haze", "Flamethrower", "mastery", "tfa_codww2_flamethrower"}
CARDS[116] = {"cards/mastery/fn2000.png", "Armory", "FN 2000", "mastery", "tfa_ins2_fn_2000"}
CARDS[117] = {"cards/mastery/fnfal.png", "Exposed", "FN FAL", "mastery", "tfa_ins2_fn_fal"}
CARDS[118] = {"cards/mastery/fnp45.png", "ACP", "FNP-45", "mastery", "tfa_ins2_fnp45"}
CARDS[119] = {"cards/mastery/g28.png", "Legacy", "G28", "mastery", "tfa_ins2_g28"}
CARDS[120] = {"cards/mastery/g36a1.png", "Aimpoint", "G36A1", "mastery", "tfa_ins2_g36a1"}
CARDS[121] = {"cards/mastery/g3a3.png", "Crane", "G3A3", "mastery", "tfa_ins2_wpn_g3a3"}
CARDS[122] = {"cards/mastery/galil.png", "Ring", "Galil", "mastery", "tfa_ins2_wpn_imigalilarm"}
CARDS[123] = {"cards/mastery/glock18.png", "Ospery", "Glock 17", "mastery", "tfa_glk_gen4"}
CARDS[124] = {"cards/mastery/grenade.png", "Quasar", "Grenade", "mastery", "grenade"}
CARDS[125] = {"cards/mastery/groza.png", "Bullpup", "Groza", "mastery", "tfa_ins2_groza"}
CARDS[126] = {"cards/mastery/gsh18.png", "Skyscraper", "GSH-18", "mastery", "tfa_ins2_gsh18"}
CARDS[127] = {"cards/mastery/hk416.png", "Infinite", "HK416", "mastery", "tfa_ins2_hk416"}
CARDS[128] = {"cards/mastery/hk53.png", "Chains", "HK53", "mastery", "tfa_ins2_fml_hk53"}
CARDS[129] = {"cards/mastery/honeybadger.png", "Business", "Honey Badger", "mastery", "tfa_ins2_cq300"}
CARDS[130] = {"cards/mastery/howatype64.png", "Cradle", "Howa Type 64", "mastery", "tfa_howa_type_64"}
CARDS[131] = {"cards/mastery/imbelia2.png", "Process", "Imbel IA2", "mastery", "tfa_ins2_imbelia2"}
CARDS[132] = {"cards/mastery/intervention.png", "Trickshot", "Intervention", "mastery", "tfa_ins2_warface_cheytac_m200"}
CARDS[133] = {"cards/mastery/kacchainsaw.png", "Scare", "KAC ChainSAW", "mastery", "ryry_tfa_chainsaw"}
CARDS[134] = {"cards/mastery/kar98k.png", "Empire", "Kar98k", "mastery", "tfa_doi_kar98k"}
CARDS[135] = {"cards/mastery/karambit.png", "Shoreline", "Karambit", "mastery", "tfa_karambit"}
CARDS[136] = {"cards/mastery/km2000.png", "Flatgrass", "KM-2000", "mastery", "tfa_km2000_knife"}
CARDS[137] = {"cards/mastery/krissvector.png", "Narkotica", "KRISS Vector", "mastery", "tfa_ins2_krissv"}
CARDS[138] = {"cards/mastery/ks23.png", "Vintage", "KS-23", "mastery", "tfa_coldwar_ks23"}
CARDS[139] = {"cards/mastery/ksg.png", "Flames", "KSG", "mastery", "tfa_ins2_ksg"}
CARDS[140] = {"cards/mastery/kukri.png", "Peace", "Kukri", "mastery", "yurie_eft_united_cutlery_m48_kukri"}
CARDS[141] = {"cards/mastery/l85.png", "Groves", "L85", "mastery", "tfa_ins2_l85a2"}
CARDS[142] = {"cards/mastery/leeenfield.png", "Minecraft", "Lee Enfield master", "mastery", "tfa_doi_enfield"}
CARDS[143] = {"cards/mastery/lewis.png", "Big Bang", "Lewis Gun", "mastery", "tfa_doilewis"}
CARDS[144] = {"cards/mastery/lr300.png", "Oil Rig", "LR-300", "mastery", "tfa_ins2_zm_lr300"}
CARDS[145] = {"cards/mastery/m1garand.png", "Underworld", "M1 Garand", "mastery", "tfa_doi_garand"}
CARDS[146] = {"cards/mastery/minigun.png", "SYS.//", "M134 Minigun", "mastery", "tfa_usurper"}
CARDS[147] = {"cards/mastery/m14.png", "Bridge", "M14", "mastery", "tfa_ins2_m14retro"}
CARDS[148] = {"cards/mastery/m1911.png", "Relic", "mastery", "mastery", ""}
CARDS[149] = {"cards/mastery/m1918.png", "Bipod", "M1918", "mastery", "tfa_doim1918"}
CARDS[150] = {"cards/mastery/m1919.png", "Customs", "M1919", "mastery", "tfa_doim1919"}
CARDS[151] = {"cards/mastery/m249.png", "Camper", "M249", "mastery", "tfa_ins2_minimi"}
CARDS[152] = {"cards/mastery/m3grease.png", "Grease", "M3 Grease Gun", "mastery", "tfa_doim3greasegun"}
CARDS[153] = {"cards/mastery/m45a1.png", "Legend", "M45A1", "mastery", "tfa_ins2_colt_m45"}
CARDS[154] = {"cards/mastery/m4a1.png", "Smug", "M4A1", "mastery", "tfa_ins2_eftm4a1"}
CARDS[155] = {"cards/mastery/m79.png", "Cool With It", "M79", "mastery", "tfa_nam_m79"}
CARDS[156] = {"cards/mastery/m9.png", "Full Metal", "M9", "mastery", "tfa_ins2_m9"}
CARDS[157] = {"cards/mastery/m9bayonet.png", "Park", "M9 Bayonet", "mastery", "tfa_ilopn_m9_phrobis"}
CARDS[158] = {"cards/mastery/mac10.png", "Dev", "MAC-10", "mastery", "bocw_mac10_alt"}
CARDS[159] = {"cards/mastery/mace.png", "Industry", "Mace master", "mastery", "tfa_ararebo_bf1"}
CARDS[160] = {"cards/mastery/makarov.png", "Leaves", "Makarov", "mastery", "tfa_ins2_pm"}
CARDS[161] = {"cards/mastery/maresleg.png", "High Optic", "Mare's Leg", "mastery", "tfa_tfre_maresleg"}
CARDS[162] = {"cards/mastery/mas38.png", "Galaxy", "Mas 38", "mastery", "tfa_fml_lefrench_mas38"}
CARDS[163] = {"cards/mastery/mg34.png", "Heavy ", "MG 34", "mastery", "tfa_doimg34"}
CARDS[164] = {"cards/mastery/mg42.png", "D-Day", "MG 42", "mastery", "tfa_doimg42"}
CARDS[165] = {"cards/mastery/mk14ebr.png", "Prepared", "MK 14 EBR", "mastery", "tfa_ins2_mk14ebr"}
CARDS[166] = {"cards/mastery/mk23.png", "Uranium", "MK 23", "mastery", "tfa_ins2_mk23"}
CARDS[167] = {"cards/mastery/mk18.png", "Waster", "MK18", "mastery", "tfa_fml_inss_mk18"}
CARDS[168] = {"cards/mastery/model10.png", "Walter", "Model 10", "mastery", "tfa_ins2_swmodel10"}
CARDS[169] = {"cards/mastery/mosin.png", "Rebirth", "Mosin Nagant", "mastery", "tfa_ins2_mosin_nagant"}
CARDS[170] = {"cards/mastery/mp40.png", "Reflection", "MP 40", "mastery", "tfa_doimp40"}
CARDS[171] = {"cards/mastery/mp443.png", "Bush", "MP-443", "mastery", "tfa_ins2_mp443"}
CARDS[172] = {"cards/mastery/mp18.png", "Modern", "MP18", "mastery", "tfa_ww1_mp18"}
CARDS[173] = {"cards/mastery/mp5.png", "Select", "MP5", "mastery", "tfa_inss2_hk_mp5a5"}
CARDS[174] = {"cards/mastery/mp5k.png", "H&K", "MP5K", "mastery", "tfa_ins2_mp5k"}
CARDS[175] = {"cards/mastery/mp7.png", "Oilspill", "MP7", "mastery", "tfa_ins2_mp7"}
CARDS[176] = {"cards/mastery/mp9.png", "Training", "MP9", "mastery", "tfa_ins2_warface_bt_mp9"}
CARDS[177] = {"cards/mastery/mpx.png", "Waterfall", "MPX", "mastery", "tfa_jw_tti_mpx"}
CARDS[178] = {"cards/mastery/mr96.png", "Polish", "MR-96", "mastery", "tfa_ins2_mr96"}
CARDS[179] = {"cards/mastery/remingtonmsr.png", "Lightshow", "Remington MSR", "mastery", "tfa_ins2_pd2_remington_msr"}
CARDS[180] = {"cards/mastery/mts225.png", "Slug", "MTs225", "mastery", "tfa_ins2_mc255"}
CARDS[181] = {"cards/mastery/nailgun.png", "Nails", "Nailgun", "mastery", "tfa_bocw_nailgun"}
CARDS[182] = {"cards/mastery/nova.png", "Dark Street", "Nova", "mastery", "tfa_ins2_nova"}
CARDS[183] = {"cards/mastery/nunchucks.png", "Yin", "Nunchucks", "mastery", "tfa_bo3_nunchucks"}
CARDS[184] = {"cards/mastery/osp18.png", "Irons", "OSP-18", "mastery", "tfa_l4d2_osp18"}
CARDS[185] = {"cards/mastery/otspernach.png", "Speedloader", "OTs-33 Pernach", "mastery", "tfa_ins2_ots_33_pernach"}
CARDS[186] = {"cards/mastery/owenmki.png", "Grid", "Owen Gun", "mastery", "tfa_doiowen"}
CARDS[187] = {"cards/mastery/p320.png", "Sauer", "P320", "mastery", "tfa_ins2_p320_m18"}
CARDS[188] = {"cards/mastery/p90.png", "MISSING", "P90", "mastery", "tfa_fml_p90_tac"}
CARDS[189] = {"cards/mastery/pindad.png", "Labs", "Pindad SS2", "mastery", "tfa_blast_pindadss2"}
CARDS[190] = {"cards/mastery/pkp.png", "Royalty", "PKP", "mastery", "tfa_ins2_pkp"}
CARDS[191] = {"cards/mastery/pm9.png", "Akimbo", "PM-9", "mastery", "tfa_ins2_pm9"}
CARDS[192] = {"cards/mastery/ppbizon.png", "Rainbow", "PP-19 Bizon", "mastery", "tfa_fas2_ppbizon"}
CARDS[193] = {"cards/mastery/ppsh.png", "Mephitic", "PPSH", "mastery", "tfa_nam_ppsh41"}
CARDS[194] = {"cards/mastery/pzb39.png", "Exotic", "PzB 39", "mastery", "tfa_ww2_pbz39"}
CARDS[195] = {"cards/mastery/qbz97.png", "Hideout", "QBZ-97", "mastery", "tfa_ins2_norinco_qbz97"}
CARDS[196] = {"cards/mastery/qsz92.png", "yippee", "QSZ-92", "mastery", "tfa_ins2_qsz92"}
CARDS[197] = {"cards/mastery/redrebel.png", "Tagilla", "Red Rebel", "mastery", "yurie_eft_red_rebel_axe"}
CARDS[198] = {"cards/mastery/remingtonm870.png", "Code", "Remington M870 master", "mastery", "tfa_ins2_remington_m870"}
CARDS[199] = {"cards/mastery/rfb.png", "Extraction", "RFB", "mastery", "tfa_ins2_rfb"}
CARDS[200] = {"cards/mastery/rpg7.png", "Damascus", "RPG-7", "mastery", "tfa_ins2_rpg7_scoped"}
CARDS[201] = {"cards/mastery/rpk74m.png", "Elcan", "RPK-74M", "mastery", "tfa_ins2_rpk_74m"}
CARDS[202] = {"cards/mastery/sw500.png", "Companion", "S&W 500", "mastery", "tfa_ins2_s&w_500"}
CARDS[203] = {"cards/mastery/sawedoff.png", "Halves", "Sawed Off", "mastery", "tfa_ins2_izh43sw"}
CARDS[204] = {"cards/mastery/scarh.png", "Tilted", "SCAR-H", "mastery", "tfa_ins2_scar_h_ssr"}
CARDS[205] = {"cards/mastery/scarl.png", "Overhead", "SCAR-L", "mastery", "tfa_ins2_scarl"}
CARDS[206] = {"cards/mastery/scorpionevo.png", "Raid", "Scorpion Evo", "mastery", "tfa_ins2_sc_evo"}
CARDS[207] = {"cards/mastery/skorpion.png", "Black Hole", "Skorpion", "mastery", "tfa_l4d2_skorpion"}
CARDS[208] = {"cards/mastery/sks.png", "Scav", "SKS", "mastery", "tfa_ins2_sks"}
CARDS[209] = {"cards/mastery/spas.png", "12 Gauge", "SPAS-12", "mastery", "tfa_ins2_spas12"}
CARDS[210] = {"cards/mastery/spectrem4.png", "Mall", "Spectre M4", "mastery", "tfa_ins2_spectre"}
CARDS[211] = {"cards/mastery/spikex1s.png", "Prototype", "Spike X1S", "mastery", "tfa_ins2_saiga_spike"}
CARDS[212] = {"cards/mastery/sr25.png", "D2", "SR-25", "mastery", "tfa_ins2_sr25_eft"}
CARDS[213] = {"cards/mastery/sr2m.png", "Blueprint", "SR-2M", "mastery", "tfa_ins2_sr2m_veresk"}
CARDS[214] = {"cards/mastery/sten.png", "Lens Flare", "Sten", "mastery", "tfa_doisten"}
CARDS[215] = {"cards/mastery/stevens620.png", "Mod", "Stevens 620", "mastery", "tfa_nam_stevens620"}
CARDS[216] = {"cards/mastery/stg44.png", "Wood", "StG 44", "mastery", "tfa_doistg44"}
CARDS[217] = {"cards/mastery/stonerlmg.png", "Stoner", "Stoner LMG A1", "mastery", "tfa_ins2_wpn_kacstoner"}
CARDS[218] = {"cards/mastery/sv98.png", "Vertigo", "SV-98", "mastery", "tfa_ins2_sv98"}
CARDS[219] = {"cards/mastery/t5000.png", "Reserve", "T-5000", "mastery", "tfa_ins2_warface_orsis_t5000"}
CARDS[220] = {"cards/mastery/tanto.png", "Shipment", "Tanto", "mastery", "tfa_japanese_exclusive_tanto"}
CARDS[221] = {"cards/mastery/tariq.png", "Dog", "Tariq", "mastery", "tfa_ins_sandstorm_tariq"}
CARDS[222] = {"cards/mastery/thompsonm1928.png", "Typewritter", "Thompson M1928 master", "mastery", "tfa_doithompsonm1928"}
CARDS[223] = {"cards/mastery/thompson.png", "Depression", "Thompson M1A1 master", "mastery", "tfa_doithompsonm1a1"}
CARDS[224] = {"cards/mastery/tridagger.png", "Daggers", "Tri-Dagger", "mastery", "tfa_ins2_tridagger"}
CARDS[225] = {"cards/mastery/typhoonf12.png", "Ultrakill", "Typhoon F12", "mastery", "tfa_ins2_typhoon12"}
CARDS[226] = {"cards/mastery/ump.png", "Nuketown", "UMP", "mastery", "tfa_ins2_ump45"}
CARDS[227] = {"cards/mastery/usp.png", "Strike", "USP", "mastery", "tfa_ins2_usp_match"}
CARDS[228] = {"cards/mastery/uzi.png", "Alpha", "Uzi", "mastery", "tfa_ins2_imi_uzi"}
CARDS[229] = {"cards/mastery/vhsd2.png", "Liminal", "VHS-D2", "mastery", "tfa_ins2_vhsd2"}
CARDS[230] = {"cards/mastery/wa2000.png", "Brain", "WA-2000", "mastery", "tfa_ins2_wa2000"}
CARDS[231] = {"cards/mastery/waltherp99.png", "Advisory", "Walther P99", "mastery", "tfa_ins2_walther_p99"}
CARDS[232] = {"cards/mastery/webley.png", "Bear", "Webley", "mastery", "tfa_doi_webley"}
CARDS[233] = {"cards/mastery/xm8.png", "Ragdoll", "XM8", "mastery", "tfa_ins2_xm8"}
CARDS[234] = {"cards/leveling/5.png", "Mist", "Level 5", "level", 5}
CARDS[235] = {"cards/leveling/10.png", "Tech", "Level 10", "level", 10}
CARDS[236] = {"cards/leveling/15.png", "Processing", "Level 15", "level", 15}
CARDS[237] = {"cards/leveling/20.png", "Monolith", "Level 20", "level", 20}
CARDS[238] = {"cards/leveling/25.png", "Kitty", "Level 25", "level", 25}
CARDS[239] = {"cards/leveling/30.png", "Tonal", "Level 30", "level", 30}
CARDS[240] = {"cards/leveling/35.png", "Gangster", "Level 35", "level", 35}
CARDS[241] = {"cards/leveling/40.png", "Shark", "Level 40", "level", 40}
CARDS[242] = {"cards/leveling/45.png", "Bath", "Level 45", "level", 45}
CARDS[243] = {"cards/leveling/50.png", "Rig", "Level 50", "level", 50}
CARDS[244] = {"cards/leveling/55.png", "Station", "Level 55", "level", 55}
CARDS[245] = {"cards/leveling/60.png", "Scenic", "Level 60", "level", 60}
CARDS[246] = {"cards/leveling/65.png", "Dunes", "Level 65", "level", 65}
CARDS[247] = {"cards/leveling/70.png", "Pyro", "Level 70", "level", 70}
CARDS[248] = {"cards/leveling/75.png", "Toxicity", "Level 75", "level", 75}
CARDS[249] = {"cards/leveling/80.png", "Drainer", "Level 80", "level", 80}
CARDS[250] = {"cards/leveling/85.png", "Aquarium", "Level 85", "level", 85}
CARDS[251] = {"cards/leveling/90.png", "Drive", "Level 90", "level", 90}
CARDS[252] = {"cards/leveling/95.png", "Nightfall", "Level 95", "level", 95}
CARDS[253] = {"cards/leveling/100.png", "Thunder", "Level 100", "level", 100}
CARDS[254] = {"cards/leveling/105.png", "Shift", "Level 105", "level", 105}
CARDS[255] = {"cards/leveling/110.png", "Horizon", "Level 110", "level", 110}
CARDS[256] = {"cards/leveling/115.png", "Summit", "Level 115", "level", 115}
CARDS[257] = {"cards/leveling/120.png", "Illusion", "Level 120", "level", 120}
CARDS[258] = {"cards/leveling/125.png", "Stare", "Level 125", "level", 125}
CARDS[259] = {"cards/leveling/130.png", "Death", "Level 130", "level", 130}
CARDS[260] = {"cards/leveling/135.png", "Man", "Level 135", "level", 135}
CARDS[261] = {"cards/leveling/140.png", "Depths", "Level 140", "level", 140}
CARDS[262] = {"cards/leveling/145.png", "Irony", "Level 145", "level", 145}
CARDS[263] = {"cards/leveling/150.png", "Grass", "Level 150", "level", 150}
CARDS[264] = {"cards/leveling/155.png", "Scott Up", "Level 155", "level", 155}
CARDS[265] = {"cards/leveling/160.png", "Buzzkilled", "Level 160", "level", 160}
CARDS[266] = {"cards/leveling/165.png", "Fumos", "Level 165", "level", 165}
CARDS[267] = {"cards/leveling/170.png", "The Voices", "Level 170", "level", 170}
CARDS[268] = {"cards/leveling/175.png", "Crisis", "Level 175", "level", 175}
CARDS[269] = {"cards/leveling/180.png", "CRT", "Level 180", "level", 180}
CARDS[270] = {"cards/leveling/185.png", "Operative", "Level 185", "level", 185}
CARDS[271] = {"cards/leveling/190.png", "Cool Skull", "Level 190", "level", 190}
CARDS[272] = {"cards/leveling/195.png", "Breakcore", "Level 195", "level", 195}
CARDS[273] = {"cards/leveling/200.png", "Dr. Han", "Level 200", "level", 200}
CARDS[274] = {"cards/leveling/205.png", "Waves", "Level 205", "level", 205}
CARDS[275] = {"cards/leveling/210.png", "Universe", "Level 210", "level", 210}
CARDS[276] = {"cards/leveling/215.png", "Invasion", "Level 215", "level", 215}
CARDS[277] = {"cards/leveling/220.png", "Airship", "Level 220", "level", 220}
CARDS[278] = {"cards/leveling/225.png", "Darkness", "Level 225", "level", 225}
CARDS[279] = {"cards/leveling/230.png", "Arctic", "Level 230", "level", 230}
CARDS[280] = {"cards/leveling/235.png", "Modern", "Level 235", "level", 235}
CARDS[281] = {"cards/leveling/240.png", "Childhood", "Level 240", "level", 240}
CARDS[282] = {"cards/leveling/245.png", "Strive", "Level 245", "level", 245}
CARDS[283] = {"cards/leveling/250.png", "Lilypad", "Level 250", "level", 250}
CARDS[284] = {"cards/leveling/255.png", "Prickly", "Level 255", "level", 255}
CARDS[285] = {"cards/leveling/260.png", "Strawberry", "Level 260", "level", 260}
CARDS[286] = {"cards/leveling/265.png", "Kiwi", "Level 265", "level", 265}
CARDS[287] = {"cards/leveling/270.png", "Banana", "Level 270", "level", 270}
CARDS[288] = {"cards/leveling/275.png", "Bunnies", "Level 275", "level", 275}
CARDS[289] = {"cards/leveling/280.png", "Kitties", "Level 280", "level", 280}
CARDS[290] = {"cards/leveling/285.png", "Puppies", "Level 285", "level", 285}
CARDS[291] = {"cards/leveling/290.png", "Totem", "Level 290", "level", 290}
CARDS[292] = {"cards/leveling/295.png", "View", "Level 295", "level", 295}
CARDS[293] = {"cards/leveling/300.png", "Ruins", "Level 300", "level", 300}
CARDS[294] = {"cards/pride/pride.png", "Pride", "<3", "pride", "pride"}
CARDS[295] = {"cards/pride/bi.png", "Bi", "<3", "pride", "pride"}
CARDS[296] = {"cards/pride/pan.png", "Pan", "<3", "pride", "pride"}
CARDS[297] = {"cards/pride/gay.png", "Gay", "<3", "pride", "pride"}
CARDS[298] = {"cards/pride/lesbian.png", "Lesbian", "<3", "pride", "pride"}
CARDS[299] = {"cards/pride/ace.png", "Ace", "<3", "pride", "pride"}
CARDS[300] = {"cards/pride/trans.png", "Trans", "<3", "pride", "pride"}
CARDS[301] = {"cards/pride/genderfluid.png", "Gen. Fluid", "<3", "pride", "pride"}
CARDS[302] = {"cards/pride/genderqueer.png", "Gen. Queer", "<3", "pride", "pride"}
CARDS[303] = {"cards/pride/nonbinary.png", "Nonbinary", "<3", "pride", "pride"}
CARDS[304] = {"cards/pride/agender.png", "Agender", "<3", "pride", "pride"}
CARDS[305] = {"cards/pride/zedo.png", "Zedo", "", "pride", "pride"}
CARDS[306] = {"cards/flags/albania.png", "Albania", "", "pride", "pride"}
CARDS[307] = {"cards/flags/argentina.png", "Argentina", "", "pride", "pride"}
CARDS[308] = {"cards/flags/armenia.png", "Armenia", "", "pride", "pride"}
CARDS[309] = {"cards/flags/australia.png", "Australia", "", "pride", "pride"}
CARDS[310] = {"cards/flags/austria.png", "Austria", "", "pride", "pride"}
CARDS[311] = {"cards/flags/belgium.png", "Belgium", "", "pride", "pride"}
CARDS[312] = {"cards/flags/brazil.png", "Brazil", "", "pride", "pride"}
CARDS[313] = {"cards/flags/canada.png", "Canada", "", "pride", "pride"}
CARDS[314] = {"cards/flags/chile.png", "Chile", "", "pride", "pride"}
CARDS[315] = {"cards/flags/china.png", "China", "", "pride", "pride"}
CARDS[316] = {"cards/flags/colombia.png", "Colombia", "", "pride", "pride"}
CARDS[317] = {"cards/flags/czechia.png", "Czechia", "", "pride", "pride"}
CARDS[318] = {"cards/flags/denmark.png", "Denmark", "", "pride", "pride"}
CARDS[319] = {"cards/flags/ecuador.png", "Ecuador", "", "pride", "pride"}
CARDS[320] = {"cards/flags/england.png", "England", "", "pride", "pride"}
CARDS[321] = {"cards/flags/finland.png", "Finland", "", "pride", "pride"}
CARDS[322] = {"cards/flags/france.png", "France", "", "pride", "pride"}
CARDS[323] = {"cards/flags/germany.png", "Germany", "", "pride", "pride"}
CARDS[324] = {"cards/flags/greece.png", "Greece", "", "pride", "pride"}
CARDS[325] = {"cards/flags/hungary.png", "Hungary", "", "pride", "pride"}
CARDS[326] = {"cards/flags/india.png", "India", "", "pride", "pride"}
CARDS[327] = {"cards/flags/ireland.png", "Ireland", "", "pride", "pride"}
CARDS[328] = {"cards/flags/israel.png", "Israel", "", "pride", "pride"}
CARDS[329] = {"cards/flags/italy.png", "Italy", "", "pride", "pride"}
CARDS[330] = {"cards/flags/japan.png", "Japan", "", "pride", "pride"}
CARDS[331] = {"cards/flags/kuwait.png", "Kuwait", "", "pride", "pride"}
CARDS[332] = {"cards/flags/latvia.png", "Latvia", "", "pride", "pride"}
CARDS[333] = {"cards/flags/netherlands.png", "Netherlands", "", "pride", "pride"}
CARDS[334] = {"cards/flags/newzealand.png", "New Zealand", "", "pride", "pride"}
CARDS[335] = {"cards/flags/norway.png", "Norway", "", "pride", "pride"}
CARDS[336] = {"cards/flags/pakistan.png", "Pakistan", "", "pride", "pride"}
CARDS[337] = {"cards/flags/peru.png", "Peru", "", "pride", "pride"}
CARDS[338] = {"cards/flags/philippines.png", "Philippines", "", "pride", "pride"}
CARDS[339] = {"cards/flags/poland.png", "Poland", "", "pride", "pride"}
CARDS[340] = {"cards/flags/portugal.png", "Portugal", "", "pride", "pride"}
CARDS[341] = {"cards/flags/romania.png", "Romania", "", "pride", "pride"}
CARDS[342] = {"cards/flags/russia.png", "Russia", "", "pride", "pride"}
CARDS[343] = {"cards/flags/scotland.png", "Scotland", "", "pride", "pride"}
CARDS[344] = {"cards/flags/slovakia.png", "Slovakia", "", "pride", "pride"}
CARDS[345] = {"cards/flags/southkorea.png", "South Korea", "", "pride", "pride"}
CARDS[346] = {"cards/flags/spain.png", "Spain", "", "pride", "pride"}
CARDS[347] = {"cards/flags/sweden.png", "Sweden", "", "pride", "pride"}
CARDS[348] = {"cards/flags/thailand.png", "Thailand", "", "pride", "pride"}
CARDS[349] = {"cards/flags/turkey.png", "Turkey", "", "pride", "pride"}
CARDS[350] = {"cards/flags/uganda.png", "Uganda", "", "pride", "pride"}
CARDS[351] = {"cards/flags/ukraine.png", "Ukraine", "", "pride", "pride"}
CARDS[352] = {"cards/flags/unitedkingdom.png", "UK", "", "pride", "pride"}
CARDS[353] = {"cards/flags/unitedstates.png", "USA", "", "pride", "pride"}
CARDS[354] = {"cards/flags/venezuela.png", "Venezuela", "", "pride", "pride"}
CARDS[355] = {"cards/flags/vietnam.png", "Vietnam", "", "pride", "pride"}
CARDS[356] = {"cards/flags/wales.png", "Wales", "", "pride", "pride"}

QUOTES = {
	'"thank you for playing my gamemode <3" -Penial',
	'"a jeep wrangler is less aerodynamic than a lobster" -P0w',
	'"meow" -Megu',
	'"my grandma drowned, drowned in drip" -RandomSZ',
	'"skill issue" -Strike Force Lightning',
	'"told my wife im going to the bank, didnt tell her which one" -stiel',
	'"go lick a gas pump" -Bomca',
	'"justice for cradle, we the people demand" -RandomSZ',
	'"women fear me, fish want me" -Tomato',
	'"gang where are you, blud where are you" -White Guy',
	'"any kief slayers" -Cream',
	'"if i was a tree, i would have no reason to love a human" -suomij',
	'"i wish someone wanted me like plankton wanted the formula" -Seven',
	'"but your honor, babies kick pregnant women all the time" -MegaSlayer',
	'"by the nine im tweakin" -MegaSlayer',
	'"ball torture is $4 usd on steam" -Portanator',
	'"your walls are never safe from the drywall muncher" -Vertex',
	'"im obviously not racist, ive kissed a black man" -Mattimeo',
	'"my balls are made of one thing..." -trishnnn',
	'"im like that" -Homeless',
	'"i need about tree fiddy" -Random Films',
	'"can we ban this guy" -Poopy',
	'"root beer" -Plat',
	'"never forget 9/11" -afiais',
	'"praise o monolith" -Medinator',
	'"shut it mate yer da sells avon" -zee!',
	'"holy fishpaste" -Zenthic',
	'"titanmod servers are as stable as a girl with blue hair" -TheBean',
	'"titanmod is my favorite tactical shooter" -Computery',
	'"all bark no bite" -Tana',
	'"a gay man is shooting me" -emaad',
	'"getting a rainbow wont bring your father back" -SenorDragon',
	'"wobbler, its on sight" -blackchromatic',
	'"aim trainers dont work" -rA warden',
	'"six mustard seven mango" -forrest',
	'"she bad on my business" -ballsconsumer77',
	'"thinking is op" -Satire',
	'"send me fart pics" -imjoshinit',
	'"im gonna send you to nagasaki and nuke you again" -oreagano',
	'"my dad broke up with you on tomodachi life" -Oade',
	'"never forget 9/11 because that is when borderlands 4 came out" -Braven',
	'"joy and prosperity" -Dual Rotor Helicopter',
	'"im like the punch of titanmod" -czalta',
	'"i need my payday too" -Tired Swiss',
	'"i went to the butcher and they didnt have any wobblemeat" -goldie',
	'"" -saul t. nuts',
	'"buy a cake and eat it" -waddlechud',
	'"when is loosenmod coming out?! amirite!?!" -styamage',
	'"ところで、話は変わりますが、Garrys Mod Workshopの「Titanmod」" -BinaryAssault'
}
