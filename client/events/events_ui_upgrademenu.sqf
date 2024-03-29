private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
		_max = missionNamespace getVariable format["CTI_%1_UPGRADES_LEVELS", CTI_P_SideJoined];
		_enabled = missionNamespace getVariable format["CTI_%1_UPGRADES_ENABLED", CTI_P_SideJoined];
		{
			if (_enabled select _forEachIndex) then {
				_row = ((uiNamespace getVariable "cti_dialog_ui_upgrademenu") displayCtrl 250002) lnbAddRow [format["%1/%2",_upgrades select _forEachIndex, _max select _forEachIndex], _x select 0];
				((uiNamespace getVariable "cti_dialog_ui_upgrademenu") displayCtrl 250002) lnbSetValue [[_row, 0], _upgrades select _forEachIndex];
				((uiNamespace getVariable "cti_dialog_ui_upgrademenu") displayCtrl 250002) lnbSetValue [[_row, 1], _forEachIndex];
			};
		} forEach (missionNamespace getVariable format["CTI_%1_UPGRADES_LABELS", CTI_P_SideJoined]);
		
		execVM "Client\GUI\GUI_UpgradeMenu.sqf";
	};
	case "onUpgradeListSelChanged": {
		_changeto = _this select 1;
		_changeto = lnbValue [250002, [_changeto, 1]];
		(_changeto) call CTI_UI_Upgrade_LoadUpgradeInfo;
	};
	case "onUpgradePressed": {
		_selected = _this select 1;
		
		if (call CTI_CL_FNC_IsPlayerCommander) then {
			if (_selected > -1) then {
				if ((CTI_P_SideLogic getVariable "cti_upgrade") < 0) then {
					_selected = lnbValue [250002, [_selected, 1]];
					_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
					_upgrade_current = _upgrades select _selected;
					_upgrade_level = (missionNamespace getVariable Format["CTI_%1_UPGRADES_LEVELS", CTI_P_SideJoined]) select _selected;
					_upgrade_price = ((missionNamespace getVariable Format["CTI_%1_UPGRADES_COSTS", CTI_P_SideJoined]) select _selected) select _upgrade_current;
					_supply = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideSupply;
					
					if (_upgrade_current < _upgrade_level) then {
						if (_supply >= _upgrade_price) then {
							_links = ((missionNamespace getVariable Format["CTI_%1_UPGRADES_LINKS", CTI_P_SideJoined]) select _selected) select _upgrade_current;
							_link_needed = false;
							if (count _links > 0) then {
								if (typeName (_links select 0) == "ARRAY") then {
									_count = count(_links);
									for '_i' from 0 to _count-1 do {
										_clink = _links select _i;
										_linkto = _upgrades select (_clink select 0);
										if (_linkto < (_clink select 1)) exitWith {_link_needed = true};
									};
								} else {
									_linkto = _upgrades select (_links select 0);
									if (_linkto < (_links select 1)) exitWith {_link_needed = true};
								};
							};
							
							if !(_link_needed) then {
								[CTI_P_SideJoined, -(_upgrade_price)] call CTI_CO_FNC_ChangeSideSupply;
								[CTI_P_SideJoined, _selected, _upgrade_current] remoteExec ["CTI_PVF_SRV_RequestUpgrade", CTI_PV_SERVER];
								CTI_P_SideLogic setVariable ["cti_upgrade", _selected,true];
								
								_label = ((missionNamespace getVariable format["CTI_%1_UPGRADES_LABELS", CTI_P_SideJoined]) select _selected) select 0;
								hint parseText format["<t size='1.3' color='#2394ef'>Information</t><br /><br /><t color='#F5D363'>%1</t> upgrade has started.", _label];
							} else {
								hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Not all dependencies are met to start this upgrade.";
							};
						} else {
							hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to perform this operation.";
						};
					} else {
						hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The maximum upgrade level has been reached for this upgrade.";
					};
				} else {
					hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You may not upgrade something else while an upgrade is already running.";
				};
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Only the Commander may perform upgrades.";
		};
	};
};