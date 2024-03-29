_last_funds = -1;
_last_supply = -1;
_last_townheld = -1;
_last_award_pool = -1;
_last_resources_pool = -1;
_last_income = -1;
_last_score = -1;

_town_count = count CTI_Towns;
_last_infocheck = -100;

while { true } do {
	if (isNil {uiNamespace getVariable "cti_dialog_ui_tabletmenu"}) exitWith {}; //--- Menu is closed.
	
	if (time - _last_infocheck > 1) then {
		_uptime = call CTI_CL_FNC_GetMissionTime;
		((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl (777006)) ctrlSetStructuredText (parseText format["TIME: <t color='#d4ceff'>%1 Day(s) %2:%3:%4</t>", _uptime select 0,_uptime select 1,_uptime select 2, _uptime select 3]);
		((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl (779006)) ctrlSetStructuredText (parseText format["TIME: <t color='#d4ceff'>%1 Day(s) %2:%3:%4</t>", _uptime select 0,_uptime select 1,_uptime select 2, _uptime select 3]);
		((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl (780006)) ctrlSetStructuredText (parseText format["TIME: <t color='#d4ceff'>%1 Day(s) %2:%3:%4</t>", _uptime select 0,_uptime select 1,_uptime select 2, _uptime select 3]);
		_last_infocheck = time;
		
		_funds = call CTI_CL_FNC_GetPlayerFunds;
		_supply = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideSupply;
		_held = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideTownCount;
		_award_pool = CTI_P_SideLogic getVariable "cti_pool_award";
		_resources_pool = CTI_P_SideLogic getVariable "cti_pool_resources";
		_income = call CTI_CL_FNC_GetPlayerIncome;
		
		//get rank and score
		_score = [player] call CTI_CO_FNC_GetUnitsScore;
		_rank = (player) call CTI_CO_FNC_GetUnitsRank;
		
		if (_score != _last_score) then {
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777003) ctrlSetStructuredText (parseText format["<t><t>%1 : %2</t></t>", _rank, _score]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779003) ctrlSetStructuredText (parseText format["<t><t>%1 : %2</t></t>", _rank, _score]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780003) ctrlSetStructuredText (parseText format["<t><t>%1 : %2</t></t>", _rank, _score]);
			_last_score = _score;
		};
		if (_funds != _last_funds) then {
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777009) ctrlSetStructuredText (parseText format["<t>RESOURCES: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _funds]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779009) ctrlSetStructuredText (parseText format["<t>RESOURCES: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _funds]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780009) ctrlSetStructuredText (parseText format["<t>RESOURCES: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _funds]);
			_last_funds = _funds;
		};
		if (_supply != _last_supply) then {
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777010) ctrlSetStructuredText (parseText format["<t>SUPPLY: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _supply]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779010) ctrlSetStructuredText (parseText format["<t>SUPPLY: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _supply]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780010) ctrlSetStructuredText (parseText format["<t>SUPPLY: <t color='%1'>$%2</t></t>", CTI_P_Coloration_Money, _supply]);
			_last_supply = _supply;
		};
		if (_resources_pool != _last_resources_pool || _award_pool != _last_award_pool) then {
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777008) ctrlSetStructuredText (parseText format["<t>POOLS: %1%3 / %2%3</t>", round(_resources_pool*100), round(_award_pool*100), "%"]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779008) ctrlSetStructuredText (parseText format["<t>POOLS: %1%3 / %2%3</t>", round(_resources_pool*100), round(_award_pool*100), "%"]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780008) ctrlSetStructuredText (parseText format["<t>POOLS: %1%3 / %2%3</t>", round(_resources_pool*100), round(_award_pool*100), "%"]);
			_last_resources_pool = _resources_pool;
			_last_award_pool = _award_pool;
		};
		if (_income != _last_income) then {
			_side_income = ((CTI_P_SideJoined) call CTI_CO_FNC_GetTownsResources) * CTI_TOWNS_INCOME_RATIO;
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777011) ctrlSetStructuredText (parseText format["<t>INCOME: <t color='%1'>$%2</t>/<t color='%1'>$%3</t></t>", CTI_P_Coloration_Money, _income, round _side_income]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779011) ctrlSetStructuredText (parseText format["<t>INCOME: <t color='%1'>$%2</t>/<t color='%1'>$%3</t></t>", CTI_P_Coloration_Money, _income, round _side_income]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780011) ctrlSetStructuredText (parseText format["<t>INCOME: <t color='%1'>$%2</t>/<t color='%1'>$%3</t></t>", CTI_P_Coloration_Money, _income, round _side_income]);
			_last_income = _income;
		};
		if (_held != _last_townheld) then {
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 777007) ctrlSetStructuredText (parseText format["<t>TOWNS: <t color='#66baff'>%1</t>/%2</t>", _held, _town_count]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 779007) ctrlSetStructuredText (parseText format["<t>TOWNS: <t color='#66baff'>%1</t>/%2</t>", _held, _town_count]);
			((uiNamespace getVariable "cti_dialog_ui_tabletmenu") displayCtrl 780007) ctrlSetStructuredText (parseText format["<t>TOWNS: <t color='#66baff'>%1</t>/%2</t>", _held, _town_count]);
			_last_townheld = _held;
		};
	};
	
	sleep .1;
};