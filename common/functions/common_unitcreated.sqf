/*
  # HEADER #
	Alias:			CTI_CO_FNC_UnitCreated
	Description:	Various functions to be executed after units or vehicles have been created
	
  # PARAMETERS #
    0	[object]: The created unit or vehicle
	
  # RETURNED VALUE #
	None
*/

private ["_unit"];

_unit = _this;

if (local _unit) then {
	if (_unit isKindOf "Man") then {
		_unit addEventHandler ["FiredMan",{_this spawn FNC_BAPS_FIRED}];
		_unit addEventHandler ["FiredMan",{_this spawn FNC_CRAMControl_AttackerFiredEH}];
	};
} else {
	if (CTI_Log_Level >= CTI_Log_Error) then {
		["ERROR", "FILE: Common\Functions\Common_UnitCreated.sqf", "Unit " + str(_unit) + " is not local"] call CTI_CO_FNC_Log;
	};
};

//--- Make unit ZEUS/Curator editable
if !(isNil "ADMIN_ZEUS") then {
	if (CTI_IsServer) then {
		ADMIN_ZEUS addCuratorEditableObjects [[_unit], true];
	} else {
		[ADMIN_ZEUS, _unit] remoteExec ["CTI_PVF_SRV_RequestAddCuratorEditable", CTI_PV_SERVER];
	};
};