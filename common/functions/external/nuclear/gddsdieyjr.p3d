private ["_object", "_radius", "_rad1", "_rad2", "_rad3"];

_object = _this select 0;
_radius = _this select 1;
_rad1 = _radius;
_rad2 = _radius / 2;
_rad3 = _radius / 4;

while { alive _object } do
{
  waituntil { player distance _object < _rad1 || ! alive _object };
  if ( player distance _object < _rad1 ) then
  {
	if ( player distance _object < _rad2 ) then
	{
	  if ( player distance _object < _rad3 )
		then {playsound CTI_SOUND_geiger_3}
		else {playsound CTI_SOUND_geiger_2};
	} else {playsound CTI_SOUND_geiger_1};
  };
  sleep random 2;
};