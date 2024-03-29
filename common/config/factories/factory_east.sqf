private ["_side", "_u"];
_side = _this;
if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid
	switch (CTI_FACTION_DEFAULT_TROOPS) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_Recon_TL_F"];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_Recon_TL_F"];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "CUP_O_RU_Officer"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "CUP_O_RU_Crew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "CUP_O_RU_Pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "CUP_O_RUS_SpecOps_Scout"];
		};
		case 3: { //RHS
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "rhs_msv_emr_officer_armored"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "rhs_msv_emr_combatcrew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "rhs_pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "rhs_msv_emr_rifleman"];
		};
	}
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic
	switch (CTI_FACTION_DEFAULT_TROOPS) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_T_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_T_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_T_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_T_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_T_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_T_spotter_F"];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_T_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_T_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_T_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_T_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_T_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_T_spotter_F"];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "CUP_O_RU_Officer"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "CUP_O_RU_Crew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "CUP_O_RU_Pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "CUP_O_RUS_SpecOps_Scout"];
		};
		case 3: { //RHS
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "rhs_msv_emr_officer_armored"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "rhs_msv_emr_combatcrew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "rhs_pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "rhs_msv_emr_rifleman"];
		};
	}
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter
	switch (CTI_FACTION_DEFAULT_TROOPS) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_T_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_T_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_T_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_T_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_T_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_T_spotter_F"];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "O_T_officer_F"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "O_T_Soldier_lite_F"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "O_diver_F"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "O_T_Soldier_F"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "O_T_crew_F"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "O_T_Helipilot_F"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "O_T_spotter_F"];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "CUP_O_RU_Officer"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "CUP_O_RU_Soldier"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "CUP_O_RU_Crew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "CUP_O_RU_Pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "CUP_O_RUS_SpecOps_Scout"];
		};
		case 3: { //RHS
			missionNamespace setVariable [format["CTI_%1_Commander", _side], "rhs_msv_emr_officer_armored"];
			missionNamespace setVariable [format["CTI_%1_Worker", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Diver", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Soldier", _side], "rhs_msv_emr_rifleman"];
			missionNamespace setVariable [format["CTI_%1_Crew", _side], "rhs_msv_emr_combatcrew"];
			missionNamespace setVariable [format["CTI_%1_Pilot", _side], "rhs_pilot"];
			missionNamespace setVariable [format["CTI_%1_Static", _side], "rhs_msv_emr_rifleman"];
		};
	}
};

//Set starting vehicles
if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [
				["CUP_O_GAZ_Vodnik_MedEvac_RU", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 20],
					["30Rnd_9x21_Mag", 20]
				]],
				["CUP_B_UAZ_SPG9_CDF", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 10],
					["30Rnd_9x21_Mag", 20]
				]],
				["CUP_O_GAZ_Vodnik_AGS_RU", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 20],
					["30Rnd_9x21_Mag", 20]
				]],
				["CUP_O_BTR60_CSAT", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 20],
					["30Rnd_9x21_Mag", 20]
				]]
				//,	["O_Heli_Light_02_unarmed_F", []]
			]];
		};
		case 3: { //RHS 
		           // replace O_Truck_03_medical_F with rhs_gaz66_ap2_msv when Issue #346 is resolved
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [
				["O_Truck_03_medical_F", [
					["rhs_weap_rpg26", 10], 
					["Toolkit", 1],
					["acc_flashlight", 10],
					["30Rnd_9x21_Mag", 20]
				]],
				["RHS_UAZ_MSV_01", [
					["rhs_weap_rpg26", 10], 
					["Toolkit", 1],
					["acc_flashlight", 10],
					["30Rnd_9x21_Mag", 20]
				]],
				["rhs_tigr_sts_msv", [
					["rhs_weap_rpg26", 10], 
					["Toolkit", 1],
					["acc_flashlight", 10],
					["30Rnd_9x21_Mag", 20]
				]],
				["rhs_btr60_msv", [
					["rhs_weap_rpg26", 10], 
					["Toolkit", 1],
					["acc_flashlight", 10],
					["30Rnd_9x21_Mag", 20]
				]]
				//,	["O_Heli_Light_02_unarmed_F", []]
			]];
		};
	}
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [
				["O_T_Truck_03_medical_ghex_F", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 20],
					["30Rnd_9x21_Mag", 20]
				]],
				["O_T_MRAP_02_hmg_ghex_F", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 10],
					["30Rnd_9x21_Mag", 20]
				]],
				["O_T_MRAP_02_gmg_ghex_F", [
					["CUP_launch_RPG18", 5], 
					["CUP_RPG18_M", 20],
					["Toolkit", 1],
					["acc_flashlight", 10],
					["CUP_sgun_Saiga12K", 10],
					["CUP_8Rnd_B_Saiga12_74Slug_M", 20],
					["30Rnd_9x21_Mag", 20]
				]]
			]];
		};
		case 3: { //RHS
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
	}
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: { //Vanilla
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 1: { //Apex
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 2: { //CUP
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
		case 3: { //RHS
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				["O_Truck_03_medical_F", [
					["arifle_Katiba_GL_F", 2], ["30rnd_65x39_caseless_green", 50],
					["launch_RPG32_F", 5], ["RPG32_F", 20],
					["HandGrenade", 20],
					["30Rnd_556x45_Stanag", 15],
					["30Rnd_65x39_caseless_green_mag_Tracer", 6],
					["1Rnd_HE_Grenade_shell", 24],
					["UGL_FlareRed_F", 27],
					["acc_flashlight", 10],
					["optic_ACO_grn", 3],
					["Toolkit", 1]	]],
					["O_MRAP_02_F", [	
					["Toolkit", 1],
					["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_RPG32_F", 5], 
					["RPG32_F", 20]
				]],
				["O_MRAP_02_hmg_F", [
					["Toolkit", 1],["firstaidkit", 10],
					["30Rnd_556x45_Stanag", 15],
					["launch_NLAW_F", 5], 
					["acc_flashlight", 10],
					["NLAW_F", 20]
				]]
			]];
		};
	}
};

//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.

_u = [];

//Universal Vanilla

	
if (CTI_FACTION_EAST == 0) then {
//CSAT Arid Vanilla
/*_u pushBack 'O_soldier_AR_F';
_u pushBack 'O_Soldier_A_F';
_u pushBack 'O_soldier_exp_F';
_u pushBack 'O_Soldier_GL_F';
_u pushBack 'O_soldier_M_F';
_u pushBack 'O_medic_F';
_u pushBack 'O_Soldier_F';
_u pushBack 'O_soldier_PG_F';
_u pushBack 'O_engineer_F';
_u pushBack 'O_sniper_F';
_u pushBack 'O_soldier_repair_F';
_u pushBack 'O_soldier_LAT_F';
_u pushBack 'O_soldier_AA_F';
_u pushBack 'O_soldier_AT_F';*/
_u pushBack 'O_spotter_F';
/*_u pushBack 'O_soldier_UAV_F';
_u pushBack 'O_Helipilot_F';
_u pushBack 'O_crew_F';
_u pushBack 'O_Soldier_TL_F';
_u pushBack 'O_Soldier_SL_F';
_u pushBack 'O_Diver_F';
_u pushBack 'O_Diver_TL_F';
_u pushBack 'O_Recon_Exp_F';
_u pushBack 'O_Recon_JTAC_F';
_u pushBack 'O_Recon_Medic_F';
_u pushBack 'O_Recon_F';
_u pushBack 'O_Recon_LAT_F';
_u pushBack 'O_Recon_TL_F';
_u pushBack 'O_Sniper_F';
_u pushBack 'O_ghillie_tna_F';*/
/*_u pushBack 'O_Spotter_F';*/
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla

};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
	_u pushBack 'O_T_soldier_AR_F';
	_u pushBack 'O_T_Soldier_A_F';
	_u pushBack 'O_T_Soldier_exp_F';
	_u pushBack 'O_T_Soldier_GL_F';
	_u pushBack 'O_T_Soldier_M_F';
	_u pushBack 'O_T_Medic_F';
	_u pushBack 'O_T_Soldier_F';
	_u pushBack 'O_T_Soldier_PG_F';
	_u pushBack 'O_T_Engineer_F';
	_u pushBack 'O_T_Soldier_repair_F';
	_u pushBack 'O_T_Soldier_LAT_F';
	_u pushBack 'O_T_Soldier_AA_F';
	_u pushBack 'O_T_Soldier_AT_F';
	_u pushBack 'O_T_Soldier_UAV_F';
	_u pushBack 'O_T_Helipilot_F';
	_u pushBack 'O_T_Crew_F';
	_u pushBack 'O_T_Soldier_TL_F';
	_u pushBack 'O_T_Soldier_SL_F';
	//Special Forces
	_u pushBack 'O_T_Diver_F';
	_u pushBack 'O_T_Diver_TL_F';
	_u pushBack 'O_T_Recon_Exp_F';
	_u pushBack 'O_T_Recon_JTAC_F';
	_u pushBack 'O_T_Recon_Medic_F';
	_u pushBack 'O_T_Recon_F';
	_u pushBack 'O_T_Recon_LAT_F';
	_u pushBack 'O_T_Recon_TL_F';
	_u pushBack 'O_T_Sniper_F';
	_u pushBack 'O_T_ghillie_tna_F';
	_u pushBack 'O_T_Spotter_F';
	//PACIFIC Viper
	_u pushBack 'O_V_Soldier_Exp_ghex_F';
	_u pushBack 'O_V_Soldier_JTAC_ghex_F';
	_u pushBack 'O_V_Soldier_M_ghex_F';
	_u pushBack 'O_V_Soldier_ghex_F';
	_u pushBack 'O_V_Soldier_Medic_ghex_F';
	_u pushBack 'O_V_Soldier_LAT_ghex_F';
	_u pushBack 'O_V_Soldier_TL_ghex_F';
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
	_u pushBack 'CUP_O_RU_Soldier';
	_u pushBack 'CUP_O_RU_Soldier_AA';
	_u pushBack 'CUP_O_RU_Soldier_MG';
	_u pushBack 'CUP_O_RU_Crew';
	_u pushBack 'CUP_O_RU_Officer';
	_u pushBack 'CUP_O_RU_Soldier_AT';
	_u pushBack 'CUP_O_RU_Soldier_HAT';
	_u pushBack 'CUP_O_RU_Engineer';
	_u pushBack 'CUP_O_RU_Soldier_GL';
	_u pushBack 'CUP_O_RU_Medic';
	_u pushBack 'CUP_O_RU_Pilot';
	_u pushBack 'CUP_O_RUS_SpecOps_Scout';
	_u pushBack 'CUP_O_RU_Sniper_KSVK';
    _u pushBack 'CUP_O_RU_Spotter';
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
			_u pushBack 'CUP_O_RU_Soldier_VDV_EMR';
	_u pushBack 'CUP_O_RU_Soldier_AA_VDV_EMR';
	_u pushBack 'CUP_O_RU_Soldier_MG_VDV_EMR';
	_u pushBack 'CUP_O_RU_Crew_VDV_EMR';
	_u pushBack 'CUP_O_RU_Soldier_AT_VDV_EMR';
	_u pushBack 'CUP_O_RU_Soldier_HAT_VDV_EMR';
	_u pushBack 'CUP_O_RU_Engineer_VDV_EMR';
	_u pushBack 'CUP_O_RU_Soldier_GL_VDV_EMR';
	_u pushBack 'CUP_O_RU_Medic_VDV_EMR';
	_u pushBack 'CUP_O_RU_Pilot_VDV_EMR';
	_u pushBack 'CUP_O_RU_Sniper_KSVK_VDV_EMR';
    _u pushBack 'CUP_O_RU_Spotter_VDV_EMR';
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
	/*_u pushBack 'IP_O_Soldier_FST';
	_u pushBack 'IP_O_Soldier_LAT_FST';
	_u pushBack 'IP_O_HeavyGunner_FST';
	_u pushBack 'IP_O_Sharpshooter_FST';
	_u pushBack 'IP_O_Medic_FST';
	_u pushBack 'IP_O_Soldier_GL_FST';
	_u pushBack 'IP_O_Soldier_AA_FST';
	_u pushBack 'IP_O_Soldier_AT_FST';
	_u pushBack 'IP_O_Soldier_repair_FST';
	_u pushBack 'IP_O_Soldier_exp_FST';
	_u pushBack 'IP_O_Engineer_FST';
	_u pushBack 'IP_O_crew_FST';
	_u pushBack 'IP_O_HeliCrew_FST';
	_u pushBack 'IP_O_Officer_hex_FST';
	//Special Forces
	_u pushBack 'IP_O_recon_exp_FST';
	_u pushBack 'IP_O_recon_JTAC_FST';
	_u pushBack 'IP_O_recon_M_FST';
	_u pushBack 'IP_O_recon_medic_FST';
	_u pushBack 'IP_O_pathfinder_FST';
	_u pushBack 'IP_O_recon_FST';
	_u pushBack 'IP_O_recon_LAT_FST';
	_u pushBack 'IP_O_recon_TL_FST';*/
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
	_u pushBack 'rhs_msv_emr_rifleman';
	_u pushBack 'rhs_msv_emr_aa';
/*	_u pushBack 'rhs_msv_emr_arifleman';*/
	_u pushBack 'rhs_msv_emr_at';
	_u pushBack 'rhs_msv_emr_combatcrew';
	_u pushBack 'rhs_msv_emr_LAT';
	_u pushBack 'rhs_msv_emr_RShG2';
	/*_u pushBack 'rhs_msv_emr_at';*/
	_u pushBack 'rhs_msv_emr_engineer';
/*	_u pushBack 'rhs_msv_emr_engineer';*/
	_u pushBack 'rhs_msv_emr_grenadier';
	_u pushBack 'rhs_msv_emr_medic';
	_u pushBack 'rhs_msv_emr_arifleman';
	_u pushBack 'rhs_pilot';
	_u pushBack 'rhs_msv_emr_marksman';
	_u pushBack 'rhs_msv_emr_sergeant';
	_u pushBack 'rhs_msv_emr_jumior_sergeant';
	_u pushBack 'rhs_msv_emr_officer';
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.

//Universal Vanilla
/*_u pushBack 'I_C_Offroad_02_unarmed_F';	*/	
_u pushBack 'O_G_Offroad_01_F';	
/*_u pushBack 'O_Truck_02_medical_F';*/
_u pushBack 'O_Truck_03_medical_F';
_u pushBack 'Land_Pod_Heli_Transport_04_medevac_F';
_u pushBack 'O_Truck_03_device_F';
_u pushBack 'O_Quadbike_01_F';
/*_u pushBack "O_G_Offroad_01_armed_F";
_u pushBack 'C_Van_01_transport_F';*/
_u pushBack "O_APC_Wheeled_02_rcws_F";

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
	_u pushBack 'O_MRAP_02_gmg_F';	
	_u pushBack 'O_MRAP_02_hmg_F';			
	_u pushBack 'O_Truck_02_transport_F';
/*	_u pushBack 'O_Truck_03_transport_F';*/
	_u pushBack 'O_MRAP_02_F';
/*	_u pushBack 'O_MRAP_02_hmg_F';
	_u pushBack 'O_MRAP_02_gmg_F';*/
/*	_u pushBack 'O_UGV_01_F';
	_u pushBack 'O_UGV_01_rcws_F';*/

};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla
	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
    _u pushBack 'O_T_APC_Wheeled_02_rcws_ghex_F';
    _u pushBack 'O_T_Truck_03_medical_ghex_F';
    _u pushBack 'O_T_MRAP_02_gmg_ghex_F';
    _u pushBack 'O_T_MRAP_02_hmg_ghex_F';
    _u pushBack 'O_T_MRAP_02_ghex_F';


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
	_u pushBack 'O_T_LSV_02_armed_F';		
	_u pushBack 'O_T_LSV_02_unarmed_F';		
	_u pushBack 'O_T_Quadbike_01_ghex_F';
	_u pushBack 'O_T_Truck_03_transport_ghex_F';
	_u pushBack 'O_T_Truck_03_covered_ghex_F';
	_u pushBack 'O_T_MRAP_02_ghex_F';
	_u pushBack 'O_T_MRAP_02_gmg_ghex_F';
	_u pushBack 'O_T_MRAP_02_hmg_ghex_F';
	_u pushBack 'O_T_UGV_01_ghex_F';
	_u pushBack 'O_T_UGV_01_rcws_ghex_F';
	_u pushBack 'O_T_Truck_03_medical_ghex_F';
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack 'CUP_B_Dingo_GER_Wdl';		
	_u pushBack 'CUP_B_Dingo_GL_GER_Wdl';		
	_u pushBack 'CUP_O_Ural_RU';			
	_u pushBack 'CUP_O_BRDM2_ATGM_RUS';  
        _u pushBack 'CUP_O_BTR60_CSAT';   		
	_u pushBack 'CUP_O_GAZ_Vodnik_AGS_RU';		
	_u pushBack 'CUP_O_UAZ_METIS_RU';		
	_u pushBack 'CUP_O_GAZ_Vodnik_BPPU_RU';		
	_u pushBack 'CUP_O_Ural_ZU23_RU';		
	_u pushBack 'CUP_O_GAZ_Vodnik_MedEvac_RU';	
	_u pushBack 'CUP_B_UAZ_MG_CDF';			
	_u pushBack 'CUP_I_BTR40_MG_TKG';		
	_u pushBack 'CUP_O_UAZ_AGS30_RU';		
	_u pushBack 'CUP_I_SUV_Armored_ION';  
	_u pushBack 'CUP_B_UAZ_Unarmed_CDF';		
        _u pushBack 'CUP_O_Ural_Refuel_RU';		
	_u pushBack 'CUP_O_BTR90_RU';	
/*	_u pushBack 'CUP_O_LR_SPG9_TKA';*/
	_u pushBack 'CUP_M1030';
	_u pushBack 'CUP_B_TowingTractor_USMC';
	_u pushBack 'CUP_C_Skoda_White_CIV';
	_u pushBack 'CUP_C_SUV_TK';
	_u pushBack 'CUP_I_SUV_Armored_ION';
	_u pushBack 'CUP_C_Datsun';
	_u pushBack 'CUP_O_Datsun_PK_Random';
	_u pushBack 'CUP_O_BTR90_RU';
	_u pushBack 'CUP_O_BTR90_HQ_RU';
	_u pushBack 'CUP_B_LR_Ambulance_CZ_W';
	_u pushBack 'OFPS_LR_MG';
	_u pushBack 'OFPS_LR_S';
	_u pushBack 'OFPS_LR_SPG9';
	_u pushBack 'OFPS_LR_SX';
	_u pushBack 'CUP_C_LR_Transport_CTK';
	_u pushBack 'CUP_B_UAZ_Unarmed_CDF';
	_u pushBack 'CUP_O_UAZ_AGS30_CSAT';
	_u pushBack 'CUP_O_UAZ_MG_CSAT';
	_u pushBack 'CUP_O_UAZ_METIS_CSAT';
	_u pushBack 'CUP_O_UAZ_Open_CSAT';
	_u pushBack 'CUP_O_UAZ_SPG9_CSAT';
	_u pushBack 'CUP_O_Ural_RU';
	_u pushBack 'CUP_O_Ural_Empty_RU';
	_u pushBack 'CUP_O_Ural_Open_RU';
	_u pushBack 'CUP_O_Ural_ZU23_RU';
	_u pushBack 'CUP_O_BTR40_TKA';
	_u pushBack 'CUP_O_BTR40_MG_TKA';
	_u pushBack 'CUP_O_GAZ_Vodnik_PK_RU';
	_u pushBack 'CUP_O_GAZ_Vodnik_AGS_RU';
	_u pushBack 'CUP_O_GAZ_Vodnik_BPPU_RU';
	_u pushBack 'CUP_O_GAZ_Vodnik_MedEvac_RU';
	_u pushBack 'CUP_I_Datsun_PK';



	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
	_u pushBack 'CUP_O_BRDM2_CSAT';
	_u pushBack 'CUP_O_BRDM2_ATGM_CSAT';
	_u pushBack 'CUP_O_BRDM2_HQ_CSAT';
	_u pushBack 'CUP_O_BTR60_CSAT';
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
	_u pushBack 'OFPS_BRDM2_T';
	_u pushBack 'OFPS_BRDM2HQ_T';
	_u pushBack 'OFPS_BRDM2ATGM_T';
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
	/*_u pushBack 'OFPS_S_BRDM2_T';
	_u pushBack 'OFPS_S_BRDM2ATGM_T';
	_u pushBack 'OFPS_S_BRDM2HQ_T';
	_u pushBack 'OFPS_S_BTR60';
	_u pushBack 'OFPS_S_UAZ';
	_u pushBack 'OFPS_S_UAZ_AGS30';
	_u pushBack 'OFPS_S_UAZ_MG';
	_u pushBack 'OFPS_S_UAZ_METIS';
	_u pushBack 'OFPS_S_UAZ_SPG9';
	_u pushBack 'OFPS_S_LR_MG';
	_u pushBack 'OFPS_S_LR_S';
	_u pushBack 'OFPS_S_LR_SPG9';
	_u pushBack 'OFPS_S_LR_SX';*/
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	/*_u pushBack 'dbo_CIV_new_bike';
	_u pushBack 'OFPS_BRDM2';
	_u pushBack 'OFPS_BRDM2ATGM';
	_u pushBack 'OFPS_BRDM2HQ';
	_u pushBack 'OFPS_BTR60';
	_u pushBack 'OFPS_UAZ_AGS30';
	_u pushBack 'OFPS_UAZ_MG';
	_u pushBack 'OFPS_UAZ_METIS';
	_u pushBack 'OFPS_UAZ';
	_u pushBack 'OFPS_UAZ_SPG9';*/
	//_u pushBack 'sfp_dakota';
	//_u pushBack 'sfp_mercedes';
	//_u pushBack 'dbo_CIV_ol_bike';

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		/*_u pushBack 'sfp_bv206_winter';
		_u pushBack 'AAF_D_Truck_02_covered_F';
		_u pushBack 'AAF_D_MRAP_03_F';
		_u pushBack 'AAF_D_MRAP_03_hmg_F';
		_u pushBack 'AAF_D_MRAP_03_gmg_F';
		_u pushBack 'AAF_D_Truck_02_medical_F';*/
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
/*_u pushBack 'rhs_tigr_msv';
_u pushBack 'rhs_tigr_m_msv';
_u pushBack 'rhs_gaz66_msv';*/
_u pushBack 'rhs_kamaz5350_msv';
_u pushBack 'rhs_tigr_m_3camo_msv';
/*_u pushBack 'rhs_tigr_3camo_msv';*/
_u pushBack 'RHS_UAZ_MSV_01';
/*_u pushBack 'rhs_uaz_open_MSV_01';*/
_u pushBack 'rhsgref_BRDM2UM_msv';
_u pushBack 'rhsgref_ins_uaz_dshkm';
_u pushBack 'rhsgref_ins_uaz_ags';
_u pushBack 'rhs_tigr_sts_msv';
/*_u pushBack 'rhsgref_BRDM2_msv';*/
//_u pushBack 'rhs_gaz66_ap2_msv';
_u pushBack 'rhs_tigr_sts_3camo_msv';
/*_u pushBack 'rhs_btr60_msv';*/
_u pushBack 'rhs_btr70_msv';
/*_u pushBack 'rhs_btr80_msv';*/
_u pushBack 'rhs_gaz66_zu23_msv';
_u pushBack 'rhsgref_BRDM2_ATGM_msv';
_u pushBack 'rhs_btr80a_msv';
/*_u pushBack 'RHS_BM21_MSV_01';
_u pushBack 'rhs_9k79';
_u pushBack 'rhs_9k79_K';*/
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.

//Universal Vanilla

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla

	_u pushBack "O_APC_Tracked_02_cannon_F";
	/*_u pushBack "O_MBT_02_cannon_F";*/
	_u pushBack "O_APC_Tracked_02_AA_F";
	/*_u pushBack "O_MBT_02_arty_F";*/

};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla
	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
	_u pushBack 'O_T_APC_Wheeled_02_rcws_ghex_F';
	_u pushBack 'O_T_APC_Tracked_02_cannon_ghex_F';
/*	_u pushBack 'O_T_MBT_02_cannon_ghex_F';*/
	_u pushBack 'O_T_APC_Tracked_02_AA_ghex_F';
/*	_u pushBack 'O_T_MBT_02_arty_ghex_F';*/
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	/*_u pushBack 'CUP_O_BMP1P_TKA';		
	_u pushBack 'CUP_O_BMP2_RU';			
	_u pushBack 'CUP_O_BMP2_AMB_RU';*/	
	_u pushBack 'CUP_O_BMP3_RU';	
	_u pushBack 'CUP_O_ZSU23_SLA';		
	_u pushBack 'CUP_O_2S6_RU';
	_u pushBack 'CUP_O_2S6M_RU';	
	_u pushBack 'CUP_B_T72_CZ';		
	_u pushBack 'CUP_O_BM21_RU';
//	_u pushBack 'CUP_O_T90_RU';
/* 
	_u pushBack 'CUP_O_BMP1_CSAT';
	_u pushBack 'CUP_O_BMP2_CSAT';
	_u pushBack 'CUP_O_BMP_HQ_CSAT';
	_u pushBack 'CUP_O_BMP2_AMB_CSAT';
	_u pushBack 'CUP_O_BMP2_ZU_CSAT';
	_u pushBack 'CUP_O_T55_CSAT';
	_u pushBack 'CUP_O_ZSU23_CSAT';
	_u pushBack 'OFPS_BMP3';';
*/


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
	_u pushBack 'OFPS_BMP1';
	_u pushBack 'CUP_O_BMP1P_CSAT';
	_u pushBack 'OFPS_BMP2';
	_u pushBack 'OFPS_BMP2_M';
	_u pushBack 'OFPS_BMP2_ZSU';
	_u pushBack 'OFPS_T55';
	_u pushBack 'OFPS_ZSU23';
	_u pushBack 'OFPS_BMP3';
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
	_u pushBack 'OFPS_T55_T';	
	_u pushBack 'OFPS_T72_T';	
	_u pushBack 'OFPS_BMP1_T';
	_u pushBack 'OFPS_BMP1P_T';
	_u pushBack 'OFPS_BMP2_T';
	_u pushBack 'OFPS_BMP2_HQ_T';
	_u pushBack 'OFPS_BMP2_M_T';
	_u pushBack 'OFPS_BMP2_ZSU_T';
	_u pushBack 'OFPS_BMP3_T';
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
	/*_u pushBack 'OFPS_S_BMP1';
	_u pushBack 'OFPS_S_BMP1P';
	_u pushBack 'OFPS_S_BMP2';
	_u pushBack 'OFPS_S_BMP2_HQ';
	_u pushBack 'OFPS_S_BMP2_M';
	_u pushBack 'OFPS_S_ZSU23';
	_u pushBack 'OFPS_T55_S';
	_u pushBack 'OFPS_T72_S';
	_u pushBack 'OFPS_S_BMP3';*/
	
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS

	_u pushBack 'OFPS_BMP1P';		
	_u pushBack 'OFPS_BMP2';			
	_u pushBack 'CUP_O_BMP3_RU';		
	_u pushBack 'OFPS_T55';		
	_u pushBack 'OFPS_BMP2_M';			
	_u pushBack 'CUP_O_2S6M_RU';				

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
	/*_u pushBack "AAF_D_APC_tracked_03_cannon_F";
	_u pushBack "AAF_D_MBT_03_cannon_F";
	_u pushBack "AAF_D_APC_Wheeled_03_cannon_F";*/
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
_u pushBack 'rhs_bmp1_msv'; 
/*_u pushBack 'rhs_bmd1'; 
_u pushBack 'rhs_pts_vmf'; 
_u pushBack 'rhs_prp3_msv'; 
_u pushBack 'rhs_bmp1p_msv'; 
_u pushBack 'rhs_bmd2'; 
_u pushBack 'rhs_bmd1r'; */
_u pushBack 'rhs_zsu234_aa'; 
/*_u pushBack 'rhs_bmp2e_msv'; */
_u pushBack 'rhs_bmp2d_msv'; 
/*_u pushBack 'rhs_Ob_681_2'; */
/*_u pushBack 'rhs_t72ba_tv';*/
/*_u pushBack 'rhs_t72bb_tv'; */ 
_u pushBack 'rhs_t72bd_tv'; 
_u pushBack 'rhs_sprut_vdv'; 
/*_u pushBack 'rhs_bmp3_msv'; 
_u pushBack 'rhs_bmd2m'; 
_u pushBack 'rhs_brm1k_msv'; 
_u pushBack 'rhs_bmd4vdv'; */
/*_u pushBack 'rhs_t80';*/ 
_u pushBack 'rhs_t80ue1'; 
_u pushBack 'rhs_bmp3m_msv'; 
_u pushBack 'rhs_t80bvk';
/*_u pushBack 'rhs_t90a_tv'; */
/*_u pushBack 'rhs_bmp3mera_msv'; */
_u pushBack 'rhs_bmd4ma_vdv'; 
/*_u pushBack 'rhs_2s3_tv';
_u pushBack 'RHS_BM21_MSV_01';
_u pushBack 'rhs_9k79';
_u pushBack 'rhs_9k79_K';*/
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.

//Universal Vanilla
	_u pushBack 'O_Heli_Transport_04_F'; 
   /* _u pushBack 'O_Heli_Light_02_unarmed_F';*/
	_u pushBack "O_Heli_Transport_04_ammo_F";
/*	_u pushBack "O_Heli_Transport_04_bench_F";*/
/*	_u pushBack "O_Heli_Transport_04_covered_F";*/
	_u pushBack "O_Heli_Transport_04_medevac_F";
	_u pushBack "O_Heli_Transport_04_repair_F";
/*	_u pushBack 'O_Heli_Light_02_F';
	_u pushBack 'O_Heli_Attack_02_F';
	_u pushBack 'O_Heli_Attack_02_black_F';
	_u pushBack 'O_UAV_02_CAS_F';*/
	_u pushBack 'O_UAV_02_F';
	/*_u pushBack 'O_Plane_CAS_02_F';*/
	_u pushBack "O_UAV_02_CAS_F";


if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla


	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla

	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
/*	_u pushBack 'C_Plane_Civil_01_F';
	_u pushBack "O_T_UAV_04_CAS_F";*/
	
	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
/*	_u pushBack "O_T_VTOL_02_infantry_hex_F";
	_u pushBack "O_T_VTOL_02_vehicle_hex_F";*/
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
/*	_u pushBack "O_T_VTOL_02_infantry_F";
	_u pushBack "O_T_VTOL_02_vehicle_F";*/

	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
/*	_u pushBack "O_T_VTOL_02_infantry_grey_F";
	_u pushBack "O_T_VTOL_02_vehicle_grey_F";*/
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
//	_u pushBack 'CUP_B_AW159_Cannon_RN_Grey';	
        _u pushBack 'CUP_O_Ka52_GreyCamo_RU';		
	_u pushBack 'CUP_B_Mi171Sh_ACR';
	_u pushBack 'CUP_O_Mi8_SLA_1';
	_u pushBack 'CUP_I_Ka60_GL_Blk_ION';		
	_u pushBack 'CUP_O_Su25_RU_3';	
	_u pushBack 'CUP_O_Su25_RU_1';
	_u pushBack 'CUP_O_C130J_TKA';
	_u pushBack 'CUP_O_C130J_Cargo_TKA';
	_u pushBack 'CUP_O_Su25_RU_2';	
	_u pushBack 'CUP_B_L39_BMB_CZ';			
	_u pushBack 'CUP_O_SU34_LGB_CSAT';	
	_u pushBack 'CUP_O_SU34_AGM_CSAT';	
	_u pushBack 'CUP_O_AN2_TK';
/*
	_u pushBack 'CUP_RU_Pchela1T';
	_u pushBack 'CUP_O_UH1H_TKA';
	_u pushBack 'CUP_O_Mi8_CHDKZ';
	_u pushBack 'CUP_O_Mi8_SLA_2';
	_u pushBack 'CUP_B_MI6T_CDF';
	_u pushBack 'CUP_C_Mi17_Civilian_RU';
	_u pushBack 'CUP_B_Mi171Sh_ACR';
	_u pushBack 'CUP_B_Mi24_D_CDF';
	_u pushBack 'CUP_O_Mi24_P_RU';
	_u pushBack 'CUP_O_Mi24_V_RU';
	_u pushBack 'CUP_I_Mi24_Mk3_AT_ION';
	_u pushBack 'CUP_O_Ka50_SLA';
	_u pushBack 'CUP_O_Ka52_RU';
	_u pushBack 'CUP_O_Ka60_Hex_CSAT';
	_u pushBack 'CUP_O_Ka60_GL_Hex_CSAT';
	_u pushBack 'CUP_C_DC3_CIV';
	_u pushBack 'OFPS_SU25';
*/

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
	_u pushBack 'CUP_O_MI6T_TKA';			
	_u pushBack 'CUP_B_Mi24_D_MEV_CDF';		
	_u pushBack 'CUP_O_Mi24_P_RU';		
	_u pushBack 'CUP_O_Mi24_V_RU';
	_u pushBack 'CUP_I_Mi24_Mk4_Empty_ION';		
	_u pushBack 'CUP_I_Mi24_Mk4_ION';		
	_u pushBack 'CUP_I_Mi24_Mk4_AT_ION';
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
	_u pushBack 'OFPS_MI6T';			
	_u pushBack 'OFPS_MI24';		
	_u pushBack 'OFPS_MI24P';		
	_u pushBack 'OFPS_MI24V';
	_u pushBack 'OFPS_MI24Mk4';		
	_u pushBack 'OFPS_MI24Mk4_R';		
	_u pushBack 'OFPS_MI24Mk4_AT';
	_u pushBack 'OFPS_SU25T';
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
	/*_u pushBack 'OFPS_MI6S';			
	_u pushBack 'CUP_B_Mi24_D_MEV_CDF';		
	_u pushBack 'CUP_O_Mi24_P_RU';		
	_u pushBack 'CUP_O_Mi24_V_RU';
	_u pushBack 'CUP_I_Mi24_Mk4_Empty_ION';		
	_u pushBack 'CUP_I_Mi24_Mk4_ION';		
	_u pushBack 'CUP_I_Mi24_Mk4_AT_ION';
	_u pushBack 'OFPS_S_SU25';
	_u pushBack 'OFPS_S_SU34_AGM';
	_u pushBack 'OFPS_S_SU34_LGB';*/
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	/*_u pushBack 'O_T_UAV_04_CAS_F';*/			
    _u pushBack 'O_UCSV_01';
	/*_u pushBack 'sfp_bo105_unarmed';
	_u pushBack 'sfp_bo105';*/
	/*_u pushBack 'O_UCSV_01';*/
	//_u pushBack 'USAF_C17';
	/*_u pushBack 'usaf_c5';
	_u pushBack 'LDL_C130J';
	_u pushBack 'bwi_a3_t6a_5';
	_u pushBack 'bwi_a3_at6b_2';
	_u pushBack 'bwi_a3_at6b_4';
	_u pushBack 'sab_alphajet8';
	_u pushBack 'sfp_j12';
	_u pushBack 'sfp_j12_rb15';
	_u pushBack 'sfp_j12_cap';*/
	/*_u pushBack 'OFPS_BUZAA_O';*/
	/*_u pushBack 'usaf_b1b';
	_u pushBack 'pook_tu953M80';
	_u pushBack 'pook_tu95ms';
	_u pushBack 'pook_tu95ms16';
	_u pushBack 'pook_tu95MSM';
	_u pushBack 'JS_JC_SU35';
	_u pushBack "sab_l19_sea_1";*/


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
	/*_u pushBack "IP_O_Plane_CAS_02_FSnowHex";
	_u pushBack 'IP_O_Heli_Attack_02_SnowHex_FST';
	_u pushBack 'IP_O_Heli_Light_02_FST';
	_u pushBack 'IP_O_Heli_Light_02_unarmed_FST';*/
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
/*_u pushBack 'rhs_Mi8AMT_vvsc';*/
_u pushBack 'rhs_ka60_c';
_u pushBack 'RHS_Mi8mt_vvsc';
_u pushBack 'RHS_Mi8mt_cargo_vdv';
/*_u pushBack 'RHS_Mi8MTV3_vvsc';
_u pushBack 'RHS_Mi8MTV3_FAB_vvsc';*/
_u pushBack 'RHS_Mi8MTV3_UPK23_vvsc';
_u pushBack 'RHS_Mi8AMTSh_UPK23_vvsc';
_u pushBack 'RHS_Mi8AMTSh_vvsc';
_u pushBack 'RHS_Su25SM_vvs';
/*_u pushBack 'RHS_Su25SM_CAS_vvs';*/
_u pushBack 'RHS_Mi24V_vvsc';
_u pushBack 'RHS_Mi24V_FAB_vvsc';
/*_u pushBack 'RHS_Mi24V_UPK23_vvsc';*/
/*_u pushBack 'RHS_Mi24P_vvsc';
_u pushBack 'RHS_Mi24P_CAS_vvsc';
_u pushBack 'RHS_Mi24V_AT_vvsc';*/
_u pushBack 'RHS_Mi24P_AT_vvsc';
/*_u pushBack 'RHS_Ka52_vvsc';
_u pushBack 'RHS_Ka52_UPK23_vvsc';*/
_u pushBack 'RHS_Su25SM_KH29_vvs';
_u pushBack 'RHS_T50_vvs_055';
/*_u pushBack 'RHS_TU95MS_vvs_tambov';*/
/*_u pushBack 'RHS_TU95MS_vvs_old';*/
/*_u pushBack 'rhs_mi28n_vvsc';
_u pushBack 'rhs_mi28n_s13_vvsc';*/
_u pushBack 'rhs_an2';
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.

//Universal Vanilla
_u pushBack "O_G_Offroad_01_repair_F";
/*_u pushBack 'O_Truck_03_repair_F';
_u pushBack "O_Truck_03_covered_F";//FOB
_u pushBack "O_Truck_02_box_F";//FOB LARGE*/
_u pushBack "Land_Pod_Heli_Transport_04_repair_F";
_u pushBack "Land_Pod_Heli_Transport_04_fuel_F";
/*_u pushBack "O_Truck_03_fuel_F";*/
_u pushBack "CTI_Salvager_East";

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
/*	_u pushBack "O_Truck_03_repair_ghex_F";
	_u pushBack "O_Truck_02_fuel_ghex_F";
*/
	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla

};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
_u pushBack 'O_T_Truck_03_fuel_ghex_F';
_u pushBack 'O_T_Truck_03_repair_ghex_F';

		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack 'CUP_O_Ural_Refuel_RU';
	_u pushBack 'CUP_O_Ural_Repair_RU';

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		//_u pushBack 'AAF_D_Truck_02_box_F';
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then {  
//Universal RHS
_u pushBack 'RHS_Ural_Fuel_MSV_01';
_u pushBack 'rhs_kamaz5350_flatbed_msv';
_u pushBack 'rhs_gaz66_repair_msv';
_u pushBack 'rhs_gaz66_r142_msv';
_u pushBack 'rhs_typhoon_vdv';
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _u];
_u = [];

//Universal Vanilla
/*_u pushBack "Box_East_Wps_F";*/
_u pushBack "O_supplyCrate_F";
_u pushBack "Land_Pod_Heli_Transport_04_ammo_F";

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
_u pushBack "O_Truck_02_Ammo_F";

	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla
	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX

		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
		_u pushBack 'O_T_Truck_03_ammo_ghex_F';

		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack 'CUP_O_Ural_Reammo_RU';

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		//_u pushBack 'AAF_D_Truck_02_box_F';
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
_u pushBack 'rhs_gaz66_ammo_msv';
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.

//Universal Vanilla
_u pushBack 'C_Boat_Civil_01_F';
_u pushBack 'O_Boat_Transport_01_F';
_u pushBack 'O_Boat_Armed_01_hmg_F';
_u pushBack 'B_Boat_Armed_01_minigun_F';
_u pushBack 'C_Boat_Civil_01_rescue_F';
_u pushBack 'O_SDV_01_F';

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla

	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla

	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
	_u pushBack "C_Scooter_Transport_01_F";
	_u pushBack "I_C_Boat_Transport_02_F";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
		_u pushBack 'O_T_Boat_Transport_01_F';
		_u pushBack 'O_T_Boat_Armed_01_hmg_F';
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack "CUP_B_RHIB_USMC";
	_u pushBack "CUP_B_RHIB2Turret_USMC";
	_u pushBack "CUP_B_Zodiac_USMC";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	/*_u pushBack "Burnes_LCAC_1";
	_u pushBack "sfp_svavare2000";
	_u pushBack "sfp_svavare2000_transport";
	_u pushBack "sfp_gruppbat";
	_u pushBack "sfp_rbb_norrkoping";
	_u pushBack "OFPS_Frigate_CSAT";*/

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
//--- WARNING - this boat is a blufor!!! adding in here as a temp unit!
_u pushBack "rhsusf_mkvsoc";

};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Depots.

//Universal Vanilla
_u pushBack "B_Quadbike_01_F";
_u pushBack "O_G_Offroad_01_F";
/*_u pushBack "O_G_Offroad_01_armed_F";*/
_u pushBack 'C_Van_01_transport_F';
_u pushBack 'O_Truck_02_transport_F';
_u pushBack 'C_Boat_Civil_01_F';
_u pushBack 'O_Boat_Transport_01_F';
_u pushBack "O_G_Offroad_01_repair_F";

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
	_u pushBack 'O_Soldier_F';
	_u pushBack 'O_crew_F';
	_u pushBack 'O_MRAP_02_F';
	_u pushBack 'O_MRAP_02_hmg_F';

	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla


	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
	_u pushBack 'O_T_LSV_02_armed_F';		
	_u pushBack 'O_T_LSV_02_unarmed_F';	
	_u pushBack "C_Scooter_Transport_01_F";
	_u pushBack "I_C_Boat_Transport_02_F";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
	_u pushBack 'O_T_Soldier_F';
	_u pushBack 'O_T_crew_F';
	_u pushBack 'O_T_Truck_03_transport_ghex_F';
	_u pushBack 'O_T_MRAP_02_ghex_F';
	_u pushBack 'O_T_MRAP_02_hmg_ghex_F';
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack "CUP_B_RHIB_USMC";
	_u pushBack "CUP_B_RHIB2Turret_USMC";
	_u pushBack "CUP_B_Zodiac_USMC";
	_u pushBack "CUP_C_Ikarus_TKC";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		_u pushBack 'CUP_O_RU_Soldier';
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	//_u pushBack 'sfp_dakota';
	//_u pushBack 'sfp_mercedes';
	_u pushBack 'OFPS_UAZ';
	_u pushBack 'OFPS_UAZ_MG';
	_u pushBack 'OFPS_UAZ_AGS30';
	//_u pushBack 'usaf_police_car2';
	//_u pushBack 'usaf_police_offroad';
	

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		/*_u pushBack 'IP_O_Soldier_FST';
		_u pushBack 'IP_O_crew_FST';
		_u pushBack 'sfp_bv206_winter';
		_u pushBack 'AAF_D_MRAP_03_F';
		_u pushBack 'AAF_D_MRAP_03_hmg_F';*/
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
	//Universal RHS
	_u pushBack 'rhs_msv_emr_rifleman';
	_u pushBack 'rhs_msv_emr_combatcrew';
	_u pushBack 'rhsgref_ins_uaz_dshkm';
	_u pushBack 'RHS_UAZ_MSV_01';
	_u pushBack 'rhs_tigr_m_3camo_msv';


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
	};
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Large FOB.

//Universal Vanilla
_u pushBack "B_Quadbike_01_F";
_u pushBack "O_G_Offroad_01_F";
_u pushBack "O_G_Offroad_01_armed_F";
_u pushBack 'C_Van_01_transport_F';
_u pushBack 'O_Truck_02_transport_F';
_u pushBack "O_G_Offroad_01_repair_F";

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
	_u pushBack 'O_Soldier_F';
	_u pushBack 'O_crew_F';
	_u pushBack 'O_MRAP_02_F';
	_u pushBack 'O_MRAP_02_hmg_F';
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla


	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
	_u pushBack 'O_T_LSV_02_armed_F';		
	_u pushBack 'O_T_LSV_02_unarmed_F';	
	_u pushBack "C_Scooter_Transport_01_F";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
	_u pushBack 'O_T_Soldier_F';
	_u pushBack 'O_T_crew_F';
	_u pushBack 'O_T_Truck_03_transport_ghex_F';
	_u pushBack 'O_T_MRAP_02_ghex_F';
	_u pushBack 'O_T_MRAP_02_hmg_ghex_F';
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		_u pushBack 'CUP_O_RU_Soldier';
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	//_u pushBack 'sfp_dakota';
	//_u pushBack 'sfp_mercedes';
	_u pushBack 'OFPS_UAZ';
	_u pushBack 'OFPS_UAZ_MG';
	_u pushBack 'OFPS_UAZ_AGS30';
	//_u pushBack 'usaf_police_car2';
	//_u pushBack 'usaf_police_offroad';
	

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		/*_u pushBack 'IP_O_Soldier_FST';
		_u pushBack 'IP_O_crew_FST';
		_u pushBack 'sfp_bv206_winter';
		_u pushBack 'AAF_D_MRAP_03_F';
		_u pushBack 'AAF_D_MRAP_03_hmg_F';*/
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS
	_u pushBack 'rhs_msv_emr_rifleman';
	_u pushBack 'rhs_msv_emr_arifleman';
	_u pushBack 'rhs_msv_emr_at';
	_u pushBack 'rhs_msv_emr_combatcrew';
	_u pushBack 'rhs_msv_emr_LAT';
	_u pushBack 'rhs_msv_emr_RShG2';
	_u pushBack 'rhs_msv_emr_engineer';
	_u pushBack 'rhs_msv_emr_grenadier';
	_u pushBack 'rhs_msv_emr_medic';
	_u pushBack 'rhs_msv_emr_marksman';
	_u pushBack 'rhs_msv_emr_junior_sergeant';
	_u pushBack 'rhs_msv_emr_sergeant';
	_u pushBack 'rhs_kamaz5350_msv';
	_u pushBack 'rhs_tigr_m_3camo_msv';
	_u pushBack 'RHS_UAZ_MSV_01';
	_u pushBack 'rhsgref_BRDM2UM_msv';
	_u pushBack 'rhsgref_ins_uaz_dshkm';
	_u pushBack 'rhsgref_ins_uaz_ags';
	_u pushBack 'rhs_btr70_msv';


	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		_u pushBack 'IP_O_Soldier_FST';
		_u pushBack 'IP_O_crew_FST';
		_u pushBack 'sfp_bv206_winter';
		_u pushBack 'AAF_D_MRAP_03_F';
		_u pushBack 'AAF_D_MRAP_03_hmg_F';
	};
};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LARGE_FOB], _u];
_u = [];

//--- Below is classnames for Units and AI avaiable to puchase from Naval Towns.

//Universal Vanilla
_u pushBack 'C_Boat_Civil_01_F';
_u pushBack 'O_Boat_Transport_01_F';
_u pushBack 'O_Boat_Armed_01_hmg_F';
_u pushBack 'B_Boat_Armed_01_minigun_F';
_u pushBack 'C_Boat_Civil_01_rescue_F';
_u pushBack 'O_SDV_01_F';

if (CTI_FACTION_EAST == 0) then {
	//CSAT Arid Vanilla
	
};
if (CTI_FACTION_EAST == 1) then {
	//CSAT Tropic Vanilla
	
};
if (CTI_FACTION_EAST == 2) then {
	//CSAT Winter Vanilla
	
};
//--- APEX UNITS
if (CTI_APEX_ADDON > 0) then { 
	//Universal APEX
	_u pushBack "C_Scooter_Transport_01_F";
	_u pushBack "I_C_Boat_Transport_02_F";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid APEX
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic APEX
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter APEX
		
	};
};
//--- CUP UNITS
if (CTI_CUP_ADDON > 0) then { 
	//Universal CUP
	_u pushBack "CUP_B_RHIB_USMC";
	_u pushBack "CUP_B_RHIB2Turret_USMC";
	_u pushBack "CUP_B_Zodiac_USMC";

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid CUP
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic CUP
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter CUP
		
	};
};
//--- OFPS UNITS
if (CTI_OFPS_ADDON > 0) then { 
	//Universal OFPS
	/*_u pushBack "sfp_svavare2000";
	_u pushBack "sfp_svavare2000_transport";
	_u pushBack "sfp_gruppbat";*/

	if (CTI_FACTION_EAST == 0) then {
		//CSAT Arid OFPS
		
	};
	if (CTI_FACTION_EAST == 1) then {
		//CSAT Tropic OFPS
		
	};
	if (CTI_FACTION_EAST == 2) then {
		//CSAT Winter OFPS
		
	};
};
//--- RHS UNITS
if (CTI_RHS_ADDON > 0) then { 
//Universal RHS

};

missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT_NAVAL], _u];