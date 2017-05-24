private ["_fuel","_vehicle"];
_vehicle = _this;
_vehicle EngineOn false;
_vehicle setVariable ["Fuel",fuel _vehicle, true];
if (local _vehicle) then {
 	_vehicle setFuel 0; 		
} else { 
	[_vehicle, 0] remoteExec ["CTI_PVF_SRV_RequestVehicleRefuel", CTI_PV_SERVER]; 
};