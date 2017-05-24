/*
  # HEADER #
	Description:	Adjust skill for players vehicle crew

  # PARAMETERS #
    0	[Object]: Unit
	
  # RETURNED VALUE #
	None
	
*/

private ["_unit"];

_unit = _this;

//_unit setSkill ["aimingAccuracy", 1];	// Affects how well the AI can lead a target---Affects how accurately the AI estimate range and calculates bullet drop---Affects how well the AI compensates for weapon dispersion---Affects how much the AI will know to compensate for recoil (Higher value = more controlled fire)---Affects how certain the AI must be about its aim on target before opening fire
//_unit setSkill ["aimingShake", 1];	// Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
//_unit setSkill ["aimingSpeed", 1];	// Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
_unit setSkill ["spotDistance", 0.8];	// Affects the AI ability to spot targets within it's visual or audible range and accuracy of the information - higher value=better
_unit setSkill ["spotTime", 0.8];	// Affects how quick the AI react to death, damage or observing an enemy - higher value=better
//_unit setSkill ["courage", 1];	// Affects unit's subordinates' morale (Higher value = more courage)
//_unit setSkill ["reloadSpeed", 1];	// Affects the delay between switching or reloading a weapon (Higher value = less delay)
_unit setSkill ["commanding", 0.8];	// Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)
//_unit setSkill ["general", 1];	// Raw "Skill", value is distributed to sub-skills unless defined otherwise. Affects the AI's decision making.
//_unit setSkill 1; //sets all