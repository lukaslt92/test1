/*
  # HEADER #
	Script: 		Common\Functions\Common_Say3D.sqf
	Alias:			Common_Say3D
	Description:	Play sound in 3D from object
	Author: 		OFPS
	Creation Date:	01-01-2017
	Revision Date:	01-01-2017
	
  # PARAMETERS #
    0	[Object]: The Object Source
    1	[Variable]: soundname
	2	[Integer]: Length in seconds
	
  # SYNTAX #
	[OBJECT,SOUNDNAME,DISTANCE] call Common_Say3D;
	
  # EXAMPLE #
    [_bestCRAM,"incoming",60] call Common_Say3D;
*/

private ["_obj","_snd","_distance"];
_obj = _this select 0;    //object
_snd = _this select 1;    //sound
_distance = _this select 2;    //distance
 
// broadcast PV
Radio_Say3D = [_obj,_snd,_distance];
publicVariable "Radio_Say3D";
 
// run on current machine also if not dedi server
if (not isDedicated) then {_obj say3D [_snd,_distance,1]};
 
true