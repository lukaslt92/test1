private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		_structures = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideStructures;
		_closestsatuplink = [CTI_SATELLITE, player, _structures] call CTI_CO_FNC_GetClosestStructure;
		if !(alive _closestsatuplink) exitWith {closeDialog 0};
		
		_pos = getPos _closestsatuplink;
		_pos set [2, CTI_BASE_SATELLITE_BASE_BASECAM_HEIGHT];
		
		showCinemaBorder false;
		
		CTI_BaseCamera = "camera" camCreate _pos;
		CTI_BaseCamera setVectorDirAndUp [[0, 0, -1], [0, 1, -1]];
		
		uiNamespace setVariable ["cti_dialog_ui_basecam_anchor", nil];
		uiNamespace setVariable ["cti_dialog_ui_basecam_focus", nil];
		uiNamespace setVariable ["cti_dialog_ui_basecam_mapselect", objNull];
		
		(uiNamespace getVariable "cti_dialog_ui_basecam") displayAddEventHandler ["KeyDown", "nullReturn = _this spawn CTI_UI_KeyHandler_BaseCamera"];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001) ctrlAddEventHandler ["MouseButtonDown", "nullReturn = _this call CTI_UI_KeyHandler_BaseCamera_MouseButtonDown"];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001) ctrlAddEventHandler ["MouseButtonUp", "nullReturn = _this call CTI_UI_KeyHandler_BaseCamera_MouseButtonUp"];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001) ctrlAddEventHandler ["MouseZChanged", "nullReturn = _this call CTI_UI_KeyHandler_BaseCamera_MouseZChanged"];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001) ctrlAddEventHandler ["MouseMoving", "nullReturn = _this call CTI_UI_KeyHandler_BaseCamera_MouseMoving"];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001) ctrlAddEventHandler ["MouseHolding", "nullReturn = _this call CTI_UI_KeyHandler_BaseCamera_MouseMoving"];
		
		ctrlSetFocus ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177001);
		
		if (isNil {uiNamespace getVariable "cti_dialog_ui_basecam_showmap"}) then {uiNamespace setVariable ["cti_dialog_ui_basecam_showmap", true]};
		if (uiNamespace getVariable "cti_dialog_ui_basecam_showmap") then {
			((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177008) ctrlSetText "Hide Map";
		} else {
			((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177008) ctrlSetText "Show Map";
			{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlShow false} forEach [177009, 177010];
		};

		//--- Render in. Where the bloody hell is the dialog option to render thing invisible at first? visible = 0 ?!?!
		{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.01), SafeZoneY + (SafezoneH * 0.06), SafeZoneW * 0.31, SafeZoneH * 0.6]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlCommit 0} forEach [177016, 177018];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177009) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.8), SafeZoneY + (SafezoneH * 0.62), SafeZoneW * 0.19, SafeZoneH * 0.32]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177009) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177010) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.63), SafeZoneW * 0.18, SafeZoneH * 0.30]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177010) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177002) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.8), SafeZoneY + (SafezoneH * 0.06), SafeZoneW * 0.19, SafeZoneH * 0.55]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177002) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177003) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.0605), SafeZoneW * 0.19, SafeZoneH * 0.03]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177003) ctrlCommit 0;
		{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafeZoneH * 0.10), SafeZoneW * 0.18, SafeZoneH * 0.3]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlCommit 0} forEach [177004, 170100];
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177005) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.41), SafeZoneW * 0.19, SafeZoneH * 0.03]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177005) ctrlCommit 0;
		{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.45), SafeZoneW * 0.18, SafeZoneH * 0.15]; ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlCommit 0} forEach [177006, 170101];
		
		if (isNil {uiNamespace getVariable "cti_dialog_ui_basecam_viewmode"}) then {uiNamespace setVariable ["cti_dialog_ui_basecam_viewmode", 0]};
		_mode = "Normal";
		switch (uiNamespace getVariable "cti_dialog_ui_basecam_viewmode") do { case 1: {_mode = "NVG"; camUseNVG true }; case 2: {_mode = "Thermals"; true setCamUseTi 0}; };
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177013) ctrlSetText _mode;
		
		if (ctrlText ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177011) == "") then { ((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177011) ctrlSetText "Feed: No Target" };
		
		CTI_BaseCamera cameraEffect ["Internal", "back"];
		
		execVM "Client\GUI\GUI_BaseCamera.sqf";
	};
	case "onToggleMap": {
		_changeto = !(uiNamespace getVariable "cti_dialog_ui_basecam_showmap");
		uiNamespace setVariable ["cti_dialog_ui_basecam_showmap", _changeTo];
		
		if (_changeto) then {
			((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177008) ctrlSetText "Hide Map";
			{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlShow true} forEach [177009, 177010];
		} else {
			((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177008) ctrlSetText "Show Map";
			{((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl _x) ctrlShow false} forEach [177009, 177010];
		};
	};
	case "onViewModeChanged": {
		_mode = (uiNamespace getVariable "cti_dialog_ui_basecam_viewmode") + 1;
		if (_mode > 2) then { _mode = 0 };
		uiNamespace setVariable ["cti_dialog_ui_basecam_viewmode", _mode];
		switch (_mode) do { 
			case 1: {_mode = "NVG"; camUseNVG true; false setCamUseTi 0;}; 
			case 2: {_mode = "Thermals"; true setCamUseTi 0; camUseNVG false;}; 
			default {_mode = "Normal"; camUseNVG false; false setCamUseTi 0;};
		};
		((uiNamespace getVariable "cti_dialog_ui_basecam") displayCtrl 177013) ctrlSetText _mode;
	};
	case "onUnload": {
		CTI_BaseCamera cameraEffect["TERMINATE","BACK"];
		camDestroy CTI_BaseCamera;
		showCinemaBorder true;
	};
};