/*
  # HEADER #
	Script: 		Server\Functions\Server_SpawnTownOccupation.sqf
	Alias:			CTI_SE_FNC_SpawnTownOccupation
	Description:	This script will spawn the town occupation whenever a threat is 
					detected near a town.
					Note that this function can be replaced by another one. 
					Keep in mind to keep an identical return format.
	Author: 		Benny
	Creation Date:	23-09-2013
	Revision Date:	10-10-2013
	
  # PARAMETERS #
    0	[Object]: The town
    1	[Side]: The side which hold the town
	
  # RETURNED VALUE #
	0   [Array]: The created groups
	1   [Array]: The created vehicles
	
  # SYNTAX #
	[TOWN, SIDE] call CTI_SE_FNC_SpawnTownOccupation
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_ArrayShuffle
	Common Function: CTI_CO_FNC_CreateUnit
	Common Function: CTI_CO_FNC_CreateVehicle
	Common Function: CTI_CO_FNC_GetRandomBestPlaces
	Common Function: CTI_CO_FNC_GetRandomPosition
	Common Function: CTI_CO_FNC_GetSideID
	Common Function: CTI_CO_FNC_GetSideUpgrades
	Common Function: CTI_CO_FNC_GetTownCamps
	Common Function: CTI_CO_FNC_ManVehicle
	Server Function: CTI_SE_FNC_HandleEmptyVehicle
	
  # EXAMPLE #
    [Town0, West] call CTI_SE_FNC_SpawnTownOccupation
	  -> Will spawn West defense forces for Town0
*/

private ["_groups", "_pool", "_pool_units", "_positions", "_side", "_sideID", "_teams", "_totalGroups", "_town", "_upgrade", "_value", "_vehicles"];

_town = _this select 0;
_side = _this select 1;
_sideID = (_side) call CTI_CO_FNC_GetSideID;
_upgrade = (_side call CTI_CO_FNC_GetSideUpgrades) select CTI_UPGRADE_TOWNS;

_value = _town getVariable "cti_town_sv"; //--- Occupation spawning is based on the current SV

//--- Calculate the Group size by scaling the SV and randomizing the input, min max scaling
_max_squad = CTI_TOWNS_OCCUPATION_LEVEL;
_max_squad_random = 4;
_max_sv = CTI_TOWNS_SPAWN_SV_MAX;

/*//--- If the dynamic mode is enabled, the server FPS are then used to determine the amount of spawning groups
if (CTI_TOWNS_OCCUPATION_LEVEL_DYNAMIC > 0) then {
	_fps = diag_fps;
	
	//--- Only proc if the overall FPS are below 30
	if (_fps <= 30) then {
		_coef = switch (true) do {
			case (_fps > 25): {.85};
			case (_fps > 20): {.70};
			case (_fps > 15): {.50};
			case (_fps > 10): {.25};
			case (_fps > 5): {.20};
			default {.20};
		};
		
		_max_squad = ceil(_max_squad * _coef);
		_max_squad_random = ceil(_max_squad_random * _coef);
	};
};
*/
_randomGroups = (_value / _max_sv) * _max_squad_random;
_fixedGroups = (_value / _max_sv) * _max_squad;
_totalGroups = round(_fixedGroups + random _randomGroups - random _randomGroups);
// _totalGroups = round(((_value / _max_sv) * _max_squad) + random(_randomGroups) - random(_randomGroups));
if (_totalGroups < 1) then {_totalGroups = 1};

if (CTI_Log_Level >= CTI_Log_Information) then {
	["INFORMATION", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format["Begining Occupation Teams composition for town [%1] on side [%2] with a current SV of [%3] using variables <Max Squad = [%4]>,<Max Squad Randomness = [%5]>,<Max SV = [%6]> Resulting in Fixed Group Size [%7] and a Random Group Size of [%8] for a Total Rounded Group Size of [%9]", _town getVariable "cti_town_name", _side, _value, _max_squad, _max_squad_random, _max_sv, _fixedGroups, _randomGroups, _totalGroups]] call CTI_CO_FNC_Log;
};

_pool_units = [];
_tries = 400;

//--- Pool data: [<GROUP>, <PRESENCE>, {<SPAWN PROBABILITY>}], nesting is possible to narrow down some choices
if (isNil {_town getVariable "cti_naval"}) then {
	if (CTI_ZOMBIE_MODE == 0 && isNil {_town getVariable "cti_zombie"}) then {
		if (CTI_GUERILLA_MODE == 0 && isNil {_town getVariable "cti_infantry"}) then {
			switch (true) do {
				case (_value < 70) : { 
					_pool_units = [
						["TOWNS_SQUAD_RIFLEMEN1", 1, 99],
						["TOWNS_SQUAD_AT1", 1, 99],	
						["TOWNS_SQUAD_AA", 1, 65],
						[
							["TOWNS_SQUAD_LIGHT1_MIXED", 2, 75],
							["TOWNS_SQUAD_LIGHT2_MIXED", 2, 25]
						]
					];
				};
				case (_value >= 70 && _value < 80) : { 
					_pool_units = [
						["TOWNS_SQUAD_RIFLEMEN1", 1, 99],
						["TOWNS_SQUAD_AT1", 1, 99],	
						["TOWNS_SQUAD_AA", 1, 65],
						[
							["TOWNS_SQUAD_LIGHT1_MIXED", 2, 75],
							["TOWNS_SQUAD_LIGHT2_MIXED", 2, 25]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 80]
						]
					];
				};
				case (_value >= 80 && _value < 90) : { 
					_pool_units = [
						["TOWNS_SQUAD_RIFLEMEN1", 1, 75],
						["TOWNS_SQUAD_SNIPER", 1, 75],
						["TOWNS_SQUAD_AT1", 1, 75],	
						["TOWNS_SQUAD_AA", 2, 65],
						[
							["TOWNS_SQUAD_LIGHT2_MIXED", 2, 25],
							["TOWNS_SQUAD_LIGHT3_MIXED", 3, 75],
							["TOWNS_SQUAD_LIGHT4_MIXED", 1, 25]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 3, 80],
							["TOWNS_SQUAD_APC2_MIXED", 1, 20]
						],
						[
							["TOWNS_SQUAD_VEHICLE_AA1", 1, 30]
						]
					];
				};
				case (_value >= 90 && _value < 100) : { 
					_pool_units = [
						[
							["TOWNS_SQUAD_RIFLEMEN3", 1, 50], 
							["TOWNS_SQUAD_SNIPER", 1, 20], 
							["TOWNS_SQUAD_AT2", 2, 75],
							["TOWNS_SQUAD_AA", 2, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT3_MIXED", 1, 20],
							["TOWNS_SQUAD_LIGHT4_MIXED", 3, 50],
							["TOWNS_SQUAD_LIGHT5_MIXED", 2, 30]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 40],
							["TOWNS_SQUAD_APC2_MIXED", 3, 70]
						],
						[
							["TOWNS_SQUAD_VEHICLE_AA1", 1, 30]
						]
					];
				};
				case (_value >= 100 && _value < 110) : { 
					_pool_units = [
						[
							["TOWNS_SQUAD_RIFLEMEN3", 2, 50],
							["TOWNS_SQUAD_SNIPER", 1, 10], 
							["TOWNS_SQUAD_AT2", 2, 75], 
							["TOWNS_SQUAD_AA", 2, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT4_MIXED", 1, 20],
							["TOWNS_SQUAD_LIGHT5_MIXED", 1, 50],
							["TOWNS_SQUAD_LIGHT6_MIXED", 1, 30]
						],
						[
							["TOWNS_SQUAD_APC2_MIXED", 2, 70],
							["TOWNS_SQUAD_APC3_MIXED", 3, 70]
						],
						[
							["TOWNS_SQUAD_ARMORED1_MIXED", 1, 40]
						],
						[
							["TOWNS_SQUAD_LIGHT4", 1, 10],
							["TOWNS_SQUAD_LIGHT5", 2, 40],
							["TOWNS_SQUAD_LIGHT6", 1, 20]
						],
						[
							["TOWNS_SQUAD_APC2", 2, 50],
							["TOWNS_SQUAD_APC3", 2, 50]
						],
						[
							["TOWNS_SQUAD_ARMORED1", 1, 20]
						],
						[
							["TOWNS_SQUAD_VEHICLE_AA1", 2, 50],
							["TOWNS_SQUAD_VEHICLE_AA2", 1, 20]
						]
					];
				};
				case (_value >= 110 && _value < 120) : { 
					_pool_units = [
						[
							["TOWNS_SQUAD_RIFLEMEN3", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT2", 3, 75], 
							["TOWNS_SQUAD_AA", 3, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT5_MIXED", 1, 50],
							["TOWNS_SQUAD_LIGHT6_MIXED", 2, 50],
							["TOWNS_SQUAD_LIGHT7_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC2_MIXED", 2, 30],
							["TOWNS_SQUAD_APC3_MIXED", 4, 80]
						],
						[
							["TOWNS_SQUAD_ARMORED2_MIXED", 1, 60],
							["TOWNS_SQUAD_ARMORED3_MIXED", 1, 40]
						],
						[
							["TOWNS_SQUAD_LIGHT5", 2, 50],
							["TOWNS_SQUAD_LIGHT6", 1, 30],
							["TOWNS_SQUAD_LIGHT7", 1, 30]
						],
						[
							["TOWNS_SQUAD_APC2", 2, 30],
							["TOWNS_SQUAD_APC3", 3, 70]
						],
						[
							["TOWNS_SQUAD_ARMORED2", 1, 10],
							["TOWNS_SQUAD_ARMORED3", 1, 20]
						],
						[
							["TOWNS_SQUAD_VEHICLE_AA2", 1, 20],
							["TOWNS_SQUAD_VEHICLE_AA3", 2, 60]
						]
					];
				};
				case (_value >= 120) : { 
					_pool_units = [
						[
							["TOWNS_SQUAD_RIFLEMEN3", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT2", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT6_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT7_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC2_MIXED", 2, 30],
							["TOWNS_SQUAD_APC3_MIXED", 4, 70]
						],
						[
							["TOWNS_SQUAD_ARMORED2_MIXED", 1, 20],
							["TOWNS_SQUAD_ARMORED3_MIXED", 1, 50]
						],
						[
							["TOWNS_SQUAD_LIGHT6", 1, 30],
							["TOWNS_SQUAD_LIGHT7", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC2", 2, 30],
							["TOWNS_SQUAD_APC3", 3, 70]
						],
						[
							["TOWNS_SQUAD_ARMORED2", 1, 20],
							["TOWNS_SQUAD_ARMORED3", 1, 50]
						],
						[
							["TOWNS_SQUAD_VEHICLE_AA2", 1, 20],
							["TOWNS_SQUAD_VEHICLE_AA3", 2, 60]
						]
					];
				};
			};
		} else {
			switch (true) do {
					case (_value < 80) : { 
						_pool_units = [
						["TOWNS_SQUAD_RIFLEMEN1", 1, 99],
						["TOWNS_SQUAD_AT1", 1, 99],			
						[
							["TOWNS_SQUAD_LIGHT1_MIXED", 2, 75],
							["TOWNS_SQUAD_LIGHT2_MIXED", 2, 25]
						]
						];
					};
					case (_value >= 80 && _value < 90) : {  
						_pool_units = [
						[	
							["TOWNS_SQUAD_RIFLEMEN1", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT1", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT1_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT2_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 30]
						],
						[
							["TOWNS_SQUAD_LIGHT1", 1, 30],
							["TOWNS_SQUAD_LIGHT2", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC1", 2, 30]
						]
						];
					};
					case (_value >= 90 && _value < 100) : {
						_pool_units = [
						[	
							["TOWNS_SQUAD_RIFLEMEN2", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT1", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT2_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT3_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 30],
							["TOWNS_SQUAD_APC2_MIXED", 4, 70]
						],
						[
							["TOWNS_SQUAD_LIGHT2", 1, 30],
							["TOWNS_SQUAD_LIGHT3", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC1", 2, 30],
							["TOWNS_SQUAD_APC2", 3, 70]
						]
						];
					};
					case (_value >= 100 && _value < 110) : { 
						_pool_units = [
						[	
							["TOWNS_SQUAD_RIFLEMEN2", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT1", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT3_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT4_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 30],
							["TOWNS_SQUAD_APC2_MIXED", 4, 70]
						],
						[
							["TOWNS_SQUAD_LIGHT3", 1, 30],
							["TOWNS_SQUAD_LIGHT4", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC1", 2, 30],
							["TOWNS_SQUAD_APC2", 3, 70]
						]
						];
					};
					case (_value >= 110 && _value < 120) : { 
						_pool_units = [
						[	
							["TOWNS_SQUAD_RIFLEMEN2", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT1", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT3_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT4_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 30],
							["TOWNS_SQUAD_APC2_MIXED", 4, 70]
						],
						[
							["TOWNS_SQUAD_LIGHT3", 1, 30],
							["TOWNS_SQUAD_LIGHT4", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC1", 2, 30],
							["TOWNS_SQUAD_APC2", 3, 70]
						]
						];
					};
					case (_value >= 120) : { 
						_pool_units = [
						[	
							["TOWNS_SQUAD_RIFLEMEN2", 1, 50],
							["TOWNS_SQUAD_SNIPER", 1, 50], 
							["TOWNS_SQUAD_AT1", 4, 75], 
							["TOWNS_SQUAD_AA", 4, 65]
						],
						[
							["TOWNS_SQUAD_LIGHT3_MIXED", 1, 30],
							["TOWNS_SQUAD_LIGHT4_MIXED", 2, 50]
						],
						[
							["TOWNS_SQUAD_APC1_MIXED", 2, 30],
							["TOWNS_SQUAD_APC2_MIXED", 4, 70]
						],
						[
							["TOWNS_SQUAD_LIGHT3", 1, 30],
							["TOWNS_SQUAD_LIGHT4", 1, 50]
						],
						[
							["TOWNS_SQUAD_APC1", 2, 30],
							["TOWNS_SQUAD_APC2", 3, 70]
						]
						];
					};
				};
		};
	} else {
		switch (true) do {
			case (_value < 70) : { 
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE1", 8, 99]
				];
			};
			case (_value >= 70 && _value < 80) : {  
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE1", 8, 99]
				];
			};
			case (_value >= 80 && _value < 90) : {
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE2", 8, 99]
				];
			};
			case (_value >= 90 && _value < 100) : { 
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE3", 8, 99]
				];
			};
			case (_value >= 100 && _value < 110) : { 
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE3", 8, 99]
				];
			};
			case (_value >= 110 && _value < 120) : {
				_pool_units = [ 
					["TOWNS_SQUAD_ZOMBIE3", 8, 99]
				];
			};
			case (_value >= 120) : { 
				_pool_units = [
					["TOWNS_SQUAD_ZOMBIE3", 8, 99]
				];
			};
		};
	};
} else {
	switch (true) do {
		case (_value < 70) : { 
			_pool_units = [
				["TOWNS_SQUAD_NAVAL1", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 4, 99]
			];
		};
		case (_value >= 70 && _value < 80) : { 
			_pool_units = [
				["TOWNS_SQUAD_NAVAL1", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 4, 99]
			];
		};
		case (_value >= 80 && _value < 90) : { 
			_pool_units = [
				["TOWNS_SQUAD_NAVAL2", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 2, 40],
				["TOWNS_SQUAD_ASSAULT_BOAT2", 2, 60]
			];
		};
		case (_value >= 90 && _value < 100) : { 
			_pool_units = [
				["TOWNS_SQUAD_NAVAL2", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 2, 30],
				["TOWNS_SQUAD_ASSAULT_BOAT2", 2, 70]
			];
		};
		case (_value >= 100 && _value < 110) : { 
			_pool_units = [
				["TOWNS_SQUAD_NAVAL3", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 3, 30],
				["TOWNS_SQUAD_ASSAULT_BOAT2", 3, 70],
				["TOWNS_SQUAD_MEDIUM_ASSAULT_BOAT", 1, 50]
			];
		}; 
		case (_value >= 110 && _value < 120) : {
			_pool_units = [ 
				["TOWNS_SQUAD_NAVAL3", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 3, 20],
				["TOWNS_SQUAD_ASSAULT_BOAT2", 4, 80],
				["TOWNS_SQUAD_MEDIUM_ASSAULT_BOAT", 2, 90]
			];
		};
		case (_value >= 120) : {  
			_pool_units = [
				["TOWNS_SQUAD_NAVAL3", 1, 99],
				["TOWNS_SQUAD_ASSAULT_BOAT1", 3, 10],
				["TOWNS_SQUAD_ASSAULT_BOAT2", 4, 90],
				["TOWNS_SQUAD_MEDIUM_ASSAULT_BOAT", 2, 90],
				["TOWNS_SQUAD_LARGE_ASSAULT_BOAT", 1, 05]
			];
		};
	};
	
	_tries = 0;
	
	//--- Naval forces are divided by two
	_totalGroups = round(_totalGroups / 2);
	if (_totalGroups < 1) then {_totalGroups = 1};
};

//--- Flatten the pool
_pool = [];
{
	switch (typeName (_x select 0)) do {
		//--- Only one element is present, check for the force and probability and add it to our current pool
		case "STRING": {
			if (!isNil{missionNamespace getVariable format["%1_%2", _side, _x select 0]}) then {
				_force = if (count _x > 1) then {_x select 1} else {1};
				_probability = if (count _x > 2) then {_x select 2} else {100};
			
				for '_i' from 1 to _force do {_pool pushBack [format["%1_%2", _side, _x select 0], _probability]};
			} else {
				if (CTI_Log_Level >= CTI_Log_Error) then { 
					["ERROR", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format ["Attempting to use an undefined Occupation Team Template [%1] for town [%2] on side [%3]", format["%1_%2", _side, _x select 0], _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
				};
			};
		};
		//--- More than one element is present, flatten the content and append the array to the current pool
		case "ARRAY": {
			_pool_nest = [];
			{
				if (!isNil{missionNamespace getVariable format["%1_%2", _side, _x select 0]}) then {
					_force = if (count _x > 1) then {_x select 1} else {1};
					_probability = if (count _x > 2) then {_x select 2} else {100};
					
					for '_i' from 1 to _force do {_pool_nest pushBack [format["%1_%2", _side, _x select 0], _probability]};
				} else {
					if (CTI_Log_Level >= CTI_Log_Error) then { 
						["ERROR", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format ["Attempting to use an undefined Occupation Team Template [%1] for town [%2] on side [%3]", format["%1_%2", _side, _x select 0], _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
					};
				};
			} forEach _x;
			
			if (count _pool_nest > 0) then {_pool pushBack _pool_nest};
		};
	};
} forEach _pool_units;

if (CTI_Log_Level >= CTI_Log_Information) then { 
	["INFORMATION", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format ["Retrieved an Occupation Pool count of [%1] for town [%2] on side [%3]. Total group is set to [%4]", count _pool, _town getVariable "cti_town_name", _side, _totalGroups]] call CTI_CO_FNC_Log;
};

if (count _pool < 1) exitWith {[[],[],[]]};

//--- Shuffle!
_pool = _pool call CTI_CO_FNC_ArrayShuffle;

//--- Compose the pool
_teams = [];
while {_totalGroups > 0} do {
	{
		_team = _x;
		
		//--- If nested, pick a random element
		if (typeName(_team select 0) == "ARRAY") then {
			_team = _team select floor(random count _team);
		};
		
		//--- Probability check
		_probability = _team select 1;
		
		_can_use = true;
		if (_probability != 100) then {
			if (random 100 > _probability) then { _can_use = false };
		};
		
		//--- Our team can be retrieved!
		if (_can_use) then {
			_teams pushBack (missionNamespace getVariable (_team select 0));
			_totalGroups = _totalGroups - 1;
		};
		
		if (_totalGroups < 1) exitWith {};
	} forEach _pool;
};

//--- Create the groups server-sided
_groups = [];
_positions = [];
_camps = (_town) Call CTI_CO_FNC_GetTownCamps;
{
	_position = [];
	
	//--- A group may spawn close to a camp or somewhere in the town
	if (isNil {_town getVariable "cti_naval"}) then {
		if (count _camps > 0 && random 100 > 30) then {
			_camp_index = floor(random count _camps);
			_position = [ASLToAGL getPosASL(_camps select _camp_index), 10, CTI_TOWNS_OCCUPATION_SPAWN_RANGE_CAMPS, _tries] call CTI_CO_FNC_GetRandomPosition;
			_position = [_position, 30, "meadow", 8, 5, 0.1, true] call CTI_CO_FNC_GetRandomBestPlaces;
			_camps deleteAt _camp_index;
		} else {
			_position = [ASLToAGL getPosASL _town, 25, CTI_TOWNS_OCCUPATION_SPAWN_RANGE, _tries] call CTI_CO_FNC_GetRandomPosition;
			_position = [_position, 80, "meadow", 8, 5, 0.1, true] call CTI_CO_FNC_GetRandomBestPlaces;
		};
	} else {
		_position = [[ASLToAGL getPosASL _town, 25, CTI_TOWNS_OCCUPATION_SPAWN_RANGE/1.5, 0] call CTI_CO_FNC_GetRandomPosition, 200, "sea", 8, 3, 1, true] call CTI_CO_FNC_GetRandomBestPlaces;
		/*_places_water = [];
		_places = selectBestPlaces [([ASLToAGL getPosASL _town, 25, CTI_TOWNS_OCCUPATION_SPAWN_RANGE, 0] call CTI_CO_FNC_GetRandomPosition), 200, "(1 * sea) * (1 - meadow) * (1 - hills) * (1 - houses) * (1 - forest) * (1 - trees)", 8, 3]; //--- 0 to 1. 1 is full sea.
		{if ((_x select 1) == 1) then {_places_water pushBack (_x select 0)}} forEach _places;
		if (count _places_water > 0) then { //--- Use safe water spot
			_position = _places_water select floor(random count _places_water);
		} else { //--- Failsafe
			_position = [ASLToAGL getPosASL _town, 25, CTI_TOWNS_OCCUPATION_SPAWN_RANGE, 0] call CTI_CO_FNC_GetRandomPosition;
		};*/
	};

	_positions pushBack _position;
	
	_group = createGroup _side;
	_group setGroupIdGlobal [format["(%1) %2", _town, _group]];
	_groups pushBack _group;
	
	//--- Set AI to Combat mode
	_group setBehaviour "AWARE";
	_group setCombatMode "RED";
	_group setSpeedMode "FULL";
	_group enableAttack true;

	if (CTI_Log_Level >= CTI_Log_Information) then {
		["INFORMATION", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format["Composing Occupation Team for town [%1] on side [%2] using group [%3] at position [%4] with units [%5]", _town getVariable "cti_town_name", _side, _group, _position, _x]] call CTI_CO_FNC_Log;
	};
} forEach _teams;

//--- Update the town with the groups
_town setVariable ["cti_town_occupation_groups", _groups, true];

if (CTI_Log_Level >= CTI_Log_Information) then {
	["INFORMATION", "FILE: Server\Functions\Server_SpawnTownOccupation.sqf", format["Composed [%1] Occupation Teams for town [%2] on side [%3] with the current SV [%4]", count _teams, _town getVariable "cti_town_name", _side, _value]] call CTI_CO_FNC_Log;
};

[_teams, _groups, _positions]