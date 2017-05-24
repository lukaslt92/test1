/*
  # HEADER #
	Description:	Fire control of C-RAMs. All targets (Rockets/Missiles, Arty, Mortar and other airborne targets, configurable) within a configurable envelope will be engaged.
					This script occupies all manned C-RAM turrets for the given side.
					Approach:
						- The environment of all CRAM turrets will be scanned for targets regularly
						- If targets appear in "tracking range", they will be assigned to a turret
							- Tt will begin to turn and aim at the target
							- Once target is in "open fire range", it will be fired upon
							- Once the CRAM rounds reach proximity to the target, they will explode and damage/destroy the target
						- Targets are prioritized according to distance to the CRAMs - closest first

  # PARAMETERS #
    0	[Side]: The active side
	
  # SYNTAX #
	[SIDE] spawn HandleCRAM
*/

// --- Configuration ---            // All units denominated in SI (metres, seconds)

// Warning: Configuration also needs to be made in the clientside code CRAMControl_FiredEvent

_proximityForAmmoDestruction = 10;	// When a CRAM shell gets closer than this, incoming ammo will be destroyed
_trackingRange = 2500;				// Turrets will aim, but not fire within this range and _openFireRange
_openFireRange = 1200;
_CRAMClassnames = [
	"O_at_phalanx_35AI",
	"B_at_phalanx_35AI"];
_cramAmmoSpeedMuzzle = 1440;
_targetClasses = ["RocketCore", "ShellCore", "ShellBase", "BombCore", "MissileCore", "Air"];	// If adding clases here, it might need adjustment for hostility detection in the main loop
_scanInterval = 0.2;
// ---------------------

_side = _this select 0;

sleep 1;

FNC_CRAMControl_Log = {
	private _text = "CRAM Control: " + _this;
	//_text remoteExec ["systemChat"];
	//diag_log _text;
}; 

// Aim a turret at target and fire when close enough
FNC_CRAMControl_AimAndFire =
{
	private _cram = _this select 0;
	private _target = _this select 1;
	private _openFireRange = _this select 2;
	private _trackingRange = _this select 3;
	private _cramAmmoSpeedMuzzle = _this select 4;
	private _proximityForAmmoDestruction = _this select 5;
	
	_cram setVariable ["CRAMControl_isBusy", true];
	
	// TOOD: next bit doesnt work, strange effects (arma 3 1.66)  / this is an alternative to manually doing proximity detection and exploding stuff
	// Add proximity simulation target
	//_proxTarget = "SAM_targetSAM_CM" createVehicle [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2) + 10];
	//_proxTarget attachTo [_target, [0,0,1]];
	
	private _aimHelpTarget = "at_phalanx_target" createVehicle [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2) + 20];
	
	private _weaponClass = currentWeapon _cram;	//TODO: selection
	private _skipTarget = false;
	
	private _gunner = gunner _cram;
	// We script all targeting
	_gunner disableAI "AUTOTARGET";
	_gunner disableAI "TARGET";
	_gunner disableAI "FSM";
			
	while {alive _target && !_skipTarget} do
	{
		private _targetDistance = _cram distance _target;
		
		// Calculate needed fire position for CRAM
		_gravityAndDecelerationCorrection = 1.2;
		_cramAmmoSpeedCorrected = _cramAmmoSpeedMuzzle / _gravityAndDecelerationCorrection;
		_timeToTarget = _targetDistance / _cramAmmoSpeedCorrected;
		_targetSpeed = velocity _target;
		// Formula: leadPos = position of projectile + targetSpeed * timeToTarget;
		_aimHelpTarget setPosASL [
			(aimPos _target select 0) + _timeToTarget * (_targetSpeed select 0),
			(aimPos _target select 1) + _timeToTarget * (_targetSpeed select 1),
			(aimPos _target select 2) + _timeToTarget * (_targetSpeed select 2)];
		_cram lookAt position _aimHelpTarget;
		
		if (_targetDistance < _openFireRange) then 
		{
			_aimingQuality = _cram aimedAtTarget [_aimHelpTarget];
			if (_aimingQuality > 0.5 && {!terrainIntersectASL[aimPos _cram, getPosASL _aimHelpTarget]} && {!lineIntersects[aimPos _cram, aimPos _target, _cram, _target]}) then {
				_cram fireAtTarget [_aimHelpTarget, _weaponClass];
			};
			
			// Proximity hit detection and reaction
			_nearRounds = _target nearObjects ["at_phalanx_35mm_AA", _proximityForAmmoDestruction]; //at_phalanx_missile_35mm_AA	//TODO: ammo type for diff turrets
			hintSilent ("Distance: " + str _targetDistance + " Aim: " + str _aimingQuality + ", Proximity: " + str count _nearRounds + ", Lead: " + str (_aimHelpTarget distance _target));
			if( count _nearRounds > 0 ) then {
				
				// Immediately delete all kinds of ammo
				if ((typeof _target) isKindOf ["Default", configFile >> "CfgAmmo"]) then {
					// This will delete the round only server-side. The round is still alive on the client as a different object, and the attcker fired event script should handle it
					deleteVehicle _target;	
				} else {
					// Simulate proximity explosion for a part of the rounds. Leave them a chance for direct hits.
					if (random 1 > 0.5) then {
						{"SmallSecondary" createVehicle position _x; deleteVehicle _x;} forEach _nearRounds;	// Explosion variants: "SmallSecondary", "HelicopterExploSmall"
					};
				};
	
			};
		} else {
			hintSilent ("Distance: " + str _targetDistance);
			if (_targetDistance > _trackingRange) then {
				_skipTarget = true;
			};
		};
		
		sleep 0.001;	// sleep until next frame // TODO: fixme?
	};
	
	deleteVehicle _aimHelpTarget;
	
	_gunner enableAI "AUTOTARGET";
	_gunner enableAI "TARGET";
	_gunner enableAI "FSM";
	
	_gunner lookAt objNull;
	
	_cram setVariable ["CRAMControl_isBusy", false];
};

"Ready" call FNC_CRAMControl_Log;

_targetsInEngagement = [];

// Check for incoming ammo and assign a CRAM turret
while { true } do
{
	// Collect usable CRAM turrets
	_availableCRAMs = [];
	{
		private _g = gunner _x;
		if (side _x == _side && alive _g) then {
			_availableCRAMs pushBack _x
		};
	} forEach entities [_CRAMClassnames, [], false, true];
	
	// Collect CRAM turrest that are ready (not busy firing something)
	_readyCRAMs = [];
	{
		private _busy = _x getVariable "CRAMControl_isBusy";
		if ( isNil "_busy" || {!_busy} ) then {
			_readyCRAMs pushBack _x;
		};
	} forEach _availableCRAMs;
	
	// Check for targets - All CRAMs scan for all objects of given classes around them
	private _confirmedTargets = [];
	{
		private _cram = _x;
		{
			private _class = _x;
			{
				if (alive _x) then {
					private _isHostile = false;
					if ((typeof _x) isKindOf ["Default", configFile >> "CfgAmmo"]) then {
						private _parents = getShotParents _x;
						private _projectileSide = side (_parents select 0);
						_isHostile = [_projectileSide, _side] call BIS_fnc_sideIsEnemy;
					} else {
						if ((typeof _x) isKindOf ["Air", configFile >> "CfgVehicles"]) then {
							if (count crew _x > 0) then {
								_isHostile = [side _x, _side] call BIS_fnc_sideIsEnemy;
							};
						};
					};
					
					if (_isHostile) then {
						_confirmedTargets pushBackUnique _x;
					};
				};
			} forEach (_cram nearObjects [_class, _trackingRange]);
		} forEach _targetClasses;
	} forEach _availableCRAMs;
	
	// Clean _targetsInEngagement
	{
		if (!alive _x || !(_x in _confirmedTargets)) then {
			_targetsInEngagement = _targetsInEngagement - [_x];
		};
	} forEach _targetsInEngagement;
	
	"Scan: "  + str count _readyCRAMs + "/" + str count _availableCRAMs + " CRAMs ready, engaging " + str count _targetsInEngagement + "/" + str count _confirmedTargets + " targets" call FNC_CRAMControl_Log;
	
	// Sort targets, closest to any turret first
	private _confirmedTargetsOrdered = _confirmedTargets apply {
		private _tgt = _x;
		private _shortestDist = _trackingRange;
		{
			if (_x distance _tgt < _shortestDist) then {
				_shortestDist = _x distance _tgt;
			};
		} forEach _availableCRAMs;
		
		[_shortestDist, _x]
	};
	_confirmedTargetsOrdered sort true;
	
	// Assign targets to CRAMs
	{
		private _tgt = _x select 1;
		if ( !(_tgt in _targetsInEngagement) && alive _tgt) then {	// FIXME: isNil _tgt should not happen
			private _bestDist = 0;
			private _bestCRAM = objNull;
			if (count _readyCRAMs > 0) then {
				// Find the closest ready turret to target
				{
					if (_bestDist == 0 || _x distance _tgt < _bestDist) then {
						_bestDist = _x distance _tgt;
						_bestCRAM = _x;
					};
				} forEach _readyCRAMs;
			
				("Assigning target: " + str _tgt + " to turret " + str _bestCRAM) call FNC_CRAMControl_Log;
				_targetsInEngagement pushBack _tgt;
				[_bestCRAM, _tgt, _openFireRange, _trackingRange, _cramAmmoSpeedMuzzle, _proximityForAmmoDestruction] spawn FNC_CRAMControl_AimAndFire;
				_readyCRAMs = _readyCRAMs - [_bestCRAM];
				
				if ((typeof _tgt) isKindOf ["Default", configFile >> "CfgAmmo"]) then {
					//str _side + " C-RAM turrets are engaging an enemy projectile at our base!" remoteExec ["systemChat"];
					//[_bestCRAM,CTI_SOUND_incoming,60] call Common_Say3D; ---> missing sound, see issue #339 
				} else {
					//str _side + " C-RAM turrets are engaging an enemy air object at our base!" remoteExec ["systemChat"];
				};
			} else {
				("No ready turret for target: " + str _tgt) call FNC_CRAMControl_Log;
			};
		};
		
	} forEach _confirmedTargetsOrdered;
	
	sleep _scanInterval;
};