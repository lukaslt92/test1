/*
  # HEADER #
	Script: 		Client\Functions\Client_UpdateRadarMarkerSatellite.sqf
	Alias:			CTI_CL_FNC_UpdateRadarMarkerSatellite
	Description:	Update an Satellite Radar Base Circle Marker
	Author: 		Benny
	Creation Date:	01-09-2016
	Revision Date:	01-09-2016
	
  # PARAMETERS #
    0	[Object]: The radar vehicle
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	(RADAR) spawn CTI_CL_FNC_UpdateRadarMarkerSatellite
	
  # EXAMPLE #
    (RADAR) spawn CTI_CL_FNC_UpdateRadarMarkerSatellite
	  -> will track the radar range
*/

private ["_marker", "_side", "_vehicle","_rangebase","_objects","_count_enemies"];

_vehicle = _this;
_color = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideColoration;

_rangebase = CTI_BASE_SATELLITE_BASE_DETECTION_RANGE;
_marker_name=format ["BASE_SATELLITE_%1",_this];
_marker=createMarkerLocal [_marker_name,getposATL _this];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "Border";
_marker setMarkerSizeLocal [_rangebase,_rangebase];
_marker setMarkerColorLocal _color;
_marker setMarkerAlphaLocal 0.9;

while {alive _vehicle} do {
	_objects = _vehicle nearEntities CTI_BASE_SATELLITE_BASE_DETECTION_RANGE;
	_count_enemies = [_objects, CTI_P_SideJoined] call CTI_CO_FNC_GetAreaEnemiesCount;
	if (_count_enemies > 0) then {
		_marker setMarkerColorLocal "ColorOrange";
		["base-hostilenear", [_count_enemies]] remoteExec ["CTI_PVF_CLT_OnMessageReceived", (CTI_P_SideJoined)];
		[_vehicle,CTI_SOUND_purgesiren_2,200] call Common_Say3D;
	};
	sleep CTI_BASE_SATELLITE_BASE_DETECTION_TIME;
	_marker setMarkerColorLocal _color;
	_count_enemies = 0;
};

deleteMarkerLocal _marker;