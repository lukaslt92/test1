private ["_faction", "_i", "_p", "_side", "_u"];

_side = _this;
_faction = "West";

_i = [];
_u = [];
_p = [];

//************************OFPS Stuff************************

//-- Magazines
_i pushBack "hlc_500rnd_762x51_Belt";
_u pushBack 4;
_p pushBack 100;
/* 
_i pushBack "hlc_500rnd_762x51_Cinematic";
_u pushBack 4;
_p pushBack 4000;
 
_i pushBack "HLC_wp_M134Painless";
_u pushBack 4;
_p pushBack 10000;
*/

//--Winter Stuff
//Camo
_i pushBack "Blue_Snow_Camo";
_u pushBack 0;
_p pushBack 100;

//vests

_i pushBack "BW_equip_b_carrier_spec_rig";
_u pushBack 0;
_p pushBack 300;

_i pushBack "AAF_D_PlateCarrier_IA1";
_u pushBack 0;
_p pushBack 300;

_i pushBack "AAF_D_PlateCarrier_IA2";
_u pushBack 0;
_p pushBack 300;

_i pushBack "AAF_D_TacVest_B";
_u pushBack 0;
_p pushBack 300;

//Backpacks
_i pushBack "AAF_D_AssaultPack_B";
_u pushBack 0;
_p pushBack 300;

_i pushBack "Meaty_Carryall_Snow_B_Base";
_u pushBack 2;
_p pushBack 300;

_i pushBack "AAF_D_Carryall_B";
_u pushBack 2;
_p pushBack 300;

_i pushBack "AAF_D_FieldPack_AT_B";
_u pushBack 0;
_p pushBack 300;

_i pushBack "AAF_D_FieldPack_B";
_u pushBack 0;
_p pushBack 300;

_i pushBack "AAF_D_Kitbag_B";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_backpack_rb56_loader";
_u pushBack 0;
_p pushBack 300;

//Deployable Boat
_i pushBack "AP_Deployable_Boat_backpack";
_u pushBack 3;
_p pushBack 500;

//pistols


//sub machine guns



//assault 
_i pushBack "bear_MX_GL_white_F";
_u pushBack 1;
_p pushBack 300;

_i pushBack "bear_MX_white_F";
_u pushBack 0;
_p pushBack 300;

_i pushBack "bear_MX_SW_white_F";
_u pushBack 1;
_p pushBack 300;

_i pushBack "bear_MXC_white_F";
_u pushBack 1;
_p pushBack 300;

_i pushBack "bear_MXM_white_F";
_u pushBack 1;
_p pushBack 300;


//lmg

//snipers


//support
_i pushBack "IP_launch_O_Titan_short_snw_F";
_u pushBack 4;
_p pushBack 2500;

_i pushBack "IP_launch_O_Titan_snw_F";
_u pushBack 3;
_p pushBack 2000;



//--SFP Stuff

//pistols
/*_i pushBack "sfp_kpistm45";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_p88";
_u pushBack 0;
_p pushBack 300;*/

//sub machine guns
/*_i pushBack "sfp_mp5";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_cjb_ms_aimpoint";
_u pushBack 0;
_p pushBack 300;*/


//assault 
/*_i pushBack "sfp_ak4";
_u pushBack 1;
_p pushBack 300;

_i pushBack "sfp_ak5";
_u pushBack 1;
_p pushBack 300;

_i pushBack "sfp_ak5c";
_u pushBack 1;
_p pushBack 300;

_i pushBack "sfp_ak5dmk2";
_u pushBack 1;
_p pushBack 300;

_i pushBack "sfp_ak5c_blk";
_u pushBack 1;
_p pushBack 300;

_i pushBack "sfp_remington870";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_ak5c_m203";
_u pushBack 1;
_p pushBack 300;*/


//lmg
/*_i pushBack "sfp_ksp90";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_ksp58";
_u pushBack 0;
_p pushBack 300;

//snipers
_i pushBack "sfp_psg90";
_u pushBack 2;
_p pushBack 400;*/


//support


//ammo
_i pushBack "20Rnd_762x51_Mag";
_u pushBack 1;
_p pushBack 30;

_i pushBack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
_u pushBack 1;
_p pushBack 50;

/*_i pushBack "sfp_9Rnd_762x51_psg90";
_u pushBack 2;
_p pushBack 30;

_i pushBack "sfp_36Rnd_9mm_kpistm45";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_30Rnd_9mm_mp5";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_30Rnd_650x25mag";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_17Rnd_9x19_Mag";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_20Rnd_762x51_ak4";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_30Rnd_556x45_Stanag";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_guage12_8rd_pellets";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_200Rnd_556x45_ksp90";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_50Rnd_762x51_ksp58";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_100Rnd_762x51_ksp58";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_9Rnd_762x51_psg90";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_9Rnd_127x99_ag90";
_u pushBack 0;
_p pushBack 30;

_i pushBack "sfp_12Gauge_8rd_Pellets";
_u pushBack 0;
_p pushBack 30;*/

//explosives
/*_i pushBack "sfp_flashbang";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_handgrenade_shgr07";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_handgrenade_shgr56";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_handgrenade_shgr2000";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_strvm6_mag";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_sprdeg46_mag";
_u pushBack 0;
_p pushBack 50;*/


//attachments
/*_i pushBack "sfp_optic_aimpoint";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_dball2";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_muzzle_snds_cbj";
_u pushBack 0;
_p pushBack 50;

_i pushBack "sfp_tlr2";
_u pushBack 0;
_p pushBack 50;*/


//backpacks
_i pushBack "sfp_backpack_stridssack2000";
_u pushBack 2;
_p pushBack 300;

_i pushBack "sfp_backpack_sjvv9";
_u pushBack 2;
_p pushBack 300;

//vests
_i pushBack "sfp_kroppsskydd12";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_kroppsskydd12_crew";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_kroppsskydd12_tl";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_kroppsskydd12_at";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_kroppsskydd12_holster";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_stridsvast08";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_stridsvast2000";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_kroppsskydd94";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_stridssele";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_stridssele_gas";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_holster";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_press_vest";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_suicidebelt";
_u pushBack 0;
_p pushBack 100;


//Uniforms
_i pushBack "sfp_m90s_uniform";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_m90s_uniform_hood";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_m90w_uniform";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_uniform_dirty";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_uniform_mp";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_uniform";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90u_uniform";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_ghillie_uniform";
_u pushBack 0;
_p pushBack 100;


//gear

_i pushBack "A3_GPNVG18_BLK_F";
_u pushBack 2;
_p pushBack 1000;

_i pushBack "A3_GPNVG18_F";
_u pushBack 2;
_p pushBack 1000;


//HeadGear
_i pushBack "sfp_m90w_helmet";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_helmet_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_helmet_peltor_nvg";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_helmet_headset_nvg";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_cap";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_cap_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90w_booniehat";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90u_cap";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90u_booniehat";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_helmet";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_helmet_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_helmet_peltor_nvg";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_helmet_headset_nvg";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_cap";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_cap_isaf";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90d_cap_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_un_booniehat";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90un_helmet";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90un_helmet_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m90un_helmet_headset";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_fm_beret";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_armor_beret";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m37_helmet";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m37w_helmet_dok2";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m59w_cap";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_m37w_helmet_cap1";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_headset";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_peltor";
_u pushBack 0;
_p pushBack 100;

_i pushBack "sfp_batmossa_m48";
_u pushBack 0;
_p pushBack 100;

_i pushBack "AAF_D_Helmet_B_light_desert";
_u pushBack 0;
_p pushBack 300;

_i pushBack "sfp_m90s_helmet_headset";
_u pushBack 0;
_p pushBack 300;

//face

_i pushBack "BW_Balaclava_blk";
_u pushBack 0;
_p pushBack 30;

_i pushBack "AAF_D_Bandmask_G";
_u pushBack 0;
_p pushBack 30;


[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf"; 