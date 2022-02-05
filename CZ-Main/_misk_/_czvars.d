/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

nový soubor
CZ_VERSION, CZ_VERFLAG - deklarace nových konstant a proměnných (kvůli identifikaci verze hry)
var int CZ_GDRPC_Timer - deklarace nové proměnné (kvůli snížení frekvence volání GDRPC API)
var int CZ_Settings_Diff_EnableFullCompanionXP - deklarace nové proměnné (kvůli přidání nového nastavení)


v1.01:		(přesunuto ze souboru "(...)\_misk_\T_MAX_HP.d")

var int MageSpeechCount - deklarace nové proměnné (kvůli titulkům dialogu Xardas vs. Pyrokar)
var int OpenFireCaveAgain_CZ - deklarace nové proměnné (kvůli úkolu Zbraň velkého lovce (TOPIC_TagNorGrHunWeap))
var int CloseFireCaveAgain_CZ - deklarace nové proměnné (kvůli úkolu Zbraň velkého lovce (TOPIC_TagNorGrHunWeap))
CZ TELEPORTY - deklarace nových proměnných (kvůli nově přidaným teleportům)
CZ SETTINGS - deklarace nových proměnných (kvůli přidání nových nastavení)


v1.00:		(přesunuto ze souboru "(...)\_misk_\T_MAX_HP.d")

const int BILGOTHUNTFOOD - deklarace nové konstanty (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))
var int BookBonus_162 - deklarace nové proměnné (kvůli opravě bonusu po přečtení)
var int BookBonus_163 - deklarace nové proměnné (kvůli opravě bonusu po přečtení)

*/


const int CZ_VERFLAG_BETA = 000;
const int CZ_VERFLAG_RC = 100;
const int CZ_VERFLAG_RELEASE = 200;

const int CZ_VERSION_CURRENT = (1000 * 010200 + CZ_VERFLAG_RELEASE + 00);
const int CZ_VERSION_MINIMUM = (1000 * 010200 + CZ_VERFLAG_RELEASE + 00);
var int CZ_VERSION_SAVEGAME;

const int BILGOTHUNTFOOD = 15;

var int BookBonus_162;
var int BookBonus_163;

var int MageSpeechCount;

var int OpenFireCaveAgain_CZ;
var int CloseFireCaveAgain_CZ;

var int CZ_GDRPC_Timer;



/*     // ----- CZ TELEPORTY ----- \\     */

var int LOC_ADV_ERHAZIR_CZ_TP_OK;
var int LOC_ADW_TELEPORTSQUARE_CZ_TP_OK;
var int LOC_ADW_GOLDDRAGON_CZ_TP_OK;
var int LOC_NW_DOWNTOWN_CZ_TP_OK;
var int LOC_NW_HAFEN_CZ_TP_OK;
var int LOC_NW_ATROS_CZ_TP_OK;
var int LOC_PF_AZGAN_CZ_TP_OK;
var int LOC_DG_CREOL_CZ_TP_OK;
var int LOC_OW_ORCCITY_CZ_TP_OK;
var int LOC_OW_SLEEPERTEMPLE_CZ_TP_OK;
var int LOC_OW_DARRION_CZ_TP_OK;
var int LOC_OW_HIGHROCK_CZ_TP_OK;
var int LOC_OC_URTHRALL_CZ_TP_OK;
var int LOC_OC_ARENA_CZ_TP_OK;
var int LOC_OC_ORCMINE_CZ_TP_OK;
var int LOC_OC_SHVENTRANCE_CZ_TP_OK;
// var int LOC_SHV_OCPORTAL_CZ_TP_OK;
// var int LOC_SHV_HUMANCAMP_CZ_TP_OK;
// var int LOC_SHV_ORCCAMP_CZ_TP_OK;
// var int LOC_SHV_AZGALOR_CZ_TP_OK;



var int ADV_ERHAZIR_CZ_TP_OK;
var int ADW_TELEPORTSQUARE_CZ_TP_OK;
var int ADW_GOLDDRAGON_CZ_TP_OK;
var int NW_DOWNTOWN_CZ_TP_OK;
var int NW_HAFEN_CZ_TP_OK;
var int NW_ATROS_CZ_TP_OK;
var int PF_AZGAN_CZ_TP_OK;
var int DG_CREOL_CZ_TP_OK;
var int OW_ORCCITY_CZ_TP_OK;
var int OW_SLEEPERTEMPLE_CZ_TP_OK;
var int OW_DARRION_CZ_TP_OK;
var int OW_HIGHROCK_CZ_TP_OK;
var int OC_URTHRALL_CZ_TP_OK;
var int OC_ARENA_CZ_TP_OK;
var int OC_ORCMINE_CZ_TP_OK;
var int OC_SHVENTRANCE_CZ_TP_OK;
var int SHV_OCPORTAL_CZ_TP_OK;
var int SHV_HUMANCAMP_CZ_TP_OK;
var int SHV_ORCCAMP_CZ_TP_OK;
var int SHV_AZGALOR_CZ_TP_OK;

/*     \\ ----- CZ TELEPORTY ----- //     */



/*     // ----- CZ SETTINGS ----- \\     */

var int CZ_Settings_Diff_HPPerLevel;
var int CZ_Settings_Diff_LPPerLevel;

var int CZ_Settings_Diff_XPMult;

var int CZ_Settings_Diff_HungerPoolBase;
var int CZ_Settings_Diff_HungerPoolLevelMult;
var int CZ_Settings_Diff_ThirstPoolBase;
var int CZ_Settings_Diff_ThirstPoolLevelMult;
var int CZ_Settings_Diff_FatiguePoolBase;
var int CZ_Settings_Diff_FatiguePoolLevelMult;

var int CZ_Settings_Diff_EnableHunger;
var int CZ_Settings_Diff_EnableThirst;
var int CZ_Settings_Diff_EnableFatigue;

var int CZ_Settings_Diff_EnableSleepCap;
var int CZ_Settings_Diff_EnableTraps;
var int CZ_Settings_Diff_EnableFullCompanionXP;

var int CZ_Settings_Diff_Changed;

/*     \\ ----- CZ SETTINGS ----- //     */
