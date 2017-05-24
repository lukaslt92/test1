_side = _this;

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2], ["InfantryAT", 1], ["InfantryAA", 1, 40, .10], ["InfantryRanged", 1, 60, .05]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 1, 75, .12], ["Mechanized", 1, 90, .15]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["Mechanized", 1, 50], ["AntiAir", 1, 85, .10], ["MechanizedHeavy", 1], ["Armored", 2]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["AirAttack", 1]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["InfantryAT", "InfantryAA"]];

//--- Those are used by the commander to determine the kind of unit an AI team has
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], ["Infantry", "InfantryAT", "InfantryAA", "InfantryRanged"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], ["Motorized"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], ["Mechanized", "MechanizedHeavy", "Armored", "AntiAir"]];
missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], ["AirAttack"]];

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack [["rhsusf_army_ocp_rifleman", 5], ["rhsusf_army_ocp_autorifleman", 2, 80], ["rhsusf_army_ocp_medic", 1], ["rhsusf_army_ucp_riflemanat", 1, 70], ["rhsusf_army_ocp_grenadier", 2, 90], ["rhsusf_army_ocp_sniper", 1, 70], ["rhsusf_army_ocp_marksman", 1, 55]];
_f pushBack CTI_BARRACKS;
_m pushBack 500;
_c pushBack "Infantry";
_s pushBack [];

_v pushBack "InfantryAT";
_t pushBack "Infantry - AT";
_p pushBack [["rhsusf_army_ocp_javelin", 5, 85], ["rhsusf_army_ocp_medic", 1], ["rhsusf_army_ucp_riflemanat", 3, 75]];
_f pushBack CTI_BARRACKS;
_m pushBack 800;
_c pushBack "InfantryAT";
_s pushBack [];

_v pushBack "InfantryAA";
_t pushBack "Infantry - AA";
_p pushBack [["rhsusf_army_ocp_aa", 5, 85], ["rhsusf_army_ocp_medic", 1], ["rhsusf_army_ucp_riflemanat", 2, 60]];
_f pushBack CTI_BARRACKS;
_m pushBack 800;
_c pushBack "InfantryAA";
_s pushBack [];

_v pushBack "InfantryRanged";
_t pushBack "Infantry - Snipers";
_p pushBack [["rhsusf_army_ocp_sniper", 2], ["rhsusf_army_ocp_marksman", 1]];
_f pushBack CTI_BARRACKS;
_m pushBack 900;
_c pushBack "InfantryAdvanced";
_s pushBack [];

// _v pushBack "Motorized";
// _t pushBack "Motorized - Transport";
// _p pushBack [["B_Truck_01_transport_F", 1]];
// _f pushBack CTI_LIGHT;
// _m pushBack 1000;
// _c pushBack "MotorizedTransport";
// _s pushBack [["Transport"], ["TransportFitCargo", 40]];

_v pushBack "Motorized";
_t pushBack "Motorized - MPRAP";
_p pushBack [["rhsusf_m1025_d_m2", 3], ["rhsusf_m1025_d_Mk19", 2, 75]];
_f pushBack CTI_LIGHT;
_m pushBack 1500;
_c pushBack "Motorized";
_s pushBack [];

_v pushBack "Mechanized";
_t pushBack "Mechanized - APC";
_p pushBack [["rhsusf_m113d_usarmy", 1]];
_f pushBack CTI_HEAVY;
_m pushBack 2500;
_c pushBack "Mechanized";
_s pushBack [];

_v pushBack "MechanizedHeavy";
_t pushBack "Mechanized - APC (Heavy)";
_p pushBack [["rhs_m2a2", 1], ["rhs_m2a3_buskiii", 1]];
_f pushBack CTI_HEAVY;
_m pushBack 3000;
_c pushBack "Mechanized";
_s pushBack [];

_v pushBack "Armored";
_t pushBack "Armored - MBT";
_p pushBack [["rhsusf_m1a1fep_d", 1], ["rhsusf_m1a2sep1d_usarmy", 1]];
_f pushBack CTI_HEAVY;
_m pushBack 6500;
_c pushBack "Armored";
_s pushBack [];

_v pushBack "AntiAir";
_t pushBack "Armored - Anti Air";
_p pushBack [["rhs_m6", 1]];
_f pushBack CTI_HEAVY;
_m pushBack 8500;
_c pushBack "AntiAir";
_s pushBack [];

_v pushBack "AirAttack";
_t pushBack "Air - Attack";
_p pushBack [["RHS_AH64D", 1]];
_f pushBack CTI_AIR;
_m pushBack 25000;
_c pushBack "Air";
_s pushBack [];

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";