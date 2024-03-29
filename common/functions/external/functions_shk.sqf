/*
  SHK_buildingpos.sqf
  Shuko of LDD Kyllikki (kyllikki.fi)
  IRC: shuko @ quakenet
  Version: 0.12

  Syntax:
    nul = [position,unitList,radius,priority,height,disableMove,stance,hide] execvm "shk_buildingpos.sqf"
  
  Required Parameters:
    Origo        Position       Position from where building positions are searched for.
    Units        Array          Units to be moved.
  
  Optional Parameters:
    Radius       Integer        Range from the origo to look for building positions. Default is 20.
    Priority     Integer        Building position priority.
                   0:             Random, default value.
                   1:             Ground floor has highest prio, roof positions are last to be filled.
                   2:             Roof has top prio, ground level lowest.
    Height       Array          Filter for positions.
                   [min,max]    Minimum and maximum height from ground for valid positions.
    DisableMove  Boolean        Issues disableai "move" to all units.
    Stance       Boolean        Issues setunitpos "up" to all units.
    Hide         Array          Hiding does not prevent the units from detecting and engaging enemies.
                                It's only meant to be used for preventing the units being detected from far away.
                   Portition    Amount of units to be hidden. Valid values between 0 and 1;
                   Condition    Condition to reveal the hidden units.
    
  Examples:
    nul = [getpos hq,[man1,man2,man3]] execvm "shk_buildingpos.sqf"
    nul = [getpos house,[sniper1,sniper2],20,2] execvm "shk_buildingpos.sqf"
    nul = [getpos house,units grpAlpha,30,0,[1,4]] execvm "shk_buildingpos.sqf"
    nul = [getpos house,bmen1,20,0,[],true,true,[0.5,"SHK_revealHouseUnits"]] execvm "shk_buildingpos.sqf"

  Todo:
    Patrol (switch positions)
    Change prio (for example lower level units moves to roof)
    Position
      object: take pos and dir
      array: [[x,y,z],dir]
    Multiple unit groups per script. [[parameters],[parameters2],[parameters]]
      Goal is to get all units into one _men array.
*/

SHK_Sort = {
	private ["_h","_i","_j","_a","_lo","_hi","_x","_id"];

	_a = _this select 0;  //array to be sorted
	_id = _this select 1; //array item index to be compared
	_lo = _this select 2; //lower index to sort from
	_hi = _this select 3; //upper index to sort to

	_h = nil;             //used to make a do-while loop below
	_i = _lo;
	_j = _hi;
	if (count _a == 0) exitWith {};
	_x = (_a select ((_lo+_hi)/2)) select _id;

	while {isnil "_h" || _i <= _j} do {
		while {(_a select _i) select _id < _x} do {_i=_i+1};
		while {(_a select _j) select _id > _x} do {_j=_j-1};

		if (_i<=_j) then {
			_h = _a select _i;
			_a set [_i, _a select _j];
			_a set [_j, _h];

			_i=_i+1;
			_j=_j-1;
		};
	};

	if (_lo<_j) then {[_a, _id, _lo, _j] call SHK_Sort};
	if (_i<_hi) then {[_a, _id, _i, _hi] call SHK_Sort};
};

SHK_SortArray = {
    [_this select 0, _this select 1, 0, 0 max ((count (_this select 0))-1)] call SHK_Sort;
    _this select 0
};

SHK_BuildingPosExec = {
	private ["_opos","_rad","_side","_bpos","_men"];
	_opos = _this select 0;
	if (typename _opos == typename objNull) then {_opos = getpos _opos};
	_men = _this select 1;
	_rad = if (count _this > 2) then { _this select 2 } else { 20 };
	_side = if (count _this > 7) then { _this select 7 } else { civilian };

	_bpos = [];
	{
		private ["_i","_p"];
		_cti_buildingIsValid = true;
		
		//--- Since CTI is dynamic, we don't want to spawn stuff too close to existing hostile units
		if (_side != civilian) then {
			_cti_entities = _x nearEntities[["Man"], CTI_SHK_BUILDING_SAFE_RANGE];
			if (({_x countSide _cti_entities > 0} count [west, east]) > 0) then {_cti_buildingIsValid = false};
		};
		
		if (_cti_buildingIsValid) then {
			for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
				_bpos set [count _bpos,_p];
			};
		};
	} foreach (nearestObjects [_opos, ["Building"], _rad]);

	// Priority
	private "_prio";
	if (count _this > 3) then {
		_prio = _this select 3;
		_bpos = [_bpos,2] call SHK_SortArray;
	} else {
		_prio = 0;
	};

	// Height
	if (count _this > 4) then {
		if (count (_this select 4) > 0) then {
			private ["_tmp","_min","_max","_h"];
			_tmp = [];
			_min = (_this select 4) select 0;
			_max = (_this select 4) select 1;
			{
				_h = _x select 2;
				if (_h >= _min && _h <= _max) then { _tmp set [count _tmp,_x] };
			} foreach _bpos;
			_bpos = _tmp;
		};
	};

	// DisableMove
	/*private "_disableMove";
	_disableMove = if (count _this > 5) then { _this select 5 } else { false };*/

	// Stance
	private "_stance";
	_stance = if (count _this > 6) then { _this select 6 } else { false };

	private ["_taken","_ind","_pos","_dir"];
	_taken = [];
	{
		while {count _taken < count _bpos} do {
			switch _prio do {
				case 0: { _ind = floor(random count _bpos) }; // random
				case 1: { _ind = count _taken }; // ground floor first
				case 2: { _ind = count _bpos - count _taken - 1 }; // roof first
			};
			if !(_ind in _taken) exitwith {
				_taken set [count _taken,_ind];
				_pos = _bpos select _ind;
				_dir = ((_pos select 0) - (_opos select 0)) atan2 ((_pos select 1) - (_opos select 1));
				if (_dir < 0) then {_dir = _dir + 360};
				// _x setpos _pos;
				_x setPosASL (AGLToASL _pos);
				_x setformdir _dir;
				// if _disableMove then { doStop _x; };
				if _stance then { _x setunitpos "UP" };
			};
		};
	} foreach _men;
};