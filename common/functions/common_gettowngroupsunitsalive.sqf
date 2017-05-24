/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTownGroupsUnitsAlive.sqf
	Alias:			CTI_CO_FNC_GetTownGroupsUnitsAlive
	Description:	Get the Alive Units Groups of a town if available
	Author: 		Benny
	Creation Date:	26-04-2016
	Revision Date:	26-04-2016
	
  # PARAMETERS #
    0	[Object]: The town
	
  # RETURNED VALUE #
	[Array]: The Alive Units town groups
	
  # SYNTAX #
	(TOWN) call CTI_CO_FNC_GetTownGroupsUnitsAlive
	
  # EXAMPLE #
    _camps = (StPierre) call CTI_CO_FNC_GetTownGroupsUnitsAlive
	  -> Assuming St Pierre has 2 Groups -> [Camp0, Camp1]
*/

private ["_town","_town_groups","_town_groups_units","_live"];

_town = _this;
_town_groups = (_town) call CTI_CO_FNC_GetTownGroupsAlive;

_town_groups_units = [];
{
	if !(isNull _x) then {
		_live = _x call CTI_CO_FNC_GetLiveUnits;
		_town_groups_units = _town_groups_units + _live;
	};
} foreach _town_groups;

if (isNil '_town_groups_units') then {_town_groups_units = []};

_town_groups_units
