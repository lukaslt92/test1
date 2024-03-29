/*
  # HEADER #
	Script: 		Client\Functions\Client_InitializeStructure.sqf
	Alias:			CTI_CL_FNC_InitializeStructure
	Description:	Initialize a freshly constructed structure
					Note that this file is also called for JIP'ers
	Author: 		Benny
	Creation Date:	14-10-2013
	Revision Date:	14-10-2013
	
  # PARAMETERS #
    0	[Object]: The structure
    1	[Array]: The structure variable array
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[STRUCTURE, STRUCTURE ARRAY] call CTI_CL_FNC_InitializeStructure
	
  # EXAMPLE #
    [Barracks1, BarrackCoreInfo] call CTI_CL_FNC_InitializeStructure
*/

private ["_marker", "_structure", "_var"];

_structure = _this select 0;
_var = _this select 1;

//--- Quick action (I know you want it brit!)
if (((_var select 0) select 0) in CTI_FACTORIES) then {
	_structure addAction [format["<t color='#c9f7bb'>Use %1</t>", ((_var select 0) select 1)], "Client\Actions\Action_UseNearestFactory.sqf", "", 95, false, true, "", "alive _target && _this == player"];
};

//--- Center marker
_marker = createMarkerLocal [Format ["cti_structure_%1", CTI_P_MarkerIterator], getPos _structure];CTI_P_MarkerIterator = CTI_P_MarkerIterator + 1;
_marker setMarkerTypeLocal format["%1installation", CTI_P_MarkerPrefix];
_marker setMarkerColorLocal CTI_P_SideColor;
_marker setMarkerSizeLocal [0.75, 0.75]; 
_marker setMarkerTextLocal ((_var select 0) select 2);

//--- Set the type if needed
if (isNil {_structure getVariable "cti_structure_type"}) then {_structure setVariable ["cti_structure_type", (_var select 0) select 0]};

//--- Track till destruction
[_structure, _marker] spawn {
	_structure = _this select 0;
	_marker = _this select 1;
	
	waitUntil { sleep 5; !alive _structure };
	deleteMarkerLocal _marker;
};

// additionnal marker for radars
if ((_var select 0) select 0 == CTI_RADAR) then {
	(_structure) spawn {
		(_this) spawn CTI_CL_FNC_UpdateRadarMarkerAir;
	};
};
if ((_var select 0) select 0 == CTI_RADAR_ART) then {
	(_structure) spawn {
		(_this) spawn CTI_CL_FNC_UpdateRadarMarkerArt;
	};
};
// Base satellite marker and scan
if ((_var select 0) select 0 == CTI_SATELLITE) then {
	(_structure) spawn {
		(_this) spawn CTI_CL_FNC_UpdateRadarSatellite;
	};
};