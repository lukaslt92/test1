/*
  # HEADER #
	Script: 		Server\Functions\Server_OnBuildingHandleDamage.sqf
	Alias:			CTI_SE_FNC_OnBuildingHandleDamage
	Description:	Triggered by the handleDamage EH whenever a structure get hit
					Note this function shall only be called by an Event Handler (EH)
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	16-10-2013
	
  # PARAMETERS #
    0	[Object]: The hit structure
    1	[Number]: The inflicted damage by the hit
    2	[Object]: The shooter
    3	[Integer]: The Side ID of the structure
    4	[Number]: Damage reduction
    5	[Number]: The structure variable name
    6	[Array]: The position of the structure
	
  # RETURNED VALUE #
	[Number]: The afflicted damage
	
  # SYNTAX #
	[STRUCTURE, DAMAGES, SHOOTER, SIDE ID, DAMAGE REDUCTION, VARIABLE, POSITION] call CTI_SE_FNC_OnBuildingHandleDamage
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideFromID
	Common Function: CTI_CO_FNC_GetSideLogic
	
  # EXAMPLE #
    _structure addEventHandler ["handledamage", format ["[_this select 0, _this select 2, _this select 3, _this select 4, %1, %2, '%3', %4] call CTI_SE_FNC_OnBuildingHandleDamage", (_side) call CTI_CO_FNC_GetSideID, _reduce_damages, _variable, _position]];
*/

private ["_damage", "_damaged", "_ammo", "_logic", "_position", "_reduce_damages", "_shooter", "_multiply_damages", "_side", "_sideID", "_variable", "_upgrades", "_upgrade_basehealth", "_baseratio","_overall_damage","_health"];
diag_log str _this;
_damaged = _this select 0;
_damage = _this select 1;
_shooter = _this select 2;
_ammo = _this select 3;
_sideID = _this select 4;
_reduce_damages = _this select 5;
_variable = _this select 6;
_position = _this select 7;
_multiply_damages = _this select 8;

_side = (_sideID) call CTI_CO_FNC_GetSideFromID;

//Base Health Upgrade
_upgrades = (_side) call CTI_CO_FNC_GetSideUpgrades;
_upgrade_basehealth = _upgrades select CTI_UPGRADE_BASE_HEALTH;
_baseratio = 1;
switch (_upgrade_basehealth) do {
	case 0: {_baseratio = CTI_BASE_HEALTH_MULTIPLIER select 0;};
	case 1: {_baseratio = CTI_BASE_HEALTH_MULTIPLIER select 1;};
	case 2: {_baseratio = CTI_BASE_HEALTH_MULTIPLIER select 2;};
	case 3: {_baseratio = CTI_BASE_HEALTH_MULTIPLIER select 3;};
	case 4: {_baseratio = CTI_BASE_HEALTH_MULTIPLIER select 4;};
};
if (CTI_BASE_NOOBPROTECTION == 1 && side _shooter in [_side, sideEnemy]) exitWith {0};
//Adjust damage for ammo types
//--- Tanks
if ((_ammo isKindOf "ShellBase") || (_ammo isKindOf "ShellCore")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_SHELL;
};
//--- Arty (Has to be Spesific as tanks use same basecore)
if ((_ammo isKindOf "Sh_155mm_AMOS") || (_ammo isKindOf "R_230mm_HE") || (_ammo isKindOf "R_230mm_fly") || (_ammo isKindOf "Mo_cluster_AP") || (_ammo isKindof "ArtilleryRocketCore")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_ARTY;
};
//--- Satchels
if ((_ammo isKindOf "TimeBombCore") || (_ammo isKindOf "PipeBombCore")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_SATCHEL;
};
//--- HE Cannons
if ((_ammo isKindOf "GranadeBase") || (_ammo isKindOf "BulletBase")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_CANNON;
};
//--- Missiles
if ((_ammo isKindOf "MissileCore") || (_ammo isKindOf "MissileBase")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_MISSLE;
};
//--- Explosions
if ((_ammo isKindOf "FuelExplosion") || (_ammo isKindOf "FuelExplosionBig") || (_ammo isKindOf "HelicopterExploSmall") || (_ammo isKindOf "HelicopterExploBig")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_FUEL;
};
//--- Rockets
if (_ammo isKindOf "RocketCore") then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_ROCKETS;
};
//--- Bombs
if ((_ammo isKindOf "BombCore") || (_ammo isKindOf "LaserBombCore") || (_ammo isKindOf "MineCore")) then {
	_damage = _damage * CTI_BASE_DAMAGE_MULTIPLIER_BOMB;
};
if (_reduce_damages > 0 ) then {
	_reduce_damages = _reduce_damages * _baseratio;
	_currentdmg = getDammage _damaged; 
	_damage = _currentdmg + ((_damage - _currentdmg) / _reduce_damages);
} else {
	_multiply_damages = _multiply_damages / _baseratio;
	if (_multiply_damages > 0 ) then {
		_currentdmg = getDammage _damaged; 
		_damage = _currentdmg - (_damage * _multiply_damages);
	} else {
		_currentdmg = getDammage _damaged;
		_damage = _currentdmg + ((_damage - _currentdmg) / _baseratio);
	};
};

_logic = (_side) call CTI_CO_FNC_GetSideLogic;
if (CTI_BASE_DISPLAY_HINT == 1) then{

	_health = (1 - _damage);
	_health = (_health*100);
	_health = [_health,1] call BIS_fnc_cutDecimals; // returns returns _health with 1 decimal place
	if (alive _damaged && !(side _shooter in [_side, sideEnemy])) then {
		["building-hit",[ _health, _upgrade_basehealth]] remoteExec ["CTI_CL_FNC_DisplayMessage",owner _shooter];
	};
};
if (time - (_logic getVariable "cti_structures_lasthit") > 15 && _damage >= 0.02 && alive _damaged) then {
	_logic setVariable ["cti_structures_lasthit", time];
	["structure-attacked",[_variable, _position]] remoteExec ["CTI_CL_FNC_DisplayMessage", _side];
	if (CTI_BASE_DISPLAY_HINT == 1) then{
		["building-attacked",[_variable, _position, _health]] remoteExec ["CTI_PVF_CLT_OnMessageReceived", _side];
	};
};

_damage