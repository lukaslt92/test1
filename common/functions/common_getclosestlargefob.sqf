/*
  # HEADER #
	Script: 		Common\Functions\Common_GetClosestLargeFOB.sqf
	Alias:			CTI_CO_FNC_GetClosestLargeFOB
	Description:	Get the closest Large FOB
	Author: 		Benny
	Creation Date:	13-07-2016
	Revision Date:	13-07-2016
	
  # PARAMETERS #
    0	[Array/Object]: A position or an object which determine the center
    1	[Side/Integer]: (optional) Side or Side ID requiered
	
  # RETURNED VALUE #
	[Object]: The closest large fob (null if none)
	
  # SYNTAX #
	[CENTER] call CTI_CO_FNC_GetClosestLargeFOB
	[CENTER, SIDE] call CTI_CO_FNC_GetClosestLargeFOB
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetClosestEntity
	Common Function: CTI_CO_FNC_GetSideID
	
  # EXAMPLE #
    _closest = [player, CTI_P_SideID] call CTI_CO_FNC_GetClosestLargeFOB;
*/

params["_center", ["_sideID", -2]];
private ["_closest"];

_closest = objNull;

if (typeName _sideID == "SIDE") then {_sideID = (_sideID) call CTI_CO_FNC_GetSideID};
{
	if !(isNil {_x getVariable "cti_large_fob"}) then {
		_closest = _x;
	};
	
	if !(isNull _closest) exitWith {};
} forEach (nearestObjects [_center, CTI_TOWNS_LARGE_FOB_CLASSNAME, CTI_TOWNS_LARGE_FOB_RANGE]);

_closest