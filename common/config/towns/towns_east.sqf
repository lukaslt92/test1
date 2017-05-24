with missionNamespace do {
	EAST_TOWNS_FLAG_TEXTURE = "\A3\Data_F\Flags\Flag_red_CO.paa";
	
if (CTI_TOWNS_OCCUPATION_EAST == 0) then { 
//--- VANILLA TOWN OCCUPATION
	//--- Infantry
	EAST_SOLDIER = "O_Soldier_F";
	EAST_SOLDIER_AA = "O_soldier_AA_F";
	EAST_SOLDIER_AR = "O_Soldier_AR_F";
	EAST_SOLDIER_AT = "O_Soldier_LAT_F";
	EAST_SOLDIER_CREW = "O_crew_F";
	EAST_SOLDIER_LAT = "O_Soldier_LAT_F";
	EAST_SOLDIER_HAT = "O_Soldier_AT_F";
	EAST_SOLDIER_ENGINEER = "O_engineer_F";
	EAST_SOLDIER_EXP = "O_Soldier_exp_F";
	EAST_SOLDIER_GL = "O_Soldier_GL_F";
	EAST_SOLDIER_MEDIC = "O_medic_F";
	EAST_SOLDIER_MG = "O_Soldier_AR_F";
	EAST_SOLDIER_PILOT = "O_helipilot_F";
	EAST_SOLDIER_SNIPER = "O_Soldier_M_F";
	EAST_SOLDIER_TEAMLEADER = "O_Soldier_TL_F";
	EAST_SOLDIER_SQUADLEADER = "O_Soldier_SL_F";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["O_G_Offroad_01_armed_F"];
	EAST_VEHICLE_LIGHT2 = ["O_MRAP_02_F"];
	EAST_VEHICLE_LIGHT3 = ["O_MRAP_02_hmg_F"];
	EAST_VEHICLE_LIGHT4 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT5 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT6 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT7 = ["O_MRAP_02_gmg_F"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["O_APC_Wheeled_02_rcws_F"];
	EAST_VEHICLE_APC2 = ["O_APC_Tracked_02_cannon_F"];
	EAST_VEHICLE_APC3 = ["O_APC_Tracked_02_cannon_F"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["O_MBT_02_cannon_F"];	
	EAST_VEHICLE_ARMORED2 = ["O_MBT_02_cannon_F"];
	EAST_VEHICLE_ARMORED3 = ["O_MBT_02_cannon_F"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["O_APC_Tracked_02_AA_F"];
	EAST_VEHICLE_AA2 = ["O_APC_Tracked_02_AA_F"];
	EAST_VEHICLE_AA3 = ["O_APC_Tracked_02_AA_F"];
	//--- Air
	EAST_AIR_HELI1 = ["O_Heli_Light_02_F"];
	EAST_AIR_HELI2 = ["O_Heli_Light_02_v2_F"];
	EAST_AIR_HELI_ATTACK = ["O_Heli_Attack_02_F"];
	EAST_AIR_AA = [""];
	EAST_AIR_CAS = ["O_Plane_CAS_02_F"];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
};
if (CTI_TOWNS_OCCUPATION_EAST == 1) then { 
//--- CUP - Russians TOWN OCCUPATION
	//--- Infantry
	EAST_SOLDIER = "CUP_O_RU_Soldier";
	EAST_SOLDIER_AA = "CUP_O_RU_Soldier_AA";
	EAST_SOLDIER_AR = "CUP_O_RU_Soldier_AR";
	EAST_SOLDIER_AT = "CUP_O_RU_Soldier_AT";
	EAST_SOLDIER_CREW = "CUP_O_RU_Crew";
	EAST_SOLDIER_LAT = "CUP_O_RU_Soldier_AT";
	EAST_SOLDIER_HAT = "CUP_O_RU_Soldier_HAT";
	EAST_SOLDIER_ENGINEER = "CUP_O_RU_Engineer";
	EAST_SOLDIER_EXP = "CUP_O_RU_Explosive_Specialist";
	EAST_SOLDIER_GL = "CUP_O_RU_Soldier_TL";
	EAST_SOLDIER_MEDIC = "CUP_O_RU_Medic";
	EAST_SOLDIER_MG = "CUP_O_RU_Soldier_AR";
	EAST_SOLDIER_PILOT = "CUP_O_RU_Pilot";
	EAST_SOLDIER_SNIPER = "CUP_O_RU_Sniper_KSVK";
	EAST_SOLDIER_TEAMLEADER = "CUP_O_RU_Commander";
	EAST_SOLDIER_SQUADLEADER = "CUP_O_RU_Commander";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["CUP_O_UAZ_MG_CSAT"];
	EAST_VEHICLE_LIGHT2 = ["OFPS_LR_MG"];
	EAST_VEHICLE_LIGHT3 = ["CUP_O_BTR40_MG_TKA"];
	EAST_VEHICLE_LIGHT4 = ["CUP_O_GAZ_Vodnik_AGS_RU"];
	EAST_VEHICLE_LIGHT5 = ["CUP_O_BRDM2_CSAT"];
	EAST_VEHICLE_LIGHT6 = ["CUP_O_BTR60_CSAT"];
	EAST_VEHICLE_LIGHT7 = ["CUP_O_BTR90_RU"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["CUP_O_BMP1_CSAT"];
	EAST_VEHICLE_APC2 = ["CUP_O_BMP2_CSAT"];
	EAST_VEHICLE_APC3 = ["OFPS_BMP3"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["CUP_O_BMP2_ZU_TKA"];	
	EAST_VEHICLE_ARMORED2 = ["CUP_O_T55_CSAT"];
	EAST_VEHICLE_ARMORED3 = ["CUP_O_T72_CSAT"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["CUP_O_BMP2_ZU_CSAT"];
	EAST_VEHICLE_AA2 = ["CUP_O_ZSU23_CSAT"];
	EAST_VEHICLE_AA3 = ["CUP_O_2S6M_RU"];
	//--- Air
	EAST_AIR_HELI1 = ["CUP_O_UH1H_TKA"];
	EAST_AIR_HELI2 = [""];
	EAST_AIR_HELI_ATTACK = [""];
	EAST_AIR_AA = ["OFPS_SU25"];
	EAST_AIR_CAS = ["CUP_O_SU34_AGM_CSAT"];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["CUP_B_RHIB2Turret_USMC"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
};
if (CTI_TOWNS_OCCUPATION_EAST == 2) then { 
//--- MIXED TOWN OCCUPATION - vanilla/cup/ofps/etc..
	//--- Infantry
	EAST_SOLDIER = "CUP_O_RU_Soldier";
	EAST_SOLDIER_AA = "CUP_O_RU_Soldier_AA";
	EAST_SOLDIER_AR = "CUP_O_RU_Soldier_AR";
	EAST_SOLDIER_AT = "CUP_O_RU_Soldier_AT";
	EAST_SOLDIER_CREW = "CUP_O_RU_Crew";
	EAST_SOLDIER_LAT = "CUP_O_RU_Soldier_AT";
	EAST_SOLDIER_HAT = "CUP_O_RU_Soldier_HAT";
	EAST_SOLDIER_ENGINEER = "CUP_O_RU_Engineer";
	EAST_SOLDIER_EXP = "CUP_O_RU_Explosive_Specialist";
	EAST_SOLDIER_GL = "CUP_O_RU_Soldier_TL";
	EAST_SOLDIER_MEDIC = "CUP_O_RU_Medic";
	EAST_SOLDIER_MG = "CUP_O_RU_Soldier_AR";
	EAST_SOLDIER_PILOT = "CUP_O_RU_Pilot";
	EAST_SOLDIER_SNIPER = "CUP_O_RU_Sniper_KSVK";
	EAST_SOLDIER_TEAMLEADER = "O_Soldier_TL_F";
	EAST_SOLDIER_SQUADLEADER = "O_Soldier_SL_F";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["CUP_O_UAZ_MG_CSAT"];
	EAST_VEHICLE_LIGHT2 = ["OFPS_LR_MG"];
	EAST_VEHICLE_LIGHT3 = ["CUP_O_BTR40_MG_TKA"];
	EAST_VEHICLE_LIGHT4 = ["CUP_O_GAZ_Vodnik_AGS_RU"];
	EAST_VEHICLE_LIGHT5 = ["CUP_O_BRDM2_CSAT"];
	EAST_VEHICLE_LIGHT6 = ["CUP_O_BTR60_CSAT"];
	EAST_VEHICLE_LIGHT7 = ["CUP_O_BTR90_RU"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["CUP_O_BMP1_CSAT"];
	EAST_VEHICLE_APC2 = ["CUP_O_BMP2_CSAT"];
	EAST_VEHICLE_APC3 = ["OFPS_BMP3"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["CUP_O_T55_CSAT"];	
	EAST_VEHICLE_ARMORED2 = ["CUP_O_T72_CSAT"];
	EAST_VEHICLE_ARMORED3 = ["O_MBT_02_cannon_F"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["CUP_O_BMP2_ZU_CSAT"];
	EAST_VEHICLE_AA2 = ["CUP_O_ZSU23_CSAT"];
	EAST_VEHICLE_AA3 = ["CUP_O_2S6M_RU"];
	//--- Air
	EAST_AIR_HELI1 = ["CUP_O_UH1H_TKA"];
	EAST_AIR_HELI2 = [""];
	EAST_AIR_HELI_ATTACK = [""];
	EAST_AIR_AA = ["OFPS_SU25"];
	EAST_AIR_CAS = ["CUP_O_SU34_AGM_CSAT"];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["CUP_B_RHIB2Turret_USMC"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["sfp_rbb_norrkoping"];
};
if (CTI_TOWNS_OCCUPATION_EAST == 3) then { 
//--- Pacific TOWN OCCUPATION - tanoa forces
	//--- Infantry
	EAST_SOLDIER = "O_T_Soldier_F";
	EAST_SOLDIER_AA = "O_T_Soldier_AA_F";
	EAST_SOLDIER_AR = "O_T_Soldier_AR_F";
	EAST_SOLDIER_AT = "O_T_Soldier_LAT_F";
	EAST_SOLDIER_CREW = "O_T_Crew_F";
	EAST_SOLDIER_LAT = "O_T_Soldier_LAT_F";
	EAST_SOLDIER_HAT = "O_T_Soldier_AT_F";
	EAST_SOLDIER_ENGINEER = "O_T_Engineer_F";
	EAST_SOLDIER_EXP = "O_T_Soldier_Exp_F";
	EAST_SOLDIER_GL = "O_T_Soldier_GL_F";
	EAST_SOLDIER_MEDIC = "O_T_Medic_F";
	EAST_SOLDIER_MG = "O_T_Support_MG_F";
	EAST_SOLDIER_PILOT = "O_T_Helipilot_F";
	EAST_SOLDIER_SNIPER = "O_T_Soldier_M_F";
	EAST_SOLDIER_TEAMLEADER = "O_T_Soldier_TL_F";
	EAST_SOLDIER_SQUADLEADER = "O_T_Soldier_SL_F";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_T_Diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_T_Diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["O_G_Offroad_01_armed_F"];
	EAST_VEHICLE_LIGHT2 = ["O_MRAP_02_F"];
	EAST_VEHICLE_LIGHT3 = ["O_MRAP_02_hmg_F"];
	EAST_VEHICLE_LIGHT4 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT5 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT6 = ["O_MRAP_02_gmg_F"];
	EAST_VEHICLE_LIGHT7 = ["O_MRAP_02_gmg_F"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["O_APC_Wheeled_02_rcws_F"];
	EAST_VEHICLE_APC2 = ["O_APC_Tracked_02_cannon_F"];
	EAST_VEHICLE_APC3 = ["O_APC_Tracked_02_cannon_F"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["O_MBT_02_cannon_F"];	
	EAST_VEHICLE_ARMORED2 = ["O_MBT_02_cannon_F"];
	EAST_VEHICLE_ARMORED3 = ["O_MBT_02_cannon_F"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["O_APC_Tracked_02_AA_F"];
	EAST_VEHICLE_AA2 = ["O_APC_Tracked_02_AA_F"];
	EAST_VEHICLE_AA3 = ["O_APC_Tracked_02_AA_F"];
	//--- Air
	EAST_AIR_HELI1 = ["O_Heli_Light_02_F"];
	EAST_AIR_HELI2 = ["O_Heli_Light_02_v2_F"];
	EAST_AIR_HELI_ATTACK = ["O_Heli_Attack_02_F"];
	EAST_AIR_AA = [""];
	EAST_AIR_CAS = ["O_Plane_CAS_02_F"];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
};
if (CTI_TOWNS_OCCUPATION_EAST == 4) then { 
//--- WINTER TOWN OCCUPATION
	//--- Infantry
	EAST_SOLDIER = "IP_O_Soldier_FST";
	EAST_SOLDIER_AA = "IP_O_Soldier_AA_FST";
	EAST_SOLDIER_AR = "IP_O_HeavyGunner_FST";
	EAST_SOLDIER_AT = "IP_O_Soldier_AT_FST";
	EAST_SOLDIER_CREW = "IP_O_crew_FST";
	EAST_SOLDIER_LAT = "IP_O_Soldier_LAT_FST";
	EAST_SOLDIER_HAT = "IP_O_Soldier_AT_FST";
	EAST_SOLDIER_ENGINEER = "IP_O_Engineer_FST";
	EAST_SOLDIER_EXP = "IP_O_Soldier_exp_FST";
	EAST_SOLDIER_GL = "IP_O_Soldier_GL_FST";
	EAST_SOLDIER_MEDIC = "IP_O_Medic_FST";
	EAST_SOLDIER_MG = "IP_O_HeavyGunner_FST";
	EAST_SOLDIER_PILOT = "IP_O_HeliCrew_FST";
	EAST_SOLDIER_SNIPER = "IP_O_Sharpshooter_FST";
	EAST_SOLDIER_TEAMLEADER = "IP_O_recon_TL_FST";
	EAST_SOLDIER_SQUADLEADER = "IP_O_pathfinder_FST";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["AAF_D_MRAP_03_F"];
	EAST_VEHICLE_LIGHT2 = ["AAF_D_MRAP_03_hmg_F"];
	EAST_VEHICLE_LIGHT3 = ["AAF_D_MRAP_03_hmg_F"];
	EAST_VEHICLE_LIGHT4 = ["AAF_D_MRAP_03_hmg_F"];
	EAST_VEHICLE_LIGHT5 = ["AAF_D_MRAP_03_gmg_F"];
	EAST_VEHICLE_LIGHT6 = ["AAF_D_MRAP_03_gmg_F"];
	EAST_VEHICLE_LIGHT7 = ["AAF_D_MRAP_03_gmg_F"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["AAF_D_APC_Wheeled_03_cannon_F"];
	EAST_VEHICLE_APC2 = ["AAF_D_APC_Wheeled_03_cannon_F"];
	EAST_VEHICLE_APC3 = ["AAF_D_APC_Wheeled_03_cannon_F"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["AAF_D_APC_tracked_03_cannon_F"];	
	EAST_VEHICLE_ARMORED2 = ["AAF_D_APC_tracked_03_cannon_F"];
	EAST_VEHICLE_ARMORED3 = ["AAF_D_MBT_03_cannon_F"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["OFPS_BMP2_ZSU"];
	EAST_VEHICLE_AA2 = ["OFPS_BMP2_ZSU"];
	EAST_VEHICLE_AA3 = ["OFPS_BMP2_ZSU"];
	//--- Air
	EAST_AIR_HELI1 = [""];
	EAST_AIR_HELI2 = [""];
	EAST_AIR_HELI_ATTACK = [""];
	EAST_AIR_AA = [""];
	EAST_AIR_CAS = [""];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
};
if (CTI_TOWNS_OCCUPATION_EAST == 5) then { 
//--- RHS TOWN OCCUPATION
	//--- Infantry
	EAST_SOLDIER = "rhs_msv_emr_rifleman";
	EAST_SOLDIER_AA = "rhs_msv_emr_aa";
	EAST_SOLDIER_AR = "rhs_msv_emr_arifleman";
	EAST_SOLDIER_AT = "rhs_msv_emr_at";
	EAST_SOLDIER_CREW = "rhs_msv_emr_combatcrew";
	EAST_SOLDIER_LAT = "rhs_msv_emr_LAT";
	EAST_SOLDIER_HAT = "rhs_msv_emr_at";
	EAST_SOLDIER_ENGINEER = "rhs_msv_emr_engineer";
	EAST_SOLDIER_EXP = "rhs_msv_emr_engineer";
	EAST_SOLDIER_GL = "rhs_msv_emr_grenadier";
	EAST_SOLDIER_MEDIC = "rhs_msv_emr_medic";
	EAST_SOLDIER_MG = "rhs_msv_emr_arifleman";
	EAST_SOLDIER_PILOT = "rhs_pilot";
	EAST_SOLDIER_SNIPER = "rhs_msv_emr_marksman";
	EAST_SOLDIER_TEAMLEADER = "rhs_msv_emr_sergeant";
	EAST_SOLDIER_SQUADLEADER = "rhs_msv_emr_officer_armored";
	//--- Naval Infantry
	EAST_SOLDIER_NAVAL_INFANTRY = "O_diver_F";
	EAST_SOLDIER_NAVAL_SQUADLEADER = "O_diver_TL_F";
	//--- Light Vehicles
	EAST_VEHICLE_LIGHT1 = ["rhs_tigr_m_msv"];
	EAST_VEHICLE_LIGHT2 = ["rhs_tigr_sts_msv"];
	EAST_VEHICLE_LIGHT3 = ["rhsgref_BRDM2_msv"];
	EAST_VEHICLE_LIGHT4 = ["rhs_btr80_msv"];
	EAST_VEHICLE_LIGHT5 = ["rhs_btr80_msv"];
	EAST_VEHICLE_LIGHT6 = ["rhsgref_BRDM2_ATGM_msv"];
	EAST_VEHICLE_LIGHT7 = ["rhs_btr80a_msv"];
	//--- APCs
	EAST_VEHICLE_APC1 = ["rhs_bmp1_msv"];
	EAST_VEHICLE_APC2 = ["rhs_bmp2d_msv"];
	EAST_VEHICLE_APC3 = ["rhs_bmp3mera_msv"];
	//--- Tanks
	EAST_VEHICLE_ARMORED1 = ["rhs_t72ba_tv"];	
	EAST_VEHICLE_ARMORED2 = ["rhs_t80bv"];
	EAST_VEHICLE_ARMORED3 = ["rhs_t90a_tv"];
	//--- AA Vehicles
	EAST_VEHICLE_AA1 = ["rhs_gaz66_zu23_msv"];
	EAST_VEHICLE_AA2 = ["rhs_zsu234_aa"];
	EAST_VEHICLE_AA3 = ["rhs_zsu234_aa"];
	//--- Air
	EAST_AIR_HELI1 = ["RHS_Mi8mt_vvsc"];
	EAST_AIR_HELI2 = ["RHS_Mi8MTV3_FAB_vvsc"];
	EAST_AIR_HELI_ATTACK = ["rhs_mi28n_vvsc"];
	EAST_AIR_AA = ["RHS_T50_vvs_052"];
	EAST_AIR_CAS = ["RHS_Su25SM_vvs"];
	//--- Boats
	EAST_NAVAL_ASSAULT_BOAT1 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_ASSAULT_BOAT2 = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_MEDIUM_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
	EAST_NAVAL_LARGE_ASSAULT_BOAT = ["O_Boat_Armed_01_hmg_F"];
};
//--- Town Teams Templates
//--- Infantry Squads
EAST_TOWNS_SQUAD_RIFLEMEN1 = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_AR, EAST_SOLDIER, EAST_SOLDIER, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_RIFLEMEN2 = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_AR, EAST_SOLDIER_MG, EAST_SOLDIER_EXP, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_RIFLEMEN3 = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_AR, EAST_SOLDIER_MG, EAST_SOLDIER_GL, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_SNIPER = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_SNIPER, EAST_SOLDIER_SNIPER, EAST_SOLDIER_SNIPER, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_AT1 = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_LAT, EAST_SOLDIER_LAT, EAST_SOLDIER_LAT, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_AT2 = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_HAT, EAST_SOLDIER_HAT, EAST_SOLDIER_HAT, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_AA = [EAST_SOLDIER_SQUADLEADER, EAST_SOLDIER_AA, EAST_SOLDIER_MEDIC];
EAST_TOWNS_SQUAD_NAVAL1 = [EAST_SOLDIER_NAVAL_SQUADLEADER, EAST_SOLDIER_NAVAL_INFANTRY, EAST_SOLDIER_NAVAL_INFANTRY, EAST_SOLDIER_NAVAL_INFANTRY, EAST_SOLDIER_NAVAL_INFANTRY];
EAST_TOWNS_SQUAD_NAVAL2 = [EAST_SOLDIER_NAVAL_SQUADLEADER, EAST_SOLDIER_NAVAL_INFANTRY, EAST_SOLDIER_NAVAL_INFANTRY, EAST_SOLDIER_HAT, EAST_SOLDIER_AA];
EAST_TOWNS_SQUAD_NAVAL3 = [EAST_SOLDIER_NAVAL_SQUADLEADER,  EAST_SOLDIER_HAT, EAST_SOLDIER_HAT, EAST_SOLDIER_AA, EAST_SOLDIER_AA];
//--- Vehicle Squads
EAST_TOWNS_SQUAD_LIGHT1 = EAST_VEHICLE_LIGHT1;
EAST_TOWNS_SQUAD_LIGHT2 = EAST_VEHICLE_LIGHT2;
EAST_TOWNS_SQUAD_LIGHT3 = EAST_VEHICLE_LIGHT3;
EAST_TOWNS_SQUAD_LIGHT4 = EAST_VEHICLE_LIGHT4;
EAST_TOWNS_SQUAD_LIGHT5 = EAST_VEHICLE_LIGHT5;
EAST_TOWNS_SQUAD_LIGHT6 = EAST_VEHICLE_LIGHT6;
EAST_TOWNS_SQUAD_LIGHT7 = EAST_VEHICLE_LIGHT7;
EAST_TOWNS_SQUAD_APC1 = EAST_VEHICLE_APC1;
EAST_TOWNS_SQUAD_APC2 = EAST_VEHICLE_APC2;
EAST_TOWNS_SQUAD_APC3 = EAST_VEHICLE_APC3;
EAST_TOWNS_SQUAD_ARMORED1 = EAST_VEHICLE_ARMORED1;
EAST_TOWNS_SQUAD_ARMORED2 = EAST_VEHICLE_ARMORED2;
EAST_TOWNS_SQUAD_ARMORED3 = EAST_VEHICLE_ARMORED3;
EAST_TOWNS_SQUAD_VEHICLE_AA1 = EAST_VEHICLE_AA1;
EAST_TOWNS_SQUAD_VEHICLE_AA2 = EAST_VEHICLE_AA2;
EAST_TOWNS_SQUAD_VEHICLE_AA3 = EAST_VEHICLE_AA3;
EAST_TOWNS_SQUAD_ASSAULT_BOAT1 = EAST_NAVAL_ASSAULT_BOAT1;
EAST_TOWNS_SQUAD_ASSAULT_BOAT2 = EAST_NAVAL_ASSAULT_BOAT2;
EAST_TOWNS_SQUAD_MEDIUM_ASSAULT_BOAT = EAST_NAVAL_MEDIUM_ASSAULT_BOAT;
EAST_TOWNS_SQUAD_LARGE_ASSAULT_BOAT = EAST_NAVAL_LARGE_ASSAULT_BOAT;
//--- Mixed Squads
EAST_TOWNS_SQUAD_LIGHT1_MIXED = EAST_VEHICLE_LIGHT1 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_LIGHT2_MIXED = EAST_VEHICLE_LIGHT2 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_LIGHT3_MIXED = EAST_VEHICLE_LIGHT3 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_LIGHT4_MIXED = EAST_VEHICLE_LIGHT4 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_LIGHT5_MIXED = EAST_VEHICLE_LIGHT5 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_LIGHT6_MIXED = EAST_VEHICLE_LIGHT6 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_LIGHT7_MIXED = EAST_VEHICLE_LIGHT7 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_APC1_MIXED = EAST_VEHICLE_APC1 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_APC2_MIXED = EAST_VEHICLE_APC2 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_APC3_MIXED = EAST_VEHICLE_APC3 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_ARMORED1_MIXED = EAST_VEHICLE_ARMORED1 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_ARMORED2_MIXED = EAST_VEHICLE_ARMORED2 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_ARMORED3_MIXED = EAST_VEHICLE_ARMORED3 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_VEHICLE_AA1_MIXED = EAST_VEHICLE_AA1 + EAST_TOWNS_SQUAD_AT1;
EAST_TOWNS_SQUAD_VEHICLE_AA2_MIXED = EAST_VEHICLE_AA2 + EAST_TOWNS_SQUAD_AT2;
EAST_TOWNS_SQUAD_VEHICLE_AA3_MIXED = EAST_VEHICLE_AA3 + EAST_TOWNS_SQUAD_AT2;
};