//--- GAME STATICS ---//
CTI_FACTORY_BARRACKS = 0;
CTI_FACTORY_LIGHT = 1;
CTI_FACTORY_HEAVY = 2;
CTI_FACTORY_AIR = 3;
CTI_FACTORY_REPAIR = 4;
CTI_FACTORY_AMMO = 5;
CTI_FACTORY_NAVAL = 6;
CTI_FACTORY_DEPOT = 7;
CTI_FACTORY_RADAR = 8;
CTI_FACTORY_RADAR_ART = 9;
CTI_FACTORY_LARGE_FOB = 10;

CTI_PV_SERVER = 2;
CTI_PV_CLIENTS = if (!isMultiplayer || CTI_IsHostedServer) then {0} else {-2};

CTI_BARRACKS = "Barracks";
CTI_LIGHT = "Light";
CTI_CONTROLCENTER = "ControlCenter";
CTI_HEAVY = "Heavy";
CTI_AIR = "Air";
CTI_REPAIR = "Repair";
CTI_AMMO = "Ammo";
CTI_NAVAL = "Naval";
CTI_DEPOT = "Depot";
CTI_DEPOT_NAVAL = "DepotNaval";
CTI_RADAR = "Radar";
CTI_RADAR_ART = "RadarArt";
CTI_HQ_DEPLOY = "HQDeployed";
CTI_HQ_MOBILIZE = "HQMobilized";
CTI_SUPPLY_DEPOT = "SupplyDepot";
CTI_SATELLITE = "Satellite";
CTI_LARGE_FOB = "LargeFOB";

CTI_FACTORIES = [CTI_BARRACKS,CTI_LIGHT,CTI_HEAVY,CTI_AIR,CTI_REPAIR,CTI_AMMO,CTI_NAVAL];

CTI_WEST_COLOR = "ColorBlue";
CTI_EAST_COLOR = "ColorRed";
CTI_RESISTANCE_COLOR = "ColorGreen";

CTI_GEAR_TAB_PRIMARY = 0;
CTI_GEAR_TAB_SECONDARY = 1;
CTI_GEAR_TAB_HANDGUN = 2;
CTI_GEAR_TAB_ACCESSORIES = 3;
CTI_GEAR_TAB_AMMO = 4;
CTI_GEAR_TAB_MISC = 5;
CTI_GEAR_TAB_EQUIPMENT = 6;
CTI_GEAR_TAB_TEMPLATES = 7;

CTI_UNIT_LABEL = 0;
CTI_UNIT_PICTURE = 1;
CTI_UNIT_PRICE = 2;
CTI_UNIT_TIME = 3;
CTI_UNIT_UPGRADE = 4;
CTI_UNIT_FACTORY = 5;
CTI_UNIT_TURRETS = 6;
CTI_UNIT_SCRIPT = 7;
CTI_UNIT_DISTANCE = 8;

CTI_WEST_ID = 0;
CTI_EAST_ID = 1;
CTI_RESISTANCE_ID = 2;

CTI_SPECIAL_REPAIRTRUCK = 0;
CTI_SPECIAL_AMMOTRUCK = 1;
CTI_SPECIAL_MEDICALVEHICLE = 2;
CTI_SPECIAL_FUELTRUCK = 3;
CTI_SPECIAL_GEAR = 4;
CTI_SPECIAL_NUKETRUCK = 5;
CTI_SPECIAL_DEFENSETRUCK = 6;
CTI_SPECIAL_DEPLOYABLEFOB = 7;
CTI_SPECIAL_DEPLOYABLEFOBLARGE = 8;

CTI_AI_COMMANDER_BUYTO_INFANTRY = 20;
CTI_AI_COMMANDER_BUYTO_LIGHT = 13;
CTI_AI_COMMANDER_BUYTO_HEAVY = 15;
CTI_AI_COMMANDER_BUYTO_AIR = 6;

CTI_AI_COMMANDER_TRANSFER_FUNDS_CHANCE = 50;

CTI_AI_COMMANDER_FUNDS_INFANTRY = 250;
CTI_AI_COMMANDER_FUNDS_LIGHT = 500;
CTI_AI_COMMANDER_FUNDS_HEAVY = 750;
CTI_AI_COMMANDER_FUNDS_AIR = 1000;

CTI_AI_COMMANDER_TEAMS_UPDATE_DELAY = 360;

//---  CBA Check 
CBA_Loaded = false;
if ( isClass (configFile >> "CfgSettings" >> "CBA") ) then {CBA_Loaded = true;};
//---  OFPS Core Pack Check
OFPS_Core_Loaded = false;
if ( isClass (configFile >> "CfgPatches" >> "ofps_Sound") ) then {OFPS_Core_Loaded = true;};

//---------------------------------------------------AI TEAMS------------------------------------------------------------//
/*
 * The AI Teams are lead by playable leaders which perform different tasks by themselves depending on the commander's orders.
 *
 * Those scripts are used by AI teams:
 * - Server\FSM\update_ai.fsm: This controls the AI Teams "flow"
 * - Server\Functions\FSM\Functions_FSM_UpdateAI.sqf: This contains the functions related to the FSM
 */

//--- AI Teams: Vehicles
CTI_AI_TEAMS_CARGO_VEHICLES_DISEMBARK_RANGE = 850; //--- AI will get out x meters before their target and will use transport which are x meters away from their objectives
CTI_AI_TEAMS_CARGO_VEHICLES_MATCH_RANGE = 550; //--- AI will use transports which objective are within x meters of theirs
CTI_AI_TEAMS_CARGO_VEHICLES_RANGE = 250; //--- AI will look for cargo-able vehicles within that range
CTI_AI_TEAMS_COMMAND_VEHICLES_RANGE = 300; //--- AI will look for commandable vehicles within that range
CTI_AI_TEAMS_FOOT_EMBARK_RANGE = 450; //--- AI leaders on foot will try to embark their team's vehicle within that range as driver

//--- AI Teams: Towns defense
CTI_AI_TEAMS_DEFEND_TOWNS = 1; //--- Static amount of AI which will perform a defensive duty (scales with slot count)
CTI_AI_TEAMS_DEFEND_TOWNS_WORTH = 50; //--- Defend towns which values are worth more than x

//--- AI Teams: Observation
CTI_AI_TEAMS_OBSERVATION_BASE_DELAY = 60; //--- Delay between reports from a same group about structures
CTI_AI_TEAMS_OBSERVATION_UNIT_DELAY = 60; //--- Delay between reports from a same group about units
CTI_AI_TEAMS_OBSERVATION_ACCURACY = 50; //--- Accuracy of an AI map reports
CTI_AI_TEAMS_OBSERVATION_MARKER_LIFESPAN = 120; //--- Time a reporting marker may remain

//--- AI Teams: Units
CTI_AI_TEAMS_UNITS_MIN = 4; //--- Amount of units an AI leader need to have to be able to perform it's duty (It will resupply @base if it's lower)
CTI_AI_TEAMS_UNITS_DELETE_ON_DISCONNECT = 1; //--- Remove AI units on player d/c

//--- AI Teams: Parameters
with missionNamespace do {
	CTI_AI_TEAMS_GROUPSIZE = 8; //--- AI Teams may get up to x units
	if (isNil 'CTI_AI_TEAMS_ENABLED') then {CTI_AI_TEAMS_ENABLED = 1}; //--- Determine whether AI Teams are enabled or not
};
//-----------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------ToolKitRepairTimes-------------------------------------------------------------//
CTI_TOOLKIT_REPAIR_TIME_TANK = 45; //repair time for tracked vehicles in seconds
CTI_TOOLKIT_REPAIR_TIME_CAR = 20; // repair time for wheeled vehicles including apcs in seconds
CTI_TOOLKIT_REPAIR_TIME_AIR = 45; // repair time for aircraft in seconds
CTI_TOOLKIT_REPAIR_TIME_SHIP = 60; // repair time for ships in seconds
CTI_TOOLKIT_REPAIR_TIME_UNKNOWN = 20; //default repair time for a vehicle in seconds
CTI_TOOLKIT_HITPOINT_REPAIR_AMMOUNT = 0.75; // a number between 0-1. When a vehicle part is repaired, this is the max ammount of health that part has. "You gotta have logistics"
//-------------------------------------------------------------------------------------------------------------------------//
//-------------------------------------------------------------------------------------------------------------------------//
//-- vehicle stealth
CTI_ENABLE_VEHICLE_STEALTH = 0; //0 to disable, 1 to enable
//-------------------------------------------------------------------------------------------------------------------------//
//----------------------------------------------------ORDERS-------------------------------------------------------------//
/*
 * The orders determine the actions that AI Team Leaders will perform, they are executed in a different thread in order
 * to enhance the missions maker freedom (Delay, behaviour...).
 *
 * The main AI thread (the FSM) detect whether an order has changed thanks to a "seed" system, if the seed differ then a
 * new order was assigned. Some orders can be reloaded (when a unit dies or resume it's main task). Keep in mind that
 * some orders are not "real" orders since they only require one action like embark/disembark.
 *
 * New orders may be added below, still they need to be defined in both FSM within the "Duty" state
 *
 * - Client\FSM\update_orders.fsm: Controls the Player "flow".
 * - Client\Functions\FSM\Functions_FSM_UpdateOrders.sqf: Contains the functions related to the Player FSM
 * - Server\FSM\update_ai.fsm: Controls the AI Team Leader "flow".
 * - Server\Functions\FSM\Functions_FSM_UpdateAI.sqf: Contains the functions related to the AI Team Leader FSM
 */

//--- Orders: ID (Unique)
CTI_ORDER_TAKETOWNS = 0; //--- AI: Take any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_TAKETOWN = 1; //--- AI: Take the assigned town, don't change target
CTI_ORDER_TAKETOWN_AUTO = 2; //--- AI: Take the assigned town, change target if there's any closer
CTI_ORDER_TAKEHOLDTOWNS = 3; //--- AI: Take and Hold any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_TAKEHOLDTOWN = 4; //--- AI: Take and hold the assigned town, don't change target
CTI_ORDER_TAKEHOLDTOWN_AUTO = 5; //--- AI: Take and hold the assigned town, change target if there's any closer
CTI_ORDER_HOLDTOWNSBASES = 6; //--- AI: Determine any hold location (Can be towns/base)
CTI_ORDER_HOLDTOWNSBASE = 7; //--- AI: Permanently hold a location (Can be towns/base)
CTI_ORDER_SAD = 8; //--- AI: Search and destroy the enemy base
CTI_ORDER_MOVE = 9; //--- AI: Move to a position

//--- Orders: One-time orders (Doesn't count as a real order)
CTI_ORDER_EMBARKCOMMANDVEH = 10;
CTI_ORDER_DISEMBARKCOMMANDVEH = 11;
CTI_ORDER_EMBARKCARGOVEH = 12;
CTI_ORDER_DISEMBARKCARGOVEH = 13;

//--- Orders: list of orders which are only called once (one-time)
CTI_AI_ORDERS_ONETIMERS = [CTI_ORDER_EMBARKCOMMANDVEH, CTI_ORDER_DISEMBARKCOMMANDVEH, CTI_ORDER_EMBARKCARGOVEH, CTI_ORDER_DISEMBARKCARGOVEH];

//--- Orders: Parameters
CTI_AI_ORDER_HOLDTOWNSBASES_HOPS = 12; //--- Order: HOLD TOWNS BASE units may use up to x hops to patrol in town
CTI_AI_ORDER_HOLDTOWNSBASES_PATROL_RANGE = 240; //--- Order: HOLD TOWNS BASE units may patrol up to x meters
CTI_AI_ORDER_TAKEHOLDTOWNS_HOPS = 8; //--- Order: TAKE HOLD units may use up to x hops to patrol in town
CTI_AI_ORDER_TAKEHOLDTOWNS_PATROL_RANGE = 225; //--- Order: TAKE HOLD units may patrol up to x meters
CTI_AI_ORDER_TAKEHOLDTOWNS_TIME = 240; //--- Order: TAKE HOLD units may patrol x seconds in a town
CTI_AI_ORDER_TAKEHOLDTOWNS_RANGE = 800; //--- Order: TAKE HOLD units will attempt to patrol if within that range of a town

//--- Orders: Parameters (players)
CTI_PLAYER_ORDER_TAKEHOLDTOWNS_RANGE = 800; //--- Order: TAKE HOLD units will attempt to patrol if within that range of a town
CTI_PLAYER_ORDER_TAKEHOLDTOWNS_TIME = 200; //--- Order: TAKE HOLD units may patrol x seconds in a town
//-----------------------------------------------------------------------------------------------------------------------//




//----------------------------------------------ORDERS (PLAYER AI)-------------------------------------------------------//
/*
 * Those orders are sligthly different from the main ones as they only deal with individual units, still those units may
 * create a sub-formation with some members.
 *
 * The principle remain the same, a seed is used to check whether the order has changed or not and the order is executed
 * in a different thread to keep a simple flow within the ai FSM and a flexible one with the orders.
 *
 * New orders may be added below, still they need to be defined in the FSM within the "Duty" state
 *
 * - Client\FSM\update_client_ai.fsm: Controls the Player AI "flow".
 * - Client\Functions\FSM\Functions_FSM_UpdateClientAI.sqf: Contains the functions related to the Player AI FSM
 */

//--- Orders Player AI: ID (Unique)
CTI_ORDER_CLIENT_NONE = 0; //--- AI: No order, follow the group
CTI_ORDER_CLIENT_TAKETOWNS = 1; //--- AI: Take any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_CLIENT_TAKETOWN = 2; //--- AI: Take the assigned town, don't change target
CTI_ORDER_CLIENT_TAKETOWN_AUTO = 3; //--- AI: Take the assigned town, change target if there's any closer
CTI_ORDER_CLIENT_TAKEHOLDTOWNS = 4; //--- AI: Take and Hold any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_CLIENT_TAKEHOLDTOWN = 5; //--- AI: Take and hold the assigned town, don't change target
CTI_ORDER_CLIENT_TAKEHOLDTOWN_AUTO = 6; //--- AI: Take and hold the assigned town, change target if there's any closer
CTI_ORDER_CLIENT_HOLDTOWNSBASES = 7; //--- AI: Determine any hold location (Can be towns/base)
CTI_ORDER_CLIENT_HOLDTOWNSBASE = 8; //--- AI: Permanently hold a location (Can be towns/base)
CTI_ORDER_CLIENT_SAD = 9; //--- AI: Search and destroy the enemy base
CTI_ORDER_CLIENT_MOVE = 10; //--- AI: Move to a position
CTI_ORDER_CLIENT_PATROL = 11; //--- AI: Patrol a position

//--- Orders Player AI: Parameters
CTI_ORDER_CLIENT_PATROL_HOPS = 10; //--- AI: Amount of node present within the patrol area
CTI_ORDER_CLIENT_PATROL_RANGE = 325; //--- AI: Patrol a position.
//-----------------------------------------------------------------------------------------------------------------------//




//---------------------------------------------------UPGRADES------------------------------------------------------------//
/*
 * The upgrade can be seen as an "ingame-feature-evolution" where everything can be upgraded beyond your wildest dreams,
 * the ID determine the position of an upgrade in the upgrade arrays
 *
 * The upgrade array count and order shall be identical for both sides
 *
 * The upgrades are defined in:
 * - Common\Config\Upgrades\Upgrades_xxx.sqf (where xxx is the side/faction)
 */

//--- Upgrades: Order
CTI_UPGRADE_GEAR = 	0;
CTI_UPGRADE_BARRACKS = 1;
CTI_UPGRADE_LIGHT = 2;
CTI_UPGRADE_HEAVY = 3;
CTI_UPGRADE_NAVAL = 4;
CTI_UPGRADE_AIR = 5;
CTI_UPGRADE_AIR_FFAR = 6;
CTI_UPGRADE_AIR_DAR = 7;
CTI_UPGRADE_AIR_AT = 8;
CTI_UPGRADE_AIR_AA = 9;
CTI_UPGRADE_AIR_CM = 10;
CTI_UPGRADE_TOWNS = 11;
CTI_UPGRADE_HALO = 12;
CTI_UPGRADE_AIRR = 13;
CTI_UPGRADE_ARTR = 14;
CTI_UPGRADE_REST = 15;
CTI_UPGRADE_LVOSS = 16;
CTI_UPGRADE_ERA = 17;
CTI_UPGRADE_SATELLITE = 18;
CTI_UPGRADE_NUKE = 19;
CTI_UPGRADE_SUPPLY_RATE = 20;
CTI_UPGRADE_BASE_HEALTH = 21;
CTI_UPGRADE_BASE_DEFENSES = 22;

//--- Supply
CTI_UPGRADE_CST_SUPPLY_COEF = [1, 2, 3, 4]; //--- Supply coefficient (Default * upgrade)
CTI_UPGRADE_BARRACKS_SKILL = [40, 55, 70, 85, 100]; //--- Factory health upgrade damage reduce multipliers

//-----------------------------------------------------------------------------------------------------------------------//




//---------------------------------------------------REQUESTS------------------------------------------------------------//
/*
 * The requests are special actions which a player may request such as a FOB construction. The commander receive them and
 * can either accept or deny them.
 *
 * The request and their actions are defined in:
 * - Client\Functions\UI\Functions_UI_RequestMenu.sqf
 */

//--- Requests: ID
CTI_REQUEST_FOB = 0;
CTI_REQUEST_FOB_DISMANTLE = 1;

//--- Requests: Parameters
CTI_REQUESTS_TIMEOUT = 160; //--- A request will vanish after x seconds if left unattended
//-----------------------------------------------------------------------------------------------------------------------//




//-----------------------------------------------------GEAR--------------------------------------------------------------//
/*
 * The gear system is defined by IDs where each items belong to a specific class (Pistol, Vest, Item...), those class are
 * determined by IDs. The IDs are defined in config so we set them here!
 *
 * Note that the sub IDs are not defined at the same location
 */

//--- Gear: Config ID
CTI_TYPE_RIFLE = 1;
CTI_TYPE_PISTOL = 2;
CTI_TYPE_LAUNCHER = 4;
CTI_TYPE_RIFLE2H = 5;
CTI_TYPE_EQUIPMENT = 4096;
CTI_TYPE_ITEM = 131072;

//--- Gear: Config sub ID
CTI_SUBTYPE_ITEM = 0;
CTI_SUBTYPE_ACC_MUZZLE = 101;
CTI_SUBTYPE_ACC_OPTIC = 201;
CTI_SUBTYPE_ACC_SIDE = 301;
CTI_SUBTYPE_ACC_BIPOD = 302;
CTI_SUBTYPE_HEADGEAR = 605;
CTI_SUBTYPE_UAVTERMINAL = 621;
CTI_SUBTYPE_VEST = 701;
CTI_SUBTYPE_UNIFORM = 801;
CTI_SUBTYPE_BACKPACK = 901;

//--- Gear: Parameters
CTI_GEAR_RESELL_TAX = 0.25; //--- Owned items are traded for: <item price> * <tax>
CTI_GEAR_RESPAWN_WITH_LAST = 1; //--- Determine whether the player should respawn with his last known gear or not
//-----------------------------------------------------------------------------------------------------------------------//




//-----------------------------------------------------TOWNS-------------------------------------------------------------//
/*
 * The towns are location marked by a marker (flag), they generate a different value depending on the value set within the
 * editor. A town is either held by resistance or by the occupation, units may spawn to defend them.
 *
 * When captured, the possible remaining units will try to capture it back.
 *
 * Note that the AI are not managed with waypoints
 *
 * There are several scripts about towns:
 * - Server\FSM\town_capture.fsm: This controls the town value/capture "flow"
 * - Server\FSM\town_occupation.fsm: This controls the town occupation defensive "flow"
 * - Server\FSM\town_patrol.fsm: This controls the town units patrol "flow" for either resistance or occupation
 * - Server\FSM\town_resistance.fsm: This controls the town resistance defensive "flow"
 */

//--- Towns: Camps
CTI_TOWNS_CAMPS_CAPTURE_RANGE = 10; //--- Range needed to capture/protect a camp
CTI_TOWNS_CAMPS_CAPTURE_RANGE_TOWN_AI = 25; //--- Range needed to capture/protect a camp for town AIs
CTI_TOWNS_CAMPS_CAPTURE_RATE = 2; //--- Determine how fast a camp may be captured/protected
CTI_TOWNS_CAMPS_CAPTURE_VALUE_CEIL = 30; //--- The camp value's ceiling
CTI_TOWNS_CAMPS_CAPTURE_VALUE_ITERATE = 1; //--- The iterated value, (try to match CTI_TOWNS_CAMPS_CAPTURE_VALUE_ITERATE), proc all 5 seconds.
CTI_TOWNS_CAMPS_CAPTURE_BOUNTY = 500; //--- Bounty value
CTI_TOWNS_CAMPS_CAPTURE_BOUNTY_DELAY = 300; //--- Award the bounty depending if the last camp capture happened longer than x seconds ago

//--- Towns: Capture
CTI_TOWNS_CAPTURE_BOUNTY_COEF = 100; //--- Bounty coefficient upon capture, (max sv * coefficient)
CTI_TOWNS_CAPTURE_BOUNTY_DELAY = 600; //--- Award the bounty depending if the last town capture happened longer than x seconds ago
CTI_TOWNS_CAPTURE_DETECTION_MODE = 0; //--- Determine the towns detection mode (0: All, 1: Players, 2: Playable units)
CTI_TOWNS_CAPTURE_FORCE_MAX = 2; //--- The force determine how many units may try to capture a town (caoture rate = SV - round((units force + camp rate) * town rate))
CTI_TOWNS_CAPTURE_PEACE_SCAN_RANGE = 150; //--- This range is used upon town capture to search for enemies around the depot, if none are found peace mode will be triggered
CTI_TOWNS_CAPTURE_RANGE = 40; //--- The range which a unit/vehicle has to be from a town center to capture it
CTI_TOWNS_CAPTURE_RATE = 0.5; //--- Determine how fast a town may be captured/protected
CTI_TOWNS_CAPTURE_RATE_CAMPS = 3; //--- Determine how fast a town may be captured while holding it's camps

CTI_TOWNS_CAPTURE_VALUE_CEIL = 30; //--- The town value's ceiling
CTI_TOWNS_CAPTURE_VALUE_ITERATE = 5; //--- The iterated value, (try to match CTI_TOWNS_CAPTURE_VALUE_CEIL), proc all 5 seconds.

//--- Towns: Depot
CTI_TOWNS_DEPOT_ACCESS_MODE = 1; //--- Determine how depots can be accessed for purchases (0: Town belong to side, 1: Town belong to side + all camps)
CTI_TOWNS_DEPOT_BUILD_DIRECTION = 0; //--- Determine the direction a vehicle will use while being spawned from the depot
CTI_TOWNS_DEPOT_BUILD_DISTANCE = 15; //--- Determine how far a unit/vehicle will spawn from the depot
CTI_TOWNS_DEPOT_CLASSNAME = ["Land_BagBunker_Large_F","Land_BagBunker_large_green_F","Land_Lighthouse_small_F"]; //--- The classname(s) used for town depots in editor
CTI_TOWNS_DEPOT_RANGE = 15; //--- Determine how far a player needs to be from a depot in order to use it

//--- Towns: Economy
CTI_TOWNS_INCOME_RATIO = 8.0; //--- A value above 1 will increase the resources ($) generation ((Current SV) * ratio)
CTI_TOWNS_INCOME_UNOCCUPIED_PERCENTAGE = 1.00; //--- Determine how much value an unoccupied town bring to the side.

//--- Towns: Markers
CTI_TOWNS_MARKERS_MAP_RANGE = 750; //--- Distance required to show the town SV on the map (from a player/player's unit)
CTI_TOWNS_MARKERS_PEACE_COLOR = "ColorWhite"; //--- The color used for peace-mode towns
CTI_TOWNS_MARKERS_ALERT_COLOR = "ColorYellow"; //--- The color used for when enemy detected in towns

//--- Towns: Patrol
CTI_TOWNS_PATROL_CAMPS_AI_DEFENSE_MAX = 2; //--- Determine how many Town AI groups may try to capture back one hostile camp
CTI_TOWNS_PATROL_HOPS = 5; //--- Towns patrol hops (non-waypoint), ammount of "waypoints" given to town AI
CTI_TOWNS_PATROL_RANGE = 400; //--- Patrol range in a town "Max range of waypoints"

//--- Towns: Occupation

//CTI_TOWNS_OCCUPATION_GROUPS_RATIO = 0.025; //--- Determine how many groups may spawn (scales with town value)
CTI_TOWNS_OCCUPATION_DETECTION_RANGE = 750; //--- Determine how far a threat may be detected from the town center
CTI_TOWNS_OCCUPATION_DETECTION_RANGE_AIR = 100; //--- Determine how high a threat is considered aerial
CTI_TOWNS_OCCUPATION_INACTIVE_MAX = 180; //--- Determine how long a town may remain active when triggered
CTI_TOWNS_OCCUPATION_MIN_ACTIVE = 0; //--- When the town is not held by the side and when no enemy is near, at least x enemies need to be alive for the town to be considered active

CTI_TOWNS_OCCUPATION_SPAWN_AI_MAX = 35;  //--- Determine the max occupation AI count to present in a town (if the count is below the given limit, a new wave will spawn)
CTI_TOWNS_OCCUPATION_SPAWN_AI_MIN = 25; //--- Determine the min occupation AI count to present in a town
CTI_TOWNS_OCCUPATION_SPAWN_RANGE = 350; //--- Determine how far the units may spawn from the town center
CTI_TOWNS_OCCUPATION_SPAWN_RANGE_CAMPS = 80; //--- Determine how far the units may spawn from a town's camp when selected
CTI_TOWNS_OCCUPATION_SPAWN_SAFE_RANGE = 250; //--- Determine the "safe" range for spawning units (no enemy units have to be present within this area)

//--- Towns: Resistance

//CTI_TOWNS_RESISTANCE_GROUPS_RATIO = 0.025; //--- Determine how many groups may spawn (scales with town value)
CTI_TOWNS_RESISTANCE_DETECTION_RANGE = 750; //--- Determine how far a threat may be detected from the town center
CTI_TOWNS_RESISTANCE_DETECTION_RANGE_AIR = 40; //--- Determine how high a threat is considered aerial
CTI_TOWNS_RESISTANCE_INACTIVE_MAX = 180; //--- Determine how long a town may remain active when triggered
CTI_TOWNS_RESISTANCE_MIN_ACTIVE = 5; //--- When the town is not held by the side and when no enemy is near, at least x enemies need to be alive for the town to be considered active

CTI_TOWNS_RESISTANCE_SPAWN_AI_MAX = 35; //--- Determine the max resistance AI count to present in a town (if the count is below the given limit, a new wave will spawn)
CTI_TOWNS_RESISTANCE_SPAWN_AI_MIN = 25; //--- Determine the min resistance AI count to present in a town
CTI_TOWNS_RESISTANCE_SPAWN_RANGE = 350; //--- Determine how far the units may spawn from the town center
CTI_TOWNS_RESISTANCE_SPAWN_RANGE_CAMPS = 80; //--- Determine how far the units may spawn from a town's camp when selected
CTI_TOWNS_RESISTANCE_SPAWN_SAFE_RANGE = 250; //--- Determine the "safe" range for spawning units (no enemy units have to be present within this area)

//--- Towns: Spawn System
CTI_TOWNS_SPAWN_SV_MAX = 120; //--- Determine the max SV used for a town as a reference for AI units spawning (min max scaling)
CTI_TOWNS_SPAWN_SV_MIN = 20; //--- Determine the min SV used for a town as a reference for AI units spawning (min max scaling)
CTI_TOWNS_DYNAMIC_FPS_MODE = 1; //---Determine whether the host FPS should be used to define the amount of units spawning in towns (0: Disabled, 1: Use Server FPS)

//--- Towns: Supply
CTI_TOWNS_SUPPLY_MODE = 1; //--- Supply Mode: (0: Default, 1: Timed)
CTI_TOWNS_SUPPLY_TIME_INTERVAL = 85; //--- Determine the interval between each town SV increment with time
CTI_TOWNS_SUPPLY_TIME_INCREASE = 1; //--- Determine the town SV increment when the interval's reached (Potential upgrade?)

//--- Towns: Territorial
CTI_TOWNS_TERRITORIAL_MARKER_SIZE = [320, 320]; //--- Size of the helper marker

CTI_TOWNS_FLAG_TEXTURE_PEACE = "\A3\Data_F\Flags\Flag_white_CO.paa"; //--- Determines the texture used by a town's flag in peace mode

//--- Towns: Parameters
with missionNamespace do {
	if (isNil 'CTI_TOWNS_OCCUPATION') then {CTI_TOWNS_OCCUPATION = 1}; //--- Determine whether occupation is enabled or not
	if (isNil 'CTI_TOWNS_OCCUPATION_LIMIT_AI') then {CTI_TOWNS_OCCUPATION_LIMIT_AI = 150}; //--- Determine the soft limit for overall occupation Town AI
	if (isNil 'CTI_TOWNS_OCCUPATION_LIMIT_AI_QUEUE_RATIO') then {CTI_TOWNS_OCCUPATION_LIMIT_AI_QUEUE_RATIO = 40}; //--- Determine the AI queue ratio (Queued unit = Groups * ratio/100)
	if (isNil 'CTI_TOWNS_OCCUPATION_SKILL') then {CTI_TOWNS_OCCUPATION_SKILL = 50}; //--- Set Town Occupation Skill
	if (isNil 'CTI_TOWNS_OCCUPATION_LEVEL_RESISTANCE') then {CTI_TOWNS_OCCUPATION_LEVEL_RESISTANCE = 10}; //--Set town occ max group for resistance
	if (isNil 'CTI_TOWNS_OCCUPATION_LEVEL') then {CTI_TOWNS_OCCUPATION_LEVEL = 8}; //-- Set Town occ max group
	if (isNil 'CTI_TOWNS_OCCUPATION_RESISTANCE') then {CTI_TOWNS_OCCUPATION_RESISTANCE = 0}; //--- Set Town Occupation Forces
	if (isNil 'CTI_TOWNS_OCCUPATION_WEST') then {CTI_TOWNS_OCCUPATION_WEST = 0};
	if (isNil 'CTI_TOWNS_OCCUPATION_EAST') then {CTI_TOWNS_OCCUPATION_EAST = 0};
	if (isNil 'CTI_TOWNS_PEACE') then {CTI_TOWNS_PEACE = 180}; //--- Enable or disable the Town Peace mode (Expressed in seconds, 0 is disabled)
	if (isNil 'CTI_TOWNS_RESISTANCE_LIMIT_AI') then {CTI_TOWNS_RESISTANCE_LIMIT_AI = 150}; //--- Determine the soft limit for overall resistance Town AI
	if (isNil 'CTI_TOWNS_RESISTANCE_LIMIT_AI_QUEUE_RATIO') then {CTI_TOWNS_RESISTANCE_LIMIT_AI_QUEUE_RATIO = 40}; //--- Determine the AI queue ratio (Queued unit = Groups * ratio/100)
	if (isNil 'CTI_TOWNS_TERRITORIAL') then {CTI_TOWNS_TERRITORIAL = 0}; //--- Enable or disable the Territorial mode (Neighbors Capture)
	if (isNil 'CTI_TOWNS_CAPTURE_MODE') then {CTI_TOWNS_CAPTURE_MODE = 0}; //--- Require camps to capture town
};
//-----------------------------------------------------------------------------------------------------------------------//




//------------------------------------------------------BASE-------------------------------------------------------------//
/*
 * At the begining of the game an HQ is available for both side where the commander may build from it. It also act as a
 * mobile respawn point for your team.
 *
 * Structures such as Barracks, Light Vehicles Factory or even Command Center may be built from it. A repair truck may also
 * be used to construct defenses or special structures such as FOB.
 *
 * When a structure is placed, it goes in a "ruins" state where workers may build it up (the same applies on destruction). If
 * a structure in ruins state is left unattended for too long then it'll be removed.
 *
 * Defenses created near a Barracks will be automatically manned by an AI if enabled in both parameter and GUI.
 *
 * To prevent long games, bases need to be build in an area which is limited by a parameter
 *
 * - Common\Config\Base\Base_xxx.sqf: Define the structures and defenses for a side (where xxx is the side/faction)
 */


//--- Base: Air Radar
CTI_BASE_AIRRADAR_RANGES = [4000, 6000, 12000, 18000]; //--- Ranges used by the Air Radar (default + based on upgrade)
CTI_BASE_AIRRADAR_Z_OFFSET = 50; //--- Z Offset detection for Air Radar (0: Disabled)

//--- Base: Artillery Radar
CTI_BASE_ARTRADAR_MARKER_ACCURACY = 80; //--- Accuracy of the marker (Artillery Distance Radar / value)
CTI_BASE_ARTRADAR_MARKER_TIMEOUT = 400; //--- Time needed for an artillery marker to expire
CTI_BASE_ARTRADAR_RANGES = [4000, 6000, 12000, 18000]; //--- Ranges used by the Artillery Radar (default + based on upgrade)
CTI_BASE_ARTRADAR_REPORT_COOLDOWN = 300; //--- Time after which an artillery piece may be reported again
CTI_BASE_ARTRADAR_TRACK_FLIGHT_DELAY = 8; //--- Time after which a projectile is considered tracked (-1: Disabled)

//--- Base: Satellite
CTI_BASE_SATELLITE_RANGE_SATCAM = 15000; //--- Determine how far a player has to be from a factory to access the satellite
CTI_BASE_SATELLITE_BASE_DETECTION_RANGE = 500; //--- Distance from base enemies are detected
CTI_BASE_SATELLITE_BASE_DETECTION_TIME = 240;  //--- Detection cycle, time between scans
CTI_BASE_SATELLITE_BASE_BASECAM_HEIGHT = 400;  //--- Height of base camera

//--- Base: Area
CTI_BASE_AREA_RANGE = 250;

//--- Base: Construction
CTI_BASE_CONSTRUCTION_BOUNTY = 3; //--- The bounty awarded upon a hostile structure destruction
CTI_BASE_CONSTRUCTION_DEFENSE_BOUNTY = 0.3; //--- The bounty multiplier awarded upon a hostile defensive structure destruction
CTI_BASE_CONSTRUCTION_DECAY_TIMEOUT = 500; //--- Decay starts after x seconds unattended.
CTI_BASE_CONSTRUCTION_DECAY_DELAY = 10; //--- Decay each x seconds.
CTI_BASE_CONSTRUCTION_DECAY_FROM = 10; //--- Decay of x / 100 each y seconds.
CTI_BASE_CONSTRUCTION_RANGE = 250; //--- Determine how far the commander may be from the HQ to build
CTI_BASE_CONSTRUCTION_RATIO_INIT = 1; //--- The initial construction ratio
CTI_BASE_CONSTRUCTION_RATIO_ON_DEATH = 0.60; //--- The completion ratio is multiplied by this coefficient to make repairs less effective at each factory's destruction.
CTI_BASE_CONSTRUCTION_REFUNDS = 0.60; //--- The refund value of a structure (structure cost * x)
CTI_BASE_SELL_DELAY = 60; //--- Delay for factories to get sold.

//--- Base: Defenses
CTI_BASE_DEFENSES_AUTO_DELAY = 250; //--- Delay after which a new unit will replace a dead one for a defense
CTI_BASE_DEFENSES_AUTO_LIMIT = 30; //--- Amount of independent units which may man nearby defenses
CTI_BASE_DEFENSES_AUTO_RANGE = 250; //--- Range from the nearest barrack at which AI may auto man a defense
CTI_BASE_DEFENSES_AUTO_REARM_RANGE = 250; //--- Range needed for a defense to be able to rearm at a service point
CTI_BASE_DEFENSES_EMPTY_TIMEOUT = 350; //--- Delay after which an empty defense is considered empty
CTI_BASE_DEFENSES_SOLD_COEF = 0.25; //--- The player will get a fund return based on the defense price * coef when a defense is sold

//--- Base: HQ
CTI_BASE_HQ_BOUNTY = 2.50; //--- The bounty awarded upon HQ destruction
CTI_BASE_HQ_REPAIR_PRICE = 40000; //--- The cost needed to repair the HQ
CTI_BASE_HQ_REPAIR_RANGE = 100; //--- The range needed between the HQ wreck and the Repair Truck
CTI_BASE_HQ_REPAIR_TIME = 60; //--- The time needed to repair the HQ

//--- Base: Supply depots
CTI_BASE_SUPPLY_BASE_VALUE = 5000; //--- Max supply base value
CTI_BASE_SUPPLY_DEPOT_VALUE = 5000; //--- Supply depot supply value

//--- Base: Large FOB
CTI_TOWNS_LARGE_FOB_BUILD_DIRECTION = 0; //--- Determine the direction a vehicle will use while being spawned from the Large FOB
CTI_TOWNS_LARGE_FOB_BUILD_DISTANCE = 20; //--- Determine how far a unit/vehicle will spawn from the Large FOB
CTI_TOWNS_LARGE_FOB_CLASSNAME = ["Land_BagBunker_Large_F", "WarfareBDepot"]; //--- The classname(s) used for town depots in editor
CTI_TOWNS_LARGE_FOB_RANGE = 40; //--- Determine how far a player needs to be from a Large FOB in order to use it

//--- Base: Misc
CTI_BASE_NOOBPROTECTION = 1; //--- Make structures invulnerable to friendly fire
CTI_BASE_HEALTH_MULTIPLIER = [1, 1.25, 1.5, 1.75, 2]; //--- Factory health upgrade damage reduce multipliers
CTI_BASE_DISPLAY_HINT = 1; // 1 to enable, 0 to disable -- displays hint for player shooting enemy structure showing current building health. Also displays hint to the structure's friendly team showing base health, position, and name of structure

//--- Blow are damage modifiers, ammo type for them is set in Server_OnBuildingHandleVirtualDamage.sqf
//--- Bigger the numbers more damage that Ammo does!
//--- 1 means no extra damage will be applied, if you put in 0 the ammo wont do any damage at all.
CTI_BASE_DAMAGE_MULTIPLIER_SHELL = 4;//--- Tanks
CTI_BASE_DAMAGE_MULTIPLIER_ARTY = 0.5;//--- Arty
CTI_BASE_DAMAGE_MULTIPLIER_SATCHEL = 1;//--- Satchels
CTI_BASE_DAMAGE_MULTIPLIER_CANNON = 0.5;//--- HE Cannons
CTI_BASE_DAMAGE_MULTIPLIER_MISSLE = 0.5;//--- Missiles
CTI_BASE_DAMAGE_MULTIPLIER_FUEL = 0; //--- Players that trying to ram buildings, or if a unit blows up to bad spawn will not cause damage. 
CTI_BASE_DAMAGE_MULTIPLIER_ROCKETS = 0.5;//--- Rockets
CTI_BASE_DAMAGE_MULTIPLIER_BOMB = 0.5;//--- Bombs

//--- Base: Purchase range
CTI_BASE_GEAR_FOB_RANGE = 4; //--- Determine how far a player has to be from a FOB to access the Gear Menu
CTI_BASE_GEAR_LARGE_FOB_RANGE = 20; //--- Determine how far a player has to be from a FOB to access the Gear Menu
CTI_BASE_GEAR_RANGE = 250; //--- Determine how far a player has to be from a Barracks to access the Gear Menu
CTI_BASE_PURCHASE_UNITS_RANGE = 250; //--- Determine how far a player has to be from a factory to access the Factory Menu without CC
CTI_BASE_PURCHASE_UNITS_RANGE_CC = 15000; //--- Determine how far a player has to be from a factory to access the Factory Menu with CC

//--- Base: Workers
CTI_BASE_WORKERS_BUILD_COEFFICIENT = 1; //--- Worker build speed multiplier (<coefficient> / (<structure build time> / 100)), higher is faster.
CTI_BASE_WORKERS_BUILD_RANGE = 20; //--- Worker minimal build distance.
CTI_BASE_WORKERS_LIMIT = 10; //--- Maximum amount of worker which may be purchased by a side
CTI_BASE_WORKERS_PRICE = 300; //--- Worker price.
CTI_BASE_WORKERS_RANGE = 600; //--- Worker effective work area.
CTI_BASE_WORKERS_REPAIR = 0.0075; //--- Worker repair iteration per action over a structure.
CTI_BASE_WORKERS_REPAIR_RANGE = 25; //--- Worker repair range.
CTI_BASE_WORKERS_REPAIR_ENTITY = 0.005; //--- Worker repair iteration per action over a vehicle.
CTI_BASE_WORKERS_WANDER_RANGE = 60; //--- Worker may wander of x meters at a time.
CTI_BASE_WORKERS_WANDER_RANGE_MAX = 225; //--- Worker may wander no further than x meters from their center

//--- Base: Parameters
with missionNamespace do {
	if (isNil 'CTI_BASE_AREA_MAX') then {CTI_BASE_AREA_MAX = 2}; //--- Amount of base areas which may be built
	if (isNil 'CTI_BASE_CONSTRUCTION_MODE') then {CTI_BASE_CONSTRUCTION_MODE = 0}; //--- Construction mode to use for structures (0: Timed, 1: Workers)
	if (isNil 'CTI_BASE_FOB_MAX') then {CTI_BASE_FOB_MAX = 2}; //--- Maximum amount of FOBs which a side may place
	if (isNil 'CTI_BASE_LARGE_FOB_MAX') then {CTI_BASE_LARGE_FOB_MAX = 2}; //--- Maximum amount of Large FOBs which a side may place
	if (isNil 'CTI_BASE_HQ_REPAIR') then {CTI_BASE_HQ_REPAIR = 1}; //--- Determine whether the HQ can be repaired or not
	if (isNil 'CTI_BASE_STARTUP_PLACEMENT') then {CTI_BASE_STARTUP_PLACEMENT = 4000}; //--- Each side need to be further than x meters
};
//-----------------------------------------------------------------------------------------------------------------------//




//----------------------------------------------------VEHICLES-----------------------------------------------------------//
/*
 * Vehicles is a word with regroup units and vehicles, they are present on the battlefield and they are handled depending
 * on their nature.
 *
 * Vehicles such as cars, tanks, ships or aircraft are checked each x seconds for their emptiness and destroyed if they remain
 * empty for too long (this way we don't end up with 1000 cars on the map)
 *
 * Vehicles and units are cleaned up automatically by the server depending on the Garbage Collector settings
 *
 * - Server\FSM\update_garbage_collector.fsm: This handle the vehicles/units destruction "flow"
 * - Server\FSM\update_repairtruck.fsm: This handle the Repair Truck repairing "flow"
 * - Server\FSM\update_salvager.fsm: This handle the Salvager Truck "flow"
 * - Server\FSM\update_salvager_independent.fsm: This handle the Independent Salvager Truck "flow"
 * - Server\Functions\FSM\Functions_FSM_RepairTruck.sqf: Contains the functions related to the Repair Truck FSM
 */

//--- Vehicles: Misc
CTI_VEHICLES_EMPTY_SCAN_PERIOD = 15; //--- Scan for a crew member in a vehicle each x seconds
CTI_VEHICLES_HANDLER_EMPTY = 0; //--- Determine how an empty vehicle is handled by the engine (0: Typical delay, 1: delay AND the unit cannot move/fire)
CTI_VEHICLES_PROTECT_TIRES = 1; //--- Determine whether the damages applied to tires should be reduced or not

//--- Advanced Air Lifting settings
ASL_HEAVY_LIFTING_MIN_LIFT_OVERRIDE = 2700;

//--- Vehicles: Repair Trucks
CTI_VEHICLES_REPAIRTRUCK_BASE_BUILD_COEFFICIENT = 2; //--- Repair trucks build speed multiplier (<coefficient> / (<structure build time> / 100)), higher is faster.
CTI_VEHICLES_REPAIRTRUCK_BASE_REPAIR = 0.01; //--- Repair trucks repair iteration per action over a structure.
CTI_VEHICLES_REPAIRTRUCK_BASE_REPAIR_RANGE = 25; //--- Repair trucks may repair structures in that range
CTI_VEHICLES_REPAIRTRUCK_BUILD_TAX_COEFFICIENT = 2; //--- Repair truck build tax multiplier
CTI_VEHICLES_DEFENSETRUCK_BUILD_TAX_COEFFICIENT = 2; //--- Defense truck build tax multiplier

//--- Vehicles: Salvage Trucks
CTI_VEHICLES_SALVAGE_INDEPENDENT_MAX = 2; //--- Maximum amount of Independent Salvage Trucks which may be present per side
CTI_VEHICLES_SALVAGE_INDEPENDENT_EFFECTIVE_RANGE = 5000; //--- An independent Salvage may search for wreck up to x meters
CTI_VEHICLES_SALVAGE_RATE = 0.4; //--- This coefficient determine the value of a salvaged wreck (wreck value * x)
CTI_VEHICLES_SALVAGE_RANGE = 300; //--- This is the distance required between a Wreck and Salvage Truck
CTI_VEHICLES_SALVAGER_PRICE = 550; //--- Determine the cost of the salvage trucks

//--- Vehicles: FUEL CONSUMPTION
//--- Formula: 1 / (60*Minutes) = EXAMPLE for 60min runtime -- 1/(60*60) = 0.00027
CTI_VEHICLES_FUEL_CONSUMPTION_ALL = 0.00014; //---default consumption rate every 1s - 120min
CTI_VEHICLES_FUEL_CONSUMPTION_TANKS = 0.000208; //---tanks consumption rate - 80min 
CTI_VEHICLES_FUEL_CONSUMPTION_HELIS = 0.000416; //---heli consumption rate - 40min
CTI_VEHICLES_FUEL_CONSUMPTION_PLANES = 0.00055; //---planes consumption rate - 30min
CTI_VEHICLES_FUEL_CONSUMPTION_UAV = 0.00055; //---uav consumption rate - 30min
CTI_VEHICLES_FUEL_CONSUMPTION_SHIPS = 0.0000694; //---ships consumption rate - 240min - 4hrs
CTI_VEHICLES_FUEL_CONSUMPTION_MHQ = 0.000277; //---mhq consumption rate - 60min
CTI_VEHICLES_FUEL_CONSUMPTION_SPECIAL = 0.0000001; //---special units consumption rate

//--- Vehicles: LVOSS and ERA SYSTEMS
CTI_VEHICLES_APS_SCAN_DISTANCE = 6000; //--- Scan distance for LVOSS and ERA scripts, must be fired within this range to detect
CTI_VEHICLES_LVOSS_COOLDOWN_TIME = 120; //--- Max cooldown time between LVOSS charges, upgrades remove 30s - 120/90
CTI_VEHICLES_ERA_COOLDOWN_TIME = 150; //--- Max cooldown time between ERA charges, upgrades remove 30s - 150/120/90/60

//--- Vehicles: Parameter
with missionNamespace do {
	if (isNil 'CTI_VEHICLES_AIR_FFAR') then {CTI_VEHICLES_AIR_FFAR = 1}; //--- AA Missiles availability (0: Disabled, 1: Enabled on Upgrade, 2: Enabled)
	if (isNil 'CTI_VEHICLES_AIR_DAR') then {CTI_VEHICLES_AIR_DAR = 1}; //--- AA Missiles availability (0: Disabled, 1: Enabled on Upgrade, 2: Enabled)
	if (isNil 'CTI_VEHICLES_AIR_AA') then {CTI_VEHICLES_AIR_AA = 1}; //--- AA Missiles availability (0: Disabled, 1: Enabled on Upgrade, 2: Enabled)
	if (isNil 'CTI_VEHICLES_AIR_AT') then {CTI_VEHICLES_AIR_AT = 1}; //--- AT Missiles availability (0: Disabled, 1: Enabled on Upgrade, 2: Enabled)
	if (isNil 'CTI_VEHICLES_AIR_CM') then {CTI_VEHICLES_AIR_CM = 1}; //--- Countermeasures availability (0: Disabled, 1: Enabled on Upgrade, 2: Enabled)
	if (isNil 'CTI_VEHICLES_EMPTY_TIMEOUT') then {CTI_VEHICLES_EMPTY_TIMEOUT = 900}; //--- set default vehicles timeout
	if (isNil 'CTI_VEHICLES_EMPTY_SPECIAL_TIMEOUT') then {CTI_VEHICLES_EMPTY_SPECIAL_TIMEOUT = 3600}; //--- set special vehicles timeout
};
//-----------------------------------------------------------------------------------------------------------------------//

CTI_ARTILLERY_FILTER = 1; //--- Toggle artillery magazines like mines and AT mines (0: Disabled, 1: Enabled)
CTI_ARTILLERY_TIMEOUT = 380; //--- Delay between each fire mission

CTI_BOUNTY_COEF = 0.30; //--- Bounty coefficient multiplicator based on the unit original cost
CTI_BOUNTY_COEF_PVP = 1.2; //--- Bounty coefficient multiplicator based on the killed unit score

CTI_COIN_AREA_DEFAULT = [30, 10];
CTI_COIN_AREA_HQ_DEPLOYED = [CTI_BASE_AREA_RANGE, 25];
CTI_COIN_AREA_HQ_MOBILIZED = [80, 10]; //--- To incrase build area when mobile
CTI_COIN_AREA_REPAIR = [45, 10];
CTI_COIN_AREA_DEFENSE = [30, 6];

CTI_ECONOMY_POOL_RESOURCES_PERCENTAGE_MIN = 30; //--- Keep values of 10

CTI_MARKERS_OPACITY = 0.3;
CTI_MARKERS_TOWN_AREA_RANGE = 320;
CTI_MARKERS_UNITS_DEAD_DELAY = 50;
CTI_MARKERS_VEHICLES_DEAD_DELAY = 125;

CTI_PLAYER_DEFAULT_ALIAS = "Soldier";

CTI_RESPAWN_AI_RANGE = 600;
CTI_RESPAWN_CAMPS_CONDITION_LIMITED = 10; //--- With this condition, a unit may only spawn x times on a camp during a capture cycle
CTI_RESPAWN_CAMPS_CONDITION_PRICED_COEF_ENEMY = 5; //--- Coefficient applied upon camp fee on enemy held town respawn
CTI_RESPAWN_CAMPS_CONDITION_PRICED_COEF_FRIENDLY = 5; //--- Coefficient applied upon camp fee on friendly held town respawn
CTI_RESPAWN_CAMPS_RANGE_CLASSIC = 2000; //--- Determine the range needed to respawn at a town's camps (from the town center)
CTI_RESPAWN_CAMPS_RANGE_ENHANCED = 2000; //--- Determine the range needed to respawn at a town's camps (from a camp)
CTI_RESPAWN_CAMPS_SAFE = 1; //--- Disable a camp's respawn if enemies are around it
CTI_RESPAWN_CAMPS_SAFE_RANGE = 25; //--- Disable respawn if enemies are within this range
CTI_RESPAWN_MOBILE_SAFE = 1; //--- Disable a mobile respawn's respawn if enemies are around it
CTI_RESPAWN_MOBILE_SAFE_RANGE = 50; //--- Disable respawn if enemies are within this range
CTI_RESPAWN_MOBILE_RANGE = 500;

CTI_SATCAM_ZOOM_MIN = 50;
CTI_SATCAM_ZOOM_MAX = 800;

CTI_SERVICE_PRICE_REPAIR = 300;
CTI_SERVICE_PRICE_REPAIR_COEF = 0;
CTI_SERVICE_PRICE_REAMMO = 350;
CTI_SERVICE_PRICE_REAMMO_COEF = 0.10;
CTI_SERVICE_PRICE_REFUEL = 200;
CTI_SERVICE_PRICE_REFUEL_COEF = 0;
CTI_SERVICE_PRICE_HEAL = 50;
CTI_SERVICE_PRICE_DEPOT_COEF = 0;
CTI_SERVICE_PRICE_LARGE_FOB_COEF = 0;

CTI_MORTAR_REARM_RATIO=9;
CTI_ART_REARM_RATIO=15;
CTI_AIR_REARM_RATIO=3;

//todo: add fuel & heal later on
CTI_SERVICE_AMMO_DEPOT_RANGE = 300;
CTI_SERVICE_AMMO_DEPOT_TIME = 30;
CTI_SERVICE_AMMO_TRUCK_RANGE = 50;
CTI_SERVICE_AMMO_TRUCK_TIME = 60;
CTI_SERVICE_AMMO_TOWN_DEPOT_TIME = 50;
CTI_SERVICE_AMMO_LARGE_FOB_TIME = 50;
CTI_SERVICE_REPAIR_DEPOT_RANGE = 300;
CTI_SERVICE_REPAIR_DEPOT_TIME = 30;
CTI_SERVICE_REPAIR_TRUCK_RANGE = 10;
CTI_SERVICE_FUEL_TRUCK_RANGE = 10;
CTI_SERVICE_FUEL_TRUCK_TIME = 30;
CTI_SERVICE_DEFENSE_TRUCK_RANGE = 10;
CTI_SERVICE_REPAIR_TRUCK_TIME = 50;
CTI_SERVICE_AMMO_BOX_RANGE = 10;
CTI_SERVICE_AMMO_BOX_TIME = 120;
CTI_SERVICE_REPAIR_TOWN_DEPOT_TIME = 50;
CTI_SERVICE_REPAIR_LARGE_FOB_TIME = 50;
CTI_SERVICE_GEAR_RANGE = 15;

CTI_SCORE_BUILD_VALUE_PERPOINT = 1500; //--- Structure value / x
CTI_SCORE_SALVAGE_VALUE_PERPOINT = 2000; //--- Unit value / x
CTI_SCORE_TOWN_VALUE_PERPOINT = 100; //--- Town value / x
CTI_SCORE_CAMP_VALUE_PERPOINT = 50; //--- Camp value / x

CTI_UI_TOWNS_PROGRESSBAR_DISTANCE = 320;

CTI_GC_DELAY = 90;
CTI_GC_DELAY_AIR = 360;
CTI_GC_DELAY_CAR = 240;
CTI_GC_DELAY_MAN = 60;
CTI_GC_DELAY_TANK = 300;
CTI_GC_DELAY_SHIP = 60;
CTI_GC_DELAY_STATIC = 80;
CTI_GC_DELAY_BUILDING = 30;
CTI_GC_GROUND_CLEANUP_KIND = ["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated", "CraterLong_small", "CraterLong"];
CTI_GC_GROUND_CLEANUP_DISTANCE_UNIT = 30;
CTI_GC_CLEANUP_MAN = 0; //--- 1 to enable / 0 to disable -Instant clean up on death, some times dont work for Players.

CTI_HALO_COOLDOWN = 300;
CTI_HALO_LASTTIME = CTI_HALO_COOLDOWN;
CTI_HALO_ALTITUDE = 1200;
CTI_HALO_RATIO = 1;
CTI_HALO_COST = 1000;

if (isNil 'CTI_DEV_MODE') then {CTI_DEV_MODE = 1};
CTI_VOTE_TIME = 60; //--- Commander Vote time
if (CTI_DEV_MODE > 0) then {
	CTI_VOTE_TIME = 8;
};

//--- SHK Specific
CTI_SHK_BUILDING_ENABLED = true;
CTI_SHK_BUILDING_PLACEMENT_CHANCE = 80; //--- An AI Group has x% of chance to be placed in a building
CTI_SHK_BUILDING_SAFE_RANGE = 80; //--- Determine whether a building should be used for unit positioning or not if units are present within this range
CTI_SHK_BUILDING_SCAN_RANGE = 120; //--- The range used to search for building from the town's center
CTI_SHK_BUILDING_SCAN_RANGE_RAN = 50; //--- Add a random range, works as min max -> RANGE + (random value - random value)
CTI_SHK_GROUP_SIZE_MAX = 12; //--- If the group has more than x members, skip it

//---  OFPS Core Pack Check --- SET ALL EXTERNAL SOUND FILE CLASSNAMES HERE----------------------------------------------------------
if (OFPS_Core_Loaded) then {
	CTI_SOUND_nosound = "nosound";//Silent Mod No Sound External Class
	CTI_SOUND_prison = "prison";
	CTI_SOUND_nuke = "nuke";
	CTI_SOUND_nuclear_boom = "nuclear_boom";
	CTI_SOUND_nuclear_heartbeat = "nuclear_heartbeat";
	CTI_SOUND_uclear_geiger = "nuclear_geiger";
	CTI_SOUND_geiger_1 = "geiger_1";
	CTI_SOUND_geiger_2 = "geiger_2";
	CTI_SOUND_geiger_3 = "geiger_3";
	CTI_SOUND_akbar = "akbar";
	CTI_SOUND_choppa = "choppa";
	CTI_SOUND_incoming = "incoming";
	CTI_SOUND_Vent = "Vent";
	CTI_SOUND_Vent2 = "Vent2";
	CTI_SOUND_Para = "Para";
	CTI_SOUND_valkyries = "valkyries";
	CTI_SOUND_valkyries_loud = "valkyries_loud";
	CTI_SOUND_joytotheworld = "joytotheworld";
	CTI_SOUND_jinglebellrocks = "jinglebellrocks";
	CTI_SOUND_herecomessantaclaus = "herecomessantaclaus";
	CTI_SOUND_rockinaroundthechristmastree = "rockinaroundthechristmastree";
	CTI_SOUND_purgesiren = "purgesiren";
	CTI_SOUND_purgesiren_1 = "purgesiren_1";
	CTI_SOUND_purgesiren_2 = "purgesiren_2";
	CTI_SOUND_purgesiren_3 = "purgesiren_3";
	CTI_SOUND_marchinhome = "marchinhome";
	//weather effects
	CTI_SOUND_MKY_Blizzard = "MKY_Blizzard";
	CTI_SOUND_MKY_Snowfall = "MKY_Snowfall";
	CTI_SOUND_bcg_wind = "bcg_wind";
	CTI_SOUND_rafala_1 = "rafala_1";
	CTI_SOUND_rafala_2 = "rafala_2";
	CTI_SOUND_rafala_6 = "rafala_6";
	CTI_SOUND_rafala_7 = "rafala_7";
	CTI_SOUND_rafala_8 = "rafala_8";
	CTI_SOUND_rafala_9 = "rafala_9";
	CTI_SOUND_tree_crack_1 = "tree_crack_1";
	CTI_SOUND_tree_crack_2 = "tree_crack_2";
	CTI_SOUND_tree_crack_3 = "tree_crack_3";
	CTI_SOUND_tree_crack_4 = "tree_crack_4";
	CTI_SOUND_tree_crack_5 = "tree_crack_5";
	CTI_SOUND_tree_crack_6 = "tree_crack_6";
	CTI_SOUND_tree_crack_7 = "tree_crack_7";
	CTI_SOUND_tree_crack_8 = "tree_crack_8";
	CTI_SOUND_tree_crack_9 = "tree_crack_9";
	CTI_SOUND_lup_01 = "lup_01";
	CTI_SOUND_lup_02 = "lup_02";
	CTI_SOUND_lup_03 = "lup_03";
	CTI_SOUND_tremurat_1 = "tremurat_1";
	CTI_SOUND_tremurat_2 = "tremurat_2";
	CTI_SOUND_tremurat_4 = "tremurat_3";
	CTI_SOUND_tremurat_5 = "tremurat_4";
	CTI_SOUND_tuse_1 = "tuse_1";
	CTI_SOUND_tuse_2 = "tuse_2";
	CTI_SOUND_tuse_3 = "tuse_3";
	CTI_SOUND_tuse_4 = "tuse_4";
	CTI_SOUND_tuse_5 = "tuse_5";
	CTI_SOUND_tuse_6 = "tuse_6";
	CTI_SOUND_uragan_1 = "uragan_1";
	CTI_SOUND_rafala_4_dr = "rafala_4_dr";
	CTI_SOUND_rafala_5_st = "rafala_5_st";
	CTI_SOUND_sandstorm = "sandstorm";
} else {
	//SETUP ALL VANILLA BACKUP SOUNDS HERE --- IF NOT BACKUP SOUND USE NOMODSOUND FOR EMPTY
	CTI_SOUND_nosound = "nomodsound";//nomodsound -- BACKUP SILENT LOCAL SOUNDCLASS
	CTI_SOUND_prison = "nomodsound";
	CTI_SOUND_nuke = "nomodsound";
	CTI_SOUND_nuclear_boom = "nomodsound";
	CTI_SOUND_nuclear_heartbeat = "nomodsound";
	CTI_SOUND_uclear_geiger = "nomodsound";
	CTI_SOUND_geiger_1 = "nomodsound";
	CTI_SOUND_geiger_2 = "nomodsound";
	CTI_SOUND_geiger_3 = "nomodsound";
	CTI_SOUND_akbar = "nomodsound";
	CTI_SOUND_choppa = "nomodsound";
	CTI_SOUND_incoming = "nomodsound";
	CTI_SOUND_Vent = "nomodsound";
	CTI_SOUND_Vent2 = "nomodsound";
	CTI_SOUND_Para = "nomodsound";
	CTI_SOUND_valkyries = "nomodsound";
	CTI_SOUND_valkyries_loud = "nomodsound";
	CTI_SOUND_joytotheworld = "nomodsound";
	CTI_SOUND_jinglebellrocks = "nomodsound";
	CTI_SOUND_herecomessantaclaus = "nomodsound";
	CTI_SOUND_rockinaroundthechristmastree = "nomodsound";
	CTI_SOUND_purgesiren = "nomodsound";
	CTI_SOUND_purgesiren_1 = "nomodsound";
	CTI_SOUND_purgesiren_2 = "nomodsound";
	CTI_SOUND_purgesiren_3 = "nomodsound";
	CTI_SOUND_marchinhome = "nomodsound";
	CTI_SOUND_MKY_Blizzard = "nomodsound";
	CTI_SOUND_MKY_Snowfall = "nomodsound";
	CTI_SOUND_bcg_wind = "nomodsound";
	CTI_SOUND_rafala_1 = "nomodsound";
	CTI_SOUND_rafala_2 = "nomodsound";
	CTI_SOUND_rafala_6 = "nomodsound";
	CTI_SOUND_rafala_7 = "nomodsound";
	CTI_SOUND_rafala_8 = "nomodsound";
	CTI_SOUND_rafala_9 = "nomodsound";
	CTI_SOUND_tree_crack_1 = "nomodsound";
	CTI_SOUND_tree_crack_2 = "nomodsound";
	CTI_SOUND_tree_crack_3 = "nomodsound";
	CTI_SOUND_tree_crack_4 = "nomodsound";
	CTI_SOUND_tree_crack_5 = "nomodsound";
	CTI_SOUND_tree_crack_6 = "nomodsound";
	CTI_SOUND_tree_crack_7 = "nomodsound";
	CTI_SOUND_tree_crack_8 = "nomodsound";
	CTI_SOUND_tree_crack_9 = "nomodsound";
	CTI_SOUND_lup_01 = "nomodsound";
	CTI_SOUND_lup_02 = "nomodsound";
	CTI_SOUND_lup_03 = "nomodsound";
	CTI_SOUND_tremurat_1 = "nomodsound";
	CTI_SOUND_tremurat_2 = "nomodsound";
	CTI_SOUND_tremurat_4 = "nomodsound";
	CTI_SOUND_tremurat_5 = "nomodsound";
	CTI_SOUND_tuse_1 = "nomodsound";
	CTI_SOUND_tuse_2 = "nomodsound";
	CTI_SOUND_tuse_3 = "nomodsound";
	CTI_SOUND_tuse_4 = "nomodsound";
	CTI_SOUND_tuse_5 = "nomodsound";
	CTI_SOUND_tuse_6 = "nomodsound";
	CTI_SOUND_uragan_1 = "nomodsound";
	CTI_SOUND_rafala_4_dr = "nomodsound";
	CTI_SOUND_rafala_5_st = "nomodsound";
	CTI_SOUND_sandstorm = "nomodsound";
};	

with missionNamespace do {

	if (isNil 'CTI_FACTION_WEST') then {CTI_FACTION_WEST = 0};
	if (isNil 'CTI_FACTION_EAST') then {CTI_FACTION_EAST = 0};
	
	if (isNil 'CTI_FACTION_DEFAULT_VEHICLES') then {CTI_FACTION_DEFAULT_VEHICLES = 0};
	if (isNil 'CTI_FACTION_DEFAULT_GEAR') then {CTI_FACTION_DEFAULT_GEAR = 0};
	if (isNil 'CTI_FACTION_DEFAULT_TROOPS') then {CTI_FACTION_DEFAULT_TROOPS = 0};

	if (isNil 'CTI_ARTILLERY_SETUP') then {CTI_ARTILLERY_SETUP = 0}; //--- Artillery status (-2: Disabled, -1: Artillery Computer, 0: Short, 1: Medium, 2: Long, 3: Far)

	if (isNil 'CTI_ECONOMY_INCOME_CYCLE') then {CTI_ECONOMY_INCOME_CYCLE = 60};

	CTI_ECONOMY_POOL_AWARD_PERCENTAGE_WEST = 0.1;
	CTI_ECONOMY_POOL_AWARD_PERCENTAGE_EAST = 0.1;
	CTI_ECONOMY_POOL_RESOURCES_PERCENTAGE_WEST = 0.3;
	CTI_ECONOMY_POOL_RESOURCES_PERCENTAGE_EAST = 0.3;

	if (isNil 'CTI_ECONOMY_STARTUP_FUNDS_EAST') then {CTI_ECONOMY_STARTUP_FUNDS_EAST = 900};
	if (isNil 'CTI_ECONOMY_STARTUP_FUNDS_EAST_COMMANDER') then {CTI_ECONOMY_STARTUP_FUNDS_EAST_COMMANDER = 9000};
	if (isNil 'CTI_ECONOMY_STARTUP_FUNDS_WEST') then {CTI_ECONOMY_STARTUP_FUNDS_WEST = 900};
	if (isNil 'CTI_ECONOMY_STARTUP_FUNDS_WEST_COMMANDER') then {CTI_ECONOMY_STARTUP_FUNDS_WEST_COMMANDER = 9000};

	if (isNil 'CTI_ECONOMY_STARTUP_SUPPLY_EAST') then {CTI_ECONOMY_STARTUP_SUPPLY_EAST = 1200};
	if (isNil 'CTI_ECONOMY_STARTUP_SUPPLY_WEST') then {CTI_ECONOMY_STARTUP_SUPPLY_WEST = 1200};

	
	if (CTI_DEV_MODE > 0) then {
		CTI_ECONOMY_STARTUP_FUNDS_EAST = 1000000;
		CTI_ECONOMY_STARTUP_FUNDS_EAST_COMMANDER = 1000000;
		CTI_ECONOMY_STARTUP_SUPPLY_EAST = 1000000;
		CTI_ECONOMY_STARTUP_FUNDS_WEST = 1000000;
		CTI_ECONOMY_STARTUP_FUNDS_WEST_COMMANDER = 1000000;
		CTI_ECONOMY_STARTUP_SUPPLY_WEST = 1000000;
	};

	if (isNil 'CTI_ECONOMY_TOWNS_OCCUPATION') then {CTI_ECONOMY_TOWNS_OCCUPATION = 1}; //--- Determine if towns need to be occupied to bring more resources

	if (isNil 'CTI_GRAPHICS_VD_MAX') then {CTI_GRAPHICS_VD_MAX = 2500};
	if (isNil 'CTI_GRAPHICS_TG_MAX') then {CTI_GRAPHICS_TG_MAX = 50};

	if (isNil 'CTI_RESPAWN_AI') then {CTI_RESPAWN_AI = 1};
	if (isNil 'CTI_RESPAWN_CAMPS') then {CTI_RESPAWN_CAMPS = 1}; //--- Camp mode (1: Classic, 2: Nearby)
	if (isNil 'CTI_RESPAWN_CAMPS_CONDITION') then {CTI_RESPAWN_CAMPS_CONDITION = 2}; //--- Camp respawn condition (0: Unlimited, 1: Priced, 2: Limited per capture)
	if (isNil 'CTI_RESPAWN_FOB_RANGE') then {CTI_RESPAWN_FOB_RANGE = 1750}; //--- Range at which a unit can spawn at a FOB
	if (isNil 'CTI_RESPAWN_LARGE_FOB_RANGE') then {CTI_RESPAWN__LARGE_FOB_RANGE = 2500}; //--- Range at which a unit can spawn at a Large FOB
	if (isNil 'CTI_RESPAWN_MOBILE') then {CTI_RESPAWN_MOBILE = 1};
	if (isNil 'CTI_RESPAWN_TIMER') then {CTI_RESPAWN_TIMER = 30};

	if (isNil 'CTI_TEAMSWAP') then {CTI_TEAMSWAP = 1};
	if (isNil 'CTI_TEAMSTACK') then {CTI_TEAMSTACK = 1};

	if (isNil 'CTI_MARKERS_INFANTRY') then {CTI_MARKERS_INFANTRY = 1}; //--- Track infantry on map

	if (isNil 'CTI_PLAYERS_GROUPSIZE') then {CTI_PLAYERS_GROUPSIZE = 4}; //--Limit Player AI

	if (isNil 'CTI_UNITS_FATIGUE') then {CTI_UNITS_FATIGUE = 0};
	if (isNil 'CTI_UNITS_FUEL_CONSUMPTION') then {CTI_UNITS_FUEL_CONSUMPTION = 1};
	if (isNil 'CTI_GAMEPLAY_3P') then {CTI_GAMEPLAY_3P = -1};
	if (isNil 'CTI_WEAPON_SWAY') then {CTI_WEAPON_SWAY = 50};
	if (isnil 'CTI_SM_NONV') then {CTI_SM_NONV = 1};
	if (isnil 'CTI_SM_NV_THER_VEH') then {CTI_SM_NV_THER_VEH = 0};

	if (isNil 'CTI_WEATHER_FAST') then {CTI_WEATHER_FAST = 12};
	if (isNil 'CTI_WEATHER_FAST_NIGHT') then {CTI_WEATHER_FAST_NIGHT = 1};
	if (isNil 'CTI_WEATHER_INITIAL') then {CTI_WEATHER_INITIAL = 10};
	if (isNil 'CTI_WEATHER_RAIN') then {CTI_WEATHER_RAIN = -1};
	if (isNil 'CTI_WEATHER_RAIN_COEF') then {CTI_WEATHER_RAIN_COEF = -1};
	if (isNil 'CTI_WEATHER_SNOW') then {CTI_WEATHER_SNOW = 0};
	if (isNil 'CTI_WEATHER_SNOW_COEF') then {CTI_WEATHER_SNOW_COEF = -1};
	if (isNil 'CTI_WEATHER_DUST') then {CTI_WEATHER_DUST = 0};
	if (isNil 'CTI_WEATHER_DUST_COEF') then {CTI_WEATHER_DUST_COEF = -1};
	if (isNil 'CTI_WEATHER_MONSOON') then {CTI_WEATHER_MONSOON = 0};
	if (isNil 'CTI_WEATHER_MONSOON_COEF') then {CTI_WEATHER_MONSOON_COEF = -1};
	if (isNil 'CTI_WEATHER_OVERCAST') then {CTI_WEATHER_OVERCAST = -1};
	if (isNil 'CTI_WEATHER_OVERCAST_COEF') then {CTI_WEATHER_OVERCAST_COEF = -1};
	if (isNil 'CTI_WEATHER_FOG') then {CTI_WEATHER_FOG = -1};
	if (isNil 'CTI_WEATHER_FOG_COEF') then {CTI_WEATHER_FOG_COEF = -1};
	if (isNil 'CTI_WEATHER_FOG_DECAY') then {CTI_WEATHER_FOG_DECAY = -1};
	if (isNil 'CTI_WEATHER_FOG_DECAY_COEF') then {CTI_WEATHER_FOG_DECAY_COEF = -1};
	if (isNil 'CTI_WEATHER_FOG_ALT') then {CTI_WEATHER_FOG_ALT = -1};
	if (isNil 'CTI_WEATHER_FOG_ALT_COEF') then {CTI_WEATHER_FOG_ALT_COEF = -1};
	if (isNil 'CTI_WEATHER_WIND') then {CTI_WEATHER_WIND = -1};
	if (isNil 'CTI_WEATHER_WIND_COEF') then {CTI_WEATHER_WIND_COEF = -1};
	if (isNil 'CTI_WEATHER_WAVES') then {CTI_WEATHER_WAVES = -1};
	if (isNil 'CTI_WEATHER_WAVES_COEF') then {CTI_WEATHER_WAVES_COEF = -1};
	if (isNil 'CTI_WEATHER_VARIANCE_TIME') then {CTI_WEATHER_VARIANCE_TIME = -1};
	if (isNil 'CTI_WEATHER_STORM_TIME') then {CTI_WEATHER_STORM_TIME = -1};

	if (isNil 'CTI_APEX_ADDON') then {CTI_APEX_ADDON = 1};
	if (isNil 'CTI_CUP_ADDON') then {CTI_CUP_ADDON = 1};
	if (isNil 'CTI_CUP_CORE_ADDON') then {CTI_CUP_CORE_ADDON = 0};
	if (isNil 'CTI_OFPS_ADDON') then {CTI_OFPS_ADDON = 1};
	if (isNil 'CTI_RHS_ADDON') then {CTI_RHS_ADDON = 0};

	if (isNil 'CTI_DEV_MODE') then {CTI_DEV_MODE = 0};
	if (isNil 'CTI_ZOMBIE_MODE') then {CTI_ZOMBIE_MODE = 0};
	if (isNil 'CTI_GUERILLA_MODE') then {CTI_GUERILLA_MODE = 0};
	
	if (isnil "CTI_GAMEPLAY_DARTER") then {CTI_GAMEPLAY_DARTER = 2000};

};