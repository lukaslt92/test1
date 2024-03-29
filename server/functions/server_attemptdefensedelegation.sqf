/*
  # HEADER #
	Script: 		Server\Functions\Server_AttemptDefenseDelegation.sqf
	Alias:			CTI_SE_FNC_AttemptDefenseDelegation
	Description:	Attempt to perform defense delegation on a single HC (MP)
	Author: 		Benny
	Creation Date:	11-04-2016
	Revision Date:	11-04-2016
	
  # PARAMETERS #
    0	[Object]: The Static
    1	[Group]: The Defensive Group
    2	[Integer]: The Side ID
    3	[Array]: The AI creation arguments
	
  # RETURNED VALUE #
	[Boolean]: True if delegated
	
  # SYNTAX #
	[UNIT, GROUP, SIDE ID, AI ARRAY ARGS] call CTI_SE_FNC_AttemptTownDelegation
	
  # EXAMPLE #
    [ai1, defGroup, 1, ["B_Soldier_R", defGroup, [500, 600, 0], 1, true]] Call CTI_SE_FNC_AttemptDefenseDelegation;
*/

private ["_ai_args", "_delegated", "_hc", "_hcs", "_result", "_side", "_sideID", "_static", "_unit"];

_static = _this select 0;
_group = _this select 1;
_side = _this select 2;
_ai_args = _this select 3;

_hcs = missionNamespace getVariable "CTI_HEADLESS_CLIENTS";
_delegated = true;

//--- Don't bother if we don't have any HC connected
if (isNil '_hcs') exitWith {false};
//--- Don't bother if we have no more HC connected
if (count _hcs < 1) exitWith {false};

_sideID = (_side) call CTI_CO_FNC_GetSideID;

//--- Grab the first HC.
_hc = (_hcs select 0) select 0;

//--- First of all, we delegate the group to the HC if needed
if (groupOwner _group != _hc) then {
	if (CTI_Log_Level >= CTI_Log_Information) then {
		["INFORMATION", "FILE: Server\Functions\Server_AttemptDefenseDelegation.sqf", format["Attempting to change ownership of group [%1] to HC [%2]", _group, _hc]] call CTI_CO_FNC_Log;
	};

	_result = _group setGroupOwner _hc;
	
	if (CTI_Log_Level >= CTI_Log_Information) then {
		["INFORMATION", "FILE: Server\Functions\Server_AttemptDefenseDelegation.sqf", format["Swapping ownership of group [%1] to HC [%2] success? [%3]", _group, _hc, _result]] call CTI_CO_FNC_Log;
	};
	
	//--- If the ownership was successfully changed, we want to add back the killed EH again on the non-initialized units.
	if (_result) then {
		[_group, _sideID] remoteExec ["CTI_PVF_HC_OnDefenseDelegationLocalityChanged", _hc];
	};
};

//--- Respawn the defense since AI assignment will not work on the HC on the second time (TODO: Troubleshoot that, find the correct AI order)
if !(isNil {_static getVariable "cti_delegated"}) then {
	private ["_direction", "_position", "_var", "_varname"];
	_position = position _static;
	_direction = direction _static;
	
	_varname = format["CTI_%1_%2", _side, typeOf _static];
	_var = missionNamespace getVariable _varname;
	
	if (isNil '_var') exitWith {
	
		["ERROR", "FILE: Server\Functions\Server_AttemptDefenseDelegation.sqf", format["A [%1] static [%2] (%3) cannot be created for the HC [%4] since the static defense variable [%5] is not defined", _side, _static, typeOf _static, _hc, _varname]] call CTI_CO_FNC_Log;
		_delegated = false;
	};
	
	if (CTI_Log_Level >= CTI_Log_Information) then {
		["INFORMATION", "FILE: Server\Functions\Server_AttemptDefenseDelegation.sqf", format["A [%1] static [%2] (%3) is about to be replaced (delete/create) by a new one for the HC [%4]", _side, _static, typeOf _static, _hc]] call CTI_CO_FNC_Log;
	};

	deleteVehicle _static;
	
	_static = (_var select 1) createVehicle _position;
	_static setVariable ["cti_defense_sideID", _sideID, true];
	_static setVariable ["cti_aman_enabled", true];
	_static setVariable ["cti_defense_sideID", _sideID, true]; //--- Track the defense by giving it a sideID
	_static setDir _direction;
	_static setPos _position;
	
	_static addEventHandler ["killed", format["[_this select 0, _this select 1, %1, '%2', '%3'] spawn CTI_SE_FNC_OnDefenseDestroyed", _sideID, "", _varname]];
	[_static, CTI_BASE_DEFENSES_EMPTY_TIMEOUT] spawn CTI_SE_FNC_HandleEmptyVehicle; //--- Track the defense lifespan
	
	if !(isNil "ADMIN_ZEUS") then {ADMIN_ZEUS addCuratorEditableObjects [[_static], true]};

	if (CTI_Log_Level >= CTI_Log_Information) then {
	["INFORMATION", "FILE: Server\Functions\Server_AttemptDefenseDelegation.sqf", format["A [%1] static [%2] (%3) has been created again for delegation of group [%4] to HC [%5]", _side, _static, _var select 1, _group, _hc]] call CTI_CO_FNC_Log;
	};
	
};

if (_delegated) then {
	_static setVariable ["cti_delegated", true];

	//--- Send the creation request to the HC now
	[_static, _ai_args] remoteExec ["CTI_PVF_HC_OnDefenseDelegationReceived", _hc];
};

_delegated