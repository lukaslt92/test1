/*
  # HEADER #
	Description:	Adjust skill for players AI

  # PARAMETERS #
    0	[Object]: Unit
	
  # RETURNED VALUE #
	None
	
*/

private ["_unit","_aimingAccuracy","_aimingShake","_aimingSpeed","_spotDistance","_spotTime","_courage","_reloadSpeed","_commanding","_general","_skill","_skill_max","_skill_reward"];
_unit = _this;

_aimingAccuracy = _unit skill "aimingAccuracy";
_aimingShake = _unit skill "aimingShake";
_aimingSpeed = _unit skill "aimingSpeed";
_spotDistance = _unit skill "spotDistance";
_spotTime = _unit skill "spotTime";
_courage = _unit skill "courage";
_reloadSpeed = _unit skill "reloadSpeed";
_commanding = _unit skill "commanding";
_general = _unit skill "general";
_skill = skill _unit; 

//skill value - initial skill around .4 with max being .9 so 10 kills to get max 
_skill_max = 0.9;
_skill_reward = 0;
if (_skill <= _skill_max) then {_skill_reward = 0.1;} else {_skill_reward = 0;};

//set new values
/*_unit setSkill ["aimingAccuracy", (_aimingAccuracy + _skill_reward)];	// Affects how well the AI can lead a target---Affects how accurately the AI estimate range and calculates bullet drop---Affects how well the AI compensates for weapon dispersion---Affects how much the AI will know to compensate for recoil (Higher value = more controlled fire)---Affects how certain the AI must be about its aim on target before opening fire
_unit setSkill ["aimingShake", (_aimingShake + _skill_reward)];	// Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)
_unit setSkill ["aimingSpeed", (_aimingSpeed + _skill_reward)];	// Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)
_unit setSkill ["spotDistance", (_spotDistance + _skill_reward)];	// Affects the AI ability to spot targets within it's visual or audible range and accuracy of the information - higher value=better
_unit setSkill ["spotTime", (_spotTime + _skill_reward)];	// Affects how quick the AI react to death, damage or observing an enemy - higher value=better
_unit setSkill ["courage", (_courage + _skill_reward)];	// Affects unit's subordinates' morale (Higher value = more courage)
_unit setSkill ["reloadSpeed", (_reloadSpeed + _skill_reward)];	// Affects the delay between switching or reloading a weapon (Higher value = less delay)
_unit setSkill ["commanding", (_commanding + _skill_reward)];	// Affects how quickly recognized targets are shared with the group (Higher value = faster reporting)
//_unit setSkill ["general", (_aimingAccuracy + _skill_reward)];	// Raw "Skill", value is distributed to sub-skills unless defined otherwise. Affects the AI's decision making.
*/
_unit setSkill ["general", (_general + _skill_reward)];
//_unit setSkill (_general + _skill_reward);
//_unit setSkill 1;