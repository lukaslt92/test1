/*
  # HEADER #
	Description:	Client-side part of C-RAM fire control. This will delete client-side rounds which come close to CRAM rounds
					Contains an event handler for the "Fired" event

*/

// --- Configuration ---            // All units denominated in SI (metres, seconds)

// Warning: Configuration also needs to be made in the serverside code HandleCRAM

_proximityForAmmoDestruction = 30;	// When a CRAM shell gets closer than this, incoming ammo will be destroyed

_CRAMClassnames = [
	"O_at_phalanx_35AI",
	"B_at_phalanx_35AI"];
	
// ---------------------

// Make config available for inside event handler
CRAMControl_CRAMClassnames = _CRAMClassnames;
CRAMControl_proximityForAmmoDestructionAtAttacker = _proximityForAmmoDestruction;


CRAMControl_vehiclesWithEH = [];
CRAMControl_unitsWithEH = [];

// Helper function for debugging only, adds event handlers for all units
FNC_CRAMControl_AddFiredForAll_DEBUG = 
{
	// Add eventhandler to all vehicles and units that don't have them yet
	
	{
		if ( !(_x in CRAMControl_unitsWithEH)) then {
			_x addEventHandler ["Fired",{_this spawn FNC_CRAMControl_AttackerFiredEH}];
			CRAMControl_unitsWithEH pushBack _x;
		};
		
	} forEach allUnits;
	
	{
		if ( !(_x in CRAMControl_vehiclesWithEH)) then {
			_x addEventHandler ["Fired",{_this spawn FNC_CRAMControl_AttackerFiredEH}];
			CRAMControl_vehiclesWithEH pushBack _x;
		};
	} forEach vehicles;
};

FNC_CRAMControl_AttackerFiredEH = 
{
	private ["_unit","_weapon","_projectile","_vehicle"];
	_unit = _this Select 0;
	_projectile = _this select 6;
	_vehicle = _this select 7;
	
	_isCRAMTurret = false;
	{
		if (_vehicle isKindOf _x) then {
			_isCRAMTurret = true;
		};
	} forEach CRAMControl_CRAMClassnames;
	
	if (!_isCRAMTurret) then {
		//hintSilent ("potential attacker firing " + str(_projectile));
		//diag_log ("potential attacker firing " + str(_projectile));
		
		while {alive _projectile} do {
			_nearRounds = _projectile nearObjects ["at_phalanx_35mm_AA", CRAMControl_proximityForAmmoDestructionAtAttacker];
			//_nearRounds1 = _projectile nearObjects ["at_phalanx_35mm_AA", 50];
			//_nearRounds2 = _projectile nearObjects ["at_phalanx_35mm_AA", 100];
			
			//hintSilent ("near: " + str(count _nearRounds) + " / " + str (count _nearRounds1) + " / " + str (count _nearRounds2));
			if( count _nearRounds > 0 ) then {
				// Simulate proximity explosion
				{"SmallSecondary" createVehicle position _x; deleteVehicle _x;} forEach _nearRounds;	// Explosion variants: "SmallSecondary", "HelicopterExploSmall"
				deleteVehicle _projectile;
				//hintSilent ("deleted " + str _projectile);
				//diag_log ("deleted " + str _projectile);
			};
			sleep 0.001;	// sleep until next frame // TODO: fixme?
		};
	};
};
	