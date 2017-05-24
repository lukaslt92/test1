// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[],"Common\Functions\External\AL_snowstorm\alias_snowstorm_effect.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;


if (!hasInterface) exitWith {};

//_name_terr = worldName;

sleep 5;

enableCamShake true;


[] spawn {
	while {al_snowstorm_om} do {
		addCamShake [0.3,14,19];
		_tremurici = [CTI_SOUND_tremurat_1,CTI_SOUND_tremurat_2,CTI_SOUND_NoSound,CTI_SOUND_tremurat_3,CTI_SOUND_tremurat_4,CTI_SOUND_rafala_8] call BIS_fnc_selectRandom;
		playSound _tremurici;
// >>>>  tweak the sleep value to increase or decrease time between player's shivering
		sleep 240+random ambient_sounds_al;
	};
};


if (terrain_type_vanilla) then {
	// particule in aer
	while {al_snowstorm_om} do {
	effect_screen = ppEffectCreate ["FilmGrain", 2000]; 
	effect_screen ppEffectEnable true;
	effect_screen ppEffectAdjust [0.1,0.1,0.5,0.1,0.1,true];
	effect_screen ppEffectCommit 0;
	
	_fulg_nea  = "#particlesource" createVehicle [getposasl hunt_alias select 0,getposasl hunt_alias select 1,(getposasl hunt_alias select 2)+10];
	_fulg_nea setDropInterval fulg_p_drop;

	if (vehicle player != player) then {_fulg_nea attachto [vehicle player,[0,0,10]];} else {_fulg_nea attachto [player,[0,0,10]];};
	_fulg_nea setParticleRandom [5, [25, 25, 5], [vitx, vity, -1], 0, 0.1, [0, 0, 0, 0.1], 1, 1];
	_fulg_nea setParticleCircle [0, [vitx, vity, -1]];
	_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, fulg_p_particles], "", "Billboard", 1, 6, [0, 0, 6], [vity,vitx, 0], 3, 1.6, 1, 0.1, [0.09], [[1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];
		
	waitUntil {!finishRotocol};
	deletevehicle _fulg_nea; 

	_fulg_nea  = "#particlesource" createVehicle [getposasl hunt_alias select 0,getposasl hunt_alias select 1,(getposasl hunt_alias select 2)+10];
	if (vehicle player != player) then {_fulg_nea attachto [vehicle player,[0,0,10]];} else {_fulg_nea attachto [player,[0,0,10]];};
	_fulg_nea setParticleRandom [5, [25, 25, 5], [vitx, vity, -1], 0, 0.1, [0, 0, 0, 0.1], 1, 1];
	_fulg_nea setParticleCircle [0, [vitx, vity, -1]];
	_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, fulg_p_particles], "", "Billboard", 1, 6, [0, 0, 6], [vity,vitx, -1], 3, 1.6, 1, 0.1, [0.09], [[1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];	
	_fulg_nea setDropInterval fulg_p_drop;
	
	_alias_local_fog = "#particlesource" createVehicleLocal (getpos vehicle player);
	if (vehicle player != player) then {_alias_local_fog attachto [vehicle player];} else {_alias_local_fog attachto [player];};
	_alias_local_fog setParticleCircle [fulg_p_fog_radius, [3, 3, 0]];
	_alias_local_fog setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
	_alias_local_fog setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [-1, -1, 0], 110, 10.15, 7.9, 0.01, [(fulg_p_fog_scale_multiplier * 10), (fulg_p_fog_scale_multiplier * 10),(fulg_p_fog_scale_multiplier * 20)], [[1, 1, 1, (fulg_p_fog_opacity_multiplier * 0.01)], [1, 1, 1, (fulg_p_fog_opacity_multiplier * (0.05+random 0.05))], [1, 1, 1, 0]], [0.08], 1, 0, "", "", vehicle player];	
	_alias_local_fog setDropInterval alias_drop_fog_factor;
	
	waitUntil {finishRotocol or !al_snowstorm_om};
	deletevehicle _alias_local_fog;
	deletevehicle _fulg_nea; 
	};
	
	effect_screen ppEffectEnable false;
	ppEffectDestroy effect_screen;
	enableCamShake false;

} else {
	while {al_snowstorm_om} do {
		effect_screen = ppEffectCreate ["FilmGrain", 2000]; 
		effect_screen ppEffectEnable true;
		effect_screen ppEffectAdjust [0.1,0.1,0.5,0.1,0.1,true];
		effect_screen ppEffectCommit 0;
		
		_fulg_nea  = "#particlesource" createVehicle [getposasl hunt_alias select 0,getposasl hunt_alias select 1,(getposasl hunt_alias select 2)+10];
		_fulg_nea setDropInterval fulg_p_drop;

		if (vehicle player != player) then {_fulg_nea attachto [vehicle player,[0,0,10]];} else {_fulg_nea attachto [player,[0,0,10]];};
		_fulg_nea setParticleRandom [5, [25, 25, 5], [vitx, vity, -1], 0, 0.1, [0, 0, 0, 0.1], 1, 1];
		_fulg_nea setParticleCircle [0, [vitx, vity, -1]];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, fulg_p_particles], "", "Billboard", 1, 6, [0, 0, 6], [vity,vitx, 0], 3, 1.6, 1, 0.1, [0.09], [[1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];
			
		waitUntil {!finishRotocol};
		deletevehicle _fulg_nea; 

		_fulg_nea  = "#particlesource" createVehicle [getposasl hunt_alias select 0,getposasl hunt_alias select 1,(getposasl hunt_alias select 2)+10];
		if (vehicle player != player) then {_fulg_nea attachto [vehicle player,[0,0,10]];} else {_fulg_nea attachto [player,[0,0,10]];};
		_fulg_nea setParticleRandom [5, [25, 25, 5], [vitx, vity, -1], 0, 0.1, [0, 0, 0, 0.1], 1, 1];
		_fulg_nea setParticleCircle [0, [vitx, vity, -1]];
		_fulg_nea setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, fulg_p_particles], "", "Billboard", 1, 6, [0, 0, 6], [vity,vitx, -1], 3, 1.6, 1, 0.1, [0.09], [[1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle player];	
		_fulg_nea setDropInterval fulg_p_drop;
		
		_alias_local_fog = "#particlesource" createVehicleLocal (getpos vehicle player);
		if (vehicle player != player) then {_alias_local_fog attachto [vehicle player];} else {_alias_local_fog attachto [player];};
		_alias_local_fog setParticleCircle [fulg_p_fog_radius, [3, 3, 0]];
		_alias_local_fog setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [-1, -1, 0], 100, 10.15, 7.9, 0.2, [(fulg_p_fog_scale_multiplier * 14), (fulg_p_fog_scale_multiplier * 14), (fulg_p_fog_scale_multiplier * 24)], [[1, 1, 1, (fulg_p_fog_opacity_multiplier * 0.01)], [1, 1, 1, (fulg_p_fog_opacity_multiplier * (0.05+random 0.15))], [1, 1, 1, 0]], [0.08], 1, 0, "", "", vehicle player];	
		_alias_local_fog setDropInterval alias_drop_fog_factor;
		
		waitUntil {finishRotocol or !al_snowstorm_om};
		deletevehicle _alias_local_fog;
		deletevehicle _fulg_nea; 
	};

	//deletevehicle _alias_local_fog;
	effect_screen ppEffectEnable false;
	ppEffectDestroy effect_screen;
	enableCamShake false;
};