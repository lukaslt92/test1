_side = _this;
if (CTI_FACTION_WEST == 0) then {
	//NATO Arid
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Vanilla
		case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Apex
		case 2: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_M1126_ICV_M2_Woodland_Slat"];};//CUP
		case 3: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsusf_M1117_W"];};//RHS
	}
};
if (CTI_FACTION_WEST == 1) then {
	//NATO Tropic
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Vanilla
		case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Apex
		case 2: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_M1126_ICV_M2_Woodland_Slat"];};//CUP
		case 3: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsusf_M1117_W"];};//RHS
	}
};
if (CTI_FACTION_WEST == 2) then {
	//NATO Winter
	switch (CTI_FACTION_DEFAULT_VEHICLES) do {
		case 0: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Vanilla
		case 1: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "B_APC_Wheeled_01_cannon_F"];};//Apex
		case 2: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "CUP_B_M1126_ICV_M2_Woodland_Slat"];};//CUP
		case 3: {missionNamespace setVariable [format["CTI_%1_HQ", _side], "rhsusf_M1117_W"];};//RHS
	}
};

missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 180, [-23,33]],
	[CTI_LIGHT, 180, [23,33]],
	[CTI_CONTROLCENTER, 0, [30,-40]],
	[CTI_HEAVY, 0, [-30,-40]],
	[CTI_AIR, 180, [-60,37]],
	[CTI_REPAIR, 180, [60,37]],
	[CTI_AMMO, 180, [80,37]]
]];

// checks: structure -> not in WIP and still alive & kicking & can build with area?
// checks: upgrades -> not running
// iterate thru the path till what's done

//--- Commander course of action ["Action", Parameter(s), Condition]
missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
	["build-structures", CTI_BARRACKS, {true}],
	["build-structures", CTI_LIGHT, {true}],
	["build-structures", CTI_CONTROLCENTER, {true}],
	["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
	["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
	["build-structures", CTI_HEAVY, {true}],
	["build-structures", CTI_REPAIR, {true}],
	["build-structures", CTI_AMMO, {true}],
	["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
	["build-structures", CTI_AIR, {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
	["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_CM, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_AT, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_FFAR, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_AA, 1], {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
	["upgrade", [CTI_UPGRADE_SATELLITE, 1], {true}]
]];

//--- Structures
_headers = [];
_classes = [];
_prices = [];
_times = [];
_placements = [];
_specials = [];
_conditions = [];

/*
	Specials:
		- DMG_Alternative: Need to be used in case of bisterious buildings usage 
				If a building is damaged, all the EH it had will bisteriously vanish... This "feature" will probably never get fixed so once again, we fix it ourself!
		- DMG_Reduce: Reduce the incoming damage on a building making it stronger if above 1.
		- DMG_Multiplier: Incrases the incoming damage on the building making it weaker if above 1.
*/

_headers pushBack 		[CTI_HQ_DEPLOY, "Headquarters (Deploy)", "HQ"];
_classes pushBack		["Land_Research_house_V1_F", "Land_Research_house_V1_ruins_F"];
_prices pushBack 		500;
_times pushBack			0;
_placements pushBack 	[180, 15, false];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 9]];
_conditions pushBack 	(compile format["!(%1 call CTI_CO_FNC_IsHQDeployed)", _side]);

_headers pushBack 		[CTI_CONTROLCENTER, "Control Center", "CC"];
_classes pushBack 		["Land_Research_HQ_F", "Land_Research_HQ_ruins_F", ["Land_Research_HQ_F"]];							  
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25, false];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4.3]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack		[CTI_BARRACKS, "Barracks", "Barracks"];
_classes pushBack		["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"];
_prices pushBack		2000;
_times pushBack			30;
_placements pushBack 	[180, 15];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 9]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack		[CTI_LIGHT, "Light Vehicle Factory", "Light"];
_classes pushBack		["Land_Medevac_HQ_V1_F", "Land_Medevac_HQ_V1_ruins_F"];
_prices pushBack 		4000;
_times pushBack 		80;
_placements pushBack 	[90, 25];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 25]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"];
_classes pushBack 		["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"];
_prices pushBack 		6000;
_times pushBack 		120;
_placements pushBack 	[90, 25];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 25]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_AIR, "Aircraft Factory", "Air"];
_classes pushBack 		["Land_Airport_Tower_F", "Land_Airport_Tower_ruins_F"];
_prices pushBack 		8000;
_times pushBack 		140;
_placements pushBack 	[180, 40];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 20000]]; 
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_AMMO, "Ammo Depot", "Ammo"];
_classes pushBack 		["Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V2_ruins_F"];
_prices pushBack 		2000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 25]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_REPAIR, "Repair Depot", "Repair"];
_classes pushBack 		["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V3_ruins_F"];
_prices pushBack 		4000;
_times pushBack 		90;
_placements pushBack 	[90, 25];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 25]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_NAVAL, "Naval Yard", "Naval"];
_classes pushBack 		["Land_Lighthouse_small_F", "Land_Lighthouse_small_ruins_F"];
_prices pushBack 		3000;
_times pushBack 		80;
_placements pushBack 	[180, 60];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

if (CTI_RHS_ADDON > 0) then { 
		_headers pushBack 		[CTI_RADAR, "Air Radar", "Air Radar"];
		_classes pushBack 		["rhs_p37", "Land_TTowerBig_1_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

		_headers pushBack 		[CTI_RADAR_ART, "Artillery Radar", "Artillery Radar"];
		_classes pushBack 		["rhs_prv13", "Land_TTowerBig_2_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);
} else {
	if (CTI_CUP_ADDON > 0) then { 
		_headers pushBack 		[CTI_RADAR, "Air Radar", "Air Radar"];
		_classes pushBack 		["GUE_WarfareBAntiAirRadar", "Land_TTowerBig_1_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

		_headers pushBack 		[CTI_RADAR_ART, "Artillery Radar", "Artillery Radar"];
		_classes pushBack 		["Gue_WarfareBArtilleryRadar", "Land_TTowerBig_2_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);
	} else {
		_headers pushBack 		[CTI_RADAR, "Air Radar", "Air Radar"];
		_classes pushBack 		["Land_TTowerBig_1_F", "Land_TTowerBig_1_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

		_headers pushBack 		[CTI_RADAR_ART, "Artillery Radar", "Artillery Radar"];
		_classes pushBack 		["Land_TTowerBig_2_F", "Land_TTowerBig_2_ruins_F"];
		_prices pushBack 		2500;
		_times pushBack 		60;
		_placements pushBack 	[180, 30, false];
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
		_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);
	};
};

_headers pushBack 		[CTI_SUPPLY_DEPOT, "Supply Depot", "Supply Depot"];
_classes pushBack 		["Land_dp_smallTank_F", "Land_dp_smallTank_ruins_F"];
_prices pushBack 		2500;
_times pushBack 		60;
_placements pushBack 	[180, 15];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_SATELLITE, "Satellite Uplink", "Satellite Uplink"];
_classes pushBack 		["Land_Radar_Small_F", "Land_Radar_Small_ruins_F"];
_prices pushBack 		4500;
_times pushBack 		60;
_placements pushBack 	[180, 15];
_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 4]];
_conditions pushBack 	(compile format["(%1) call CTI_CO_FNC_IsHQDeployed", _side]);

_headers pushBack 		[CTI_HQ_MOBILIZE, "Headquarters (Mobilize)", "HQ"];
_classes pushBack		[missionNamespace getVariable format["CTI_%1_HQ", _side], ""];
_prices pushBack 		500;
_times pushBack			10;
_placements pushBack 	[0, 15, false];
_specials pushBack 		[];
_conditions pushBack 	(compile format["%1 call CTI_CO_FNC_IsHQDeployed", _side]);

[_side, _headers, _classes, _prices, _times, _placements, _specials, _conditions] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Structures.sqf";

//--- Defenses
_headers = [];
_classes = [];
_prices = [];
_placements = [];
_categories = [];
_coinmenus = [];
_coinblacklist = [];
_upgrade = [];
_specials = [];

//Compositions - setup compositions in Common/Config/Compositions/
/*	_headers pushBack 		["Mil Wall x3", [["Composition","mil_wall_3",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		100;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[];

	_headers pushBack 		["Mil Wall x5", [["Composition","mil_wall_5",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		150;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[];

	_headers pushBack 		["Shed Walled", [["Composition","shed_walled",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		2500;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Fort", [["Composition","fort_box",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		1000;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Bunker MG", [["Composition","bunker_mg",true]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		150;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		["Bunker GL", [["Composition","bunker_gl",true]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		150;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		["Tower MG x2", [["Composition","tower_mg",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		3500;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[];

	_headers pushBack 		["Tower GL x2", [["Composition","tower_gl",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		4000;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Tower AT", [["Composition","tower_at",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		4000;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Tower Tall MG x2", [["Composition","tower_tall_mg",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		4000;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Tower Tall GL x2", [["Composition","tower_tall_gl",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		4500;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		["Cargo Tower AA x3", [["Composition","cargo_tower_aa",false]]];
	_classes pushBack 		"Sign_Arrow_Direction_Green_F";
	_prices pushBack 		8000;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];*/
	
	
//--- Compositions Manual Mode - must set statics manually in Server_BuildDefense.sqf line 123
/*	_headers pushBack 		["Bunker (MG)", [["Armed","MG"]]];
	_classes pushBack 		"Land_BagBunker_Small_F";
	_prices pushBack 		250;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];	
	
	_headers pushBack 		["Tower (MG)", [["Armed","MG"]]];
	_classes pushBack  		"Land_Cargo_Patrol_V3_F";
	_prices pushBack  		500;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];	
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];
	
	_headers pushBack  		["Cargo Tower (AA)", [["Armed","AA"]]];
	_classes pushBack  		"Land_Cargo_Tower_V1_No1_F";
	_prices pushBack  		6000;
	_placements pushBack 	[0, 30];
	_categories pushBack 	"Composition";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];	
*/	
//end custom objects
//******************************BASE DEFENSE 0******************************
	
	_headers pushBack 		"Bunker (Small)";
	_classes pushBack 		"Land_BagBunker_Small_F";
	_prices pushBack 		150;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
	//Tall Roof
	_headers pushBack  		"Shed (Roof)";
	_classes pushBack  		"Land_Shed_Big_F";
	_prices pushBack 		2000;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Sheds";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Multiplier", 3]];
	// Short roof with one wall side
	_headers pushBack 		"Shed (Land)";
	_classes pushBack 		"Land_Shed_Small_F";
	_prices pushBack 		2000;
	_placements pushBack 	[90, 15];
	_categories pushBack 	"Sheds";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Multiplier", 3]];
	
	_headers pushBack 		"Heli Pad";
	_classes pushBack 		"Land_HelipadSquare_F";
	_prices pushBack 		100;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Lamp";
	_classes pushBack 		"Land_LampHalogen_F";
	_prices pushBack 		5;
	_placements pushBack 	[90, 15];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Flag";
	_classes pushBack 		"Flag_NATO_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 15];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Warning Sign- Mines";
	_classes pushBack 		"Land_Sign_Mines_F";
	_prices pushBack 		1;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Campfire";
	_classes pushBack 		"FirePlace_burning_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Camp Chair";
	_classes pushBack 		"Land_CampingChair_V1_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Camp Table";
	_classes pushBack 		"Land_CampingTable_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Latrine";
	_classes pushBack 		"Land_ToiletBox_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Tent";
	_classes pushBack 		"Land_TentDome_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];

	_headers pushBack 		"Double Portable Light";
	_classes pushBack 		"Land_PortableLight_double_F";
	_prices pushBack 		50;
	_placements pushBack 	[90, 7];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Map";
	_classes pushBack 		"MapBoard_altis_F";
	_prices pushBack 		1;
	_placements pushBack 	[180, 10];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"Runway Light (Blue)";
	_classes pushBack 		"Land_runway_edgelight_blue_F";
	_prices pushBack 		1;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"WindSock";
	_classes pushBack 		"Windsock_01_F";
	_prices pushBack 		1;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Misc";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	//Pointless as you can jump over it
/*	_headers pushBack 		"Razor Wire";
	_classes pushBack 		"Land_Razorwire_F";
	_prices pushBack 		10;
	_placements pushBack 	[0, 5];
	_categories pushBack 	"Walls";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];*/
	
	_headers pushBack 		"MG Defense";
	_classes pushBack 		"B_HMG_01_High_F";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];

	_headers pushBack 		"GL Defense";
	_classes pushBack 		"B_GMG_01_high_F";
	_prices pushBack 		1500;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		0;	
	_specials pushBack 		[];
	
	if (CTI_CUP_ADDON > 0) then {

		_headers pushBack 		"M2 Machine Gun";
		_classes pushBack 		"CUP_B_M2StaticMG_USMC";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		0;	
		_specials pushBack 		[];

		_headers pushBack 		"M2 Mini";
		_classes pushBack 		"CUP_B_M2StaticMG_USMC";
		_prices pushBack 		2000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_upgrade pushBack		0;	
		_specials pushBack 		[];


	};
	
	if (CTI_CUP_CORE_ADDON > 0) then {

		_headers pushBack 		"Short Sandbag Wall";
		_classes pushBack 		"FenceWood";
		_prices pushBack 		25;
		_placements pushBack 	[0, 5];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		0;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

		_headers pushBack 		"Corner Sandbag Wall";
		_classes pushBack 		"Fence";
		_prices pushBack 		50;
		_placements pushBack 	[0, 5];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		0;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

		_headers pushBack 		"Large Round Sandbag Wall";
		_classes pushBack 		"Land_fort_bagfence_round";
		_prices pushBack 		125;
		_placements pushBack 	[0, 5];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		0;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

	};

	if (CTI_RHS_ADDON > 0) then {

		_headers pushBack 		"Mk.19 (M3)";
		_classes pushBack 		"RHS_MK19_TriPod_D";
		_prices pushBack 		2500;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		0;	
		_specials pushBack 		[];

		_headers pushBack 		"M2HB (M3)";
		_classes pushBack 		"RHS_M2StaticMG_MiniTriPod_D";
		_prices pushBack 		1000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		0;	
		_specials pushBack 		[];

	};


//******************************BASE DEFENSE 1******************************

	if (CTI_APEX_ADDON > 0) then {

		/* Can't be destroyed need to encourage cup to make a destructible model of apex assets
		_headers pushBack 		"Bunker (Small) Green";
		_classes pushBack 		"Land_BagBunker_01_small_green_F";
		_prices pushBack 		15;
		_placements pushBack 	[0, 7];
		_categories pushBack 	"Fortification";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
		*/

		_headers pushBack 		"IR/Termal Cover Small";
		_classes pushBack 		"Land_IRMaskingCover_02_F";
		_prices pushBack 		150;
		_placements pushBack 	[0, 7];
		_categories pushBack 	"Camo";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;		
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

		_headers pushBack 		"IR/Termal Cover Large";
		_classes pushBack 		"Land_IRMaskingCover_01_F";
		_prices pushBack 		150;
		_placements pushBack 	[0, 7];
		_categories pushBack 	"Camo";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;		
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
	};
	
/*	_headers pushBack 		["Fence",[["CanAutoAlign", 7.5, 0]]];
	_classes pushBack 		"Land_Mil_WiredFence_F";
	_prices pushBack 		25;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Fortification";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;		
	_specials pushBack 		[];

	_headers pushBack 		"Gate";
	_classes pushBack 		"Land_Mil_WiredFence_Gate_F";
	_prices pushBack 		5;
	_placements pushBack	[0, 15];
	_categories pushBack 	"Structures_Fences";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;		
	_specials pushBack 		[];*/

	_headers pushBack 		["High Wall (Mil)",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_Mil_WallBig_4m_F";
	_prices pushBack 		20;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;		
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];

/*	_headers pushBack 		["High Wall Gate (Mil)",[["CanAutoAlign", 3.8, 0]]];
	_classes pushBack 		"Land_Mil_WallBig_Gate_F";
	_prices pushBack 		40;
	_placements pushBack 	[0, 7];
	_categories pushBack 	"Walls";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;		
	_specials pushBack 		[];*/

	_headers pushBack 		"Camo net";
	_classes pushBack 		"CamoNet_BLUFOR_F";
	_prices pushBack 		50;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Camo";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

	_headers pushBack 		"Camo net open";
	_classes pushBack 		"CamoNet_BLUFOR_open_F";
	_prices pushBack 		50;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Camo";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

	_headers pushBack 		"Camo net vehicle";
	_classes pushBack 		"CamoNet_BLUFOR_big_F";
	_prices pushBack 		50;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Camo";
	_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
/* //Wont listen to coinblacklist
	_headers pushBack 		"Tower";
	_classes pushBack  		"Land_Cargo_Patrol_V1_F";
	_prices pushBack  		150;
	_placements pushBack 	[0, 15];
	_categories pushBack 	"Towers";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 30], ["Land_Dome_Big_F", 40], ["Land_Ss_hangar", 30], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 15]];	
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];
	//Big hangar
	_headers pushBack 		["Tent Hangar",[["RuinOnDestroyed", "Land_TentHangar_V1_ruins_F"], ["DMG_Reduce", 5]]];
	_classes pushBack 		"Land_TentHangar_V1_F";
	_prices pushBack 		4000;
	_placements pushBack 	[0, 20];
	_categories pushBack 	"Sheds";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 30], ["Land_Dome_Big_F", 40], ["Land_Ss_hangar", 30], ["Land_Ss_hangard", 30]];
	_upgrade pushBack		1;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];*/
	
	if (CTI_CUP_ADDON > 0) then {

		_headers pushBack 		"ZU-23";
		_classes pushBack 		"CUP_B_ZU23_CDF";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;	
		_specials pushBack 		[];

	};
	
	if (CTI_CUP_CORE_ADDON > 0) then {

		_headers pushBack 		["H-Barrier10x",[["CanAutoAlign", 3.8, 0]]];
		_classes pushBack 		"Base_WarfareBBarrier10x";
		_prices pushBack 		300;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

		_headers pushBack 		["H-Barrier5x",[["CanAutoAlign", 3.8, 0]]];
		_classes pushBack 		"Base_WarfareBBarrier5x";
		_prices pushBack 		250;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		1;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];
	};
	
	if (CTI_OFPS_ADDON > 0) then { 

	};

	if (CTI_RHS_ADDON > 0) then { 
		_headers pushBack 		"FIM-92F (DMS)";
		_classes pushBack 		"RHS_Stinger_AA_pod_D";
		_prices pushBack 		2900;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		1;	
		_specials pushBack 		[];
	};


//******************************BASE DEFENSE 2******************************
	/*_headers pushBack 		["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"], ["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
	_classes pushBack 		"Land_Medevac_house_V1_F";
	_prices pushBack 		15000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Fortification";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack ["*"];
	_upgrade pushBack		2;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1.5]];
	//Wont listen to Coin Blacklist
	_headers pushBack  		["Cargo Tower (big)",[["RuinOnDestroyed", "Land_Cargo_Tower_V1_ruins_F"], ["DMG_Reduce", 8]]];
	_classes pushBack  		"Land_Cargo_Tower_V1_F";
	_prices pushBack  		4000;
	_placements pushBack 	[0, 30];
	_categories pushBack 	"Towers";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 30], ["Land_Dome_Big_F", 40], ["Land_Ss_hangar", 30], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 15]];
	_upgrade pushBack		2;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];
*/	
	if (CTI_APEX_ADDON > 0) then {
		_headers pushBack 		"Cargo Tower (big) Jungle";
		_classes pushBack 		"Land_Cargo_Tower_V4_F";
		_prices pushBack 		4000;
		_placements pushBack 	[0, 30];
		_categories pushBack 	"Towers";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]]; //4-5 HE slammer rounds to go down

		/*Cant use due to apex object
		_headers pushBack 		"Air Tower";
		_classes pushBack 		"Land_Airport_01_controlTower_F";
		_prices pushBack 		1000;
		_placements pushBack 	[0, 30];
		_categories pushBack 	"Fortification";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];*/
	};
	
	if (CTI_OFPS_ADDON > 0) then {
		/*_headers pushBack 		"Mil Shed";
		_classes pushBack 		"Land_sfp_mil_shed";
		_prices pushBack 		4000;
		_placements pushBack 	[0, 20];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];

		_headers pushBack 		"Hangar Wood";
		_classes pushBack 		"Land_sfp_torebodahangar";
		_prices pushBack 		4000;
		_placements pushBack 	[0, 20];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];

		_headers pushBack 		"Hangar Wood Large";
		_classes pushBack 		"Land_sfp_torebodahangar_alt2";
		_prices pushBack 		5000;
		_placements pushBack 	[0, 20];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];*/

		_headers pushBack 		"AN/MPQ-53 - AA Radar";
		_classes pushBack 		"POOK_ANMPQ53_B";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];
	};
	
	_headers pushBack 		"AT Defense";
	_classes pushBack 		"B_static_AT_F";
	_prices pushBack 		3000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];

	_headers pushBack 		"AA Defense";
	_classes pushBack 		"B_static_AA_F";
	_prices pushBack 		2000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		2;	
	_specials pushBack 		[];
	
	if (CTI_CUP_ADDON > 0) then {

		_headers pushBack 		"TOW Tripod";
		_classes pushBack 		"CUP_B_TOW_TriPod_USMC";
		_prices pushBack 		8000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		2;	
		_specials pushBack 		[];

	};
	
	if (CTI_CUP_CORE_ADDON > 0) then {

		_headers pushBack 		["H-Barrier10xTall",[["CanAutoAlign", 3.8, 0]]];
		_classes pushBack 		"Base_WarfareBBarrier10xTall";
		_prices pushBack 		500;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		2;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

	};
	
	if (CTI_OFPS_ADDON > 0) then { 


	};

	if (CTI_RHS_ADDON > 0) then { 
		
		_headers pushBack 		"M41A4 TOW";
		_classes pushBack 		"RHS_TOW_TriPod_D";
		_prices pushBack 		4000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		2;	
		_specials pushBack 		[];

		//OPFOR ZU-23 to fill the gap
		_headers pushBack 		"Zu-23-2";
		_classes pushBack 		"RHS_ZU23_MSV";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		1;	
		_specials pushBack 		[];
		
	};

//******************************BASE DEFENSE 3******************************

	/*if (CTI_CUP_ADDON > 0) then { 
		_headers pushBack 		["LARGE FOB",[["RuinOnDestroyed", "Land_Cargo_House_V3_ruins_F"], ["LARGE_FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_large_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_large_fobs")}; (_cpt < CTI_BASE__LARGE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
		_classes pushBack 		"WarfareBDepot";
		_prices pushBack 		40000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Fortification";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Multiplier", 4]];
	} else {
		_headers pushBack 		["LARGE FOB",[["RuinOnDestroyed", "Land_Cargo_House_V3_ruins_F"], ["LARGE_FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_large_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_large_fobs")}; (_cpt < CTI_BASE__LARGE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0))}]]];
		_classes pushBack 		"Land_Cargo_House_V3_F";
		_prices pushBack 		40000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Fortification";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1.5]];
	};*/
	
	_headers pushBack 		"Mortar";
	_classes pushBack 		"B_Mortar_01_F";
	_prices pushBack 		5000;
	_placements pushBack 	[180, 5];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack [];
	_upgrade pushBack		3;	
	_specials pushBack 		[];
	
	if (CTI_CUP_ADDON > 0) then {

		_headers pushBack 		"D-30 AT";
		_classes pushBack 		"CUP_B_D30_AT_CDF";
		_prices pushBack 		6000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[];

		_headers pushBack 		"M252 81mm mortar";
		_classes pushBack 		"CUP_B_M252_USMC";
		_prices pushBack 		5000;
		_placements pushBack 	[180, 5];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ", "RepairTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[];

		/*
		_headers pushBack 		"RAM Launcher";
		_classes pushBack 		"CUP_WV_B_RAM_Launcher";
		_prices pushBack 		60000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[];
		*/
	};

	if (CTI_CUP_CORE_ADDON > 0) then {

		_headers pushBack 		"EarthenNest (Green)";
		_classes pushBack 		"Land_fort_artillery_nest";
		_prices pushBack 		350;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Misc";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];

		_headers pushBack 		"EarthenWall (Green)";
		_classes pushBack 		"Land_fort_rampart";
		_prices pushBack 		200;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];

		_headers pushBack 		"EarthenNest (Desert)";
		_classes pushBack 		"Land_fort_artillery_nest_EP1";
		_prices pushBack 		350;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Misc";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];

		_headers pushBack 		"EarthenWall (Desert)";
		_classes pushBack 		"Land_fort_rampart_EP1";
		_prices pushBack 		200;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Walls";
		_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];
	};
	
	if (CTI_OFPS_ADDON > 0) then { 

		_headers pushBack 		"C-RAM Phalanx (Engages incoming rounds)";
		_classes pushBack 		"B_at_phalanx_35AI";
		_prices pushBack 		40000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [];
		_upgrade pushBack		3;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

	};



if (CTI_RHS_ADDON > 0) then { 

	//OPFOR D-30 to fill the gap
	_headers pushBack 		"2A18M (D-30A) AT";
	_classes pushBack 		"rhs_d30_at_msv";
	_prices pushBack 		6000;
	_placements pushBack 	[180, 15];
	_categories pushBack 	"Defense";
	_coinmenus pushBack 	["HQ", "RepairTruck"];
	_coinblacklist pushBack ["*"];
	_upgrade pushBack		3;	
	_specials pushBack 		[];
	
};



//******************************BASE DEFENSE 4******************************

	_headers pushBack 		"Dome (Small)";
	_classes pushBack 		"Land_Dome_Small_F";
	_prices pushBack 		10000;
	_placements pushBack 	[0, 32];
	_categories pushBack 	"Sheds";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
	_upgrade pushBack		3;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Multiplier", 4]];

	_headers pushBack 		"Dome (Big)";
	_classes pushBack 		"Land_Dome_Big_F";
	_prices pushBack 		15000;
	_placements pushBack 	[0, 50];
	_categories pushBack 	"Sheds";
	_coinmenus pushBack 	["HQ"];
	_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
	_upgrade pushBack		4;	
	_specials pushBack 		[["DMG_Alternative"], ["DMG_Multiplier", 4]];
	
	if (CTI_CUP_CORE_ADDON > 0) then {

		_headers pushBack 		"Concrete Vehicle Bunker";
		_classes pushBack 		"Land_Ammostore2";
		_prices pushBack 		4000;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [];
		_upgrade pushBack		4;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 1]];

		_headers pushBack 		"Large Hangar (Green)";
		_classes pushBack 		"Land_Ss_hangar";
		_prices pushBack 		10000;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 22], ["Land_Dome_Big_F", 32], ["Land_Ss_hangar", 40], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		4;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];
		//wont listen to coinin blacklist
/*		_headers pushBack 		"Large Hangar (Desert)";
		_classes pushBack 		"Land_Ss_hangard";
		_prices pushBack 		10000;
		_placements pushBack 	[90, 7];
		_categories pushBack 	"Sheds";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack [["Land_Shed_Small_F", 12], ["Land_BagBunker_Small_F", 10], ["Land_Shed_Big_F", 15], ["Land_TentHangar_V1_F", 30], ["Land_sfp_mil_shed", 30], ["Land_sfp_torebodahangar", 30], ["Land_sfp_torebodahangar_alt2", 30], ["Land_Dome_Small_F", 35], ["Land_Dome_Big_F", 55], ["Land_Ss_hangar", 30], ["Land_Ss_hangard", 30], ["Land_Cargo_Patrol_V1_F", 10],  ["Land_Cargo_Tower_V1_F", 14], ["Land_Cargo_Tower_V4_F", 7],["Land_IRMaskingCover_02_F", 10], ["Land_IRMaskingCover_01_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_F", 10], ["CamoNet_BLUFOR_open_F", 10], ["CamoNet_BLUFOR_big_F", 10], ["Land_Ammostore2", 10]];
		_upgrade pushBack		4;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 3]];*/

		};
		
	if (CTI_OFPS_ADDON > 0) then {

		_headers pushBack 		"MIM-104 PAC-2 - AA Launcher";
		_classes pushBack 		"pook_MIM104_PAC2Battery_B";
		_prices pushBack 		60000;
		_placements pushBack 	[180, 15];
		_categories pushBack 	"Defense";
		_coinmenus pushBack 	["HQ"];
		_coinblacklist pushBack ["*"];
		_upgrade pushBack		4;	
		_specials pushBack 		[["DMG_Alternative"], ["DMG_Reduce", 2]];

	};	


//Disabled Assets Here
/*
_headers pushBack 		"Empty Crate";
_classes pushBack		"O_supplyCrate_F";
_prices pushBack 		5;
_placements pushBack 	[0, 2];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];
*/

/* Cannot be destroyed removed by apollo 12/31/2016
_headers pushBack 		"Short Sandbag";
_classes pushBack 		"Land_BagFence_Short_F";
_prices pushBack 		75;
_placements pushBack 	[0, 5];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"Long Sandbag";
_classes pushBack 		"Land_BagFence_Long_F";
_prices pushBack 		75;
_placements pushBack 	[0, 5];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"Round Sandbag";
_classes pushBack 		"Land_BagFence_Round_F";
_prices pushBack 		75;
_placements pushBack 	[0, 5];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck", "DefenseTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];
*/

/* Do not add in cannot be destroyed. Can we just Delete these then?-Apollo
_headers pushBack 		"H-Barrier (Small) (1 Block)";
_classes pushBack 		"Land_HBarrier_1_F";
_prices pushBack 		10;
_placements pushBack 	[90, 5];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		["H-Barrier (Small) (5 Block)",[["CanAutoAlign", 6, 0]]];
_classes pushBack 		"Land_HBarrier_5_F";
_prices pushBack 		50;
_placements pushBack 	[0, 5];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		["High Wall (Concrete)",[["CanAutoAlign", 4.6, 0]]];
_classes pushBack 		"Land_CncWall4_F";
_prices pushBack 		20;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"Concrete Ramp";
_classes pushBack 		"Land_RampConcreteHigh_F";
_prices pushBack 		20;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"H-Barrier (Medium)";
_classes pushBack 		"Land_HBarrier_5_F";
_prices pushBack 		20;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		["H-Barrier (Big)",[["CanAutoAlign", 6, 0]]];
_classes pushBack 		"Land_HBarrierBig_F";
_prices pushBack 		20;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"H-Barrier Wall (6)";
_classes pushBack 		"Land_HBarrierWall6_F";
_prices pushBack 		40;
_placements pushBack 	[180, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"H-Barrier Coridor";
_classes pushBack 		"Land_HBarrierWall_corridor_F";
_prices pushBack 		20;
_placements pushBack 	[90, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];

_headers pushBack 		"H-Barrier Tower";
_classes pushBack 		"Land_HBarrierTower_F";
_prices pushBack 		40;
_placements pushBack 	[0, 7];
_categories pushBack 	"Fortification";
_coinmenus pushBack 	["HQ", "RepairTruck"];
_coinblacklist pushBack [];
_upgrade pushBack		0;	
_specials pushBack 		[];
*/

[_side, _headers, _classes, _prices, _placements, _categories, _coinmenus, _coinblacklist, _upgrade, _specials] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";