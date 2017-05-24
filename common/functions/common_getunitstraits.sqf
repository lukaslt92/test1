/*
  # HEADER #
	Script: 		Common\Functions\Common_GetUnitsTraits.sqf
	Alias:			CTI_CO_FNC_GetUnitsTraits
	Description:	Retrieve the traits of a given unit
	Author: 		OFPS
	Creation Date:	1-1-2017
	Revision Date:	1-1-2017
	
  # PARAMETERS #
    0	[Array]: The units
	
  # RETURNED VALUE #
	[Integer]: The sum of units' Traits
	
  # SYNTAX #
	(SIDE) call CTI_CO_FNC_GetUnitsTraits
	
  # EXAMPLE #
    _score = (player) call CTI_CO_FNC_GetUnitsTraits
	  -> Return the units Traits(or 0 in SP)
*/

private ["_logic", "_traits", "_score"];

_trait_medic = _this getUnitTrait "Medic";
_trait_engineer = _this getUnitTrait "Engineer";
_trait_explosive = _this getUnitTrait "explosiveSpecialist";
_trait_hacker = _this getUnitTrait "UAVHacker";

_traits = [];
if (_trait_medic) then {_traits pushBack "Medic"};
if (_trait_engineer) then {_traits pushBack "Engineer"};
if (_trait_explosive) then {_traits pushBack "explosiveSpecialist"};
if (_trait_hacker) then {_traits pushBack "UAVHacker"};

_traits