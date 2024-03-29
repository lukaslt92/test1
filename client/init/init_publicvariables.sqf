//--- PVF Are store within the mission namespace
with missionNamespace do {
	//--- The client receives HQ actions
	CTI_PVF_CLT_AddHQActions = {
		waitUntil {local _this};
		_this lock 2;
		_this addAction ["<t color='#86F078'>Unlock</t>","Client\Actions\Action_ToggleLock.sqf", [], 99, false, true, '', 'alive _target && locked _target == 2'];
		_this addAction ["<t color='#86F078'>Lock</t>","Client\Actions\Action_ToggleLock.sqf", [], 99, false, true, '', 'alive _target && locked _target == 0'];
	};
	
	//--- The client receives the HQ EH
	CTI_PVF_CLT_AddHQDamagerHandler = {
		_this addEventHandler ["killed", format["[_this select 0, _this select 1, %1] spawn CTI_CL_FNC_OnHQDestroyed", CTI_P_SideID]];
		_this addEventHandler ["handleDamage", format["[_this select 2, _this select 3, %1] call CTI_CO_FNC_OnHQHandleDamage", CTI_P_SideID]];
	};
	
	//--- The client receives supply max warning
	CTI_PVF_CLT_SupplyMaxReached = {
		_supplymax = _this select 0;
		if (call CTI_CL_FNC_IsPlayerCommander) then {
			hint parseText format["<t size='1.3' color='#2394ef'>Information</t><br /><br />Max supply reached <t color='#F5D363'>(%1)</t>, build more supply depots.", _supplymax];
		};
	};
	
	//--- The client receives an Air unit to track
	CTI_PVF_CLT_OnAirUnitTracked = {
		_vehicle = _this;
		
		(_vehicle) spawn CTI_CL_FNC_UpdateAirRadarMarker;
	};
	
	//--- The client receives an Artillery piece to track
	CTI_PVF_CLT_OnArtilleryPieceTracked = {
		_artillery = _this;
		
		_artillery addEventHandler ["Fired", {[_this select 0, _this select 4, _this select 6] spawn CTI_CL_FNC_OnArtilleryFired}];
	};
	
	//--- The client receives an Artillery fire notification
	CTI_PVF_CLT_OnArtilleryPieceFire = {
		_position = _this select 0;
		_direction = _this select 1;
		
		hint parseText format["<t size='1.3' color='#eded23'>Warning</t><br /><br />Hostile Artillery fire detected at grid <t color='#F5D363'>%1</t>.", mapGridPosition _position];
		
		_marker = createMarkerLocal [format ["cti_artradar_hostile_%1", CTI_P_MarkerIterator], _position]; //todo randomize
		CTI_P_MarkerIterator = CTI_P_MarkerIterator + 1;
		_marker setMarkerTypeLocal "mil_arrow2";
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerDirLocal _direction;
		_marker setMarkerSizeLocal [1, 1];
		
		_marker spawn {sleep CTI_BASE_ARTRADAR_MARKER_TIMEOUT; deleteMarkerLocal _this};
	};
	
	//--- The client receives a bounty for killing a structure
	CTI_PVF_CLT_OnBountyStructure = {
		_label = _this select 0;
		_award = _this select 1;
		
		["award-bounty-structure", [_award, _label]] call CTI_CL_FNC_DisplayMessage;
		(_award) call CTI_CL_FNC_ChangePlayerFunds;
	};
	
	//--- The client receives a bounty for killing a defense
	CTI_PVF_CLT_OnBountyDefense = {
		_label = _this select 0;
		_award = _this select 1;
		
		["award-bounty-defense", [_award, _label]] call CTI_CL_FNC_DisplayMessage;
		(_award) call CTI_CL_FNC_ChangePlayerFunds;
	};
	
	//--- The client receives a bounty for killing a unit/vehicle
	CTI_PVF_CLT_OnBountyUnit = {
		_type_killed = _this select 0;
		_award = _this select 1;
		_killed_pname = _this select 2;
		
		_delay = 5 + random 30;
		sleep _delay;
		
		_var = missionNamespace getVariable _type_killed;
		_label = _var select CTI_UNIT_LABEL;
		
		(_award) call CTI_CL_FNC_ChangePlayerFunds;
		if (_killed_pname == "") then {
			["award-bounty", [_award, _label]] call CTI_CL_FNC_DisplayMessage;
		} else {
			["award-bounty-pvp", [_award, _killed_pname, _label]] call CTI_CL_FNC_DisplayMessage;
		};
	};
	
	//--- The client (side commander) receives a bounty for base defense kills
	CTI_PVF_CLT_OnBaseDefensesKill = {
		_type_killed = _this select 0;
		_award = _this select 1;
		_killed_pname = _this select 2;
		
		_var = missionNamespace getVariable _type_killed;
		_label = _var select CTI_UNIT_LABEL;
		
		diag_log "killbounty-debug: EH";
		
		if (call CTI_CL_FNC_IsPlayerCommander) then {
			(_award) call CTI_CL_FNC_ChangePlayerFunds;
			if (_killed_pname == "") then {
				["award-bounty-basedefense", [_award, _label]] call CTI_CL_FNC_DisplayMessage;
			} else {
				["award-bounty-basedefense-player", [_award, _killed_pname, _label]] call CTI_CL_FNC_DisplayMessage;
			};
		} else {	// Notification to players
			if (_killed_pname == "") then {
				["basedefense-kill", [_label]] call CTI_CL_FNC_DisplayMessage;
			} else {
				["basedefense-kill-player", [_killed_pname, _label]] call CTI_CL_FNC_DisplayMessage;
			};
		}
	};
	
	//--- The client receives a Camp Capture notification
	CTI_PVF_CLT_OnCampCaptured = { _this spawn CTI_CL_FNC_OnCampCaptured };
	
	//--- The client receives a Defense notification
	CTI_PVF_CLT_OnDefensePlaced = { CTI_P_LastDefenseBuilt = _this };
	
	//--- The client receives a FOB deployment notification
	CTI_PVF_CLT_OnFOBDeployment = {
		_fob = _this;
		
		_marker = createMarkerLocal [Format ["cti_structure_%1", CTI_P_MarkerIterator], getPos _fob];CTI_P_MarkerIterator = CTI_P_MarkerIterator + 1;
		_marker setMarkerTypeLocal format["%1med", CTI_P_MarkerPrefix];
		_marker setMarkerColorLocal CTI_P_SideColor;
		_marker setMarkerSizeLocal [0.75, 0.75]; 
		_marker setMarkerTextLocal "FOB";
		_fob addAction ["<t color='#e67b09'>FOB: Buy Bike (50$)</t>","Client\Actions\Action_Buy_Town.sqf", ["dbo_CIV_new_bike",50,true], 99, false, true, "", " !CTI_P_PreBuilding && vehicle player == player"];
		//_fob addAction ["<t color='#e67b09'>FOB: Buy Motorcycle (150$)</t>","Client\Actions\Action_Buy_Town.sqf", ["CUP_M1030",150,true], 99, false, true, "", " !CTI_P_PreBuilding && vehicle player == player"];
		_fob addAction ["<t color='#e67b09'>FOB: Buy Quadbike (250$)</t>","Client\Actions\Action_Buy_Town.sqf", ["C_Quadbike_01_F",250,true], 99, false, true, "", " !CTI_P_PreBuilding && vehicle player == player"];
		_fob addAction ["<t color='#e67b09'>FOB: Buy Scooter (150$)</t>","Client\Actions\Action_Buy_Town.sqf", ["sfp_dakota",150,true], 99, false, true, "", " !CTI_P_PreBuilding && vehicle player == player"];
		//_fob addAction ["<t color='#e67b09'>FOB: Buy Mercedes Benz (500$)</t>","Client\Actions\Action_Buy_Town.sqf", ["sfp_mercedes",500,true], 99, false, true, "", " !CTI_P_PreBuilding && vehicle player == player"];
		
		[_fob, _marker] spawn {
			_structure = _this select 0;
			_marker = _this select 1;
			
			waitUntil { sleep 5; !alive _structure };
			
			deleteMarkerLocal _marker;
		};
	};
	
	//--- The client receives a Large FOB deployment notification
	CTI_PVF_CLT_OnLargeFOBDeployment = {
		_fob = _this;
		
		_marker = createMarkerLocal [Format ["cti_structure_%1", CTI_P_MarkerIterator], getPos _fob];CTI_P_MarkerIterator = CTI_P_MarkerIterator + 1;
		_marker setMarkerTypeLocal format["%1med", CTI_P_MarkerPrefix];
		_marker setMarkerColorLocal CTI_P_SideColor;
		_marker setMarkerSizeLocal [0.75, 0.75]; 
		_marker setMarkerTextLocal "LARGE FOB";

		[_fob, _marker] spawn {
			_structure = _this select 0;
			_marker = _this select 1;
			
			waitUntil { sleep 5; !alive _structure };
			
			deleteMarkerLocal _marker;
		};
	};
	
	//--- The client receives a base structure destruction notification
	CTI_PVF_CLT_OnFriendlyStructureDestroyed = { _this spawn CTI_CL_FNC_OnFriendlyStructureDestroyed };
	
	//--- The client receives his Join in Progress gear
	/*CTI_PVF_CLT_OnJIPGearReceived = { 
		if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FUNCTION: CTI_PVF_CLT_OnJIPGearReceived", "The previous loadout has been received and will be equipped"] call CTI_CO_FNC_Log};
		
		[player, _this] call CTI_CO_FNC_EquipUnit 
	};*/
	
	//--- The client receives a message
	CTI_PVF_CLT_OnMessageReceived = { _this spawn CTI_CL_FNC_DisplayMessage };
	
	//--- The client receives a gameover notification
	CTI_PVF_CLT_OnMissionEnding = { _this spawn CTI_CL_FNC_OnMissionEnding };
	
	//--- The client receives a new commander vote
	CTI_PVF_CLT_OnNewCommanderVote = {
		_name = _this;
		
		["commander-vote-start", _name] call CTI_CL_FNC_DisplayMessage;
		
		waitUntil{CTI_P_SideLogic getVariable "cti_votetime" > -1 || !alive player};

		if (alive player) then {
			closeDialog 0;
			createDialog "CTI_RscVoteMenu";
		};
	};
	
	//--- The client receives a Purchase Delegation
	CTI_PVF_CLT_OnPurchaseDelegationReceived = { _this spawn CTI_CL_FNC_OnPurchaseDelegationReceived };
	
	//--- The client receives a Purchase Delegation start
	CTI_PVF_CLT_OnPurchaseDelegationStart = { 
		_req_seed = _this select 0;
		_req_classname = _this select 1;
		_req_target = _this select 2;
		_factory = _this select 3;
		
		_index = -1;
		{ if ((_x select 0) == _req_seed && (_x select 1) == _req_classname) exitWith {_index = _forEachIndex} } forEach CTI_P_PurchaseRequests;
		
		if (_index != -1) then {CTI_P_PurchaseRequests deleteAt _index};
		//todo cash deduction!
		if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FUNCTION: CTI_PVF_CLT_OnPurchaseDelegationStart", format["Removed purchase delegation for [%1] concerning classname [%2] with seed [%3] on factory [%4, (%5)]", _req_target, _req_classname, _req_seed, _factory, _factory getVariable "cti_structure_type"]] call CTI_CO_FNC_Log };
	};
	
	//--- The client receives a purchase cancel order
	CTI_PVF_CLT_OnPurchaseOrderCancelled = {
		_req_seed = _this select 0;
		_req_classname = _this select 1;
		_factory = _this select 2;
		
		_index = -1;
		{ if ((_x select 0) == _req_seed && (_x select 1) == _req_classname) exitWith {_index = _forEachIndex} } forEach CTI_P_PurchaseRequests;
		
		if (_index != -1) then {
			// CTI_P_PurchaseRequests set [_index, "!REMOVE!"];
			// CTI_P_PurchaseRequests = CTI_P_PurchaseRequests - ["!REMOVE!"];
			CTI_P_PurchaseRequests deleteAt _index;
		};
		
		if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FUNCTION: CTI_PVF_CLT_OnPurchaseOrderCancelled", format["Removed queued purchase concerning classname [%1] with seed [%2] on factory [%3, (%4)]", _req_classname, _req_seed, _factory, _factory getVariable "cti_structure_type"]] call CTI_CO_FNC_Log };
	};
	
	//--- The client receives a purchase order
	CTI_PVF_CLT_OnPurchaseOrderReceived = { _this spawn CTI_CL_FNC_OnPurchaseOrderReceived };
	
	//--- The client receives a request answer
	CTI_PVF_CLT_OnRequestAnswered = { _this spawn CTI_UI_Request_OnRequestAnswered };
	
	//--- The client receives a request
	CTI_PVF_CLT_OnRequestReceived = { _this spawn CTI_UI_Request_OnRequestReceived };
	
	//--- The client receives a Server FPS update
	CTI_PVF_CLT_OnServerFPSUpdate = { CTI_P_ServerFPS = _this };
	
	//--- The client receives a spotting notification
	CTI_PVF_CLT_OnSpottedTargetReceived = {
		_position = _this select 0;
		_type = _this select 1;
		_from = _this select 2;
		
		_position = [_position, 5, CTI_AI_TEAMS_OBSERVATION_ACCURACY] call CTI_CO_FNC_GetRandomPosition;
		_markerType = if (_type == "base") then {"mil_warning"} else {"mil_unknown"};
		_marker = createMarkerLocal [Format ["cti_report_%1", CTI_P_MarkerIterator], _position];CTI_P_MarkerIterator = CTI_P_MarkerIterator + 1;
		_marker setMarkerTypeLocal _markerType;
		_marker setMarkerColorLocal "ColorBlack";
		_marker setMarkerSizeLocal [0.5, 0.5]; 
		
		if (_type == "base") then {["spot-base", [_from, _position]] call CTI_CL_FNC_DisplayMessage} else {["spot-unit", [_from, _position]] call CTI_CL_FNC_DisplayMessage};
		
		sleep CTI_AI_TEAMS_OBSERVATION_MARKER_LIFESPAN;
		
		deleteMarkerLocal _marker;
	};
	
	//--- The client receives a structure completion notification
	CTI_PVF_CLT_OnStructureConstructed = { _this spawn CTI_CL_FNC_OnStructureConstructed };
	
	//--- The client receives a structure placement notification
	CTI_PVF_CLT_OnStructurePlaced = { CTI_P_LastStructurePreBuilt = _this };

	//--- The client receives a teamkill penalty
	CTI_PVF_CLT_OnTeamkill = {
		["teamkill"] call CTI_CL_FNC_DisplayMessage;
		if (time - CTI_P_LastTeamkill > 5) then {
			CTI_P_LastTeamkill = time;
			[player, 1] remoteExec ["CTI_PVF_SRV_RequestNoobLogger", CTI_PV_SERVER];
		};
	};
	
	//--- The client receives a Town Capture notification
	CTI_PVF_CLT_OnTownCaptured = { _this spawn CTI_CL_FNC_OnTownCaptured };
	
	//--- The client receives his uberness reward
	CTI_PVF_CLT_OnUbernessReached = { 0 spawn CTI_CL_FNC_OnJailed };
	
	//--- The client receives a ruins removal request
	CTI_PVF_CLT_RemoveRuins = { _this spawn CTI_CL_FNC_RemoveRuins };
	
	//--- The client request a vehicle refuel
	CTI_PVF_CLT_RequestVehicleRefuel = {
		private ["_fuel", "_vehicle"];
		_vehicle = _this select 0;
		_fuel = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleRefuel", format["Performing a refuel operation on [%1] (%2) with a fuel value of [%3]", _vehicle, typeOf _vehicle, _fuel]] call CTI_CO_FNC_Log;
		};
		
		_vehicle setFuel _fuel;
	};
	
	//--- The client requests a vehicle lock
	CTI_PVF_CLT_RequestVehicleLock = {
		private ["_locked", "_vehicle"];
		_vehicle = _this select 0;
		_locked = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleLock", format["Performing a lock operation on [%1] (%2) with a lock value of [%3]", _vehicle, typeOf _vehicle, _locked]] call CTI_CO_FNC_Log;
		};
		
		_vehicle lock _locked;
	};
	
	//--- The client requests a vehicle part(s) repair
	CTI_PVF_CLT_RequestVehicleHitPointsRepair = {
		private ["_damages", "_locked", "_repair", "_vehicle"];
		_vehicle = _this select 0;
		_hitPoints_repair = _this select 1;
		_repair_ammount = CTI_TOOLKIT_HITPOINT_REPAIR_AMMOUNT;
		_repair_ammount_component = 1 - CTI_TOOLKIT_HITPOINT_REPAIR_AMMOUNT;
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleHitPointsRepair", format["Performing a part repair operation on [%1] (%2) with a repair value of [%3]", _vehicle, typeOf _vehicle, _repair_ammount_component]] call CTI_CO_FNC_Log;
		};
		
		{
			_damages = _vehicle getHitPointDamage _x;
			if (_damages > _repair_ammount_component) then {
			
				_vehicle setHitPointDamage [_x, _repair_ammount_component];// 0 is perfect 1 is dead
			};
		} forEach _hitPoints_repair;
		_dammages = getDammage _vehicle;
		if (_dammages > _repair_ammount_component) then {
			_vehicle setVehicleArmor _repair_ammount;// 0 is dead, 1 is perfect
		};
	};
	
	//--- The client requests a vehicle rearm
	CTI_PVF_CLT_RequestVehicleRearm = {
		private ["_amount", "_vehicle"];
		_vehicle = _this select 0;
		_amount = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleRearm", format["Performing a rearm operation on [%1] (%2) with a rearm value of [%3]", _vehicle, typeOf _vehicle, _amount]] call CTI_CO_FNC_Log;
		};
		
		// _vehicle setVehicleAmmoDef _amount;
		_vehicle setVehicleAmmo _amount;
	};
	//--- APS Smoke effects
	CTI_PVF_CLT_APS_SMOKESCREEN = { 
		private ["_loc", "_upgrade"];
		_loc = _this select 0;
		_upgrade = _this select 1;
		[_loc, _upgrade] spawn DEPLOY_SMOKE_CLOUD;
	};
	CTI_PVF_CLT_APS_SHOCKWAVE = { 
		private ["_loc"];
		_loc = _this select 0;
		[_loc] spawn DEPLOY_SHOCK_WAVE;
	};
};