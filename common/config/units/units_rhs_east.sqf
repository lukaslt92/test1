_side = _this;
_faction = "East";

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

//--- Infantry R - Theme: Cost 200+(BLx100)+500(GL/Auto/AA/ATGM)

_c pushBack 'rhs_msv_emr_rifleman';
_p pushBack '';
_n pushBack "0- Rifleman (AK74M)"; 
_o pushBack 200;
_t pushBack 5;
_u pushBack 0;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_aa';
_p pushBack '';
_n pushBack "3- AA Specialist (9K38 Igla)"; 
_o pushBack 1200;
_t pushBack 5;
_u pushBack 3;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_arifleman';
_p pushBack '';
_n pushBack "2- Machine Gunner (PKP)"; 
_o pushBack 750;
_t pushBack 5;
_u pushBack 2;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_at';
_p pushBack '';
_n pushBack "2- AT Specialist (RPG-7V2)"; 
_o pushBack 750;
_t pushBack 5;
_u pushBack 2;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_combatcrew';
_p pushBack '';
_n pushBack "0- Crew (Combat)"; 
_o pushBack 200;
_t pushBack 5;
_u pushBack 0;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_LAT';
_p pushBack '';
_n pushBack "0- Rifleman (RPG-26)"; 
_o pushBack 350;
_t pushBack 5;
_u pushBack 0;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_RShG2';
_p pushBack '';
_n pushBack "0- Rifleman (RShG-2)"; 
_o pushBack 550;
_t pushBack 5;
_u pushBack 1;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_engineer';
_p pushBack '';
_n pushBack "2- Engineer (Toolkit)"; 
_o pushBack 600;
_t pushBack 5;
_u pushBack 2;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_grenadier';
_p pushBack '';
_n pushBack "1- Grenadier"; 
_o pushBack 300;
_t pushBack 5;
_u pushBack 1;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_medic';
_p pushBack '';
_n pushBack "1- Medic"; 
_o pushBack 300;
_t pushBack 5;
_u pushBack 1;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_pilot';
_p pushBack '';
_n pushBack "2- Pilot"; 
_o pushBack 400;
_t pushBack 5;
_u pushBack 2;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_marksman';
_p pushBack '';
_n pushBack "1- Marksman (SVDM)"; 
_o pushBack 450;
_t pushBack 5;
_u pushBack 1;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_junior_sergeant';
_p pushBack '';
_n pushBack "1- Junior Sergeant"; 
_o pushBack 300;
_t pushBack 5;
_u pushBack 1;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_sergeant';
_p pushBack '';
_n pushBack "2- Sergeant"; 
_o pushBack 400;
_t pushBack 5;
_u pushBack 2;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;

_c pushBack 'rhs_msv_emr_officer';
_p pushBack '';
_n pushBack "3- Officer"; 
_o pushBack 750;
_t pushBack 5;
_u pushBack 3;
_f pushBack CTI_FACTORY_BARRACKS;
_s pushBack "";
_d pushBack 0;


//--- Light Vehicles Theme: 500+(LFLx250)+500(WpnSys/Armored)

_c pushBack 'rhs_tigr_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 450;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_tigr_m_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 450;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

// _c pushBack 'rhs_gaz66_msv';
// _p pushBack '';
// _n pushBack 'GAZ-66';
// _o pushBack 350;
// _t pushBack 30;
// _u pushBack 0;
// _f pushBack CTI_FACTORY_LIGHT;
// _s pushBack "";
// _d pushBack 10;

_c pushBack 'rhs_kamaz5350_msv';
_p pushBack '';
_n pushBack '1- KamAZ-5350';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_tigr_m_3camo_msv';
_p pushBack '';
_n pushBack '0- GAZ-233114 Camo';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

// _c pushBack 'rhs_tigr_3camo_msv';
// _p pushBack '';
// _n pushBack 'GAZ-233011 Camo';
// _o pushBack 450;
// _t pushBack 30;
// _u pushBack 0;
// _f pushBack CTI_FACTORY_LIGHT;
// _s pushBack "";
// _d pushBack 10;

_c pushBack 'RHS_UAZ_MSV_01';
_p pushBack '';
_n pushBack '0- UAZ-469';
_o pushBack 500;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;


// _c pushBack 'rhs_uaz_open_MSV_01';
// _p pushBack '';
// _n pushBack '';
// _o pushBack 1000;
// _t pushBack 30;
// _u pushBack 0;
// _f pushBack CTI_FACTORY_LIGHT;
// _s pushBack "";
// _d pushBack 10;

_c pushBack 'rhsgref_BRDM2UM_msv';
_p pushBack '';
_n pushBack '1- BRDM-2UM (Unarmed)';
_o pushBack 1250;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhsgref_ins_uaz_dshkm';
_p pushBack '';
_n pushBack '0- UAZ-3151 (DShKM)';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhsgref_ins_uaz_ags';
_p pushBack '';
_n pushBack '1- UAZ-3151 (AGS-30)';
_o pushBack 1250;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_tigr_sts_msv';
_p pushBack '';
_n pushBack '2- GAZ 233014 (GMG/HMG)';
_o pushBack 2500;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhsgref_BRDM2_msv';
_p pushBack '';
_n pushBack 'BRDM-2';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_gaz66_ap2_msv';
_p pushBack '';
_n pushBack (format ["0- GAZ-66-AP-2 Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
_o pushBack 8000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "service-medic";
_d pushBack 10;

_c pushBack 'rhs_tigr_sts_3camo_msv';
_p pushBack '';
_n pushBack '2- GAZ-233014 Camo (GMG/HMG)';
_o pushBack 2500;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_btr60_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_btr70_msv';
_p pushBack '';
_n pushBack '1- BTR-70';
_o pushBack 1750;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_btr80_msv';
_p pushBack '';
_n pushBack 'BTR-80';
_o pushBack 2500;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_gaz66_zu23_msv';
_p pushBack '';
_n pushBack '2- GAZ-66 (Zu-23)';
_o pushBack 3000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhsgref_BRDM2_ATGM_msv';
_p pushBack '';
_n pushBack '3- BRDM-2 (ATGM)';
_o pushBack 3500;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_btr80a_msv';
_p pushBack '';
_n pushBack '4- BTR-80A';
_o pushBack 3000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_BM21_MSV_01';
_p pushBack '';
_n pushBack 'BM-21';
_o pushBack 140000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_9k79';
_p pushBack '';
_n pushBack '9P129-1M (HE Warhead)';
_o pushBack 120000;
_t pushBack 30;
_u pushBack 5;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_9k79_K';
_p pushBack '';
_n pushBack '9P129-1M (Cluster Warhead)';
_o pushBack 150000;
_t pushBack 30;
_u pushBack 5;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

//Being used as salvage truck
_c pushBack 'rhs_kamaz5350_flatbed_msv';
_p pushBack '';
_n pushBack 'Kamaz Flatbed Truck';
_o pushBack 1000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_LIGHT;
_s pushBack "";
_d pushBack 10;

//--- Heavy Vehicles Theme: 1500+(HFLx500)+2500(WpnSystem/MBT)*1.25(Advantaged)

_c pushBack 'rhs_bmp1_msv';
_p pushBack '';
_n pushBack 'BMP-1';
_o pushBack 4500;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_btr80_msv';
_p pushBack '';
_n pushBack 'BTR-80';
_o pushBack 7500;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd1';
_p pushBack '';
_n pushBack 'BMD-1';
_o pushBack 5500;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_pts_vmf';
_p pushBack '';
_n pushBack 'PTS-M Carrier';
_o pushBack 2000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t72bd_tv';
_p pushBack '';
_n pushBack 'T-72B3 (obr. 2012g)';
_o pushBack 12000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t80ue1';
_p pushBack '';
_n pushBack 'T-80UE-1';
_o pushBack 26500;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t80bvk';
_p pushBack '';
_n pushBack 'T-80BVK';
_o pushBack 18750;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_prp3_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 1500;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmp1p_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 8000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd2';
_p pushBack '';
_n pushBack '';
_o pushBack 7000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd1r';
_p pushBack '';
_n pushBack 'BMD-1R (FFAR)';
_o pushBack 4000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_zsu234_aa';
_p pushBack '';
_n pushBack 'ZSU-23-4V';
_o pushBack 7150;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmp2d_msv';
_p pushBack '';
_n pushBack 'BMP-2D';
_o pushBack 5775;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;


_c pushBack 'rhs_Ob_681_2';
_p pushBack '';
_n pushBack 'Obyekt 681-2';
_o pushBack 8650;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t72bb_tv';
_p pushBack '';
_n pushBack 'T-72B 1985g';
_o pushBack 13000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_sprut_vdv';
_p pushBack '';
_n pushBack '2S25';
_o pushBack 7875;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmp3_msv';
_p pushBack '';
_n pushBack '';
_o pushBack 11000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd2m';
_p pushBack '';
_n pushBack 'BMD-2M';
_o pushBack 9000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;


_c pushBack 'rhs_brm1k_msv';
_p pushBack '';
_n pushBack 'BRM-1K (Ground Radar)';
_o pushBack 6000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd4_vdv';
_p pushBack '';
_n pushBack '';
_o pushBack 14000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t80um';
_p pushBack '';
_n pushBack 'T-80UM';
_o pushBack 18975;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmp3m_msv';
_p pushBack '';
_n pushBack 'BMP-3 Vesna K';
_o pushBack 8000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_t90a_tv';
_p pushBack '';
_n pushBack 'T-90A 2006g';
_o pushBack 25000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmp3mera_msv';
_p pushBack '';
_n pushBack 'BMP-3 Vesna K/A';
_o pushBack 7150;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_bmd4ma_vdv';
_p pushBack '';
_n pushBack 'BMD-4M A (1x 100mm/1x 30mm)';
_o pushBack 10500;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_2s3_tv';
_p pushBack '';
_n pushBack '2S3M1 Howitzer';
_o pushBack 150000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_BM21_MSV_01';
_p pushBack '';
_n pushBack 'BM-21 (MLRS)';
_o pushBack 175000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_9k79';
_p pushBack '';
_n pushBack '9P129-1M (HE Warhead)';
_o pushBack 125000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_9k79_K';
_p pushBack '';
_n pushBack '9P129-1M (Cluster Warhead)';
_o pushBack 150000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_HEAVY;
_s pushBack "";
_d pushBack 10;

//--- Repair Vehicles
_c pushBack 'RHS_Ural_Fuel_MSV_01';
_p pushBack '';
_n pushBack 'Ural Fuel Truck';
_o pushBack 4000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-fueltruck";
_d pushBack 10;

_c pushBack 'rhs_gaz66_repair_msv';
_p pushBack '';
_n pushBack 'GAZ-66 Repair';
_o pushBack 8000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-repairtruck";
_d pushBack 10;

_c pushBack 'rhs_gaz66_r142_msv';
_p pushBack '';
_n pushBack 'GAZ-66 R-142 FOB Truck';
_o pushBack 20000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "deployable-fob";
_d pushBack 10;

_c pushBack 'rhs_typhoon_vdv';
_p pushBack '';
_n pushBack 'KamaZ-63968 Large FOB Truck';
_o pushBack 40000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "deployable-fob-large";
_d pushBack 10;

//--- Ammo Vehicles
_c pushBack 'rhs_gaz66_ammo_msv';
_p pushBack '';
_n pushBack 'Gaz Ammo Truck';
_o pushBack 5000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-ammotruck";
_d pushBack 10;

//--- Air Vehicles
_c pushBack 'rhs_Mi8AMT_vvsc';
_p pushBack '';
_n pushBack 'Mi-8AMT Unarned';
_o pushBack 17000;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_Mi8MT_Cargo_vdv';
_p pushBack '';
_n pushBack 'Mi-8MT Cargo (Unarmed)';
_o pushBack 9100;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_ka60_c';
_p pushBack '';
_n pushBack 'Ka-60';
_o pushBack 7100;
_t pushBack 30;
_u pushBack 0;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8mt_Cargo_vvsc';
_p pushBack '';
_n pushBack (format ["GMi-8MT Mobile Respawn - Range %1 m",CTI_RESPAWN_MOBILE_RANGE]);
_o pushBack 30000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8mt_vvsc';
_p pushBack '';
_n pushBack 'Mi-8MT (2x 7.62mm)';
_o pushBack 13125;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8MTV3_vvsc'; //40x FFAR+40x HEAT Rockets
_p pushBack '';
_n pushBack 'Mi-8MTV-3 FFAR';
_o pushBack 25000;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8MTV3_FAB_vvsc'; //40x FFAR+2x FAB 5000kg bombs
_p pushBack '';
_n pushBack 'Mi-8MTV-3 FAB';
_o pushBack 15000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8MTV3_UPK23_vvsc'; //2x 23mm AC+40x FFAR
_p pushBack '';
_n pushBack 'Mi-8MTV-3 UPK (2x 23mm/2x FFAR)';
_o pushBack 20625;
_t pushBack 30;
_u pushBack 1;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8AMTSh_UPK23_vvsc';
_p pushBack '';
_n pushBack 'Mi-8AMTSh UPK (2x 23mm/4x FFAR)';
_o pushBack 24000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Mi8AMTSh_vvsc';
_p pushBack '';
_n pushBack 'Mi-8AMTSh (6x FFAR)';
_o pushBack 38250;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

// --- Radar Warning Receiver causes microstuttering for all Su-25 and Mi-24s


_c pushBack 'RHS_Mi24V_vvsc';
_p pushBack '';
_n pushBack 'Mi-24 (CAS)';
_o pushBack 30600;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24V_FAB_vvsc';
_p pushBack '';
_n pushBack 'Mi-24V FAB';
_o pushBack 34000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24V_UPK23_vvsc';
_p pushBack '';
_n pushBack 'Mi-24V UPK';
_o pushBack 35000;
_t pushBack 30;
_u pushBack 2;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24P_vvsc';
_p pushBack '';
_n pushBack 'Mi-24P FAB';
_o pushBack 22000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24P_CAS_vvsc';
_p pushBack '';
_n pushBack 'Mi-24P CAS';
_o pushBack 22000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24V_AT_vvsc';
_p pushBack '';
_n pushBack 'Mi-24V AT';
_o pushBack 45000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;


_c pushBack 'RHS_Mi24P_AT_vvsc';
_p pushBack '';
_n pushBack 'Mi-24P AT';
_o pushBack 58500;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Ka52_vvsc';
_p pushBack '';
_n pushBack 'Ka-52';
_o pushBack 95000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Ka52_UPK23_vvsc';
_p pushBack '';
_n pushBack 'Ka-52 UPK';
_o pushBack 75000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Su25SM_vvs';
_p pushBack '';
_n pushBack 'Su-25';
_o pushBack 67500;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Su25SM_CAS_vvs';
_p pushBack '';
_n pushBack 'Su-25 CAS';
_o pushBack 85000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_Su25SM_KH29_vvs';
_p pushBack '';
_n pushBack 'Su-25 KH29';
_o pushBack 80000;
_t pushBack 30;
_u pushBack 5;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_T50_vvs_055';
_p pushBack '';
_n pushBack 'Sukhoi T-50 (obr 2013)';
_o pushBack 90000;
_t pushBack 30;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_TU95MS_vvs_tambov';
_p pushBack '';
_n pushBack 'Tu-95MS6 Bear Tambov';
_o pushBack 150000;
_t pushBack 60;
_u pushBack 5;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'RHS_TU95MS_vvs_old';
_p pushBack '';
_n pushBack 'Tu-95MS6 Bear (Unarmed)';
_o pushBack 45000;
_t pushBack 60;
_u pushBack 4;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_mi28n_vvsc';
_p pushBack '';
_n pushBack 'Mi-28N';
_o pushBack 65000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_mi28n_s13_vvsc';
_p pushBack '';
_n pushBack 'Mi-28N';
_o pushBack 50000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

_c pushBack 'rhs_an2';
_p pushBack '';
_n pushBack 'An-2 Antonov (Unarmed)';
_o pushBack 14000;
_t pushBack 30;
_u pushBack 3;
_f pushBack CTI_FACTORY_AIR;
_s pushBack "";
_d pushBack 10;

//--- Naval Vehicles
//--- WARNING - this boat is a blufor!!! adding in here as a temp unit!
_c pushBack 'rhsusf_mkvsoc';
_p pushBack '';
_n pushBack 'Sppedboat - GMG, HMG, GAU';
_o pushBack 5000;
_t pushBack 25;
_u pushBack 2;
_f pushBack CTI_FACTORY_NAVAL;
_s pushBack "";
_d pushBack 5;

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";