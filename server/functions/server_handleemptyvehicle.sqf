/*
  # HEADER #
	Script: 		Server\Functions\Server_HandleEmptyVehicle.sqf
	Alias:			CTI_SE_FNC_HandleEmptyVehicle
	Description:	Handle a empty vehicle lifespan
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	16-10-2013
	
  # PARAMETERS #
    0	[Object]: The vehicle to track
    1	{Optionnal} [Number]: The empty lifespan delay
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[VEHICLE] spawn CTI_SE_FNC_HandleEmptyVehicle
	[VEHICLE, DELAY] spawn CTI_SE_FNC_HandleEmptyVehicle
	
  # EXAMPLE #
    [vehicle player] spawn CTI_SE_FNC_HandleEmptyVehicle
	  -> Track the player's vehicle with a default timeout
    [vehicle player, 120] spawn CTI_SE_FNC_HandleEmptyVehicle
	  -> Track the player's vehicle with a 120 seconds timeout
*/

private ["_delay", "_timeout", "_vehicle"];

_vehicle = _this select 0;
_delay = 0;
if !(isNil {_vehicle getVariable "cti_spec"}) then { //--- if special vehicle
	_delay = if (count _this > 1) then {_this select 1} else {missionNamespace getVariable "CTI_VEHICLES_EMPTY_SPECIAL_TIMEOUT"};
} else {
	_delay = if (count _this > 1) then {_this select 1} else {missionNamespace getVariable "CTI_VEHICLES_EMPTY_TIMEOUT"};
};

if (CTI_Log_Level >= CTI_Log_Information) then {
	["INFORMATION", "FILE: Server\Functions\Server_HandleEmptyVehicle.sqf", format["Handling emptiness expiration for vehicle [%1] with a delay of [%2]", _vehicle, _delay]] call CTI_CO_FNC_Log;
};

_timeout = time;
while {alive _vehicle && time - _timeout <= _delay} do {
	switch (CTI_VEHICLES_HANDLER_EMPTY) do { //--- Before
		case 0: {if ({alive _x} count crew _vehicle > 0) then {_timeout = time}};
		case 1: {if ({alive _x} count crew _vehicle > 0 || canMove _vehicle || canFire _vehicle) then {_timeout = time}};
	};
	
	sleep CTI_VEHICLES_EMPTY_SCAN_PERIOD;
	
	switch (CTI_VEHICLES_HANDLER_EMPTY) do { //--- After
		case 0: {if ({alive _x} count crew _vehicle > 0) then {_timeout = time}};
		case 1: {if ({alive _x} count crew _vehicle > 0 || canMove _vehicle || canFire _vehicle) then {_timeout = time}};
	};
};

if (alive _vehicle) then {
	if (CTI_Log_Level >= CTI_Log_Information) then {
		["INFORMATION", "FILE: Server\Functions\Server_HandleEmptyVehicle.sqf", format["Vehicle [%1] will now get removed after an empty delay of [%2]", _vehicle, _delay]] call CTI_CO_FNC_Log;
	};
	deleteVehicle _vehicle;
}; //--- If we got out of the loop then we can just delete the vehicle