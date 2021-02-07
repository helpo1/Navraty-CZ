/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(4x) CZ_Settings_Diff_Init, CZ_Settings_Diff_Save - přidáno nastavení obtížnosti v .ini souboru
(2x) Hero_Hunger - upraveny počáteční hodnoty hladu
(2x) Hero_Thirst - upraveny počáteční hodnoty žízně
(2x) Hero_Fatigue - upraveny počáteční hodnoty únavy
(4x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)
func void dia_xardas_canbenecromok_yes - sjednoceny podmínky přijetí k nekromantům


v1.00:

func void dia_xardas_runen_6 - opraven název
func int DIA_NONE_100_Xardas_WhyHere_condition - upraveny podmínky dialogu

*/



var int XarKnowHLH; 

func void xardas_firstlock()
{
	Wld_InsertNpc(Ghost,"NW_CASTLEMINE_GHOST_01");
	Wld_InsertNpc(Ghost,"NW_TROLLAREA_TROLLROCKCAVE_02");
	Wld_InsertNpc(Ghost,"NW_FARM2_TAVERNCAVE1_02");
	Wld_InsertNpc(Ghost,"NW_RITUALFOREST_CAVE_05");
	Wld_InsertNpc(Troll_Rug,"NW_BROTHERTROLL");
	Wld_InsertNpc(Troll_Trag,"NW_BROTHERTROLL");
	Wld_InsertNpc(Troll_Brog,"NW_BROTHERTROLL");
	Wld_InsertNpc(Firewaran_Uniq,"FP_ROAM_NW_TROLLAREA_RUINS_29");
	Wld_InsertNpc(gobbo_mage_gr4,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(gobbo_mage_gr5,"NW_FARM1_CITYWALL_FOREST_16");
	Wld_InsertNpc(BDT_1000_Bandit_L,"NW_FARM1_BANDITS_CAVE_06");
	Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
	Wld_InsertNpc(gobbo_green1,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_04");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_06");
	Wld_InsertNpc(YGiant_Rat,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_FELDREUBER4");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_MONSTERMILL_11");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_01");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc(Wolf,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
	Wld_InsertNpc(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	Wld_InsertNpc(Warg,"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc(Warg,"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc(Wolf,"NW_FARM4_WOOD_MONSTER_03");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_06");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_07");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_03");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_06");
	Wld_InsertNpc(Zombie02,"FP_ROAM_CASTLEMINE2_10");
	Wld_InsertNpc(Zombie04,"FP_ROAM_CASTLEMINE2_12");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_11");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_BIGFARMFORESTCAVE_07");
	Wld_InsertNpc(gobbo_mage,"FP_ROAM_NW_BIGFARMFORESTCAVE_08");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_05");
	Wld_InsertNpc(Wolf,"NW_SAGITTA_MOREMONSTER_01");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT7");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT2_14");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT2_8");
	Wld_InsertNpc(Scavenger,"NW_FARM4_WOOD_NEARPEASANT2_7");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_NEARPEASANT2_12");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_3");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_2");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER08");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER02");
	Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER04");
	Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER06");
	Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_NAVIGATION_09");
	Wld_InsertNpc(Wolf,"NW_CASTLEMINE_TROLL_05");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_ALLEE_08_N_2");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_ALLEE_08_N_5");
	Wld_InsertNpc(Scavenger,"NW_FARM3_BIGWOOD_02");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_02");
	Wld_InsertNpc(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_17");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_03");
	Wld_InsertNpc(Keiler,"NW_FARM3_PATH_12_MONSTER_01");
	Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
	Wld_InsertNpc(Keiler,"NW_BIGFARM_LAKE_03_MOVEMENT");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_LAKE_03_MOVEMENT3");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_BIGFARM_LAKE_03_MOVEMENT5");
	Wld_InsertNpc(Wolf,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	Wld_InsertNpc(BDT_1065_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_1066_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_1067_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_10313_Addon_RangerBandit_L,"NW_FARM4_WOOD_RANGERBANDITS_04");
	Wld_InsertNpc(BDT_10310_Addon_RangerBandit_M,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
	Wld_InsertNpc(Warg,"NW_PASS_06");
	Wld_InsertNpc(orcdog,"NW_PASS_11");
	Wld_InsertNpc(Snapper,"NW_PASS_SECRET_16");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc(skeleton_warrior,"FP_ROAM_MEDIUMFOREST_KAP3_05");
	Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP3_02");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_09");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_11");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_28");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_29");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_CITYFOREST_KAP3_28");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_06");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_10");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_11");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_12");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_14");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_15");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_FARM2_TO_TAVERN_09_MONSTER2");
	Wld_InsertNpc(Giant_Bug,"NW_FARM2_TO_TAVERN_09_MONSTER3");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_79");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_80_1");
	Wld_InsertNpc(Waran,"NW_FOREST_PATH_82");
	Wld_InsertNpc(Waran,"NW_FOREST_PATH_82_M");
	Wld_InsertNpc(Wolf,"NW_FOREST_PATH_66_M");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_FOREST_PATH_62_M");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_80_1_MOVEMENT8_M");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_80_1_MOVEMENTF");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_31_NAVIGATION10");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT6");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT15");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT15");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_04_4");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION_M");
	Wld_InsertNpc(orcwarrior2,"NW_FOREST_PATH_31_NAVIGATION19");
	Wld_InsertNpc(orcdog,"NW_FOREST_PATH_18_MONSTER");
	Wld_InsertNpc(orcdog,"NW_FOREST_PATH_72_MONSTER23");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_66_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_66_MONSTER");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_14_MONSTER");
	Wld_InsertNpc(Molerat,"NW_CITY_SMFOREST_03_M");
	Wld_InsertNpc(Minecrawler,"NW_MAGECAVE_27");
	Wld_InsertNpc(gobbo_mage,"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_03");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_05");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_PORTALTEMPEL_08");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_PORTALTEMPEL_06");
	Wld_InsertNpc(Wolf,"NW_TROLLAREA_PATH_66_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_07");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PATH_15_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc(Skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
	Wld_InsertNpc(Skeleton_Lord,"NW_TROLLAREA_TROLLROCKCAVE_07");
	Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_06");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_72");
	Wld_InsertNpc(Waran,"NW_TROLLAREA_PATH_22_MONSTER");
	Wld_InsertNpc(Wolf,"NW_SHRINE_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_AREA_01");
	Wld_InsertNpc(Gobbo_Green,"NW_BIGFARM_LAKE_MONSTER_05_01");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
	Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_36");
	Wld_InsertNpc(Zombie01,"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_MORE_01");
	Wld_InsertNpc(Snapper,"NW_FARM4_WOOD_MONSTER_05");
	Wld_InsertNpc(Snapper,"NW_CASTLEMINE_TROLL_02");
	Wld_InsertNpc(Snapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
	Wld_InsertNpc(Snapper,"NW_FARM3_BIGWOOD_03_C");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_19");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_22");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_23");
	Wld_InsertNpc(skeleton_dark,"NW_CITY_SMFOREST_BANDIT_04");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_03");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_01");
	Wld_InsertNpc(XARDAS_SKELETON_GUARD_05,"NW_XARDAS_TOWER_IN1_01");
	Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_08");
	Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_07");
	Wld_InsertNpc(Shadowbeast,"NW_FOREST_VINOSKELLEREL_01");
	Wld_InsertNpc(zombie_mod,"NW_CRYPT_IN_03");
	Wld_InsertNpc(zombie_mod,"NW_CRYPT_IN_03");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_03");
	Wld_InsertNpc(SkeletonMage,"NW_CRYPT_IN_03");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_01");
	Wld_InsertNpc(Shadowbeast,"NW_FOREST_PATH_62_ORNA");
	Wld_InsertNpc(SkeletonMage,"NW_FOREST_VINOSKELLEREL_01");
	Wld_InsertNpc(WoodGolem,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(Skeleton,"NW_TROLLAREA_RUINS_28");
	Wld_InsertNpc(Shadowbeast,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(Skeleton,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(zombie_mod,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(Skeleton,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(SkeletonMage,"NW_CRYPT_MONSTER08");
	Wld_InsertNpc(Skeleton,"NW_BIGMILL_MALAKSVERSTECK_02");
	Wld_InsertNpc(Skeleton,"NW_FARM2_TO_TAVERNCAVE1_02");
	Wld_InsertNpc(Skeleton,"NW_FARM2_TO_TAVERNCAVE1_03");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_VALLEY_06_C");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_VALLEY_06_B");
	Wld_InsertNpc(bloodfly1,"NW_FARM1_CONNECT_XARDAS");
	Wld_InsertNpc(Scavenger,"NW_FARM1_PATH_SPAWN_03");
	Wld_InsertNpc(SkeletonMage,"FP_ROAM_RITUALFOREST_CAVE_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_RITUALFOREST_CAVE_01");
	Wld_InsertNpc(Skeleton,"FP_ROAM_RITUALFOREST_CAVE_06");
	Wld_InsertNpc(Snapper,"FP_CAMPFIRE_NW_ATC_ORC_48");
	Wld_InsertNpc(Snapper,"FP_CAMPFIRE_NW_ATC_ORC_48");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_BRIDGE_05_04");
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_02");
	Wld_InsertNpc(Warg,"FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_01_02");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_04");
	Wld_InsertNpc(scavenger_old,"FP_ROAM_NW_TROLLAREA_PLANE_11_01");
	Wld_InsertNpc(scavenger_old,"FP_ROAM_NW_TROLLAREA_PLANE_11_01");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_03");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_05");
	Wld_InsertNpc(Troll,"FP_ROAM_CASTLEMILL_TROLL_05");
	Wld_InsertNpc(zombie_mod,"FP_GREATPEASANT_STPLATE_05");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_FARMS_PATH_11_SMALLRIVER_23");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_FARMS_PATH_11_SMALLRIVER_23");
	Wld_InsertNpc(Warg,"FP_ROAM_PASS_WOLF_12");
	Wld_InsertNpc(Snapper,"FP_STAND_NW_ATC_DJG_04");
	Wld_InsertNpc(Warg,"FP_START_NW_ABANDONEMINE_OW");
};

instance DIA_Xardas_FirstEXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_FirstEXIT_Condition;
	information = DIA_Xardas_FirstEXIT_Info;
	permanent = FALSE;
	description = "Vyrazím hned, jak budu moci!";
};

func int DIA_Xardas_FirstEXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Vyrazím hned, jak budu moci!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Dobrá. A ještě jedna věc: nikomu neříkej, že jsme spolu mluvili. Hlavně žádnému mágovi.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//Co jsem odešel, považují mě mágové Ohně za mrtvého - a to se může docela hodit.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_03");	//Také pamatuj, že to bude vyžadovat veliké úsilí.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_04");	//Tvé síly jsou přirozeně o hodně menší, než před tvým bojem se Spáčem.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_05");	//Takže se tě musím zeptat, zvládneš to?
	Mob_CreateItems("NW_CHEST_49",ItMw_Rapier,1);
	REALPROTMAGIC = 0;
	REALPROTFIRE = 0;
	Wld_InsertNpc(dmt_1212_dagot,"NW_XARDAS_TOWER_IN1_28");
	Info_ClearChoices(DIA_Xardas_FirstEXIT);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Jen mě zdržuješ. (Obtížnost: legendární)",DIA_Xardas_FirstEXIT_Legend);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Nemusíš, nikdo mě nezastaví. (Obtížnost: těžká)",DIA_Xardas_FirstEXIT_CantStopMe);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"No, mám trochu obavy... (Obtížnost: střední)",DIA_Xardas_FirstEXIT_DontKnow);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Ano, ale hodila by se mi nějaká pomoc. (Obtížnost: lehká)",DIA_Xardas_FirstEXIT_NeedHelp);
};

func void DIA_Xardas_FirstEXIT_Legend()
{
	Snd_Play("DRAGON_WRATH_01");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_01");	//Jen mě zdržuješ.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_02");	//Oba dva víme, že jen já mohu uspět. Jinak bys mě určitě nezachraňoval. 
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_03");	//Vím, že to nebude snadné, ale já jsem já.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_04");	//Takže ustup a sleduj mistra!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_05");	//(opovrživně) Blázne! Tak moc chceš zemřít? Ani netušíš co číhá venku!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_06");	//Jen překročíš práh mé věže, tak tě něco sežere!
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_07");	//Nepoučuj! Už jdu...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_08");	//Velká škoda! Ten, kdo nezná strach, je odsouzen ke zkáze!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_09");	//Nemáš představu o moci nepřítele!
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_10");	//Přestaň s těmi přednáškami. Zvládnu to. Nech to na mě.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_11");	//No dobře! Sám uvidíš...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_09");	//A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_10");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_11");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_12");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	GivePack = TRUE;
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 10;	// deprecated
	NoHPForLevel = TRUE;	// deprecated
	SURPRISE = 0;
	SBMODE = 1;
	SLEEPDIS = 9;	// deprecated
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE;
	Hero_Hunger = 10;
	Hero_Thirst = 5;
	Hero_Fatigue = 10;
	StatusDayNow = Wld_GetDay();
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
	RealMode[2] = TRUE;

	if(CheckRealMode[1] == FALSE)
	{
		CheckRealMode[1] = TRUE;
	};

	CZ_Settings_Diff_Init();
	CZ_Settings_Diff_Save();

	Wld_InsertNpc(Oster,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Oster,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Oster,"NW_XARDAS_VALLEY_04");
	xardas_firstlock();
};

func void DIA_Xardas_FirstEXIT_CantStopMe()
{
	Snd_Play("DEM_AMBIENT");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_01");	//Nemusíš, nikdo mě nezastaví.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_02");	//Čím déle tady stojím, tím méně času mám na lov draků!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_03");	//Tvé sebevědomí mne těší a děsí zároveň.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_04");	//Doufám, že chápeš jejich moc. Pokud selžeš, všichni na tomto ostrově zaplatí životem.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_05");	//Neboj se. Vím, co dělám.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_09");	//A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_10");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_11");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_12");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	GivePack = TRUE;
	AI_StopProcessInfos(self);
	Mob_CreateItems("XAR_CHEST",ItFo_Apple,3);
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,20);
	XP_PER_VICTORY = 15;	// deprecated
	NoHPForLevel = TRUE;	// deprecated
	SURPRISE = 0;
	SBMODE = 1;
	SLEEPDIS = 9;	// deprecated
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE;
	Hero_Hunger = 10;
	Hero_Thirst = 5;
	Hero_Fatigue = 10;
	StatusDayNow = Wld_GetDay();
	hero.attribute[ATR_MANA_MAX] = 20;
	hero.aivar[REAL_MANA_MAX] = 20;
	HeroRealMaxMana = 20;
	hero.attribute[ATR_MANA] = 20;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,4);
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();
	CZ_Settings_Diff_Save();

	Wld_InsertNpc(Scavenger,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_04");
	xardas_firstlock();
};

func void DIA_Xardas_FirstEXIT_DontKnow()
{
	Snd_Play("TRO_WARN");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_DontKnow_01_00");	//No, mám trochu obavy...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_02");	//Dobře. Pomohu ti obnovit část tvých sil.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_03");	//Nicméně, moje zásoby magických elixírů jsou poněkud omezené. Ale vše, co mám, je ti k dispozici.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_04");	//Tady, dobře je využij.
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Health_02,2);
	GivePack = TRUE;
	AI_Print("Obdrženo několik lektvarů...");
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_DontKnow_01_05");	//Co nějaká zbroj?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_06");	//Tady, vezmi si tyhle kopáčské kalhoty. Nic lepšího bohužel nemám.
	B_GiveInvItems(self,other,ITAR_PRISONEL,1);
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_08");	//A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_09");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_DontKnow_01_10");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_11");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	AI_Print(concatText);
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 20;	// deprecated
	SBMODE = 2;
	SLEEPDIS = 24;	// deprecated
	SURPRISE = 10;
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE;
	Mob_CreateItems("XAR_CHEST",ItFo_Apple,5);
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,200);
	hero.attribute[ATR_STRENGTH] = 20;
	hero.aivar[REAL_STRENGTH] = 20;
	HeroRealStr = 20;
	hero.attribute[ATR_DEXTERITY] = 20;
	hero.aivar[REAL_DEXTERITY] = 20;
	HeroRealDex = 20;
	hero.attribute[ATR_MANA_MAX] = 30;
	hero.aivar[REAL_MANA_MAX] = 30;
	HeroRealMaxMana = 30;
	hero.attribute[ATR_MANA] = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 200;
	hero.attribute[ATR_HITPOINTS] = 200;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,9);
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();
	CZ_Settings_Diff_Save();

	Wld_InsertNpc(Molerat,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Molerat,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Molerat,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Molerat,"NW_XARDAS_VALLEY_04");
};

func void DIA_Xardas_FirstEXIT_NeedHelp()
{
	Snd_Play("SHP_AMBIENT");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_00");	//Ano, ale hodila by se mi nějaká pomoc.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_01");	//Nejsem si jistý, zda se vůbec dostanu do města.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_02");	//Ano, to je nejdůležitější.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_03");	//Ve městě získáš vybavení a zesílíš.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_06");	//Tady, vezmi si tyto lektvary a magické svitky.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_07");	//Použij je na tvé cestě.
	CreateInvItems(other,ItPo_Health_02,5);
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Mana_02,5);
	CreateInvItems(other,ItSc_Firebolt,2);
	CreateInvItems(other,ItSc_Zap,2);
	GivePack = TRUE;
	AI_Print("Obdrženo několik lektvarů a magických svitků...");
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_08");	//A nesnaž se je šetřit na horší časy! Tvůj život je příliš cenný!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_09");	//Ještě si vezmi trochu zlata. To se ti může hodit.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_10");	//Co nějaká zbroj?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_11");	//Tady, vezmi si tyhle kopáčské kalhoty. Nic lepšího bohužel nemám.
	B_GiveInvItems(self,other,ITAR_Prisoner,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_12");	//Díky! A teď už půjdu.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_13");	//Jistě... - A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_14");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_15");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_NeedHelp_01_16");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 25;	// deprecated
	SBMODE = 4;
	SLEEPDIS = 24;	// deprecated
	SURPRISE = 10;
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = FALSE;	// deprecated
	CanChangeItem = TRUE;
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,200);
	hero.attribute[ATR_STRENGTH] = 30;
	hero.aivar[REAL_STRENGTH] = 30;
	HeroRealStr = 30;
	hero.attribute[ATR_DEXTERITY] = 30;
	HeroRealDex = 30;
	hero.aivar[REAL_DEXTERITY] = 30;
	hero.attribute[ATR_MANA_MAX] = 40;
	hero.aivar[REAL_MANA_MAX] = 40;
	HeroRealMaxMana = 40;
	hero.attribute[ATR_MANA] = 40;
	hero.attribute[ATR_HITPOINTS_MAX] = 300;
	hero.attribute[ATR_HITPOINTS] = 300;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,14);
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();
	CZ_Settings_Diff_Save();

	Wld_InsertNpc(Rabbit,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_VALLEY_04");
};

instance DIA_Xardas_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_EXIT_Condition;
	information = DIA_Xardas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NO_TALK(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_no_talk_condition;
	information = dia_xardas_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_xardas_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_DAGOT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_dagot_condition;
	information = dia_xardas_dagot_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_xardas_dagot_condition()
{
	if((DAGOT_MEET == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_dagot_info()
{
	if(GUARDIAN_WAY == TRUE)
	{
		XARDAS_SPEAKDAGOT = TRUE;
		AI_Output(self,other,"DIA_Xardas_Dagot_01_00");	//Takže jsi přijal nabídku Strážců...
		AI_Output(self,other,"DIA_Xardas_Dagot_01_01");	//Tvé rozhodnutí bylo uspěchané, ale nyní ho už nezměníš.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_02");	//Nemůžeš jen tak opustit jejich cestu.
		AI_Output(other,self,"DIA_Xardas_Dagot_01_03");	//Strážci ode mne očekávají, že ji budu následovat.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_04");	//Ano, tak to je.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_05");	//Víš, byli to právě Strážci - to oni mě požádali k zapuzení Spáče a zničení bariéry.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_06");	//Ty jsi jejich přání vykonal a toto je tvá odměna, jako jsi ji sám přijal.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_07");	//Jestliže bys odmítl, nevím, co by se stalo.
		AI_Output(other,self,"DIA_Xardas_Dagot_01_08");	//Dagoth mi jen něco řekl a pak zmizel!
		AI_Output(self,other,"DIA_Xardas_Dagot_01_09");	//Neber to takto... Plnit úkol pro Strážce je velká čest.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_09A");	//Za vyhnání Spáče si tuto čest zasloužíš.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_10");	//To, co řekl může znamenat cokoliv - třeba ho jednou potkáš a pak pochopíš.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_11");	//Ale měl bys upustit od ideálů a věnovat se nyní důležitějším věcem.
		B_LogEntry(TOPIC_GUARDIANS,"Xardas mi řekl, že Strážce ještě potkám, ale až nastane správný čas.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Xar");
	}
	else if(GUARDIAN_WAY == FALSE)
	{
		AI_Output(self,other,"DIA_Xardas_Dagot_01_13");	//Takže jsi odmítl nabídku Strážců...
		AI_Output(self,other,"DIA_Xardas_Dagot_01_14");	//Tvé jednání bylo ukvapené, ale teď už to nic nezmění.
		AI_Output(other,self,"DIA_Xardas_Dagot_01_15");	//Strážce řekl, že bych měl následovat cestu.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_16");	//Promiň, ale nemůžu ti říci více.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_17");	//Měl bys upustit od ideálů a věnovat se důležitějším věcem.
		B_LogEntry(TOPIC_GUARDIANS,"Xardas mi řekl, že bych na to měl zapomenout.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Xar");
	};
};


var int Addon_zuerst;
var int modcheckv;

instance DIA_Xardas_Hello(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Hello_Condition;
	information = DIA_Xardas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_Hello_Condition()
{
	if(PrologCredits == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Xardas_Hello_Info()
{
	self.name[0] = "Xardas";
	self.noFocus = FALSE;
	Mdl_ApplyOverlayMds(other,"PRE_START.MDS");
	Wld_SendTrigger("EVT_START_CAM");
	Snd_Play("RAVENS_EARTHQUAKE1");
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_01,StartHelpBug_01,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_02,StartHelpBug_02,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_03,StartHelpBug_03,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_04,StartHelpBug_04,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_05,StartHelpBug_05,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_01,StartHelpBug_01,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_02,StartHelpBug_02,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_03,StartHelpBug_03,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_04,StartHelpBug_04,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_05,StartHelpBug_05,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	AI_PlayAni(hero,"T_STAND_2_HEROSUMMON");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Wait(hero,1);
	AI_UnequipArmor(hero);
	CreateInvItems(other,ITAR_Her_M,1);
	AI_EquipArmor(other,ITAR_Her_M);
	AI_PlayAni(hero,"T_HEROSUMMON_2_STAND");
	AI_Wait(self,2);
	MODCHECKV = 201;
	FalkHunters = 3;
	CaptureCheat = TRUE;
	CrushBonus2HOn = TRUE;
	DPSMeterOn = TRUE;
	CinemaMod = FALSE;
	CinemaModOneTime = FALSE;
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//Tak tě tu máme! Už jsem si nemyslel, že se ještě setkáme.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//Cítím se, jako kdybych tři týdny ležel pod hromadou kamení.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//No, taky ano. Pouze magie ve tvé zbroji tě zachránila.
	Mob_CreateItems("XAR_CHEST",itpo_anpois,1);
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//Bál jsem se, že už tě nebudu moci osvobodit z ruin chrámu.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//Ale dost už toho. Teď jsi tady.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//Je tady NOVÉ nebezpečí, o které se musíme postarat.
	Npc_ExchangeRoutine(self,"START");
	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello,"Teď alespoň máme dost času. Postaral jsem se o to. Spáč...",DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello,"O jakém NOVÉM nebezpečí to mluvíš?",DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	Npc_RemoveInvItems(hero,ITAR_OLDOREARMOR,1);
	B_RemoveNpcKill(StartHelpBug_01);
	B_RemoveNpcKill(StartHelpBug_02);
	B_RemoveNpcKill(StartHelpBug_03);
	B_RemoveNpcKill(StartHelpBug_04);
	B_RemoveNpcKill(StartHelpBug_05);
	AI_Output(other,self,"DIA_Addon_Xardas_AddonIntro_Add_01_01");	//O jakém NOVÉM nebezpečí to mluvíš?
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_02");	//Jeden z nejstarších artefaktů zla se znovu objevil!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_03");	//Říká se mu Beliarův dráp. Pokud jsou mé informace přesné, lze ho použít k ovládání legií nemrtvých.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_04");	//Snad nemusím vysvětlovat, že se taková zbraň nesmí dostat do rukou služebníkům Temného pána.
	AI_Output(other,self,"DIA_Addon_Xardas_AddonIntro_Add_01_05");	//A kde je teď?
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_06");	//Dávné záznamy ukazují, že poslední majitel zbraně patřil k civilizaci Stavitelů. Tito lidé žili na tomto ostrově před několika tisíci lety.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_07");	//Všichni byli věrnými obdivovateli a následovníky Adana. Boha vody a rovnováhy
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_08");	//Nepochybuji, že je zde na ostrově v nějakém zapomenutém chrámu.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_09");	//Musíš ho najít!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_10");	//(zamyšleně) Tu zapomenutou kulturu, začali nedávno zkoumat mágové Vody.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_11");	//Dokonce provádějí něco jako expedici do jejich chrámů.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_01_12");	//Přidej se k nim! Dráp musí být nalezen!
	Addon_zuerst = TRUE;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//Teď alespoň máme dost času. Postaral jsem se o to. Spáč...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... byl zapuzen. Porazil jsi ho, to je naprostá pravda - ale není v naší moci zastavit válku, která bude teď následovat.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Svým posledním zběsilým skřekem vyslal Spáč na cestu armády temnot.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Byl to rozkaz určený všem zlým stvůrám. Mocné zaklínadlo, které nemohou neuposlechnout.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Jeho poslední rozkaz byl: JDĚTE! A oni šli. Všichni. Dokonce i draci.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(užasle)... Draci?!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Jsou to pradávná stvoření nebývalé moci. Cítím jejich přítomnost - dokonce i zde.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//Shromáždili kolem sebe celou armádu nižších stvůr, aby jim sloužila.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//Kde je ta armáda teď?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Utábořila se nedaleko odtud, v Hornickém údolí poblíž Khorinisu. Pomalu se připravuje k útoku.

	if(Addon_zuerst == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(zamyšleně) Moc času nám nezbývá.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//Ale to není vše. Je tady ještě JINÁ hrozba, o které jsem se právě dozvěděl.
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello,"O jakém JINÉM nebezpečí to mluvíš?",DIA_Addon_Xardas_Hello_Man);
	};
};

instance DIA_Xardas_OtherGreatWeapon(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_OtherGreatWeapon_Condition;
	information = DIA_Xardas_OtherGreatWeapon_Info;
	permanent = FALSE;
	description = "Která zbraň kromě Urizielu, může zabít draky?";
};

func int DIA_Xardas_OtherGreatWeapon_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Xardas_TODO) == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Xardas_OtherGreatWeapon_Info()
{
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_00");	//Která zbraň kromě Urizielu, může zabít draky?
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_01");	//V tomto světě existuje mnoho artefaktů srovnatelných s mocí meče.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_02");	//Ale málo se o nich ví.
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_03");	//A napadá tě něco?
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_05");	//No dobrá, jednou z nich je magická hůl. říká se jí Hůl Věčnosti.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_06");	//Má nepopsatelnou moc. Dokáže se vyrovnat jakékoliv síle. Drakům zcela jistě.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_07");	//Ovšem, k jejímu ovládnutí je třeba velmi mocného mága.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_08");	//Jinak se stane jen obyčejnou holí.
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_09");	//Dobře. Kde ji najdu?
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_10");	//Kdybych to věděl, sám ji používám. Takové věci neleží u cesty.
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_13");	//Aha. A něco jiného?
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_14");	//Slyšel jsem také o artefaktu jménem Er'Hazir. To znamená Hvězda vzteku.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_15");	//Podle legendy vytvořil tento luk samotný Adanos. Aby mohli jeho vyvolení odolat jejich nepříteli, který je pronásledoval přes celý svět.
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_16");	//Šípy z něj prý pronikly jakýmkoliv pancířem či magickou ochranou. 
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_17");	//Taková zbraň je perfektní pro boj s draky!
	AI_Output(self,other,"DIA_Xardas_OtherGreatWeapon_01_19");	//Bohužel, je to legenda. Netuším zda-li ta zbraň skutečně existuje.
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_21");	//Tak uvidíme.
};

instance DIA_Xardas_AWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_AWAY_Condition;
	information = DIA_Xardas_AWAY_Info;
	permanent = FALSE;
	description = "Tak si pospěšme, abychom byli co nejrychleji pryč!";
};

func int DIA_Xardas_AWAY_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Xardas_TODO) && !Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	Snd_Play("LevelUp");
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Tak si pospěšme, abychom byli co nejrychleji pryč!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Pokud teď utečeme, bude to znamenat jediné - budeme se muset drakům postavit později.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//S pomocí vojáků a mágů, kteří žijí v těchto končinách, bychom mohli jejich armádu zastavit dřív, než se úplně zformuje.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//Lepší šanci už nikdy mít nebudeme.
	AI_NoticePrint(3000,4098,NAME_Addon_ScareBonus);
	RankPoints = RankPoints + 1;
	ScareBonus = TRUE;
};

instance DIA_Xardas_TODO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_TODO_Condition;
	information = DIA_Xardas_TODO_Info;
	permanent = FALSE;
	description = "Co budeme dělat?";
};

func int DIA_Xardas_TODO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//Tentokrát to sami nezvládneme. Proti těm drakům nám může pomoci jen Innosova moc.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//Ve městě Khorinis sídlí skupina paladinů, je to nedaleko odtud.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Mají mocný artefakt, který by nám mohl v boji proti drakům hodně pomoci.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//Říkají mu Innosovo oko. Musíš ten artefakt za každou cenu získat.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Řekni paladinům o nebezpečí, které hrozí. MUSÍŠ přesvědčit jejich vůdce, aby nám pomohl!
	AI_Output(self,other,"DIA_Xardas_TODO_14_09");	//Ale pro překonání draků by se nám velmi hodila ještě jedna věc...
	AI_Output(self,other,"DIA_Xardas_TODO_14_11");	//Meč, který porazil Spáče! Oko tě ochrání před dračími plameny, ale abys je porazil, budeš potřebovat opravdu smrtící zbraň!
	AI_Output(other,self,"DIA_Xardas_TODO_14_12");	//Uriziel?!
	AI_Output(self,other,"DIA_Xardas_TODO_14_13");	//Právě ten!... (vážně)
	AI_Output(other,self,"DIA_Xardas_TODO_14_14");	//Ale zůstal ve Spáčově chrámu!
	AI_Output(self,other,"DIA_Xardas_TODO_14_15");	//Takže se tam budeš muset znovu vrátit.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_Running);
	B_LogEntry(TOPIC_INNOSEYE,"V Khorinisu se usadila skupina paladinů, kteří opatrují mocný artefakt zvaný Innosovo oko, jenž nám může pomoci zahnat dračí hrozbu. Musím ty svaté válečníky nějak přesvědčit, aby se k nám přidali.");
	Log_CreateTopic(TOPIC_ORCTEMPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_Running);
	B_LogEntry_Quiet(TOPIC_ORCTEMPLE,"Xardas mi sdělil, že kromě Innosova oka budu potřebovat i starobylou čepel zvanou Uriziel, se kterou jsem zapudil Spáče... Jestli chci mít proti drakům nějakou výhodu, budu muset jít znovu do Spáčova chrámu a najít Uriziel.");
	Info_ClearChoices(DIA_Xardas_TODO);
};

instance DIA_Addon_Xardas_StonePlate(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Addon_Xardas_StonePlate_Condition;
	information = DIA_Addon_Xardas_StonePlate_Info;
	description = "Můžeš mi říct něco o téhle kamenné desce?";
};

func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//Můžeš mi říct něco o téhle kamenné desce?
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//Nejprve jsem si myslel, že to je jakýsi magický artefakt, ale došel jsem k závěru, že to není důležité.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//Nedokázal jsem tu desku úplně přeložit, ale vypadá to, že jde o příběh velmi staré kultury.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//Jestli ji chceš, klidně si ji vem. Nemám pro ni už žádné využití.
};

instance DIA_XARDAS_ORCTEMPLE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctemple_condition;
	information = dia_xardas_orctemple_info;
	permanent = FALSE;
	description = "Našel jsem hodně divné věci u vstupu do Spáčova chrámu...";
};

func int dia_xardas_orctemple_condition()
{
	if((MIS_ORCTEMPLE == LOG_Running) && (ORCTEMPLEONETIME == TRUE) && (ORCTEMPLEGATEOPENED == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_orctemple_info()
{
	AI_Output(other,self,"DIA_Xardas_OrcTemple_15_00");	//Našel jsem hodně divné věci u vstupu do Spáčova chrámu...
	AI_Output(other,self,"DIA_Xardas_OrcTemple_15_01");	//Skřetí duchy, kteří na nic nereagují a vstup do chrámu zakrývá kamenná deska.
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_02");	//Ano, přišel jsi včas, Už jsem to vyřešil.
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_03");	//Ta deska zakrývá tunel - to je dílo skřetů, kteří ho zakryli hned po pádu bariéry.
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_04");	//Zatím jsem nezjistil z jakého důvodu tak spěchali a proč opustili město.
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_05");	//Ale pak jsem pochopil všechny ty Beliarovy vtípky...
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_06");	//Temného pána velmi baví, když jeho služebníci navzájem bujují o jeho přízeň.
	AI_Output(self,other,"DIA_Xardas_OrcTemple_14_07");	//Zřejmě se budeme muset vypořádat s jedním vážnějším nepřítelem.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_ORCTEMPLE,"Našel jsem vchod do Spáčova chrámu zavalený kamennou deskou.");
};


instance DIA_XARDAS_ORCTEMPLE2(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctemple2_condition;
	information = dia_xardas_orctemple2_info;
	permanent = FALSE;
	description = "O kom to mluvíš?";
};


func int dia_xardas_orctemple2_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_orctemple) && (MIS_ORCTEMPLE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_xardas_orctemple2_info()
{
	AI_Output(other,self,"DIA_Xardas_OrcTemple2_15_00");	//O kom to mluvíš?
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_01");	//Věřím, že je to jeden z vyvolených Beliara. Nemyslím si, že by byl slabší než draci, protože Beliar nemá rád slabé sluhy.
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_02");	//Také je mi jasné, proč šel do chrámu - chce najít to nejcenněší, co tam zůstalo - Uriziel.
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_03");	//Chrám je vhodné místo k načerpání jeho démonických sil.
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_04");	//Skřeti se zřejmě báli, proto odešli a uzavřeli chrám.
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_05");	//A ti duchové co jsi viděl, nejspíš slouží k zastrašení nezvaných hostů.
	AI_Output(self,other,"DIA_Xardas_OrcTemple2_14_06");	//Vypadá to, že nemáme jinou možnost. Musíš se vrátit do chrámu a zjistit, co je za tím zlem.
	B_LogEntry(TOPIC_ORCTEMPLE,"Měl bych se vrátit ke Spáčově chrámu a zjistit, co se tam skrývá za zlo.");
};


instance DIA_XARDAS_ORCTEMPLEDOOR(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctempledoor_condition;
	information = dia_xardas_orctempledoor_info;
	permanent = FALSE;
	description = "Jak se dostanu do chrámu?";
};


func int dia_xardas_orctempledoor_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_orctemple) && (ORCTEMPLEGATEOPENED == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_orctempledoor_info()
{
	AI_Output(other,self,"DIA_Xardas_OrcTempleDoor_15_00");	//Jak se dostanu do chrámu?
	AI_Output(other,self,"DIA_Xardas_OrcTempleDoor_15_01");	//U vchodu nejsou vidět žádné páky ani spínače...
	AI_Output(self,other,"DIA_Xardas_OrcTempleDoor_14_02");	//Skřeti asi použili kouzlo, aby se tam nikdo nedostal.
	AI_Output(self,other,"DIA_Xardas_OrcTempleDoor_14_03");	//Bojím se, že ti nemohu pomoci. Budeš muset sám objevit nějaké řešení.
	AI_Output(self,other,"DIA_Xardas_OrcTempleDoor_14_04");	//Myslím, že ti mohou pomoci pouze skřeti.
	B_LogEntry(TOPIC_ORCTEMPLE,"Xardas nemá tušení, jak se dostat přes kamennou desku u vchodu. Měl bych se zeptat skřetů...");
	ORCTEMPLEGATEINFO = TRUE;
};


instance DIA_XARDAS_DMST_DEAD(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_dmst_dead_condition;
	information = dia_xardas_dmst_dead_info;
	permanent = FALSE;
	description = "Byl jsem ve Spáčově chrámu.";
};


func int dia_xardas_dmst_dead_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (XARDASKNOWSDEADMAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_dmst_dead_info()
{
	AI_Output(other,self,"DIA_Xardas_DMST_Dead_15_00");	//Byl jsem ve Spáčově chrámu.
	AI_Output(self,other,"DIA_Xardas_DMST_Dead_14_03");	//Opravdu?! A kdo tam byl?
	AI_Output(other,self,"DIA_Xardas_DMST_Dead_15_04");	//Nějaký mág. Vypadal jako ty a byl i stejně oblečen.
	AI_Output(other,self,"DIA_Xardas_DMST_Dead_15_04A");	//A měl s sebou i meč - víš, který myslím?
	AI_Output(self,other,"DIA_Xardas_DMST_Dead_14_05");	//Uriziel? Skvěle! Budeš ho ještě potřebovat. Takže nekromant... hmm... díky tobě ztratil Beliar dalšího věrného služebníka.
	AI_Output(self,other,"DIA_Xardas_DMST_Dead_14_06");	//Ten mág se mohl stát Beliarovým vyvoleným. Tato skutečnost nám možná otevírá nějaké další příležitosti... (přemýšlí)
	AI_Output(self,other,"DIA_Xardas_DMST_Dead_14_07");	//No, dobře... o to teď nejde. (chytře se směje)
	B_GivePlayerXP(200);
	XARDASKNOWSDEADMAGE = TRUE;
};


instance DIA_XARDAS_MAKERUNE(C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_makerune_condition;
	information = dia_xardas_makerune_info;
	important = FALSE;
	permanent = FALSE;
	description = "Říkal jsi, že i mág může používat tento meč.";
};


func int dia_xardas_makerune_condition()
{
	if((Npc_HasItems(other,itmw_2h_urizel) >= 1) && (XARDASKNOWSDEADMAGE == TRUE) && (KNOWINFOURIZELRUNE == FALSE) && ((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM)))
	{
		return TRUE;
	};
};

func void dia_xardas_makerune_info()
{
	AI_Output(other,self,"DIA_Xardas_MAKERUNE_15_01");	//Říkal jsi, že i mág může používat tento meč.
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_02");	//Podívej se na něj blíž. Vidíš ten modrý kámen na čepeli?
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_03");	//Právě ten ukrývá veškerou magickou sílu Urizielu.
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_04");	//Jestli ho odtud vyjmu, mohu vytvořit magickou runu, která bude mít stejné vlastnosti.
	AI_Output(other,self,"DIA_Xardas_MAKERUNE_15_05");	//Udělat z meče magickou runu?
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_06");	//V boji její síla nebude o nic menší, než síla samotného Urizielu!
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_07");	//Mohu to pro tebe udělat, ale musíš si být zcela jistý, že to opravdu chceš.
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_08");	//Dobře si to rozmysli, protože pak už sílu meče nebudu moci obnovit!
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_09");	//Tak co sis vybral?
	KNOWINFOURIZELRUNE = TRUE;
};


instance DIA_XARDAS_MAKERUNEDOIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_makerunedoit_condition;
	information = dia_xardas_makerunedoit_info;
	important = FALSE;
	permanent = TRUE;
	description = "Vyjmi z Urizielu ten kámen!";
};


func int dia_xardas_makerunedoit_condition()
{
	if((Npc_HasItems(other,itmw_2h_urizel) >= 1) && (XARDASKNOWSDEADMAGE == TRUE) && (KNOWINFOURIZELRUNE == TRUE) && ((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM)))
	{
		return TRUE;
	};
};

func void dia_xardas_makerunedoit_info()
{
	AI_Output(other,self,"DIA_Xardas_MAKERUNEDOIT_15_01");	//Vyjmi z Urizielu ten kámen!
	AI_Output(self,other,"DIA_Xardas_MAKERUNEDOIT_14_03");	//Je to tvoje konečné rozhodnutí? Určitě chceš, abych ten kámen vyjmul?
	Info_ClearChoices(dia_xardas_makerunedoit);
	Info_AddChoice(dia_xardas_makerunedoit,"Ano, udělej to!",dia_xardas_makerune_yes);
	Info_AddChoice(dia_xardas_makerunedoit,"Ne, nedělej to!",dia_xardas_makerune_no);
};

func void dia_xardas_makerune_yes()
{
	AI_Output(other,self,"DIA_Xardas_MAKERUNEDOIT_15_04");	//Ano, udělej to!
	AI_Output(self,other,"DIA_Xardas_MAKERUNEDOIT_14_05");	//Jak myslíš... Tady máš prázdný meč a runu!
	AI_Output(self,other,"DIA_Xardas_MAKERUNEDOIT_14_06");	//Ale měj na paměti, že opravdovou moc této runy budeš moci využít pouze v boji proti drakům.
	Npc_RemoveInvItem(other,itmw_2h_urizel);
	CreateInvItems(other,itmw_2h_urizel_nomagic,1);
	CreateInvItems(other,ItRu_BreathOfDeath,1);
	Info_ClearChoices(dia_xardas_makerunedoit);
};

func void dia_xardas_makerune_no()
{
	AI_Output(other,self,"DIA_Xardas_MAKERUNEDOIT_15_06");	//Ne, nedělej to!
	AI_Output(self,other,"DIA_Xardas_MAKERUNEDOIT_14_07");	//Jak myslíš. Ať si tedy meč svou magickou sílu zachová.
	Info_ClearChoices(dia_xardas_makerunedoit);
};


instance DIA_Addon_Xardas_Portal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_Portal_Condition;
	information = DIA_Addon_Xardas_Portal_Info;
	description = "Mágové Vody objevili portál na neznámou část ostrova...";
};


func int DIA_Addon_Xardas_Portal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_WhatsOrnament) && (Saturas_KlaueInsMeer == FALSE) && !C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//Mágové Vody objevili portál na neznámou část ostrova...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//Jak zajímavé...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//Až najdeš něco, co nám OPRAVDU pomůže, dej mi vědět!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//Někde tam může být ukryt Beliarův artefakt. Najdi ho!
};


instance DIA_Addon_Xardas_PortalAgain(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_PortalAgain_Condition;
	information = DIA_Addon_Xardas_PortalAgain_Info;
	permanent = FALSE;
	description = "O neznámé části ostrova...";
};


func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_Portal) && (Saturas_KlaueInsMeer == FALSE) && !C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//O neznámé části ostrova...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//Nezatěžuj mne detaily. Vrať se, až najdeš něco skutečně užitečného.
};


instance DIA_Addon_Xardas_AddonSuccess(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_AddonSuccess_Condition;
	information = DIA_Addon_Xardas_AddonSuccess_Info;
	permanent = FALSE;
	description = "Probádal jsem neznámou část ostrova...";
};


func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if((Saturas_KlaueInsMeer == TRUE) || C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//Probádal jsem neznámou část ostrova...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//A co jsi našel?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//Vše nabralo směr k mocnému artefaktu. Beliarovu drápu.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//Beliarův dráp? Kde je teď? Máš ho u sebe?
	if(C_ScHasBeliarsWeapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Ano, mám ho tady.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(lačně) Velmi zajímavé.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//Tato zbraň může být pro nás velmi užitečná. Ale také extrémně nebezpečná.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//Používej ji opatrně! A hlavně: neztrať ji!
		B_GivePlayerXP(XP_Ambient * 3);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//Už ho nemám...
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//Dal jsem ji mágům Vody, aby ji vrhli do moře...
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(rozzuřeně) Zbláznil ses? Víš vůbec, co jsi dal pryč z rukou?
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//Tato zbraň nám mohla být velmi užitečná!
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//Věřím, že je to tak nejlepší.
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(vzdech) Cesty boží jsou občas nevyzpytatelné...
	};
};


instance DIA_Xardas_ARTEFAKT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_ARTEFAKT_Condition;
	information = DIA_Xardas_ARTEFAKT_Info;
	permanent = FALSE;
	description = "Co přesně je to 'Innosovo oko'?";
};


func int DIA_Xardas_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//Co přesně je to 'Innosovo oko'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Je to amulet. Legenda vypráví, že do něj vložil část své síly sám Innos.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Obnoví část tvé ztracené síly a pomůže nám porazit draky.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Má také další skryté schopnosti. O nich ti povím víc, až ho budeš mít u sebe.
};


instance DIA_Xardas_PALADIN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_PALADIN_Condition;
	information = DIA_Xardas_PALADIN_Info;
	permanent = FALSE;
	description = "Proč by mi měli paladinové Innosovo oko dávat?";
};


func int DIA_Xardas_PALADIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//Proč by mi měli paladinové Innosovo oko dávat?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Protože ty jsi ten, komu osud určil, aby ho nosil.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//Jak můžeš vědět něco takového?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Mám hned několik důvodů si to myslet, ale nejdůležitější je ten, že jsi porazil Spáče. Kdybys nebyl oblíbenec bohů, byl bys teď mrtvý.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Řekněme, že máš pravdu a že jsem vyvolený, abych nesl Innosovo oko. Jak ale paladinové poznají, že to je pravda?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Oko samo si zvolí toho, kdo ho může mít. Jakmile se k němu dostaneš a nasadíš si ho, nebudou paladinové moci o tvých slovech dál pochybovat.
};


instance DIA_Xardas_Khorinis(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 4;
	condition = DIA_Xardas_Khorinis_Condition;
	information = DIA_Xardas_Khorinis_Info;
	permanent = FALSE;
	description = "Jak se dostanu do města?";
};


func int DIA_Xardas_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Lothar.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//Jak se dostanu do města?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Jdi po cestě vedoucí odsud skrz hory. Město je velké. Nemůžeš ho minout.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Ale dávej si pozor! Cesta do města není úplně bezpečná. A ty nejsi zdaleka tak silný, jak jsi kdysi býval.
};


instance DIA_Xardas_WhereEx(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 6;
	condition = DIA_Xardas_WhereEx_Condition;
	information = DIA_Xardas_WhereEx_Info;
	permanent = FALSE;
	description = "A kde to vůbec jsme?";
};


func int DIA_Xardas_WhereEx_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//A kde to vůbec jsme?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Jak jsem už řekl, poblíž města Khorinis.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Postavil jsem si zde znovu svou věž.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Ale vždyť je to jen pár dní, co jsme se naposledy viděli v Hornickém údolí...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Služebníci, které jsem k obnovení své věže povolal, odvedli důkladnou práci.
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Taky mám ten pocit.
};


instance DIA_Xardas_EQUIPMENT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 7;
	condition = DIA_Xardas_EQUIPMENT_Condition;
	information = DIA_Xardas_EQUIPMENT_Info;
	permanent = FALSE;
	description = "Kde najdu lepší výbavení?";
};


func int DIA_Xardas_EQUIPMENT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//Kde najdu lepší výbavení?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Nejbližší místo, kde můžeš najít lepší zbraně a zbroje, je město Khorinis.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Ale dole v údolí můžeš tu a tam najít léčivé bylinky, které ti pomohou, když budeš zraněn v boji.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Vidíš to jezero hned před mou věží? Od něj vede do údolí tajná cesta.
};


instance DIA_Xardas_ABOUTLESTER(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_ABOUTLESTER_Condition;
	information = DIA_Xardas_ABOUTLESTER_Info;
	permanent = FALSE;
	description = "Mluvil jsi už s Lesterem?";
};


func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if((LesterGoXar == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Mluvil jsi už s Lesterem?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Ano, zasypal jsem ho otázkami. řekl mi toho hodně, ale byl úplně vyčerpaný.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Je vlastně zázrak, že ten útěk vůbec přežil. Poslal jsem ho, ať si odpočine.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Co ti řekl?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Bojím se, že nic dobrého. Nejen, že viděl draka, ale také muže v černých kápích.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//A?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Pokud ti muži skutečně existují, představuje jejich přítomnost možnou hrozbu.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//A to se mi moc nelíbí. Na, vezmi si můj prsten. Ochrání tě před magií.
	B_GiveInvItems(self,other,ItRi_Prot_Mage_01,1);
};


instance DIA_Xardas_FirstPal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = DIA_Xardas_FirstPal_Condition;
	information = DIA_Xardas_FirstPal_Info;
	permanent = FALSE;
	description = "Byl jsem ve městě.";
};


func int DIA_Xardas_FirstPal_Condition()
{
	if((Lothar.aivar[AIV_TalkedToPlayer] == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Byl jsem ve městě.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//A? Podařilo se ti promluvit si s vůdcem paladinů?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Nepustil mě k němu.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Nesmysl! Musí existovat způsob, jak se k němu dostat.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Když selže všechno ostatní, vstup do kláštera a staň se mágem.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Možná to je z morálního hlediska trošku pochybné, ale účel světí prostředky.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Pokud budeš mágem, určitě setkání s tebou neodmítne.
};


instance DIA_Xardas_Weiter(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = DIA_Xardas_Weiter_Condition;
	information = DIA_Xardas_Weiter_Info;
	permanent = FALSE;
	description = "Tak co uděláme teď?";
};


func int DIA_Xardas_Weiter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Weiter_Info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//Tak co uděláme teď?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Budeme postupovat podle plánu. Jinak to nejde.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ty běž získat Innosovo oko a já budu hledat odpovědi.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_KdfSecret(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 9;
	condition = DIA_Xardas_KdfSecret_Condition;
	information = DIA_Xardas_KdfSecret_Info;
	permanent = FALSE;
	description = "Proč o tobě nemají mágové Ohně vědět?";
};


func int DIA_Xardas_KdfSecret_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Proč o tobě nemají mágové Ohně vědět?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Býval jsem vysoko postavený člen kruhu. Už tenkrát jsem měl podezření, že klíčem k magické bariéře by mohla být magie démonů.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Nikdy se mi však nepodařilo přesvědčit ostatní členy kruhu, aby sledovali tuhle stopu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Opustil jsem tedy kruh, abych mohl studovat černá umění.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//A to je zločin, pro který mágové Ohně, (jízlivě) 'Innosovi služebníci', vždy 'Dobří' a 'Ctnostní', nikdy nepřijmou žádnou omluvu.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Jsou si jisti, že jsem stále naživu, ale vůbec netuší, kde mě hledat - a to je jedině dobře.
};


instance DIA_Xardas_KAP3_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP3_EXIT_Condition;
	information = DIA_Xardas_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BACKFROMOW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 31;
	condition = DIA_Xardas_BACKFROMOW_Condition;
	information = DIA_Xardas_BACKFROMOW_Info;
	description = "Vrátil jsem se z Hornického údolí.";
};


func int DIA_Xardas_BACKFROMOW_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Vrátil jsem se z Hornického údolí.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Už bylo načase. Co jsi viděl?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Měl jsi pravdu. Celá země se hemží nepřátelskou armádou.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Skřeti obléhají hrad a draci zpustošili celý kraj.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Jestli se nepletu, tak nebude dlouho trvat a zaútočí na Khorinis.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_DMTSINDDA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 32;
	condition = DIA_Xardas_DMTSINDDA_Condition;
	information = DIA_Xardas_DMTSINDDA_Info;
	description = "Co se to tu proboha stalo?";
};


func int DIA_Xardas_DMTSINDDA_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	if(Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Lester říkal, že mě chceš okamžitě vidět.
	};

	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Co se to tu proboha stalo?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Nepřítel se dozvěděl, kdo ve skutečnosti jsi, a chce se zmocnit Innosova oka.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Zjistil, jaká hrozba se na něj žene. Donutilo ho to opustit úkryt a přejít do útoku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Je konec hry na schovávanou. Ještě včera nikdo nevěděl, jak bude nepřátelský útok vypadat. Teď je to nad slunce jasné.
	XarMeetPsi = TRUE;
	B_LogEntry(TOPIC_INNOSEYE,"Nepřítel se dozvěděl, že hledám Innosovo oko. Je načase ho získat, než bude příliš pozdě.");
	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Zaútočili na mě mágové v černých kápích.",DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Konečně jsem získal důkaz pro lorda Hagena.",DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Zaútočili na mě mágové v černých kápích.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//Nepřítel má mnoho podob. Pátrači jsou jednou z nich. Oni jsou těmi, kdo připravuje půdu pro nepřítele.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Zaujali pozice na strategických místech a teď jen čekají na vhodnou příležitost, aby spustili past.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Vyhýbej se jim. Jsou to mocná magická stvoření a pokusí se tě odstranit z cesty za každou cenu.

	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry(TOPIC_DEMENTOREN,"Xardas ty tmavě oděné mágy zná. Pátrači jsou pravděpodobně těmi, jenž ovládají naši nepřátelé. Jsou nesmírně nebezpeční.");
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Konečně jsem získal důkaz pro lorda Hagena.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Co je to za důkaz?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Dostal jsem dopis od Garonda, velitele paladinů z Hornického údolí. Žádá v něm o posily.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//To by snad mělo toho militantního politika přesvědčit. Dobrá práce.
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"Co uděláme teď?",DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//Co uděláme teď?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Jdi a dones lordu Hagenovi dopis od Garonda, měl by ti zařídit přístup k Innosovu oku.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Pak běž do kláštera a promluv si s Pyrokarem. Bude ti muset Oko dát.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Nic není důležitějšího, než dostat ten artefakt do bezpečí.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Teď běž, dokud není pozdě. I nepřítel se ho určitě pokusí získat.
	B_LogEntry(TOPIC_INNOSEYE,"Oko se nachází v klášteře mágů Ohně. Doufejme, že mi tam lord Hagen nyní dovolí vejít, když mu předám zprávu od lorda Garonda. Hlavní mág Pyrokar mě totiž bez Hagenova svolení k amuletu vůbec nepustí.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(PC_Psionic,"XardasTow");
};


instance DIA_Xardas_INNOSEYEBROKEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 33;
	condition = DIA_Xardas_INNOSEYEBROKEN_Condition;
	information = DIA_Xardas_INNOSEYEBROKEN_Info;
	description = "Innosovo oko bylo zničeno.";
};


func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Innosovo oko bylo zničeno.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Co to říkáš? Zničeno?!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Tohle jsem našel nahoře v severních lesích - bohužel se mi podařilo získat už jen jeho úlomky.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Byla to naše jediná naděje, jak obstát v boji s draky. Teď je v nenávratnu. Selhali jsme.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN,"Co teď?",DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//Co teď?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//To je bolestná zpráva. Musíme se sami v téhle situaci zorientovat. Stáhnu se a zkusím najít řešení.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//Mezitím bys měl jít do města a promluvit si s mágem Vody Vatrasem. Je možné, že bude vědět, co by se mělo udělat.
	B_LogEntry(TOPIC_INNOSEYE,"Zpráva o zničení Innosova oka Xardase rozhodně nepotěšila. Naší jedinou nadějí je nyní mág Vody jménem Vatras, který sídlí ve městě Khorinisu.");
	MIS_Xardas_GoToVatrasInnoseye = LOG_Running;
};


instance DIA_Xardas_RITUALREQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_RITUALREQUEST_Condition;
	information = DIA_Xardas_RITUALREQUEST_Info;
	description = "Posílá mě za tebou Vatras.";
};


func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && Npc_KnowsInfo(other,DIA_Xardas_INNOSEYEBROKEN) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Posílá mě za tebou Vatras.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//To je dobře. Co řekl?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Povídal něco o obráceném rituálu ve Slunečním kruhu.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(zasměje se) Ten starý pekelník. Myslím, že vím, co má za lubem. Přišel jsi, abys mě dostal k němu.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Vypadá to tak. Kdy vyrazíš na cestu?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Nesmím nechat Vatrase čekat. Okamžitě se vydám na cestu. Splň, co musíš, a pak se ke mně znovu přidej.
		AI_StopProcessInfos(self);
		B_LogEntry(TOPIC_INNOSEYE,"Xardas souhlasil, že se zúčastní rituálu kruhu Slunce.");
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Zúčastním se rituálu až ve chvíli, kdy si budu jistý, že jsi plně připraven utkat se s draky.
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_07");	//A ne jen pro tvé hezké oči.
		B_LogEntry(TOPIC_INNOSEYE,"Xardas se rituálu nezúčastní, dokud nebudu schopen postavit se drakům.");
	};
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_WARUMNICHTJETZT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_WARUMNICHTJETZT_Condition;
	information = DIA_Xardas_WARUMNICHTJETZT_Info;
	description = "Proč se na schůzku s Vatrasem nevydáš hned?";
};


func int DIA_Xardas_WARUMNICHTJETZT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Proč se na schůzku s Vatrasem nevydáš hned?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//Někdy ti prostě nerozumím.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(naštvaný) Tímhle tónem se mnou nemluv. Kdyby nebylo mě, tvoje bezcenné tělo by ještě hnilo v tom chrámu.
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Uklidni se! Prostě mi řekni, co musím udělat.",DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"Pak mi alespoň vysvětli, proč vyčkáváš.",DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WARUMNICHTJETZT_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Pak mi alespoň vysvětli, proč vyčkáváš.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//Od chvíle, co jsem opustil mágy Ohně, jsem se snažil zůstat daleko od nich.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//A nemám v úmyslu tohle měnit, aniž bych neměl absolutně žádnou jinou možnost.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Takže dřív, než se vydám napospas výčitkám těchto mágů, chci se ujistit, že máme alespoň nějakou šanci proti drakům.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//S tvým ubohým vybavením však daleko nezajdeš. Vrať se, až budeš dost silný.
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Uklidni se! Prostě mi řekni, co musím udělat.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Jsi pořád ještě slabý, než abys bojoval s draky. S touhle výzbrojí nemáš žádnou šanci.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Nevracej se ke mně, dokud nebudeš zcela připraven. Pak půjdu a vydám se k Vatrasovi.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BEREIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = DIA_Xardas_BEREIT_Condition;
	information = DIA_Xardas_BEREIT_Info;
	description = "Jsem připraven bojovat s draky.";
};

func int DIA_Xardas_BEREIT_Condition()
{
	if((Xardas_GoesToRitualInnosEye == FALSE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Jsem připraven bojovat s draky.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//V tom případě už nemůžeme plýtvat časem. Okamžitě se vydám ke Slunečnímu kruhu. Splň, co musíš. Setkáme se tam.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_INNOSEYE,"Xardas souhlasil, že se zúčastní rituálu kruhu Slunce.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	Xardas_GoesToRitualInnosEye = TRUE;
};


instance DIA_Xardas_BINGESPANNT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 35;
	condition = DIA_Xardas_BINGESPANNT_Condition;
	information = DIA_Xardas_BINGESPANNT_Info;
	permanent = TRUE;
	description = "Bude obrácený rituál fungovat?";
};


func int DIA_Xardas_BINGESPANNT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3) && (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Bude obrácený rituál fungovat?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//To nemůžu vědět jistě. Záleží to na tom, co přesně chce Vatras udělat.
};


instance DIA_Xardas_PYROWILLNICHT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 37;
	condition = DIA_Xardas_PYROWILLNICHT_Condition;
	information = DIA_Xardas_PYROWILLNICHT_Info;
	description = "Pyrokar odmítá zúčastnit se rituálu.";
};


func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if((Pyrokar_DeniesInnosEyeRitual == TRUE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNICHT_Info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Pyrokar odmítá zúčastnit se rituálu.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Především chce důkaz, že ti může věřit.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//No ano. Pyrokar. Velice zajímavé.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Z toho starocha se stává docela mrzout. Ale myslím, že pro tebe mám něco užitečného.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Když jsem kdysi opouštěl řád mágů Ohně, vzal jsem si z kláštera pár věcí.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Nechtěl jsem, aby náhodou přišla skupina paladinů nebo mágů Ohně, prohledali věž skrz naskrz a ty věci našli.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Tak jsem je schoval na bezpečná místa, kde by je mágové určitě nikdy nehledali.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//A kde?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Některé z nich jsou zamčené v truhle na Sekobově farmě.
	Sekob_RoomFree = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Tomu Sekobovi věříš?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Ne. Ale je možné ho koupit a neklade žádné ošidné otázky. Ta truhla je navíc zamčená. Tady máš klíč.
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Mezi těmi věcmi je jedna velice stará kniha. Až ji Pyrokar spatří, bude vědět, že pochází ode mě.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Už mi je k ničemu. Ale řekl bych, že k tomuhle úkolu by se mohla docela dobře hodit.
	B_LogEntry(TOPIC_INNOSEYE,"Xardas mi dal klíč od truhly na Sekobově statku. Knihu, kterou uvnitř najdu, mám zanést Pyrokarovi.");
};


instance DIA_Xardas_RitualInnosEyeRepairImportant(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information = DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important = TRUE;
};


func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Teď, když je Innosovo oko opraveno, se musíš postavit drakům!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Všichni draci slouží Beliarovi, Temnému bohu.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Musí ale existovat nějaká pozemská síla, která je ovládá.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Zjisti, co je to za sílu.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//Vrať se sem, jakmile to zjistíš.
	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant,Dialog_Ende,DIA_Xardas_RitualInnosEyeRepairImportant_weiter);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
{
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Xardas,"Start");
	B_StartOtherRoutine(Vatras,"Start");
};


instance DIA_Xardas_WASNUN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_WASNUN_Condition;
	information = DIA_Xardas_WASNUN_Info;
	permanent = TRUE;
	description = "Innosovo oko je opraveno. Co dál?";
};


func int DIA_Xardas_WASNUN_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Innosovo oko je opraveno. Co dál?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Nezapomeň ho mít na sobě, až budeš stát drakům tváří v tvář.
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_04");	//A měj na paměti, že pro boj s těmi stvořeními temnoty možná budeš potřebovat Uriziel.
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_05");	//Moc toho meče bude v obtížích, jimž budeš čelit, bezpochyby velkým přínosem.
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_06");	//To je vše, co jsem ti chtěl říci.

	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Neztrácej čas. Běž do Hornického údolí a zabij ty draky.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Jdi za Pyrokarem, ať ti vysvětlí, jak Innosovo oko používat.
	};
};

instance DIA_Xardas_KAP4_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP4_EXIT_Condition;
	information = DIA_Xardas_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_PERM4(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 40;
	condition = DIA_Xardas_PERM4_Condition;
	information = DIA_Xardas_PERM4_Info;
	permanent = TRUE;
	description = "Co je nového?";
};

func int DIA_Xardas_PERM4_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Pátrači ještě neodešli. Nedají si pokoj, dokud tě nedostanou.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Zabij draky v Hornickém údolí a zjisti, kdo za těmi útoky stojí. Jinak bude jejich síla neustále narůstat.
};

instance DIA_Xardas_KAP5_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP5_EXIT_Condition;
	information = DIA_Xardas_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_KAP6_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP6_EXIT_Condition;
	information = DIA_Xardas_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_PRETEACH(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_preteach_condition;
	information = dia_xardas_preteach_info;
	description = "Můžu se učit nekromantskou magii?";
};

func int dia_xardas_preteach_condition()
{
	if(hero.guild == GIL_KDM)
	{
		return TRUE;
	};
};

func void dia_xardas_preteach_info()
{
	AI_Output(other,self,"DIA_Xardas_PreTeach_15_00");	//Můžu se učit nekromantskou magii?
	AI_Output(self,other,"DIA_Xardas_PreTeach_05_01");	//Vytvořit nekromantské runy není problém. Hlavní věc jsou však kruhy.
	AI_Output(self,other,"DIA_Xardas_PreTeach_05_02");	//Můžu tě učit, jsi-li dost zkušený.
	AI_Output(self,other,"DIA_Xardas_PreTeach_05_03");	//Je důležité být velmi opatrný - nekromantská magie je nejsilnější destruktivní magií v tomto světě.
	AI_Output(self,other,"DIA_Xardas_PreTeach_05_04");	//Pamatuj a užívej tyto znalosti moudře!
	XARDAS_TEACHRUNES = TRUE;
	XARDAS_TEACHCIRCLE = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Xardas mě může naučit tvořit runy nekromantů a vysvětlí mi, jak porozumět kruhům magie.");
};


instance DIA_XARDAS_SACTANOME(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_sactanome_condition;
	information = dia_xardas_sactanome_info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco dalšího?";
};


func int dia_xardas_sactanome_condition()
{
	if((hero.guild == GIL_KDM) && Npc_KnowsInfo(other,dia_xardas_preteach))
	{
		return TRUE;
	};
};

func void dia_xardas_sactanome_info()
{
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_00");	//Můžeš mě naučit něco dalšího?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_01");	//Stále je toho hodně, ale můžu tě učit pouze, zda-li jsi dostatečně zkušený.
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_02");	//Měl bys vědět, že některá tajemství magie Temnoty mohou být extrémně nebezpečná.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_04");	//Jaká jsou ta tajemství?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_05");	//Jedno z nich je Sakta Nomen.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_06");	//Sakta Nomen?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_07");	//V jazyce démonů to je 'Oběť krve' - to samo o sobě již napovídá o podstatě této věci.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_08");	//Můžeš trochu podrobněji...?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_09");	//Sakta Nomen ti umožní používat runy a svitky magie Temnoty i když nemáš dostatek many.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_10");	//Ale jak?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_11");	//Z tvé vlastní krve... (vážně)
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_13");	//Proto bys tuto dovednost měl použít jen v naprosto nezbytných případech.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_16");	//Dobře, rozumím.
	XARDAS_TEACHSACTANOME = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Xardas mě naučí umění Sakta Nomen, které v jazyce démonů znamená 'Oběť krve'. S touto schopností mohu použít runy a svitky magie Temnoty na úkor mé životní síly, pokud moje magická moc nestačí k tomu, abych kouzlo seslal.");
};


instance DIA_XARDAS_TEACHSACTANOME(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 998;
	condition = dia_xardas_teachsactanome_condition;
	information = dia_xardas_teachsactanome_info;
	permanent = TRUE;
	description = "Nauč mě Sakta Nomen. (VB: 50, cena: 50000 zlatých)";
};


func int dia_xardas_teachsactanome_condition()
{
	if((hero.guild == GIL_KDM) && (XARDAS_TEACHSACTANOME == TRUE) && (XARDAS_KNOWSSACTANOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_teachsactanome_info()
{
	AI_Output(other,self,"DIA_Xardas_TeachSactaNome_01_00");	//Nauč mě Sakta Nomen.
	AI_Output(self,other,"DIA_Xardas_TeachSactaNome_01_01");	//Jsi si tím jistý?
	Info_ClearChoices(dia_xardas_teachsactanome);
	Info_AddChoice(dia_xardas_teachsactanome,"Vlastně ne.",dia_xardas_teachsactanome_no);
	Info_AddChoice(dia_xardas_teachsactanome,"Ano.",dia_xardas_teachsactanome_yes);
};

func void dia_xardas_teachsactanome_no()
{
	AI_Output(other,self,"DIA_Xardas_TeachSactaNome_No_01_00");	//Vlastně ne.
	AI_Output(self,other,"DIA_Xardas_TeachSactaNome_No_01_01");	//Dobře, že jsi to řekl.
	Info_ClearChoices(dia_xardas_teachsactanome);
};

func void dia_xardas_teachsactanome_yes()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50000) && (other.lp >= 50))
	{
		AI_Print(PRINT_SACTANOME);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Output(self,other,"DIA_Xardas_TeachSactaNome_Yes_01_01");	//Pak poznej skutečnou sílu magie Temnoty a nechť tvé oběti nejsou zbytečné!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Xardas_TeachSactaNome_Yes_01_02");	//SAKTA SHADAR NOMEN TAR MADAR SATAG!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Xardas_TeachSactaNome_Yes_01_03");	//Užívej tyto znalosti moudře.
		other.lp = other.lp - 50;
		RankPoints = RankPoints + 50;
		Npc_RemoveInvItems(other,ItMi_Gold,50000);
		XARDAS_KNOWSSACTANOME = TRUE;
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Naučil jsem se umění Sakta Nomen.");
		Info_ClearChoices(dia_xardas_teachsactanome);
		Info_ClearChoices(dia_xardas_teachsactanome);
	}
	else if(other.lp < 50)
	{
		AI_Output(self,other,"DIA_Xardas_TeachSactaNome_01_05");	//Nejsi dost zkušený, promluvíme si později.
		Info_ClearChoices(dia_xardas_teachsactanome);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_TeachSactaNome_01_08");	//Nemáš dost zlata! Promluvíme si později.
		Info_ClearChoices(dia_xardas_teachsactanome);
	};
};


instance DIA_XARDAS_EXPLAINCIRCLES(C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_explaincircles_condition;
	information = dia_xardas_explaincircles_info;
	permanent = FALSE;
	description = "Můžeš mi objasnit smysl kruhů magie?";
};


func int dia_xardas_explaincircles_condition()
{
	if((hero.guild == GIL_KDM) && Npc_KnowsInfo(other,dia_xardas_preteach))
	{
		return TRUE;
	};
};

func void dia_xardas_explaincircles_info()
{
	AI_Output(other,self,"DIA_Xardas_EXPLAINCIRCLES_Info_15_01");	//Můžeš mi objasnit smysl kruhů magie?
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_02");	//Kruhy symbolizují tvé porozumění magii.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_03");	//Vyšší kruh znamená více kouzel, která můžeš použít.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_04");	//Musíš projít každým předcházejícím kruhem, abych tě mohl naučit další.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_05");	//Budeš muset vydržet dlouhé hodiny tréninku, než tě zasvětím do všech kruhů.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_06");	//Pokaždé dosáhneš nových kouzel, na kterých projevíš svou zručnost.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_07");	//Budou součástí tvého života.
	AI_Output(self,other,"DIA_Xardas_EXPLAINCIRCLES_Info_14_08");	//Porozumíš sobě a zároveň objevíš nesmírnou sílu magie Temnoty.
	EXPLAINCIRCLEMEAN = TRUE;
};


instance DIA_XARDAS_RUNEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_runen_condition;
	information = dia_xardas_runen_info;
	permanent = TRUE;
	description = "Nauč mě vytvářet runy.";
};


func int dia_xardas_runen_condition()
{
	if(XARDAS_TEACHRUNES == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Nauč mě vytvářet runy.
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_DEMONOLOG) == 1) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(dia_xardas_runen,"Démonologické runy",dia_xardas_runen_dem);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_xardas_runen,"6. kruh magie",dia_xardas_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_xardas_runen,"5. kruh magie",dia_xardas_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_xardas_runen,"4. kruh magie",dia_xardas_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_xardas_runen,"3. kruh magie",dia_xardas_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_xardas_runen,"2. kruh magie",dia_xardas_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_xardas_runen,"1. kruh magie",dia_xardas_runen_1);
	};
};

func void dia_xardas_runen_back()
{
	Info_ClearChoices(dia_xardas_runen);
};

func void dia_xardas_runen_dem()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);
	if((PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE) && (XARDASTEACHCASTDEMON == TRUE))
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_xardas_runen_circle_4_spl_summondemon);
	};
};

func void dia_xardas_runen_1()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_xardas_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_xardas_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_xardas_runen_circle_1_spl_Rage);
	};
};

func void dia_xardas_runen_2()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_xardas_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_xardas_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_xardas_runen_circle_2_spl_Lacerate);
	};
};

func void dia_xardas_runen_3()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_xardas_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_xardas_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_xardas_runen_circle_3_spl_energyball);
	};
};

func void dia_xardas_runen_4()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_xardas_runen_circle_4_spl_deathball);
	};
};

func void dia_xardas_runen_5()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_xardas_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_xardas_runen_6()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runen,Dialog_Back,dia_xardas_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes("Černá mlha",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_xardas_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_xardas_runen_circle_6_spl_skull);
	};
};

func void dia_xardas_runen_circle_1_spl_Rage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Rage);
};

func void dia_xardas_runen_circle_2_spl_Lacerate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Lacerate);
};

func void dia_xardas_runen_circle_1_spl_deathbolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathbolt);
};

func void dia_xardas_runen_circle_1_spl_summongoblinskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_xardas_runen_circle_2_spl_suckenergy()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ManaForLife);
};

func void dia_xardas_runen_circle_2_spl_summonzombie()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonZombie);
};

func void dia_xardas_runen_circle_3_spl_swarm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Swarm);
};

func void dia_xardas_runen_circle_3_spl_summonskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void dia_xardas_runen_circle_3_spl_energyball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Energyball);
};

func void dia_xardas_runen_circle_4_spl_summondemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void dia_xardas_runen_circle_4_spl_deathball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathball);
};

func void dia_xardas_runen_circle_5_spl_armyofdarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_xardas_runen_circle_6_spl_massdeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void dia_xardas_runen_circle_6_spl_skull()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Skull);
};


var int dia_xardas_trade_onetime;

instance DIA_XARDAS_CANTRADE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_cantrade_condition;
	information = dia_xardas_cantrade_info;
	permanent = FALSE;
	description = "Nevíš, kde můžu získat svitky s kouzly magie Temnoty?";
};


func int dia_xardas_cantrade_condition()
{
	if((XARDAS_TEACHRUNES == TRUE) && (DIA_XARDAS_TRADE_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_cantrade_info()
{
	DIA_XARDAS_TRADE_ONETIME = TRUE;
	AI_Output(other,self,"DIA_Xardas_CanTrade_01_01");	//Nevíš, kde můžu získat svitky s kouzly magie Temnoty?
	AI_Output(self,other,"DIA_Xardas_CanTrade_01_02");	//Dobrá otázka. Pro tvorbu run jsou svitky nezbytné.
	AI_Output(self,other,"DIA_Xardas_CanTrade_01_03");	//Některé bys mohl najít u obchodníků s magií.
	AI_Output(self,other,"DIA_Xardas_CanTrade_01_04");	//U mě můžeš získat také vzácné svitky s temnými kouzly.
};


instance DIA_XARDAS_TRADE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_trade_condition;
	information = dia_xardas_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své magické svitky.";
};


func int dia_xardas_trade_condition()
{
	if((XARDAS_TEACHRUNES == TRUE) && (DIA_XARDAS_TRADE_ONETIME == TRUE))
	{
		return TRUE;
	};
	if((CHOOSEDARK == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_xardas_trade_info()
{
	AI_Output(other,self,"DIA_Xardas_Trade_01_01");	//Ukaž mi své magické svitky.
	B_GiveTradeInv(self);
};


instance DIA_XARDAS_CIRCLE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_circle_condition;
	information = dia_xardas_circle_info;
	permanent = TRUE;
	description = "Chci porozumět podstatě magie.";
};

func int dia_xardas_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (XARDAS_TEACHCIRCLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_circle_info()
{
	AI_Output(other,self,"DIA_Xardas_CIRCLE_15_00");	//Chci porozumět podstatě magie.
	Info_ClearChoices(DIA_Xardas_CIRCLE);
	Info_AddChoice(DIA_Xardas_CIRCLE,Dialog_Back,DIA_Xardas_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"1. kruh magie (VB: 20)",DIA_Xardas_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"2. kruh magie (VB: 30)",DIA_Xardas_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"3. kruh magie (VB: 40)",DIA_Xardas_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"4. kruh magie (VB: 60)",DIA_Xardas_CIRCLE_4);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_31");	//Nemáme čas! Vrať se později.
	};
};

func void DIA_Xardas_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_01");	//Při vstupu do prvního kruhu se naučíš používat své první runy.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_02");	//Každá runa obsahuje strukturu zvláštního kouzla.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_03");	//Pro použití runy jednoduše uvolni svou magickou sílu - manu.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_04");	//A narozdíl od svitků je runa věčná.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_05");	//Každá runa má v sobě jistou magickou sílu.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_06");	//Stejně jako se svitkem, v okamžiku, kdy použiješ runu, spotřebuješ část své vlastní magické síly.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_07");	//S každým novým kruhem se dozvíš více o runách.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_09");	//Už ses naučil, jak porozumět runám. Je na čase prohloubit své znalosti.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_10");	//Když vstoupíš do druhého kruhu, pochopíš základy silnějších kouzel.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_11");	//Ale pro poznání skutečného tajemství magie se ještě musíš hodně učit.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_12");	//Jak víš, runu můžeš používat opakovaně, než ti dojde magická síla. Po jejím doplnění můžeš začít znovu. Runa se nikdy nevyčerpá.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_13");	//Avšak než něco uděláš, promysli si to. Můžeš způsobit nenávratné škody.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_14");	//Pravý mág je používá jen tehdy, když je to nutné.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_15");	//Nauč se posoudit situaci a poznáš pravou sílu run.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_16");	//Třetí kruh je hlavní etapa v životě mága. Přestáváš býti hledačem a našel jsi podstatu kouzel.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_17");	//Už umíš použít mocné runy a překročil jsi polovinu své cesty.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_18");	//Tyto znalosti jsou základem magie. Užívej jich moudře.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_19");	//Můžeš je použít nebo taky nemusíš. Co musíš je se rozhodnout.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_20");	//Jakmile se rozhodneš, použij sílu bez váhání.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_21");	//Najdi cestu a rozhodni se, jestli po ní budeš pokračovat do dalšího kruhu.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_22");	//Po překročení třetího kruhu ti již nic nebrání odhalit pravou magii.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_23");	//Základ kouzla není ono samé, ale runa vyrobena ze speciálních runových kamenů.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_24");	//Jedná se o stejnou rudu, která se těží v dolech. V chrámech je obdařena magickými zaříkadly a na stejném místě jsou runy transformovány do nástrojů naší síly.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_25");	//Znalosti jejich výroby jsou střeženy v chrámech Innose, Adana nebo Beliara.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_27");	//Jakmile se naučíš kouzlu, otevře se ti tajmeství moci.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_28");	//A co více - ti, kteří dokázali vstoupit do čtvrtého kruhu magie, dostanou tu čest obdržet mezi nekromanty těžké roucho mágů Temnoty.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_29");	//Nyní jsi jeden z elity Temného boha.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_30");	//Zde, přijmi toto roucho, dokazující tvé magické umění.
		CreateInvItems(other,ItMW_Addon_Stab03,1);
		CreateInvItems(self,itar_dmt_h,1);
		B_GiveInvItems(self,other,itar_dmt_h,1);
		NEKR_H_ROBA = TRUE;
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

instance DIA_XARDAS_PRETEACH_MANA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_preteach_mana_condition;
	information = dia_xardas_preteach_mana_info;
	permanent = FALSE;
	description = "Můžeš mi pomoci zlepšit mou magickou sílu?";
};

func int dia_xardas_preteach_mana_condition()
{
	if((other.guild == GIL_KDM) && Npc_KnowsInfo(other,dia_xardas_preteach))
	{
		return TRUE;
	};
};

func void dia_xardas_preteach_mana_info()
{
	AI_Output(other,self,"DIA_Xardas_PreTeach_Mana_15_00");	//Můžeš mi pomoci zlepšit mou magickou sílu?
	AI_Output(self,other,"DIA_Xardas_PreTeach_Mana_05_01");	//Samozřejmě, ale také se musíš naučit ji ovládat.
	AI_Output(self,other,"DIA_Xardas_PreTeach_Mana_05_03");	//Magická energie - mana, znamená sílu pro každého mága.
	AI_Output(self,other,"DIA_Xardas_PreTeach_Mana_05_04");	//Používáme ji k tvorbě magických run a jejich použití, avšak není neomezená.
	AI_Output(self,other,"DIA_Xardas_PreTeach_Mana_05_05");	//Kromě jejího navýšení by ses ji měl také naučit používat rozumně a umět ji limitovat.
	AI_Output(self,other,"DIA_Xardas_PreTeach_Mana_05_06");	//Jen tak se můžeš stát velkým mágem.
	XARDAS_TEACHMANA = TRUE;
};

instance DIA_XARDAS_TEACH_MANA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = dia_xardas_teach_mana_condition;
	information = dia_xardas_teach_mana_info;
	permanent = TRUE;
	description = "Chci zvětšit svou magickou sílu.";
};

func int dia_xardas_teach_mana_condition()
{
	if((other.guild == GIL_KDM) && (XARDAS_TEACHMANA == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE))) 
	{
		return TRUE;
	};
};

func void dia_xardas_teach_mana_info()
{
	AI_Output(other,self,"DIA_Xardas_TEACH_MANA_15_00");	//Chci zvětšit svou magickou sílu.
	AI_Output(self,other,"DIA_Xardas_TEACH_MANA_15_01");	//S tím ti mohu pomoci.
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA,"Regenerace many (VB: 15)",DIA_Xardas_TEACH_MANA_Regen);
	};
};

func void dia_xardas_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Xardas_TEACH_MANA_05_00");	//Už ti více nemůžu pomoci.
		AI_Output(self,other,"DIA_Xardas_TEACH_MANA_05_01");	//Dosáhl jsi hranice, kterou tě můžu naučit.
	};

	Info_ClearChoices(dia_xardas_teach_mana);
};

func void DIA_Xardas_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Nauč mě, jak regenerovat manu.

	kosten = 15;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Regenerace many");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);
};

func void dia_xardas_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA,"Regenerace many (VB: 15)",DIA_Xardas_TEACH_MANA_Regen);
	};
};

func void dia_xardas_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA,"Regenerace many (VB: 15)",DIA_Xardas_TEACH_MANA_Regen);
	};
};


instance DIA_XARDAS_TELLABOUTKREOL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_tellaboutkreol_condition;
	information = dia_xardas_tellaboutkreol_info;
	permanent = FALSE;
	description = "Znáš jazyk démonů?";
};


func int dia_xardas_tellaboutkreol_condition()
{
	if(Npc_KnowsInfo(other,dmt_1214_tegon_hello))
	{
		return TRUE;
	};
};

func void dia_xardas_tellaboutkreol_info()
{
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_00");	//Znáš jazyk démonů?
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_01");	//Co?! Kde ses dozvěděl, že bych ho mohl ovládat? (překvapeně)
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_02");	//Řekl mi to Strážce Tegon...
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_03");	//... (přeruší) Nemusíš pokračovat, teď už tomu rozumím...
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_04");	//Předpokládám, že se ho musíš naučit, abys splnil Tegonovu zkoušku.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_05");	//Mám tu nějaké záznamy na pulpitech v mé věži.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_06");	//Možná bych tě mohl naučit je přečíst...
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_07");	//Na to jsem se tě chtěl zeptat.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_08");	//Ale velmi se bojím, že to nebude možné.
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_11");	//Strážce Tegon mi řekl, že mi pomůžeš!
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_12");	//Ve skutečnosti si nebyl jistý, jestli tě ho budu schopen naučit.
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_15");	//A znáš někoho jiného?
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_18");	//Jmenuje se Creol. Je to velmi mocný nekromant a ani Strážci ho nedokázali přimět, aby jim pomohl rozšířit jejich znalosti démonických jazyků.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_19");	//Creol je přívrženec Temného boha a má ambice stát se jedním z Beliarovy elity.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_22");	//Nicméně na něj musíš udělat dojem.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_23");	//Nevím, jak přesně, ale něco si vymysli.
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_24");	//Creol je velmi přísný a když jen trochu upustíš od dobrých mravů v jeho přítomnosti, může to být tvůj konec.
	AI_Output(other,self,"DIA_Xardas_TellAboutKreol_01_25");	//Kde bych mohl najít toho Creola?
	AI_Output(self,other,"DIA_Xardas_TellAboutKreol_01_26");	//Když jsem o něm slyšel naposled, byl v Hornickém údolí, takže bys měl začít tam.
	XARDASTELLABOUTKREOL = TRUE;
	Log_CreateTopic(TOPIC_FINDKREOL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_Running);
	MIS_FINDKREOL = LOG_Running;
	B_LogEntry(TOPIC_FINDKREOL,"Xardas mi řekl o někom, kdo by mě mohl naučit jazyk démonů. Je to nekromant a jmenuje se Creol. Naposled byl viděn v Hornickém údolí, ale aby mě učil, musím na něj udělat dojem. Odmítl dokonce i Strážce.");
	Log_AddEntry(TOPIC_FINDKREOL,"Xardas mě varoval, že Creol je velmi namyšlený a kdybych v jeho přítomnosti upustil od dobrých mravů, mohl bych ho vyprovokovat, takže se musím chovat uctivě.");
};


instance DIA_XARDAS_TELLABOUTRESURECT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_tellaboutresurect_condition;
	information = dia_xardas_tellaboutresurect_info;
	permanent = TRUE;
	description = "Mám jednu otázku.";
};

func int dia_xardas_tellaboutresurect_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (Npc_HasItems(other,itat_skeletonbonealef) >= 1) && (AlefRitualTell == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_tellaboutresurect_info()
{
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_00");	//Mám jednu otázku.

	if(Wld_IsTime(9,0,21,0) == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_01");	//Tak se ptej.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_02");	//Hmmm... Xardasi, ty jsi nekromant, takže bys měl ovládat přivolání mrtvých.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_03");	//Přirozeně, jako každý dobrý nekromant. Proč tě to zajímá?
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_04");	//No, mám jeden problém s jedním člověkem, ze kterého potřebuji získat informace.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_05");	//Problém je v tom, že tato osoba je momentálně pryč. Vlastně je mrtvá.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_07");	//A co to má dělat se mnou?
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_08");	//Můžeš mu navrátit život, abych si s ním mohl promluvit?
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_09");	//Navrátit život? To nemůže nikdo, ani nekromant.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_11");	//No, mohl bych z něj udělat svého sluhu - zombii. Ale nejsem si jistý, jestli ti pak ještě něco poví.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_12");	//Obávám se, že jako zombie z něj nic nebude... Kromě toho z jeho těla není už žádné maso a jen pár kostí.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_13");	//Jen pár kostí říláš... (přemýšlí) No to by už něco...
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_17");	//Je tu jeden rituál - vyvolání duše zemřelého. Ale je velmi nezbezpečný.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_18");	//Jestli je to pro tebe nezbytné...
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_20");	//Hmmm... Dobře, dobře, ale k provedení rituálu něco potřebuji.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_21");	//Co?
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_22");	//Potřebujeme něco, k čemu byla připoutána duše. Například kostru.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_23");	//Ale netahej sem celou kostru, stačí jen kůstka.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_25");	//To není problém, jednu tu mám!
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_26");	//ANO? Opravdu?! Ukaž mi ji!
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_27");	//Tady.
		B_GiveInvItems(other,self,itat_skeletonbonealef,1);
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_29");	//Můžeme nyní začít s rituálem?
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_30");	//Jistě, ale musím tě upozornit, že rituál může mít nepříjemné vedlejší účinky.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_32");	//Za prvé s duší můžeš mluvit jen omezenou dobu, pak se kouzlo vyčerpá...
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_33");	//A co když odmítne mluvit, nebo nebude zodpovídat otázky?
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_34");	//To nemůžeme vědět, takže se budeme muset ptát opatrně...
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_35");	//A co dál?
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_36");	//Nic dobrého... Duše nebude ráda, že ji rušíme a pokusí se nám pomstít.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_46");	//Hlavně si to pořádně promysli.
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_47");	//Tak co říkáš?
		AlefRitualTell = TRUE;
		B_LogEntry(TOPIC_VIPERNUGGETS,"Jak jsem objevil, není to zase tak špatné. Podaří se mi promluvit s Alephem - přesněji s jeho duší. Xardas mi slíbil, že mi s tím pomůže. Dokáže provést rituál, který zhmotní Alephovu duši v našem světě. Xardas mi řekl, že to bude velmi nebezpečné. Můžu s duší chvíli mluvit, ale pak nad ní ztratí kontrolu a duše se mě pravděpodobně pokusí zabít.");
		Info_ClearChoices(dia_xardas_tellaboutresurect);
		Info_AddChoice(dia_xardas_tellaboutresurect,"Ne, počkej minutku!",dia_xardas_tellaboutresurect_answer1);
		Info_AddChoice(dia_xardas_tellaboutresurect,"Začněme.",dia_xardas_tellaboutresurect_answer2);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_99");	//To počká do zítra! Teď jsem unavený a chci odpočívat...
		AI_StopProcessInfos(self);
	};
};

func void dia_xardas_tellaboutresurect_answer1()
{
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_Answer1_01_00");	//Ne, počkej minutku!
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer1_01_01");	//Dobře.
	Info_ClearChoices(dia_xardas_tellaboutresurect);
};

func void dia_xardas_tellaboutresurect_answer2()
{
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer2_01_0A");	//Pak nesmíme ztrácet čas.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_XARDAS_ALEFCAST");
	AI_AlignToWP(self);
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer2_01_00");	//Ve jménu Temného boha tě volám...
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer2_01_01");	//Ustoupí světlo...! Nastane tma!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer2_01_02");	//Ukaž cestu jeho duši sem k nám...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer2_01_03");	//SHAKAN TAR MADAR! Přijď na mé volání...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC2");
	AI_TurnToNPC(self,other);
	Info_ClearChoices(dia_xardas_tellaboutresurect);
	Info_AddChoice(dia_xardas_tellaboutresurect,"...",dia_xardas_tellaboutresurect_answer3);
};

func void dia_xardas_tellaboutresurect_answer3()
{
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer3_01_00");	//Toť vše. Duše je tady.
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer3_01_01");	//Promluv s ní, ale neztrácej čas.
	Wld_InsertNpc(alef_soul,"NW_XARDAS_SOUL");
	ALEFRESURECTRITUAL = TRUE;
	Info_ClearChoices(dia_xardas_tellaboutresurect);
	Info_AddChoice(dia_xardas_tellaboutresurect,"Dobře.",dia_xardas_tellaboutresurect_answer5);
};

func void dia_xardas_tellaboutresurect_answer5()
{
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_Answer5_01_00");	//Dobře.
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer5_01_01");	//(slabě) Pospěš si...
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_Answer5_01_02");	//Co je s tebou?
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer5_01_03");	//Já... ne...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DRAINED");
};


instance DIA_XARDAS_RESURECTALEF(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_resurectalef_condition;
	information = dia_xardas_resurectalef_info;
	permanent = TRUE;
	description = "Jsem připraven na rituál.";
};

func int dia_xardas_resurectalef_condition()
{
	if((AlefRitualTell == TRUE) && (ALEFRESURECTRITUAL == FALSE) && (MIS_VIPERNUGGETS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_xardas_resurectalef_info()
{
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_01_00");	//Jsem připraven na rituál.

	if(Wld_IsTime(9,0,21,0) == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_ResurectAlef_01_01");	//Ano?
		AI_Output(other,self,"DIA_Xardas_ResurectAlef_01_02");	//Vyvolej jeho duši. Jsem připraven.
		AI_Output(self,other,"DIA_Xardas_ResurectAlef_01_03");	//Jsi si tím jistý?
		Info_ClearChoices(dia_xardas_tellaboutresurect);
		Info_AddChoice(dia_xardas_resurectalef,"Ne, rozmyslel jsem si to.",dia_xardas_resurectalef_answer1);
		Info_AddChoice(dia_xardas_resurectalef,"Ano!",dia_xardas_resurectalef_answer2);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_ResurectAlef_01_99");	//Promluvíme si o tom zítra. Nyní mne nech odpočinout...
		AI_StopProcessInfos(self);
	};
};

func void dia_xardas_resurectalef_answer1()
{
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer1_01_00");	//Ano!
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer1_01_01");	//To je dobře.
	Info_ClearChoices(dia_xardas_resurectalef);
};

func void dia_xardas_resurectalef_answer2()
{
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer2_01_0A");	//Pak nesmíme ztrácet čas.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_XARDAS_ALEFCAST");
	AI_AlignToWP(self);
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer2_01_00");	//Ve jménu Temného boha tě volám...
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer2_01_01");	//Ustoupí světlo...! Nastane tma!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer2_01_02");	//Ukaž cestu jeho duši sem k nám...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer2_01_03");	//SHAKAN TAR MADAR! Přijď na mé volání...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC2");
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,other);
	Info_ClearChoices(dia_xardas_resurectalef);
	Info_AddChoice(dia_xardas_resurectalef,"...",dia_xardas_resurectalef_answer3);
};

func void dia_xardas_resurectalef_answer3()
{
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer3_01_00");	//Toť vše. Duše je tady.
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer3_01_01");	//Promluv s ní, ale neztrácej čas.
	Wld_InsertNpc(alef_soul,"NW_XARDAS_SOUL");
	ALEFRESURECTRITUAL = TRUE;
	Info_ClearChoices(dia_xardas_resurectalef);
	Info_AddChoice(dia_xardas_resurectalef,"Dobře.",dia_xardas_resurectalef_answer4);
};

func void dia_xardas_resurectalef_answer4()
{
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer4_01_00");	//Dobře.
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer4_01_01");	//Pospěš si...
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer4_01_02");	//Co je s tebou?
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer4_01_03");	//Já... ne...
	Npc_ExchangeRoutine(self,"DRAINED");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_FINDDARKSOUL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_finddarksoul_condition;
	information = dia_xardas_finddarksoul_info;
	permanent = FALSE;
	description = "Říká ti něco Mora Ulartu?";
};


func int dia_xardas_finddarksoul_condition()
{
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_finddarksoul_info()
{
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_00");	//Říká ti něco Mora Ulartu?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_01");	//Hmmm... Tvé otázky mě nepřestávají překvapovat. Odkud ses to dozvěděl?
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_02");	//To není důležité, můžeš mi říci něco o tom kouzlu?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_03");	//Nevím toho moc, ale pokusím se ti vysvětlit vše podstatné.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_05");	//Jak vím, Mora Ulartu je velmi mocné kouzlo také nazývané jako 'Bludiště duší'.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_06");	//Přišlo na tento svět spolu s lidmi.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_07");	//Není přesně známo, jak toto kouzlo vstoupilo do tohoto světa, ale zdá se, že za to může sám Beliar.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_08");	//Myslím, že ti nemusím vysvětlovat k čemu kouzlo slouží, název mluví za vše.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_09");	//Řekni mi, jak bych mohl získat Mora Ulartu?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_10");	//Na co ti bude? (překvapen)
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_14");	//Potřebuji chytit duši jednoho démona.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_15");	//Aha! A jak dlouho už lovíš démony?! Poslouchej, je to velmi riskantní práce.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_17");	//No, jestli je chceš lovit, je to vlastně tvoje věc...
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_18");	//Ale obávám se, že to bude trochu komplikované, protože já to kouzlo nemám.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_19");	//Mohl bych ti však říci, kde hledat.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_20");	//Mám pocit, že to nebude tak snadné!
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_23");	//Je to dar pro ty, jejichž znalosti jsou tak velké, že by to kouzlo mohly vyvážit. Může ti ho dát jedině Beliar a to výměnou za něco, co chce.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_24");	//A nemyslím, že zrovna ty jsi hoden ji získat.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_25");	//V první řadě jsi mág Ohně - služebník Innose!
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_26");	//Obávám se, že nemáš šanci!... (Skepticky)
		CHANCEGETDARKSOUL = 1;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_27");	//V první řadě jsi paladin Innose!
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_28");	//Tvé šance jsou velmi malé!... (Skepticky)
		CHANCEGETDARKSOUL = 5;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_29");	//Kromě toho jsi mágem Vody, služebník Adana!
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_30");	//Sice mezi ním a Beliarem není vražedná nenávist, ale nespoléhal bych na to.
		CHANCEGETDARKSOUL = 25;
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_31");	//I když na druhou stranu jsi temný mág... (zamyšleně)
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_32");	//Myslím, že máš nějakou šanci!
		CHANCEGETDARKSOUL = 50;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_33");	//I když na druhou stranu nejsi podřízen žádnému z bohů!
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_34");	//Takže máš určitou šanci... (zamyšleně)
		CHANCEGETDARKSOUL = 75;
	};
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_35");	//V každém případě to bude nákladné.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_36");	//Dobře. Co musím udělat, aby mi Beliar dal Mora Ulartu?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_37");	//Pro začátek je nutné mu přinést něco, co chce.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_40");	//Pravděpodobně tvá duše, ale to je nepříznivá varianta.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_42");	//Hmmm... Myslím, že je tu ještě jedna věc.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_43");	//Jaká?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_46");	//No dobrá... Je tu jeden velmi mocný artefakt - amulet Triramar.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_47");	//Nevím, kdo ho vyrobil, ale předpokládám, že to byl samotný Beliar.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_48");	//Jak jinak vysvětlit, že po celou dobu byl uchovávan v chrámu Temného boha.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_49");	//Ale situace se poněkud změnila, když paladinové před půl stoletím tento chrám zničili.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_52");	//Našli artefakt, ale zničit ho nedokázali. Proto ho ukryli.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_53");	//Síla Innose jim pomohla odolat hněvu Beliara.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_54");	//Co je na něm tak speciálního?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_55");	//Skrývá se v něm jedna ze čtyř esencí Temného boha. Pro ty, kteří mu sloužili, byl tento artefakt zdrojem jejich síly.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_57");	//Pro Temného boha to je součást sebe samého.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_58");	//Chceš mi říct, že pokud Beliarovi přinesu tenhle amulet zpět, pak mi dá...
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_59");	//(přeruší) ... Jak jsem již řekl, jedině takhle si získáš Beliarovu pozornost. Avšak Beliar je mazaný a lstivý!
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_61");	//I když mu Triramar navrátíš, nikdo ti nezaručí, že ti dá Ulartu.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_63");	//Kromě toho si dokážeš představit, co by se stalo, kdyby se o tom dozvěděli paladinové.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_65");	//Kde ho paladinové střeží?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_66");	//Předpokládám, že ho ukryli ho někde na ostrově. Ale je velmi nepravděpodobné, že na něj narazíš ve městě nebo v klášteře.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_68");	//S největší pravděpodobností je toto místo spolehlivě ukryté před zvědavýma očima a je téměř nemožné se tam dostat.
	if(Npc_KnowsInfo(other,dia_pal_199_ritter_firstwarn) || Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_69");	//Mohl by být v královské pevnsti Azgan?
		AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_70");	//To si nemyslím, tam je moc lidí.
	};
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_74");	//A odkud o tom všem víš ty?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_75");	//Byl jsem jedním z vyšších mágů Ohně - takové věci nikdy neprojdou bez jejich vědomí.
	AI_Output(other,self,"DIA_Xardas_FindDarkSoul_01_76");	//Co mám dělat až najdu amulet?
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_77");	//Pomodli se k Beliarovi a amulet polož na oltář. Pak požádej Beliara o Mora Ulartu.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_81");	//A ještě něco... stále mě informuj. Pokud se dozvíš něco o amuletu, dej mi vědět.
	AI_Output(self,other,"DIA_Xardas_FindDarkSoul_01_85");	//Toť vše - můžeš jít.
	TELLABOUTDS = TRUE;
	XARDASLINE = TRUE;
	Wld_InsertNpc(pal_187_melhior,"NW_CITY_HABOUR_MELHIOR");
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Xardas mi řekl o Mora Ulartu, také zvaném 'Bludiště duší'. To kouzlo může být uděleno jen Beliarem a mé šance na to nejsou vysoké. Nicméně Xardas mi řekl, že když Beliarovi obětuji to, co chce, mé šance se velmi zvýší. Proto musím najít amulet Triramar, výtvor Temného boha, který ukořistili paladinové. Xardas neví přesně, kde by mohl být. Měl bych se zeptat někoho z paladinů...");
	Log_AddEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud se mi ten artefakt podaří získat, měl bych ho obětovat Beliarovi. Možná mi pak dá Ulartu, ale stejně bych podle Xardase měl počítat s případným neúspěchem.");
};


instance DIA_XARDAS_FINDETLU(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_findetlu_condition;
	information = dia_xardas_findetlu_info;
	permanent = FALSE;
	description = "Zjistil jsem, kde paladinové skryli amulet Triramar.";
};


func int dia_xardas_findetlu_condition()
{
	if((ETLUBEGINS == TRUE) && Npc_KnowsInfo(other,dia_xardas_finddarksoul) && (BEONETLU == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_findetlu_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_FindEtlu_01_00");	//Zjistil jsem, kde paladinové skryli amulet Triramar.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_01");	//A kde?
	AI_Output(other,self,"DIA_Xardas_FindEtlu_01_02");	//Na ostrově Etlu.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_03");	//Etlu?! Hmmm... To od nich bylo chytré.
	AI_Output(other,self,"DIA_Xardas_FindEtlu_01_04");	//Taky jsem zjistil, jak se tam dostat.
	AI_Output(other,self,"DIA_Xardas_FindEtlu_01_05");	//Na Khorinisu je portál vedoucí na Etlu.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_06");	//Portál?! Kde se tu vzal?
	AI_Output(other,self,"DIA_Xardas_FindEtlu_01_07");	//Postavili ho paladinové.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_08");	//Hmmm... (směje se) Ironie osudu! Pak stačí portál najít.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_13");	//Bojím se, že paladiny na ostrově nepotěší tvá návštěva.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_15");	//Každý, kdo to poruší je postaven mimo zákon.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_18");	//Dokonce i přesto, že jsi paladin.
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_19");	//Tam na ostrově tě tvé postavení neochrání!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_20");	//Dokonce i přesto, že jsi mág Ohně.
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_21");	//Tam na ostrově tě tvé postavení neochrání!
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_22");	//Dokonce i přesto, že jsi mág Vody.
		AI_Output(self,other,"DIA_Xardas_FindEtlu_01_23");	//Tam na ostrově tě tvé postavení neochrání!
	};
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_24");	//Proto se dobře připrav - můžeš očekávat těžký boj.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_25");	//Paladinové klidně zemřou, když tím ochrání artefakt.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_27");	//A ještě jedna věc - nesmíš ten amulet použít. Zabil by tě! (hrozivě)
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Xardas mi řekl, že nemám na ostrově čekat přivítání... Měl bych si dobře připravit zbraně. Také mi řekl, že si nesmím amulet nasadit - zabil by mě.");
};


instance DIA_XARDAS_ASKABOUTPEACEWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_askaboutpeaceway_condition;
	information = dia_xardas_askaboutpeaceway_info;
	permanent = FALSE;
	description = "Ještě jedna otázka.";
};


func int dia_xardas_askaboutpeaceway_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_findetlu) && (MEHASTRIRAVAR == FALSE) && (ASKABOUTPEACEWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_askaboutpeaceway_info()
{
	AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_00");	//Ještě jedna otázka.
	AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_01");	//A jaká?
	AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_03");	//Nemůžu amulet získat bez toho, aniž bych se postavil paladinům?
	AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_04");	//Jak už jsem ti řekl, tohle nevím.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_05");	//Jestli to chceš zjistit, zeptej se Beliara u jeho svatyně!
		if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_06");	//Jen nevím, jestli pomůže paladinovi.
		}
		else
		{
			AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_07");	//Jen nevím, jestli pomůže mágovi Ohně.
		};
		AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_08");	//Dobře, zkusím to.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_09");	//Jestli to chceš zjistit, zeptej se majitele amuletu!
		AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_10");	//Máš namysli Beliara?!
		AI_Output(self,other,"DIA_Xardas_AskAboutPeaceWay_01_11");	//Ano. Zkus se pomodlit a uvidíš.
		AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_12");	//Pak to zkusím.
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ptal jsem se Xardase, jestli není způsob, jak obejít paladiny. Řekl mi, abych se obrátil na Beliara.");
	};
	ASKABOUTPEACEWAY = TRUE;
};


instance DIA_XARDAS_FINDAMULET(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_findamulet_condition;
	information = dia_xardas_findamulet_info;
	permanent = FALSE;
	description = "Mám amulet Triramar!";
};


func int dia_xardas_findamulet_condition()
{
	if((Npc_HasItems(other,itmi_triramar) >= 1) && Npc_KnowsInfo(other,dia_xardas_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_xardas_findamulet_info()
{
	B_GivePlayerXP(200);

	if(Npc_HasItems(other,ITKE_SI_SIGN) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_SI_SIGN,1);
	};
	if(Npc_HasItems(other,ITKE_HAGEN_SECRETKEY) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_HAGEN_SECRETKEY,1);
	};

	AI_Output(other,self,"DIA_Xardas_FindAmulet_01_00");	//Mám amulet Triramar!
	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_01");	//CO?! Opravdu jsi ho získal?
	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_03");	//Nepřestáváš mě překvapovat. Vlastně bych si na to měl už zvyknout.

	if(CountPalmora >= 5)
	{
		AI_Output(self,other,"DIA_Xardas_FindAmulet_01_04");	//Hmmm... Doufám, že se nebudeš trápit tím, že získáním tohoto amuletu jsi poslal na věčnost tolik lidí?
		AI_Output(self,other,"DIA_Xardas_FindAmulet_01_08");	//Pravděpodobně jsi udělal chybu... No, už s tím nic neuděláme.
	};

	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_09");	//Teď, pro získání Mora Ulartu, ti zbývá obětovat svůj dar Beliarovi.
	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_10");	//Jdi k jeho nejbližší svatyni a požádej ho o Mora Ulartu výměnou za Triramar.
	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_11");	//Jednu svatyni můžeš najít na dalším patře mé věže, takže neztrácej čas.
	AI_Output(self,other,"DIA_Xardas_FindAmulet_01_12");	//Také pamatuj, co jsem ti řekl - Temný bůh je podlý!
	AI_Output(other,self,"DIA_Xardas_FindAmulet_01_14");	//Pak doufám, že budu mít štěstí.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ukázal jsem Xardasovi Triramar. Řekl mi, že ho můžu obětovat Beliarovi. Jedna svatyně je v horní části Xardasovy věže. Ale pozor - to, že obětuji amulet neznamená, že mi Beliar dá Ulartu. Měl bych si první získat jeho přízeň...");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GETSUPERBELIARWEAPON(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_getsuperbeliarweapon_condition;
	information = dia_xardas_getsuperbeliarweapon_info;
	permanent = FALSE;
	description = "Temný bůh mi věnoval Mora Ulartu!";
};


func int dia_xardas_getsuperbeliarweapon_condition()
{
	if((Npc_HasItems(hero,itru_moraulartu) >= 1) && Npc_KnowsInfo(hero,dia_xardas_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_xardas_getsuperbeliarweapon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_00");	//Temný bůh mi věnoval Mora Ulartu!
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_01");	//OPRAVDU?! To mě tedy velmi překvapuje! Někdy se mi zdá, že pro tebe není nic nemožné...
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_07");	//Nyní je v tvých rukou mocný artefakt, který ti uděluje moc Lovce duší.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_08");	//Lovce duší?
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_09");	//Ano! Myslím, že už chápeš, proč je Mora Ulartu božím darem.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_12");	//Je to schopnost démonů, kteří ji získali už od narození, nebo se ji naučili, ale jsou to ti nejnebezpečnější démoni, jaké můžeš potkat.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_13");	//Lidem je toto umění zapovězené, ale když se podívám na tebe, vidím, že jsou možné i výjimky.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_14");	//Ale k čemu mi ty duše budou?!
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_15");	//Zdá se mi, že si dosud neuvědomuješ, co je to za moc.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_16");	//Duše je nejcennější část živého tvora. Díky ní můžeme sesílat kouzla a dá se říci, že v některých případech kouzla sama vytváří...
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_17");	//Duše má také mnoho dalších vlastností, ale o nich toho moc nevím.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_19");	//Vlastně je neocenitelná - je to klíč k neomezené moci.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_20");	//Můžeš mi vysvětlit jak využít tyto znalosti?
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_21");	//To není moc složité. Použitím Mora Ulartu po smrti živého tvora můžeš zabránit duši, aby opustila tělo.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_22");	//Nicméně její sílu použít nemůžeš.
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_24");	//Lidé nejsou stejní jako démoni - jejich těla a duše jsou přizpůsobena tak, že oni tu moc využít mohou.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_25");	//A co s nimi teda budu dělat?
	AI_Output(self,other,"DIA_Xardas_GetSuperBeliarWeapon_01_26");	//Hmmm... Dobrá otázka. Pravděpodobně bys duše mohl obětovat Temnému bohu jako dar.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_29");	//No, je mi to jasné.
	KNOWSHOWDEALSOULS = TRUE;
	Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"S Mora Ulartu mi byla udělena moc Lovce duší. Můžu díky ní zajmout duši každého živého tvora, kterého usmrtím. Také můžu duše obětovat Beliarovi výměnou za menší náklonnost.");
};


instance DIA_XARDAS_GETSUPERSOUL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_getsupersoul_condition;
	information = dia_xardas_getsupersoul_info;
	permanent = FALSE;
	description = "Mám duši arcidémona Senyaka!";
};


func int dia_xardas_getsupersoul_condition()
{
	if((Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1) && (TELLCANSUPERBELIARWEAPON == FALSE) && (KNOWSHOWDEALSOULS == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_getsupersoul_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Xardas_GetSuperSoul_01_00");	//Mám duši arcidémona Senyaka!
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_01");	//Senyaka?! Hmmm... Ty jsi opravdu nemarnil čas, že?
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_02");	//Vidím, že s tím tvým pokladem si opravdu víš rady.
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_05");	//Duše arcidémona není stejná jako ostatní. Její magická síla je obrovská a v takovém stavu se nedá zrovna lehce ovládat.
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_06");	//Nicméně ji můžeš uvěznit do nějakého mocného magického artefaktu.
	AI_Output(other,self,"DIA_Xardas_GetSuperSoul_01_08");	//Co by to mělo být za předmět?
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_09");	//Hmmm... Pro začátek by měl mít magickou povahu a něco, do čeho by se dala uvěznit duše.
	AI_Output(other,self,"DIA_Xardas_GetSuperSoul_01_10");	//Co třeba Beliarův dráp?!
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_11");	//DRÁP! Ten by se pro tento účel mohl vážně hodit.
	AI_Output(other,self,"DIA_Xardas_GetSuperSoul_01_14");	//Dobrá, udělám to, ale jak mám duši démona uvěznit v Drápu?
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_15");	//Není nic jednodušího - postačí jakákoliv Beliarova svatyně.
	AI_Output(self,other,"DIA_Xardas_GetSuperSoul_01_17");	//Kromě toho, jestli jsi Beliarův oblíbenec, neodmítne tě.
	TELLCANSUPERBELIARWEAPON = TRUE;
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"Chci-li použít duši arcidémona Senyaka, musím ji umístit do nějakého artefaktu, který ji dokáže absorbovat. S Xardasem jsme se shodli, že nejlepší je Beliarův dráp. Rituál mohu provést u Beliarovy svatyně, ale měl bych být v jeho přízni.");
};


instance DIA_XARDAS_GOBLINBRINGSCROLL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_goblinbringscroll_condition;
	information = dia_xardas_goblinbringscroll_info;
	permanent = FALSE;
	description = "Potřebuji svitek zapuzení.";
};


func int dia_xardas_goblinbringscroll_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (XARDASGOBLINREADYAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_goblinbringscroll_info()
{
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_01_00");	//Potřebuji svitek zapuzení.
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_01_01");	//Nevíš, kde ho mohu získat?
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_01_02");	//To je velmi nebezpečné kouzlo a bez vysvětlení ti ho nedám.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_01_03");	//(vážně) Na co ho chceš?
	Info_ClearChoices(dia_xardas_goblinbringscroll);
	Info_AddChoice(dia_xardas_goblinbringscroll,"No tak, dej mi ho, nemůžu ti to říct!",dia_xardas_goblinbringscroll_ok);
	Info_AddChoice(dia_xardas_goblinbringscroll,"Je nezbytné pro naši společnou věc.",dia_xardas_goblinbringscroll_no_1);
	Info_AddChoice(dia_xardas_goblinbringscroll,"K zapuzení jednoho stvoření.",dia_xardas_goblinbringscroll_no_2);
	Info_AddChoice(dia_xardas_goblinbringscroll,"Pro mého přítele Muda...",dia_xardas_goblinbringscroll_no_3);
};

func void dia_xardas_goblinbringscroll_ok()
{
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_Ok_01_00");	//No tak, dej mi ho, nemůžu ti to říct!
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_Ok_01_01");	//V tom případě ti nepomůžu.
};

func void dia_xardas_goblinbringscroll_no_1()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_No_1_01_00");	//Je nezbytné pro naši společnou věc.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_1_01_01");	//Pche! Já vím, co je nezbytné pro naši věc.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_1_01_02");	//A nevidím důvod, proč by to mělo být toto kouzlo.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_1_01_03");	//Teď je nezbytné, abys šel pryč! A už mě více neruš, když mi to nechceš říct!
	B_LogEntry(TOPIC_GOBLINAWAY,"Xardas mi nedá svitek zapuzení.");
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblinbringscroll_no_2()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_No_2_01_00");	//K zapuzení jednoho stvoření.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_01");	//Jakého? O čem to mluvíš?
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_No_2_01_02");	//Jednoho goblina! Dokonce se mnou mluvil.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_03");	//Ano? Asi vím, o kom mluvíš...
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_04");	//Nejspíš jsi ho potkal v Hornickém údolí nedaleko mé staré věže.
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_No_2_01_05");	//Jak to víš?
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_06");	//Tím nebudeme ztrácet čas.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_07");	//Dobrá, dám ti to kouzlo, ale jen proto, že jsem to měl udělat už dávno.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_09");	//Trochu jsem na to zapomněl. Je to moje chyba, ale ty to napravíš.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_10");	//I když bych ho měl spíš potrestat, že ode mě utekl.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_11");	//Občas se stane, že vyvolané bytosti vždy neposlouchají svého pána.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_12");	//Tady máš ten svitek a pamatuj, že ho můžeš použít jen jednou a pouze v blízkosti vyvolaného stvoření.
	B_GiveInvItems(self,other,itwr_xardasgoblinscroll,1);
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_2_01_13");	//A teď jdi a dál mě nevyrušuj.
	B_LogEntry(TOPIC_GOBLINAWAY,"Xardas mi dal svitek zapuzení. Je čas vrátit se zpátky ke goblinovi.");
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblinbringscroll_no_3()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Xardas_GoblinBringScroll_No_3_01_01");	//Pro mého přítele Muda. Setkal jsem se s ním v kolonii.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_3_01_02");	//Nějak se mi zdá, že lžeš.
	AI_Output(self,other,"DIA_Xardas_GoblinBringScroll_No_3_01_08");	//Bude lepší když půjdeš a uděláš, co musíš. A nevyrušuj mě!
	B_LogEntry(TOPIC_GOBLINAWAY,"Xardas mi nedá svitek zapuzení.");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_CANBENECROM(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecrom_condition;
	information = dia_xardas_canbenecrom_info;
	permanent = FALSE;
	description = "Můžeš mě zasvětit do tajemství magie Temnoty?";
};


func int dia_xardas_canbenecrom_condition()
{
	if((TELLABOUTOTHERGUILD == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecrom_info()
{
	AI_Output(other,self,"DIA_Xardas_CanBeNecrom_01_00");	//Můžeš mě zasvětit do tajemství magie Temnoty?
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_01");	//Hmmm... Tvoje žádost mě trochu překvapuje.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_03");	//Abych řekl pravdu, tak jsem to od tebe nečekal.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_04");	//Jistě chápu tvou touhu ovládat magii...
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_05");	//... Ale jsou i jiné cesty, jak toho dosáhnout. Nemusíš se stát zrovna nekromantem a společníkem démonů.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_06");	//Hodně lidí to chce, ale je to velmi obtížné a nebezpečné.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_07");	//A navíc cesta temného mága je cestou úplné osamělosti. (ponuře)
	AI_Output(other,self,"DIA_Xardas_CanBeNecrom_01_08");	//To mě neděsí.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_10");	//Na ostrově jsou zástupci i jiných božstev. Například mágové Ohně či Vody.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_11");	//Nechtěl bys raději k nim?
	AI_Output(other,self,"DIA_Xardas_CanBeNecrom_01_14");	//Myslím, že temnota je mým domovem. Vidím v ní svůj osud.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_15");	//(zamyšleně) Hmmm...
	AI_Output(other,self,"DIA_Xardas_CanBeNecrom_01_17");	//Pomůžeš mi stát se nekromantem?
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_18");	//No dobrá! Nicméně nechci dělat ukvapená rozhodnutí.
	AI_Output(self,other,"DIA_Xardas_CanBeNecrom_01_21");	//Potřebuji nějaký čas na promyšlení.
	XARDASTIMERBENDM = Wld_GetDay();
	MIS_BECOMEKDM = LOG_Running;
	Log_CreateTopic(TOPIC_BECOMEKDM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_Running);
	B_LogEntry(TOPIC_BECOMEKDM,"Požádal jsem Xardase, jestli by mě nepřijal jako učně a netrénoval v magii nekromantů. Řekl mi, že se musí rozhodnout a za pár dní se mám zeptat.");
};


instance DIA_XARDAS_CANBENECROMOK(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecromok_condition;
	information = dia_xardas_canbenecromok_info;
	permanent = FALSE;
	description = "Už jsi přehodnotil mou žádost?";
};

func int dia_xardas_canbenecromok_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((XARDASTIMERBENDM <= (daynow - 2)) && (MIS_BECOMEKDM == LOG_Running) && (XARDAS_NDM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecromok_info()
{
	AI_Output(other,self,"DIA_Xardas_CanBeNecromOk_01_00");	//Už jsi přehodnotil mou žádost?
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_01_03");	//Myslím, že bych tě mohl přijmout za žáka magie Temnoty.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_01_04");	//Nicméně pochop, že své rozhodnutí nebudeš moci změnit.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_01_05");	//Proto by ses měl rozhodnout, jestli to opravdu tak chceš.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_01_06");	//Jsi připraven se zasvětit Temnému bohu a studii magie Temnoty?
	B_LogEntry(TOPIC_BECOMEKDM,"Xardas souhlasil s mým přijetím mezi nekromanty.");
	Info_ClearChoices(dia_xardas_canbenecromok);
	Info_AddChoice(dia_xardas_canbenecromok,"Ano.",dia_xardas_canbenecromok_yes);
	Info_AddChoice(dia_xardas_canbenecromok,"Ještě si to musím rozmyslet.",dia_xardas_canbenecromok_no);
};

func void dia_xardas_canbenecromok_yes()
{
	if(hero.level >= 10)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Xardas_CanBeNecromOk_Yes_01_00");	//Ano.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_01");	//Staniž se!
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_02");	//Z moci mé svěřené Beliarem tě přijímám do řad Temného kultu.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_03");	//Nechť ti temnota ukáže cestu ke své duši.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_04");	//To je vše! Nyní jsi součástí temnoty a tvůj život je s ní neoddělitelně spojen.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_05");	//Musíš však pochopit, že to z tebe ještě nedělá mága.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_06");	//Cvič se a uč se a jednou se možná staneš velkým temným mágem.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_07");	//Mezitím přijmi toto roucho, jako znamení, že nyní patříš do našeho kruhu.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_08");	//A ještě jedna věc. Protože jsi nyní můj žák, vezmi si tento prsten.
		B_GiveInvItems(self,other,ITRI_XARDASPLACE,1);
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_09");	//Umožní ti dostat se do mé věže rychleji, než si dokážeš představit.

		if(CanTeachTownMaster == FALSE)
		{
			CanTeachTownMaster = TRUE;
			MIS_PathFromDown = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		};

		other.guild = GIL_NDM;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("LEVELUP");
		B_GiveInvItems(self,other,itar_ndm_l,1);
		SLD_Aufnahme = LOG_OBSOLETE;
		KDF_Aufnahme = LOG_OBSOLETE;
		MIL_Aufnahme = LOG_OBSOLETE;
		MIS_PSICAMPJOIN = LOG_OBSOLETE;
		MIS_BECOMEKDW = LOG_OBSOLETE;

		Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);

		if(MIS_SLDRESPEKT == LOG_Running)
		{
			MIS_SLDRESPEKT = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
		};

		XARDAS_NDM = TRUE;
		B_LogEntry(TOPIC_BECOMEKDM,"Xardas ze mě udělal novice Temnoty.");
		Info_ClearChoices(dia_xardas_canbenecromok);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_No_Level_00_01");	//Ale nejprve musíš získat zkušenosti - nemám čas vysvětlovat ti základní věci.
		B_LogEntry(TOPIC_BECOMEKDM,"Pokud se chci stát žákem Xardase, potřebuji získat zkušenosti (potřebná úroveň hrdiny nejméně 10.");
	};
};

func void dia_xardas_canbenecromok_no()
{
	AI_Output(other,self,"DIA_Xardas_CanBeNecromOk_No_01_00");	//Ještě si to musím rozmyslet.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_No_01_01");	//Dobře! Nemusíš s odpovědí spěchat. Toto je vážné rozhodnutí.
	Info_ClearChoices(dia_xardas_canbenecromok);
};


instance DIA_XARDAS_CANBENECROMOKONCE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecromokonce_condition;
	information = dia_xardas_canbenecromokonce_info;
	permanent = TRUE;
	description = "Chci následovat cestu mágů Temnoty.";
};


func int dia_xardas_canbenecromokonce_condition()
{
	if(Npc_KnowsInfo(hero,dia_xardas_canbenecromok) && (MIS_BECOMEKDM == LOG_Running) && (XARDAS_NDM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecromokonce_info()
{
	AI_Output(other,self,"DIA_Xardas_CanBeNecromOkOnce_01_00");	//Chci následovat cestu mágů Temnoty.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_01_01");	//Jsi připraven věnovat svůj život Temnému bohu a studiu magie?
	Info_ClearChoices(dia_xardas_canbenecromokonce);
	Info_AddChoice(dia_xardas_canbenecromokonce,"Ano.",dia_xardas_canbenecromokonce_yes);
	Info_AddChoice(dia_xardas_canbenecromokonce,"Ještě si to musím rozmyslet.",dia_xardas_canbenecromokonce_no);
};

func void dia_xardas_canbenecromokonce_yes()
{
	if(hero.level >= 10)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_00");	//Ano.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_01");	//Staniž se!
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_02");	//Z moci mé svěřené Beliarem tě přijímám do řad Temného kultu.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_03");	//Nechť ti temnota ukáže cestu ke své duši.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_04");	//To je vše! Nyní jsi součástí temnoty a tvůj život je s ní neoddělitelně spojen.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_05");	//Musíš však pochopit, že to z tebe ještě nedělá mága.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_06");	//Cvič se a uč se a jednou se možná staneš velkým temným mágem.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_07");	//Mezitím přijmi toto roucho, jako znamení, že nyní patříš do našeho kruhu.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_08");	//A ještě jedna věc. Protože jsi nyní můj žák, vezmi si tento prsten.
		B_GiveInvItems(self,other,ITRI_XARDASPLACE,1);
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_09");	//Umožní ti dostat se do mé věže rychleji, než si dokážeš představit.

		if(CanTeachTownMaster == FALSE)
		{
			CanTeachTownMaster = TRUE;
			MIS_PathFromDown = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		};

		other.guild = GIL_NDM;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("LEVELUP");
		B_GiveInvItems(self,other,itar_ndm_l,1);
		SLD_Aufnahme = LOG_OBSOLETE;
		KDF_Aufnahme = LOG_OBSOLETE;
		MIL_Aufnahme = LOG_OBSOLETE;
		MIS_PSICAMPJOIN = LOG_OBSOLETE;
		MIS_BECOMEKDW = LOG_OBSOLETE;

		Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);

		XARDAS_NDM = TRUE;
		B_LogEntry(TOPIC_BECOMEKDM,"Xardas ze mě udělal novice Temnoty.");
		Info_ClearChoices(dia_xardas_canbenecromokonce);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_No_Level_00_01");	//Ale nejprve musíš získat zkušenosti - nemám čas vysvětlovat ti základní věci.
		B_LogEntry(TOPIC_BECOMEKDM,"Pokud se chci stát žákem Xardase, potřebuji získat zkušenosti (potřebná úroveň hrdiny nejméně 10.");
	};
};

func void dia_xardas_canbenecromokonce_no()
{
	AI_Output(other,self,"DIA_Xardas_CanBeNecromOkOnce_No_01_00");	//Ještě si to musím rozmyslet.
	AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_No_01_01");	//Dobře! Nemusíš s odpovědí spěchat. Toto je vážné rozhodnutí.
	Info_ClearChoices(dia_xardas_canbenecromokonce);
};


instance DIA_XARDAS_NDM_HOWKDM(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_howkdm_condition;
	information = dia_xardas_ndm_howkdm_info;
	permanent = FALSE;
	description = "Jak se mohu stát pravým nekromantem?";
};


func int dia_xardas_ndm_howkdm_condition()
{
	if((MIS_BECOMEKDM == LOG_Running) && (XARDAS_NDM == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_howkdm_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_HowKDM_01_00");	//Jak se mohu stát pravým nekromantem?
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_03");	//Cesta, kterou sis zvolil, není jen příležitostí nosit roucho novice nebo nekromanta.
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_04");	//Je to příležitost získat znalosti vedoucí k téměř neomezené síle!
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_07");	//Hodně závisí na tom, jak silný je tvůj duch a jak velká je tvá moudrost!
	AI_Output(other,self,"DIA_Xardas_NDM_HowKDM_01_08");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_09");	//Tyto znalosti mohou nepřipravené dohnat k šílenství, nebo jednoduše zabít!
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_10");	//A jak jistě chápeš, to se nesmí stát.
	AI_Output(other,self,"DIA_Xardas_NDM_HowKDM_01_11");	//To znamená, že ještě nejsem připravený?
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_12");	//Ano, tvůj duch je stále slabý a není připraven na takovou zátěž.
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_13");	//Aby ses stal skutečným mágem Temnoty, budeš se muset dlouho věnovat pečlivému tréninku, posilovat svého ducha i mysl.
	AI_Output(self,other,"DIA_Xardas_NDM_HowKDM_01_14");	//Teprve pak se můžeš stát nekromantem.
	B_LogEntry(TOPIC_BECOMEKDM,"Xardas mi řekl, že abych se mohl stát mágem Temnoty, musím jako novic zvyšovat svou magickou energii. Kdybych rituál podstoupil nedostatečně duševně silný, mohlo by mě to zabít a to nechce riskovat.");
};

var int XarOneTimeDM;

instance DIA_XARDAS_NDM_MANA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_mana_condition;
	information = dia_xardas_ndm_mana_info;
	permanent = TRUE;
	description = "Jsem již hoden stát se temným mágem?";
};

func int dia_xardas_ndm_mana_condition()
{
	if(Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && (MIS_BECOMEKDM == LOG_Running) && (XARDAS_AGREEDBEKDM == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_mana_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Mana_01_00");	//Jsem již hoden stát se temným mágem?
	AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_01");	//Možná. Teď se podívám do tvé duše a hned budeme znát odpověď.

	if((other.attribute[ATR_MANA_MAX] >= 75) && (ATR_INTELLECT >= 30))
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_03");	//Hmmm... (pečlivě se dívá)
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_04");	//ANO! Cítím v tobě obrovskou duchovní sílu. Tvá mysl je připravena na zkoušku Temnoty.
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_07");	//Teď tě mohu zasvětit do tajemství magie Temnoty a pozvednout tě na úroveň nekromanta.
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_08");	//Gratuluji, jsi přijat do kruhu vyvolených!
		B_LogEntry(TOPIC_BECOMEKDM,"Xardas věří, že teď jsem hoden stát se mágem Temnoty.");
		XARDAS_AGREEDBEKDM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_09");	//Hmmm... (pečlivě se dívá)
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_10");	//Ne, ještě nejsi připraven.
		AI_Output(self,other,"DIA_Xardas_NDM_Mana_01_11");	//Neplýtvej mým časem. Vrať se až bude tvá duševní síla větší.

		if(XarOneTimeDM == FALSE)
		{
			B_LogEntry(TOPIC_BECOMEKDM,"Podle Xardase mi stále něco chybí - mana nebo znalosti. Nebo možná je příliš brzy, abych pochopil magii Temnoty. (Požadavek: mana 75, inteligence 30)");
			XarOneTimeDM = TRUE;
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_Xardas_NDM_LastStand(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_NDM_LastStand_condition;
	information = DIA_Xardas_NDM_LastStand_info;
	permanent = FALSE;
	description = "Budeš mě teď učit magii Temnoty?";
};

func int DIA_Xardas_NDM_LastStand_condition()
{
	if(Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && (MIS_BECOMEKDM == LOG_Running) && (XARDAS_AGREEDBEKDM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_NDM_LastStand_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_LastStand_01_01");	//Budeš mě teď učit magii Temnoty?
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_02");	//Ano. Myslím, že jsi připraven na rituál zasvěcení.
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_03");	//Ale podle starého zvyku musí každý student nejprve podstoupit náročnou zkoušku. A ty nejsi výjimkou.
	AI_Output(other,self,"DIA_Xardas_NDM_LastStand_01_04");	//Co musím udělat?
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_05");	//Musíš zabít nevinného novice Ohně.
	AI_Output(other,self,"DIA_Xardas_NDM_LastStand_01_06");	//Co? A není jiná cesta?
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_07");	//Ne, není. Musíš poznat, po čí smrti Temný bůh nejvíce touží.
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_08");	//Beliar dává jeho záštitu a moc jen těm, kteří mu bezvýhradně oddali svou duši.
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_01_09");	//Udělej to, co jsem ti řekl, a získáš sílu karmínové temnoty Beliara!
	MIS_Xardas_LastStand_Done = LOG_Running;
	Log_CreateTopic(TOPIC_XARDAS_DEMON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_DEMON,LOG_Running);
	B_LogEntry(TOPIC_XARDAS_DEMON,"Xardas mě zasvětí do magie Temnoty teprve poté, co složím závěrečnou zkoušku. Abych získal požehnání Beliara, měl bych najít a zabít nevinného novice z kláštera Ohně. Podle Xardase neexistuje žádná jiná cesta.");
};


instance DIA_Xardas_NDM_LastStand_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_NDM_LastStand_Done_condition;
	information = DIA_Xardas_NDM_LastStand_Done_info;
	permanent = FALSE;
	description = "Zabil jsem novice mágů Ohně!";
};

func int DIA_Xardas_NDM_LastStand_Done_condition()
{
	if((MIS_Xardas_LastStand_Done == LOG_Running) && (OpolosIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_NDM_LastStand_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Xardas_NDM_LastStand_Done_01_01");	//Zabil jsem novice mágů Ohně!
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_Done_01_02");	//Dobře. Tím jsi dokázal, že jsi úplně a bezvýhradně na straně Beliara.
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_Done_01_03");	//Jsem si jistý, že Temný bůh je s tebou nesmírně spokojen!
	AI_Output(self,other,"DIA_Xardas_NDM_LastStand_Done_01_04");	//A teď, jak jsem slíbil, mohu tě kdykoliv vzít do kruhu nekromantů a mistrů démonologie.
	MIS_Xardas_LastStand_Done = LOG_SUCCESS;
	B_LogEntry(TOPIC_XARDAS_DEMON,"Prošel jsem závěrečnou zkouškou a teď se konečně mohu stát temným mágem.");
	Log_SetTopicStatus(TOPIC_XARDAS_DEMON,LOG_SUCCESS);
};

instance DIA_XARDAS_MAKEMEKDM(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_makemekdm_condition;
	information = dia_xardas_makemekdm_info;
	permanent = TRUE;
	description = "Vyučuj mě v magii Temnoty.";
};

func int dia_xardas_makemekdm_condition()
{
	if((MIS_BECOMEKDM == LOG_Running) && (XARDAS_AGREEDBEKDM == TRUE) && (other.guild == GIL_NDM) && (MIS_Xardas_LastStand_Done == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_xardas_makemekdm_info()
{
	hero.guild = GIL_KDM;
	CheckHeroGuild[0] = TRUE;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(other,self,"DIA_Xardas_MakeMeKDM_01_00");	//Vyučuj mě v magii Temnoty.
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_01");	//Dobře. Ukázal jsi, že jsi hoden této cti.
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_02");	//Od této chvíle jsi součástí Svatého kruhu mágů Temnoty, nekromantů a mistrů démonologie.
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_03");	//Tady. Vezmi si toto roucho jako uznání tvého postavení.
	CreateInvItems(self,itar_dmt_l,1);
	B_GiveInvItems(self,other,itar_dmt_l,1);
	MIS_BECOMEKDM = LOG_SUCCESS;
	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 30;
	Snd_Play("GUILD_INV");
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_SUCCESS);
	B_LogEntry(TOPIC_BECOMEKDM,"Získal jsem status mága Temnoty. Moje cesta je nyní neoddělitelně spojena s Temnotou.");
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_04");	//Jenom my, mágové Temnoty, máme tu čest, že můžeme disponovat silou všech nadpřirozených služebníků.
	CreateInvItems(self,ITMW_2H_KMR_BLACKSTAFF_01,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_BLACKSTAFF_01,1);
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_05");	//Nyní je tvůj osud neoddělitelně spojen s karmínovou temnotou Beliara. Pamatuj na to.
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_06");	//Čerpej z ní sílu jako bys pil mléko matky.
	AI_Output(self,other,"DIA_Xardas_MakeMeKDM_01_07");	//A nechť ona chrání tvou cestu!
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NDM_ABOUTDARKMAGIC(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_aboutdarkmagic_condition;
	information = dia_xardas_ndm_aboutdarkmagic_info;
	permanent = TRUE;
	description = "Řekni mi více o magii Temnoty.";
};


func int dia_xardas_ndm_aboutdarkmagic_condition()
{
	if((XARDAS_NDM == TRUE) && (XARDASMENTIONABOUTDEMONOLOG == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_aboutdarkmagic_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_00");	//Řekni mi více o magii Temnoty.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_04");	//Magie Beliara je nejsilnější destruktivní magie v tomto světě.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_05");	//Její síla ničení se nedá srovnávat s jinými.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_06");	//Její hlavní účel je zotročovat a ničit.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_10");	//Chápej, že ji může použít jen mág, který již nějaký čas slouží Temnotě.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_11");	//Začátečníka může snadno zabít. Magie Temnoty je zákeřná, stejně jako samotný Beliar.
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_13");	//To není všechno.
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_14");	//Co ještě?
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_15");	//Jsou tu i jisté výhody, které bys měl pochopit.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_17");	//Pouze runa Temnoty ti umožní vyvolat podstatu Temnoty - myslím tím nemrtvé.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_18");	//Nicméně jsou zde jisté potíže.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_20");	//Vyvolaná podstata tě někdy může jednoduše odmítnout.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_22");	//Můžeš být prostě příliš slabý.
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_23");	//A pak?
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_24");	//Pak tě zkusí zabít.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_28");	//Stvoření Temnoty jsou velmi silné a nebezpečné. Nemluvě o démonech.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_33");	//Zapamatuj si jednu velmi důležitou věc - klíč k úspěchu spočívá ve tvé moci.
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_34");	//Co to znamená?
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_35");	//To znamená, že čím jsi silnější, tím jednodušší bude podřídit ta stvoření své vůli.
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_36");	//A podle toho ti budou i déle sloužit.
		XARDASMENTIONABOUTDEMONOLOG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_38");	//Rozumím. Ještě něco?
		AI_Output(self,other,"DIA_Xardas_NDM_AboutDarkMagic_01_39");	//Ne, to je všechno. Zbytek poznáš, až se staneš temným mágem.
	};
};


instance DIA_XARDAS_NDM_ABOUTDEMONOLOG(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_aboutdemonolog_condition;
	information = dia_xardas_ndm_aboutdemonolog_info;
	permanent = TRUE;
	description = "Řekni mi více o démonech.";
};


func int dia_xardas_ndm_aboutdemonolog_condition()
{
	if((hero.guild == GIL_KDM) && (XARDASMENTIONABOUTDEMONOLOG == TRUE) && (XARDASTELLABOUTDEMONOLOG == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_aboutdemonolog_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_AboutDemonolog_01_00");	//Řekni mi více o démonech.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_01");	//Dobře. Démoni jsou zvláštní druh temných bytostí a nejstrašnějším výtvorem Beliara.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_04");	//Jsou to nejnebezpečnější příšery, které se nachází v našem světě, teda až na draky.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_08");	//Démoni jsou vysoce imunní vůči magii a je extrémně obtížné podřídit je své vůli.
	AI_Output(other,self,"DIA_Xardas_NDM_AboutDemonolog_01_09");	//Existuje způsob, jak to vyřešit?
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_10");	//Za tímto účelem si magie Temnoty vyvinula samostatné odvětví - démonologii.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_12");	//Jejím studiem získáš schopnost povolat tyto hrozné tvory do našeho světa.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_13");	//Kromě toho, znalost démonologie ti umožní naučit se vytvářet runy, které ti to usnadní.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_14");	//Ovšem její sílu můžeš použít pouze jednou. Poté síla runy vyprchá.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_17");	//Nakonec ti znalost démonologie umožní vyvolávat vyšší démony.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_18");	//Jsou řádově silnější než jejich normální protějšky, a poskytují v boji mnohem větší převahu.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_19");	//Podřídit je tvé vůli bude také mnohem obtížnější.
	AI_Output(other,self,"DIA_Xardas_NDM_AboutDemonolog_01_20");	//Můžeš mě naučit démonologii?
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_21");	//Můžu ti vysvětlit základní principy démonologie a naučit tě, jak vytvořit runy k vyvolávání těchto bytostí.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_22");	//Ačkoli, ovládnout tuhle moc dokážeš až když vstoupíš do čtvrtého kruhu magie.
	AI_Output(self,other,"DIA_Xardas_NDM_AboutDemonolog_01_23");	//Samozřejmě, abys pochopili všechny tyto znalosti, budeš potřebovat dostatečné zkušenosti.
	XARDASTELLABOUTDEMONOLOG = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Xardas mě může naučit umění démonologie, jehož znalosti mi dávají schopnost vyvolávat démony.");
};


instance DIA_XARDAS_NDM_TEACHDEMONOLOG(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 997;
	condition = dia_xardas_ndm_teachdemonolog_condition;
	information = dia_xardas_ndm_teachdemonolog_info;
	permanent = TRUE;
	description = "Nauč mě umění démonologie.";
};


func int dia_xardas_ndm_teachdemonolog_condition()
{
	if((hero.guild == GIL_KDM) && (XARDASTELLABOUTDEMONOLOG == TRUE) && ((XARDASTEACHCASTDEMON_SIMPLE == FALSE) || (XARDASTEACHCASTDEMON_LORD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_teachdemonolog_info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Nauč mě umění démonologie.
	AI_Output(self,other,"DIA_Xardas_NDM_TeachDemonolog_01_01");	//Pokud myslíš, že jsi na to připraven - naučím tě všechno, co znám.
	Info_ClearChoices(dia_xardas_ndm_teachdemonolog);
	Info_AddChoice(dia_xardas_ndm_teachdemonolog,Dialog_Back,dia_xardas_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_xardas_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Vyšší démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_xardas_ndm_teachdemonolog_high);
	};
};

func void dia_xardas_ndm_teachdemonolog_back()
{
	if(XARDASTEACHCASTDEMON_LORD == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_NDM_TeachDemonolog_BACK_01_00");	//Nyní je ve tvé moci vyvolávat ty nejvyšší démony.
		AI_Output(self,other,"DIA_Xardas_NDM_TeachDemonolog_BACK_01_01");	//Buď opatrný! Pamatuj, že podřídit si tyto bytosti je neuvěřitelně obtížné.
		AI_Output(self,other,"DIA_Xardas_NDM_TeachDemonolog_BACK_01_02");	//Jediná chyba znamená rychlou smrt.
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemonolog);
};

func void dia_xardas_ndm_teachdemonolog_simple()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		XARDASTEACHCASTDEMON_SIMPLE = TRUE;
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemonolog);
	Info_AddChoice(dia_xardas_ndm_teachdemonolog,Dialog_Back,dia_xardas_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_xardas_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Vyšší démonologie",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_xardas_ndm_teachdemonolog_high);
	};
};

func void dia_xardas_ndm_teachdemonolog_high()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		AI_Output(self,other,"DIA_Xardas_NDM_TeachDemonolog_High_01_00");	//Poznej sílu, kterou jsi získal, a bude ti odhalena pravá moc!
		XARDASTEACHCASTDEMON_LORD = TRUE;
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemonolog);
	Info_AddChoice(dia_xardas_ndm_teachdemonolog,Dialog_Back,dia_xardas_ndm_teachdemonolog_back);
};


instance DIA_XARDAS_NDM_PROOF(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_proof_condition;
	information = dia_xardas_ndm_proof_info;
	permanent = FALSE;
	description = "Jak jinak mohu prokázat, že jsem hoden být temným mágem?";
};


func int dia_xardas_ndm_proof_condition()
{
	if(Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && (MIS_BECOMEKDM == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_proof_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Proof_01_00");	//Jak jinak mohu prokázat, že jsem hoden být temným mágem?
	AI_Output(self,other,"DIA_Xardas_NDM_Proof_01_01");	//Pouze síla tvého ducha tě může udělat hodným této cti.
	AI_Output(self,other,"DIA_Xardas_NDM_Proof_01_02");	//Kromě toho nemám potřebu zjišťovat, co dokážeš.
	AI_Output(self,other,"DIA_Xardas_NDM_Proof_01_03");	//Už jsi to prokázal.
};


instance DIA_XARDAS_NDM_TASKS(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_condition;
	information = dia_xardas_ndm_tasks_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_xardas_ndm_tasks_condition()
{
	if((hero.guild == GIL_KDM) || (Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && (MIS_BECOMEKDM == LOG_Running)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_01");	//Hmmm... Jelikož jsi teď můj učedník, měl bych pro tebe pár opravdu jednoduchých úkolů.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_02");	//Musíš si však pamatovat, že nejdůležitější je hrozba z draků. To je náš hlavní úkol.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_03");	//Dobře, teď ohledně úkolu samotného...
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_04");	//Pro své experimenty potřebuji velké množství různých přísad, z nichž většinu jednoduše nekoupím na tržišti.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_05");	//Nemám tolik volného času, abych je hledal sám. Chci, abys mi přinesl tyhle přísady.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_06");	//Jakožto nekromant, se nejvíc zajímám o lidské pozůstatky - maso z mrtvol, kosti a lebky. Poslední jmenované je zvláště cenné.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_07");	//Ale pro mě nejdražší je srdce démona! Získat ho bude těžké.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_01_08");	//Pokud bys natrefil na cokoliv z toho, můžeš mi to směle přinést.
	XARDASTASKSBEGUN = TRUE;
	XARDASBUYBONES = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Xardas potřebuje přísady pro své experimenty. V podstatě má zájem o lidské pozůstatky - maso z mrtvol, kosti, lebky a srdce démonů.");
};


instance DIA_XARDAS_BUYBONES(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 600;
	condition = dia_xardas_buybones_condition;
	information = dia_xardas_buybones_info;
	permanent = TRUE;
	description = "Nesu pár lidských pozůstatků, jak jsi chtěl...";
};


func int dia_xardas_buybones_condition()
{
	if(XARDASBUYBONES == TRUE)
	{
		if((Npc_HasItems(hero,ItMi_Skull) > 0) || (Npc_HasItems(hero,ItMi_Plazma) > 0) || (Npc_HasItems(hero,ItAt_GoblinBone) > 0) || (Npc_HasItems(hero,ItAt_SkeletonBone) > 0) || (Npc_HasItems(hero,itmi_zombiecorpse) > 0) || (Npc_HasItems(hero,ItAt_DemonHeart) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_xardas_buybones_info()
{
	var int countexp;
	var int goldplus;
	AI_Output(other,self,"DIA_Xardas_BuyBones_01_00");	//Nesu pár lidských pozůstatků, jak jsi chtěl...
	AI_Output(self,other,"DIA_Xardas_BuyBones_01_01");	//Výborně! Tak se na ně podívejme.

	if(Npc_HasItems(other,ItAt_GoblinBone) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItAt_GoblinBone);
		B_GiveInvItems(other,self,ItAt_GoblinBone,Npc_HasItems(other,ItAt_GoblinBone));
		Npc_RemoveInvItems(self,ItAt_GoblinBone,Npc_HasItems(self,ItAt_GoblinBone));
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_02");	//Hmm... zdá se, že jsou to kosti goblina.
		AI_Output(other,self,"DIA_Xardas_BuyBones_01_03");	//Jsou pro tebe užitečné?
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_04");	//Určitě. I když to není přesně to, co jsem očekával.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 6);
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_08");	//Co jsi mi ještě přinesl?
	};
	if(Npc_HasItems(other,ItAt_SkeletonBone) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItAt_SkeletonBone);
		B_GiveInvItems(other,self,ItAt_SkeletonBone,Npc_HasItems(other,ItAt_SkeletonBone));
		Npc_RemoveInvItems(self,ItAt_SkeletonBone,Npc_HasItems(self,ItAt_SkeletonBone));
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_09");	//Takže... vypadá to, že to jsou kosti kostlivce. Docela dobré!
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_10");	//I když jsi jich mohl přinést trochu víc.
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_12");	//Dobře, myslím, že to prozatím stačí.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 8);
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_16");	//Něco jiného?
	};
	if(Npc_HasItems(other,itmi_zombiecorpse) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,itmi_zombiecorpse);
		B_GiveInvItems(other,self,itmi_zombiecorpse,Npc_HasItems(other,itmi_zombiecorpse));
		Npc_RemoveInvItems(self,itmi_zombiecorpse,Npc_HasItems(self,itmi_zombiecorpse));
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_33");	//Maso z mrtvoly - velice cenná přísada.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 15);
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_36");	//Co tady ještě máš?
	};
	if(Npc_HasItems(other,ItMi_Plazma) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItMi_Plazma);
		B_GiveInvItems(other,self,ItMi_Plazma,Npc_HasItems(other,ItMi_Plazma));
		Npc_RemoveInvItems(self,ItMi_Plazma,Npc_HasItems(self,ItMi_Plazma));
		AI_Output(other,self,"DIA_Xardas_HarmUndead_Done_01_01");	//Přinesl jsem ti ektoplazmu.
		AI_Output(self,other,"DIA_Xardas_HarmUndead_Done_01_02");	//Dobře, dobře... velmi dobře!
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 50);
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_08");	//Co jsi mi ještě přinesl?
	};
	if(Npc_HasItems(other,ItMi_Skull) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItMi_Skull);
		B_GiveInvItems(other,self,ItMi_Skull,Npc_HasItems(other,ItMi_Skull));
		Npc_RemoveInvItems(self,ItMi_Skull,Npc_HasItems(self,ItMi_Skull));
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_17");	//Hmmm... Vidím, že tvé hledání neproběhlo marně. Lebka je poměrně vzácná přísada.
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_19");	//Tvoje úsilí bude odměněno.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 250);
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_21");	//Co jiného máš?
	};
	if(Npc_HasItems(other,ItAt_DemonHeart) > 0)
	{
		AI_Wait(self,1);
		GOLDPLUSDEM = Npc_HasItems(other,ItAt_DemonHeart);
		B_GiveInvItems(other,self,ItAt_DemonHeart,Npc_HasItems(other,ItAt_DemonHeart));
		Npc_RemoveInvItems(self,ItAt_DemonHeart,Npc_HasItems(self,ItAt_DemonHeart));
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_22");	//Neuvěřitelné!
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_25");	//Srdce démona je to nejcennější, co jsi mi mohl donést.
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_26");	//To si zaslouží lepší odměnu než zlato!
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_27");	//Vyber si...
		Info_ClearChoices(dia_xardas_buybones);
		Info_AddChoice(dia_xardas_buybones,"Chci zvýšit manu.",dia_xardas_buybones_mana);
		Info_AddChoice(dia_xardas_buybones,"Chci zvýšit životní energii.",dia_xardas_buybones_life);
		Info_AddChoice(dia_xardas_buybones,"Spokojím se se zlatem.",dia_xardas_buybones_gold);
	}
	else
	{
		if(countexp > 0)
		{
			B_GivePlayerXP(countexp);
		};
		AI_Output(other,self,"DIA_Xardas_BuyBones_01_28");	//To je všechno.
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_29");	//Dobře. Vrať se, až zase něco najdeš. 
	};
};

func void dia_xardas_buybones_mana()
{
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,GOLDPLUSDEM * 2);
	AI_Output(other,self,"DIA_Xardas_BuyBones_Mana_01_00");	//Jak si přeješ.
	Info_ClearChoices(dia_xardas_buybones);
};

func void dia_xardas_buybones_life()
{
	B_RaiseAttribute_Bonus(other,ATR_HITPOINTS_MAX,GOLDPLUSDEM * 5);
	AI_Output(other,self,"DIA_Xardas_BuyBones_Life_01_00");	//Jak si přeješ.
	Info_ClearChoices(dia_xardas_buybones);
};

func void dia_xardas_buybones_gold()
{
	B_GiveInvItems(self,other,ItMi_Gold,GOLDPLUSDEM * 300);
	AI_Output(other,self,"DIA_Xardas_BuyBones_Gold_01_00");	//Jak si přeješ.
	Info_ClearChoices(dia_xardas_buybones);
};


instance DIA_XARDAS_NDM_TASKS_ONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_condition;
	information = dia_xardas_ndm_tasks_one_info;
	permanent = FALSE;
	description = "Nějaká práce pro mě není?";
};


func int dia_xardas_ndm_tasks_one_condition()
{
	if(XARDASTASKSBEGUN == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_00");	//Nějaká práce pro mě není?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_01");	//Určitě si pamatuješ, že jsem byl mág Ohně!
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_02");	//Jo, mluvil jsi o tom už v kolonii.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_03");	//V těch dnech, jako služebník Innose, jsem se zabýval výzkumem magie.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_04");	//Dosáhl jsem velkých úspěchů, ale neměl jsem čas ho dokončit.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_05");	//Když jsem pak zanechal řád, všechny záznamy spojené s těmito experimenty zůstaly v klášteře. Nyní toho velmi lituji.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_06");	//Proč sis je nevzal?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_07");	//Nevěděl jsem, že je teď budu potřebovat.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_08");	//Chci si tyto záznamy vzít zpět! Jdi do kláštera a vezmi je odtamtud.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_09");	//Dobře, zkusím to.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_10");	//Žádné zkusíš - prostě to uděláš... (vážně)
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_11");	//A kde přesněji bych je měl hledat?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_12");	//Některé dokumenty byly uloženy v klášterní knihovně. Nebude snadné se tam dostat - klíče od ní mají mágové Ohně.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_13");	//Ale jsem si jistý, že ty něco vymyslíš.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_14");	//Druhá část zapisu jistě zapadá prachem v mé staré komnatě. Klíč mám pořád u sebe - tady, vezmi si ho.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_15");	//Jsi si tím jistý?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_16");	//Myslím, že ano. Pyrokar a další mágové věřili, že tyto studie jsou jen ztráta času.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_17");	//Pro ně tyto dokumenty nikdy neměly zvláštní hodnotu. A je nepravděpodobné, že se od té doby něco změnilo.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_01_18");	//Dobře, jdi a přines mi ty papíry.
	Mob_CreateItems("BOOKSHELF_CONT_7",itwr_xardasdocs_2,1);
	Mob_CreateItems("BOOKSHELF_CONT_10",itwr_xardasdocs_1,1);
	MIS_XARDASNDMTASKSONE = LOG_Running;
	Log_CreateTopic(TOPIC_XARDASNDMTASKSONE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSONE,LOG_Running);
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Xardas mi řekl, abych získal staré rukopisy, které jsou uloženy v klášteře mágů Ohně. Zdá se, že některé z těchto dokumentů by měly být v knihovně a další v jeho staré komnatě.");
};


instance DIA_XARDAS_NDM_TASKS_ONE_DONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_done_condition;
	information = dia_xardas_ndm_tasks_one_done_info;
	permanent = FALSE;
	description = "Přinesl jsem tvoje rukopisy.";
};


func int dia_xardas_ndm_tasks_one_done_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (Npc_HasItems(hero,itwr_xardasdocs_1) >= 1) && (Npc_HasItems(hero,itwr_xardasdocs_2) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_done_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_00");	//Přinesl jsem tvoje rukopisy.
	b_giveinvitemsmanythings(other,self);
	Npc_RemoveInvItems(other,itwr_xardasdocs_1,1);
	Npc_RemoveInvItems(other,itwr_xardasdocs_2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_01");	//Ano, opravdu jsou to ony.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_02");	//Co s nimi teď budeš dělat?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_03");	//Něco hledám a tyto papíry mi s tím velmi pomohou.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_04");	//Co je v nich psáno?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_05");	//(zlostně) Jsi příliš zvědavý! A pak - nemyslím si, že bys byl schopen plně pochopit podstatu mého výzkumu.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_06");	//Zkus to.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_07");	//Ach ty chytráku! Hmm... No... Tyto rukopisy obsahují přibližnou formuli jednoho složitého magického kouzla, který jsem napsal před mnoha lety.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_08");	//A co je to za kouzlo?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_09");	//To kouzlo je podobné tomu, které jsme použili k přenosu energie magické rudy do Urizielu, než ses utkal se Spáčem.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_10");	//Aha! Začínám rozumět.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_11");	//Ano, ale tentokrát je to kouzlo poněkud odlišné. Umožní ti přenést veškerou magickou sílu jakéhokoliv tvora.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_12");	//Ale proč ho potřebuješ?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_13");	//(našvaně) Ale to se tě už netýká! A myslím, že máš příliš mnoho otázek!
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_14");	//Jsem jen zvědavý.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_15");	//Jistě! Ale teď by ses měl starat o něco jiného.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_16");	//A je to tu zas - ještě jsem nezapomněl na draky! (naštvaně)
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Done_01_17");	//Proč mě otravuješ svými nekonečnými otázkami? Radši jdi a hleď si svého.
	RUKOPISI1 = TRUE;
	XARDASTIMERBENDM = Wld_GetDay();
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Přinesl jsem Xardasovi jeho staré záznamy.");
};

instance DIA_XARDAS_NDM_TASKS_ONE_NEW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_new_condition;
	information = dia_xardas_ndm_tasks_one_new_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_xardas_ndm_tasks_one_new_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (RUKOPISI1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_new_info()
{
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_01");	//(rozzlobeně) Počkej!
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_02");	//Co se děje?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_03");	//Druhá část rukopisu, kterou jsi mi přinesl, ve skutečnosti není nic jiného než levný padělek! Je divné, že jsem si toho nevšiml hned.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_04");	//Jak je to možné?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_05");	//Nevím a nezajímá mě to. Jediná věc, která mě momentálně zajímá, je můj původní rukopis, který teď nemám.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_06");	//Jak ho teď najdeme?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_07");	//Hmmm... Jsem si jistý, že ho vzal některý z těch příliš zvědavých mágů Ohně!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_08");	//Pochybuji, že některý z těch pokrytců přizná, že má zájem o zakázané znalosti. Ale nezůstává nic jiného, než se jich zeptat.
	RUK3 = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Druhá část rukopisů se ukázala jako falešná. Teď musím najít originál. Xardas je přesvědčen, že o tom mohou vědět jen mágové Ohně.");
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NDM_TASKS_ONE_NEW1(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_new1_condition;
	information = dia_xardas_ndm_tasks_one_new1_info;
	permanent = FALSE;
	description = "Našel jsem původní rukopis.";
};

func int dia_xardas_ndm_tasks_one_new1_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (Npc_HasItems(hero,itwr_xardasdocs_3) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_new1_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_09");	//Našel jsem původní rukopis.
	B_GiveInvItems(other,self,itwr_xardasdocs_3,1);
	Npc_RemoveInvItems(self,itwr_xardasdocs_3,1);
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_10");	//A kde?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_11");	//Měl ho mág Ohně jménem Trevius. Bohužel je mrtvý.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_12");	//Zabil jsi ho?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_13");	//Jistěže ne! Našel jsem ho v jedné jeskyni a u jeho těla byl skutečný démon.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_14");	//Teď je mi vše jasné! (výsměšně) Tohle se stane, když strkáš svůj nos do tajemství jiných lidí!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_15");	//Už to není tak důležité. Rukopis se mi vrátil a můžu pokračovat ve svém výzkumu.
	B_GiveInvItems(self,hero,ItMi_Gold,1000);
	MIS_XARDASNDMTASKSONE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSONE,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Přinesl jsem Xardasovi původní část rukopisu.");
};

instance DIA_XARDAS_NDM_TASKS_ONE_TWO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_two_condition;
	information = dia_xardas_ndm_tasks_one_two_info;
	permanent = TRUE;
	description = "Máš pro mě nějaké další úkoly?";
};

func int dia_xardas_ndm_tasks_one_two_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_SUCCESS) && (MIS_XARDASNDMTASKSTWO == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_two_info()
{
	var int daynow;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_00");	//Máš pro mě nějaké další úkoly?

	if((XARDASTIMERBENDM <= (daynow - 1)) && !Npc_IsDead(vlk_6027_taliasan))
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_01");	//Ano, právě včas! Druhý den jsem se podíval na záznamy, které jsi mi přinesl z kláštera.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_02");	//Samozřejmě mi to pomohlo ve mém výzkumu, ale zároveň vyšlo na povrch ještě více otázek, na které neznám odpověď.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_03");	//Myslím, že abych je vyřešil, ale budu potřebovat ještě jednu věc. Nebo víc. Avšak nevím přesně, kde začít.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_04");	//S čím?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_05");	//Mám zájem o poměrně vzácnou knihu, známou jako 'Marná cesta'.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_06");	//Pokud si správně pamatuji, vlastnil ji jeden mág, jehož jméno jsem už zapomněl.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_07");	//Nicméně vím, že mi ten poklad jen tak nedá. Už jednou jsem ji chtěl získat, ale neprodal ji.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_08");	//Kde bych ho měl hledat?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_09");	//Kdybych to věděl, nepožádal bych tě o pomoc.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_10");	//Poslal bych jednoho z mých magických služebníků...
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_11");	//To je ti podobné. Je ještě něco, co o něm víš?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_12");	//Jediné co vím je, že než jsem ho poznal, sloužil jako městský mág v Khorinisu.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_13");	//Dobrá. Pokusím se ho najít a získat tu knihu.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_14");	//Ano, zkus. Nakonec nejsem tak zklamán, že jsem tě přijal za učně.
		MIS_XARDASNDMTASKSTWO = LOG_Running;
		Log_CreateTopic(TOPIC_XARDASNDMTASKSTWO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_Running);
		if(TALIASANTELLWHOMAGE == TRUE)
		{
			B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Nyní chce Xardas, abych mu získal knihu jménem 'Marná cesta'... Dle toho co říkal, poslední vlastník žije v Khorinise a byl městským mágem. Nemohl by to být Gallahad?");
		}
		else
		{
			B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Nyní chce Xardas, abych mu získal knihu jménem 'Marná cesta'. Poslední vlastník prý žije v Khorinise a byl městským mágem. Měl bych se ho pokusit najít.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_Two_01_28");	//Zatím ne. Možná později.
	};
};


instance DIA_XARDAS_NDM_TASKS_ONE_TWODONEKILL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_twodonekill_condition;
	information = dia_xardas_ndm_tasks_one_twodonekill_info;
	permanent = FALSE;
	description = "Našel jsem toho mága.";
};


func int dia_xardas_ndm_tasks_one_twodonekill_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && !Npc_IsDead(vlk_6027_taliasan) && (XARDASBRIGBOOKSPECIAL == FALSE) && ((XARDASMISSBOOKFOREVER == TRUE) || (XARDASMISSBOOK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_twodonekill_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_01");	//Našel jsem toho mága. Byl to Gallahad.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_02");	//Ach ano. Už si vzpomínám. Kde je teď?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_03");	//Žije ve městě.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_04");	//A přinesl jsi tu knihu?
	TELLABOUTGALLAHAD = TRUE;
	if(XARDASMISSBOOKFOREVER == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_05");	//Ne.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_06");	//Jakto že ne? (vážně)
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_07");	//Gallahad řekl, že ji před dlouhou dobou prodal nějakému obchodníkovi.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_08");	//Cože?! A ty jsi mu to věřil?!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_09");	//Nó...
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_10");	//Blázne! On tě oklamal! Pouze hlupák prodá své znalosti za peníze!
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_11");	//Gallahad je mág, i když zbytečný! Pro každého z nás jsou tajemství magie důležitější než matný třpyt opovržlivého kovu. Nikdy by to neudělal!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_12");	//Co mám teď dělat?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_13");	//Ty? Nic... Pošlu k tomu červovi pár mých démonů. Myslím, že ho mohou přesvědčit, aby mi tu knihu dal.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_14");	//Zatím můžeš dělat více naléhavé věci. Ale buď připraven, tvé služby stále potřebuji.
		MIS_XARDASNDMTASKSTWO = LOG_FAILED;
		XARDASTIMERQUEST = Wld_GetDay();
		B_LogEntry_Failed(TOPIC_XARDASNDMTASKSTWO);
		B_KillNpc(vlk_6027_taliasan);
	}
	else if(XARDASMISSBOOK == TRUE)
	{
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_15");	//Gallahad ji sice má, ale nechtěl mi ji dát.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_16");	//Hůře pro něj! Uvidíme, co řekne, když k němu pošlu pár démonů.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_17");	//Myslím, že ho mohou přesvědčit, aby mi tu knihu dal.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_18");	//Není to trochu drastické opatření?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_19");	//Chceš mě poučovat?! (naštvaně)
		Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
		Info_AddChoice(dia_xardas_ndm_tasks_one_twodonekill,"Vůbec ne! Dělej jak myslíš.",dia_xardas_ndm_tasks_one_twodonekill_killgalah);
		Info_AddChoice(dia_xardas_ndm_tasks_one_twodonekill,"Jen si myslím, že to můžu vyřešit sám.",dia_xardas_ndm_tasks_one_twodonekill_dontworry);
	};
};

func void dia_xardas_ndm_tasks_one_twodonekill_killgalah()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_01");	//Vůbec ne! Dělej jak myslíš.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_02");	//(zlomyslně) Ještě že tak.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_03");	//Zatím můžeš dělat více naléhavé věci. Ale buď připraven, tvé služby stále potřebuji.
	B_KillNpc(vlk_6027_taliasan);
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Xardas se tím chce zabývat sám - přesněji řečeno pošle démony, aby mu ji přinesly. Zdá se, že s Gallahadem je konec.");
	Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
};

func void dia_xardas_ndm_tasks_one_twodonekill_dontworry()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_01");	//Jen si myslím, že to můžu vyřešit sám.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_02");	//Jsi si tím jistý?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_03");	//Samozřejmě. Nemyslím si, že si Gallahad zaslouží takový osud.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_04");	//Dobře. Ale když ji nepřineseš, pošlu tam démony.
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Řekl jsem Xardasovi o mém rozhovoru s Gallahadem. Xardas chtěl na Gallahada poslat démony, ale řekl jsem mu, že to zařídím sám. Musím přinést tu knihu.");
	Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
};


instance DIA_XARDAS_NDM_TASKS_TWO_DONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_two_done_condition;
	information = dia_xardas_ndm_tasks_two_done_info;
	permanent = FALSE;
	description = "Mám tu knihu.";
};


func int dia_xardas_ndm_tasks_two_done_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (Npc_HasItems(hero,itwr_umsonst_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_two_done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_Done_01_01");	//Mám tu knihu.
	B_GiveInvItems(other,self,itwr_umsonst_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_Done_01_02");	//(rozčileně) Myslel jsem si to - několik stránek chybí!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_Done_01_03");	//Ale není to tvá vina. Měl jsem to čekat.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_Done_01_04");	//A co dál?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_Done_01_05");	//Hmmm... Doufám, že mi to nezabrání v mém experimentu. 
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_Done_01_06");	//Potřebuji nastudovat vše, co je tu napsáno. Můžeš jít po svém.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_Done_01_07");	//Ale buď připraven, tvé služby stále potřebuji.
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Přinesl jsem Xardasovi tu knihu. Některé stránky chybí, ale zatím mu to nevadí.");
};


instance DIA_XARDAS_NDM_TASKS_TWO_DONEDEAD(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_two_donedead_condition;
	information = dia_xardas_ndm_tasks_two_donedead_info;
	permanent = FALSE;
	description = "Ten mág je mrtev!";
};


func int dia_xardas_ndm_tasks_two_donedead_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (TALIASANISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_two_donedead_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_01");	//Ten mág je mrtev!
	if(TELLABOUTGALLAHAD == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_02");	//Myslíš Gallahada?!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_03");	//Ano, někdo ho zabil!
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_04");	//Který mág?
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_05");	//Ten mág, který měl knihu - Gallahad.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_06");	//Žil v přístavní oblasti Khorinisu. Zdá se, že někdo toho chudáka zabil.
	};
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_07");	//Dobře. A kniha?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_08");	//Tu u sebe neměl.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_09");	//Hmmm... Jsi si jistý?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_10");	//Absolutně!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_11");	//Hmmm, asi ji má dobře schovanou.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_12");	//Pošlu nějaké sluhy, aby ji našli.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_13");	//Můžeš jít. Ale buď připraven, tvé služby stále potřebuji.
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDASNDMTASKSTWO,"Přinesl jsem Xardasovi novinky o Gallahadově smrti a o tom, že kniha tam nebyla. Gallahad ji má asi dobře schovanou, takže se Xardas rozhodl poslat své sluhy, aby ji našli.");
};

instance DIA_XARDAS_NDM_TASKS_FOUR(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_four_condition;
	information = dia_xardas_ndm_tasks_four_info;
	permanent = FALSE;
	description = "Potřebuješ mou pomoc?";
};


func int dia_xardas_ndm_tasks_four_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((MIS_XARDASNDMTASKSTWO == LOG_SUCCESS) && (XARDASTIMERQUEST <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_four_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_00");	//Potřebuješ mou pomoc?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_01");	//(ponuře) Ano. Poslouchej pozorně. Bude to mnohem složitější, než to, co jsi dělal dříve.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_02");	//Takže... Druhý den jsem se znovu podíval na ty záznamy, které jsi mi přinesl z kláštera.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_03");	//A po mnoha myšlenkách jsem dospěl k závěru, že k dokončení výzkumu budu potřebovat ještě jednu věc.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_04");	//Jakou?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_05");	//Je to věc po které touží snad každý nekromant - Nekronomikon.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_06");	//Slyšel jsi někdy o tomto artefaktu?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_07");	//Upřímně řečeno - ne.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_08");	//Myslel jsem si to. Málokdo ví o jeho existenci. Tak lépe pro mě.!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_09");	//Také o tomto artefaktu moc nevím. Ale mé znalosti postačí k tomu, abych tento poklad získal.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_10");	//Víš, kde ho hledat?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_11");	//To jsem neřekl. Ale znám někoho, kdo nám s tím pomůže.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_12");	//Jeho jméno je Nergal. Byl jedním z nejmocnějších nekromantů svého času a posledním pánem Nekronomikonu.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_13");	//Bohužel, duše Nergala se už dávno dostala do světa stínů. Zjistit, v čích rukách je Nekronomikon teď, nebude tak snadné.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_14");	//Co plánuješ dělat?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_15");	//Znalosti temných run nektormantů mi pomůžou přivést Nergalova ducha do tohoto světa, ale budu potřebovat tvou pomoc.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_16");	//Co mám dělat?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_17");	//(vážně) Někde ve východní části tohoto údolí je stará věž toho nekromanta. Tam někde vede tvá cesta.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_18");	//Nevím, co přesně tam na tebe čeká, ale myslím, že všechno pochopíš, až se tam dostaneš.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_19");	//No, to by neměl být problém.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Four_01_20");	//Možná. (sarkasticky) Ale pokud vím, vstup do této věže je uzavřen. Budeš muset zjistit, jak se tam dostat.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_21");	//No jasně, ani nevím co jsem čekal.
	MIS_XARDASTASKSFOUR = LOG_Running;
	Log_CreateTopic(TOPIC_XARDASTASKSFOUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDASTASKSFOUR,LOG_Running);
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Xardas mi dal úkol: získat nejstarší svazek o umění magie Temnoty - Nekronomikon. Kdysi ho vlastnil mocný nekromant Nergal a zřejmě je jediný, kdo ví, kde je tento artefakt nyní.");
	Log_AddEntry(TOPIC_XARDASTASKSFOUR,"Nejprve musím jít do staré Nergalovy věže. Co tam na mě čeká, zjistím až na místě. Problém je však v tom, že vstup do věže je uzavřen a není možné se tam dostat. Kdo by mi s tím mohl pomoci?");
};


instance DIA_XARDAS_NDM_TASKS_FOURPROGRESS(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourprogress_condition;
	information = dia_xardas_ndm_tasks_fourprogress_info;
	permanent = FALSE;
	description = "Navštívil jsem Nergalovu věž.";
};


func int dia_xardas_ndm_tasks_fourprogress_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (Npc_HasItems(hero,itmi_nergalcorpse) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourprogress_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgress_01_00");	//Navštívil jsem Nergalovu věž.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_01");	//(obdivně) Uspěl jsi? No vidíš, já věděl proč jsem ti to svěřil.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_02");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgress_01_03");	//Nic zajímavého. Ale něco jsem přecejen našel.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_04");	//A co je to?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgress_01_05");	//Myslím, že bude lepší, když se na to podíváš sám.
	B_GiveInvItems(other,self,itmi_nergalcorpse,1);
	Npc_RemoveInvItems(self,itmi_nergalcorpse,1);
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_06");	//Výborně! To je přesně to, co jsem potřeboval.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_07");	//Teď už mi nic nebrání, abych přivedl Nergalovu duši do tohoto světa. Konečně se dozvím tajemství Nekronomikonu!
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgress_01_08");	//Co mám dělat já?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_09");	//Zatím nic. Můžeš si dělat co chceš.
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Donesl jsem Xardasovi mrtvé tělo kdysi mocného nekromanta. Teď může provést rituál vyvolání duše Nergala, aby se dozvěděl tajemství Nekronomikonu.");
	RITUALNERGALTIMER = Wld_GetDay();
};


instance DIA_XARDAS_NDM_TASKS_FOURPROGRESSTWO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourprogresstwo_condition;
	information = dia_xardas_ndm_tasks_fourprogresstwo_info;
	permanent = FALSE;
	description = "Kdy budeš moct provést ten rituál?";
};


func int dia_xardas_ndm_tasks_fourprogresstwo_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALTIMER > (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourprogresstwo_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_00");	//Kdy budeš moct provést ten rituál?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_01");	//(přemýšlí) Zatím nemohu říct přesně. Vyvolání duše je sama o sobě nesmírně obtížná záležitost.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_02");	//A pokud se jedná o tak mocného mága jako Nergal, pak je to smrtelně nebezpečné.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_03");	//Uspěchání je nesmírně nežádoucí. Je třeba přemyslet každou drobnost, jakýkoliv omyl by nás mohl stát život.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_04");	//Mimochodem... (upřímně) Proč se na to ptáš?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_05");	//Rád bych se toho rituálu zúčastnil. Nebude ti to vadit?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_06");	//Hmmm... Pro tento rituál opravdu potřebuji pár pomocníků.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_07");	//Takže ne - nevadí.
	RITUALNERGALPREPARE = TRUE;
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Xardas souhlasil s mou účastí při rituálu vyvolání duše nekromanta Nergala.");
};


instance DIA_XARDAS_NDM_TASKS_FOURRITUALREADY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourritualready_condition;
	information = dia_xardas_ndm_tasks_fourritualready_info;
	permanent = TRUE;
	description = "Je vše připraveno pro rituál?";
};


func int dia_xardas_ndm_tasks_fourritualready_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALPREPARE == TRUE) && (RITUALNERGALREADY == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourritualready_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_00");	//Je vše připraveno pro rituál?
	if(RITUALNERGALTIMER <= (daynow - 2))
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_01");	//Ano, vše je připraveno. Můžeme začít.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_02");	//Co mám dělat?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_03");	//Pozorně poslouchej. Jak sis už určitě všiml, vedle tebe na podlaze je magický pentagram.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_04");	//Postavíš se na cíp hvězdy, který bude po mé levici a nehneš se z toho místa, dokud neřeknu.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_05");	//Jinými slovy, nepřekračuj samotný pentagram. To je velmi důležité!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_06");	//Proč?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_07");	//Během rituálu všichni, kteří se na něm podílejí, tvoří určitou magickou bariéru.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_08");	//Když se Nergalova duše dostane do tohoto světa, tato bariéra nás ochrání před jeho šílenstvím.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_09");	//Takže se to pokus brát vážně.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_10");	//Vše jsem pochopil.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_11");	//Neztrácejme tedy čas - začneme rituál.
		B_LogEntry(TOPIC_XARDASTASKSFOUR,"Všechno je připraveno, aby Xardas provedl rituál.");
		Info_ClearChoices(dia_xardas_ndm_tasks_fourritualready);
		Info_AddChoice(dia_xardas_ndm_tasks_fourritualready,"Jsem připraven.",dia_xardas_ndm_tasks_fourritualready_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_12");	//(křičí) Zatím ne! Vraťte se později!
	};
};

func void dia_xardas_ndm_tasks_fourritualready_ok()
{
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_Ok_01_01");	//Jsem připraven.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourRitualReady_Ok_01_02");	//Výborně. Pamatuj si, co jsem ti řekl, a všechno bude v pořádku.
	RITUALNERGALREADY = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitForPlayerRitual");
	PC_Psionic.aivar[AIV_EnemyOverride] = TRUE;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Nergal");
	};
};


instance DIA_XARDAS_RITUALPREPAREHURRY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualpreparehurry_condition;
	information = dia_xardas_ritualpreparehurry_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_xardas_ritualpreparehurry_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALREADY == TRUE) && (XARDASFINISHRITUALBEGAN == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(hero,"NW_XARDAS_RITUAL_04") >= 150))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualpreparehurry_info()
{
	AI_Output(self,other,"DIA_Xardas_RitualPrepareHurry_01_01");	//(neomaleně) Na co čekáš? Postav se na konec pentagramu, který je po mé levici a začneme rituál.
	AI_Output(other,self,"DIA_Xardas_RitualPrepareHurry_01_02");	//Už jdu.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_RITUALPREPARE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualprepare_condition;
	information = dia_xardas_ritualprepare_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualprepare_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALREADY == TRUE) && (Npc_GetDistToWP(hero,"NW_XARDAS_RITUAL_04") < 100) && (Npc_GetDistToWP(self,"NW_XARDAS_RITUAL_00") < 100))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualprepare_info()
{
	AI_Output(self,other,"DIA_Xardas_RitualPrepare_01_01");	//Tak začneme. A pamatuj - nepřekračuj pentagram!
	AI_Output(other,self,"DIA_Xardas_RitualPrepare_01_02");	//Rozumím. Začněme už.
	AI_Output(self,other,"DIA_Xardas_RitualPrepare_01_03");	//Dobře.
	AI_StopProcessInfos(self);
	XARDASFINISHRITUALBEGAN = TRUE;
	Npc_ExchangeRoutine(self,"XardasRitual");
	self.name[0] = "";
};


instance DIA_XARDAS_RITUALDONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualdone_condition;
	information = dia_xardas_ritualdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualdone_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASFINISHRITUALOK == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualdone_info()
{
	self.name[0] = "Xardas";
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_01");	//(mocně) Je po všem - rituál je u konce!
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_02");	//Co ses dozvěděl?
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_03");	//Dostatečne na to abych už dostal Nekronomikon do svých rukou.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_04");	//Hmmm. Tento nekromant byl silnější, než jsem si myslel. Bylo obtížné, dostat z něj pravdu.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_05");	//Ale teď je už po všem. Zůstává jen si pro Nekronomikon dojít.
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_06");	//A kde nachází?
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_07");	//Velmi blízko. Na západním pobřeží ostrova stojí temná pevnost Acheronu.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_08");	//Jedná se o obrovskou černou věž s vysokými špičatými hroty. Možná jsi ji už někdy zahlédl.
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_09");	//Něco mi to připomíná...
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_10");	//Tak tam, na samém vrcholu tohoto monolitu Nergal ukryl Nekronomikon.
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_11");	//Ty jsi o tom nevěděl?
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_12");	//Tušil jsem to, ale nemohl jsem to prověřit. Vstup do věže byl střežen nesmrtelným stvořením, které splodila samotná Temnota.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_13");	//Tehdy jsem nevěděl jak se s ním vypořádat. Ale teď, po setkání s Nergalem, se všechno změnilo.
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_14");	//Pak by ses tam měl vrátit.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_15");	//(panovačně) Ne já, ale ty! Jsem teď příliš zaneprázdněn jinými naléhavými záležitostmi.
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_16");	//Dobře, dobře. A jak mohu porazit toto nesmrtelné stvoření?
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_17");	//Je to velmi jednoduché. Jeho slabostí je jeho protiklad!
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_18");	//Protože toto stvoření splodila magie Temnoty, zničit ho dokáže magické světlo!
	AI_Output(other,self,"DIA_Xardas_RitualDone_01_19");	//Ano, opravdu jednoduché.
	AI_Output(self,other,"DIA_Xardas_RitualDone_01_20");	//Tak dělej. Jdi a přines mi Nekronomikon!
	XARDASTELLMEOSTA = TRUE;
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Rituál vyvolání nekromanta Nergala skončil a teď víme, kde hledat Nekronomikon. Nachází se na vrcholu tmavé věže na západním pobřeží ostrova. Vstup do věže je střežen nesmrtelnou bytostí, kterou stvořila samotná Temnota. Vypořádat se s ní však není těžké - toto stvoření může zabít magické světlo.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
	PC_Psionic.aivar[AIV_EnemyOverride] = FALSE;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Xardas");	
	};
};


instance DIA_XARDAS_RITUALFAIL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualfail_condition;
	information = dia_xardas_ritualfail_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualfail_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASRITUALFAIL == TRUE) && (NERGALISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualfail_info()
{
	self.name[0] = "Xardas";
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_01");	//(rozzlobeně) Blázne! Co jsi to udělal?!
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_02");	//Řekl jsem ti, ať se neopovažuješ vstoupit do pentagramu!
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_03");	//Nyní, kvůli tvé hlouposti, nikdy nebudeme znát tajemství Nekronomikonu!
	AI_Output(other,self,"DIA_Xardas_RitualFail_01_04");	//Neboj se! Vím, kde ho najdeme.
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_05");	//Cože? Co to plácáš?
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_06");	//Duše Nergala je mrtvá! Jen on nám o tom mohl říct...
	AI_Output(other,self,"DIA_Xardas_RitualFail_01_08");	//Než se mě pokousil zabít, Nergal mi to tajemství prozradil a řekl mi, jak dostat artefakt, který tě tolik zajímá.
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_09");	//Ale to přece není možné! Proč by to Nergal udělal?
	AI_Output(other,self,"DIA_Xardas_RitualFail_01_10");	//Nemám tušení. Je to teď tak důležité?
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_11");	//Hmmm... No, pokud skutečně víš, jak získat Nekronomikon - tak jdi a přines mi ho!
	AI_Output(self,other,"DIA_Xardas_RitualFail_01_12");	//Pro tvé dobro doufám, že nelžeš. Nesnáším být za hlupáka!
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Xardas nevěřil, že se mi podařilo získat od Nergala tajemství Nekronomikonu. Měl bych mu přinést ten artefakt, abych ho přesvědčil o opaku.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
	PC_Psionic.aivar[AIV_EnemyOverride] = FALSE;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Xardas");	
	};
};


instance DIA_XARDAS_NDM_TASKS_FOURDONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_tasks_fourdone_condition;
	information = dia_xardas_ndm_tasks_fourdone_info;
	permanent = FALSE;
	description = "Mám Nekronomikon!";
};


func int dia_xardas_ndm_tasks_fourdone_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (Npc_HasItems(hero,itwr_necronomicon) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourdone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_01");	//Mám Nekronomikon!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_04");	//Velmi dobře! Dej mi ho, ať se na ten poklad podívám! Už hořím netrpělivostí, abych ho osobně viděl.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_06");	//Tady.
	B_GiveInvItems(other,self,itwr_necronomicon,1);
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_07");	//Konečně! Ta kniha je v mých rukou! Nevíš, co to pro mě znamená.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_08");	//A co?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_09");	//Každý temný mág sní o tomhle pokladu, a teď jsem jeho pánem JÁ!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_10");	//Není divu, že Nergal byl v jeho životě tak silným nekromantem. To vše díky Nekronomikonu!
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_11");	//Dokonce ani po smrti jeho majitel neztratil moc.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_12");	//Rozumím. A co teď?
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_13");	//Nic. (smích) Čekal jsi snad nějaké představení o schopnostech tohoto artefaktu?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_14");	//Ne, jen jsem se zeptal.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_15");	//Zapamatuj si! Nekronomikon neobdaruje svého držitele mocí, nese pouze moudrost a znalosti, které jsou klíčem k tomu, abys tu moc získal.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_16");	//Mimochodem, chtěl bych se tě zeptat - už ses ji pokusil přečíst?
	if(((NECRONOMICONBONUS == TRUE) && (NECRONOMICONBONUSTRY == TRUE)) || ((NECRONOMICONBONUS == TRUE) && (NECRONOMICONBONUSTRY == FALSE)))
	{
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_17");	//Ano, četl jsem ji.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_18");	//Pak jsi to už musel pochopit. A určitě tato zkušenost pro tebe nebyla zbytečná.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_19");	//Máš pravdu.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_20");	//(tajemně) Nepochybuji o tom. Ale dobře, dost už o tom. Máme důležitější věci na práci.
	}
	else if((NECRONOMICONBONUS == FALSE) && (NECRONOMICONBONUSTRY == TRUE))
	{
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_22");	//Snažil jsem se, ale neuspěl jsem. Kniha nechtěla odhalit své tajemství.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_23");	//(podivně) To je pochopitelné. Koneckonců je podřízená pouze vůli mágů Temnoty a ty nejsi jedním z nich. Ale teď už na tom nezáleží.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_24");	//Dost už o tom. Máme důležitější věci na práci.
	}
	else if((NECRONOMICONBONUS == FALSE) && (NECRONOMICONBONUSTRY == FALSE))
	{
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_26");	//Ne, nezkoušel. Měl jsem?
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_27");	//(překvapeně) Nezkoušel? Trochu jsi mě překvapil.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_28");	//Držet takový poklad ve svých rukou a nepokusit se poznat jeho tajemství? Nerozumím tomu.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_29");	//Prostě jsem to zatím nezkusil.
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourDone_01_30");	//No, je to tvoje věc. Ale dost už o tom. Máme důležitější věci na práci.
	};
	MIS_XARDASTASKSFOUR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDASTASKSFOUR,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Přinesl jsem Xardasovi Nekronomikon.");
};


instance DIA_XARDAS_BRINGNECRONOMICONNOQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_bringnecronomiconnoquest_condition;
	information = dia_xardas_bringnecronomiconnoquest_info;
	permanent = FALSE;
	description = "Mám pro tebe jednu velmi zajímavou věc.";
};


func int dia_xardas_bringnecronomiconnoquest_condition()
{
	if((MIS_XARDASTASKSFOUR == FALSE) && (Npc_HasItems(hero,itwr_necronomicon) >= 1) && (hero.guild != GIL_KDM) && (hero.guild != GIL_NDM))
	{
		return TRUE;
	};
};

func void dia_xardas_bringnecronomiconnoquest_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_00");	//Mám pro tebe jednu velmi zajímavou věc.
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_01");	//Ano? O čem to mluvíš?
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_02");	//Tady. Podívej se sám.
	B_GiveInvItems(other,self,itwr_necronomicon,1);
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_03");	//(překvapen) Neuvěřitelné! Kde jsi tu knihu našel?
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_04");	//V jedné staré věži. Vypadá to na docela cennou věc!
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_05");	//(rozhořčeně) Cenná věc? Máš alespoň nejmenší představu, co to je?
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_06");	//A co to je?
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_07");	//(vyčítavě) Tato 'věc', jak jsi to nazval, není nic jiného než Nekronomikon - nejstarší tóma věnovaná magii nekromantů!
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_08");	//Každý temný mág sní o jejím získání. Nemluvě o tom, že až donedávna nikdo nevěděl, kde přesně byl tento artefakt ukryt.
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_09");	//Vypadá to, že jsem měl velké štěstí.
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_10");	//A nejen ty... (úlisně) Já taky.
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_11");	//Nevadí ti, když si tuto knihu nechám pro sebe? Pro tebe je stejně zbytečná.
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_13");	//Jakto, že je zbytečná?
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_14");	//Její tajemství podléhá pouze vůli mágů Temnoty. Pro ostatní nepředstavuje absolutně žádnou hodnotu.
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_15");	//No, jestli ji tolik potřebuješ, můžeš si ji vzít.
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_16");	//Děkuji. Upřímně řečeno, s jinou variantou jsem ani nepočítal.
	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_17");	//A já ti zase dám něco pro tebe užitečnějšího než je tato kniha.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_NOV) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW))
	{
		AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_22");	//Tady, vezmi si tento elixír ducha!
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_20");	//Tady, vezmi si tento elixír života!
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	};

	AI_Output(self,other,"DIA_Xardas_BringNecronomiconNoQuest_01_24");	//Doufám, že jsi spokojený?
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_25");	//Úplně.
};

instance DIA_XARDAS_PYROKINEZ(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_pyrokinez_condition;
	information = dia_xardas_pyrokinez_info;
	permanent = FALSE;
	description = "Co to máš na tom stole za runu?";
};

func int dia_xardas_pyrokinez_condition()
{
	if((Kapitel >= 2) && ((hero.guild == GIL_KDM) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrokinez_info()
{
	AI_Output(other,self,"DIA_Xardas_HarmUndead_01_00");	//Co to máš na tom stole za runu?
	AI_Output(self,other,"DIA_Xardas_HarmUndead_01_01");	//Co máš na mysli? (Ohlédne se) Aha, v té runě se nachází esence zničení nemrtvých. Poměrně vzácné, mimochodem.
	AI_Output(self,other,"DIA_Xardas_HarmUndead_01_02");	//Pro ty, co se zabývají Beliarovým temným uměním - to je opravdu skvost!
	AI_Output(other,self,"DIA_Xardas_HarmUndead_01_03");	//Působivé. Můžu takovou taky získat?
	AI_Output(self,other,"DIA_Xardas_HarmUndead_01_04");	//Rozumím tvému zájmu. No, mohl bych ti ji dát.
	AI_Output(self,other,"DIA_Xardas_HarmUndead_01_05");	//Ale nejprve pro mě budeš muset udělat malou laskavost.
	AI_Output(self,other,"DIA_Xardas_HarmUndead_01_07");	//Přines mi pět svazků ektoplazmy. To mi poslouží k vytvoření nové, silnější runy.
	MIS_Pyrokinez = LOG_Running;
	Log_CreateTopic(TOPIC_XARDAS_PYROKINEZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_PYROKINEZ,LOG_Running);
	B_LogEntry(TOPIC_XARDAS_PYROKINEZ,"Xardas mi slíbil, že mi dá runu zničení nemrtvého, ale nejprve mu budu muset donést 5 svazků ektoplazmy.");
};


instance DIA_Xardas_Pyrokinez_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pyrokinez_Done_condition;
	information = DIA_Xardas_Pyrokinez_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem tu ektoplazmu.";
};

func int DIA_Xardas_Pyrokinez_Done_condition()
{
	if((Npc_HasItems(hero,ITMI_PLAZMA) >= 5) && (MIS_Pyrokinez == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pyrokinez_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Xardas_HarmUndead_Done_01_01");	//Přinesl jsem tu ektoplazmu.
	B_GiveInvItems(other,self,ITMI_PLAZMA,5);
	Npc_RemoveInvItems(self,ITMI_PLAZMA,5);
	AI_Output(self,other,"DIA_Xardas_HarmUndead_Done_01_02");	//(potěšeně) To není špatné, dobrá práce!
	AI_Output(self,other,"DIA_Xardas_HarmUndead_Done_01_03");	//Tady je tvá odměna. Jsem si jistý, že ji využiješ.
 	B_GiveInvItems(self,other,ItRu_HarmUndead,1);
 	AI_Output(self,other,"DIA_Xardas_HarmUndead_Done_01_04");	//Používej ji proti těm nejsilnějším z nemrtvých.
	MIS_Pyrokinez = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDAS_PYROKINEZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDAS_PYROKINEZ,"Přinesl jsem Xardasovi ektoplazmu. Daroval mi runu zničení nemrtvého.");
};


instance DIA_Xardas_RobaUp(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_condition;
	information = DIA_Xardas_RobaUp_info;
	permanent = FALSE;
	description = "Můžu vylepšit své roucho?";
};

func int DIA_Xardas_RobaUp_condition()
{
	if((KNOWSHOWDEALSOULS == TRUE) && (NEKR_H_ROBA == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_info()
{
	AI_Output(other,self,"DIA_Xardas_RobaUp_01_00");	//Můžu vylepšit své roucho? Zdá se mi, že už mě nestačí chránit proti nepřátelům.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_01");	//Dobrá, jestliže Beliarova vůle touží, abys nabyl větší moci, tak ti jistě pomůže s posvěcením tvého roucha.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_02");	//A uvědom si, že posvěcení roucha vyžaduje vyšší temnou magii.
	AI_Output(other,self,"DIA_Xardas_RobaUp_01_03");	//Posvěcení? Magie Temnoty zahrnuje i posvěcování?
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_04");	//Již dlouhou dobu je znám jeden ze způsobů, kterými služebníci Beliara posvěcují různé předměty - především zbroj.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_05");	//Ten elixír se nazývá 'Dech Smrti', bohužel není lehké ho získat.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_06");	//Naneštěstí se recept na tento elixír již dávno ztratil. Mohu jen předpokládat, že byl třeba rozdělen do dvou nebo tří částí.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_07");	//Takže ho budeš muset najít a já tvůj spolupátrač určitě nebudu.
	AI_Output(other,self,"DIA_Xardas_RobaUp_01_08");	//Kdybych ho přeci jenom získal, co bych podle tebe s ním měl dělat?
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_09");	//Kdyby se ti to pro ten rituál přeci jenom povedlo získat, tak tu ještě zbývá jeden problém. Potřebuješ ještě alespoň sto kamenů duší.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_10");	//A pak se obrátíš na Beliara s konkrétní prosbou.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_11");	//Pamatuj: SHATAR ATN BOLMAR KRAT ISAK MOTAL!
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_12");	//Pokud je tvoje existence součástí Beliarových plánů, tak na tebe jistě obrátí svou pozornost.
	AI_Output(other,self,"DIA_Xardas_RobaUp_01_13");	//Není jiná cesta?
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_14");	//Není! Již jsem tě varoval, že cesta magie Temnoty není nic jednoduchého a bezpečného.
	AI_Output(self,other,"DIA_Xardas_RobaUp_01_15");	//Jdi a zachraň ztracenou ovci uvnitř sebe. Jdi a pokus se ten recept najít.
	Log_CreateTopic(TOPIC_XARDAS_ROBA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_ROBA,LOG_Running);
	B_LogEntry(TOPIC_XARDAS_ROBA,"Ptal jsem se Xardase na lepší roucho. Řekl mi, že je cesta jak svoji zbroj vylepšit, ale za cenu velkých obtíží. Mám-li mít nějakou šanci uspět, musím získat alespoň sto kamenů duší. Taky potřebuji speciální elixír, jak ho připravit skoro nikdo neví. Xardas naznačil, že by se měl recept na ostrově nacházet maximálně ve třech částech. Nejlépe udělám, když projdu všechny temné zákoutí a místa odpočinku mrtvých.");
	MIS_ROBA_XARDAS = LOG_Running;
};

instance DIA_Xardas_RobaUp_Find(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_Find_condition;
	information = DIA_Xardas_RobaUp_Find_info;
	permanent = FALSE;
	description = "Našel jsem recept 'Dech smrti'.";
};

func int DIA_Xardas_RobaUp_Find_condition()
{
	if((MIS_ROBA_XARDAS == LOG_Running) && (Npc_HasItems(other,itwr_death1) >= 1) && (Npc_HasItems(other,itwr_death2) >= 1) && (knows_breath_of_death1 == TRUE) && (knows_breath_of_death2 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_Find_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_01");	//Našel jsem recept 'Dech smrti'.
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_02");	//(S úctou) Ty mě nikdy nepřestaneš udivovat. Řekni mi, našel jsi všechny části receptu?
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_03");	//Našel.
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_04");	//Doufám, že sis už přečetl formuli toho lektvaru.
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_05");	//Samozřejmě.
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_06");	//Vynikající. Pak myslím, že nebude vadit, když si to vezmu.
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_07");	//No, jestli ten recept tak potřebuješ - vem si ho.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,itwr_death1,2);
	Npc_RemoveInvItems(hero,itwr_death2,1);
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_08");	//Konečně. Nedokážeš si ani představit, jak dlouho jsem čekal na tuto chvíli.
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_09");	//Velmi moudře ses rozhodl, nenechat mě odejít s prázdnýma rukama...
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_10");	//... já osobně pro tebe ten elixír připravím.
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_11");	//S touhle pomocí jsem nepočítal.
	AI_Output(self,other,"DIA_Xardas_RobaUp_Find_00_12");	//To nestojí za řeč. Vrať se do tří dnů.
	MIS_ROBA_XARDAS = LOG_SUCCESS;
	XARDASTIMERBENDM = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDAS_ROBA,LOG_SUCCESS);
	B_LogEntry(TOPIC_XARDAS_ROBA,"Dal jsem Xardasovi recept. Během našeho rozhovoru se rozhodl, že mi ten elixír 'Dech Smrti' namíchá. Mám se vrátit za tři dny.");
};

instance DIA_Xardas_RobaUp_Potion_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_Potion_Done_condition;
	information = DIA_Xardas_RobaUp_Potion_Done_info;
	important = FALSE;
	description = "Co můj elixír?";
};

func int DIA_Xardas_RobaUp_Potion_Done_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_ROBA_XARDAS == LOG_SUCCESS) && (XARDASTIMERBENDM > 0) && (XARDASTIMERBENDM < (daynow - 3)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_Potion_Done_info()
{
	AI_Output(other,self,"DIA_Xardas_RobaUp_Potion_Done_01_00");	//Co můj elixír?
	AI_Output(self,other,"DIA_Xardas_RobaUp_Potion_Done_01_01");	//Je připraven. Tady, vem si ho.
	B_GiveInvItems(self,other,ITPO_BREATH_OF_DEATH,1);
	AI_Output(other,self,"DIA_Xardas_RobaUp_Potion_Done_01_02");	//Děkuju.
};

instance DIA_Xardas_RobaUp_NoRitual(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_NoRitual_condition;
	information = DIA_Xardas_RobaUp_NoRitual_info;
	permanent = FALSE;
	description = "Mám malý problém.";
};

func int DIA_Xardas_RobaUp_NoRitual_condition()
{
	if((BeliarFailRobe == TRUE) && (BeliarDoneRobe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_NoRitual_info()
{
	AI_Output(other,self,"DIA_Xardas_RobaUp_NoRitual_00_01");	//Mám malý problém.
	AI_Output(self,other,"DIA_Xardas_RobaUp_NoRitual_00_02");	//(překvapeně) Jaký problém?
	AI_Output(other,self,"DIA_Xardas_RobaUp_NoRitual_00_03");	//Beliar mi nechce posvětit moje roucho. Co mám dělat?
	AI_Output(self,other,"DIA_Xardas_RobaUp_NoRitual_00_04");	//Není se čemu divit. Musíš si nejprve zasloužit jeho přízeň.
	AI_Output(self,other,"DIA_Xardas_RobaUp_NoRitual_00_05");	//Můžeš využívat jeho darů teprve tehdy, jakmile si bude Beliar jistý, že jsi opravdu jeho věrný služebník.
	AI_Output(self,other,"DIA_Xardas_RobaUp_NoRitual_00_06");	//A ještě jedna věc: čím silnější kámen duší přineseš, tím bude finální efekt mnohem zajímavější.
};

instance DIA_Xardas_Mechi(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Mechi_condition;
	information = DIA_Xardas_Mechi_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_Mechi_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Xardas_Mechi_info()
{
	AI_Output(self,other,"DIA_Xardas_Mechi_00_01");	//Počkej, mám na tebe jednu žádost.
	AI_Output(self,other,"DIA_Xardas_Mechi_00_02");	//Už jsi měl co dočinění s prokletým ostřím?
	AI_Output(other,self,"DIA_Xardas_Mechi_00_03");	//Možná, nepamatuji si přesně.
	AI_Output(self,other,"DIA_Xardas_Mechi_00_04");	//Chci tě varovat - ta zbraň je pro lidi velmi nebezpečná! Takže ať tě ani nenapadne ji používat.
	AI_Output(other,self,"DIA_Xardas_Mechi_00_05");	//Ale proč?
	AI_Output(self,other,"DIA_Xardas_Mechi_00_06");	//Je to síla nemrtvých a jejich magie občas může ovlivňovat přemýšlení každého muže. 
	AI_Output(self,other,"DIA_Xardas_Mechi_00_07");	//I tak silného jako jsi ty!
	AI_Output(self,other,"DIA_Xardas_Mechi_00_08");	//Chtěl bych tě požádat jestli bys mi ty zbraně, které ve světě působí jen zmatek a bolest, nepřinesl.
	AI_Output(self,other,"DIA_Xardas_Mechi_00_09");	//V mé věži, pod ochranou mých služebníků, už jednoduše neublíží obyvatelům tohoto světa.
	AI_Output(self,other,"DIA_Xardas_Mechi_00_10");	//No, koneckonců tvoje snaha bude velmi dobře zaplacena. Souhlasíš?
	AI_Output(other,self,"DIA_Xardas_Mechi_00_11");	//Dobře, budu si to pamatovat.
	B_LogEntry(Topic_OutTrader,"Xardas ode mě odkoupí prokleté zbraně.");
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BuyWeapons(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 600;
	condition = DIA_Xardas_BuyWeapons_condition;
	information = DIA_Xardas_BuyWeapons_info;
	permanent = TRUE;
	description = "Mám pro tebe prokleté zbraně.";
};

func int DIA_Xardas_BuyWeapons_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Xardas_Mechi))
	{
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0) || (Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0) || (Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0) || (Npc_HasItems(hero,ItMw_PlagueStaff) > 0) || (Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0) || (Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0) || (Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0) || (Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0) || (Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0) || (Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0) || (Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PreElite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0) || (Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0) || (Npc_HasItems(hero,ItRw_Undead) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_Elite) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Xardas_BuyWeapons_info()
{
	var int countexp;
	var int goldplus;
	var int goldplus_all;

	goldplus = FALSE;
	goldplus_all = FALSE;

	AI_Output(other,self,"DIA_Xardas_BuyWeapons_01_00");	//Mám pro tebe prokleté zbraně.
	AI_Output(self,other,"DIA_Xardas_BuyWeapons_01_01");	//Vynikající! Dej to sem.

	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Left);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Right);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_2H_ShadowBlade_Xert);
		Npc_RemoveInvItems(hero,ItMw_2H_ShadowBlade_Xert,Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elair);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elair,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Ober);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Ober,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_PlagueStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_PlagueStaff);
		Npc_RemoveInvItems(hero,ItMw_PlagueStaff,Npc_HasItems(hero,ItMw_PlagueStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_SoulKeeperStaff);
		Npc_RemoveInvItems(hero,ItMw_SoulKeeperStaff,Npc_HasItems(hero,ItMw_SoulKeeperStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DoomSpeer_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DoomSpeer_Elite,Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMAXE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMAXE,Npc_HasItems(hero,ITMW_2H_DOOMAXE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_HAOSHAND);
		Npc_RemoveInvItems(hero,ITMW_2H_HAOSHAND,Npc_HasItems(hero,ITMW_2H_HAOSHAND));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_RAVENELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_RAVENELITE,Npc_HasItems(hero,ITMW_2H_RAVENELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DRACONSWORD_DEAD);
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_Doom_OldPiratensaebel);
		Npc_RemoveInvItems(hero,ItMw_Doom_OldPiratensaebel,Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST,Npc_HasItems(hero,ITMW_SHADOWPRIEST));
		goldplus_all = goldplus_all + (goldplus * 40);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elite);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite));
		goldplus_all = goldplus_all + (goldplus * 40);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_PREELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_PREELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_ELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_ELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_GHOSTSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_GHOSTSWORD,Npc_HasItems(hero,ITMW_1H_GHOSTSWORD));
		goldplus_all = goldplus_all + (goldplus * 30);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSPEER);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSPEER,Npc_HasItems(hero,ITMW_1H_DOOMSPEER));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItRw_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Undead);
		Npc_RemoveInvItems(hero,ItRw_Undead,Npc_HasItems(hero,ItRw_Undead));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Crossbow_Undead);
		Npc_RemoveInvItems(hero,ItRw_Crossbow_Undead,Npc_HasItems(hero,ItRw_Crossbow_Undead));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_01_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_01_Damn,Npc_HasItems(hero,ItAr_Shield_01_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_02_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_02_Damn,Npc_HasItems(hero,ItAr_Shield_02_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_03_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_03_Damn,Npc_HasItems(hero,ItAr_Shield_03_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};

	AI_Output(self,other,"DIA_Xardas_BuyWeapons_01_02");	//Dobře! Tady máš své zlato.
	B_GiveInvItems(self,other,ItMi_Gold,goldplus_all);
};

instance DIA_Xardas_SleeperMask(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SleeperMask_condition;
	information = DIA_Xardas_SleeperMask_info;
	permanent = FALSE;
	description = "Mám tady masku Spáče.";
};

func int DIA_Xardas_SleeperMask_condition()
{
	if(Npc_HasItems(hero,ITMI_HELMSLEEPER_MIS) > 0)
	{
		return TRUE;
	};
};

func void DIA_Xardas_SleeperMask_info()
{
	AI_Output(other,self,"DIA_Xardas_SleeperMask_00_01");	//Mám tady masku Spáče.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_02");	//Zajímavé! Kde jsi to získal?
	AI_Output(other,self,"DIA_Xardas_SleeperMask_00_03");	//Od jednoho nekromanta ve skřetím chrámu.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_04");	//Pojď blíž, ať si ji můžu prohlédnout.
	AI_Output(other,self,"DIA_Xardas_SleeperMask_00_05");	//Tady.
	B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
	Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_06");	//Hmmm... (uznale) Je to nabité magií Temnoty. Velmi nebezpečný a mocný předmět.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_07");	//Jsem si jistý, že její předchozí majitel se ji dobrovolně nevzdával.
	AI_Output(other,self,"DIA_Xardas_SleeperMask_00_08");	//Samozřejmě. Ale mě by zajímala jiná věc - zda si ji můžu nasadit?
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_10");	//No... (zamyšleně) Ovládnout magický artefakt takové moci, se mi zdá trochu složité.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_11");	//Je pravda, že část té magické síly zmizí a nebude tak mocný, jako je nyní. 
	AI_Output(self,other,"DIA_Xardas_SleeperMask_00_12");	//Nicméně i potom to bude vyžadovat značnou moc, abys ji mohl nosit.

	if((hero.guild != GIL_KDF) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDM) || (hero.guild != GIL_GUR))
	{
		AI_Output(self,other,"DIA_Xardas_SleeperMask_00_04");	//A protože nejsi mág, představa ovládnutí je zcela nereálná.
	};

	Info_ClearChoices(DIA_Xardas_SleeperMask);
	Info_AddChoice(DIA_Xardas_SleeperMask,"Prosím! Pomoz mi.",DIA_Xardas_SleeperMask_DoIt);
	Info_AddChoice(DIA_Xardas_SleeperMask,"Tak bude lepší ti ji věnovat.",DIA_Xardas_SleeperMask_Leave);
};

func void DIA_Xardas_SleeperMask_DoIt()
{
	AI_Output(other,self,"DIA_Xardas_SleeperMask_DoIt_00_01");	//Prosím! Pomoz mi.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_DoIt_00_02");	//Když myslíš. Počkej chvíli.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other,"DIA_Xardas_SleeperMask_DoIt_00_03");	//Hotovo, nyní ji můžeš používat.
	B_GiveInvItems(self,other,ITMI_HELMSLEEPER,1);
	AI_Output(other,self,"DIA_Xardas_SleeperMask_DoIt_00_04");	//Děkuji moc.
	Info_ClearChoices(DIA_Xardas_SleeperMask);
};

func void DIA_Xardas_SleeperMask_Leave()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Xardas_SleeperMask_Leave_00_01");	//Tak bude lepší ti ji věnovat.
	AI_Output(self,other,"DIA_Xardas_SleeperMask_Leave_00_02");	//Moudré rozhodnutí... (vděčně) Já pro ni najdu lepší využití.
	DestroyMask = TRUE;
	Info_ClearChoices(DIA_Xardas_SleeperMask);
};

var int XardasDoMagicRoot;
var int XardasDoMagicRootYes;
var int XardasDoMagicRootDay;

instance DIA_Xardas_Druid(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Druid_condition;
	information = DIA_Xardas_Druid_info;
	permanent = FALSE;
	description = "Víš něco o magii druidů?";
};

func int DIA_Xardas_Druid_condition()
{
	if((XarDruid == TRUE) && (RootIsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Druid_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_Druid_00_01");	//Víš něco o magii druidů?
	AI_Output(self,other,"DIA_Xardas_Druid_00_02");	//Možná vím. Proč tě tak zajímá?
	AI_Output(other,self,"DIA_Xardas_Druid_00_03");	//Mám jeden problém. Saturas mi řekl, že magie druidů mi to pomůže vyřešit.
	AI_Output(self,other,"DIA_Xardas_Druid_00_04");	//Jaký to je problém?
	AI_Output(other,self,"DIA_Xardas_Druid_00_05");	//Musím vrátit jeden mrtvý strom k životu. Jen se prosím neptej proč.
	AI_Output(self,other,"DIA_Xardas_Druid_00_06");	//Moc tomu nerozumím. Ale tvoje otázka ve mně vzbuzuje zájem.
	AI_Output(self,other,"DIA_Xardas_Druid_00_07");	//Počkej chvíli. Tak, kde mám ty zápisky...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_Druid_00_08");	//Aha, tady jsou. Ano, je to skutečně možné.
	AI_Output(self,other,"DIA_Xardas_Druid_00_09");	//Léčení pro druidy nebylo těžké, ale pro ty, co nejsou obeznámeni s jejich magií.
	AI_Output(self,other,"DIA_Xardas_Druid_00_10");	//Obecně platí, že to není nic snadného. Ale já ti můžu v téhle věci pomoci.
	AI_Output(other,self,"DIA_Xardas_Druid_00_11");	//Co budu potřebovat?
	AI_Output(self,other,"DIA_Xardas_Druid_00_12");	//Za prvé, tvoji spolupráci. V poznámkách je zaznamenané, abys mohl zasahovat do života rostliny, budeš potřebovat věc nazývanou - 'Kořen života'.
	AI_Output(other,self,"DIA_Xardas_Druid_00_13");	//'Kořen života'? Kde ho najdu?
	AI_Output(self,other,"DIA_Xardas_Druid_00_14");	//Nemusíš se obtěžovat s hledáním té rostliny. Je nemožné ji kdekoliv utrhnout na zahradě, to najdeš jen u zkušeného druida.
	AI_Output(other,self,"DIA_Xardas_Druid_00_15");	//Vysvětli mi, jak na to?
	AI_Output(self,other,"DIA_Xardas_Druid_00_16");	//Nic ti nevysvětlím. Druidská magie se učí léta. Nebudu s tebou ztrácet tolik času.
	AI_Output(self,other,"DIA_Xardas_Druid_00_17");	//Přines mi vše, co potřebuju a já ti to připravím.
	AI_Output(other,self,"DIA_Xardas_Druid_00_18");	//Dobrá, to by šlo. Co za to chceš?
	AI_Output(self,other,"DIA_Xardas_Druid_00_19");	//Hmmm...(zamyšleně) Dej mi vteřinku...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_Druid_00_20");	//Zapamatuj si: Potřebuji královský šťovík, ohnivý kořen - to poslouží jako základ pro recept...
	AI_Output(self,other,"DIA_Xardas_Druid_00_21");	//... tři listy léčivých bylin, trolí bobuli jako činidlo a...
	AI_Output(self,other,"DIA_Xardas_Druid_00_22");	//(zamyšleně) To bude nejtěžší... ještě potřebuji květ kaktusu!
	AI_Output(other,self,"DIA_Xardas_Druid_00_23");	//Květ kaktusu?
	AI_Output(self,other,"DIA_Xardas_Druid_00_24");	//Ano! Tato rostlina roste v hojnosti pouze ve velmi horkých podmínkách. Najít na tomto ostrově podobný exemplář bude nesmírně obtížné.


	if(Npc_HasItems(hero,ItPl_CactusFlower) > 0)
	{
		AI_Output(other,self,"DIA_Xardas_Druid_00_25");	//Neboj se! Už jeden takový mám.
		AI_Output(self,other,"DIA_Xardas_Druid_00_26");	//(Překvapeně) No, pokud ano, pak mi přines zbytek přísad a vytvořím pro tebe 'Kořen života'.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_Druid_00_27");	//Ale jinak bez něj nic nezmůžu.
	};

	AI_Output(other,self,"DIA_Xardas_Druid_00_37");	//Chápu.
	B_LogEntry(TOPIC_AdanosCrone,"Zdá se, že na světě není nic, o čem by Xardas nevěděl. Připraví pro mě magickou rostlinu - 'Kořen života', schopnou obnovit životní sílu mrtvému stromu. Pokud ji chci vytvořit, potřebuji: královský šťovík, ohnivý kořen, trolí bobuli, tři listy léčivých bylin a květ kaktusu. To poslední nebude snadné, protože roste jen na velmi horkých místech. Něco mi říká, že ji mohu najít na náhorní plošině.");
	XardasDoMagicRoot = TRUE;
	RootIsUp = TRUE;
};

instance DIA_Xardas_MagicRoot(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_MagicRoot_condition;
	information = DIA_Xardas_MagicRoot_info;
	permanent = TRUE;
	description = "Přinesl jsem všechny potřebné ingredience.";
};

func int DIA_Xardas_MagicRoot_condition()
{
	if((XardasDoMagicRoot == TRUE) && (XardasDoMagicRootYes == FALSE) && (Npc_HasItems(hero,ItPl_CactusFlower) > 0) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 3) && (Npc_HasItems(hero,ITPL_SUPER_HERB) > 0) && (Npc_HasItems(hero,ItPl_Perm_Herb) > 0))
	{
		return TRUE;
	};
};

func void DIA_Xardas_MagicRoot_info()
{
	AI_Output(other,self,"DIA_Xardas_MagicRoot_00_01");	//Přinesl jsem všechny potřebné ingredience.

	if((Xardas_GoesToRitualInnosEye == FALSE) || ((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Xardas_GoesToRitualInnosEye == TRUE)))
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Xardas_MagicRoot_00_02");	//Výborně. Dej mi je.
		AI_Output(other,self,"DIA_Xardas_MagicRoot_00_03");	//Tady jsou.
		b_giveinvitemsmanythings(other,self);
		Npc_RemoveInvItems(hero,ItPl_CactusFlower,1);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,3);
		Npc_RemoveInvItems(hero,ITPL_SUPER_HERB,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		AI_Output(self,other,"DIA_Xardas_MagicRoot_00_04");	//Nyní žádám o trpělivost. Přesně jeden den a 'Kořen života' bude připravený.
		XardasDoMagicRootDay = Wld_GetDay();
		XardasDoMagicRootYes = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Alchemy");
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_MagicRoot_00_05");	//Promluvíme si o tom později.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Xardas_MagicRoot_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_MagicRoot_Done_condition;
	information = DIA_Xardas_MagicRoot_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_MagicRoot_Done_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((XardasDoMagicRootYes == TRUE) && (XardasDoMagicRootDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_Xardas_MagicRoot_Done_info()
{
	AI_Output(self,other,"DIA_Xardas_MagicRoot_Done_00_01");	//Kořen je připravený. Můžeš si ho vyzvednout.
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	AI_Output(other,self,"DIA_Xardas_MagicRoot_Done_00_02");	//Děkuju.
	B_LogEntry(TOPIC_AdanosCrone,"Xardas mi vytvořil 'Kořen života'. Je na čase se vrátit k mrtvému stromu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
};

var int XarCanDoSoulPot;
var int XarCanDoSoulPotDay;

instance DIA_Xardas_SeekerSoul(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_condition;
	information = DIA_Xardas_SeekerSoul_info;
	permanent = FALSE;
	description = "Něco tady mám.";
};

func int DIA_Xardas_SeekerSoul_condition()
{
	if(Npc_HasItems(hero,ITMI_SeekerSoul) > 0)
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_info()
{
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_01");	//Něco tady mám.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_02");	//(nevrle) Mluv jasně! Co tady máš?
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_03");	//Tohle.
	B_GiveInvItems(other,self,ITMI_SeekerSoul,1);
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_04");	//(zamyšleně) Vypadá to jako krystal duší. Kde jsi to vzal?
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_05");	//Vzal jsem to z jednoho stvoření zla. Co je to?
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_06");	//No, jednoduše řečeno, je to jen obyčejné srdce.
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_07");	//Srdci se to moc nepodobá.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_08");	//Existují bytosti z masa a krve. Jejich srdce jsi viděl více než jednou.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_09");	//A existují stvoření magie. V tomto světě se často nevyskytují a všechny jsou extrémně nebezpečné.
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_10");	//V tom s tebou souhlasím. A tohle... srdce, dá se na něco použít?
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_11");	//Dobrá otázka. Nech mě přemýšlet...
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_12");	//Měl jsem záznamy, které uváděly jeden vzácný magický elixír. K jeho přípravě bylo potřeba tyto krystaly.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_13");	//Počkej chvíli.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_14");	//Aha, tady je to!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_15");	//Zde je napsáno, že pro přípravu tohoto elixíru potřebuješ deset tmavých krystalů duší.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_16");	//Dále se píše, že působení tohoto lektvaru je mimořádně nepředvídatelné.
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_17");	//A co to znamená?
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_18");	//Jestli to dobře chápu, může zvýšit tvou sílu a může ti dát taky obratnost. Na každého má jiný učinek.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_19");	//Každopádně, pokud mi přineseš krystaly, připravím ti tento elixír.
	B_GiveInvItems(self,other,ITMI_SeekerSoul,1);
	MIS_SeekerSoul = LOG_Running;
	Log_CreateTopic(TOPIC_SeekerSoul,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SeekerSoul,LOG_Running);
	B_LogEntry(TOPIC_SeekerSoul,"Xardas mi řekl, že z temných krystalů duší lze připravit magický elixír. K tomu ale bude potřebovat nejméně deset takových krystalů.");
};

instance DIA_Xardas_SeekerSoul_Start(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_Start_condition;
	information = DIA_Xardas_SeekerSoul_Start_info;
	permanent = FALSE;
	description = "Přinesl jsem tmavé krystaly duší.";
};

func int DIA_Xardas_SeekerSoul_Start_condition()
{
	if((MIS_SeekerSoul == LOG_Running) && (Npc_HasItems(hero,ITMI_SeekerSoul) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_Start_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_Start_00_01");	//Přinesl jsem tmavé krystaly duší.
	B_GiveInvItems(other,self,ITMI_SeekerSoul,10);
	Npc_RemoveInvItems(self,ITMI_SeekerSoul,10);
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_Start_00_06");	//Dobře. Potřebuji čas, abych to připravil.
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_Start_00_07");	//Vrať se za pár dní. Myslím, že pak už bude hotov.
	B_LogEntry(TOPIC_SeekerSoul,"Přinesl jsem Xardasovi krystaly duší. Za pár dní se můžu stavit pro elixír.");
	XarCanDoSoulPot = TRUE;
	XarCanDoSoulPotDay = Wld_GetDay();
};

instance DIA_Xardas_SeekerSoul_End(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_End_condition;
	information = DIA_Xardas_SeekerSoul_End_info;
	permanent = FALSE;
	description = "Tak co můj elixír?";
};

func int DIA_Xardas_SeekerSoul_End_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_SeekerSoul == LOG_Running) && (XarCanDoSoulPot == TRUE) && (XarCanDoSoulPotDay <= (DayNow - 2)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_End_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_End_00_01");	//Tak co můj elixír?
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_End_00_02");	//Je připraven. Tady.
	B_GiveInvItems(self,other,ITPO_SOULPOTION,1);
	MIS_SeekerSoul = LOG_Success;
	Log_SetTopicStatus(TOPIC_SeekerSoul,LOG_Success);
	B_LogEntry(TOPIC_SeekerSoul,"Mám lektvar z krystalů duší.");
};

instance DIA_Xardas_Pirate_Start(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Start_condition;
	information = DIA_Xardas_Pirate_Start_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_Pirate_Start_condition()
{
	if((Kapitel >= 2) && (GregIsBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Start_info()
{
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_01");	//Dobře, že ses tu objevil. Mám pro tebe nějakou práci.
	AI_Output(other,self,"DIA_Xardas_Pirate_Start_00_02");	//Poslouchám.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_03");	//Jak jsem se dozvěděl, paladinové před příchodem do Khorinisu potopili pirátskou loď.
	AI_Output(other,self,"DIA_Xardas_Pirate_Start_00_04");	//Ty máš zájem o piráty?
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_05");	//(Znechuceně) Nejprve poslouchej a až potom se ptej! Takže...
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_06");	//Kdysi se přihodila jedna věc, předtím, než byl zničen jeden z chrámů Beliara, z něj paladinové vzali mnoho věcí.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_07");	//Také sebou vzali jeden prsten. Vypadá ošklivě, ale je v něm veliká síla. Hlavně pokud ho nosí správná osoba.
	AI_Output(other,self,"DIA_Xardas_Pirate_Start_00_08");	//Kde jsou ti piráti?
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_09");	//Poslouchej dál... (naštvaně) Zatím jsem s tím prstenem neměl co dočinění.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_10");	//Ale v nedávné době jsem přišel na to, že jeden člověk ve městě ten prsten viděl.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_11");	//Zvěsti se donesly až sem a já zjistil, že v poslední době se ve městě potlouká nějaký pirát.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_12");	//Má charakteristický vzhled - pásku přes oko. Bylo by obtížné si ho s někým splést.
	AI_Output(self,other,"DIA_Xardas_Pirate_Start_00_13");	//Chci, abys ho vyhledal a dozvěděl se více o tom prstenu.
	AI_Output(other,self,"DIA_Xardas_Pirate_Start_00_14");	//Dobře, zkusím to.
	MIS_PirateRing = LOG_Running;
	Log_CreateTopic(TOPIC_PirateRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PirateRing,LOG_Running);
	B_LogEntry(TOPIC_PirateRing,"Xardas hledá vzácný prsten, který kdysi paladinové převzali z ruin chrámu Beliara. Xardas se nedávno dozvěděl, že tento prsten byl spatřen u jedné osoby, podle popisu připomínající piráta. Jeho charakteristickým rysem je páska přes oko. Xardas mě požádal, abych zjistil více o tom prstenu.");
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_Pirate_Curse(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Curse_condition;
	information = DIA_Xardas_Pirate_Curse_info;
	permanent = FALSE;
	description = "Ohledně toho prstenu se vyskytl problém.";
};

func int DIA_Xardas_Pirate_Curse_condition()
{
	if((MIS_PirateRing == LOG_Running) && (GregCurse == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Curse_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_01");	//Ohledně toho prstenu se vyskytl problém.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_02");	//Jak jsi říkal, nese opravdu velkou sílu, ale i prokletí.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_03");	//Pirátský kapitán, který nosí tento prsten ho vykoupil mnohými životy ze své posádky.
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_04");	//To není problém. Dones mi ho a já to prokletí zničím.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_05");	//Problémem je, že ti ho donést nemůžu. Jakmile bych mu ten prsten sundal - odešel by z tohoto světa.
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_06");	//Hmmm... (zamyšleně) Tohle by mě nenapadlo.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_07");	//Nabízí ti dohodu: zachráníš ho před prokletím a on ti dá prsten.
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_08");	//Dobrá. Pokusím se mu pomoci, ale to, co potřebuji vědět přesně je, jak to všechno začalo.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_09");	//Bylo to takhle... (vypráví příběh o Gregovi) ...
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_10");	//Pak mi to je všechno jasné! Prokletí se sneslo nejen na nositele, nýbrž i na ty, co byli zrovna v jeskyni.
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_11");	//Pokud uklidníme zatracené duše, síla prokletí oslabí. Pak bude šance prsten sundat.
	AI_Output(other,self,"DIA_Xardas_Pirate_Curse_00_12");	//Nemyslím si, že by se tam znovu vydal. Vzpomínky jsou příliš čerstvé.
	AI_Output(self,other,"DIA_Xardas_Pirate_Curse_00_13");	//Pak to uděláš ty. Zabiješ ty prokleté piráty a přineseš mi ten prsten.
	XarCurseClear = TRUE;
	B_LogEntry(TOPIC_PirateRing,"Xardas poslouchal Gregův příběh a řekl, že to může spravit uklidnění duší těch prokletých pirátů. To může oslabit sílu prokletí prstenu, přičemž poté může být sejmut. Greg má sotva odvahu se přiblížit k té jeskyni. Budu to muset udělat já.");
};

instance DIA_Xardas_Pirate_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Done_condition;
	information = DIA_Xardas_Pirate_Done_info;
	permanent = FALSE;
	description = "Neztrať ten prsten.";
};

func int DIA_Xardas_Pirate_Done_condition()
{
	if((MIS_PirateRing == LOG_Running) && (Npc_HasItems(hero,ItRi_DarkCurse) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Done_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_Pirate_Done_00_01");	//Neztrať ten prsten.
	B_GiveInvItems(other,self,ItRi_DarkCurse,1);
	Npc_RemoveInvItems(self,ItRi_DarkCurse,1);
	AI_Output(self,other,"DIA_Xardas_Pirate_Done_00_02");	//(Spokojeně) Konečně je můj. Neumíš si ani představit, jak dlouho jsem na tohle čekal.
	AI_Output(other,self,"DIA_Xardas_Pirate_Done_00_03");	//Co moje odměna?
	AI_Output(self,other,"DIA_Xardas_Pirate_Done_00_04");	//Neboj se! Připravil jsem ti speciální dar.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	AI_Output(other,self,"DIA_Xardas_Pirate_Done_00_05");	//Nějaký lektvar?
	AI_Output(self,other,"DIA_Xardas_Pirate_Done_00_06");	//Ne nějaký, nýbrž vzácný elixír! Takže ho použij moudře.
	AI_Output(other,self,"DIA_Xardas_Pirate_Done_00_07");	//No dobře, díky.
	MIS_PirateRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_PirateRing,LOG_Success);
	B_LogEntry(TOPIC_PirateRing,"Dal jsem Xardasovi prsten a získal zaslouženou odměnu.");
};

instance DIA_NONE_100_Xardas_WhyHere(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_WhyHere_condition;
	information = DIA_NONE_100_Xardas_WhyHere_info;
	permanent = FALSE;
	description = "Musím s tebou mluvit.";
};

func int DIA_NONE_100_Xardas_WhyHere_condition()
{
	// if((Kapitel < 4) && (MIS_TrueDragonMasters == LOG_Running))
	if((Kapitel < 5) && (MIS_TrueDragonMasters == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_WhyHere_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_00");	//Musím s tebou mluvit.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_01");	//Co se stalo?
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_02");	//Jeden skřetí šaman mi řekl, že draci nejsou Beliarovým výtvorem! Je to tak?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_03");	//(tiše) Nech mě ti to vysvětlit.
 	AI_Output(self,other,"DIA_Xardas_WhyHere_01_04");	//Z nedávného průzkumu jsem si uvědomil jeden fakt. Hrozba nepřichází z míst, kde jsme očekávali.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_05");	//Jen hloupí lidé mají tendenci vinit skřety ze všech svých chyb! Ve skutečnosti je situace trochu odlišná. 
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_06");	//Už ses setkal se Strážci, že ano?
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_07");	//Setkal. Tady v té věži.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_08");	//Pak bychom měli znát důvod proč se tady objevují.
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_09");	//Jistě. Strážce Dagoth mi o nich povídal.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_10");	//A ty nejsi v rozpacích, když víš, co tě čeká?
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_11");	//Co je na tom špatného? Zabil jsem Spáče. Už jsi zapomněl?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_12");	//Ano, to ano...(zamyšleně) Nemyslíš, že je to příliš velká zásluha?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_13");	//Spáč byl silný arcidémon, to nepopírám. Ale dříve se mnozí hrdinové pokoušeli o obdobné činy a většina z nich zkončila v Beliarově říši. 
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_14");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_15");	//Myslím tím, že se tě snaží odvrátit od tvé pravé cesty.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_16");	//Takže se s nimi moc nestýkej a už vůbec jim nepomáhej s prováděním jejich plánů.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_17");	//Přemýšlel jsem nad tím hodně dlouhou dobu a myslím, že to mohli být skřeti, kdo nám na konci pomohl.
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_18");	//Tak jaké jsou tedy jejich plány?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_19");	//Domnívám se, že chtějí zničit svět!
	AI_Output(other,self,"DIA_Xardas_WhyHere_01_20");	//Ou! Zajímavé... Proč by to dělali?
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_21");	//Nemohu odpovědět na tuto otázku, protože jejich plány jsou pro mě stále záhadou.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_22");	//Ale jedno vím jistě - tvá role v jejich záležitostech ani zdaleka neskončila.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_23");	//Musíme jednat moudře! Není moc času nazbyt.
	B_LogEntry(TOPIC_TrueDragonMasters,"Xardas věří, že Strážci hrají dvojí hru a že to nejsou skřeti, ale právě Strážci, kdo chtějí zničit svět.");
};

instance DIA_NONE_100_Xardas_WhatDo(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_WhatDo_condition;
	information = DIA_NONE_100_Xardas_WhatDo_info;
	permanent = FALSE;
	description = "Co budeme dělat dál?";
};

func int DIA_NONE_100_Xardas_WhatDo_condition()
{
	if((MIS_TrueDragonMasters == LOG_Running) && (Npc_KnowsInfo(hero,DIA_NONE_100_Xardas_WhyHere) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_WhatDo_info()
{
	AI_Output(other,self,"DIA_Xardas_WhatDo_01_00");	//A co budeme dělat dál?
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_01");	//Nejprve se musíme vypořádat s draky! Ve většině klíčových okamžicích, by mohli překážet.
	AI_Output(other,self,"DIA_Xardas_WhatDo_01_02");	//Jsou draci služebníci Beliara?
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_03");	//Tyto prastaré bytosti jsou výsledkem veliké moci elementů. Volání Spáče je probudilo z jejich spánku.
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_04");	//S největší pravděpodobností budou poslouchat vůli Strážců více než kdokoliv jiný.
	AI_Output(other,self,"DIA_Xardas_WhatDo_01_05");	//Ale vždycky jsem si myslel, že draci jsou přesně jako Beliarova vůle.
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_06");	//(Vážně) Ne, to ne. Draci neslouží Beliarovi.
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_07");	//Jsou příliš silnými pouhými pěšáky v nekonečné válce bohů.
	AI_Output(self,other,"DIA_Xardas_WhatDo_01_08");	//A jenom síla jejich tvůrců, jim může poroučet. Jejich páni jsou Strážci.
	MIS_TrueDragonMasters = LOG_Success;
	Log_SetTopicStatus(TOPIC_TrueDragonMasters,LOG_Success);
	B_LogEntry(TOPIC_TrueDragonMasters,"Xardas mi řekl, že budeme zatím postupovat podle plánu. Musím vyzabíjet draky v Hornickém údolí.");
};

instance DIA_NONE_100_Xardas_Scare(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_Scare_condition;
	information = DIA_NONE_100_Xardas_Scare_info;
	permanent = FALSE;
	description = "Nebojíš se, že Strážci uslyší tvá slova?";
};

func int DIA_NONE_100_Xardas_Scare_condition()
{
	if((MIS_TrueDragonMasters == LOG_Success) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_01") > 2000))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_Scare_info()
{
	AI_Output(other,self,"DIA_Xardas_Scare_01_00");	//Nebojíš se, že Strážci uslyší tvá slova?
	AI_Output(self,other,"DIA_Xardas_Scare_01_01");	//(tiše) Zapomínáš na jednu věc. Je to pořád moje věž.
	AI_Output(self,other,"DIA_Xardas_Scare_01_02");	//Samozřejmě si jsem jistý, že se tu cítím jako doma a jsem tady v naprostém bezpečí.
	AI_Output(self,other,"DIA_Xardas_Scare_01_03");	//Takže neboj se. O našem rozhovoru se nikdo nikdy nedozví.
};

instance DIA_Xardas_DarkMageBuySwords(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_DarkMageBuySwords_condition;
	information = DIA_Xardas_DarkMageBuySwords_info;
	permanent = FALSE;
	description = "Možná by tě mohla zajímat tahle zbraň?";
};

func int DIA_Xardas_DarkMageBuySwords_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (DarkMageBuySwords == TRUE) && (KreolBuyMasiafSwrods == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DarkMageBuySwords_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_DarkMageBuySwords_01_00");	//Možná by tě mohla zajímat tahle zbraň?
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,1);
	AI_Output(self,other,"DIA_Xardas_DarkMageBuySwords_01_03");	//Tak, tak... Ano, zajímavá věc! Ale já ji nepotřebuji.
	AI_Output(self,other,"DIA_Xardas_DarkMageBuySwords_01_04");	//Takže radši vyhledej někoho jiného, kdo by o to mohl mít zájem.
	B_GiveInvItems(self,other,ITMW_FAKESWORD_01,1);
};

instance DIA_Xardas_OldTeleports(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_OldTeleports_condition;
	information = DIA_Xardas_OldTeleports_info;
	permanent = FALSE;
	description = "Co víš o těch velkých kamenech tam venku?";
};

func int DIA_Xardas_OldTeleports_condition()
{
	if(MIS_OldTeleports == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Xardas_OldTeleports_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_OldTeleports_01_00");	//Co víš o těch velkých kamenech tam venku?
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_01");	//Pokud je mi známo, byly využívány druidy, kteří kdysi sídlili na tomto ostrově.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_02");	//Tyto kameny jim sloužily jako prostředek rychlého cestování po celém ostrově, jako jakási teleportace. Jsou i v Hornickém údolí.
	AI_Output(other,self,"DIA_Xardas_OldTeleports_01_03");	//Nezkusil jsi je aktivovat?
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_04");	//Zkusil, ale neúspěšně.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_05");	//Myslím, že spusta druidských artefaktů nejde použít, protože je mohou využívat jen samotní druidové.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_06");	//Ale moc o tom nevím.
	AI_Output(other,self,"DIA_Xardas_OldTeleports_01_07");	//Takže jsou nám úplně k ničemu?
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_08");	//Ne tak docela... Byl jsem schopen se vypořádat se samotným procesem přemístění.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_09");	//Vytvořil jsem teleportační runu, která využívá sílu těchto magických kamenů.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_10");	//Otázka však zůstává - budeme moci využít samotné zařízení?
	AI_Output(other,self,"DIA_Xardas_OldTeleports_01_11");	//Můžu se porozhlédnout po těchto kamenech.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_12");	//Hmmm... Proč ne? Koneckonců jsem byl hodně zaneprázdněn mechanismem těch kamenů.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_01_13");	//Dám ti tedy tu runu a ty se podíváš po nějakém způsobu, jak je vzkřísit.
	B_GiveInvItems(self,other,ItRu_GlobalTeleport,1);
	AI_Output(other,self,"DIA_Xardas_OldTeleports_01_14");	//Dobře, zkusím to.
	B_LogEntry(TOPIC_OldTeleports,"Podle Xardase se tyto runové kameny, používané druidy, nachází po celém ostrově. Nezná způsob, jak aktivovat kameny samotné, nicméně byl schopen vytvořit runu z magie teleportace těchto objektů. Teď musím najít druidské artefakty s jejichž pomocí zprovozním ty kameny.");
	XarSeekDruidArt = TRUE;
};

instance DIA_Xardas_OldTeleports_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_OldTeleports_Done_condition;
	information = DIA_Xardas_OldTeleports_Done_info;
	permanent = FALSE;
	description = "Našel jsem způsob, jak aktivovat ty kameny.";
};

func int DIA_Xardas_OldTeleports_Done_condition()
{
	if((MIS_OldTeleports == LOG_Running) && (ActivateDruidStone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_OldTeleports_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_OldTeleports_Done_01_00");	//Našel jsem způsob, jak aktivovat ty kameny.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_Done_01_01");	//Výborně. Nyní se budeme moci pohybovat po celém ostrově, jako kdysi sami druidové.
	AI_Output(self,other,"DIA_Xardas_OldTeleports_Done_01_02");	//Tu runu, co jsem ti dříve dal, si můžeš nechat.
	MIS_OldTeleports = LOG_Success;
	Log_SetTopicStatus(TOPIC_OldTeleports,LOG_Success);
	B_LogEntry(TOPIC_OldTeleports,"Xardas má radost, že se teď může pohybovat po celém ostrově.");
};

instance DIA_Xardas_Fregarah(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_Fregarah_condition;
	information = DIA_Xardas_Fregarah_info;
	permanent = FALSE;
	description = "Pověz mi něco o kamenném golemovi.";
};

func int DIA_Xardas_Fregarah_condition()
{
	if((MIS_XRANFREG == LOG_Running) && (XRANFREGXAR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Fregarah_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_Fregarah_01_00");	//Pověz mi něco o kamenném golemovi.
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_01");	//Co? Co tím myslíš?
	AI_Output(other,self,"DIA_Xardas_Fregarah_01_02");	//To stvoření, které blokuje cestu do chrámu v horách. Během expedice do hor ho spatřili mágové Ohně.
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_03");	//Á... Tak tohle myslíš. Jak ses o tom dozvěděl?
	AI_Output(other,self,"DIA_Xardas_Fregarah_01_04");	//Četl jsem o tom v jedné z knih v knihovně kláštera.
	AI_Output(other,self,"DIA_Xardas_Fregarah_01_05");	//Navíc mi to potvrdil i Pyrokar.
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_06");	//No jasně... (smích) Jeho strach by nebyl o nic větší, kdyby se v tom okamžiku, před ním objevil skutečný drak!
	AI_Output(other,self,"DIA_Xardas_Fregarah_01_07");	//Co o něm víš?
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_08");	//To samé co ty. O nic více ani méně!
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_09");	//Jsem dost zaneprázdněn na to, aby mi zbýval nějaký čas pro studium golemů. 
	AI_Output(self,other,"DIA_Xardas_Fregarah_01_10");	//Proto jestli máš zájem se o nich dozvědět víc, tady ve věži najdeš nějaké mé vlastní záznamy.
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItWr_Fregarah,"FP_ITEM_XARDAS_07");
};

instance DIA_Xardas_StonnosHronics(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_StonnosHronics_condition;
	information = DIA_Xardas_StonnosHronics_info;
	permanent = FALSE;
	description = "Četl jsem tvoje záznamy.";
};

func int DIA_Xardas_StonnosHronics_condition()
{
	if((MIS_XRANFREG == LOG_Running) && (FregarahSekret == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_StonnosHronics_info()
{
	AI_Output(other,self,"DIA_Xardas_StonnosHronics_01_01");	//Četl jsem tvoje záznamy.
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_02");	//Na co jsi přišel?
	AI_Output(other,self,"DIA_Xardas_StonnosHronics_01_03");	//Dobrá, co se týče toho kamenného golema...
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_04");	//(nevrle) Ach, zase tohle... Tak co?
	AI_Output(other,self,"DIA_Xardas_StonnosHronics_01_05");	//Potřebuji nutně tvou radu.
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_06");	//(smích) Ty by sis vážně beze mě nevěděl rady, co?
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_07");	//Dobrá, jestli je to pro tebe tak důležité... Pomůžu ti.
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_08");	//Pokud si vzpomínám, v jedné knize jsou popsané ony události toho dne. Podívej se do mé zatopené věže.
	AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_09");	//Nachází se ve staré bedně. Tady, vem si klíč.
	B_GiveInvItems(self,other,itke_xardasowt,1);
	AI_Output(other,self,"DIA_Xardas_StonnosHronics_01_10");	//Díky.

     if(Npc_HasItems(hero,ItWr_Fregarah) >= 1)
	{
		AI_Output(self,other,"DIA_Xardas_StonnosHronics_01_11");	//(nevrle) A mé poznámky mi vrať! Potřebuji je.
	     B_GiveInvItems(other,self,ItWr_Fregarah,1);
		Npc_RemoveInvItems(self,ItWr_Fregarah,1);
	};

	XarGiveFirstTome = TRUE;
};

instance DIA_Xardas_HauntedLighthouse(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_HauntedLighthouse_condition;
	information = DIA_Xardas_HauntedLighthouse_info;
	permanent = FALSE;
	description = "Rozumíš magickým symbolům?";
};

func int DIA_Xardas_HauntedLighthouse_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == TRUE) && (XardasGiveScroll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_HauntedLighthouse_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_01");	//Rozumíš magickým symbolům?
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_01_02");	//Co je to za dotaz? Jsem mág. Samozřejmě, že rozumím.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_03");	//Pak bys mi mohl možná pomoci pochopit význam jednoho z nich.
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_01_04");	//Hmmm... Pověz mi, jak vypadal.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_05");	//No tak... (popisuje)...
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_01_06");	//To je znak prokletí. Poměrně starý. Kde jsi ho viděl? 
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_07");	//Ve starém majáku poblíž Khorinisu.
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_01_08");	//Ano, slyšel jsem o tom něco. Místní pověry naznačují skutečnost, že tento maják je prokletý a straší v něm.
	B_LogEntry(TOPIC_HauntedLighthouse,"Řekl jsem Xardasovi o tom znaku. Prý je to symbol prokletí. Jestli se mám dozvědět více, musím přijít na to, co se tam vlastně tehdy přihodilo.");

	if((MIS_HauntedLighthouse == LOG_Running) && (FindOldSkeleton == TRUE) && (FindOldRing == TRUE) && (KnowStefan == TRUE))
	{
		Info_ClearChoices(DIA_Xardas_HauntedLighthouse);
		Info_AddChoice(DIA_Xardas_HauntedLighthouse,"Myslím, že vím, co se stalo v majáku.",DIA_Xardas_HauntedLighthouse_FindSkel);
	}
	else
	{
		XarKnowHLH = TRUE;
		AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_09");	//No, zkusím to zjistit.
	};
};

instance DIA_Xardas_HauntedLighthouse_Again(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_HauntedLighthouse_Again_condition;
	information = DIA_Xardas_HauntedLighthouse_Again_info;
	permanent = TRUE;
	description = "Ohledně toho majáku...";
};

func int DIA_Xardas_HauntedLighthouse_Again_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == TRUE) && (XarKnowHLH == TRUE) && (XardasGiveScroll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_HauntedLighthouse_Again_info()
{
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_Again_01_01");	//Ohledně toho majáku...
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_Again_01_02");	//Ano? Zjistil jsi něco?

	if((MIS_HauntedLighthouse == LOG_Running) && (FindOldSkeleton == TRUE) && (FindOldRing == TRUE) && (KnowStefan == TRUE))
	{
		Info_ClearChoices(DIA_Xardas_HauntedLighthouse_Again);
		Info_AddChoice(DIA_Xardas_HauntedLighthouse_Again,"Myslím, že vím, co se stalo v majáku.",DIA_Xardas_HauntedLighthouse_FindSkel);
	}
	else
	{
		AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_Again_01_03");	//Zatím ne.
	};
};

func void DIA_Xardas_HauntedLighthouse_FindSkel()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_01");	//Myslím, že vím, co se stalo v majáku. Před několika lety tam došlo k vraždě.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_02");	//Hanna, majitelka hotelu, mi řekla, že...
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_03");	//Nemám zájem o detaily. Tvoje slova stačí.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_04");	//A co si o tom myslíš?
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_05");	//Domnívám se, že tam mohlo snadno dojít k nějakému druhu prokletí. Pak by byl výskyt duchů snadno vysvětlitelný.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_06");	//Jak zruším prokletí?
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_07");	//Hmmm...(zamyšleně) Nebude to snadné. Za prvé, musíš znát příčinu vraždy. V tom ti může pomoct jedině duch toho chudáka, který byl zabit.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_08");	//Můžeme ho nějak přivolat?
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_09");	//S tím si poraď sám, já mám i bez tebe práce dost.
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_10");	//Tady máš svitek. Jeho síla ti umožní přivolat ducha zabitého na místě jeho smrti.
	B_GiveInvItems(self,other,ItMi_XardasMagicScroll,1);
	AI_Output(self,other,"DIA_Xardas_HauntedLighthouse_FindSkel_01_11");	//Jen buď opatrný. Duchové nemají živé příliš v lásce. Pokud na tebe vůbec promluví, můžeš to považovat za velký úspěch.
	XardasGiveScroll = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Řekl jsem Xardasovi o tom, co se stalo v majáku. Nyní je nutné mluvit s duchem zavražděného muže, abych pochopil, proč byl zabit. Xardas mi dal magický svitek, který přivolá ducha mrtvého muže. Musí se však číst v majáku v místě vraždy.");
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_DealStoryDLH(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_DealStoryDLH_condition;
	information = DIA_Xardas_DealStoryDLH_info;
	permanent = FALSE;
	description = "Ohledně toho majáku...";
};

func int DIA_Xardas_DealStoryDLH_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (DealStoryDLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DealStoryDLH_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Xardas_DealStoryDLH_01_01");	//Ohledně toho majáku... Použil jsem svitek a vyvolal ducha mrtvého muže.
	AI_Output(other,self,"DIA_Xardas_DealStoryDLH_01_02");	//Řekl mi všechno, co věděl. Teď už mám jenom jednu otázku - jak odstraním prokletí?
	AI_Output(self,other,"DIA_Xardas_DealStoryDLH_01_03");	//Pokud se nemýlím, jenom pokání samotného vraha tváří v tvář jeho oběti, může kletbu odstranit.
	AI_Output(self,other,"DIA_Xardas_DealStoryDLH_01_04");	//Musíš tu osobu najít a přivést k majáku. Tam musí požádat ducha o odpuštění za svoje činy.
	AI_Output(self,other,"DIA_Xardas_DealStoryDLH_01_05");	//Pokud mu odpustí, kletba ztratí svou moc.
	AI_Output(other,self,"DIA_Xardas_DealStoryDLH_01_06");	//A pokud ne?
	AI_Output(self,other,"DIA_Xardas_DealStoryDLH_01_07");	//Pak s největší pravděpodobností zemře.
	CanGoLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Podle Xardase pouze pokání vraha tváří v tvář duchovi odstraní prokletí z majáku. Musím zjistit, kdo zabil Stefana a dovést ho k majáku, kde bude prosit před mrtvým o odpuštění. Jenomže, kde ho mám hledat? Je to už tolik let... Možná bych se měl poptat v přístavu.");
};

//-------------------------------Slugi Ksara----------------------------------------


instance DIA_Xardas_Skeleton_Servant_01_EXIT(C_Info)
{
	npc = Xardas_Skeleton_Servant_01;
	nr = 999;
	condition = DIA_Xardas_Skeleton_Servant_01_EXIT_Condition;
	information = DIA_Xardas_Skeleton_Servant_01_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_Skeleton_Servant_01_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Skeleton_Servant_01_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_Skeleton_Servant_01_NO_TALK(C_Info)
{
	npc = Xardas_Skeleton_Servant_01;
	nr = 1;
	condition = DIA_Xardas_Skeleton_Servant_01_NO_TALK_condition;
	information = DIA_Xardas_Skeleton_Servant_01_NO_TALK_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Xardas_Skeleton_Servant_01_NO_TALK_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Skeleton_Servant_01_NO_TALK_info()
{
	Snd_Play3d(self,"GHOSTCURSE");
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_Skeleton_Servant_02_EXIT(C_Info)
{
	npc = Xardas_Skeleton_Servant_02;
	nr = 999;
	condition = DIA_Xardas_Skeleton_Servant_02_EXIT_Condition;
	information = DIA_Xardas_Skeleton_Servant_02_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_Skeleton_Servant_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Skeleton_Servant_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_Skeleton_Servant_02_NO_TALK(C_Info)
{
	npc = Xardas_Skeleton_Servant_02;
	nr = 1;
	condition = DIA_Xardas_Skeleton_Servant_02_NO_TALK_condition;
	information = DIA_Xardas_Skeleton_Servant_02_NO_TALK_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Xardas_Skeleton_Servant_02_NO_TALK_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Skeleton_Servant_02_NO_TALK_info()
{
	Snd_Play3d(self,"GHOSTCURSE");
	AI_StopProcessInfos(self);
};

//-----------------------druid---------------------------------------------

instance DIA_Fregeal_EXIT(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 999;
	condition = DIA_Fregeal_EXIT_Condition;
	information = DIA_Fregeal_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Fregeal_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fregeal_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fregeal_Hello(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_Hello_Condition;
	information = DIA_Fregeal_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Fregeal_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fregeal_Hello_Info()
{
	AI_Output(self,other,"DIA_Fregeal_Hello_01_00");	//Zdravím, cestovateli. Hledáš něco, nebo ses prostě ztratil?
	AI_Output(other,self,"DIA_Fregeal_Hello_01_01");	//Jen se procházím. Co tady děláš? 
	AI_Output(self,other,"DIA_Fregeal_Hello_01_02");	//Bydlím tady.
	AI_Output(other,self,"DIA_Fregeal_Hello_01_03");	//Žiješ tady?! Sám v lese?
	AI_Output(self,other,"DIA_Fregeal_Hello_01_04");	//A co je na lesu špatného?
	AI_Output(other,self,"DIA_Fregeal_Hello_01_05");	//Nachází se zde spousta nebezpečných potvor. Nemluvě o skřetech...
	AI_Output(self,other,"DIA_Fregeal_Hello_01_06");	//Nedotkli by se mě. Pro ně nic neznamenám. Stejně jako oni pro mě.
	AI_Output(other,self,"DIA_Fregeal_Hello_01_07");	//Říkal jsi, že se tě zvířata nedotknou?
	AI_Output(self,other,"DIA_Fregeal_Hello_01_08");	//Netuším, proč by to dělaly.
	AI_Output(other,self,"DIA_Fregeal_Hello_01_09");	//A co skřeti?
	AI_Output(self,other,"DIA_Fregeal_Hello_01_10");	//Nespatřil jsem je tady, zatím. A pochybuji, že by se rozhodli na mě zaútočit.
	AI_Output(other,self,"DIA_Fregeal_Hello_01_11");	//Skřet je poměrně silný soupeř.
	AI_Output(self,other,"DIA_Fregeal_Hello_01_12");	//Ano. Ale moji lesní bratři mě v případě potřeby ochrání.
	AI_Output(self,other,"DIA_Fregeal_Hello_01_13");	//Takže se o mě nemusíš starat.
};

instance DIA_Fregeal_WhatName(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_WhatName_Condition;
	information = DIA_Fregeal_WhatName_Info;
	permanent = FALSE;
	description = "Jak se jmenuješ?";
};

func int DIA_Fregeal_WhatName_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Fregeal_WhatName_Info()
{
	AI_Output(other,self,"DIA_Fregeal_WhatName_01_00");	//Jak se jmenuješ?
	AI_Output(self,other,"DIA_Fregeal_WhatName_01_01");	//Moje jméno je Fregeal.
	AI_Output(other,self,"DIA_Fregeal_WhatName_01_02");	//Hmmm... docela neobvyklé jméno pro takového bylinkáře.
	AI_Output(self,other,"DIA_Fregeal_WhatName_01_03");	//Víš, jména si nevybíráme. Mám své jméno od mého dědečka.
	AI_Output(self,other,"DIA_Fregeal_WhatName_01_04");	//Určitě měl svůj důvod, proč mě takhle nazval. 
	AI_Output(self,other,"DIA_Fregeal_WhatName_01_05");	//Ale teď na tom nezáleží. Jsem na to zvyklý a nemám v úmyslu to měnit.
};

var int FregealCanTrade;

instance DIA_Fregeal_WhatDo(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_WhatDo_Condition;
	information = DIA_Fregeal_WhatDo_Info;
	permanent = FALSE;
	description = "A co tady děláš?";
};

func int DIA_Fregeal_WhatDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Fregeal_WhatDo_Info()
{
	AI_Output(other,self,"DIA_Fregeal_WhatDo_01_00");	//A co tady děláš?
	AI_Output(self,other,"DIA_Fregeal_WhatDo_01_01");	//Jsem obyčejný bylinkář. Sbírat rostliny a pak vytvářím různé léky či bylinné čaje.
	AI_Output(other,self,"DIA_Fregeal_WhatDo_01_02");	//Co například?
	AI_Output(self,other,"DIA_Fregeal_WhatDo_01_03");	//Uzdravující, uzdravení z různých nemocí...
	AI_Output(self,other,"DIA_Fregeal_WhatDo_01_04");	//Pokud náhle onemocníš, mohl bych ti něco prodat.
	AI_Output(self,other,"DIA_Fregeal_WhatDo_01_05");	//Uvidíš, jak rychle se zase postavíš na nohy.
	AI_Output(other,self,"DIA_Fregeal_WhatDo_01_06");	//Zní to skvěle.
	FregealCanTrade = TRUE;
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader,"Bylinkář Fregeal mi může prodat všelijaké zboží.");
};

instance DIA_Fregeal_Trade(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 80;
	condition = DIA_Fregeal_Trade_Condition;
	information = DIA_Fregeal_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mi můžeš nabídnout?";
};

func int DIA_Fregeal_Trade_Condition()
{
	if((FregealCanTrade == TRUE) && (Wld_IsTime(8,0,23,0) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fregeal_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Co mi můžeš nabídnout?
	B_GiveTradeInv(self);
};

instance DIA_Fregeal_SwampSecret(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 1;
	condition = DIA_Fregeal_SwampSecret_condition;
	information = DIA_Fregeal_SwampSecret_info;
	permanent = FALSE;
	description = "Nevíš něco o rostlině, které se říká tráva z bažin?";
};

func int DIA_Fregeal_SwampSecret_condition()
{
	if((MIS_SwampSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fregeal_SwampSecret_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Fregeal_SwampSecret_01_00");	//Nevíš něco o rostlině, které se říká tráva z bažin?
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_01");	//(zamyšleně) Ne, moc. Proč se o to zajímáš?
	AI_Output(other,self,"DIA_Fregeal_SwampSecret_01_02");	//Zdá se mi, že účinky té rostliny jsou příliš silné, na to, že jde jenom o obyčejnou rostlinu.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_03");	//Ach... Takže chceš vědět, proč kouření bažinné trávy má tak velký vliv na magickou moc a lidské vědomí?
	AI_Output(other,self,"DIA_Fregeal_SwampSecret_01_04");	//Přesně tak.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_05");	//Bohužel ti nemohu odpovědět na tuto otázku. Mám však tušení.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_06");	//Zdá se mi, že tato rostlina je generována magií elementů.
	AI_Output(other,self,"DIA_Fregeal_SwampSecret_01_07");	//Magií elementů? Co tím myslíš?
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_08");	//Obvykle se dar magie přenáší na člověka od jednoho z bohů. Mágům Ohně dává sílu Innos, mágům Vody Adanos a temným mágům Beliar.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_09");	//Ale je tu mnohem víc, mocné síly, jiné než ty, které se týkají samotných bohů na světě.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_10");	//Možná bažinná tráva je součástí právě takové síly. A když to člověk kouří, vyplní se sám trochou této moci.
	AI_Output(other,self,"DIA_Fregeal_SwampSecret_01_11");	//Říkáš, že všichni ti zkažení závisláci se jednou stanou, díky této bylině, mocnými mágy?
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_12");	//Samozřejmě, že ne! Za prvé, ta osoba musí mít velkou sílu mysli a věnovat dlouhé měsíce meditaci. Jednoduše, ignorant to nemůže udělat.
	AI_Output(self,other,"DIA_Fregeal_SwampSecret_01_13");	//Ale to je jen můj odhad. Jestli se chceš dozvědět více o této bylině, budeš si muset všechny informace nějak ověřit a pak zjistíš, co je pravda.
	B_LogEntry(TOPIC_SwampSecret,"Fregeal věří, že se v trávě z bažin nachází veliká moc elementů, kterou naplňuje tento svět. Je tomu zatěžko uvěřit. V případě, že má pravdu, jediný způsob, jak se naučit tajemství té trávy - je zjistit, který element mu dává svou magickou moc a jak ten proces probíhá. Kde jen najít odpověď na tuto otázku? Tyto elementy existovaly ještě před tímto světem. Stěží však někdo z obyčejných lidí o nich cokoliv napsal. Možná by mohl nějaký starobylý artefakt, který absorboval sílu těchto elementů, vrhnout světlo na toto tajemství.");
};