/*
  # HEADER #
	Script: 		Common\Functions\Common_Log_Gear.sqf
	Alias:			CTI_CO_FNC_Log_Gear_Array
	Description:	Log Gear into the RPT
	Creation Date:	15-02-2017
	Revision Date:	15-02-2017
	
  # PARAMETERS #
    0	[String]: The nature of the event
    1	[String]: The origin of the event (the script/function)
	2	[String]: The message
    3	[Array]: The Gear Array
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[TITLE, SOURCE, MESSAGE] call CTI_CO_FNC_Log_Gear_Array
	
  # EXAMPLE #
   ["DEBUG", "Common\Functions\Common_Log_Gear.sqf", "McFly can't fly", _gear] call CTI_CO_FNC_Log_Gear_Array
   # COMMENTS#
   Use this file to output large gear arrays. Will split gear array into multiple parts then output each part into the log file. Prevents issues where gear array is too large and gets truncated when logging. 
   Gear Array must be in this format [[[""arifle_mk20_aco_pointer_f"",["""",""acc_pointer_ir"",""optic_aco"",""""],[""30rnd_556x45_stanag""]],["""",["""","""","""",""""],[]],[""hgun_p07_f"",["""","""","""",""""],[]]],[[""u_b_combatuniform_mcam"",[""firstaidkit"",""30rnd_556x45_stanag"",""30rnd_556x45_stanag"",""30rnd_556x45_stanag""]],[""v_platecarrier2_rgr"",[""30rnd_556x45_stanag"",""30rnd_556x45_stanag"",""16rnd_9x21_mag"",""16rnd_9x21_mag"",""smokeshell"",""smokeshellgreen"",""chemlight_green"",""chemlight_green""]],[""b_assaultpack_rgr_lat"",[]]],[""h_helmetb_sand"",""""],[["""",""""],[""itemmap"",""itemgps"",""itemradio"",""itemcompass"",""itemwatch""]]]
*/

private ["_geararray", "_log_from", "_log_type","_weapons","_uniform","_vest","_backpack","_gear_slots_1","_gear_slots_2"];

_log_type = _this select 0;
_log_from = _this select 1;
_log_message = _this select 2;
_geararray = _this select 3;
diag_log format["[CTI (%1)] [frameno:%2 | ticktime:%3 | fps:%4] [%5] | Message:%6 GEARARRAY:%7 ", _log_type, diag_frameno, diag_tickTime, diag_fps, _log_from, _log_message, _geararray];
_weapons = _geararray  select 0;
_uniform = _geararray  select 1 select 0;
_vest = _geararray  select 1 select 1;
_backpack = _geararray  select 1 select 2;
_gear_slots_1 = _geararray  select 2;
_gear_slots_2 = _geararray  select 3;


diag_log format["[CTI (%1)] [frameno:%2 | ticktime:%3 | fps:%4] [%5] | Message:%6 Weapons:%7 | Uniform:%8", _log_type, diag_frameno, diag_tickTime, diag_fps, _log_from, _log_message, _weapons, _uniform];
diag_log format["[CTI (%1)] [frameno:%2 | ticktime:%3 | fps:%4] [%5] | Message:%6 Vest:%7", _log_type, diag_frameno, diag_tickTime, diag_fps, _log_message, _log_from, _vest];
diag_log format["[CTI (%1)] [frameno:%2 | ticktime:%3 | fps:%4] [%5] | Message:%6 BackPack:%7", _log_type, diag_frameno, diag_tickTime, diag_fps, _log_message, _log_from,_backpack];
diag_log format["[CTI (%1)] [frameno:%2 | ticktime:%3 | fps:%4] [%5] | Message:%6 GearSlot1:%7 | GearSlot2:%8", _log_type, diag_frameno, diag_tickTime, diag_fps, _log_message, _log_from, _gear_slots_1, _gear_slots_2];


