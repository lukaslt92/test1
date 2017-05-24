private ["_side"];

_side = _this;

missionNamespace setVariable [Format["CTI_%1_UPGRADES_ENABLED", _side], [
	true, //--- Gear
	true, //--- Barracks
	true, //--- Light
	true, //--- Heavy
	true, //--- Naval
	true, //--- Air
	(missionNamespace getVariable "CTI_VEHICLES_AIR_FFAR") == 1, //--- Air FFAR
	(missionNamespace getVariable "CTI_VEHICLES_AIR_DAR") == 1, //--- Air DAR
	(missionNamespace getVariable "CTI_VEHICLES_AIR_AT") == 1, //--- Air AT
	(missionNamespace getVariable "CTI_VEHICLES_AIR_AA") == 1, //--- Air AA
	(missionNamespace getVariable "CTI_VEHICLES_AIR_CM") == 1, //--- Air CM
	(missionNamespace getVariable "CTI_TOWNS_OCCUPATION") > 0, //--- Towns Depots
	true, //--- Halo
	true, //--- Air Radar
	true, //--- Art Radar
	true, //--- Respawn Range
	true, //--- LVOSS System
	true, //--- ERA System
	true, //--- Satellite
	true, //--- Nuke
	true, //--- Supply Rate
	true, //--- Base Health
	true  //--- Base Defense Upgrade	
]];
if (CTI_GUERILLA_MODE == 1 || CTI_ZOMBIE_MODE == 1) then {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_COSTS", _side], [
    [1000,1000,1000,1000], //--- Gear
	[500,1000,1500,2000], //--- Barracks
	[1000,2000,2000,3000,4000], //--- Light
	[2000], //--- Heavy
	[1500,2000], //--- Naval
	[2500,5000], //--- Air
	[1500], //--- Air FFAR
	[1500], //--- Air DAR
	[1500], //--- Air AT
	[1500], //--- Air AA
	[1500], //--- Air CM
	[2500, 5000, 7500], //--- Towns Depots
	[1000, 2000], //--- Halo
	[1000, 1000, 1000], //--- Air Radar
	[1000, 1000, 1000], //--- Art Radar
	[1000,2000,3000], //--- Respawn Range
	[1500,2000], //--- LVOSS System
	[1000,2000,3000,4000], //--- ERA System
	[1500,5000], //--- Satellite
	[40000], //--- Nuke
	[1000, 2000, 4000], //--- Supply Rate
	[4000, 5000, 6000, 7000], //--- Base Health
	[500, 1000, 1500, 2000] //--- Base Defense
]];
} else {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_COSTS", _side], [
    [1500,2000,2500,3000], //--- Gear
	[1000,2000,3000,4000], //--- Barracks
	[2000,2500,3500,5000,24000], //--- Light
	[3500,5000,6500,8000], //--- Heavy
	[1500,2000], //--- Naval
	[4000,6000,8000,10000,12000], //--- Air
	[1500], //--- Air FFAR
	[2500], //--- Air DAR
	[3500], //--- Air AT
	[2500], //--- Air AA
	[1500], //--- Air CM
	[1500, 3000, 4500], //--- Forward Logistics
	[1000, 2000], //--- Halo
	[1000, 1500, 2000], //--- Air Radar
	[1000, 1500, 2000], //--- Art Radar
	[1000,2000,3000], //--- Respawn Range
	[1500,2000], //--- LVOSS System
	[2000,4000,6000,8000], //--- ERA System
	[4000,20000], //--- Satellite
	[40000], //--- Nuke
	[4000, 8000, 12000], //--- Supply Rate
	[4000, 5000, 6000, 7000], //--- Base Health
	[500, 1000, 1500, 2000] //--- Base Defense
]];
};

if (CTI_GUERILLA_MODE == 1 || CTI_ZOMBIE_MODE == 1) then {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], [
	3, //--- Gear
	3, //--- Barracks
	5, //--- Light
	0, //--- Heavy
	2, //--- Naval
	2, //--- Air
	0, //--- Air FFAR
	0, //--- Air DAR
	0, //--- Air AT
	0, //--- Air AA
	1, //--- Air CM
	2, //--- Towns Depots
	0, //--- Halo
	1, //--- Air Radar
	1, //--- Art Radar
	3, //--- Respawn Range
	2, //--- LVOSS System
	2, //--- ERA System
	1, //--- Satellite
	1, //--- Nuke
	3, //--- Supply Rate
	2, //--- Base Health
	2 //--- Base Defense
]];
} else {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], [
	4, //--- Gear
	4, //--- Barracks
	5, //--- Light
	4, //--- Heavy
	2, //--- Naval
	5, //--- Air
	1, //--- Air FFAR
	1, //--- Air DAR
	1, //--- Air AT
	1, //--- Air AA
	1, //--- Air CM
	3, //--- Towns Depots
	2, //--- Halo
	3, //--- Air Radar
	3, //--- Art Radar
	3, //--- Respawn Range
	2, //--- LVOSS System
	4, //--- ERA System
	2, //--- Satellite
	1, //--- Nuke
	3, //--- Supply Rate
	4, //--- Base Health
	4 //--- Base Defense
]];
};

if (CTI_GUERILLA_MODE == 1 || CTI_ZOMBIE_MODE == 1) then {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LINKS", _side], [
	[[],[],[],[]], //--- Gear
	[[CTI_UPGRADE_GEAR, 1],[CTI_UPGRADE_GEAR, 2],[CTI_UPGRADE_GEAR, 3],[CTI_UPGRADE_GEAR, 4]], //--- Barracks
	[[],[],[],[],[CTI_UPGRADE_NUKE, 1]], //--- Light
	[[CTI_UPGRADE_LIGHT,1],[CTI_UPGRADE_LIGHT,2],[],[]], //--- Heavy
	[[],[]], //--- Naval
	[[],[],[],[],[]], //--- Air
	[[CTI_UPGRADE_AIR, 1]], //--- Air FFAR
	[[CTI_UPGRADE_AIR, 1]], //--- Air DAR
	[[CTI_UPGRADE_AIR, 1]], //--- Air AT
	[[CTI_UPGRADE_AIR, 1]], //--- Air AA
	[[CTI_UPGRADE_AIR, 1]], //--- Air CM
	[[CTI_UPGRADE_BARRACKS,1],[CTI_UPGRADE_LIGHT,2],[CTI_UPGRADE_LIGHT,3]], //--- Towns Depots
	[[CTI_UPGRADE_AIR, 1],[CTI_UPGRADE_AIR, 2]], //--- Halo
	[[],[],[]], //--- Air Radar
	[[],[],[]], //--- Art Radar
	[[],[],[]], //--- Respawn Range
	[[CTI_UPGRADE_LIGHT,1],[CTI_UPGRADE_LIGHT,2]], //--- LVOSS System
	[[CTI_UPGRADE_LVOSS, 1],[CTI_UPGRADE_LVOSS, 2],[],[]], //--- ERA System
	[[CTI_UPGRADE_AIR, 1], []], //--- Satellite
	[[CTI_UPGRADE_LIGHT,4]], //--- Nuke
	[[],[],[]], //--- Supply Rate
	[[],[],[],[]], //--- Base Health
	[[],[],[],[]] //--- Base Defense
]];
} else {
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LINKS", _side], [
	[[],[CTI_UPGRADE_BARRACKS,1],[CTI_UPGRADE_BARRACKS,2],[]], //--- Gear
	[[CTI_UPGRADE_GEAR, 1],[CTI_UPGRADE_GEAR, 2],[CTI_UPGRADE_GEAR, 3],[CTI_UPGRADE_GEAR, 4]], //--- Barracks
	[[CTI_UPGRADE_BARRACKS, 1],[CTI_UPGRADE_BARRACKS, 2],[],[],[CTI_UPGRADE_NUKE, 1]], //--- Light
	[[CTI_UPGRADE_LIGHT,2],[CTI_UPGRADE_LIGHT,3],[CTI_UPGRADE_LIGHT,4],[]], //--- Heavy
	[[CTI_UPGRADE_BARRACKS, 1],[CTI_UPGRADE_BARRACKS, 2]], //--- Naval
	[[CTI_UPGRADE_HEAVY,1],[CTI_UPGRADE_HEAVY,2],[],[],[]], //--- Air
	[[CTI_UPGRADE_AIR, 1]], //--- Air FFAR
	[[CTI_UPGRADE_AIR, 1]], //--- Air DAR
	[[CTI_UPGRADE_AIR, 1]], //--- Air AT
	[[CTI_UPGRADE_AIR, 1]], //--- Air AA
	[[CTI_UPGRADE_AIR, 1]], //--- Air CM
	[[CTI_UPGRADE_BARRACKS,2],[CTI_UPGRADE_LIGHT,1],[CTI_UPGRADE_LIGHT,2]], //--- Towns Depots
	[[],[CTI_UPGRADE_AIR, 1]], //--- Halo
	[[],[],[]], //--- Air Radar
	[[],[],[]], //--- Art Radar
	[[],[],[]], //--- Respawn Range
	[[CTI_UPGRADE_LIGHT,1],[CTI_UPGRADE_LIGHT,2]], //--- LVOSS System
	[[CTI_UPGRADE_LVOSS, 1],[CTI_UPGRADE_LVOSS, 2],[],[]], //--- ERA System
	[[CTI_UPGRADE_AIR, 1], [CTI_UPGRADE_AIR, 3]], //--- Satellite
	[[CTI_UPGRADE_LIGHT,4]], //--- Nuke
	[[],[],[]], //--- Supply Rate
	[[],[],[],[]], //--- Base Health
	[[],[],[],[]] //--- Base Defense
]];
};

if (CTI_DEV_MODE > 0) then { 
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_TIMES", _side], [
		[1, 1, 1, 1], //--- Gear
		[1, 1, 1, 1], //--- Barracks
		[1, 1, 1, 1, 1], //--- Light
		[1, 1, 1, 1], //--- Heavy
		[1, 1], //--- Naval
		[1, 1, 1, 1, 1], //--- Air
		[1], //--- Air FFAR
		[1], //--- Air DAR
		[1], //--- Air AT
		[1], //--- Air AA
		[1], //--- Air CM
		[1, 1, 1], //--- Towns Depots
		[1, 1], //--- Halo
		[1, 1, 1], //--- Air Radar
		[1, 1, 1], //--- Art Radar
		[1, 1, 1], //--- Respawn Range
		[1, 1], //--- LVOSS System
		[1, 1, 1, 1], //--- ERA System
		[1, 1], //--- Satellite
		[1], //--- Nuke
		[1,1,1], //--- Supply Rate
		[1,1,1,1], //--- Base Health
		[1,1,1,1] //--- Base Defense
	]];
}else {
	if (CTI_GUERILLA_MODE == 1 || CTI_ZOMBIE_MODE == 1) then {
		missionNamespace setVariable [Format["CTI_%1_UPGRADES_TIMES", _side], [
			[30,60,120,180], //--- Gear
			[60,120,180,240], //--- Barracks
			[60,120,180,240,300], //--- Light
			[120], //--- Heavy
			[60,120], //--- Naval
			[120,360], //--- Air
			[60], //--- Air FFAR
			[60], //--- Air DAR
			[60], //--- Air AT
			[60], //--- Air AA
			[60], //--- Air CM
			[60,120,180], //--- Towns Depots
			[60, 60], //--- Halo
			[60, 60, 60], //--- Air Radar
			[60, 60, 60], //--- Art Radar
			[60, 60, 60], //--- Respawn Range
			[60, 60], //--- LVOSS System
			[60, 60, 60, 60], //--- ERA System
			[60, 300], //--- Satellite
			[300], //--- Nuke
			[60,75,90], //--- Supply Rate
			[60,120,180,240], //--- Base Health
			[60,120,180,240] //--- Base Defense
		]];
	} else {
		missionNamespace setVariable [Format["CTI_%1_UPGRADES_TIMES", _side], [
			[30,60,120,180], //--- Gear
			[60,120,180,240], //--- Barracks
			[60,120,180,240,300], //--- Light
			[60,120,180,240], //--- Heavy
			[60,120], //--- Naval
			[60,120,180,240,300], //--- Air
			[60], //--- Air FFAR
			[60], //--- Air DAR
			[60], //--- Air AT
			[60], //--- Air AA
			[60], //--- Air CM
			[60,120,180], //--- Towns Depots
			[60, 60], //--- Halo
			[60, 60, 60], //--- Air Radar
			[60, 60, 60], //--- Art Radar
			[60, 60, 60], //--- Respawn Range
			[60, 60], //--- LVOSS System
			[60, 60, 60, 60], //--- ERA System
			[60, 300], //--- Satellite
			[300], //--- Nuke
			[60,75,90], //--- Supply Rate
			[60,120,180,240], //--- Base Health
			[60,120,180,240] //--- Base Defense
		]];
	};
};

//todo, on commander missing link checkup, skip disabled upgrades.
missionNamespace setVariable [Format["CTI_%1_UPGRADES_AI_ORDER", _side], [
	[CTI_UPGRADE_GEAR, 1],
	[CTI_UPGRADE_BARRACKS, 1],
	[CTI_UPGRADE_LIGHT, 1],
	[CTI_UPGRADE_GEAR, 2],
	[CTI_UPGRADE_TOWNS, 1],
	[CTI_UPGRADE_HEAVY, 1],
	[CTI_UPGRADE_NAVAL, 1],
	[CTI_UPGRADE_AIR, 1],
	[CTI_UPGRADE_SUPPLY_RATE, 1],
	[CTI_UPGRADE_GEAR, 3],
	[CTI_UPGRADE_TOWNS, 2],
	[CTI_UPGRADE_AIR_FFAR, 1],
	[CTI_UPGRADE_AIR_DAR, 1],
	[CTI_UPGRADE_AIR_AT, 1],
	[CTI_UPGRADE_AIR_AA, 1],
	[CTI_UPGRADE_AIR_CM, 1],
	[CTI_UPGRADE_SUPPLY_RATE, 2],
	[CTI_UPGRADE_TOWNS, 3],
	[CTI_UPGRADE_HALO, 1],
	[CTI_UPGRADE_AIRR, 1],
	[CTI_UPGRADE_ARTR, 1],
	[CTI_UPGRADE_REST, 1],
	[CTI_UPGRADE_LVOSS, 1],
	[CTI_UPGRADE_ERA, 1],
	[CTI_UPGRADE_SATELLITE, 1],
	[CTI_UPGRADE_NUKE, 1]
]];

if (CTI_IsClient) then {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LABELS", _side], [
		["Gear", "<t>Unlock better gear"], //--- Gear
		["Barracks", "<t>Unlock better infantry units, unlock more default player AI and improve AI skill<br /><t color='#ffff00'>LVL 0</t> - Base AI limit 3, AI Skill 40%<br /><t color='#ffff00'>LVL 1</t> - Base AI limit 4, AI Skill 55%<br /><t color='#ffff00'>LVL 2</t> - Base AI limit 5, AI Skill 70%<br /><t color='#ffff00'>LVL 3</t> - Base AI limit 6, AI Skill 85%<br /><t color='#ffff00'>LVL 4</t> - Base AI limit 7, AI Skill 100%</t>"], //--- Barracks
		["Light Factory", "<t>Unlock better motorized units</t>"], //--- Light
		["Heavy Factory", "<t>Unlock better armored units</t>"], //--- Heavy
		["Naval Factory", "<t>Unlock better naval units</t>"], //--- Naval
		["Aircraft Factory", "<t>Unlock better aircraft units</t>"], //--- Air
		["Aircraft FFAR", "<t>Unlocks the FFAR Rockets for Aircrafts</t>"], //--- Air FFAR
		["Aircraft DAR", "<t>Unlocks the DAR Rockets for Aircrafts</t>"], //--- Air DAR
		["Aircraft AT", "<t>Unlocks the Anti Tank Missiles for Aircrafts</t>"], //--- Air AT
		["Aircraft AA", "<t>Unlocks the Anti Air Missiles for Aircrafts</t>"], //--- Air AA
		["Aircraft Countermeasures", "<t>Allows Aircraft to deploy countermeasures</t>"], //--- Air CM
		["Forward Logistics", "<t>Improves Gear and Vehicles available at Depots and Large FOBs<br /><t color='#ffff00'>LVL 1</t> - Additional Vehicles<br /><t color='#ffff00'>LVL 2</t> - Additional Vehicles<br /><t color='#ffff00'>LVL 3</t> - Additional Vehicles and Adds Service To Depots</t>"], //--- Towns Depot
		["Halo", "<t>Enable HALO Jumping from the Air factory and Depots<br /><t color='#ffff00'>LVL 1</t> - Halo to Towns and Bases<br /><t color='#ffff00'>LVL 2</t> - Halo to FOBs</t>"], //--- Halo
		["Air Radar", "<t>Increase Range of Air Radar<br /><t color='#ffff00'>LVL 1</t> - 4000m<br /><t color='#ffff00'>LVL 2</t> - 6000m<br /><t color='#ffff00'>LVL 3</t> - 12000m<br /><t color='#ffff00'>LVL 4</t> - 18000m</t>"], //--- Air Radar
		["Artillery Radar", "<t>Increase Range of Artillery Radar<br /><t color='#ffff00'>LVL 1</t> - 4000m<br /><t color='#ffff00'>LVL 2</t> - 6000m<br /><t color='#ffff00'>LVL 3</t> - 12000m<br /><t color='#ffff00'>LVL 4</t> - 18000m</t>"], //--- Art Radar
		["Respawn Range", "<t>Increase the max range of the respawn trucks, town camps and FOBS.<br /><t color='#ffff00'>LVL 1</t> - 500m<br /><t color='#ffff00'>LVL 2</t> - 1000m<br /><t color='#ffff00'>LVL 3</t> - 1500m</t>"], //--- Respawn Range
		["LVOSS System", "<t>Enables Light Vehicle Obscuration Smoke System (LVOSS), Full 360 degree coverage.<br /><t color='#ffff00'>LVL 1</t> - Ammo 1 per side, Cooldown 120s<br /><t color='#ffff00'>LVL 2</t> - Ammo 2 per side, Cooldown 90s </t>"], //--- LVOSS System
		["ERA System", "<t>Enable Explosive Reactive Armor system (ERA) or Arena System for Heavy Vehicles, Tanks still vulnerable from the rear.<br /><t color='#ffff00'>LVL 1</t> - ERA Mode Ammo 1 per side, Cooldown 150s<br /><t color='#ffff00'>LVL 2</t> - ERA Mode Ammo 2 per side, Cooldown 120s<br /><t color='#ffff00'>LVL 3</t> - ARENA Mode Ammo 3 per side, Cooldown 90s<br /><t color='#ffff00'>LVL 4</t> - ARENA Mode Ammo 4 per side, Cooldown 60s</t>"], //--- ERA System
		["Satellite Uplink", "<t>Allows the use of the satellite camera and access to advanced intel reports. <br /><t color='#ffff00'>LVL 0</t> - Satellite Uplink building enables enemy detection near base.<br /><t color='#ffff00'>LVL 1</t> - Unlocks Base Satellite Cam and town intel.<br /><t color='#ffff00'>LVL 2</t> - Unlocks Full Satellite Cam </t>"], //--- Satellite
		["Nuclear Arms Deal", "<t>Unlock Nuke Truck in Light Factory<br /><t color='#ffff00'>Unlocks Light 5 Upgrade which unlocks the Nuke Truck.</t></t>"], //--- Nuke
		["Supply Rate", "<t>Improves rate at which Capped Town SV Raises<br /><t color='#ffff00'>LVL 1</t> - 2 SV per Interval<br /><t color='#ffff00'>LVL 2</t> - 3 SV per Interval<br /><t color='#ffff00'>LVL 3</t> - 4 SV per Interval</t>"], //--- Supply Rate
		["Base Health", "<t>Improves base structures health<br /><t color='#ffff00'>LVL 1</t> - 25% Boost </t><br /><t color='#ffff00'>LVL 2</t> - 50% Boost<br /><t color='#ffff00'>LVL 3</t> - 75% Boost <br /><t color='#ffff00'>LVL 4</t> - 100% Boost </t>"], //--- Base Health
		["Base Defences", "<t>Unlock better defences structures and weapons<br /><t color='#ffff00'>LVL 1</t> - Basic ZSU and more.<br /><t color='#ffff00'>LVL 2</t> - Unlocks AA/AT.<br /><t color='#ffff00'>LVL 3</t> - Unlocks C-RAM and more.<br /><t color='#ffff00'>LVL 4</t> - Unlocks SAM/PATRIOT and more.   </t>"] //--- Base defense
	]];
};

//--- Check potential missing definition.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Upgrades\Check_Upgrades.sqf";