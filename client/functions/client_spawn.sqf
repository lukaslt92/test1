waitUntil {vehicle player == player};
waituntil {!isnull (finddisplay 46)};
	
[] spawn {cmKeyPressWin = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == tablet_hotkeyDIKCodeNumberWin) then {[] call cm_Tablet_FUNc;};"];};
//tabletopen=true;

if (CBA_Loaded) then
{
	//KEYBINDS Refresh
	_keybindear = ["OFPS", "toggle_earplugs"] call cba_fnc_getKeybind;
	if (!isNil "_keybindear") then {
		_actualkeyear = ((_keybindear) select 5) select 0;
		if (!isNil "_actualkeyear") then {
			cmEarplugs_hotkeyDIKCodeNumber = _actualkeyear;
		} else {
			cmEarplugs_hotkeyDIKCodeNumber = cmEarplugs_hotkeyDIKCodeNumberINSERT;
		};
	};
	_keybindtablet = ["OFPS", "toggle_tablet"] call cba_fnc_getKeybind;
	if (!isNil "_keybindtablet") then {
		_actualkeytablet = ((_keybindtablet) select 5) select 0;
		tablet_hotkeyDIKCodeNumberWin = _actualkeytablet;
	};

	//If default On Mode
	if(ZAM_showNames_default_on) then {
		ZAM_showNames_on = false;
		sleep 5;
		player call ZAM_fnc_showNames_Press;
	};

	//hide score on HUD
	disableSerialization;
	_displayscorehud = uiNamespace getVariable [ "RscMissionStatus_display", displayNull ];
	if ( !isNull _displayscorehud ) then {
		_statusscorehud = _displayscorehud displayCtrl 15283;
		_statusscorehud ctrlShow false;	
	};
};

//--- No more weapon sway
if (local player) then {
	_swayamount = CTI_WEAPON_SWAY / 100;
	player setCustomAimCoef _swayamount;
	player addMPEventhandler ["MPRespawn", {player setCustomAimCoef _swayamount;}];
};