//--- PVF Are store within the mission namespace

with missionNamespace do {
	//--- Handle the tires damages 
	CTI_PVF_CO_AddVehicleHandleTiresDamages = {
		_this addEventHandler ["HandleDamage", {_this call CTI_CO_FNC_EXT_HandleTiresDamages}];
	};
	//--- Handle the fuel consumption 
	CTI_PVF_CO_AdvancedFuelConsumption = {
		_vehicle = _this;
		while {alive _vehicle} do {
			_tick = 1;
			if (isengineon _vehicle) then {	
				_rate = CTI_VEHICLES_FUEL_CONSUMPTION_ALL;
				if (_vehicle isKindOf "Tank") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_TANKS;};
				if (_vehicle isKindOf "Helicopter") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_HELIS;};
				if (_vehicle isKindOf "Plane") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_PLANES;};
				if (_vehicle isKindOf "UAV" || _vehicle isKindOf "UGV_01_base_F" || _vehicle isKindOf "O_UCSV_01" || _vehicle isKindOf "B_UCSV_01" || _vehicle isKindOf "B_UCSV_02" || _vehicle isKindOf "B_T_UAV_03_F" || _vehicle isKindOf "O_T_UAV_04_CAS_F") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_UAV;};
				if (_vehicle isKindOf "Ship") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_SHIPS;};
				if !(isNil {_vehicle getVariable "cti_mhq_fuel"}) then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_MHQ;};
				//if (_vehicle isKindOf "BADDASSMOTHER") then {_rate = CTI_VEHICLES_FUEL_CONSUMPTION_SPECIAL;};
				//increase consumption when loaded
				_loadMultiplier = 0.00005;
				//more fuel consumed while fast
				_tooFastRate = 0.00015;
				//less fuel consumed while slow
				_tooSlowRate = 0.00005;
				//calculate rate
				_crew = count( crew _vehicle);
				_load = _crew * _loadMultiplier;
				_speed = speed _vehicle;
				_speedMult = 0;
				if(_speed < 50 ) then { _speedMult = _tooSlowRate; };
				if(_speed > 75 ) then { _speedMult = _tooFastRate; };
				_realLoad = _rate + _load + _speedMult;
				//Debug
				//hint format["Vehicle : %1 \n Crew : %2 \n Load : %3 \n Rate : %4 \n Speedload : %5 \n Realload : %6",_vehicle,_crew,_load,_rate,_speedMult,_realLoad];
				//diag_log format ["FUEL DATA: _rate: %1  - _loadMultiplier: %2 - _tooFastRate: %3 - _tooSlowRate: %4 - _tick: %5", _rate,_loadMultiplier,_tooFastRate,_tooSlowRate,_tick ];
				_vehicle setFuel ( (fuel _vehicle) - _realLoad);
			};
			sleep _tick;
		};
	};
};