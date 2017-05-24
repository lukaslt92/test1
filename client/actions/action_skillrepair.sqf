_vehicles = player nearEntities [["Car","Motorcycle","Tank","Ship","Air","StaticWeapon"],5];
if (count _vehicles < 1) exitWith {hint "There are no nearby vehicles to repair"};
_repair_status = true;
scopeName "end";
if (!(_repair_status)) exitWith{};
if (_repair_status) then {
_vehicle = [player, _vehicles] Call CTI_CO_FNC_GetClosestEntity;
_actionTime = switch (true) do {
	case (_vehicle isKindOf "Tank"): {CTI_TOOLKIT_REPAIR_TIME_TANK};// repair times for tracked vehicles
	case (_vehicle isKindOf "Air"): {CTI_TOOLKIT_REPAIR_TIME_AIR};// repair times for air vehicles
	case (_vehicle isKindOf "Car"): {CTI_TOOLKIT_REPAIR_TIME_CAR};// repair times for air vehicles
	case (_vehicle isKindOf "Ship"): {CTI_TOOLKIT_REPAIR_TIME_SHIP};// repair times for air vehicles
   default {CTI_TOOLKIT_REPAIR_TIME_UNKNOWN}
 };
_startTime = time;// current time
_totalTime = time + _actionTime;
_animation = "Acts_carFixingWheel";
//--- Retrieve hitpoints for the given vehicle
_hitPoints = ["HitTurret","HitGun"]; //add these hitpoints to the array, some vehicles will not return these hitpoints in the configs
//-- add any hitpoint to this "_exclude_hitPoints" array to prevent the repairing of these hitpoints.
_exclude_hitPoints = ["HitDuke1","HitDuke2","era_1_hitpoint","era_2_hitpoint","era_3_hitpoint","era_4_hitpoint","era_5_hitpoint","era_6_hitpoint","era_7_hitpoint","era_8_hitpoint","era_9_hitpoint","era_10_hitpoint","era_11_hitpoint","era_12_hitpoint","era_13_hitpoint","era_14_hitpoint","era_15_hitpoint","era_16_hitpoint","era_17_hitpoint","era_18_hitpoint","era_19_hitpoint","era_20_hitpoint","era_21_hitpoint","era_22_hitpoint","era_23_hitpoint","era_24_hitpoint","era_25_hitpoint","era_26_hitpoint","era_27_hitpoint","era_28_hitpoint","era_29_hitpoint","era_30_hitpoint","era_31_hitpoint","era_32_hitpoint","era_33_hitpoint","era_34_hitpoint","era_35_hitpoint","era_36_hitpoint","era_37_hitpoint","era_38_hitpoint","era_39_hitpoint","era_40_hitpoint","era_41_hitpoint","era_42_hitpoint","era_43_hitpoint","era_44_hitpoint","era_45_hitpoint","era_46_hitpoint","era_47_hitpoint","era_48_hitpoint","era_49_hitpoint","era_50_hitpoint","era_51_hitpoint","duke1","duke2","e1","e2","e3","e4","e5","e6","e7","e8","e9","e10","e11","e12","e13","e14","e15","e16","e17","e18","e19","e20","e21","e22","e23","e24","e25","e26","e27","e28","e29","e30","e31","e32","e33","e34","e35","e36","e37","e38","e39","e40","e41","e42","e43","e44","e45","e46","e47","e48","e49","e50","e51"];
configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints", "_hitPoints pushBack configName _x; true", true]; //-- get all hitpoints of the vehicle
_hitPoints_repair =[];
_hitPoints_repair = _hitPoints - _exclude_hitPoints;

CTI_P_ActionRepairNextUse = time + CTI_P_ActionRepairDelay;

waitUntil {

 //    _progressBar progressSetPosition ((time - _startTime)/_actionTime); // Sets the progress position of the progress bar. _progressBar is the progress bar control. 
	 

	 if (!(_vehicle distance player <= 5) || !(alive _vehicle)||!(alive player)) then {
	hint "Unable to repair the vehicle";
	player switchMove "";
		_repair_status = false;
		breakTo "end";
     };
	 if ((player in _vehicle)) then {
	hint "Unable to repair the vehicle";
		_repair_status = false;
		breakTo "end";
     };
	 if (animationState player != _Animation ) then {
          player switchMove _Animation;
          player playMoveNow _Animation;
     };
     (!alive player) || (time >= _totalTime) // if player is dead or passed end time, exit
};
if (time < _totalTime)  then {
	hint "Unable to repair the vehicle";
	player switchMove "";
	_repair_status = false;
	breakTo "end";
};
if (local _vehicle) then {
		[_vehicle, _hitPoints_repair] call CTI_PVF_CLT_RequestVehicleHitPointsRepair;
	} else {
		[_vehicle, _hitPoints_repair] remoteExec ["CTI_PVF_SRV_RequestVehicleHitPointsRepair", CTI_PV_SERVER];
	};
	if (fuel _vehicle < .10) then {
		if (local _vehicle) then {
			_vehicle setFuel .10;
		} else {
			[_vehicle, .10] remoteExec ["CTI_PVF_SRV_RequestVehicleRefuel", CTI_PV_SERVER];
		};
	
};
hint "The vehicle recieved a field repair";
player switchMove "Stand";
};