/*
  # HEADER #
	Script: 		Client\Functions\Client_OnCampCaptured.sqf
	Alias:			CTI_CL_FNC_OnCampCaptured
	Description:	Called by the server whenever a camp is captured by either side
					Note this function is called automatically by the PVF "CTI_PVF_CLT_OnCampCaptured"
	Author: 		Benny
	Creation Date:	20-04-2016
	Revision Date:	20-04-2016
	
  # PARAMETERS #
    0	[Object]: The Town
    1	[Object]: The Camp
    2	[Integer]: The new Side ID
    3	[Integer]: The previous Side ID
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[TOWN, CAMP, NEW SIDE ID, OLD SIDE ID] call CTI_CL_FNC_OnCampCaptured
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideColoration
	Common Function: CTI_CO_FNC_GetSideFromID
	
  # EXAMPLE #
	[EntreDeux, Camp1, WESTID, EASTID] call CTI_CL_FNC_OnCampCaptured
	  -> Camp1 of EntreDeux will be captured from East to West
*/

private ["_camp", "_color", "_side_new", "_sideID_new", "_sideID_old", "_town"];

_town = _this select 0;
_camp = _this select 1;
_sideID_new = _this select 2;
_sideID_old = _this select 3;

if !(CTI_P_SideID in [_sideID_new, _sideID_old]) exitWith {}; //--- Make sure that the client need an update

_side_new = (_sideID_new) call CTI_CO_FNC_GetSideFromID;

if (_side_new == CTI_P_SideJoined) then { //--- The player's side has captured it
	CTI_P_ChatID commandChat format["A camp has been captured in %1!", _town getVariable "cti_town_name"];
	// player award on capture
	_in_range = false;
	{if (_x distance _camp < CTI_TOWNS_CAMPS_CAPTURE_RANGE) exitWith {_in_range = true}} forEach ((units player) call CTI_CO_FNC_GetLiveUnits);
	
	if (_in_range) then { //--- The player or one of his unit was in range of the camp.
		_last_capture = _camp getVariable format["cti_camp_lastcap_%1", _side_new];
		_value = CTI_TOWNS_CAMPS_CAPTURE_BOUNTY;
		if !(isNil '_last_capture') then {
			if (time - _last_capture <= CTI_TOWNS_CAMPS_CAPTURE_BOUNTY_DELAY) then { _value = round(_value / 2) };
		};
		_score = round(_value / CTI_SCORE_CAMP_VALUE_PERPOINT);
		if (_score > 0) then {[player, _score] remoteExec ["CTI_PVF_SRV_RequestAddScore", CTI_PV_SERVER]}; //--- Award some score
		(_value) call CTI_CL_FNC_ChangePlayerFunds; //--- Award some money
		["camp-capture", [_town, _value]] call CTI_CL_FNC_DisplayMessage;
	};
	_camp setVariable ["cti_camp_lastcap", time];
	
} else {
	CTI_P_ChatID commandChat format["A camp has been lost in %1!", _town getVariable "cti_town_name"];
};

//--- Paint it
_color = (_side_new) call CTI_CO_FNC_GetSideColoration;
(_camp getVariable "cti_camp_marker") setMarkerColorLocal _color;