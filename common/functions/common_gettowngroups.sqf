/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTownGroups.sqf
	Alias:			CTI_CO_FNC_GetTownGroups
	Description:	Get the Groups of a town if available
	Author: 		Benny
	Creation Date:	26-04-2016
	Revision Date:	26-04-2016
	
  # PARAMETERS #
    0	[Object]: The town
	
  # RETURNED VALUE #
	[Array]: The town groups
	
  # SYNTAX #
	(TOWN) call CTI_CO_FNC_GetTownGroups
	
  # EXAMPLE #
    _camps = (StPierre) call CTI_CO_FNC_GetTownGroups
	  -> Assuming St Pierre has 2 Groups -> [Camp0, Camp1]
*/

private ["_town","_town_groups","_town_groups_alive"];

_town = _this;

_town_groups = (_town getVariable ["cti_town_occupation_groups", []]) + (_town getVariable ["cti_town_resistance_groups", []]);

if (isNil '_town_groups') then {_town_groups = []};

_town_groups