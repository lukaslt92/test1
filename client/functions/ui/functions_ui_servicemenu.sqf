CTI_UI_Service_GetBaseDepots = {
	private ["_available", "_range", "_structures", "_unit"];
	_unit = _this select 0;
	_structures = _this select 1;
	_range = _this select 2;
	
	_available = [];
	{if (_x distance _unit <= _range) then {_available pushBack _x}} forEach _structures;
	
	_available
};

CTI_UI_Service_GetGroupMobileSupports = {
	private ["_available", "_type"];
	_type = _this;
	
	_available = [];
	{
		if !(isNil {_x getVariable "cti_spec"}) then {
			_spec = _x getVariable "cti_spec";
			if (typeName _spec != "ARRAY") then {_spec = [_spec]};
			if (_type in _spec && getPos _x select 2 < 5) then {_available pushBack _x};
		};
	} forEach units player;
	
	_available
};

CTI_UI_Service_RangeStill = {
	private ["_content", "_index", "_match", "_range", "_unit"];
	_unit = _this select 0;
	_content = _this select 1;
	_ranges = _this select 2;
	_index = _this select 3;
	
	_match = [];
	{
		_range = _ranges select _forEachIndex;
		_source = _x select 0;
		_current_index = _forEachIndex;
		
		{
			if !(isNil '_x') then {
				if (alive _x) then {
					if (_x distance _unit <= _range && getPos _x select 2 < 5 && getPos _unit select 2 < 5) then {_match = [_x, _source, _current_index]};
				};
			};
			
			if (count _match > 0) exitWith {};
		} forEach (_x select 1);
		if (count _match > 0) exitWith {};
	} forEach (_content select _index);
	_match
};

CTI_UI_Service_ProcessRepair = {
	private ["_content", "_index", "_label", "_ranges", "_start_at", "_times", "_unit", "_var_classname", "_var_name"];
	_unit = _this select 0;
	_content = _this select 1;
	_ranges = _this select 2;
	_times = _this select 3;
	_index = _this select 4;
	
	_var_name = if (isNil {_unit getVariable "cti_customid"}) then {typeOf _unit} else {missionNamespace getVariable format["CTI_CUSTOM_ENTITY_%1", _unit getVariable "cti_customid"]};
	_var_classname = missionNamespace getVariable _var_name;
	_label = if !(isNil '_var_classname') then {_var_classname select CTI_UNIT_LABEL} else {getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName")};
	
	hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Repairing a <t color='#ccffaf'>%1</t>... Please stand by...", _label];
	
	_start_at = time;
	
	_repair = false;
	while {true} do {
		_ranged = [_unit, _content, _ranges, _index] call CTI_UI_Service_RangeStill;
		if (count _ranged == 0 || !alive _unit) exitWith {};
		
		_operative_index = _ranged select 2;
		_service_time = _times select _operative_index;
		
		if (time - _start_at > _service_time) exitWith {_repair = true};
		
		sleep 1;
	};
	
	if (_repair) then {
		_unit setDammage 0;
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />A <t color='#ccffaf'>%1</t> has been repaired!", _label];
	} else {
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Couldn't finish the repairs on a <t color='#ccffaf'>%1</t>...", _label];
	};
};

CTI_UI_Service_ProcessRearm = {
	private ["_content", "_index", "_label", "_ranges", "_start_at", "_times", "_unit", "_var_classname", "_var_name"];
	_unit = _this select 0;
	_content = _this select 1;
	_ranges = _this select 2;
	_times = _this select 3;
	_index = _this select 4;
	
	_var_name = if (isNil {_unit getVariable "cti_customid"}) then {typeOf _unit} else {missionNamespace getVariable format["CTI_CUSTOM_ENTITY_%1", _unit getVariable "cti_customid"]};
	_var_classname = missionNamespace getVariable _var_name;
	_label = if !(isNil '_var_classname') then {_var_classname select CTI_UNIT_LABEL} else {getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName")};
	if (_unit isKindOf "Air") then {
		{
			_times set [_forEachIndex,_x * CTI_AIR_REARM_RATIO];
		} forEach _times;
	};
	if (_unit isKindOf "B_MBT_01_arty_F" || _unit isKindOf "B_MBT_01_mlrs_F" || _unit isKindOf  "O_MBT_02_arty_F" || _unit isKindOf  "CUP_O_BM21_RU" || _unit isKindOf  "CUP_B_M270_HE_USMC" || _unit isKindOf  "CUP_B_M252_USMC" || _unit isKindOf  "O_T_MBT_02_arty_ghex_F" || _unit isKindOf  "OFPS_SCORCHER" || _unit isKindOf  "OFPS_SANDSTORM" || _unit isKindOf  "CUP_B_M270_DPICM_USMC" || _unit isKindOf  "Meaty_Scorcher_Sn" || _unit isKindOf  "Meaty_Sandstorm_Sn" || _unit isKindOf "sfp_fh77") then {
		{
			_times set [_forEachIndex,_x * CTI_ART_REARM_RATIO];
		} forEach _times;
	};
	if (_unit isKindOf "B_Mortar_01_F" || _unit isKindOf "O_Mortar_01_F" || _unit isKindOf  "CUP_B_M252_USMC" || _unit isKindOf  "CUP_B_2b14_82mm_CDF" || _unit isKindOf  "Podnos 2B14" ) then {
		{
			_times set [_forEachIndex,_x * CTI_MORTAR_REARM_RATIO];
		} forEach _times;
	};
	hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Rearming a <t color='#ccffaf'>%1</t>... Please stand by...", _label];
	// not all air vehicles are rearmed properly if ammo is set to 0 before rearm. see Issue #352
	if (_unit isKindOf "Air") then { //add any classname types that have problems rearming all ammo.
	// do nothing
	} else {
			_unit setVehicleAmmoDef 0;
	};
	// end of not all air vehicles are rearmed properly if ammo is set to 0 before rearm. see Issue #352
	_start_at = time;
	
	_rearm = false;
	while {true} do {
		_ranged = [_unit, _content, _ranges, _index] call CTI_UI_Service_RangeStill;
		if (count _ranged == 0 || !alive _unit) exitWith {};
		
		_operative_index = _ranged select 2;
		_service_time = _times select _operative_index;
		
		if (time - _start_at > _service_time) exitWith {_rearm = true};
		
		sleep 1;
	};
	
	if (_rearm) then {
		[_unit, CTI_P_SideJoined] call CTI_CO_FNC_RearmVehicle;
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />A <t color='#ccffaf'>%1</t> has been rearmed!", _label];
	} else {
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Couldn't finish the rearming of a <t color='#ccffaf'>%1</t>...", _label];
	};
};

CTI_UI_Service_ProcessRefuel = {
	private ["_content", "_index", "_label", "_ranges", "_start_at", "_times", "_unit", "_var_classname", "_var_name"];
	_unit = _this select 0;
	_content = _this select 1;
	_ranges = _this select 2;
	_times = _this select 3;
	_index = _this select 4;
	
	_var_name = if (isNil {_unit getVariable "cti_customid"}) then {typeOf _unit} else {missionNamespace getVariable format["CTI_CUSTOM_ENTITY_%1", _unit getVariable "cti_customid"]};
	_var_classname = missionNamespace getVariable _var_name;
	_label = if !(isNil '_var_classname') then {_var_classname select CTI_UNIT_LABEL} else {getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName")};
	
	hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Refueling a <t color='#ccffaf'>%1</t>... Please stand by...", _label];
	if !(_unit isKindOf "StaticWeapon") then {_unit setFuel 0};
	
	_start_at = time;
	
	_refuel = false;
	while {true} do {
		_ranged = [_unit, _content, _ranges, _index] call CTI_UI_Service_RangeStill;
		if (count _ranged == 0 || !alive _unit) exitWith {};
		
		_operative_index = _ranged select 2;
		_service_time = _times select _operative_index;
		
		if (time - _start_at > _service_time) exitWith {_refuel = true};
		
		sleep 1;
	};
	
	if (_refuel) then {
		if !(_unit isKindOf "StaticWeapon") then {_unit setFuel 1};
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />A <t color='#ccffaf'>%1</t> has been refueled!", _label];
	} else {
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Couldn't finish the refueling of a <t color='#ccffaf'>%1</t>...", _label];
	};
};

CTI_UI_Service_ProcessHeal = {
	private ["_content", "_index", "_label", "_ranges", "_start_at", "_times", "_unit", "_var_classname", "_var_name"];
	_unit = _this select 0;
	_content = _this select 1;
	_ranges = _this select 2;
	_times = _this select 3;
	_index = _this select 4;
	
	_crew = crew _unit;
	_var_name = if (isNil {_unit getVariable "cti_customid"}) then {typeOf _unit} else {missionNamespace getVariable format["CTI_CUSTOM_ENTITY_%1", _unit getVariable "cti_customid"]};
	_var_classname = missionNamespace getVariable _var_name;
	_label = if !(isNil '_var_classname') then {_var_classname select CTI_UNIT_LABEL} else {getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName")};
	
	hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Healing a <t color='#ccffaf'>%1</t>... Please stand by...", _label];
	
	_start_at = time;
	
	_repair = false;
	while {true} do {
		_ranged = [_unit, _content, _ranges, _index] call CTI_UI_Service_RangeStill;
		if (count _ranged == 0 || !alive _unit) exitWith {};
		
		_operative_index = _ranged select 2;
		_service_time = _times select _operative_index;
		
		if (time - _start_at > _service_time) exitWith {_repair = true};
		
		sleep 1;
	};
	
	if (_repair) then {
		if (_unit isKindOf "Man") then {_unit setDammage 0} else {{if (!isNil '_x') then {if (alive _x && _x in crew _unit) then {_x setDammage 0}}} forEach _crew};
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />A <t color='#ccffaf'>%1</t> has been healed!", _label];
	} else {
		hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Couldn't finish the healing of a <t color='#ccffaf'>%1</t>...", _label];
	};
};

CTI_UI_Service_GetPrice = {
	private ["_base_cost", "_cost", "_coefficient", "_unit"];
	_unit = _this select 0;
	_base_cost = _this select 1;
	_coefficient = if (count _this > 2) then {_this select 2} else {-1};
	
	_cost = _base_cost;
	if (!(isNil {missionNamespace getVariable typeOf _unit}) && _coefficient > -1) then {
		_cost = ((missionNamespace getVariable typeOf _unit) select CTI_UNIT_PRICE) * _coefficient;
	};
	if (_unit isKindOf "B_Mortar_01_F" || _unit isKindOf "O_Mortar_01_F" || _unit isKindOf  "CUP_B_M252_USMC" || _unit isKindOf  "CUP_B_2b14_82mm_CDF" || _unit isKindOf  "Podnos 2B14" ) then {
		_cost = 10000;
	};
	
	round(_cost)
};