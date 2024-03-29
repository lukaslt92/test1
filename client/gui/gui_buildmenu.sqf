_last_funds = -1;
_last_supply = -1;
_last_workercount = -1;

while { true } do {
	if (isNil {uiNamespace getVariable "cti_dialog_ui_buildmenu"}) exitWith {}; //--- Menu is closed.
	if !(alive (CTI_P_SideJoined call CTI_CO_FNC_GetSideHQ)) exitWith {closeDialog 0}; //--- The target has been destroyed
	
	_count = 0;
	{
		switch (typeName _x) do {
			case "STRING": { _count = _count + 1 };
			case "OBJECT": { if (alive _x) then { _count = _count + 1 } };
		};
	} forEach (CTI_P_SideLogic getVariable "cti_workers");
	_funds = call CTI_CL_FNC_GetPlayerFunds;
	_supply = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideSupply;
	
	if (_last_funds != _funds || _last_supply != _supply) then {
		((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100008) ctrlSetStructuredText (parseText format["Resources: <t color='%2'>$%1</t> | <t color='%2'>S%3</t>", _funds, CTI_P_Coloration_Money, _supply]);
	};
	
	if (_last_workercount != _count) then {
		((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100009) ctrlSetStructuredText (parseText format["Workers not required!"]);
	};
	
	_last_funds = _funds;
	_last_supply = _supply;
	_last_workercount = _count;
	
	sleep .1;
};