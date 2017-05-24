/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTownGroupsAlive.sqf
	Alias:			CTI_CO_FNC_GetTownGroupsAlive
	Description:	Get the Alive Groups of a town if available
	Author: 		Benny
	Creation Date:	26-04-2016
	Revision Date:	26-04-2016
	
  # PARAMETERS #
    0	[Object]: The town
	
  # RETURNED VALUE #
	[Array]: The Alive town groups
	
  # SYNTAX #
	(TOWN) call CTI_CO_FNC_GetTownGroupsAlive
	
  # EXAMPLE #
    _camps = (StPierre) call CTI_CO_FNC_GetTownGroupsAlive
	  -> Assuming St Pierre has 2 Groups -> [Camp0, Camp1]
*/

private ["_town","_town_groups","_town_groups_alive"];

_town = _this;

_town_groups = (_town) call CTI_CO_FNC_GetTownGroups;
_town_groups_alive = [];
{
	if (count units _x > 0 ) then {_town_groups_alive pushBack _x};
} foreach _town_groups;

if (isNil '_town_groups_alive') then {_town_groups_alive = []};

_town_groups_alive