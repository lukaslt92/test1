private ["_target", "_caller", "_model","_price","_veh","_funds","_position","_direction","_vehicle"];

_target=(_this select 0);
_caller=(_this select 1);
_model = (_this select 3) select 0;
_price =(_this select 3) select 1;
_veh=(_this select 3) select 2;
_funds = (group _caller) call CTI_CO_FNC_GetFunds;

if (typeName _model == "ARRAY") then {
	_model=_model select floor(random count _model);
};

if (_funds > _price) then {
	[group _caller, - _price] call CTI_CO_FNC_ChangeFunds;
	_position = [getPos _caller, 5, 25] call CTI_CO_FNC_GetRandomPosition;
	_position = [_position, 25] call CTI_CO_FNC_GetEmptyPosition;
	_direction =[_position, _caller] call CTI_CO_FNC_GetDirTo;
	_vehicle= [_model, _position, _direction, CTI_P_SideJoined, False, false, false] call CTI_CO_FNC_CreateVehicle;
	//["SERVER", "Request_HandleAction", ["empty", [_vehicle,600]]] call CTI_CO_FNC_NetSend;
	sleep 1;
	if (_veh) then { _caller moveindriver _vehicle};
};