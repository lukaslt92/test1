private ["_vehicle"];
_vehicle = vehicle (_this select 0);
if (isNil{_vehicle getVariable "Fuel"} ) then {//if off
//	_vehicle setVariable ["StealthOn", true, true];
    (_vehicle) spawn Stealth_FNC_On;
} else {// if on
//	_vehicle setVariable ["StealthOn", nil, true];
    (_vehicle) spawn Stealth_FNC_Off;
};