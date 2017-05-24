/*
  # HEADER #
	Script: 		Client\Functions\Client_DisplayMessage.sqf
	Alias:			CTI_CL_FNC_DisplayMessage
	Description:	Display a localize message on the client
					Note that this command is often used by a PVF
	Author: 		Benny
	Creation Date:	19-09-2013
	Revision Date:	19-09-2013
	
  # PARAMETERS #
    0	[String]: The message to use
    1	[Dynamic]: The parameters linked to the message
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[MESSAGE] call CTI_CL_FNC_DisplayMessage
	[MESSAGE, PARAMETERS] call CTI_CL_FNC_DisplayMessage
	
  # DEPENDENCIES #
	Depends on the Message content
	
  # EXAMPLE #
    ["commander-disconnected"] call CTI_CL_FNC_DisplayMessage
	["town-capture", [_town, _value]] call CTI_CL_FNC_DisplayMessage;
	  -> Display some message on the client
	  
	["commander-disconnected"] remoteExec ["CTI_PVF_CLT_OnMessageReceived", east];
	  -> Display a message for the east side via the "CTI_PVF_CLT_OnMessageReceived" PVF
	["teamswap", name player] remoteExec ["CTI_PVF_CLT_OnMessageReceived", CTI_PV_CLIENTS];
	  -> Display a parameterized message for all client via the "CTI_PVF_CLT_OnMessageReceived" PVF
*/

private ["_message_var", "_parameters","_damage_color","_damage_value"];

_message_var = _this select 0;
_parameters = if (count _this > 1) then {_this select 1} else {[]};

switch (_message_var) do {
	case "award-bounty": {player groupChat format ["$%1 awarded for the neutralization of a %2", _parameters select 0, _parameters select 1]};
	case "award-bounty-pvp": {player groupChat format ["$%1 awarded for the neutralization of %2 (%3)", _parameters select 0, _parameters select 1, _parameters select 2]};
	case "award-bounty-basedefense": {CTI_P_ChatID commandChat format ["$%1 awarded for the neutralization of a %2 by our base defenses", _parameters select 0, _parameters select 1]};
	case "award-bounty-basedefense-player": {CTI_P_ChatID commandChat format ["$%1 awarded for the neutralization of %2 (%3) by our base defenses", _parameters select 0, _parameters select 1, _parameters select 2]};
	case "basedefense-kill": {CTI_P_ChatID commandChat format ["Our base defenses have neutralized a %1", _parameters select 0]};
	case "basedefense-kill-player": {CTI_P_ChatID commandChat format ["Our base defenses have neutralized %1 (%2)", _parameters select 0, _parameters select 1]};
	case "award-bounty-structure": {
		player groupChat format ["$%1 awarded for the neutralization of %2 structure", _parameters select 0, _parameters select 1];
	};
	case "award-bounty-defense": {
		player groupChat format ["$%1 awarded for the neutralization of %2 structure", _parameters select 0, _parameters select 1];
	};
	case "build-by": {
		_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _parameters select 1];
		(_parameters select 0) groupChat format ["Constructing %1... %2%3", (_var select 0) select 1, _parameters select 2, "%"];
	};
	case "building-hit": { // see CTI_BASE_DISPLAY_HINT to disable hint.
	// commented line below has support to display a hint to the shooter the enemy structure's base health upgrade
//		hint parseText format ["<t align='center'>Enemy Structure Damaged</t><br />Current Enemy Structure Health: %1%2<br /><t align='center'>Enemy base health upgrade level: %3</t>", _parameters select 0, "%", _parameters select 2];
		hint parseText format ["<t align='center'>Enemy Structure Damaged</t><br /><t align='center'>Current Enemy Structure Health: %1%2</t>", _parameters select 0, "%"];
		sleep 2;
		hint "";//clears the hint off player screen
	};
	case "building-attacked": { // see CTI_BASE_DISPLAY_HINT to disable hint.
		_var = missionNamespace getVariable (_parameters select 0);
		_damage_value = _parameters select 2;
		if (_damage_value >= 70) then { // displays damage as green text

				hint parseText format ["<t color='#ff0000'><t align='center'>%1 Damaged</t></t><br /><t align='center'>At Grid: %2</t><br /><t color='#0ECF0E'><t align='center'>Current Health: %3%4</t></t>", (_var select 0) select 1,mapGridPosition (_parameters select 1), _damage_value, "%"];
		};
		if (_damage_value < 70 && _damage_value >= 30 ) then { // displays damage as orange text

				hint parseText format ["<t color='#ff0000'><t align='center'>%1 Damaged</t></t><br /><t align='center'>At Grid: %2</t><br /><t color='#FF7E00'><t align='center'>Current Health: %3%4</t></t>", (_var select 0) select 1, mapGridPosition (_parameters select 1), _damage_value, "%"];
		};
		if (_damage_value < 30) then {// displays damage as red text

		hint parseText format ["<t color='#ff0000'><t align='center'>%1 Damaged</t></t><br /><t align='center'>At Grid: %2</t><br /><t color='#ff0000'><t align='center'>Current Health: %3%4</t></t>", (_var select 0) select 1, mapGridPosition (_parameters select 1), _damage_value, "%"];
		};

		sleep 10;
		hint "";//clears the hint off player screen
	};
	case "commander-disconnected": {CTI_P_ChatID sideChat "The current commander has left the game"};
	case "commander-vote-end": {
		if (isNull _parameters) then {
			if (missionNamespace getVariable "CTI_AI_TEAMS_ENABLED" > 0) then {
				CTI_P_ChatID commandChat "AI Commander Selected!";
			} else {
				CTI_P_ChatID commandChat "No Commander Selected!";
			};
		} else {
			if (_parameters != group player) then {
				CTI_P_ChatID commandChat format["%1 is the new commander!", name leader _parameters];
			} else {
				CTI_P_ChatID commandChat "You are the new commander!";
			};
		};
	};
	case "commander-vote-start": {
		CTI_P_ChatID commandChat format["%1 has initiated a commander vote!", _parameters];
		if (CTI_DEV_MODE == 0) then {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Commander vote will start in 15 seconds.";
		};
	};//--- Todo, popup system with helper on/off
	case "defense-destroyed": {
		_var = missionNamespace getVariable (_parameters select 0);
		CTI_P_ChatID commandChat format ["A %1 has been destroyed at %2!", (_var select 0), mapGridPosition (_parameters select 1)];
	};
    case "defense-sold": {CTI_P_ChatID commandChat format ["A %1 defense has been sold for $%2", _parameters select 0, _parameters select 1]};
	case "fob-destroyed": {
		CTI_P_ChatID commandChat format ["A %1 FOB has been destroyed at %2!", (_parameters select 0), mapGridPosition (_parameters select 1)];
	};
	case "hq-destroyed": {
		CTI_P_ChatID commandChat "The HQ has been destroyed!";
		playMusic "EventTrack02_F_Curator";
	};
	case "hq-repair": {
		CTI_P_ChatID commandChat "The HQ has been repaired";
		playsound "bobcat_engine_start";
	};
	case "hq-deployed": {
		CTI_P_ChatID commandChat "The HQ has been deployed";
//		playsound "Acts_carFixingWheel"; if sound is recommended, find a better sound
	};
	case "hq-mobilized": {
		CTI_P_ChatID commandChat "The HQ has been mobilized";
		playsound "bobcat_engine_start";
	};
	case "fob-sold": {CTI_P_ChatID commandChat format ["A FOB has been sold at Grid %1", _parameters]};
	case "fob-large-sold": {CTI_P_ChatID commandChat format ["A Large FOB has been sold at Grid %1", _parameters]};
	case "funds-transfer": {
		player groupChat format ["%2 has transfered you $%1", _parameters select 0, name (_parameters select 1) ];
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br /><t color='#55bcfc'>%3</t> transfered <t color='%1'>$%2</t> to you.", CTI_P_Coloration_Money, _parameters select 0, name (_parameters select 1)];
				uiNamespace setVariable ["cti_dialog_ui_transferresourcesmenu_forceupdate", true];
	};
	case "order-taketowns": {_parameters sideChat "Acknowledged.  Advancing on neutral or enemy towns"};
	case "order-takeholdtowns": {_parameters sideChat "Acknowledged.  Advancing on neutral or enemy towns with guard duty"};
	case "order-holdtowns": {_parameters sideChat "Acknowledged.  Proceeding to nearest base or friendly town for guard duty"};
	case "order-sad": {_parameters sideChat "Acknowledged.  Proceeding with a search and destroy mission"};
	case "order-move": {_parameters sideChat "Acknowledged.  Moving to position now"};
	case "order-getin": {_parameters sideChat "Acknowledged.  Taking command of any nearby vehicle(s)"};
	case "order-getout": {_parameters sideChat "Acknowledged.  Disembarking the team from any vehicle(s)"};
	case "order-getinc": {_parameters sideChat "Acknowledged.  Embarking in nearest transport(s)"};
	case "order-getoutc": {_parameters sideChat "Acknowledged.  Disembarking from any transport(s)"};
	case "penalty": {
		_var = missionNamespace getVariable (_parameters select 0);
//		CTI_P_ChatID sideChat format ["A friendly %1 was killed by the %2 group! %2 was fined $%3", _var select CTI_UNIT_LABEL, (_parameters select 1) getVariable ["cti_alias",CTI_PLAYER_DEFAULT_ALIAS], _parameters select 2];
		CTI_P_ChatID sideChat format ["A friendly %1 was killed by  %2! %2 was fined $%3", _var select CTI_UNIT_LABEL, name (_parameters select 1), _parameters select 2];
	};
	case "repair-by": {
		_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _parameters select 1];
		(_parameters select 0) groupChat format ["Repairing %1... %2%3", (_var select 0) select 1, _parameters select 2, "%"];
	};
	case "salvage": {
		_value = if (call CTI_CL_FNC_IsPlayerCommander) then {_parameters select 2} else {_parameters select 1};
		_var = missionNamespace getVariable (_parameters select 0);
		if (_value > 0) then {CTI_P_ChatID sideChat format ["$%2 received for the salvaging of a %1 by your side", _var select CTI_UNIT_LABEL, _value]};
	};
	case "salvage-by": {
		_var = missionNamespace getVariable (_parameters select 0);
		(_parameters select 2) groupChat format ["$%2 awarded for salvaging a %1", _var select CTI_UNIT_LABEL, _parameters select 1];
	};
	case "spot-base": {(_parameters select 0) sideChat format ["Enemy structure found near %1", mapGridPosition(_parameters select 1)]};
	case "spot-unit": {(_parameters select 0) sideChat format ["Enemy presence spotted near %1", mapGridPosition(_parameters select 1)]};
	case "structure-preplaced": {
		_var = missionNamespace getVariable (_parameters select 0);
		CTI_P_ChatID commandChat format ["%1 is ready for construction at grid %2", (_var select 0) select 1, mapGridPosition (_parameters select 1)];
	};
	case "structure-attacked": {
		_var = missionNamespace getVariable (_parameters select 0);
		CTI_P_ChatID commandChat format ["%1 is under attack at grid %2!", (_var select 0) select 1, mapGridPosition (_parameters select 1)];
		playsound "air_raid";
	};
	case "structure-destroyed": {
		player globalChat format ["%1 has destroyed a %2 structure", _parameters select 0, _parameters select 1];
		playsound "vr_shutdown";
	};
	case "structure-sold": {
		CTI_P_ChatID commandChat format ["A %1 structure has been sold at Grid %2", _parameters select 0, _parameters select 1];
		playsound "Simulation_Fatal";
	};
	case "structure-sold-refund": {CTI_P_ChatID commandChat format ["S%1 were received from selling a %2 structure", _parameters select 0, _parameters select 1]};
	case "structure-teamkill-attempt": {
		CTI_P_ChatID commandChat format ["Player %1 from group %2 tried to place an explosive near a friendly %3! (the explosive was removed)", _parameters select 0, _parameters select 1, _parameters select 2];
	};
	case "teamkill": {CTI_P_ChatID sideChat "Watch your fire! you're shooting on friendly!"};
	case "teamswap": {CTI_P_ChatID commandChat format ["Player %1 has been sent back to the lobby after teamswaping", _parameters]};
	case "camp-capture": {
		player groupChat format ["$%1 awarded for the capture of a camp in %2", _parameters select 1, (_parameters select 0) getVariable "cti_town_name"];
	};
	case "town-capture": {
		player groupChat format ["$%1 awarded for the capture of %2", _parameters select 1, (_parameters select 0) getVariable "cti_town_name"];
		playMusic "EventTrack03_F_Curator";
	};
	case "town-capture-blocked": {
		hint parseText format ["<t align='center'><t size='1.2' color='#FCBE18'>%1</t></t><br /><t size='1.1'>Capture Blocked</t><br /><br /><t><t color='#FCBE18'>%2</t> hostile camp held by <t color='#FCBE18'>%3</t> forces detected.</t>", _parameters select 0, _parameters select 1, _parameters select 2];
	};
	case "town-hostilenear": {
		CTI_P_ChatID commandChat format ["Hostile detected near %1", _parameters getVariable "cti_town_name"];
		playsound "Alarm";
	};
	case "base-hostilenear": {
		hint parseText format ["<t align='center'><t size='1.2' color='#FCBE18'>Base Alert</t></t><br /><br /><t><t color='#FCBE18'>%1</t> enemy forces detected near base.</t>", _parameters select 0];
	};
	case "upgrade-ended": {
		CTI_P_ChatID commandChat format ["%1 has been upgraded to level %2", ((missionNamespace getVariable format["CTI_%1_UPGRADES_LABELS", CTI_P_SideJoined]) select (_parameters select 0)) select 0, (_parameters select 1)];
		playMusic "LeadTrack03a_F_EPA";
	};
	case "rank-up": {
		CTI_P_ChatID commandChat format ["%1 ranked up to %2", _parameters select 0, _parameters select 1];
		//player groupChat format ["Rank Up"];
		hint parseText format ["<t align='center'>Rank Up<t size='1.3'> | </t> <t size='1.2' color='#FCBE18'>%1</t></t><br /><br /><t>You gained <t color='#FCBE18'>%2</t> abilities and are now in command of <t color='#FCBE18'>%3</t> soldiers.</t>", _parameters select 1, _parameters select 2, _parameters select 3];
		playMusic "LeadTrack03a_F_EPA";
	};
	case "dev-notification": {
		////DEV DEBUG TESTING HINT NOTIFICATION AREA
		////USAGE: Place where you need it
		////["dev-notification", [_anythinghere]] remoteExec ["CTI_PVF_CLT_OnMessageReceived", CTI_PV_CLIENTS];
		//CTI_P_ChatID commandChat format ["%1 ranked up to %2", _parameters select 0, _parameters select 1];
		//player groupChat format ["Rank Up"];
		hint parseText format ["<t align='center'>DEV NOTIFICATION</t><br /><br /><t>1: <t color='#FCBE18'>%1</t></t><br /><br /><t>2: <t color='#FCBE18'>%2</t></t><br /><br /><t>3: <t color='#FCBE18'>%3</t></t><br /><br /><t>4: <t color='#FCBE18'>%4</t></t><br /><br /><t>5: <t color='#FCBE18'>%5</t></t><br /><br /><t>6: <t color='#FCBE18'>%6</t></t></t>", _parameters select 0, _parameters select 1, _parameters select 2, _parameters select 3, _parameters select 4, _parameters select 5];
	};

	
};