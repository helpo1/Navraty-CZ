
var int EnterOW_Kapitel1;

func void B_ENTER_OLDWORLD_Kapitel_1()
{
	if(EnterOW_Kapitel1 == FALSE)
	{
		Wld_InsertNpc(orcwarrior_dead,"WP_COAST_MOUNTWAY_107");
		B_KillNpc(orcwarrior_dead);
		EnterOW_Kapitel1 = TRUE;
	};
};

var int EnterOW_Kapitel2;

func void B_ENTER_OLDWORLD_Kapitel_2()
{
	if(EnterOW_Kapitel2 == FALSE)
	{
		Wld_InsertNpc(icegolem_uniq,"FP_ROAM_DRACONIAN_110");
		Wld_InsertNpc(icewolf_uniq_02,"FP_ROAM_FREEMINE_50");
		Wld_InsertNpc(coast_troll,"WP_COAST_FOREST_72");
		Wld_InsertNpc(Scavenger,"WP_COAST_RIVER_01");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_73");
		Wld_InsertNpc(Warg,"WP_COAST_FOREST_31");
		Wld_InsertNpc(Wolf,"WP_COAST_SWAMPWAY_09");
		Wld_InsertNpc(Skeleton,"WP_COAST_SWAMPWAY_12");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_FOREST_123");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_105");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_BORDER02");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_BORDER04");
		Wld_InsertNpc(bloodfly_poison,"WP_COAST_BORDER07");
		Wld_InsertNpc(Snapper,"WP_COAST_RIVER_02");
		Wld_InsertNpc(Scavenger,"WP_COAST_SWAMPWAY_06");
		Wld_InsertNpc(Snapper,"WP_COAST_FOREST_70");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_15");
		Wld_InsertNpc(Warg,"WP_COAST_CAVE_03");
		Wld_InsertNpc(Keiler,"WP_COAST_FOREST_127");
		Wld_InsertNpc(Snapper,"WP_COAST_FOREST_124");
		Wld_InsertNpc(bloodfly_poison,"WP_COAST_SWAMPWAY_13");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_SWAMPWAY_20");
		Wld_InsertNpc(Wolf,"WP_COAST_FOREST_68");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_95");
		Wld_InsertNpc(Wolf,"WP_COAST_FOREST_92");
		Wld_InsertNpc(Keiler,"WP_COAST_FOREST_28");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_FOREST_128");
		Wld_InsertNpc(Scavenger,"WP_COAST_FOREST_64");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_03");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_06");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_08");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_MAGICFOREST_OC_10");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_13");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_15");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_16");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_21");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_24");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_25");
		Wld_InsertNpc(orcdog,"FP_ROAM_MAGICFOREST_OC_28");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_29");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_30");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_34");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_37");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_42");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_43");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_47");
		Wld_InsertNpc(Lurker,"FP_ROAM_MAGICFOREST_OC_48");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_53");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_54");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_55");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_56");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_MAGICFOREST_OC_61");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_64");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_67");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_70");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_71");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_72");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_77");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGICFOREST_OC_78");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGICFOREST_OC_79");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_83");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_86");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_87");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_89");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_93");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_94");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_95");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_99");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_MAGICFOREST_OC_102");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_105");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_106");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_107");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_112");
		Wld_InsertNpc(Draconian,"FP_STAND_COAST_DMT03");
		Wld_InsertNpc(Draconian,"FP_STAND_COAST_DMT02");
		Wld_InsertNpc(Skeleton,"FP_ROAM_HIGHROCK_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_HIGHROCK_05");
		Wld_InsertNpc(Draconian,"FP_ROAM_HIGHROCK_06");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_09");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_11");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_13");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_15");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MOUNTINESTAND_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MOUNTINESTAND_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MOUNTINESTAND_05");
		Wld_InsertNpc(Scavenger,"FP_ROAM_MOUNTINESTAND_08");
		Wld_InsertNpc(troll_young,"FP_ROAM_MOUNTINESTANDTROLL_02");
		Wld_InsertNpc(Snapper,"FP_ROAM_MONSTERHIGHLAND_03");
		Wld_InsertNpc(Warg,"FP_ROAM_MONSTERHIGHLAND_04");
		Wld_InsertNpc(Warg,"FP_ROAM_MONSTERHIGHLAND_05");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MONSTERHIGHLAND_08");
		Wld_InsertNpc(Warg,"FP_ROAM_MONSTERHIGHLAND_15");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MONSTERHIGHLAND_21");
		Wld_InsertNpc(Snapper,"FP_ROAM_MONSTERHIGHLAND_27");
		Wld_InsertNpc(orcdog,"FP_ROAM_MONSTERHIGHLAND_28");
		Wld_InsertNpc(orcdog,"FP_ROAM_MONSTERHIGHLAND_29");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MONSTERHIGHLAND_33");
		Wld_InsertNpc(Minecrawler,"OW_MINE3_05");
		Wld_InsertNpc(Minecrawler,"OW_MINE3_06");
		Wld_InsertNpc(Minecrawler,"OW_MINE3_08");
		Wld_InsertNpc(Minecrawler,"OW_MINE3_LEICHE_02");
		Wld_InsertNpc(Skeleton,"FP_ROAM_OW_UNDEAD_DUNGEON_04");
		Wld_InsertNpc(Skeleton,"OW_PATH_07_03");
		Wld_InsertNpc(Skeleton,"OW_PATH_07_04");
		Wld_InsertNpc(Skeleton,"OW_PATH_033_TO_CAVE5");
		Wld_InsertNpc(Skeleton,"OW_PATH_092");
		Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_19_02");
		Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");
		Wld_InsertNpc(SwampGolem,"OW_DRAGONSWAMP_023");
		Wld_InsertNpc(SwampGolem,"FP_ROAM_SWAMP_10_01");
		Wld_InsertNpc(Warg,"SPAWN_MOLERAT02_SPAWN01");
		Wld_InsertNpc(bloodfly_poison,"OW_PATH_1_5_4");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_E_3");
		Wld_InsertNpc(Snapper,"FP_ROAM_OW_GOBBO_07_02");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");
		Wld_InsertNpc(Scavenger,"OW_SPAWN_SCAVENGER_01");
		Wld_InsertNpc(Scavenger,"OW_SPAWN_SCAVENGER_02");
		Wld_InsertNpc(Warg,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(bloodfly_poison,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_ORC_09");
		Wld_InsertNpc(Lurker,"OW_PATH_WARAN05_SPAWN02");
		Wld_InsertNpc(orcdog,"PATH_OC_NC_4");
		Wld_InsertNpc(Gobbo_Black,"OW_SAWHUT_MEATBUG_SPAWN");
		Wld_InsertNpc(bloodfly_poison,"OW_PATH_055");
		Wld_InsertNpc(Gobbo_Black,"OW_SPAWN_TRACK_LEICHE_01");
		Wld_InsertNpc(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
		Wld_InsertNpc(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");
		Wld_InsertNpc(Icewolf,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_12_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_12_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_11_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_14_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_17_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_23_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_28_01");
		Wld_InsertNpc(Warg,"OW_SCAVENGER_CAVE3_SPAWN");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_CAVE1_OC");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_C3");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(bloodfly_poison,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(bloodfly_poison,"OW_PATH_BLOODFLY01_SPAWN01");
		Wld_InsertNpc(bloodfly_poison,"SPAWN_OW_MINICOAST_LURKER_A1");
		Wld_InsertNpc(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER03_SPAWN01");
		Wld_InsertNpc(Snapper,"FP_ROAM_OW_SCAVENGER_12_07");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER01_SPAWN01");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_WOOD05_05");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_185");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_190");
		Wld_InsertNpc(Lurker,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
		Wld_InsertNpc(Lurker,"MT08");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(bloodfly_poison,"OW_DT_BLOODFLY_01");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_03_04");
		Wld_InsertNpc(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
		Wld_InsertNpc(SwampDrone,"FP_ROAM_SWAMP_ENTRANCE_02");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_07_15");
		Wld_InsertNpc(Wolf,"OW_PATH_SNAPPER02_SPAWN01");
		Wld_InsertNpc(Keiler,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc(bloodfly_poison,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(Wolf,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(Wolf,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(Wolf,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(Wolf,"OW_PATH_195");
		Wld_InsertNpc(bloodfly_poison,"SPAWN_OW_MOLERAT_ORC_04");
		Wld_InsertNpc(Snapper,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(Warg,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(Warg,"CASTLE_4");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_303");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(orcdog,"OW_PATH_195");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(DragonSnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(Warg,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc(Troll,"FP_ROAM_OW_TROLLPARK_02");
		Wld_InsertNpc(Skeleton,"FP_ROAM_OW_TROLLPARK_DEAD_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_MT15_05");
		Wld_InsertNpc(Skeleton,"FP_ROAM_GROT_OC_02");
		EnterOW_Kapitel2 = TRUE;
	};
};

var int EnterOW_Kapitel3;

func void B_ENTER_OLDWORLD_Kapitel_3()
{
	if(EnterOW_Kapitel3 == FALSE)
	{
		B_RemoveNpc(PC_Mage_OW);
		B_RemoveNpc(PC_Fighter_OW);
		B_RemoveNpc(PC_ThiefOW);

		if((DARKMAGE_ISDEAD == TRUE) && (ORCREFRESHHRAMCLEAR == FALSE))
		{
			B_RemoveNpc(orc_8500_warrior);
			B_RemoveNpc(orc_8502_warrior);
			B_RemoveNpc(orc_8503_warrior);
			B_RemoveNpc(orc_8504_elite);
			B_RemoveNpc(orc_8505_elite);
			B_RemoveNpc(orc_8507_shaman);
			B_RemoveNpc(orc_8508_shaman);
			B_RemoveNpc(orc_8509_shaman);
			B_RemoveNpc(orc_8510_warrior);
			B_RemoveNpc(orc_8511_warrior);
			B_RemoveNpc(orc_8512_warrior);
			B_RemoveNpc(orc_8513_warrior);
			ORCREFRESHHRAMCLEAR = TRUE;
		};
		if(Npc_IsDead(OrcShaman_Hosh_Pak) && (ORCREPLACEHOSHPAK == FALSE))
		{
			Wld_InsertNpc(orkelite_addon4s,"FP_CAMPFIRE_HOSHPAK_01");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HOSHPAK_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_01");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_03");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_04");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_05");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_06");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_07");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ORCBOWER_32");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ORCBOWER_33");
			Wld_InsertNpc(orkelite_addon3_chkflg_25,"FP_ROAM_ORKFLAG_25");
			ORCREPLACEHOSHPAK = TRUE;
		};

		Wld_InsertNpc(Shadowbeast_Skeleton,"FP_SLEEP_OW_MOLERAT_02_01");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E1_06");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E2_07");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E2_08");
		Wld_InsertNpc(DMT_DementorAmbient,"DT_E1_05");
		Wld_InsertNpc(DMT_DementorAmbient,"DT");
		Wld_InsertNpc(DMT_DementorAmbient,"OW_PATH_133");
		Wld_InsertNpc(DMT_DementorAmbient,"OW_PATH_128");
		Wld_InsertNpc(DMT_DementorAmbient,"WP_COAST_SWAMPWAY_17");
		Wld_InsertNpc(DMT_DementorAmbient,"WP_COAST_SWAMPWAY_17");

		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E1_03");
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E2_09");
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E2_05");
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E2_06");
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E3_04");
			Wld_InsertNpc(DMT_DementorAmbient,"DT_E3_05");
			Wld_InsertNpc(DMT_DementorAmbient,"WP_COAST_SWAMPWAY_17");
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
		{
			Wld_InsertItem(ItMi_RuneBlank,"FP_ITEM_XARDASALTERTURM_02");
		}
		else
		{
			Wld_InsertItem(ItMi_Nugget,"FP_ITEM_XARDASALTERTURM_02");
		};

		EnterOW_Kapitel3 = TRUE;
	};
};


var int EnterOW_Kapitel4;

func void B_ENTER_OLDWORLD_Kapitel_4()
{
	if(EnterOW_Kapitel4 == FALSE)
	{
		if(Npc_IsDead(Engrom) == FALSE)
		{
			CreateInvItems(VLK_4131_Engrom,ItAt_TalbinsLurkerSkin,1);
			B_StartOtherRoutine(VLK_4131_Engrom,"Obsessed");

			if(hero.guild == GIL_KDF)
			{
				CreateInvItems(Engrom,ITWR_DementorObsessionBook_MIS,1);
			}
			else
			{
				B_KillNpc(Engrom);
			};

			EngromIsGone = TRUE;
		};
		B_RemoveNpc(STRF_1115_Geppert);
		B_RemoveNpc(STRF_1116_Kervo);

		B_StartOtherRoutine(VLK_4106_Dobar,"OutCastel");
		CreateInvItems(VLK_4106_Dobar,ItMi_sNugget,1);
		B_KillNpc(VLK_4106_Dobar);

		if(Npc_IsDead(VLK_4107_Parlaf) == FALSE)
		{
			B_StartOtherRoutine(VLK_4107_Parlaf,"OutCastel");
			CreateInvItems(VLK_4107_Parlaf,ItMi_sNugget,1);
		};
		if(Npc_IsDead(Sengrath) == FALSE)
		{
			B_StartOtherRoutine(Sengrath,"ORCBARRIER");
			B_ClearNpcInventory(Sengrath);
			B_CreateAmbientInv(Sengrath);

			if(Npc_HasItems(Sengrath,ItRw_Mil_Crossbow))
			{
				Npc_RemoveInvItem(Sengrath,ItRw_Mil_Crossbow);
			};

			CreateInvItems(Sengrath,ItRw_SengrathsArmbrust_MIS,1);
			Sengrath_Missing = TRUE;
			B_KillNpc(Sengrath);
		};

		Wld_InsertNpc(DJG_730_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_730_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_731_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_731_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_732_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_732_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_733_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_733_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_734_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_734_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_735_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_735_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_736_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_736_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_737_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_737_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_738_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_738_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_739_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_739_ToterDrachenjaeger);
		Wld_InsertNpc(DJG_740_ToterDrachenjaeger,"OC1");
		B_KillNpc(DJG_740_ToterDrachenjaeger);
		Wld_InsertNpc(Meatbug_Brutus1,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus2,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus3,"OC_FOLTER_SHARP");
		Wld_InsertNpc(Meatbug_Brutus4,"OC_FOLTER_SHARP");
		Wld_InsertNpc(DJG_700_Sylvio,"OC1");
		Wld_InsertNpc(DJG_709_Rethon,"OC1");
		Wld_InsertNpc(DJG_714_Jan,"OC1");
		Wld_InsertNpc(DJG_715_Ferros,"OC1");
		Wld_InsertNpc(DJG_708_Kurgan,"OC1");
		Wld_InsertNpc(DJG_710_Kjorn,"OC1");
		Wld_InsertNpc(DJG_711_Godar,"OC1");
		Wld_InsertNpc(DJG_712_Hokurn,"OC1");
		Wld_InsertNpc(DJG_713_Biff,"OC1");
		B_StartOtherRoutine(Brutus,"Meatbugs");

		if(SLD_Bullco_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_701_Bullco,"OC1");
		};
		if(SLD_Rod_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_702_Rod,"OC1");
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
		};
		if(SLD_Cipher_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_703_Cipher,"OC1");
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
		};
		if(SLD_Gorn_is_alive == TRUE)
		{
			Wld_InsertNpc(PC_Fighter_DJG,"OC1");
		};
		if((ANGARISDEAD == FALSE) && (ANGAROWFLAG == FALSE))
		{
			B_StartOtherRoutine(DJG_Angar,"PRESTART");
		};
		if((DARKMAGE_ISDEAD == TRUE) && (ORCREFRESHHRAMCLEAR == FALSE))
		{
			B_RemoveNpc(orc_8500_warrior);
			B_RemoveNpc(orc_8502_warrior);
			B_RemoveNpc(orc_8503_warrior);
			B_RemoveNpc(orc_8504_elite);
			B_RemoveNpc(orc_8505_elite);
			B_RemoveNpc(orc_8507_shaman);
			B_RemoveNpc(orc_8508_shaman);
			B_RemoveNpc(orc_8509_shaman);
			B_RemoveNpc(orc_8510_warrior);
			B_RemoveNpc(orc_8511_warrior);
			B_RemoveNpc(orc_8512_warrior);
			B_RemoveNpc(orc_8513_warrior);
			ORCREFRESHHRAMCLEAR = TRUE;
		};
		if(Npc_IsDead(OrcShaman_Hosh_Pak) && (ORCREPLACEHOSHPAK == FALSE))
		{
			Wld_InsertNpc(orkelite_addon4s,"FP_CAMPFIRE_HOSHPAK_01");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HOSHPAK_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_01");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_03");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_04");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_05");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_06");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HOSHPAK_07");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ORCBOWER_32");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ORCBOWER_33");
			Wld_InsertNpc(orkelite_addon3_chkflg_25,"FP_ROAM_ORKFLAG_25");
			ORCREPLACEHOSHPAK = TRUE;
		};

		Wld_InsertNpc(orkelite_addon2,"OW_NEWMINE_02");
		Wld_InsertNpc(OrcShaman_Sit,"OW_NEWMINE_10");
		Wld_InsertNpc(orkelite_addon2,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcShaman_Sit,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_06");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_03");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_LOCATION_23_CAVE_03");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_LOCATION_23_CAVE_02");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_LOCATION_23_CAVE_01");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_FOR");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_FOR1");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_FOR2");
		Wld_InsertNpc(orkelite_addon1,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_02");
		Wld_InsertNpc(orkelite_addon2,"FP_CAMPFIRE_OW_WOLF_WOODRUIN_02");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_OW_WOLF_WOODRUIN");
		Wld_InsertNpc(orkelite_addon1,"FP_CAMPFIRE_OW_WOLF_WOODRUIN2_01");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_OW_WOLF_WOODRUIN2");
		Wld_InsertNpc(orkelite_addon2,"FP_CAMPFIRE_OW_WOLF_WOODRUIN2_1");

		//Респаун орков

		if(FLAG_ORCS_CHK_01 == TRUE)
		{
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_171");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_173");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_175");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_177");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_179");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_180");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_318");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_25");
			FLAG_ORCS_CHK_01 = FALSE;
		};
		if(FLAG_ORCS_CHK_02 == TRUE)
		{
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_COAST_ORC_02O");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_COAST_ORC_02J");
			Wld_InsertNpc(OrcElite_Rest,"FP_STAND_COAST_ORC_02H");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_COAST_ORC_02M");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_02F");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_COAST_ORC_05A");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_05B");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_COAST_ORC_05");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_COAST_ORC_01");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_02C");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_COAST_ORC_02");
			Wld_InsertNpc(OrcWarrior_Rest,"WP_COAST_PATH_06");
			Wld_InsertNpc(OrcElite_Rest,"FP_STAND_COAST_ORK_07");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_COAST_ORC_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_COAST_ORC_01A");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_COAST_ORC_01C");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_COAST_ORC_01B");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_06");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_03");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_02D");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_ORC_02E");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_COAST_ORK_04");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_39");
			FLAG_ORCS_CHK_02 = FALSE;
		};
		if(FLAG_ORCS_CHK_03 == TRUE)
		{
			Wld_InsertNpc(orcwarrior4,"WP_COAST_FOREST_125");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_COAST_LOOKPOST_01");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_COAST_LOOKPOST_10");
			Wld_InsertNpc(orcelite_drink,"FP_STAND_COAST_LOOKPOST_12");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_COAST_LOOKPOST_04");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_LOOKPOST_06");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_COAST_LOOKPOST_14");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_COAST_LOOKPOST_16");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_COAST_05");
			Wld_InsertNpc(OrcElite_Rest,"FP_STAND_COAST_LOOKPOST_17");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_COAST_COAST_01");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_COAST_COAST_03");
			FLAG_ORCS_CHK_03 = FALSE;
		};
		if(FLAG_ORCS_CHK_04 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_29");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_293");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_289");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_294");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_291");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_296");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_288");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_158");
			FLAG_ORCS_CHK_04 = FALSE;
		};
		if(FLAG_ORCS_CHK_06 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_28");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_298");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SIEGEORCS_300");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_303");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SIEGEORCS_305");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_307");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SIEGEORCS_309");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_311");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SIEGEORCS_313");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SIEGEORCS_315");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_160");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_162");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_164");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_166");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORK_OC_168");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORK_OC_170");
			FLAG_ORCS_CHK_06 = FALSE;
		};
		if((FLAG_ORCS_CHK_08 == TRUE) && (FLAG_ORCS_CHK_09 == TRUE))
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_41");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_02");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_04");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_06");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_MOUNT_ORC_08");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_10");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_12");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_14");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_16");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_18");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_20");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_22");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_24");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_26");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_28");
			Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_MOUNT_ORC_30");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_MOUNT_ORC_54");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_33");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_35");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_37");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_MOUNT_ORC_39");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_40");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_MOUNT_ORC_42");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_44");
			Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_MOUNT_ORC_46");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_MOUNT_ORC_48");
			Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_MOUNT_ORC_50");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_MOUNT_ORC_52");
			FLAG_ORCS_CHK_08 = FALSE;
			FLAG_ORCS_CHK_09 = FALSE;
		};
		if(FLAG_ORCS_CHK_11 == TRUE)
		{
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_192");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_186");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_188");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_190");
			FLAG_ORCS_CHK_11 = FALSE;
		};
		if(FLAG_ORCS_CHK_13 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_37");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_106");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_104");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_102");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_100");
			FLAG_ORCS_CHK_13 = FALSE;
		};
		if(FLAG_ORCS_CHK_15 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_07");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_44");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_10");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_CAMPFIRE_ORK_OC_09");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_31");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_13");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_246");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_20");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_10");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_CAMPFIRE_ORK_OC_97");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_37");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_14");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_35");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_18");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_235");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_19");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_239");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_20");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_241");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_223");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_227");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_221");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_22");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_25");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_220");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_243");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_248");
			FLAG_ORCS_CHK_15 = FALSE;
		};
		if(FLAG_ORCS_CHK_17 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_02");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_59");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_61");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_171");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_64");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_65");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_67");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_68");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_55");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_178");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_56");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_72");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_73");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_75");
			FLAG_ORCS_CHK_17 = FALSE;
		};
		if(FLAG_ORCS_CHK_19 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_01");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_15");
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_43");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_157");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_159");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_77");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_145");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_146");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORKFLAG_19");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_78");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_141");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_150");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_80");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_79");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_132");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_153");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_82");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_124");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_84");
			FLAG_ORCS_CHK_19 = FALSE;
		};
		if(FLAG_ORCS_CHK_21 == TRUE)
		{
			Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_ORCBOWER_12");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_121");
			Wld_InsertNpc(orkelite_addon1_si,"FP_CAMPFIRE_ORK_OC_120");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_126");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_128");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_108");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_106");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_105");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_104");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_101");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_129");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_131");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_99");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_90");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_CAMPFIRE_ORK_OC_18");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_SIEGEORCS_93");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_ORK_OC_135");
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_136");
			FLAG_ORCS_CHK_21 = FALSE;
		};
		if(FLAG_ORCS_CHK_23 == TRUE)
		{
			Wld_InsertNpc(orkelite_addon1_si,"FP_ROAM_ORK_OC_147");
			Wld_InsertNpc(orcwarrior_roam_si,"FP_ROAM_SIEGEORCS_76");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_SIEGEORCS_70");
			Wld_InsertNpc(orkelite_addon3,"FP_ROAM_SIEGEORCS_71");
			Wld_InsertNpc(orkelite_addon3,"FP_ROAM_SIEGEORCS_72");
			Wld_InsertNpc(orkelite_addon3,"FP_ROAM_SIEGEORCS_73");
			FLAG_ORCS_CHK_23 = FALSE;
		};
		if(FLAG_ORCS_CHK_25 == TRUE)
		{
			Wld_InsertNpc(orkelite_addon4s,"FP_CAMPFIRE_HOSHPAK_01");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HOSHPAK_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HOSHPAK_04");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_05");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HOSHPAK_06");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ORCBOWER_32");
			FLAG_ORCS_CHK_25 = FALSE;
		};

		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_07");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_09");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_13");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_15");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_19");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_21");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_25");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_27");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_31");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_33");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_37");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_39");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_43");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_45");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_49");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_51");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_55");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_59");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_61");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_63");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_67");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_69");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_73");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_75");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_79");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_81");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_85");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_87");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_91");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_93");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_97");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_99");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_103");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_105");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_109");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_111");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_113");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_115");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_119");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_121");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_125");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_127");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_133");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_135");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_139");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_141");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_145");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_147");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_151");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_153");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_157");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_159");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_163");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_165");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_169");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_171");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_175");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_177");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_181");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_183");
		Wld_InsertNpc(Draconian,"FP_ROAM_DRACONIAN_187");

		Wld_InsertItem(ItSc_Firestorm,"FP_ROAM_OW_ROCK_DRACONIAN_07_2");
		Wld_InsertItem(ItMi_ChestGold,"FP_ROAM_ITEM_SPECIAL_03");
		Wld_InsertItem(ItMi_ChaliceGold,"FP_ROAM_MC_04");
		Wld_InsertItem(ItRw_Bow_H_02,"FP_ROAM_ITEM_SPECIAL_01");
		Wld_InsertItem(ItMi_KerolothsGeldbeutel_MIS,"FP_OC_KEROLOTHS_GELDBEUTEL");
		Wld_InsertItem(ItFo_Wine,"FP_ITEM_COASTBASE_01");
		Wld_InsertItem(ItPo_Health_Addon_04,"FP_ITEM_COASTBASE_04");
		Wld_InsertItem(ItSc_Thunderstorm,"FP_ITEM_COASTBASE_05");
		Wld_InsertItem(ItFo_Wine,"FP_ITEM_OWC_01");
		Wld_InsertItem(ItSc_PalDestroyEvil,"FP_ITEM_OWC_02");
		Wld_InsertItem(ItFo_Wine,"FP_ITEM_OWC_03");
		Wld_InsertItem(ItFo_Apple,"FP_ITEM_OWC_04");
		Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_OWC_05");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_OWC_06");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_OWC_07");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_OWC_08");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_OWC_09");
		Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_OWC_10");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_OWC_11");
		Wld_InsertItem(ItPl_SwampHerb,"FP_ROAM_OW_SNAPPER_INCAVE_DM3");
		Wld_InsertItem(ItPl_Mushroom_02,"FP_ROAM_MC_08");
		Wld_InsertItem(ItPl_Mushroom_01,"FP_ITEM_OWC_12");
		Wld_InsertItem(ItPl_Mushroom_01,"FP_ITEM_OWC_13");
		Wld_InsertItem(ItPl_Mushroom_02,"FP_ITEM_OWC_14");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_OWC_15");
		Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_OWC_16");
		Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_OWC_17");
		Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_OWC_18");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_OWC_19");
		Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_OWC_20");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_OWC_21");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_OWC_22");
		Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_OWC_23");
		Wld_InsertItem(ItSc_PalLightHeal,"FP_ITEM_OWC_24");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_OWC_25");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_OWC_26");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_OWC_27");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_OWC_28");
		Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_OWC_29");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_OWC_30");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_OWC_31");
		Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_OWC_32");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_OWC_33");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_OWC_34");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_OWC_35");
		Wld_InsertItem(ItPl_Forestberry,"FP_ITEM_OWC_36");
		Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_OWC_37");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_OWC_38");
		Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_OWC_39");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_OWC_40");
		Wld_InsertItem(ItPl_Forestberry,"FP_ROAM_CSFP_05");
		Wld_InsertItem(ItPl_Health_Herb_02,"FP_ROAM_OW_BLOODHOUND_CANYONCAVE3");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ROAM_OW_SCAVENGER_WOOD05_05");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_SLEEP_OW_MOLERAT_CAVE1_OC1");
		Wld_InsertItem(ItPl_Forestberry,"FP_ROAM_OW_WARAN_05_08");
		Wld_InsertItem(ItPl_Blueplant,"FP_ROAM_SCAVENGER_01");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ROAM_OW_SCAVENGER_INWALD_OC7");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ROAM_OW_MOLERAT_WALD_OC2");
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ROAM_OW_BLOODFLY_WALD_OC5");
		Wld_InsertItem(ItSc_LightningFlash,"FP_ROAM_ITEM_SPECIAL_04");
		Wld_InsertItem(ItPl_Health_Herb_02,"FP_OW_ITEM_01");
		MIS_Dragonhunter = LOG_Running;
		Log_CreateTopic(TOPIC_Dragonhunter,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Dragonhunter,LOG_Running);
		B_LogEntry(TOPIC_Dragonhunter,"Началась охота на драконов и она должна заманить в рудниковую долину больших авантюристов. Я могу только надеяться, что они не встанут у меня на пути. ");
		EnterOW_Kapitel4 = TRUE;
	};
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		B_KillNpc(VLK_4130_Talbin);
		Wld_InsertNpc(DragonSnapper,"START");
		Talbin_FollowsThroughPass = LOG_FAILED;
	}
	else if(Talbin_FollowsThroughPass == LOG_SUCCESS)
	{
		B_RemoveNpc(VLK_4130_Talbin);
	};
};

var int EnterOW_Kapitel5;

func void B_ENTER_OLDWORLD_Kapitel_5()
{
	if(EnterOW_Kapitel5 == FALSE)
	{
		VLK_4143_HaupttorWache.flags = 0;
		CreateInvItems(VLK_4143_HaupttorWache,itke_oc_maingate_mis,1);

		B_StartOtherRoutine(XBS_7510_RATFORD,"Base");
		B_StartOtherRoutine(XBS_7509_DRAX,"Base");

		if((Npc_IsDead(Brutus) == FALSE) && (DarkPathStart == FALSE))
		{
			CreateInvItems(VLK_4100_Brutus,ITWR_DementorObsessionBook_MIS,1);
		};
		if(Npc_IsDead(Dragon_Swamp))
		{
			Wld_InsertNpc(Troll_Black,"OW_SWAMPDRAGON_01");
		};
		if(Npc_IsDead(Dragon_Rock))
		{
			Wld_InsertNpc(Troll_Black,"OW_ROCKDRAGON_11");
		};
		if((DARKMAGE_ISDEAD == TRUE) && (ORCREFRESHHRAM == FALSE))
		{
			B_RemoveNpc(orc_8500_warrior);
			B_RemoveNpc(orc_8502_warrior);
			B_RemoveNpc(orc_8503_warrior);
			B_RemoveNpc(orc_8504_elite);
			B_RemoveNpc(orc_8505_elite);
			B_RemoveNpc(orc_8507_shaman);
			B_RemoveNpc(orc_8508_shaman);
			B_RemoveNpc(orc_8509_shaman);
			B_RemoveNpc(orc_8510_warrior);
			B_RemoveNpc(orc_8511_warrior);
			B_RemoveNpc(orc_8512_warrior);
			B_RemoveNpc(orc_8513_warrior);

			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HRAMORC_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_03");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_05");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_06");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_07");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_08");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_09");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HRAMORC_10");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_11");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_12");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_13");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_14");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_15");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_16");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HRAMORC_17");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_18");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_19");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_20");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_21");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_22");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_23");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_24");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_25");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_26");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_HRAMORC_27");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_28");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_HRAMORC_29");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_HRAMORC_30");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HRAMORC_01");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HRAMORC_02");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HRAMORC_03");
			Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_HRAMORC_04");
			Wld_InsertNpc(orkelite_addon3_chkflg_24,"FP_ROAM_ORKFLAG_24");
			ORCREFRESHHRAM = TRUE;
		};
		if((Npc_IsDead(DJG_700_Sylvio) == FALSE) && (SylvioCampUp == FALSE))
		{
			Wld_InsertNpc(DJG_7300_ToterDrachenjaeger,"OW_ICEDRAGON_12");
			Wld_InsertNpc(DJG_7302_ToterDrachenjaeger,"OW_ICEDRAGON_03");
			Wld_InsertNpc(DJG_7304_ToterDrachenjaeger,"OW_ICEDRAGON_05");
			Wld_InsertNpc(DJG_7305_ToterDrachenjaeger,"OW_ICEDRAGON_23");
			Wld_InsertNpc(DJG_7306_ToterDrachenjaeger,"OW_ICEDRAGON_24");
			Wld_InsertNpc(DJG_7307_ToterDrachenjaeger,"OW_ICEDRAGON_09");
			Wld_InsertNpc(DJG_7308_ToterDrachenjaeger,"OW_ICEREGION_47");
			Wld_InsertNpc(DJG_7309_ToterDrachenjaeger,"ICEDRAGON");
			Wld_InsertNpc(DJG_7310_ToterDrachenjaeger,"OW_ICEREGION_DAM");
			Wld_InsertNpc(DJG_7311_ToterDrachenjaeger,"OW_ICEREGION_38");
			B_StartOtherRoutine(DJG_700_Sylvio,"GoldCamp");
			B_StartOtherRoutine(DJG_701_Bullco,"Bastard");
			B_KillNpc(DJG_701_Bullco);
			Wld_InsertNpc(DragonSnapper,"OW_PATH_246");
			Wld_InsertNpc(Orc_Silvio_01,"FP_ROAM_DRACONIAN_59");
			Wld_InsertNpc(Orc_Silvio_02,"FP_ROAM_DRACONIAN_56");
			B_KillNpc(Orc_Silvio_01);
			B_KillNpc(Orc_Silvio_02);
			SylvioCampUp = TRUE;
		}
		else
		{
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_40");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_42");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_44");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_45");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_46");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_48");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_50");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_52");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_54");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_56");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_58");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_60");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_62");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_64");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_66");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_68");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_70");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_72");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_74");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_76");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_78");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_80");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_82");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_84");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_86");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_88");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_90");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_92");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_94");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_96");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_98");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_100");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_102");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_104");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_106");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_108");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_112");
		};

		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_05");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_10");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_14");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_18");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_22");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_26");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_30");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_34");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_38");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_114");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_118");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_122");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_126");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_130");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_134");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_138");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_142");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_146");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_150");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_154");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_158");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_162");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_166");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_170");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_174");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_178");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_182");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_186");
		Wld_InsertNpc(orkelite_addon2,"PLATEAU_ROUND01");
		Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE");
		Wld_InsertNpc(orkelite_addon1,"LOCATION_18_OUT");
		Wld_InsertNpc(orkelite_addon1,"PATH_TO_PLATEAU04");
		Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04_SMALLPATH");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ROCK_DRACONIAN_09_1");
		Wld_InsertNpc(orkelite_addon1,"PLATEAU_ROUND07");
		Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_01");
		Wld_InsertNpc(orkelite_addon1,"PATH_TO_PLATEAU04_BRIDGE2");
		Wld_InsertNpc(orkelite_addon1,"LOCATION_19_03_PATH_RUIN5");
		Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PATH_RUIN11");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_SWAMP_13_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_15_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_16_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_4_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_6_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_9_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_ENTRANCE_01");
		Wld_InsertNpc(orkelite_addon2,"SPAWN_OW_WARAN_NC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_8");
		Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_18");
		Wld_InsertNpc(orkelite_addon1,"CASTLE_22");
		Wld_InsertNpc(orkelite_addon1,"CASTLE_28");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_012");
		Wld_InsertNpc(orkelite_addon1,"OW_ROCKDRAGON_03");
		Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_ROOM3");
		Wld_InsertNpc(orkelite_addon1,"LOCATION_19_03_SECOND_ETAGE6");
		Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_HARPYE4");
		Wld_InsertNpc(orkelite_addon1,"LOCATION_19_03_SECOND_ETAGE_BALCON2");
		Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PENTAGRAMM");
		Wld_InsertNpc(orkelite_addon1,"MOVEMENT_OW_BLOODFLYS_152");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_BLOODFLY_A_1");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ROCK_DRACONIAN_07");
		Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE_MOVE");
		Wld_InsertNpc(Skeleton,"OW_MINE3_05");
		Wld_InsertNpc(Skeleton,"OW_MINE3_08");
		Wld_InsertNpc(Skeleton_Lord,"OW_MINE3_LEICHE_02");
		Wld_InsertNpc(Skeleton,"OW_MINE3_LEICHE_03");
		EnterOW_Kapitel5 = TRUE;
	};
	if(Biff_FollowsThroughPass == LOG_SUCCESS)
	{
		B_RemoveNpc(DJG_713_Biff);
	};
};


var int EnterOW_Kapitel6;
var int XarUnit;

func void B_ENTER_OLDWORLD_Kapitel_6()
{
	if(EnterOW_Kapitel6 == FALSE)
	{
		B_RemoveNpc(VLK_4148_Gestath);
		B_RemoveNpc(DJG_705_Angar);
		B_RemoveNpc(PAL_262_Wache);
		B_RemoveNpc(PAL_263_Wache);
		B_RemoveNpc(PAL_256_Ritter);
		B_RemoveNpc(PAL_258_Keroloth);
		B_RemoveNpc(PAL_265_Ritter);
		B_RemoveNpc(PAL_266_Ritter);
		B_RemoveNpc(PAL_270_Ritter);
		B_RemoveNpc(PAL_271_Ritter);
		B_RemoveNpc(PAL_274_Ritter);
		B_RemoveNpc(VLK_4144_Waffenknecht);
		B_RemoveNpc(DJG_701_Bullco);
		B_RemoveNpc(STRF_1106_Fed);
		B_RemoveNpc(STRF_1104_Straefling);
		B_RemoveNpc(STRF_1105_Straefling);
		B_RemoveNpc(STRF_1110_Straefling);
		B_RemoveNpc(STRF_1111_Straefling);
		B_RemoveNpc(STRF_1112_Straefling);
		B_RemoveNpc(STRF_1113_Straefling);
		B_RemoveNpc(STRF_1114_Straefling);
		B_RemoveNpc(VLK_4120_Bilgot);
		B_KillNpc(DJG_714_Jan);
		B_KillNpc(DJG_715_Ferros);
		B_KillNpc(DJG_709_Rethon);
		B_KillNpc(VLK_4100_Brutus);
		B_KillNpc(STRF_1100_Straefling);
		B_KillNpc(STRF_1101_Draal);
		B_KillNpc(STRF_1102_Straefling);
		B_KillNpc(STRF_1103_Straefling);
		B_KillNpc(PAL_261_Gerold);
		B_KillNpc(PAL_254_Wache);
		B_KillNpc(PAL_255_Ritter);
		B_KillNpc(PAL_267_Sengrath);
		B_KillNpc(PAL_264_Ritter);
		B_RemoveNpc(PAL_260_Tandor);
		B_KillNpc(PAL_269_Ritter);
		B_KillNpc(PAL_272_Ritter);
		B_KillNpc(VLK_4101_Waffenknecht);
		B_KillNpc(VLK_4102_Waffenknecht);
		B_KillNpc(VLK_4103_Waffenknecht);
		B_KillNpc(VLK_4104_Waffenknecht);
		B_KillNpc(VLK_4105_Waffenknecht);
		B_RemoveNpc(VLK_4108_Engor);
		B_KillNpc(VLK_4109_Waffenknecht);
		B_KillNpc(VLK_4140_Waffenknecht);
		B_KillNpc(VLK_4141_Waffenknecht);
		B_KillNpc(VLK_4142_Waffenknecht);
		B_KillNpc(VLK_4143_HaupttorWache);
		B_KillNpc(VLK_4145_Waffenknecht);
		B_KillNpc(VLK_4146_Waffenknecht);
		B_KillNpc(VLK_4147_Waffenknecht);
		B_KillNpc(PAL_273_Ritter);
		B_KillNpc(STRF_1108_Straefling);
		B_KillNpc(STRF_1109_Straefling);
		B_KillNpc(PAL_259_Wache);
		B_KillNpc(VLK_4111_Grimes);
		B_KillNpc(STRF_1117_Straefling);
		B_KillNpc(Pal_218_Ritter);
		B_KillNpc(Pal_219_Ritter);
		B_KillNpc(VLK_4110_Jergan);
		B_KillNpc(PAL_2004_Bruder);
		B_KillNpc(VLK_4112_Den);
		B_KillNpc(PAL_2006_Leiche);
		B_KillNpc(PAL_2007_Leiche);
		B_KillNpc(PAL_281_Fajeth);
		B_KillNpc(PAL_280_Tengron);
		B_KillNpc(vlk_7527_waffenknecht);

		B_StartOtherRoutine(vlk_7525_waffenknecht,"Dead");
		B_StartOtherRoutine(vlk_7526_waffenknecht,"Dead");
		B_StartOtherRoutine(vlk_7531_waffenknecht,"Dead");
		B_KillNpc(vlk_7525_waffenknecht);
		B_KillNpc(vlk_7526_waffenknecht);
		B_KillNpc(vlk_7531_waffenknecht);
		B_KillNpc(VLK_4106_Dobar);
		B_KillNpc(VLK_4107_Parlaf);

		B_StartOtherRoutine(PC_Mage_OW,"TOT");
		B_StartOtherRoutine(PC_Fighter_OW,"TOT");

		if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_702_Rod,"ONDCamp");
		};
		if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_703_Cipher,"ONDCamp");
		};
		if(!Npc_IsDead(DJG_710_Kjorn))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_710_Kjorn,"START");
		};
		if(!Npc_IsDead(DJG_711_Godar))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_711_Godar,"START");
		};
		if(!Npc_IsDead(DJG_712_Hokurn))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_712_Hokurn,"START");
		};
		if(!Npc_IsDead(DJG_708_Kurgan))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_708_Kurgan,"START");
		};
		if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
		{
			KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG + 1;
			B_StartOtherRoutine(DJG_713_Biff,"START");
		};
		if(!Npc_IsDead(PAL_217_Marcos))
		{
			B_StartOtherRoutine(PAL_217_Marcos,"PalOut");
		};
		if(!Npc_IsDead(pal_7523_albert))
		{
			B_StartOtherRoutine(pal_7523_albert,"PalOut");
		};
		if(!Npc_IsDead(pal_7518_ritter))
		{
			B_StartOtherRoutine(pal_7518_ritter,"PalOut");
		};
		if(!Npc_IsDead(pal_7519_ritter))
		{
			B_StartOtherRoutine(pal_7519_ritter,"PalOut");
		};
		if(!Npc_IsDead(pal_7520_ritter))
		{
			B_StartOtherRoutine(pal_7520_ritter,"PalOut");
		};
		if(!Npc_IsDead(pal_7521_ritter))
		{
			B_StartOtherRoutine(pal_7521_ritter,"PalOut");
		};
		if(!Npc_IsDead(pal_7522_ritter))
		{
			B_StartOtherRoutine(pal_7522_ritter,"PalOut");
		};
		if(!Npc_IsDead(pal_7524_ritter))
		{
			B_StartOtherRoutine(pal_7524_ritter,"PalOut");
		};
		if(!Npc_IsDead(PAL_253_Wache) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			B_StartOtherRoutine(PAL_253_Wache,"PalOut");
		}
		else
		{
			B_KillNpc(PAL_253_Wache);
		};
		if(!Npc_IsDead(PAL_257_Ritter) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			B_StartOtherRoutine(PAL_257_Ritter,"PalOut");
		}
		else
		{
			B_KillNpc(PAL_257_Ritter);
		};
		if(MIS_MADERZ == LOG_SUCCESS)
		{
			if(!Npc_IsDead(pal_9165_ritter))
			{
				B_StartOtherRoutine(pal_9165_ritter,"PalOut");
			};
			if(!Npc_IsDead(pal_9166_ritter))
			{
				B_StartOtherRoutine(pal_9166_ritter,"PalOut");
			};
			if(!Npc_IsDead(pal_9167_ritter))
			{
				B_StartOtherRoutine(pal_9167_ritter,"PalOut");
			};
			if(!Npc_IsDead(none_116_mud))
			{
				B_StartOtherRoutine(none_116_mud,"Dead");
				B_KillNpc(none_116_mud);
			};
		};
		if(!Npc_IsDead(PAL_250_Garond))
		{
			B_StartOtherRoutine(PAL_250_Garond,"Cage");
		};
		if(!Npc_IsDead(PAL_251_Oric))
		{
			B_StartOtherRoutine(PAL_251_Oric,"Cage");
		};
		if(!Npc_IsDead(PAL_252_Parcival))
		{
			B_StartOtherRoutine(PAL_252_Parcival,"Cage");
		};
		if(!Npc_IsDead(PAL_268_Udar))
		{
			B_StartOtherRoutine(PAL_268_Udar,"Cage");
		};
		if((Talbin_FollowsThroughPass != LOG_FAILED) || (Talbin_FollowsThroughPass != LOG_SUCCESS))
		{
			B_KillNpc(VLK_4130_Talbin);
		};
		if(MIS_OCCOOKFLEE != LOG_SUCCESS)
		{
			B_KillNpc(STRF_1107_Straefling);
		};
		if(!Npc_IsDead(NONE_110_Urshak) && (URSHAKBECOMESHAMAN == TRUE))
		{
			B_StartOtherRoutine(NONE_110_Urshak,"OrcAtc");
		};
		if((SylvioCampUp == TRUE) && (MIS_SylvioCrew != LOG_Success))
		{
			B_KillNpc(DJG_700_Sylvio);
			B_KillNpc(DJG_7300_ToterDrachenjaeger);
			B_KillNpc(DJG_7301_ToterDrachenjaeger);
			B_KillNpc(DJG_7302_ToterDrachenjaeger);
			B_KillNpc(DJG_7303_ToterDrachenjaeger);
			B_KillNpc(DJG_7304_ToterDrachenjaeger);
			B_KillNpc(DJG_7305_ToterDrachenjaeger);
			B_KillNpc(DJG_7306_ToterDrachenjaeger);
			B_KillNpc(DJG_7307_ToterDrachenjaeger);
			B_KillNpc(DJG_7308_ToterDrachenjaeger);
			B_KillNpc(DJG_7309_ToterDrachenjaeger);
			B_KillNpc(DJG_7310_ToterDrachenjaeger);
			B_KillNpc(DJG_7311_ToterDrachenjaeger);
			B_KillNpc(DJG_7312_ToterDrachenjaeger);

			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_40");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_42");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_44");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_45");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_46");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_48");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_50");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_52");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_54");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_56");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_58");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_60");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_62");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_64");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_66");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_68");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_70");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_72");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_74");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_76");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_78");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_80");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_82");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_84");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_86");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_88");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_90");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_92");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_94");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_96");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_98");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_100");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_102");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_104");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_106");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_108");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_112");
		};

		Wld_InsertNpc(pal_9168_natan,"OC_PALADIN_OUT_12");
		Wld_InsertNpc(orcwarrior_roam_forest_01,"FP_ROAM_COAST_BASE_ORCATC_01");
		Wld_InsertNpc(orcwarrior_roam_forest_02,"FP_ROAM_COAST_BASE_ORCATC_02");
		Wld_InsertNpc(orcwarrior_roam_forest_03,"FP_ROAM_COAST_BASE_ORCATC_03");
		Wld_InsertNpc(orcwarrior_roam_forest_04,"FP_ROAM_COAST_BASE_ORCATC_04");
		Wld_InsertNpc(orcwarrior_roam_forest_05,"FP_ROAM_COAST_BASE_ORCATC_05");
		B_KillNpc(orcwarrior_roam_forest_01);
		B_KillNpc(orcwarrior_roam_forest_02);
		B_KillNpc(orcwarrior_roam_forest_03);
		B_KillNpc(orcwarrior_roam_forest_04);
		B_KillNpc(orcwarrior_roam_forest_05);
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TOTURIAL_CHICKEN_2");
		Wld_InsertNpc(orkelite_addon3_owchkflg_01,"FP_ROAM_TOTURIAL_CHICKEN_2_4");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_INTRO_CHICKEN_1");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_INTRO_CHICKEN_3");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_INTRO_CHICKEN_4");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_INTRO_CHICKEN_2");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_MINE2_GRIMES");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_MINE2_STRF");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_264");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_148_A");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_TALL_PATH_BANDITOS2_03");
		Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_TALL_PATH_BANDITOS2_03");
		Wld_InsertNpc(orkelite_addon2,"OW_NEWMINE_02");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_10");
		Wld_InsertNpc(orkelite_addon2,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_11");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_06");
		Wld_InsertNpc(OrcWarrior_Roam,"OW_NEWMINE_03");

		if((DARKMAGE_ISDEAD == TRUE) && (ORCREFRESHHRAMCLEAR == FALSE))
		{
			B_RemoveNpc(orc_8500_warrior);
			B_RemoveNpc(orc_8502_warrior);
			B_RemoveNpc(orc_8503_warrior);
			B_RemoveNpc(orc_8504_elite);
			B_RemoveNpc(orc_8505_elite);
			B_RemoveNpc(orc_8507_shaman);
			B_RemoveNpc(orc_8508_shaman);
			B_RemoveNpc(orc_8509_shaman);
			B_RemoveNpc(orc_8510_warrior);
			B_RemoveNpc(orc_8511_warrior);
			B_RemoveNpc(orc_8512_warrior);
			B_RemoveNpc(orc_8513_warrior);
			ORCREFRESHHRAMCLEAR = TRUE;
		};

		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_04");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_07");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_08");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_10");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_11");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_12");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_13");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_14");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_15");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_16");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_17");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_18");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_19");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_20");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_21");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_22");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_23");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_24");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_25");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_26");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_27");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_28");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_29");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_30");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_31");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_32");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_33");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_34");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_35");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_36");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_37");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_38");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_39");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_40");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_41");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_42");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_43");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_44");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_45");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_46");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_47");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_48");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_49");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_50");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_51");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_52");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_53");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_54");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_55");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_56");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_57");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_58");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_59");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_60");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OCCASTLE_ORC_61");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OCCASTLE_ORC_62");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OCCASTLE_ORCELITE_01");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_02");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_03");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_06");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_07");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_08");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_09");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_10");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_11");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_12");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_13");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_14");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_15");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OCCASTLE_ORCELITE_16");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_01");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_02");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_03");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_04");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_05");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_06");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_07");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_08");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_09");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_OCCASTLE_ORCBOWMEN_10");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_OC_OUT_01");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_OC_OUT_01");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_OC_OUT_01");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_OC_OUT_01");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_OC_KNECHTCAMP_01");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_OC_KNECHTCAMP_01");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_OC_KNECHTCAMP_01");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_OC_KNECHTCAMP_01");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_OC_CHEST_01");
		Wld_InsertNpc(orkelite_addon3r,"FP_ROAM_OCCASTLE_ORCELITELEITENANT_01");
		Wld_InsertNpc(orkelite_addon3r,"FP_ROAM_OCCASTLE_ORCELITELEITENANT_02");
		Wld_InsertNpc(orkelite_castle_01,"FP_ROAM_OCCASTLE_FLAGORC_01");
		Wld_InsertNpc(orkelite_castle_02,"FP_ROAM_OCCASTLE_FLAGORC_02");
		Wld_InsertNpc(orkelite_castle_03,"FP_ROAM_OCCASTLE_FLAGORC_03");
		Wld_InsertNpc(orkelite_castle_04,"FP_ROAM_OCCASTLE_FLAGORC_04");
		Wld_InsertNpc(orkelite_castle_05,"FP_ROAM_OCCASTLE_FLAGORC_05");
		Wld_InsertNpc(orc_8566_urhan,"FP_ROAM_OCCASTLE_ORCELITEGENERAL_01");
		Wld_InsertNpc(orcdog,"SPAWN_MOLERAT02_SPAWN01");
		Wld_InsertNpc(DragonSnapper,"SPAWN_TOTURIAL_CHICKEN_2_2");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_E_3");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_GOBBO_07_02");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_MEATBUG_04_02");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_MEATBUG_03_03");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");
		Wld_InsertNpc(DragonSnapper,"OW_SPAWN_SCAVENGER_01");
		Wld_InsertNpc(DragonSnapper,"OW_SPAWN_SCAVENGER_02");
		Wld_InsertNpc(orcdog,"OC3");
		Wld_InsertNpc(orcdog,"OW_SCAVENGER_SPAWN_TREE");
		Wld_InsertNpc(Warg,"OC4");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_AL_ORC");
		Wld_InsertNpc(Warg,"OC5");
		Wld_InsertNpc(Warg,"OC6");
		Wld_InsertNpc(BlackWolf,"SPAWN_PATH_GUARD1");
		Wld_InsertNpc(BlackWolf,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(Warg,"FP_ROAM_ORC_09");
		Wld_InsertNpc(orcdog,"FP_ROAM_ORC_08");
		Wld_InsertNpc(orcdog,"OW_PATH_103");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_WARAN_ORC_01");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_WARAN_ORC_04");
		Wld_InsertNpc(Lurker,"OW_PATH_WARAN05_SPAWN02");
		Wld_InsertNpc(orcdog,"SPAWN_O_SCAVENGER_05_02");
		Wld_InsertNpc(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(BlackWolf,"OW_PATH_099");
		Wld_InsertNpc(Warg,"SPAWN_OW_WARAN_ORC_01");
		Wld_InsertNpc(orcdog,"PATH_OC_NC_6");
		Wld_InsertNpc(orcdog,"PATH_OC_NC_4");
		Wld_InsertNpc(Gobbo_Black,"OW_SAWHUT_MEATBUG_SPAWN");
		Wld_InsertNpc(gobbo_grandwarrior,"OW_PATH_149");
		Wld_InsertNpc(gobbo_grandwarrior,"OW_PATH_150");
		Wld_InsertNpc(gobbo_grandwarrior,"OW_PATH_057");
		Wld_InsertNpc(gobbo_grandwarrior,"OW_PATH_059");
		Wld_InsertNpc(Warg,"OW_PATH_055");
		Wld_InsertNpc(Gobbo_Black,"OW_SPAWN_TRACK_LEICHE_01");
		Wld_InsertNpc(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
		Wld_InsertNpc(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");
		Wld_InsertNpc(Icewolf,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_BLOODFLY_05_07");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_BLOODFLY_05_05");
		Wld_InsertNpc(Icewolf,"FP_SLEEP_OW_BLOODFLY_05_02");
		Wld_InsertNpc(Icewolf,"FP_SLEEP_OW_BLOODFLY_05_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_3_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_3_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_4_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_10_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_12_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_12_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_11_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_14_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_17_01");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_17_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_18_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
		Wld_InsertNpc(Icewolf,"OW_ICEREGION_86");
		Wld_InsertNpc(Icewolf,"OW_ICEREGION_62");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_23_02");
		Wld_InsertNpc(Icewolf,"FP_ROAM_OW_ICEREGION_28_01");
		Wld_InsertNpc(orcdog,"OW_SCAVENGER_CAVE3_SPAWN");
		Wld_InsertNpc(orcdog,"OW_SCAVENGER_TREE_SPAWN");
		Wld_InsertNpc(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_CAVE1_OC");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_C3");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(Warg,"SPAWN_OW_SMALLCAVE01_MOLERAT");
		Wld_InsertNpc(Keiler,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
		Wld_InsertNpc(orcdog,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_WOLF_08_08");
		Wld_InsertNpc(orcdog,"OW_DEADWOOD_WOLF_SPAWN01");
		Wld_InsertNpc(Lurker,"FP_ROAM_OW_BLOODFLY_04_02_02");
		Wld_InsertNpc(Warg,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(Lurker,"OW_PATH_BLOODFLY01_SPAWN01");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLOODFLY_WOOD05_01");
		Wld_InsertNpc(Warg,"SPAWN_OW_MINICOAST_LURKER_A1");
		Wld_InsertNpc(Warg,"OW_LAKE_NC_LURKER_SPAWN01");
		Wld_InsertNpc(Lurker,"FP_CONVINCECORRISTO_KEY");
		Wld_InsertNpc(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");
		Wld_InsertNpc(orcdog,"OW_PATH_SCAVENGER12_SPAWN01");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SCAVENGER_12_07");
		Wld_InsertNpc(Warg,"OW_PATH_SCAVENGER01_SPAWN01");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
		Wld_InsertNpc(orcdog,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_WOODOLDMINE2");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_WOOD05_05");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_187");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_185");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_190");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_189");
		Wld_InsertNpc(Warg,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(Warg,"SPAWN_OW_LURKER_RIVER2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_OCWOODEND2");
		Wld_InsertNpc(Lurker,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
		Wld_InsertNpc(skeleton_knight,"OW_PATH_033_TO_CAVE5");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(Warg,"OW_PATH_205");
		Wld_InsertNpc(Warg,"OW_PATH_208");
		Wld_InsertNpc(Warg,"OW_PATH_206");
		Wld_InsertNpc(orcdog,"OW_DT_BLOODFLY_01");
		Wld_InsertNpc(FireWaran,"SPAWN_OW_WARAN_DEMON_02_01");
		Wld_InsertNpc(Lurker,"SPAWN_OW_SCAVENGER_BANDIT_02");
		Wld_InsertNpc(Gobbo_Black,"SPAWN_OW_MOLERAT_03_04");
		Wld_InsertNpc(FireWaran,"SPAWN_OW_WARAN_DEMON_01");
		Wld_InsertNpc(FireWaran,"SPAWN_OW_WARAN_EBENE2_02_05");
		Wld_InsertNpc(FireWaran,"SPAWN_OW_WARAN_EBENE_02_05");
		Wld_InsertNpc(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3");
		Wld_InsertNpc(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
		Wld_InsertNpc(SwampDrone,"FP_ROAM_SWAMP_ENTRANCE_02");
		Wld_InsertNpc(SwampDrone,"FP_ROAM_SWAMP_17_01");
		Wld_InsertNpc(Ogre,"OW_PATH_07_15_CAVE3");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_07_15");
		Wld_InsertNpc(Keiler,"OW_PATH_274_RIGHT2");
		Wld_InsertNpc(Harpie,"LOCATION_19_03_PATH_RUIN13");
		Wld_InsertNpc(Harpie,"LOCATION_19_03_PATH_RUIN15");
		Wld_InsertNpc(Harpie,"LOCATION_19_03_PATH_RUIN16");
		Wld_InsertNpc(Harpie,"LOCATION_19_03_ROOM6");
		Wld_InsertNpc(Harpie,"LOCATION_19_03_ROOM6_BARRELCHAMBER");
		Wld_InsertNpc(DemonLord,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
		Wld_InsertNpc(Harpie,"OW_ROCKDRAGON_15");
		Wld_InsertNpc(Harpie,"OW_ROCKDRAGON_14");
		Wld_InsertNpc(Harpie,"OW_ROCKDRAGON_13");
		Wld_InsertNpc(BlackWolf,"OW_PATH_SNAPPER02_SPAWN01");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SNAPPER_02_08");
		Wld_InsertNpc(Warg,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(Keiler,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(orcdog,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc(BlackWolf,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(BlackWolf,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc(BlackWolf,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(BlackWolf,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Warg,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SNAPPER_OW_ORC5");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_ORC_01");
		Wld_InsertNpc(BlackWolf,"CASTLE_2");
		Wld_InsertNpc(FireWaran,"OW_PATH_104");
		Wld_InsertNpc(BlackWolf,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(FireWaran,"CASTLE_3");
		Wld_InsertNpc(FireWaran,"CASTLE_4");
		Wld_InsertNpc(FireWaran,"OW_PATH_109");
		Wld_InsertNpc(Warg,"OW_ORC_ORCDOG_MOVEMENT_02");
		Wld_InsertNpc(BlackWolf,"OW_PATH_195");
		Wld_InsertNpc(orcdog,"OW_ORC_ORCDOG_SPAWN01");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_WOLF_02_12");
		Wld_InsertNpc(Warg,"SPAWN_OW_MOLERAT_ORC_04");
		Wld_InsertNpc(Warg,"SPAWN_OW_WOLF_NEAR_SHADOW3");
		Wld_InsertNpc(Warg,"OW_PATH_3_09");
		Wld_InsertNpc(Warg,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(FireWaran,"CASTLE_5_1");
		Wld_InsertNpc(FireWaran,"CASTLE_8_1");
		Wld_InsertNpc(Warg,"SPAWN_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc(Warg,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(orcdog,"OW_GOBBO_PLACE_SPAWN");
		Wld_InsertNpc(orcdog,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_ORC_03");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_333");
		Wld_InsertNpc(Warg,"OW_PATH_099");
		Wld_InsertNpc(Warg,"SPAWN_OW_WARAN_ORC_01");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_28");
		Wld_InsertNpc(Warg,"FP_ROAM_OW_SCAVENGER_06_06");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_06");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_05");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_22");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_11");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_03");
		Wld_InsertNpc(orcdog,"OC_PATH_02");
		Wld_InsertNpc(orcdog,"FP_ROAM_ORK_OC_24");
		Wld_InsertNpc(orcdog,"FP_ROAM_ORK_OC_02");
		Wld_InsertNpc(orcdog,"FP_ROAM_ORK_OC_16");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_01");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc(Warg,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_13");
		Wld_InsertNpc(orcdog,"FP_ROAM_ORK_OC_14");
		Wld_InsertNpc(orcdog,"FP_ROAM_WARG_OC_12");
		Wld_InsertNpc(Warg,"FP_CAMPFIRE_ORK_OC_09");
		Wld_InsertNpc(Warg,"FP_ROAM_ORK_OC_06");
		Wld_InsertNpc(Warg,"FP_ROAM_WARG_OC_14");
		Wld_InsertNpc(Warg,"OC3");
		Wld_InsertNpc(Warg,"SPAWN_OW_BLACKWOLF_02_01");
		Wld_InsertNpc(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
		Wld_InsertNpc(Shadowbeast,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc(orcdog,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc(Shadowbeast,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc(orcdog,"PATH_WALD_OC_WOLFSPAWN2");
		Wld_InsertNpc(Shadowbeast,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc(orcdog,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc(orcdog,"SPAWN_OW_SCAVENGER_INWALD_OC2");
		Wld_InsertNpc(Warg,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc(Warg,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc(orcdog,"FP_ROAM_OW_SNAPPER_OW_ORC");
		Wld_InsertNpc(orcdog,"CASTLE_2");
		Wld_InsertNpc(FireWaran,"OW_PATH_104");
		Wld_InsertNpc(orcdog,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc(orcdog,"CASTLE_3");
		Wld_InsertNpc(orcdog,"CASTLE_4");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_06");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_11");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_05");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_02_08");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_303");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCAVENGER_01_DEMONT5");
		Wld_InsertNpc(MinecrawlerWarrior,"OW_MINE3_LEFT_05");
		Wld_InsertNpc(DragonSnapper,"OW_MINE3_LEFT_07");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_117");
		Wld_InsertNpc(Harpie,"DT_E1_07");
		Wld_InsertNpc(Harpie,"DT_E1_08");
		Wld_InsertNpc(Harpie,"DT_E1_09");
		Wld_InsertNpc(orcdog,"OW_PATH_195");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_210");
		Wld_InsertNpc(FireWaran,"MT15");
		Wld_InsertNpc(DragonSnapper,"OW_ORC_LOOKOUT_2_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SHADOWBEAST_10_03");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_SCAVENGER13_SPAWN01");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_07_19");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_146");
		Wld_InsertNpc(FireWaran,"OW_PATH_182");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_SCAVENGER_01_07");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_SCAVENGER_01_06");
		Wld_InsertNpc(FireWaran,"OW_PATH_182");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_GOBBO_07_06");
		Wld_InsertNpc(FireWaran,"FP_ROAM_OW_GOBBO_07_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SNAPPER_WOOD05_02");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SCA_05_01");
		Wld_InsertNpc(orcdog,"SPAWN_OW_BLOODFLY_06_01");
		Wld_InsertNpc(Lurker,"SPAWN_OW_BLOODFLY_12");
		Wld_InsertNpc(Lurker,"FP_ROAM_OW_LURKER_NC_LAKE_02");
		Wld_InsertNpc(Lurker,"FP_ROAM_OW_LURKER_NC_LAKE_01");
		Wld_InsertNpc(Lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
		Wld_InsertNpc(FireWaran,"PLATEAU_ROUND02_CAVE");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_04");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_SCAVENGER_03_01");
		Wld_InsertNpc(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
		Wld_InsertNpc(orcdog,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc(Troll_Black,"WP_COAST_FOREST_72");
		Wld_InsertNpc(BlackWolf,"WP_COAST_SWAMPWAY_10");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_RIVER_01");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_73");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_31");
		Wld_InsertNpc(BlackWolf,"WP_COAST_SWAMPWAY_09");
		Wld_InsertNpc(Skeleton,"WP_COAST_SWAMPWAY_12");
		Wld_InsertNpc(skeleton_knight_shield,"WP_COAST_SWAMPWAY_12");
		Wld_InsertNpc(Skeleton,"WP_COAST_SWAMPWAY_12");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_FOREST_52");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_FOREST_123");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_105");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_49");
		Wld_InsertNpc(orcdog,"COAST_SCELETON_05");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_26");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_BORDER02");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_BORDER04");
		Wld_InsertNpc(Keiler,"WP_COAST_BORDER05");
		Wld_InsertNpc(Warg,"WP_COAST_BORDER07");
		Wld_InsertNpc(Warg,"WP_COAST_RIVER_02");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_SWAMPWAY_06");
		Wld_InsertNpc(Warg,"WP_COAST_FOREST_70");
		Wld_InsertNpc(FireWaran,"WP_COAST_ZOMBIE_01");
		Wld_InsertNpc(FireWaran,"WP_COAST_ZOMBIE_03");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_14");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_15");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_16");
		Wld_InsertNpc(orcdog,"WP_COAST_FOREST_17");
		Wld_InsertNpc(orcdog,"WP_COAST_CAVE_03");
		Wld_InsertNpc(orcdog,"WP_COAST_CAVE_07");
		Wld_InsertNpc(Keiler,"WP_COAST_FOREST_05");
		Wld_InsertNpc(Keiler,"WP_COAST_FOREST_127");
		Wld_InsertNpc(Warg,"WP_COAST_FOREST_124");
		Wld_InsertNpc(Warg,"WP_COAST_FOREST_99");
		Wld_InsertNpc(Warg,"WP_COAST_SWAMPWAY_13");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_SWAMPWAY_20");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_SWAMPWAY_18");
		Wld_InsertNpc(BlackWolf,"WP_COAST_FOREST_68");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_95");
		Wld_InsertNpc(BlackWolf,"WP_COAST_FOREST_92");
		Wld_InsertNpc(Keiler,"WP_COAST_FOREST_28");
		Wld_InsertNpc(Lurker,"WP_COAST_FOREST_129");
		Wld_InsertNpc(Gobbo_Black,"WP_COAST_FOREST_128");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_64");
		Wld_InsertNpc(DragonSnapper,"WP_COAST_RIVER_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_GOBBO_01_01");
		Wld_InsertNpc(Gobbo_Black,"FP_OW_GOBBO01_SPAWN01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_GOBBO_01_06");
		Wld_InsertNpc(troll_cave,"FP_ROAM_OW_BLACKTROLL");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SKEL_01");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_OW_SKEL_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_GOBBO_01_01");
		Wld_InsertNpc(DragonSnapper,"FP_OW_GOBBO01_SPAWN01");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_GOBBO_01_06");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_TROLLPARK_01");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_TROLLPARK_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_TROLLPARK_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_TROLLPARK_04");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_OW_TROLLPARK_05");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_TROLLPARK_GOBBO_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_TROLLPARK_GOBBO_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_OW_TROLLPARK_GOBBO_03");
		Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_OW_TROLLPARK_GOBBO_04");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_01");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_02");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_05");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_08");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_10");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_11");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_12");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_13");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_16");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_17");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_20");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_22");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_25");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_26");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_30");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_32");
		Wld_InsertNpc(FireWaran,"FP_ROAM_MAGICFOREST_OC_34");
		Wld_InsertNpc(FireWaran,"FP_ROAM_MAGICFOREST_OC_35");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_37");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_38");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_39");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_40");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_41");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_42");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_44");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_45");
		Wld_InsertNpc(Lurker,"FP_ROAM_MAGICFOREST_OC_49");
		Wld_InsertNpc(Lurker,"FP_ROAM_MAGICFOREST_OC_50");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_53");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_54");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_57");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_58");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_60");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_62");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_64");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_65");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_67");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_68");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_70");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_71");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_72");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_73");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_74");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_75");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_76");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_77");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_80");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_81");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_83");
		Wld_InsertNpc(Waran,"FP_ROAM_MAGICFOREST_OC_84");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_86");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_87");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_89");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_MAGICFOREST_OC_90");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_92");
		Wld_InsertNpc(Wolf,"FP_ROAM_MAGICFOREST_OC_93");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_96");
		Wld_InsertNpc(Warg,"FP_ROAM_MAGICFOREST_OC_97");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_98");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MAGICFOREST_OC_99");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_101");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_MAGICFOREST_OC_103");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_105");
		Wld_InsertNpc(Keiler,"FP_ROAM_MAGICFOREST_OC_106");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_108");
		Wld_InsertNpc(Snapper,"FP_ROAM_MAGICFOREST_OC_109");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_110");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_MAGICFOREST_OC_112");
		Wld_InsertNpc(Bloodfly,"FP_STAND_COAST_DMT03");
		Wld_InsertNpc(Bloodfly,"FP_STAND_COAST_DMT01");
		Wld_InsertNpc(Skeleton,"FP_ROAM_HIGHROCK_02");
		Wld_InsertNpc(Skeleton,"FP_ROAM_HIGHROCK_03");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_HIGHROCK_06");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_HIGHROCK_07");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_14");
		Wld_InsertNpc(Snapper,"FP_ROAM_HIGHROCK_15");
		Wld_InsertNpc(Troll,"OW_PATH_NORTHCOAST_01");
		Wld_InsertNpc(Gobbo_Black,"OW_PATH_NORTHCOAST_10");
		Wld_InsertNpc(Waran,"OW_PATH_NORTHCOAST_22");
		Wld_InsertNpc(Lurker,"OW_PATH_NORTHCOAST_24");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_NORTHCOAST_06");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_NORTHCOAST_05");
		Wld_InsertNpc(Skeleton_Speer,"OW_PATH_NORTHCOAST_18");
		Wld_InsertNpc(Spider_Mine,"OW_PATH_NORTHCOAST_14");
		EnterOW_Kapitel6 = TRUE;
	};
};

var int bumshakinserted;
var int enteroldworld_insertsouls;
var int VenzelItems;
var int DesertirIns;
var int OldworldFT;
var int NorolasIns;

func void b_enter_oldworld()
{
	var int DayNow;

	B_InitNpcGlobals();

	DayNow = Wld_GetDay();

	if((KAPITELORCATC == TRUE) && (CHANGEONETIMEKAPITALOW == FALSE))
	{
		EnterOW_Kapitel1 = TRUE;
		EnterOW_Kapitel2 = TRUE;
		EnterOW_Kapitel3 = TRUE;
		EnterOW_Kapitel4 = TRUE;

		if(EnterOW_Kapitel5 == FALSE)
		{
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_01");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_05");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_07");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_08");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_10");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_12");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_14");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_16");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_18");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_20");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_22");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_24");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_26");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_28");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_30");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_32");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_34");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_36");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_38");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_40");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_42");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_44");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_45");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_46");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_48");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_50");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_52");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_54");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_56");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_58");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_60");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_62");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_64");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_66");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_68");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_70");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_72");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_74");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_76");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_78");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_80");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_82");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_84");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_86");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_88");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_90");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_92");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_94");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_96");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_98");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_100");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_102");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_104");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_106");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_108");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_112");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_114");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_116");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_118");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_120");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_122");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_124");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_126");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_128");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_130");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_132");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_134");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_136");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_138");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_140");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_142");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_144");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_146");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_148");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_150");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_152");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_154");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_156");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_158");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_160");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_162");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_164");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_166");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_168");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_170");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_172");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_174");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_176");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_178");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_180");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_182");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_184");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_186");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_188");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_3");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_1");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_LURKER_NEARBGOBBO_2");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_4");
			Wld_InsertNpc(orkelite_addon2,"PLATEAU_ROUND01");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE_MOVE");
			Wld_InsertNpc(orkelite_addon1,"LOCATION_18_OUT");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04_RIGHT");
			Wld_InsertNpc(orkelite_addon2,"PATH_TO_PLATEAU04_RIGHT");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04_SMALLPATH");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ROCK_DRACONIAN_09_1");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ROCK_DRACONIAN_07_1");
			Wld_InsertNpc(orkelite_addon1,"PLATEAU_ROUND07");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND07");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND07");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_01");
			Wld_InsertNpc(orkelite_addon2,"LOCATION_19_02_1");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04_BRIDGE2");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_TO_PLATEAU04_BRIDGE2");
			Wld_InsertNpc(orkelite_addon1,"LOCATION_19_03_PATH_RUIN5");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PATH_RUIN7");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PATH_RUIN11");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_SWAMP_13_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_14_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_15_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_16_01");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_16_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_3_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_4_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_SWAMP_5_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_6_02");
			Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_046");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SWAMP_9_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_9_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_ENTRANCE_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SWAMP_ENTRANCE_02");
			Wld_InsertNpc(orkelite_addon2,"SPAWN_OW_WARAN_NC_03");
			Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_OW_WARAN_NC_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_24_01");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ICEREGION_25_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_27_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_20_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_20_02");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ICEREGION_21_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_15_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_15_02");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ICEREGION_13_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_13_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_5_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_6_01");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ICEREGION_8_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_2_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_ICEREGION_2_02");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ICEREGION_9_01");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_8");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_8");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_8");
			Wld_InsertNpc(orkelite_addon2,"CASTLE_16");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_16");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_18");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_20");
			Wld_InsertNpc(orkelite_addon1,"CASTLE_22");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_22");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_27");
			Wld_InsertNpc(OrcWarrior_Roam,"CASTLE_28");
			Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_012");
			Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_012");
			Wld_InsertNpc(OrcWarrior_Roam,"OW_PATH_012");
			Wld_InsertNpc(orkelite_addon1,"PATH_CASTLE_TO_WATERFALL");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_CASTLE_TO_WATERFALL");
			Wld_InsertNpc(OrcWarrior_Roam,"PATH_CASTLE_TO_WATERFALL");
			Wld_InsertNpc(OrcWarrior_Roam,"OW_ROCKDRAGON_03");
			Wld_InsertNpc(orkelite_addon2,"OW_ROCKDRAGON_07");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_ROOM3");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_HARPYE1");
			Wld_InsertNpc(orkelite_addon1,"LOCATION_19_03_SECOND_ETAGE6");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_HARPYE3");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_HARPYE4");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_ETAGE7");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_SECOND_ETAGE_BALCON2");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PEMTAGRAM_ENTRANCE");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_19_03_PENTAGRAMM");
			Wld_InsertNpc(orkelite_addon1,"SPAWN_OW_MOLERAT_A_6_NC4");
			Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_OW_MOLERAT_A_6_NC4");
			Wld_InsertNpc(OrcWarrior_Roam,"SPAWN_OW_MOLERAT_A_6_NC4");
			Wld_InsertNpc(orkelite_addon2,"SPAWN_OW_MOLERAT_A_6_NC4");
			Wld_InsertNpc(OrcWarrior_Roam,"MOVEMENT_OW_BLOODFLYS_152");
			Wld_InsertNpc(OrcWarrior_Roam,"MOVEMENT_OW_BLOODFLYS_152");
			Wld_InsertNpc(orkelite_addon1,"MOVEMENT_OW_BLOODFLYS_152");
			Wld_InsertNpc(OrcWarrior_Roam,"MOVEMENT_OW_BLOODFLYS_152");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_BLOODFLY_A_1");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_18_OUT");
			Wld_InsertNpc(OrcWarrior_Roam,"LOCATION_18_OUT");
			Wld_InsertNpc(orkelite_addon1,"FP_ROAM_OW_ROCK_DRACONIAN_07");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE_MOVE");
			Wld_InsertNpc(OrcWarrior_Roam,"PLATEAU_ROUND02_CAVE_MOVE");
			EnterOW_Kapitel5 = TRUE;
		};
		CHANGEONETIMEKAPITALOW = TRUE;
	};
	if((MIS_SylvioCrew == LOG_Success) && (MoveDracarBoard == FALSE))
	{
		if(Npc_IsDead(DJG_700_Sylvio) == FALSE)
		{
			B_StartOtherRoutine(DJG_700_Sylvio,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7300_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7300_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7301_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7301_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7302_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7302_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7303_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7303_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7304_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7304_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7305_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7305_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7306_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7306_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7307_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7307_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7308_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7308_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7309_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7309_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7310_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7310_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7311_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7311_ToterDrachenjaeger,"DracarBoard");
		};
		if(Npc_IsDead(DJG_7312_ToterDrachenjaeger) == FALSE)
		{
			B_StartOtherRoutine(DJG_7312_ToterDrachenjaeger,"DracarBoard");
		};
		if((Npc_IsDead(xbs_7510_ratford) == FALSE) && (RatfordAgree == TRUE))
		{
			B_StartOtherRoutine(xbs_7510_ratford,"DracarBoard");
			RatfordOnBoard = TRUE;
		};
		if((Npc_IsDead(xbs_7509_drax) == FALSE) && (RatfordAgree == TRUE))
		{
			B_StartOtherRoutine(xbs_7509_drax,"DracarBoard");
			DraxOnBoard = TRUE;
		};
		if((Npc_IsDead(STRF_1107_Straefling) == FALSE) && (ClifAgree == TRUE))
		{
			B_StartOtherRoutine(STRF_1107_Straefling,"DracarBoard");
			CliffOnBoard = TRUE;
		};

		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_40");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_42");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_44");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_45");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_46");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_48");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_50");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_52");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_54");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_56");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_58");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_60");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_62");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_64");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_66");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_68");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_70");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_72");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_74");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_76");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_78");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_80");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_82");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_84");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_86");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_88");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_90");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_DRACONIAN_92");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_94");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_DRACONIAN_96");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_98");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_100");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_102");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_104");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_106");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_108");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_DRACONIAN_112");
		Wld_SendTrigger("EVT_DRAKARTREASURE");
		MoveDracarBoard = TRUE;
	};
	if(Kapitel >= 1)
	{
		B_ENTER_OLDWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_OLDWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_OLDWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_OLDWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_OLDWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		B_ENTER_OLDWORLD_Kapitel_6();
	};
	if((DJG_BiffParty == TRUE) && (Npc_IsDead(Biff) == FALSE))
	{
		if(DJG_Biff_HalbeHalbe == TRUE)
		{
			Npc_SetRefuseTalk(Biff,500);
		}
		else
		{
			Npc_SetRefuseTalk(Biff,300);
		};
	};
	if((Npc_IsDead(Bilgot) == TRUE) && (MIS_RescueBilgot == LOG_Running))
	{
		MIS_RescueBilgot = LOG_FAILED;
	};
	if(CAMPER_7501_TALK == TRUE)
	{
		B_StartOtherRoutine(camper_7501,"STAYINCAMP");
		camper_7501.flags = 0;
		CAMPER_7501_TALK = FALSE;
	};
	if((TschuessBilgot == TRUE) && (BilgotDayOut < DayNow) && (BilgotPassNW == FALSE))
	{
		if(Npc_IsDead(VLK_4120_Bilgot) == FALSE)
		{
			Npc_ExchangeRoutine(VLK_4120_Bilgot,"TOT");
			AI_Teleport(VLK_4120_Bilgot,"TOT");
			BilgotPassNW = TRUE;
		};
	};
	if((COOK1107_GOBASE == TRUE) && !Npc_IsDead(VLK_4109_Waffenknecht))
	{
		B_StartOtherRoutine(VLK_4109_Waffenknecht,"Cooking");
	};
	if((ANGAROWFLAG == TRUE) && (ANGARDONEALL == FALSE))
	{
		ANGARDONEALL = TRUE;
		B_RemoveNpc(DJG_705_Angar);
	};
	if((ALLAWAYFROMPLACEONCE == TRUE) && (ALLAWAYFROMPLACEONCETWO == FALSE))
	{
		ALLAWAYFROMPLACEONCETWO = TRUE;
		B_RemoveNpc(PAL_250_Garond);
		B_RemoveNpc(PAL_251_Oric);
		B_RemoveNpc(PAL_252_Parcival);
		B_RemoveNpc(PAL_268_Udar);
		B_RemoveNpc(PAL_217_Marcos);
		B_RemoveNpc(pal_7523_albert);
		B_RemoveNpc(pal_9168_natan);
		B_RemoveNpc(pal_7518_ritter);
		B_RemoveNpc(pal_7519_ritter);
		B_RemoveNpc(pal_7520_ritter);
		B_RemoveNpc(pal_7521_ritter);
		B_RemoveNpc(pal_7522_ritter);
		B_RemoveNpc(pal_7524_ritter);
		B_RemoveNpc(PAL_253_Wache);
		B_RemoveNpc(PAL_257_Ritter);
		B_RemoveNpc(pal_9165_ritter);
		B_RemoveNpc(pal_9166_ritter);
		B_RemoveNpc(pal_9167_ritter);

		if((DGJJOINPALADIN == TRUE) || (DGJMOVEPALADIN == TRUE))
		{
			B_RemoveNpc(DJG_708_Kurgan);
			B_RemoveNpc(DJG_710_Kjorn);
			B_RemoveNpc(DJG_711_Godar);
			B_RemoveNpc(DJG_712_Hokurn);
			B_RemoveNpc(DJG_702_Rod);
			B_RemoveNpc(DJG_703_Cipher);
			B_RemoveNpc(DJG_713_Biff);
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_3");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_1");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_LURKER_NEARBGOBBO_2");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_4");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
		}
		else
		{
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			B_KillNpc(DJG_713_Biff);
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_3");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_1");
			Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_LURKER_NEARBGOBBO_2");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_LURKER_NEARBGOBBO_4");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
		};
	};
	if((MIS_HelpDiegoNW == LOG_Running) && (DiegoTreasureOrcIns == FALSE))
	{
		Wld_InsertNpc(ORKELITE_ADDON3R_DIEGO,"FP_ROAM_ORCBOWER_23");
		DiegoTreasureOrcIns = TRUE;
	};
	if((HOWCANMAKERUNE == TRUE) && (XarUnit == FALSE))
	{
		Wld_InsertItem(ItMi_Focus,"FP_ITEM_XARDASUNITOR");
		XarUnit = TRUE;
	};
	if((MIS_BELIARHELPME == LOG_OBSOLETE) && (MEHASTRIRAVAR == TRUE) && (DEMENTORDISAPPEAR == FALSE))
	{
		B_StartOtherRoutine(dmt_1257_dementor,"Start");
		DEMENTORDISAPPEAR = TRUE;
	};
	if((MIS_GarsArmor == LOG_Running) && (VenzelItems == FALSE))
	{
		Wld_InsertItem(ITAR_PAL_H_V2_VENZEL,"FP_ITEM_VENZEL_ARMOR");
		Wld_InsertItem(ItMw_1H_Blessed_Venzel,"FP_ITEM_VENZEL_SWORD");
		VenzelItems = TRUE;
	};
	if((MIS_NagDumgar == LOG_Running) && (NagDumgarInsert == TRUE) && (NagDumgarInsertDone == FALSE))
	{
		Wld_InsertNpc(Orc_8568_NagDumgar,"FP_ROAM_NAGDUMGAR");
		NagDumgarInsertDone = TRUE;
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER5 == TRUE) && (CHAPTER6_Insert == FALSE))
	{
		Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_01");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"OW_HROMANIN_GUARD_02");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_HROMANIN_GUARD_03");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Hrom,"OW_HROMANIN_GUARD_04");
		Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_05");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"OW_HROMANIN_GUARD_06");
		Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_07");
		CHAPTER6_Insert = TRUE;
	};
	if((MIS_HROMANINQUEST == LOG_Running) && (CHAPTER6 == TRUE) && (HromGuard_Insert == FALSE))
	{
		Wld_InsertNpc(skeleton_lord_kadar,"OW_UNDEAD_DUNGEON_02");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"STONEHENGE");
		Wld_InsertNpc(skeleton_warrior_dark,"STONES");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_PATH_3_13");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_STONES_02");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_STONES_02");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_OW_PATH_3_13_02");
		HromGuard_Insert = TRUE;
	};
	if((MIS_DeadHead == LOG_Running) && (DesertirIns == FALSE))
	{
		Wld_InsertNpc(Mil_3320_Stadtwache,"OW_PATH_1_17_1");
		Wld_InsertNpc(Mil_3321_Stadtwache,"OW_PATH_1_17");
		Wld_InsertNpc(Mil_3322_Stadtwache,"START");
		DesertirIns = TRUE;
	};
	if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE) && (XardasOrcBooksIns == FALSE))
	{
		Wld_InsertItem(ItWr_AboutNagDumgar_P3,"FP_ITEM_NAGDUMGAR_03");
		XardasOrcBooksIns = TRUE;
		KnowAboutNagDumgar_P3IN = TRUE;
	};
	if((MIS_SendNorolas == LOG_Running) && (NorolasIns == FALSE))
	{
		Wld_InsertNpc(KDW_1407_Norolas,"WP_COAST_FOREST_04");
		NorolasIns = TRUE;
	};
	if((HUNTYGRIMESESCAPEOW == TRUE) && (HUNTYGRIMESREMOVEDOW == FALSE))
	{
		B_RemoveNpc(VLK_4111_Grimes);
		B_RemoveNpc(STRF_1117_Straefling);
		HUNTYGRIMESREMOVEDOW = TRUE;
	};
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestCaveStepIns == TRUE) && (AlexOneIns == FALSE))
	{
		Wld_InsertNpc(KDF_4569_AlexOne,"OW_ALEXONE");
		AlexOneIns = TRUE;
	};
	if(OldworldFT == FALSE)
	{
		Wld_SetTime(1,0);
		PlayVideo("DRAGONATTACK.BIK");
		OldworldFT = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = OldWorld_Zen;
	B_InitNpcGlobals();
};