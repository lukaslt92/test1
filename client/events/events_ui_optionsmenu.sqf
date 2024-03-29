private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		//--- Units cam available?
		((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130012) ctrlEnable (if CTI_Base_ControlCenterInRange then {true} else {false});
		((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130012) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.21), SafeZoneY + (SafeZoneH * 0.795), SafeZoneW * 0.28, SafeZoneH * 0.04]; ((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130012) ctrlCommit 0;
		
		//--- Sat cam available?
		_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
		_enable = if (CTI_Base_SatelliteInRange && _upgrades select CTI_UPGRADE_SATELLITE > 0) then {true} else {false};
		((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130013) ctrlEnable _enable;
		((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130013) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.21), SafeZoneY + (SafeZoneH * 0.845), SafeZoneW * 0.28, SafeZoneH * 0.04]; ((uiNamespace getVariable "cti_dialog_ui_optionsmenu") displayCtrl 130013) ctrlCommit 0;
		
		execVM "Client\GUI\GUI_OptionsMenu.sqf";
		CTI_P_LastRootMenu = "Options";
	};	
	case "onTransferResourcesPressed": {
		closeDialog 0;
		createDialog "CTI_RscTransferResourcesMenu";
	};	
	case "onVideoSettingsPressed": {
		closeDialog 0;
		createDialog "CTI_RscVideoSettingsMenu";
	};
	case "onOnlineHelpPressed": {
		closeDialog 0;
		createDialog "CTI_RscOnlineHelpMenu";
	};
	case "onUnflipPressed": { //--- Unflip the nearest vehicle
		_vehicle = vehicle player;
		if (player != _vehicle) then {
			if (speed _vehicle < 5 && getPos _vehicle select 2 < 5) then {
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1];
				_vehicle setVelocity [0,0,1];
			};
		} else {
			{
				if (speed _x < 5 && getPos _x select 2 < 5) then {
					_x setPos [getPos _x select 0, getPos _x select 1, 1];
					_x setVelocity [0,0,1];
				};
			} forEach (player nearEntities[["Car","Motorcycle","Ship","Tank"],10]);
		};
	};
	case "onMusicPressed": { //--- Play some music
		player sidechat "lalalalaaaaaaaaaa lalalalaaaaaaaa laaaa";
	};
	case "onServicePressed": {
		closeDialog 0;
		createDialog "CTI_RscServiceMenu";
	};
	case "onAIMicroPressed": {
		closeDialog 0;
		createDialog "CTI_RscAIMicromanagementMenu";
	};
	case "onUnitsCamPressed": {
		if (CTI_Base_ControlCenterInRange) then {
			closeDialog 0;
			createDialog "CTI_RscUnitsCamera";
		};
	};
	case "onSatCamPressed": {
		_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
		if (CTI_Base_SatelliteInRange && _upgrades select CTI_UPGRADE_SATELLITE > 0) then {
			closeDialog 0;
			if (_upgrades select CTI_UPGRADE_SATELLITE > 1) then {
				createDialog "CTI_RscSatelitteCamera";
			} else {
				createDialog "CTI_RscBaseCamera";
			};
		};
	};
	case "onCommanderVotePressed": {
		if (CTI_P_SideLogic getVariable ["cti_votetime", -1] < 0) then { //--- No vote's running
			//--- Request a new vote
			[CTI_P_SideJoined, name player] remoteExec ["CTI_PVF_SRV_RequestCommanderVote", CTI_PV_SERVER];
			
			//--- Close this menu and let the server-to-client PVF open the Vote menu
			closeDialog 0;
			//--- Don't lock this script
			0 spawn {
				(name player) remoteExec ["CTI_PVF_CLT_OnNewCommanderVote", CTI_P_SideJoined];
			};
		} else {
			closeDialog 0;
			createDialog "CTI_RscVoteMenu";
		};
	};
};