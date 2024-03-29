/*
  # HEADER #
	Script: 		Client\Functions\Client_OnStructureConstructed.sqf
	Alias:			CTI_CL_FNC_OnStructureConstructed
	Description:	Called by the server whenever a friendly structure construction is achieved
					Note this function is called automatically by the PVF "CTI_PVF_CLT_OnStructureConstructed"
	Author: 		Benny
	Creation Date:	19-09-2013
	Revision Date:	14-10-2013
	
  # PARAMETERS #
    0	[Object]: The structure
    1	[String]: The structure variable name
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[STRUCTURE, VARIABLE] call CTI_CL_FNC_OnStructureConstructed
	
  # EXAMPLE #
	[_structure, _variable] call CTI_CL_FNC_OnStructureConstructed
*/

private ["_marker", "_score", "_structure", "_var", "_variable"];

_structure = _this select 0;
_variable = _this select 1;

_var = missionNamespace getVariable _variable;

//todo move to displaymessage
CTI_P_ChatID commandChat format ["%1 is now available at grid %2.", (_var select 0) select 1, mapGridPosition getPos _structure];

//--- Add score for the commander
if (call CTI_CL_FNC_IsPlayerCommander) then {
	_score = round((_var select 2) / CTI_SCORE_BUILD_VALUE_PERPOINT);
	if (_score > 0) then {[player, _score] remoteExec ["CTI_PVF_SRV_RequestAddScore", CTI_PV_SERVER]}; //--- Award some score
};

[_structure, _var] call CTI_CL_FNC_InitializeStructure;