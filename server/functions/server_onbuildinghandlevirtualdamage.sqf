/*
  # HEADER #
	Script: 		Server\Functions\Server_OnBuildingHandleVirtualDamage.sqf
	Alias:			CTI_SE_FNC_OnBuildingHandleVirtualDamage
	Description:	Triggered by the handleDamage EH whenever a structure get hit
					Note this function shall only be called by an Event Handler (EH).
					The damages are virtual so we return 0 all the time.
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	20-09-2013
	
  # PARAMETERS #
    0	[Object]: The hit structure
    1	[Number]: The inflicted damage by the hit
    2	[Object]: The shooter
    3	[String]: The structure variable name
    4	[Integer]: The Side ID of the structure
    5	[Array]: The structure's position
    6	[Number]: The structure's direction
    7	[Number]: The structure completion speed ratio
    8	[Number]: Damage reduction
	
  # RETURNED VALUE #
	[Number]: The negated afflicted damage
	
  # SYNTAX #
	[STRUCTURE, DAMAGES, SHOOTER, STRUCTURE VARIABLE, SIDE ID, POSITION, DIRECTION, COMPLETION RATIO, POSITION] call CTI_SE_FNC_OnBuildingHandleDamage
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideFromID
	Common Function: CTI_CO_FNC_GetSideLogic
	Server Function: CTI_SE_FNC_OnBuildingDestroyed
	
  # EXAMPLE #
    _structure addEventHandler ["handledamage", format ["[_this select 0, _this select 2, _this select 3, _this select 4, '%1', %2, %3, %4, %5, %6] call CTI_SE_FNC_OnBuildingHandleVirtualDamage", _variable, (_side) call CTI_CO_FNC_GetSideID, _position, _direction, _completion_ratio, _reduce_damages]];
*/

private ["_completion_ratio", "_damage", "_ammo", "_damaged", "_direction", "_logic", "_position", "_reduce_damages", "_multiply_damages", "_shooter", "_side", "_sideID", "_var", "_variable", "_virtual_damages","_overall_damage","_health"];
diag_log str _this;
_damaged = _this select 0;
_damage = _this select 1;
_shooter = _this select 2;
_ammo = _this select 3;
_variable = _this select 4;
_sideID = _this select 5;
_position = _this select 6;
_direction = _this select 7;
_completion_ratio = _this select 8;
_reduce_damages = _this select 9;
_multiply_damages = _this select 10;

_side = (_sideID) call CTI_CO_FNC_GetSideFromID;
_logic = (_side) call CTI_CO_FNC_GetSideLogic;

if (CTI_BASE_NOOBPROTECTION == 1 && side _shooter in [_side, sideEnemy]) exitWith {0};
//--- Base Health Upgrade
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
//--- Adjust damage for ammo types
//--- This is active file that works with base damage 2/17/2017 -Omon

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

//--- Do we have to reduce the damages?
if (_reduce_damages > 0 ) then {
	_reduce_damages = _reduce_damages * _baseratio;
	_damage = _damage / _reduce_damages;
} else {
	_multiply_damages = _multiply_damages / _baseratio;
	if (_multiply_damages > 0 ) then {
		_damage = _damage * _multiply_damages;
	} else {
		_damage = _damage / _baseratio;
	};
};

_virtual_damages = _damaged getVariable "cti_altdmg";
if (isNil '_virtual_damages') then {_virtual_damages = 0};
_virtual_damages = _virtual_damages + _damage;
if (_virtual_damages > 1) then { _virtual_damages = 1 };

_damaged setVariable ["cti_altdmg", _virtual_damages];

if (_virtual_damages >= 1 || !alive _damaged) then {
	_damaged removeAllEventHandlers "handleDamage";
	_damaged setDammage 1;
	
	_var = missionNamespace getVariable _variable;
		if (((_var select 0) select 0) == CTI_HQ_DEPLOY) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {
				["INFORMATION", "FILE: Server\Functions\Server_OnBuildingHandleVirtualDamage.sqf", format["HQ [%1] from side [%2] has been destroyed (virtual damages) by [%3]", _damaged, _side, _shooter]] call CTI_CO_FNC_Log;
			};
			[_damaged, _shooter, _sideID] spawn CTI_SE_FNC_OnHQDestroyed;
		} else {
			if (CTI_Log_Level >= CTI_Log_Information) then {
				["INFORMATION", "FILE: Server\Functions\Server_OnBuildingHandleVirtualDamage.sqf", format["A [%1] structure from side [%2] has been destroyed (virtual damages) by [%3]", ((_var select 0) select 1), _side, _shooter]] call CTI_CO_FNC_Log;
			};
			[_damaged, _shooter, _variable, _sideID, _position, _direction, _completion_ratio] spawn CTI_SE_FNC_OnBuildingDestroyed;
		};
};
_logic = (_side) call CTI_CO_FNC_GetSideLogic;
if (CTI_BASE_DISPLAY_HINT == 1) then {
	_health = (1 - _virtual_damages);
	_health = (_health*100);
	_health = [_health,1] call BIS_fnc_cutDecimals; // returns returns _health with 1 decimal place
	if (alive _damaged && (side _shooter != _side)) then {
		["building-hit",[ _health, _upgrade_basehealth]] remoteExec ["CTI_CL_FNC_DisplayMessage", _shooter];
	};
};
if (time - (_logic getVariable "cti_structures_lasthit") > 5 && _damage >= 0.02 && alive _damaged) then {
	_logic setVariable ["cti_structures_lasthit", time];
	["structure-attacked",[_variable, _position]] remoteExec ["CTI_CL_FNC_DisplayMessage", _side];
	if (CTI_BASE_DISPLAY_HINT == 1) then{
		["building-attacked",[_variable, _position, _health]] remoteExec ["CTI_PVF_CLT_OnMessageReceived", _side];
	};
};


0