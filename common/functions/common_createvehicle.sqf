/*
  # HEADER #
	Script: 		Common\Functions\Common_CreateVehicle.sqf
	Alias:			CTI_CO_FNC_CreateVehicle
	Description:	Create an empty vehicle
					Note that making a vehicle public with the _net variable will make it
					undergo the function CTI_CO_FNC_InitializeNetVehicle
					A public vehicle is initialized for all (+JIP) but the server
	Author: 		Benny
	Creation Date:	16-09-2013
	Revision Date:	16-09-2013
	
  # PARAMETERS #
    0	[String]: The type of vehicle to create
    1	[Array/Object]: The 2D/3D position where the vehicle should be created at
    2	[Integer]: The Azimuth direction (0-360Â°) of the vehicle
    3	[Side/Integer]: The Side or Side ID of the vehicle
    4	{Optionnal} [Boolean]: Determine if the vehicle should be created locked or not
    5	{Optionnal} [Boolean]: Determine if the vehicle should be "public" or not
    6	{Optionnal} [Boolean]: Determine if the vehicle should be handled upon destruction or not (bounty...tk...)
    7	{Optionnal} [String]: Set a special spawn mode for the vehicle
	
  # RETURNED VALUE #
	[Object]: The created vehicle
	
  # SYNTAX #
	[CLASSNAME, POSITION, DIRECTION, SIDE] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC, HANDLED] call CTI_CO_FNC_CreateVehicle
	[CLASSNAME, POSITION, DIRECTION, SIDE, LOCKED, PUBLIC, HANDLED, SPECIAL] call CTI_CO_FNC_CreateVehicle
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideFromID
	Common Function: CTI_CO_FNC_GetSideID
	Common Function: CTI_CO_FNC_OnUnitGetOut
	Common Function: CTI_CO_FNC_OnUnitHit
	Common Function: CTI_CO_FNC_OnUnitKilled
	
  # EXAMPLE #
	_vehicle = ["B_Quadbike_01_F", getPos player, 0, CTI_P_SideJoined] call CTI_CO_FNC_CreateVehicle; 
	  -> Create a "B_Quadbike_01_F" at the player's position facing North on the player's initial side
	_vehicle = ["B_Quadbike_01_F", getPos player, 180, CTI_P_SideJoined, true, true] call CTI_CO_FNC_CreateVehicle; 
	  -> Create a locked and handled "B_Quadbike_01_F" at the player's position facing South on the player's initial side
*/

private ["_direction", "_handle", "_locked", "_net", "_position", "_side", "_sideID", "_special", "_type", "_vehicle", "_velocity", "_upgrades", "_upgrade_lvoss", "_upgrade_era"];

_type = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_sideID = _this select 3;
_locked = if (count _this > 4) then {_this select 4} else {false};
_net = if (count _this > 5) then {_this select 5} else {false};
_handle = if (count _this > 6) then {_this select 6} else {false};
_special = if (count _this > 7) then {_this select 7} else {"FORM"};
_created = if (count _this > 8) then {_this select 8} else {objNull};

if (typeName _position == "OBJECT") then {_position = getPos _position};
if (typeName _sideID == "SIDE") then {_sideID = (_sideID) call CTI_CO_FNC_GetSideID};

_side = _sideID call CTI_CO_FNC_GetSideFromID;

_vehicle = createVehicle [_type, _position, [], 7, _special];
_velocity = velocity _vehicle;
_vehicle setDir _direction;
_vehicle setVectorUp surfaceNormal position _vehicle;
//--- Adding 2 second god mode to vehicles on spawn to prevent damage
_vehicle  spawn {_this allowDamage false; sleep 2; _this allowDamage true};

if (isNull _created) then {
	_vehicle setDir _direction;
	//Unmanned Unit fix
	if (_type isKindOf "UAV" || _type isKindOf "UGV_01_base_F" || _type isKindOf "O_UCSV_01" || _type isKindOf "B_UCSV_01" || _type isKindOf "B_UCSV_02" || _type isKindOf "B_T_UAV_03_F" || _type isKindOf "O_T_UAV_04_CAS_F") then {createVehicleCrew _vehicle};

	if (_special != "FLY") then {
		_vehicle setVelocity [0,0,1];
	} else {
		_vehicle setVelocity [50 * (sin _direction), 50 * (cos _direction), 0];
	};
};
if (_locked) then {_vehicle lock 2};
if (_net) then {_vehicle setVariable ["cti_net", _sideID, true]};
if (_handle) then {
	_vehicle addEventHandler ["killed", format["[_this select 0, _this select 1, %1] spawn CTI_CO_FNC_OnUnitKilled", _sideID]]; //--- Called on destruction
	_vehicle addEventHandler ["hit", {_this spawn CTI_CO_FNC_OnUnitHit}]; //--- Register importants hits
	//--- Track who get in or out of the vehicle so that we may determine the death more easily
	_vehicle addEventHandler ["getIn", {_this spawn CTI_CO_FNC_OnUnitGetOut}]; 
	_vehicle addEventHandler ["getOut", {_this spawn CTI_CO_FNC_OnUnitGetOut}]; 
	_vehicle setVariable ["cti_occupant", _side];
	_vehicle setVariable ["initial_side", _side, true];
};

//--- Tire protection (Client, HC, Server). TODO: Detect if the vehicle has wheels
if (CTI_VEHICLES_PROTECT_TIRES > 0 && _vehicle isKindOf "Car") then {
	_vehicle setVariable ["cti_wheels_protect", true, true];
	(_vehicle) remoteExec ["CTI_PVF_CO_AddVehicleHandleTiresDamages"];
};

//--- Air Radar tracking
if (_vehicle isKindOf "Air" && CTI_BASE_AIRRADAR_Z_OFFSET > 0) then {
	{(_vehicle) remoteExec ["CTI_PVF_CLT_OnAirUnitTracked", _x]} forEach CTI_PLAYABLE_SIDES - [_side];
};

//--- Artillery Radar tracking
if (getNumber(configFile >> "CfgVehicles" >> _type >> "artilleryScanner") > 0 && CTI_BASE_ARTRADAR_TRACK_FLIGHT_DELAY > -1) then {
	(_vehicle) remoteExec ["CTI_PVF_CLT_OnArtilleryPieceTracked", CTI_PV_CLIENTS];
};

if (getAmmoCargo _vehicle > 0) then {_vehicle setAmmoCargo  0};

//--- Clear out the cargo of the vehicle
clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

//--- Advanced Fuel Consumption
if (CTI_UNITS_FUEL_CONSUMPTION > 0) then {
	(_vehicle) remoteExec ["CTI_PVF_CO_AdvancedFuelConsumption"];
};

//---APS system
_upgrades = nil;
_upgrade_lvoss = 0;
_upgrade_era = 0;
if (count ((_side) call CTI_CO_FNC_GetSideUpgrades) > 0) then {
	_upgrades = (_side) call CTI_CO_FNC_GetSideUpgrades;
	_upgrade_lvoss = _upgrades select CTI_UPGRADE_LVOSS;
	_upgrade_era = _upgrades select CTI_UPGRADE_ERA;
};
if (isNil "_upgrade_lvoss") then {_upgrade_lvoss = 0;};
if (isNil "_upgrade_era") then {_upgrade_era = 0;};
//---Add LVOSS system
if (_vehicle isKindOf "Car") then {
	if (_upgrade_lvoss > 0) then {
		switch (_upgrade_lvoss) do {
			case 0: {
				_vehicle setVariable ["ammo_left", 0, true];
				_vehicle setVariable ["ammo_right", 0, true];
			};
			case 1: {
				_vehicle setVariable ["ammo_left", 1, true];
				_vehicle setVariable ["ammo_right", 1, true];
			};
			case 2: {
				_vehicle setVariable ["ammo_left", 2, true];
				_vehicle setVariable ["ammo_right", 2, true];
			};
		};
		_vehicle setVariable ["reloading_left", 0, true];
		_vehicle setVariable ["reloading_right", 0, true];
	};
};

//---Add ERA system
if (_vehicle isKindOf "Tank") then {
	if (_upgrade_era > 0) then {
		switch (_upgrade_era) do {
			case 0: {
				_vehicle setVariable ["ammo_left", 0, true];
				_vehicle setVariable ["ammo_right", 0, true];
			};
			case 1: {
				_vehicle setVariable ["ammo_left", 1, true];
				_vehicle setVariable ["ammo_right", 1, true];
			};
			case 2: {
				_vehicle setVariable ["ammo_left", 2, true];
				_vehicle setVariable ["ammo_right", 2, true];
			};
			case 3: {
				_vehicle setVariable ["ammo_left", 3, true];
				_vehicle setVariable ["ammo_right", 3, true];
			};
			case 4: {
				_vehicle setVariable ["ammo_left", 4, true];
				_vehicle setVariable ["ammo_right", 4, true];
			};			
		};
		_vehicle setVariable ["reloading_left", 0, true];
		_vehicle setVariable ["reloading_right", 0, true];
	};
};
_vehicle call CTI_CO_FNC_UnitCreated;

_vehicle