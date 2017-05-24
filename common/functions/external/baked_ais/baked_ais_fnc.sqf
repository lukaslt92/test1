// FILE			:	Baked_AIS_fnc.sqf
// AUTHOR		:	Bakerman
// LAST EDIT	:	15/09/2013
// Version		:	0.1.3
// DESCRIPTION	:	APS functions for Baked_AIS (Armor Improvement System)
// LICENSE		:	GO CRAZY - USE IT - ABUSE IT - CREDIT IF YOU WISH
// MODIFIED     :   OFPS - modified heavily for mission

// Called on "fired" event
FNC_BAPS_FIRED = 
{
	private ["_unit","_weapon","_projectile","_lvossunitsnear","_eraunitsnear"];
	_unit = _this Select 0;
	_weapon = _this Select 1;
	_projectile = _this select 6;
	//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_FIRED</t><br /><br />Unit: <t color='#F5D363'>(%1)</t><br /><br />Weapon: <t color='#F5D363'>(%2)</t><br /><br />Projectile: <t color='#F5D363'>(%1)</t>", _unit, _weapon, __projectile];
	if (_projectile isKindOf "RocketCore" || _projectile isKindOf "MissileCore") then 
	{
		_lvossunitsnear = [];
		{
			if !(isNil {_x getVariable "ammo_left"}) then {
				_lvossunitsnear pushBack _x;
			};
		} forEach (_unit nearEntities [["Car"], CTI_VEHICLES_APS_SCAN_DISTANCE]);
		_eraunitsnear = [];
		{
			if !(isNil {_x getVariable "ammo_left"}) then {
				_eraunitsnear pushBack _x;
			};
		} forEach (_unit nearEntities [["Tank"], CTI_VEHICLES_APS_SCAN_DISTANCE]);
		if (count _lvossunitsnear > 0) then {
			[_projectile, _unit, _lvossunitsnear] call FNC_BAPS_SCAN_SMOKE;
		};
		if (count _eraunitsnear > 0) then {
			[_projectile, _unit, _eraunitsnear] call FNC_BAPS_SCAN;
		};
	};
};
DEPLOY_SHOCK_WAVE = {
	private ["_loc","_aslLoc","_smoke1","_smoke2","_smoke3","_smoke4","_smokes"];
	_loc = _this select 0;
	_aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];
	
	_smoke1 = "#particlesource" createVehicle _aslLoc;
	_smoke1 setposasl _aslLoc;
	_smoke1 setParticleCircle [0, [0, 0, 0]];
	_smoke1 setParticleRandom [0, [8, 8, 2], [30, 30, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smoke1 setDropInterval .0004;
	
	_smoke2 = "#particlesource" createVehicle _aslLoc;
	_smoke2 setposasl _aslLoc;
	_smoke2 setParticleCircle [0, [0, 0, 0]];
	_smoke2 setParticleRandom [0, [8, 8, 2], [30, 30, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.78, .76, .71, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smoke2 setDropInterval .0004;
	
	_smoke3 = "#particlesource" createVehicle _aslLoc;
	_smoke3 setposasl _aslLoc;
	_smoke3 setParticleCircle [0, [0, 0, 0]];
	_smoke3 setParticleRandom [0, [8, 8, 2], [30, 30, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smoke3 setDropInterval .0004;
	
	_smoke4 = "#particlesource" createVehicle _aslLoc;
	_smoke4 setposasl _aslLoc;
	_smoke4 setParticleCircle [0, [0, 0, 0]];
	_smoke4 setParticleRandom [0, [8, 8, 2], [30, 30, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.1, .1, .1, 1], [.2, .2, .2, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smoke4 setDropInterval .0004;
	
	_smokes = [_smoke1, _smoke2, _smoke3, _smoke4];
	
	sleep .07;
	{
		deletevehicle _x;
	} foreach _smokes;
};
DEPLOY_SMOKE_CLOUD = {
	private ["_loc","_aslLoc","_smoke1","_smoke2","_smokes","_upgrade","_smokewave1","_smokewave2","_smokewave3","_smokewave4","_smokewaves"];
	_loc = _this select 0;
	_aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];
	_upgrade = _this select 1;
	
	_smokewave1 = "#particlesource" createVehicle _aslLoc;
	_smokewave1 setposasl _aslLoc;
	_smokewave1 setParticleCircle [0, [0, 0, 0]];
	_smokewave1 setParticleRandom [0, [8, 8, 2], [10, 10, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smokewave1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smokewave1 setDropInterval .0004;
	
	_smokewave2 = "#particlesource" createVehicle _aslLoc;
	_smokewave2 setposasl _aslLoc;
	_smokewave2 setParticleCircle [0, [0, 0, 0]];
	_smokewave2 setParticleRandom [0, [8, 8, 2], [10, 10, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smokewave2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.78, .76, .71, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smokewave2 setDropInterval .0004;
	
	_smokewave3 = "#particlesource" createVehicle _aslLoc;
	_smokewave3 setposasl _aslLoc;
	_smokewave3 setParticleCircle [0, [0, 0, 0]];
	_smokewave3 setParticleRandom [0, [8, 8, 2], [10, 10, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smokewave3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smokewave3 setDropInterval .0004;
	
	_smokewave4 = "#particlesource" createVehicle _aslLoc;
	_smokewave4 setposasl _aslLoc;
	_smokewave4 setParticleCircle [0, [0, 0, 0]];
	_smokewave4 setParticleRandom [0, [8, 8, 2], [10, 10, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
	_smokewave4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.1, .1, .1, 1], [.2, .2, .2, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
	_smokewave4 setDropInterval .0004;
	
	_smoke1 = "#particlesource" createVehicle _aslLoc;
	_smoke1 setposasl _aslLoc;
	_smoke1 setParticleCircle [1.1, [0.4, 0.4, 0.4]];
	_smoke1 setParticleRandom [30, [3, 3, 0.2], [0.01, 0.01, 0.01], 1, 0.25, [0, 0, 0, 0], 0.001, 0.001];
	_smoke1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 0], [0.1, 0.1, 0.1], 1, 1.285, 1, 0, [6, 2, 4], [[0.1, 0.1, 0.1, 0.8], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [1], 0, 0, "", "", _aslLoc];
	_smoke1 setDropInterval 0.13;

	_smokewaves = [_smokewave1, _smokewave2, _smokewave3, _smokewave4];
	sleep .07;
	{
		deletevehicle _x;
	} foreach _smokewaves;
	
	_smokes = [_smoke1];
	//Smoke Cloud Length
	if (_upgrade <= 1) then {sleep 20;} else {sleep 30;};
	{
		deletevehicle _x;
	} foreach _smokes;
};

// Projectile scanning for targets
FNC_BAPS_SCAN_SMOKE =
{
	private ["_projectile","_unit","_vehicleType","_defender","_block","_i","_count","_weaponDir","_weaponDeg","_vehicleDir","_turretDir","_relativeDir","_dir","_fov","_dis","_unitsnear"];
	_projectile = _this Select 0;
	_unit = _this Select 1;
	_unitsnear = _this Select 2;
	//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_SCAN SMOKE</t><br /><br />Unit: <t color='#F5D363'>(%1)</t><br /><br />Units Near: <t color='#F5D363'>(%2)</t><br /><br />Projectile: <t color='#F5D363'>(%3)</t>", _unit, _unitsnear, _projectile];
	//LVOSS scan
	//for "_i" from 0 to ((count _unitsnear)) do
	{ 
		_defender = _x;

		if ((alive _defender) && (count (crew _defender) > 0)) then {
		
		// By default any vehicle with APS may block
		_block = "true";

		_relativeDir = [_defender, _projectile] call BIS_fnc_relativeDirTo;
		if (isNil "_relativeDir") then {_relativeDir = 0;};
		if (_relativeDir < 0) then { _relativeDir = _relativeDir + 360; };	
		// Remove the default blocking
		_block = "false";
		// Set blocking direction and angle limitations
		if (_relativeDir > 0 && _relativeDir < 180) then
		{
			_block = "right";
		};
		if (_relativeDir > 180 && _relativeDir < 360) then
		{
			_block = "left";
		};
		if (_block != "false") then 
		{
			_count = 0;
			// Set the field of fiew of the projectile scanner
			_fov = 1;
			while {_count < 10} do 
			{
				// Scan for vehicles infront of the projectile
				_dir = [_projectile, _defender] call BIS_fnc_relativeDirTo;
				if (isNil "_dir") then {_dir = 0;};
				if (_dir > 330) then 
				{
					_dir = 360 - _dir;
					if (_dir < 0) then { _dir = _dir + 360; };
				};
				_dis = _defender distance _projectile;
				if (_dis < 50) then { _fov = 20 };
				if (_dis < 25) then { _fov = 30 };
				if (_dir > -_fov && _dir < _fov) then 
				{
					[_defender, _projectile, _unit, _block] spawn FNC_BAPS_BLOCK_SMOKE;
					_count = 11;
				} else
				{
					_fov = _fov + 1;
				};
				_count = _count + 1;
				sleep 0.03;
			};
		};
		};
	}foreach _unitsnear;
};
FNC_BAPS_SCAN =
{
	private ["_projectile","_unit","_vehicleType","_defender","_block","_i","_count","_weaponDir","_weaponDeg","_vehicleDir","_turretDir","_relativeDir","_dir","_fov","_dis","_unitsnear","_lvossunitsnear","_eraunitsnear"];
	_projectile = _this Select 0;
	_unit = _this Select 1;
	_unitsnear = _this Select 2;
	//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_SCAN</t><br /><br />Unit: <t color='#F5D363'>(%1)</t><br /><br />Units Near: <t color='#F5D363'>(%2)</t><br /><br />Projectile: <t color='#F5D363'>(%1)</t>", _unit, _unitsnear, _projectile];
	//APS SCAN
	//for "_i" from 0 to ((count _unitsnear)) do
	{ 
		_defender = _x;

		if ((alive _defender) && (count (crew _defender) > 0)) then {
		
		// By default any vehicle with APS may block
		_block = "true";
		// Specific duel APS code for Merkava Mk4
		_vehicleType = typeOf _defender;
		if (_vehicleType == "B_MBT_01_cannon_F") then 
		{
			// Get the direction of the tank's turret
			_weaponDir = _defender weaponDirection "cannon_120mm";
			_weaponDeg = (_weaponDir select 0) atan2 (_weaponDir select 1);
			if (_weaponDeg < 0) then { _weaponDeg = _weaponDeg + 360; };
			_vehicleDir = direction _defender;
			_turretDir = _weaponDeg - _vehicleDir;
			if (_turretDir < 0) then { _turretDir = _turretDir + 360; };
			_relativeDir = [_defender, _projectile] call BIS_fnc_relativeDirTo;
			if (isNil "_relativeDir") then {_relativeDir = 0;};
			_relativeDir = _relativeDir - _turretDir;
			if (_relativeDir < 0) then { _relativeDir = _relativeDir + 360; };	
			// Remove the default blocking
			_block = "false";
			// Set blocking direction and angle limitations
			if (_relativeDir > 0 && _relativeDir < 170) then
			{
				_block = "right";
			};
			if (_relativeDir > 190 && _relativeDir < 360) then
			{
				_block = "left";
			};
		} else {
			_relativeDir = [_defender, _projectile] call BIS_fnc_relativeDirTo;
			if (isNil "_relativeDir") then {_relativeDir = 0;};
			if (_relativeDir < 0) then { _relativeDir = _relativeDir + 360; };	
			// Remove the default blocking
			_block = "false";
			// Set blocking direction and angle limitations
			if (_relativeDir > 0 && _relativeDir < 170) then
			{
				_block = "right";
			};
			if (_relativeDir > 190 && _relativeDir < 360) then
			{
				_block = "left";
			};
		};
		if (_block != "false") then 
		{
			_count = 0;
			// Set the field of fiew of the projectile scanner
			_fov = 1;
			while {_count < 10} do 
			{
				// Scan for vehicles infront of the projectile
				_dir = [_projectile, _defender] call BIS_fnc_relativeDirTo;
				if (isNil "_dir") then {_dir = 0;};
				if (_dir > 330) then 
				{
					_dir = 360 - _dir;
					if (_dir < 0) then { _dir = _dir + 360; };
				};
				_dis = _defender distance _projectile;
				if (_dis < 50) then { _fov = 20 };
				if (_dis < 25) then { _fov = 30 };
				if (_dir > -_fov && _dir < _fov) then 
				{
					[_defender, _projectile, _unit, _block] spawn FNC_BAPS_BLOCK;
					_count = 11;
				} else
				{
					_fov = _fov + 1;
				};
				_count = _count + 1;
				sleep 0.03;
			};
		};
		};
	}foreach _unitsnear;
};
// Threat elimination functions for smoke vehicles
FNC_BAPS_BLOCK_SMOKE =
{
	private ["_defender","_projectile","_unit","_block","_do","_canBlock","_canBlockLeft","_canBlockRight","_speed","_time","_defendDistance","_wait","_sleep","_reloading","_listed","_ammo","_ammoLeft","_ammoRight", "_reloadLeft", "_reloadRight","_toleftside","_torightside","_sfx1","_sfx2","_sfx3","_sfx4","_sfx5","_sfx6","_upgrades","_upgrade_lvoss","_defendConstant_upgrade","_removedammo_l","_removedammo_r"];
	_defender = _this Select 0;
	_projectile = _this Select 1;
	_unit = _this Select 2;
	_block = _this Select 3;
	//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_BLOCK_SMOKE</t><br /><br />Defender: <t color='#F5D363'>(%1)</t><br /><br />Projectile: <t color='#F5D363'>(%2)</t><br /><br />Unit: <t color='#F5D363'>(%3)</t><br /><br />Block: <t color='#F5D363'>(%4)</t>", _defender, _projectile, _unit, _block];
	// By default the vehicle can block from all directions
	_canBlock = true;
	_canBlockLeft = true;
	_canBlockRight = true;
	//---APS system
	_upgrade_lvoss = 0;
	if (count ((side _defender) call CTI_CO_FNC_GetSideUpgrades) > 0) then {
		_upgrades = (side _defender) call CTI_CO_FNC_GetSideUpgrades;
		_upgrade_lvoss = _upgrades select CTI_UPGRADE_LVOSS;
	};
	if (isNil "_upgrade_lvoss") then {_upgrade_lvoss = 0;};
	// Get defender damage
	_damage = getDammage _defender + 1;
	_ammoLeft = _defender getVariable "ammo_left";
	_ammoRight = _defender getVariable "ammo_right";
	_do = 1;
	while {_do == 1} do
	{
		_speed = speed _projectile;
		if (_speed != 0 && alive _projectile) then
		{
			// Calculate the flight time of the projectile
			_dis = _defender distance _projectile;
			_time = _dis / 1000 / _speed * 60 * 60;
			// Ajust defend distance based on speed
			_speedAdjustment = _speed / 110;
			// Constant minimum distance to defend
			_defendConstant = 50;
			//Adjust distance based on side upgrade
			_defendConstant_upgrade = _defendConstant + (_upgrade_lvoss * 50);			
			// Degrade performance for damage
			_degradeDamage = _damage * _damage;
			if (_degradeDamage > 1) then { _degradeDamage = _degradeDamage * 0.6 };
			// Calculate defence distance
			_defendDistance = (_speedAdjustment + _defendConstant_upgrade) / _degradeDamage;
			// Calculate time to wait to reach _defendDistance
			_wait = _defendDistance / 1000 / _speed * 60 * 60; 
			// Set sleep time
			_sleep = _time - _wait;

			// Only activate once the flight time is longer than the wait time
			if (_wait > _sleep) then 
			{
				// Get ammo count
				//_ammoLeft = _defender getVariable "ammo_left";
				//_ammoRight = _defender getVariable "ammo_right";
				//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_BLOCK_SMOKE</t><br /><br />Defender: <t color='#F5D363'>(%1)</t><br /><br />_ammoLeft: <t color='#F5D363'>(%2)</t><br /><br />_ammoRight: <t color='#F5D363'>(%3)</t>", _defender, _ammoLeft, _ammoRight];
				// Get reloading timers
				_reloadLeft = _defender getVariable "reloading_left";
				_reloadRight = _defender getVariable "reloading_right"; 
				
				// Check if the vehicle's APS is reloading on default/left side
				if ((_block == "left" || _block == "true") && _reloadLeft == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicle's APS is reloading on right side
				if (_block == "right" && _reloadRight == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicles's default/left APS has ammo left
				if (_canBlock && (_block == "left" || _block == "true")) then 
				{
					if (_ammoLeft < 1) then
					{
						_canBlock = false;
					};
					if (_ammoLeft > 0) then 
					{
						if (isnil "_removedammo_l") then {
							_defender setVariable ["ammo_left", _ammoLeft - 1, true];
						};
						_removedammo_l = true;
						// Degrade performance for every use
						if (_ammoLeft < 2) then 
						{
							_dDis = (5 / _ammoLeft);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};	
				// Check if the vehicles's right APS has ammo left
				if (_canBlock &&  _block == "right" ) then 
				{
					if (_ammoRight < 1) then
					{
						_canBlock = false;
					};
					if (_ammoRight > 0) then 
					{
						if (isnil "_removedammo_r") then {
							_defender setVariable ["ammo_right", _ammoRight - 1, true];
						};
						_removedammo_r = true;
						// Degrade performance for every use
						if (_ammoLeft < 2) then 
						{
							_dDis = (5 / _ammoLeft);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};
				
				// Destroy the threat
				if (alive _projectile && _canBlock) then 
				{
					// Wait until threat is in range
					sleep _sleep;
					// Remove the threat and create FX
					//deleteVehicle _projectile;
					// Check projectile side
					if (_block == "true" || _block == "left" ) then 
					{
						_toleftside = _defender modelToWorld [-7,0,1];
						//_sfx1 = createVehicle ["SmallSecondary", _toleftside, [], 0, "CAN_COLLIDE"];
						_sfx2 = createVehicle ["CMflareAmmo", _toleftside, [], 0, "CAN_COLLIDE"];
						_sfx3 = createVehicle ["CMflare_Chaff_Ammo", _toleftside, [], 0, "CAN_COLLIDE"];
						//[_toleftside] spawn DEPLOY_SHOCK_WAVE;
						//[_toleftside, _upgrade_lvoss] spawn DEPLOY_SMOKE_CLOUD;
						[_toleftside, _upgrade_lvoss] remoteExec ["CTI_PVF_CLT_APS_SMOKESCREEN"];
					};	
					if (_block == "right") then 
					{
						_torightside = _defender modelToWorld [7,0,1];
						//_sfx4 = createVehicle ["SmallSecondary", _torightside, [], 0, "CAN_COLLIDE"];
						_sfx5 = createVehicle ["CMflareAmmo", _torightside, [], 0, "CAN_COLLIDE"];
						_sfx6 = createVehicle ["CMflare_Chaff_Ammo", _torightside, [], 0, "CAN_COLLIDE"];
						//[_torightside] spawn DEPLOY_SHOCK_WAVE;
						//[_torightside, _upgrade_lvoss] spawn DEPLOY_SMOKE_CLOUD;
						[_torightside, _upgrade_lvoss] remoteExec ["CTI_PVF_CLT_APS_SMOKESCREEN"];

					};
					// Do reload and ammo functions
					if (_block == "true" || _block == "left") then 
					{
						[_defender, _upgrade_lvoss] spawn 
						{ 
							_defender = _this Select 0;
							_upgrade_lvoss = _this Select 1;
							_defender setVariable ["reloading_left", 1, true];
							sleep ((CTI_VEHICLES_LVOSS_COOLDOWN_TIME + 30) - (_upgrade_lvoss * 30));
							_defender setVariable ["reloading_left", 0, true];
						};
					};
					if (_block == "right") then
					{
						[_defender, _upgrade_lvoss] spawn 
						{ 
							_defender = _this Select 0;
							_upgrade_lvoss = _this Select 1;
							_defender setVariable ["reloading_right", 1, true];  
							sleep ((CTI_VEHICLES_LVOSS_COOLDOWN_TIME + 30) - (_upgrade_lvoss * 30));
							_defender setVariable ["reloading_right", 0, true]; 
						};
					};
					// AI behavior
					_defender setBehaviour "DANGER";
					if (_defender != player) then
					{
						[_defender, _unit] spawn { sleep 0.5 ; (_this Select 0) doWatch (_this Select 1); };
					};
				};
				_do = 0;
			};
		};
		sleep 0.01;
	};
};
// Threat elimination functions for APS vehicles
FNC_BAPS_BLOCK =
{
	private ["_defender","_projectile","_unit","_block","_do","_canBlock","_canBlockLeft","_canBlockRight","_speed","_time","_defendDistance","_wait","_sleep","_reloading","_listed","_ammo","_ammoLeft","_ammoRight", "_reloadLeft", "_reloadRight","_upgrades","_upgrade_era","_defendConstant_upgrade","_removedammo_l","_removedammo_r"];
	_defender = _this Select 0;
	_projectile = _this Select 1;
	_unit = _this Select 2;
	_block = _this Select 3;
	//hint parseText format["<t size='1.3' color='#2394ef'>FNC_BAPS_BLOCK</t><br /><br />Defender: <t color='#F5D363'>(%1)</t><br /><br />Projectile: <t color='#F5D363'>(%2)</t><br /><br />Projectile: <t color='#F5D363'>(%3)</t><br /><br />Projectile: <t color='#F5D363'>(%4)</t>", _defender, _projectile, _unit, _block];
	// By default the vehicle can block from all directions
	_canBlock = true;
	_canBlockLeft = true;
	_canBlockRight = true;
	//---APS system
	_upgrade_era = 0;
	if (count ((side _defender) call CTI_CO_FNC_GetSideUpgrades) > 0) then {
		_upgrades = (side _defender) call CTI_CO_FNC_GetSideUpgrades;
		_upgrade_era = _upgrades select CTI_UPGRADE_ERA;
	};
	if (isNil "_upgrade_era") then {_upgrade_era = 0;};
	// Get defender damage
	_damage = getDammage _defender + 1;
	_ammoLeft = _defender getVariable "ammo_left";
	_ammoRight = _defender getVariable "ammo_right";
	_do = 1;
	while {_do == 1} do
	{
		_speed = speed _projectile;
		if (_speed != 0 && alive _projectile) then
		{
			// Calculate the flight time of the projectile
			_dis = _defender distance _projectile;
			_time = _dis / 1000 / _speed * 60 * 60;
			// Ajust defend distance based on speed
			_speedAdjustment = _speed / 110;
			// Constant minimum distance to defend
			_defendConstant = 0;
			_defendConstant_upgrade = 0;
			//Adjust distance based on side upgrade
			if (_upgrade_era <= 2) then {
				//era mode - impact very very close .25m and .50m
				_defendConstant_upgrade = _defendConstant + (_upgrade_era / 4);
			}else {
				//arena mode - destroy before impact 1.5m and 2m
				_defendConstant_upgrade = _defendConstant + (_upgrade_era / 2);
			};
			// Degrade performance for damage
			_degradeDamage = _damage * _damage;
			if (_degradeDamage > 1) then { _degradeDamage = _degradeDamage * 0.6 };
			// Calculate defence distance
			_defendDistance = (_speedAdjustment + _defendConstant_upgrade) / _degradeDamage;
			// Calculate time to wait to reach _defendDistance
			_wait = _defendDistance / 1000 / _speed * 60 * 60; 
			// Set sleep time
			_sleep = _time - _wait;
			
			// Only activate once the flight time is longer than the wait time
			if (_wait > _sleep) then 
			{
				// Get ammo count
				//_ammoLeft = _defender getVariable "ammo_left";
				//_ammoRight = _defender getVariable "ammo_right";
				
				// Get reloading timers
				_reloadLeft = _defender getVariable "reloading_left";
				_reloadRight = _defender getVariable "reloading_right";
				
				// Check if the vehicle's APS is reloading on default/left side
				if ((_block == "left" || _block == "true") && _reloadLeft == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicle's APS is reloading on right side
				if (_block == "right" && _reloadRight == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicles's default/left APS has ammo left
				if (_canBlock && (_block == "left" || _block == "true")) then 
				{
					if (_ammoLeft < 1) then
					{
						_canBlock = false;
					};
					if (_ammoLeft > 0) then 
					{
						if (isnil "_removedammo_l") then {
							_defender setVariable ["ammo_left", _ammoLeft - 1, true];
						};
						_removedammo_l = true;
						// Degrade performance for every use
						if (_ammoLeft < 2) then 
						{
							_dDis = (5 / _ammoLeft);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};	
				// Check if the vehicles's right APS has ammo left
				if (_canBlock &&  _block == "right" ) then 
				{
					if (_ammoRight < 1) then
					{
						_canBlock = false;
					};
					if (_ammoRight > 0) then 
					{
						if (isnil "_removedammo_r") then {
							_defender setVariable ["ammo_right", _ammoRight - 1, true];
						};
						_removedammo_r = true;
						// Degrade performance for every use
						if (_ammoLeft < 2) then 
						{
							_dDis = (5 / _ammoLeft);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};
				
				// Destroy the threat
				if (alive _projectile && _canBlock) then 
				{
					// Wait until threat is in range
					sleep _sleep;
					// Remove the threat and create FX
					deleteVehicle _projectile;
					_sfx = createVehicle ["SmallSecondary", position _projectile, [], 0, "CAN_COLLIDE"];
					//[position _projectile] spawn DEPLOY_SHOCK_WAVE;
					[position _projectile] remoteExec ["CTI_PVF_CLT_APS_SHOCKWAVE"];
					// Do reload and ammo functions
					if (_block == "true" || _block == "left") then 
					{
						[_defender, _upgrade_era] spawn 
						{ 
							_defender = _this Select 0;
							_upgrade_era = _this Select 1;
							_defender setVariable ["reloading_left", 1, true]; 
							sleep ((CTI_VEHICLES_ERA_COOLDOWN_TIME + 30) - (_upgrade_era * 30));
							_defender setVariable ["reloading_left", 0, true]; 
						};
					};
					if (_block == "right") then
					{
						[_defender, _upgrade_era] spawn 
						{ 
							_defender = _this Select 0;
							_upgrade_era = _this Select 1;
							_defender setVariable ["reloading_right", 1, true];
							sleep ((CTI_VEHICLES_ERA_COOLDOWN_TIME + 30) - (_upgrade_era * 30));
							_defender setVariable ["reloading_right", 0, true]; 
						};
					};
					// AI behavior
					_defender setBehaviour "DANGER";
					if (_defender != player) then
					{
						[_defender, _unit] spawn { sleep 0.5 ; (_this Select 0) doWatch (_this Select 1); };
					};
				};
				_do = 0;
			};
		};
		sleep 0.01;
	};
};