/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

VLK_41200_Bilgot - opraven waypoint (NW_BILGOT_01 -> NW_PASS_GATE_01)

*/




var int enternw_kapitel1;
var int EnterNW_Kapitel2;
var int EnterNW_Kapitel3;
var int EnterNW_Kapitel4;
var int EnterNW_Kapitel5;
var int EnterNW_Kapitel6;

func void B_ENTER_NEWWORLD_Kapitel_1()
{
	if((ENTERED_ADDONWORLD == TRUE) && (KAPITELORCATC == FALSE))
	{
		if(KDWMageMoveYarkendar == FALSE)
		{
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"TOT");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"TOT");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"TOT");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"TOT");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"TOT");
			B_RemoveNpc(KDW_1403_Addon_Myxir_NW);
			B_RemoveNpc(PIR_1301_Addon_Skip_NW);
			KDWMageMoveYarkendar = TRUE;
		};
		if(MIS_Skip_NW_Sable == LOG_Running)
		{
			MIS_Skip_NW_Sable = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_OBSOLETE);			
		};
		if(MIS_WomanForSkip == LOG_Running)
		{
			if((SonyaJob == TRUE) && (SonyaBackOk == FALSE) && (SonyaBackOkNot == FALSE))
			{
				B_KillNpc(VLK_436_Sonja);
				Wld_InsertNpc(FireWaran,"NW_CITY_PIRATESCAMP_04");	
			};

			MIS_WomanForSkip = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_OBSOLETE);	
		};
		if(SC_GotPORTALTEMPELWALKTHROUGHKey == FALSE)
		{
			Wld_InsertNpc(Stoneguardian_MerdarionsSchluessel,"NW_TROLLAREA_PORTALTEMPEL_22");
			SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
		};
	};
	if((Sklaven_Flucht == TRUE) && (Sklaven_weg == FALSE))
	{
		Wld_InsertNpc(STRF_1123_Addon_Patrick_NW,"NW_BIGFARM_PATRICK");
		Wld_InsertNpc(STRF_1124_Addon_Monty_NW,"NW_CITY_HABOUR_WERFT_IN_01");
		Wld_InsertNpc(STRF_1125_Addon_Tonak_NW,"NW_FARM2_FIELD_TANOK");
		Wld_InsertNpc(STRF_1126_Addon_Telbor_NW,"NW_FARM2_FIELD_TELBOR");
		Wld_InsertNpc(STRF_1127_Addon_Pardos_NW,"NW_FARM3_BENGAR");
		Sklaven_weg = TRUE;
		MissingPeopleReturnedHome = TRUE;
	};
	if(ENTERNW_KAPITEL1 == FALSE)
	{
		ENTERNW_KAPITEL1 = TRUE;
	};
};

var int RagnarKap2;

func void B_ENTER_NEWWORLD_Kapitel_2()
{
	if(RagnarKap2 == FALSE)
	{
		if(MIS_RagnarFood != LOG_Success)
		{
			if(RagnarKill == TRUE)
			{
				B_StartOtherRoutine(STRF_8160_Ragnar,"SLDDead");
				B_KillNpc(STRF_8160_Ragnar);
				RagnarIsSLDDead = TRUE;
			}
			else
			{
				B_KillNpc(STRF_8160_Ragnar);
			};
		}
		else
		{
			if(RagnarIsNOV == TRUE)
			{
				CreateInvItems(Ragnar,ItAr_NOV_L,1);
				AI_EquipArmor(Ragnar,ItAr_NOV_L);
				Npc_RemoveInvItems(Ragnar,ITAR_Prisoner,1);
				B_StartOtherRoutine(Ragnar,"StandNOV");
				Ragnar.guild = GIL_NOV;
			}
			else if(RagnarIsSLD == TRUE)
			{
				CreateInvItems(Ragnar,ItAr_Sld_L,1);
				AI_EquipArmor(Ragnar,ItAr_Sld_L);
				Npc_RemoveInvItems(Ragnar,ITAR_Prisoner,1);
				B_StartOtherRoutine(Ragnar,"StandSLD");
				Ragnar.guild = GIL_SLD;
			}
			else if(RagnarIsMIL == TRUE)
			{
				CreateInvItems(Ragnar,ITAR_Mil_L,1);
				AI_EquipArmor(Ragnar,ITAR_Mil_L);
				Npc_RemoveInvItems(Ragnar,ITAR_Prisoner,1);
				B_StartOtherRoutine(Ragnar,"StandMIL");
				Ragnar.guild = GIL_MIL;
			};
		};

		RagnarKap2 = TRUE;
	};
	if(GregIsBack == TRUE)
	{
		B_RemoveNpc(PIR_1300_Addon_Greg_NW);
	};
	if(EnterNW_Kapitel2 == FALSE)
	{
		if((JOINWATERRING == TRUE) && (FistFightersIsPlaced == FALSE))
		{
			Wld_InsertNpc(VLK_660_Olaf,"NW_CITY_OLAF_01");
			Wld_InsertNpc(VLK_661_Graden,"NW_CITY_GRADEN_01");
			Wld_InsertNpc(VLK_662_Bram,"NW_CITY_BRAM_01");
			Wld_InsertNpc(VLK_663_Valgard,"NW_CITY_VALGARD_01");
			Wld_InsertNpc(VLK_664_Masbo,"NW_CITY_MASTBO_01");
			FistFightersIsPlaced = TRUE;
		};
		if(MIS_Orcwayhero != LOG_SUCCESS)
		{
			B_RemoveNpc(Orc_5500_WoundedOrc);
			UrKarrasIsDead = TRUE;
			Log_SetTopicStatus(Topic_Orcwayhero,LOG_OBSOLETE);
			MIS_Orcwayhero = LOG_Failed;
		};
		if(LARESRENTPARTY == TRUE)
		{
			LARESRENTPARTY = FALSE;
			Lares.aivar[AIV_PARTYMEMBER] = FALSE;
			B_StartOtherRoutine(Lares,"START");
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			Wld_InsertItem(ItAm_Hp_Mana_01,"FP_ROAM_XARDAS_SECRET_26");
		}
		else
		{
			if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
			{
				Wld_InsertItem(ItAm_Strg_01,"FP_ROAM_XARDAS_SECRET_26");
			}
			else
			{
				Wld_InsertItem(ItAm_Dex_01,"FP_ROAM_XARDAS_SECRET_26");
			};
		};
		if(hero.guild == GIL_KDF)
		{
			B_StartOtherRoutine(Agon,"StillAlive");
		};
		if(hero.guild == GIL_KDF)
		{
			B_StartOtherRoutine(Ulf,"Start");
		};

		Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_NW_FARM2_03");
		EnterNW_Kapitel2 = TRUE;
	};
};

func void B_ENTER_NEWWORLD_Kapitel_3()
{
	if(EnterNW_Kapitel3 == FALSE)
	{
		if((JOINWATERRING == TRUE) && (FistFightersIsPlaced == FALSE))
		{
			Wld_InsertNpc(VLK_660_Olaf,"NW_CITY_OLAF_01");
			Wld_InsertNpc(VLK_661_Graden,"NW_CITY_GRADEN_01");
			Wld_InsertNpc(VLK_662_Bram,"NW_CITY_BRAM_01");
			Wld_InsertNpc(VLK_663_Valgard,"NW_CITY_VALGARD_01");
			Wld_InsertNpc(VLK_664_Masbo,"NW_CITY_MASTBO_01");
			FistFightersIsPlaced = TRUE;
		};
		if(Npc_IsDead(GornNW_vor_DJG))
		{
			Wld_InsertNpc(PC_Fighter_NW_vor_DJG,"BIGFARM");
			B_StartOtherRoutine(GornNW_vor_DJG,"START");
		};
		if(Npc_IsDead(Lares) == FALSE)
		{
			B_StartOtherRoutine(Lares,"START");
		};
		if((Npc_IsDead(Bdt_1013_Bandit_L) == FALSE) && (JessGoSld == FALSE))
		{
			B_StartOtherRoutine(Ambusher_1013,"AWAY2");
		};
		if(DarkMessian == FALSE)
		{
			Wld_InsertNpc(DMT_2200_DarkSpeaker,"NW_PASS_GATE_02");
			DarkMessian = TRUE;
		};
		B_KillNpc(PAL_297_Ritter);
		B_ClearRuneInv(PAL_297_Ritter);
		B_KillNpc(PAL_298_Ritter);
		B_ClearRuneInv(PAL_298_Ritter);
		B_StartOtherRoutine(BAU_961_Gaan,"Orcatcbegan");

		if(Npc_IsDead(DiegoNW))
		{
			Wld_InsertNpc(PC_Thief_NW,"NW_CITY_ENTRANCE_01");
			B_StartOtherRoutine(DiegoNW,"START");

			if(MIS_DiegoTogether == LOG_Running)
			{
				MIS_DiegoTogether = LOG_OBSOLETE;
				Log_SetTopicStatus(TOPIC_DiegoTogether,LOG_OBSOLETE);
			};
		};

		B_StartOtherRoutine(Sergio,"WAIT");

		if(MIS_WulfgarBandits != LOG_Success)
		{
			B_StartOtherRoutine(Peck,"STORAGE");
		};

		Wld_InsertNpc(BDT_1025_Bandit_H,"NW_FOREST_CAVE1_02");
		Wld_InsertNpc(BDT_1026_Bandit_H,"NW_FOREST_CAVE1_03");
		Wld_InsertNpc(BDT_1027_Bandit_H,"NW_FOREST_CAVE1_04");
		Wld_InsertNpc(Follow_Sheep_AKIL,"NW_FOREST_CAVE1_IN_02");

		B_StartOtherRoutine(Hilda,"Krank");

		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Wld_InsertItem(ItMw_MalethsGehstock_MIS,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(BDT_1024_MalethsBandit,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(BDT_1006_Bandit_H,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(BDT_1007_Bandit_H,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(BDT_1008_Bandit_H,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(BDT_1004_Bandit_M,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(BDT_1005_Bandit_M,"NW_FARM1_BANDITS_CAVE_04");
		};
		if((MIS_Canthars_KomproBrief != LOG_SUCCESS) && (MIS_Canthars_KomproBrief != FALSE) && (Canthar_Pay == FALSE) && (Npc_IsDead(Canthar) == FALSE))
		{
			if(SARAKNOWSABOUTCANTHAR == TRUE)
			{
				B_StartOtherRoutine(Sarah,"INTAVERN");
				SARAFLEE = TRUE;
			}
			else
			{
				B_RemoveNpc(Sarah);
			};

			B_StartOtherRoutine(Canthar,"MARKTSTAND");
			Canthar_Sperre = TRUE;
			Canthar_WiederRaus = TRUE;
		};
		if(FLAG_ORCS_CHK_26 == TRUE)
		{
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_02");
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_13");
			Wld_InsertNpc(orcwarrior4,"NW_PASS_13");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_07");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_01");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_04");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_03");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_10");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_12");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_PASS_ORK_WATCHER");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_05");
			Wld_InsertNpc(orkelite_addon3_chkflg_26,"NW_PASS_ORKS_03");
			FLAG_ORCS_CHK_26 = FALSE;
		};

		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_03");
		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_05");
		Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_02");
		Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_02");
		Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Wolf,"NW_XARDAS_VALLEY_08");
		Wld_InsertNpc(Wolf,"NW_XARDAS_VALLEY_08");
		Wld_InsertNpc(Bloodfly,"NW_XARDAS_VALLEY_06");
		Wld_InsertNpc(Bloodfly,"NW_XARDAS_VALLEY_06");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_06");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_06");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_06");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_06");
		Wld_InsertNpc(DragonSnapper,"NW_CITYFOREST_09");
		Wld_InsertNpc(DragonSnapper,"NW_CITYFOREST_09");
		Wld_InsertNpc(Keiler,"NW_CITY_SMFOREST_03_M");
		Wld_InsertNpc(Keiler,"NW_CITY_SMFOREST_03_M");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Gobbo_Green,"NW_FOREST_PATH_35_01");
		Wld_InsertNpc(Gobbo_Green,"NW_FOREST_PATH_35_01");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
		Wld_InsertNpc(gobbo_mage,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(gobbo_mage,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(gobbo_mage,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_18_MONSTER");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_57");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_57");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_57");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_82");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_82");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_72_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_72_MONSTER");
		Wld_InsertNpc(Waran,"NW_FOREST_PATH_80_1_MOVEMENT6");
		Wld_InsertNpc(Waran,"NW_FOREST_PATH_80_1_MOVEMENT6");
		Wld_InsertNpc(Waran,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Waran,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_RITUAL_08");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_RITUAL_08");
		Wld_InsertNpc(DragonSnapper,"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_BRIGDE_01");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_BRIGDE_01");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_BRIGDE_01");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_PATH_71_MONSTER2");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_PATH_71_MONSTER2");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_38");
		Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_32");
		Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_32");
		Wld_InsertNpc(DragonSnapper,"NW_TROLLAREA_RATS_01");
		Wld_InsertNpc(Bloodfly,"NW_FARM1_PATH_SPAWN_02");
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_OUT_13");
		Wld_InsertNpc(Bloodfly,"NW_FARM1_CITYWALL_02_B");
		Wld_InsertNpc(Snapper,"NW_FARM1_CITYWALL_05");
		Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_03");
		Wld_InsertNpc(Bloodfly,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Wolf,"NW_XARDAS_TOWER_04");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_01");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(Giant_Bug,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02");
		Wld_InsertNpc(Wolf,"NW_XARDAS_VALLEY_08");
		Wld_InsertNpc(Giant_Rat,"NW_XARDAS_TOWER_VALLEY_RAT");
		Wld_InsertNpc(Wolf,"NW_XARDAS_TOWER_VALLEY_WOLF");
		Wld_InsertNpc(Bloodfly,"NW_XARDAS_TOWER_VALLEY_08");
		Wld_InsertNpc(Lurker,"NW_BIGMILL_FIELD_MONSTER_03");
		Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_01");
		Wld_InsertNpc(Wolf,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
		Wld_InsertNpc(gobbo_mage,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_02");
		Wld_InsertNpc(Wolf,"NW_FARM4_WOOD_MONSTER_03");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_04");
		Wld_InsertNpc(Wolf,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_07");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_09");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_07");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_BIGFARM_LAKE_CAVE_06");
		Wld_InsertNpc(Bloodfly,"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
		Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT2_10");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER06");
		Wld_InsertNpc(Keiler,"NW_BIGFARM_FOREST_03_NAVIGATION");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_NAVIGATION_09");
		Wld_InsertNpc(Keiler,"NW_FARM3_BIGWOOD_03");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_03");
		Wld_InsertNpc(Keiler,"NW_FARM3_PATH_12_MONSTER_03");
		Wld_InsertNpc(Zombie03,"FP_ROAM_MEDIUMFOREST_KAP3_03");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_11");
		Wld_InsertNpc(Bloodfly,"NW_CITY_TO_LIGHTHOUSE_03");
		Wld_InsertNpc(Waran,"FP_ROAM_FISHERMAN_04");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_17");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_04_05_01");
		Wld_InsertNpc(Scavenger,"NW_FOREST_PATH_38_MONSTER");
		Wld_InsertNpc(Keiler,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_35_01");
		Wld_InsertNpc(Bloodfly,"NW_FARM2_TO_TAVERN_09_MONSTER5");
		Wld_InsertNpc(Wolf,"NW_FOREST_CAVE1_01");
		Wld_InsertNpc(Waran,"NW_FOREST_PATH_82_M");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_66_M");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
		Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER");
		Wld_InsertNpc(Bloodfly,"NW_FOREST_PATH_62_06");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_56_MONSTER");
		Wld_InsertNpc(Bloodfly,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_35_MONSTER");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER23");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_25_01_M");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_21");
		Wld_InsertNpc(Waran,"FP_ROAM_NW_TROLLAREA_RUINS_30");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_07");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_NOVCHASE_01");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_PATH_38_MONSTER");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PATH_15_MONSTER");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_75");
		Wld_InsertNpc(Waran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Wolf,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(Wolf,"NW_FARM1_PATH_CITY_SHEEP_04");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(scavenger_old,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_36");
		Wld_InsertNpc(Warg,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Snapper,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(Bloodfly,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(Waran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_02_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_04_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_06_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_08_01");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_01");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_02");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_03");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_04");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_05");
		Wld_InsertNpc(Keiler,"X_SOUTHBEACH_MONSTER_06");
		Wld_InsertNpc(FireWaran,"X_SOUTHBEACH_MONSTER_07");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_08");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_10");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_09");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_11");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_15");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_14");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_16");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_17");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_18");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_19");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_20");
		Wld_InsertNpc(Muritan,"X_SOUTHBEACH_MONSTER_22");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_23");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_24");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_25");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_26");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_27");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_29");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_30");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_31");
		Wld_InsertNpc(Keiler,"X_SOUTHBEACH_MONSTER_32");
		Wld_InsertNpc(GOBBO_MAGE,"NW_DARKFOREST_CAVE_02_01");
		Wld_InsertNpc(GOBBO_MAGE,"NW_DARKFOREST_CAVE_02_03");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_07");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_04");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_02");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_IN_01_01");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_IN_01_07");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_OUT_01_06");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_03");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_34");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_45");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_05");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_13");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_22");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_28");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_43");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_55");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_OUT_01_40");
		Wld_InsertNpc(Waran,"NW_DARKFOREST_IN_01_11");
		Wld_InsertNpc(Warg,"NW_DARKFOREST_IN_01_16");
		Wld_InsertNpc(Warg,"NW_DARKFOREST_IN_01_19");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_29");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_36");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_37");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_40");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_47");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_IN_01_25");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_OUT_01_01");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_OUT_01_03");
		Wld_InsertNpc(Troll,"NW_DARKFOREST_OUT_01_07");
		Wld_InsertNpc(Troll,"NW_DARKFOREST_OUT_01_23");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_IN_01_52");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_IN_01_50");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_21");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_18");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_16");
		Wld_InsertNpc(Oster,"NW_DARKFOREST_OUT_01_11");
		Wld_InsertNpc(Oster,"NW_DARKFOREST_OUT_01_14");
		IntroduceCH_03 = TRUE;
		EnterNW_Kapitel3 = TRUE;
	};
};

func void B_ENTER_NEWWORLD_Kapitel_4()
{
	if(EnterNW_Kapitel4 == FALSE)
	{
		B_RemoveNpc(SLD_849_Hokurn);

		if((DarkPathStart == FALSE) && ((MIS_SagittaGuard == FALSE) || (LeeSendGuard == FALSE)))
		{
			B_RemoveNpc(BAU_980_Sagitta);
			Wld_InsertNpc(DMT_DementorAmbient,"NW_SAGITTA_CAVE_IN_02");
			SagittaIsDead = TRUE;
		};
		if(Npc_GetDistToWP(Salandril,"ALTAR") < 10000)
		{
			B_StartOtherRoutine(Salandril,"Start");
		};

		B_StartOtherRoutine(Jorgen,"Kloster");
		B_StartOtherRoutine(Sergio,"GuardPass");

		if((MIS_HelpBabo == LOG_FAILED) && (BABOMAGEPLANTDAY == 0))
		{
			B_StartOtherRoutine(Babo,"Start");
		};

		B_KillNpc(BDT_1050_Landstreicher);

		if(DarkPathStart == FALSE)
		{
			CreateInvItems(Randolph,ITWR_DementorObsessionBook_MIS,1);
			B_StartOtherRoutine(Randolph,"Obsessed");
		};

		B_StartOtherRoutine(Vino,"BugsThere");
	
		if((SNIPSGETNUGGETS == FALSE) && (SNIPESRECRUITEDDT == FALSE))
		{
			B_StartOtherRoutine(BAU_987_SNIPES,"BugsThere");
		};

		B_StartOtherRoutine(LobartsBauer1,"BugsThere");
		B_StartOtherRoutine(LobartsBauer2,"BugsThere");

		if((DarkPathStart == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM)))
		{
			ShrineIsObsessed_NW_TROLLAREA_PATH_37 = FALSE;
			ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = FALSE;
			ShrineIsObsessed_NW_TROLLAREA_PATH_66 = FALSE;
			ShrineIsObsessed_NW_TROLLAREA_PATH_04 = FALSE;
			ShrineIsObsessed_SAGITTA = FALSE;
			ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
			ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = FALSE;
		};

		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_12");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_10");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_09");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_01");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PATH_44");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(OrcElite_AntiPaladin1,"NW_FARM3_PATH_BRIDGE");
		Wld_InsertNpc(OrcElite_AntiPaladin2,"NW_FARM1_PATH_CITY_13");
		Wld_InsertNpc(OrcElite_AntiPaladin3,"NW_CITY_TO_FOREST_11");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM3_PATH_12_MONSTER_03");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_03");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM3_PATH_10");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_BIGFARM_LAKE_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_02");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TAVERNE_TROLLAREA_08");
		Wld_InsertNpc(OrcElite_AntiPaladin,"FP_ROAM_TAVERNE_TROLLAREA_03_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_05");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_PATH_62");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PATH_62");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RIVERSIDE_07");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FOREST_PATH_32");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM2_TO_TAVERN_10");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_01");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_02");
		Wld_InsertNpc(OrcElite_AntiPaladin,"FP_ROAM_XARDAS_GOBBO_01");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_XARDAS_GOBBO_02");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_XARDAS_GOBBO_03");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_02");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_03");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_04");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_01");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_02");
		Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_39");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_42");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(OrcElite_AntiPaladin,"XARDAS");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_BIGFARM_ALLEE_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_01");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_PATH_TO_MONASTERY_06");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_03");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTERY_05");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_09");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_05");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_BIGFARM_CROSS");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM2_TO_TAVERN_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_43");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_46");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_44");
		Wld_InsertNpc(OrkElite_AntiPaladinOrkOberst,"NW_FARM1_BANDITS_CAVE_08");
		Wld_InsertNpc(OrcElite_AntiPaladin,"FP_STAND_DEMENTOR_KDF_29");
		Wld_InsertNpc(OrcElite_AntiPaladin,"FP_STAND_DEMENTOR_KDF_30");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM1_BANDITS_CAVE_03");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM1_BANDITS_CAVE_07");
		Wld_InsertNpc(OrcWarrior_Lobart1,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_01");
		Wld_InsertNpc(OrcWarrior_Lobart2,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_02");
		Wld_InsertNpc(OrcWarrior_Lobart3,"FP_STAND_DEMENTOR_KDF_25");
		Wld_InsertNpc(OrcWarrior_Lobart4,"FP_STAND_DEMENTOR_16");
		Wld_InsertNpc(OrcWarrior_Lobart5,"FP_STAND_DEMENTOR_KDF_24");
		Wld_InsertNpc(OrcWarrior_Lobart6,"FP_ROAM_FARM1_GOBBO_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_06");
		Wld_InsertNpc(Draconian,"NW_TROLLAREA_RIVERSIDE_05");
		Wld_InsertNpc(Draconian,"NW_TROLLAREA_RIVERSIDE_04");
		Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_07");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_16");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_19");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_11");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_06");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_07");
		Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_08");
		Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01_01");
		Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01");
		Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01_02");
		Wld_InsertNpc(Draconian,"NW_RITUALFOREST_CAVE_06");
		Wld_InsertNpc(Draconian,"FP_ROAM_RITUALFOREST_CAVE_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_RITUALFOREST_CAVE_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_04");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_06");
		Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_08");
		Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_05");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_04");
		Wld_InsertNpc(Draconian,"FP_STAND_DEMENTOR_KDF_29");
		Wld_InsertNpc(Draconian,"FP_STAND_DEMENTOR_KDF_30");
		Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_03");
		Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_02");
		Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_04");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_02");
		Wld_InsertNpc(Draconian,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_04");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_TROLLAREA_PATH_80");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_TROLLAREA_19");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_FARM2_TO_TAVERN_08");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_MEDIUMFOREST_KAP2_13");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_XARDAS_TOWER_3_02");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_XARDAS_TOWER_3_02");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_04");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_05");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_06");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_07");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_08");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_09");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_10");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_11");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_13");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_14");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_22");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_23");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_FARM1_PATH_SPAWN_07_04");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_FARM1_PATH_SPAWN_07_02");
		Wld_InsertNpc(DMT_DementorAmbientWalker10,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker8,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker7,"CITY1");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM1_PATH_SPAWN_02");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM1_PATH_CITY_10_B");
		Wld_InsertNpc(orkelite_addon3,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Shadowbeast,"NW_FARM1_CITYWALL_FOREST_08_B");

		if((MIS_MISSGRITTA == LOG_SUCCESS) || (GRITTAFOUNDISDEAD == TRUE))
		{
			Wld_InsertNpc(orkelite_addon1,"NW_FARM1_CITYWALL_FOREST_14");
			Wld_InsertNpc(orkelite_addon1,"NW_FARM1_CITYWALL_FOREST_15");
			Wld_InsertNpc(orkelite_addon3,"NW_FARM1_CITYWALL_FOREST_16");
		};

		Wld_InsertNpc(orcwarrior5,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(orcwarrior5,"NW_XARDAS_TOWER_VALLEY_RAT");
		Wld_InsertNpc(orkelite_addon1,"NW_XARDAS_TOWER_VALLEY_08");
		Wld_InsertNpc(orkelite_addon1,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM4_WOOD_MONSTER_02");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_MONSTER_06");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_MONSTER_07");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM4_WOOD_MONSTER_10");
		Wld_InsertNpc(orkelite_addon2,"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_NEARPEASANT7");
		Wld_InsertNpc(orkelite_addon3,"NW_FARM4_WOOD_NEARPEASANT2_14");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_NEARPEASANT2_10");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM3_PATH_11_SMALLRIVER_24");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_MEDIUMFOREST_KAP2_12");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_MEDIUMFOREST_KAP2_10");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_MEDIUMFOREST_KAP3_27");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_MEDIUMFOREST_KAP3_26");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_MEDIUMFOREST_KAP3_32");
		Wld_InsertNpc(orkelite_addon1,"NW_CITY_TO_LIGHTHOUSE_03");
		Wld_InsertNpc(orcwarrior5,"NW_CITY_TO_FOREST_11");
		Wld_InsertNpc(orcwarrior5,"NW_CITY_TO_FOREST_12");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_CITY_TO_FOREST_11");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_CITY_TO_FOREST_10");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_CITYFOREST_KAP3_22");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_CITYFOREST_KAP3_20");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_CITYFOREST_KAP3_21");
		Wld_InsertNpc(orcwarrior5,"NW_CITY_SMFOREST_05");
		Wld_InsertNpc(orcwarrior5,"NW_CITY_SMFOREST_09");
		Wld_InsertNpc(orcwarrior5,"NW_CITY_SMFOREST_03");
		Wld_InsertNpc(orcwarrior5,"NW_FARM1_CITYWALL_RIGHT_04");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM2_TO_TAVERN_09_MONSTER5");
		Wld_InsertNpc(orkelite_addon1,"NW_FOREST_PATH_35_01_MONSTER");
		Wld_InsertNpc(orcwarrior5,"NW_FOREST_PATH_31_NAVIGATION11");
		Wld_InsertNpc(orkelite_addon1,"NW_FOREST_PATH_62_06");
		Wld_InsertNpc(orkelite_addon1,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(orkelite_addon1,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(orcwarrior4,"NW_FOREST_PATH_31_NAVIGATION_M");
		Wld_InsertNpc(orcwarrior4,"NW_FOREST_PATH_31_NAVIGATION19");
		Wld_InsertNpc(orcwarrior4,"NW_FOREST_PATH_18_MONSTER");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_TROLLAREA_PATH_15_MONSTER_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_TROLLAREA_PATH_15_MONSTER_02");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_TROLLAREA_PATH_15_MONSTER_03");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_TROLLAREA_PATH_15_MONSTER_04");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_RITUALFOREST_CAVE_05");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NW_TROLLAREA_RUINS_14");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NW_TROLLAREA_RUINS_15");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_RUINS_24");
		Wld_InsertNpc(orcwarrior5,"NW_TROLLAREA_PORTALTEMPEL_12");
		Wld_InsertNpc(orcwarrior5,"NW_TROLLAREA_PORTALTEMPEL_09");
		Wld_InsertNpc(orkelite_addon3,"NW_TROLLAREA_PORTALTEMPEL_08");
		Wld_InsertNpc(orcwarrior5,"NW_TROLLAREA_PORTALTEMPEL_06");
		Wld_InsertNpc(orkelite_addon1,"NW_TROLLAREA_PATH_38_MONSTER");
		Wld_InsertNpc(orcwarrior5,"NW_TROLLAREA_BRIGDE_05");
		Wld_InsertNpc(orcwarrior5,"NW_TROLLAREA_TROLLLAKECAVE_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_50");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_49");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_34");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(orkelite_addon1,"NW_TROLLAREA_RIVERSIDE_09");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_01");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_02");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_03");
		Wld_InsertNpc(orkelite_addon3,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
		Wld_InsertNpc(orcwarrior5,"NW_FARM4_WOOD_RANGERBANDITS_04");
		Wld_InsertNpc(orcwarrior5,"NW_FARM4_WOOD_RANGERBANDITS_03");
		Wld_InsertNpc(orkelite_addon3,"NW_FARM4_WOOD_RANGERBANDITS_05");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ITEM_FARM1_02");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_CASTLEMINE2_EGG");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_BIGFARMLAKECAVE_EGG");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ITEM_STONETPLATECOMMON_02");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_CITYFOREST_KAP3_07");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_NW_CITY_SMFOREST_05_03");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_NW_CITY_SMFOREST_09_04");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_RITUALFOREST_CAVE_EGG");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_MAGECAVE_EGG");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_RIVERSIDE_EGG");
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ITEM_XARDAS_01");
		Wld_InsertItem(ItPl_Blueplant,"FP_ITEM_TROLLAREA_STPLATE_08");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_MONASTERY_03");
		Wld_InsertItem(ItPl_Dex_Herb_01,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_04_01");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ROAM_NW_TROLLAREA_RITUAL_08_01");
		Wld_InsertItem(ItPl_Health_Herb_03,"FP_ROAM_NW_TROLLAREA_RITUAL_08_02");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ROAM_NW_TROLLAREA_RITUALPATH_02_02");
		Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ROAM_NW_TROLLAREA_RITUALPATH_04_04");
		Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ROAM_NW_TROLLAREA_RITUALPATH_04_05");
		Mob_CreateItems("CHEST_LOBART",ItFo_Apple,5);
		Mob_CreateItems("CHEST_LOBART",ItFo_Bread,1);
		Mob_CreateItems("CHEST_LOBART",ItFo_Honey,1);
		Mob_CreateItems("CHEST_LOBART",ItFo_Wine,1);
		Mob_CreateItems("CHEST_LOBART",ItFo_Milk,3);
		Mob_CreateItems("CHEST_RUKHAR",ItFo_Booze,2);
		Mob_CreateItems("CHEST_RUKHAR",ItFo_Bread,1);
		Wld_InsertItem(ItFo_Apple,"FP_ITEM_XARDAS_03");

		if(Bennet.flags == NPC_FLAG_IMMORTAL)
		{
			Bennet.flags = NPC_FLAG_NONE;
		};
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_04");
			Wld_InsertNpc(Draconian,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_04");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_06");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_11");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_09");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_10");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_08");
			Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_MONSTER_10");
			Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_NEARPEASANT7");
			Wld_InsertNpc(orkelite_addon1,"NW_FARM4_WOOD_NEARPEASANT2_14");
		};

		EnterNW_Kapitel4 = TRUE;
	};
	if(Talbin_FollowsThroughPass == LOG_Running)
	{
		Wld_InsertNpc(VLK_4132_Talbin_NW,"LEVELCHANGE");
		Talbin_FollowsThroughPass = LOG_SUCCESS;
	};
};

var int Pal_Schiffswache_Exchange_onetime;
var int Rosi_FleeFromSekob_Kap5;

func void B_ENTER_NEWWORLD_Kapitel_5()
{
	if(EnterNW_Kapitel5 == FALSE)
	{
		if(DarkPathStart == FALSE)
		{
			B_RemoveNpc(Xardas);
			B_RemoveNpc(VLK_401_Cornelius);
			B_StartOtherRoutine(Lester,"XardasWeg");
		};

		if(MIGUEL_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6026_miguel,"NW_CITY_BEER_04");
		};
		if(FISK_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6021_fisk,"NW_CITY_FISK");
		};
		if(TOM_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6025_tom,"NW_CITY_SHOP02_CENTER");
		};
		if(THORUS_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6022_thorus,"NW_CITY_HABOUR_KASERN_18");
		};
		if(SCATTY_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6024_scatty,"NW_CITY_SCATTY");
		};
		if(SNAF_ISDEAD == FALSE)
		{
			Wld_InsertNpc(vlk_6023_snaf,"NW_CITY_HABOUR_TAVERN01_09");
		};

		Wld_InsertNpc(skeleton_warrior_dark,"NW_CITY_SMFOREST_BANDIT_03");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"NW_CITY_SMFOREST_BANDIT_04");

		if(Npc_IsDead(alrik) == FALSE)
		{
			if(Npc_IsDead(edda) == FALSE)
			{
				if(AlrikRECRUITEDDT == FALSE)
				{
					B_StartOtherRoutine(alrik,"Walk");
				};
				if(EDDARECRUITEDDT == FALSE)
				{
					B_StartOtherRoutine(edda,"Friend");
				};
			}
			else
			{
				if(AlrikRECRUITEDDT == FALSE)
				{
					B_StartOtherRoutine(alrik,"WalkOne");
				};
			};
		};
		if(Npc_GetDistToWP(Salandril,"ALTAR") < 10000)
		{
			B_StartOtherRoutine(Salandril,"Start");
		};
		if(Npc_IsDead(Sekob) == FALSE)
		{
			B_StartOtherRoutine(Rosi,"FleeFromSekob");
			B_StartOtherRoutine(Till,"FleeFromSekob");
			Rosi_FleeFromSekob_Kap5 = TRUE;
		};
		if(GornDJG_is_alive == TRUE)
		{
			Wld_InsertNpc(PC_Fighter_NW_nach_DJG,"BIGFARM");
		};
		if(DarkPathStart == FALSE)
		{
			Wld_InsertNpc(Xardas_DT_Demon1,"FP_ROAM_NW_XARDASTOWER_DEMON_02");
			Wld_InsertNpc(Xardas_DT_Demon2,"NW_XARDAS_TOWER_IN1_24");
			Wld_InsertNpc(Xardas_DT_Demon3,"FP_ROAM_NW_XARDASTOWER_DEMON_03");
			Wld_InsertNpc(Xardas_DT_Demon4,"FP_ROAM_NW_XARDASTOWER_DEMON_04");
			Wld_InsertNpc(Xardas_DT_Demon5,"FP_ROAM_NW_XARDASTOWER_DEMON_05");
			Wld_InsertNpc(Xardas_DT_DemonLord,"FP_ROAM_NW_XARDASTOWER_DEMONLORD_01");

			if(RealMode[2] == TRUE)
			{
				Wld_InsertNpc(SKELETON_WARRIOR_DARK_SPEER,"NW_XARDAS_TOWER_IN1_19");
				Wld_InsertNpc(SKELETON_WARRIOR_DARK_AXE,"NW_XARDAS_TOWER_IN1_22");
				Wld_InsertNpc(SKELETON_WARRIOR_DARK,"NW_XARDAS_TOWER_IN1_23");
				Wld_InsertNpc(SKELETON_WARRIOR_DARK_SPEER,"NW_XARDAS_TOWER_IN1_01");
				Wld_InsertNpc(SKELETON_WARRIOR_DARK_AXE,"NW_XARDAS_TOWER_IN1_97");
			};

			Wld_InsertNpc(None_101_Mario,"NW_CITY_ENTRANCE_01");
			Wld_InsertItem(ItWr_HallsofIrdorath_Mis,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
			Wld_InsertItem(ItWr_Seamap_Irdorath,"FP_NW_ITEM_LIBRARY_SEAMAP");
			Wld_InsertItem(ItWr_XardasSeamapBook_Mis,"FP_NW_ITEM_LIBRARY_SEAMAP2");

			if(hero.guild == GIL_KDF)
			{
				if(Npc_IsDead(Sekob) == FALSE)
				{
					CreateInvItems(Sekob,ITWR_DementorObsessionBook_MIS,1);
					B_StartOtherRoutine(Sekob,"Obsessed");
				};
			};

			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_01");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_02");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_03");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_15");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_16");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_17");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_18");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_19");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_20");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_21");
			Wld_InsertItem(ITWR_DementorObsessionBook_MIS,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_04");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_34");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_35");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_26");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_27");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_28");
			Wld_InsertNpc(DMT_DementorAmbientWalker5,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker4,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker2,"CITY1");
		};

		Wld_InsertNpc(Pal_286_RITTER,"CITY1");
		Wld_InsertNpc(Pal_287_Ritter,"CITY1");
		Wld_InsertNpc(Pal_288_Ritter,"CITY1");
		Wld_InsertNpc(Pal_289_Ritter,"CITY1");
		Wld_InsertNpc(Pal_290_Ritter,"CITY1");
		Wld_InsertNpc(Pal_291_Ritter,"CITY1");
		Wld_InsertNpc(Pal_292_Ritter,"CITY1");
		Wld_InsertNpc(Pal_293_Ritter,"CITY1");

		Schiffswache_212.flags = 0;
		Schiffswache_213.flags = 0;
		Pal_220_Schiffswache.flags = 0;
		Pal_221_Schiffswache.flags = 0;
		Pal_222_Schiffswache.flags = 0;
		Pal_223_Schiffswache.flags = 0;
		Pal_224_Schiffswache.flags = 0;
		Pal_225_Schiffswache.flags = 0;
		Pal_226_Schiffswache.flags = 0;
		Pal_227_Schiffswache.flags = 0;
		Pal_228_Schiffswache.flags = 0;
		B_StartOtherRoutine(Pal_220_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_221_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_222_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_223_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_224_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_225_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_226_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_227_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_228_Schiffswache,"ShipFree");
		B_StartOtherRoutine(Pal_230_Ritter,"ShipFree");
		B_StartOtherRoutine(Pal_231_Ritter,"ShipFree");
		B_StartOtherRoutine(Pal_240_Ritter,"ShipFree");
		B_StartOtherRoutine(Pal_241_Ritter,"ShipFree");
		IntroduceCH_05 = TRUE;

		if(Bennet.flags == NPC_FLAG_IMMORTAL)
		{
			Bennet.flags = NPC_FLAG_NONE;
		};

		//--------------------resp Temnogo Ordena----------------------------------------

		Wld_InsertNpc(Skeleton,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(Lesser_Skeleton,"NW_FARM1_PATH_CITY_19_B");
		Wld_InsertNpc(Skeleton,"NW_FARM1_PATH_CITY_05_WOLF");
		Wld_InsertNpc(Zombie02,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(Zombie02,"NW_FARM1_OUT_13");
		Wld_InsertNpc(Zombie02,"NW_FARM1_OUT_15");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_CITYWALL_02_B");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_CITYWALL_05");
		Wld_InsertNpc(skeleton_dark,"NW_FARM1_CITYWALL_05");
		Wld_InsertNpc(Skeleton,"NW_FARM1_CITYWALL_FOREST_03");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM1_CITYWALL_FOREST_04_B");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_CITYWALL_FOREST_08_B");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_CITYWALL_FOREST_07");
		Wld_InsertNpc(SkeletonMage,"NW_FARM1_CITYWALL_FOREST_14");
		Wld_InsertNpc(SkeletonMage,"NW_FARM1_CITYWALL_FOREST_15");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_BANDITS_CAVE_07");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_BANDITS_CAVE_08");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM1_BANDITS_CAVE_03");
		Wld_InsertNpc(Zombie03,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
		Wld_InsertNpc(Zombie02,"NW_FARM2_TAVERNCAVE1_09");
		Wld_InsertNpc(Zombie03,"NW_FARM2_TAVERNCAVE1_10");
		Wld_InsertNpc(Zombie04,"NW_FARM2_TAVERNCAVE1_08");
		Wld_InsertNpc(Skeleton,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(Skeleton,"NW_BIGFARM_LAKE_MONSTER_01_01");
		Wld_InsertNpc(skeleton_warrior,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(Skeleton,"NW_BIGFARM_LAKE_MONSTER_03_01");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_02");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_03");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_04");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_06");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_07");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"NW_FARM4_WOOD_MONSTER_08");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_09");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_10");
		Wld_InsertNpc(skeleton_dark,"NW_CASTLEMINE_TROLL_08");
		Wld_InsertNpc(skeleton_dark,"NW_CASTLEMINE_TROLL_07");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
		Wld_InsertNpc(SkeletonMage,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_07");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_BIGFARM_LAKE_CAVE_08");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_BIGFARM_LAKE_CAVE_13");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_NW_BIGFARMFORESTCAVE_05");
		Wld_InsertNpc(SkeletonMage,"FP_ROAM_NW_BIGFARMFORESTCAVE_10");
		Wld_InsertNpc(SkeletonMage,"FP_ROAM_BIGFARM_LAKE_CAVE_01");
		Wld_InsertNpc(SkeletonMage,"FP_ROAM_BIGFARM_LAKE_CAVE_03");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_BIGFARM_LAKE_CAVE_04");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_BIGFARM_LAKE_CAVE_06");
		Wld_InsertNpc(skeleton_warrior,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(Zombie02,"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");
		Wld_InsertNpc(Skeleton,"NW_SAGITTA_MOREMONSTER_01");
		Wld_InsertNpc(Zombie02,"NW_SAGITTA_MOREMONSTER_03");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_NEARPEASANT7");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_NEARPEASANT2_14");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_NEARPEASANT2_10");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_NEARPEASANT2_8");
		Wld_InsertNpc(Zombie03,"NW_FARM4_WOOD_NEARPEASANT2_7");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_NEARPEASANT2_12");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_N_3");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_N_2");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_FOREST_02");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER08");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER02");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER04");
		Wld_InsertNpc(Skeleton,"NW_CRYPT_MONSTER04");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER06");
		Wld_InsertNpc(Zombie01,"NW_BIGFARM_FOREST_03_NAVIGATION");
		Wld_InsertNpc(Zombie01,"NW_FARM4_WOOD_NAVIGATION_09");
		Wld_InsertNpc(Skeleton,"NW_CASTLEMINE_TROLL_05");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_ALLEE_08_N");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_ALLEE_08_N_2");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_ALLEE_08_N_5");
		Wld_InsertNpc(Zombie03,"NW_FARM3_BIGWOOD_02");
		Wld_InsertNpc(Zombie01,"NW_FARM3_BIGWOOD_03");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVER_02");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVER_04");
		Wld_InsertNpc(Zombie03,"NW_FARM3_PATH_11_SMALLRIVER_08");
		Wld_InsertNpc(Zombie03,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVER_17");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVER_20");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM3_PATH_11_SMALLRIVER_24");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVERMID_03");
		Wld_InsertNpc(Zombie04,"NW_FARM3_PATH_11_SMALLRIVERMID_02");
		Wld_InsertNpc(Zombie01,"NW_FARM3_PATH_12_MONSTER_01");
		Wld_InsertNpc(Zombie01,"NW_FARM3_PATH_12_MONSTER_03");
		Wld_InsertNpc(Zombie04,"NW_FARM3_MOUNTAINLAKE_03");
		Wld_InsertNpc(Zombie04,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
		Wld_InsertNpc(Zombie01,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_LAKE_03_MOVEMENT3");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_BIGFARM_LAKE_03_MOVEMENT5");
		Wld_InsertNpc(Skeleton,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
		Wld_InsertNpc(Skeleton,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
		Wld_InsertNpc(Skeleton_dark,"NW_FARM3_BIGWOOD_04");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_PSINEWLAGER_04");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_PSINEWLAGER_05");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_PSINEWLAGER_06");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_12");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_10");
		Wld_InsertNpc(Zombie03,"FP_ROAM_MEDIUMFOREST_KAP2_28");
		Wld_InsertNpc(Zombie03,"FP_ROAM_MEDIUMFOREST_KAP2_17");
		Wld_InsertNpc(Zombie03,"FP_ROAM_MEDIUMFOREST_KAP2_13");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_36");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_34");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_MEDIUMFOREST_KAP3_04");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_MEDIUMFOREST_KAP3_08");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP3_15");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_17");
		Wld_InsertNpc(Zombie01,"FP_ROAM_MEDIUMFOREST_KAP3_21");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_MEDIUMFOREST_KAP3_23");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_MEDIUMFOREST_KAP3_20");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_27");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_26");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP3_32");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_TO_LIGHTHOUSE_03");
		Wld_InsertNpc(Zombie01,"FP_ROAM_SHIPWRECK_04");
		Wld_InsertNpc(Zombie01,"FP_ROAM_SHIPWRECK_01");
		Wld_InsertNpc(Skeleton,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(Skeleton,"NW_CITY_TO_FOREST_07");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CITY_TO_FOREST_11");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CITY_TO_FOREST_12");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CITY_TO_FOREST_15");
		Wld_InsertNpc(Skeleton,"FP_ROAM_CITY_TO_FOREST_47");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CITY_TO_FOREST_11");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CITY_TO_FOREST_10");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CITYFOREST_KAP3_22");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CITYFOREST_KAP3_20");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_CITYFOREST_KAP3_21");
		Wld_InsertNpc(Zombie02,"FP_ROAM_CITYFOREST_KAP3_23");
		Wld_InsertNpc(Zombie02,"FP_ROAM_CITYFOREST_KAP3_27");
		Wld_InsertNpc(Zombie02,"FP_ROAM_CITYFOREST_KAP3_29");
		Wld_InsertNpc(Zombie02,"FP_ROAM_CITYFOREST_KAP3_30");
		Wld_InsertNpc(Zombie02,"FP_ROAM_CITYFOREST_KAP3_38");
		Wld_InsertNpc(Zombie01,"FP_ROAM_CITY_TO_FOREST_32");
		Wld_InsertNpc(Zombie01,"FP_ROAM_CITY_TO_FOREST_29");
		Wld_InsertNpc(Zombie01,"FP_ROAM_CITY_TO_FOREST_31");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_CITY_TO_FOREST_42");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_CITYFOREST_KAP3_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_07");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_08");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_CITYFOREST_KAP3_09");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_CITYFOREST_KAP3_17");
		Wld_InsertNpc(Lesser_Skeleton,"NW_FOREST_VINOSKELLEREI_01");
		Wld_InsertNpc(Lesser_Skeleton,"NW_CITY_SMFOREST_05");
		Wld_InsertNpc(SkeletonMage,"NW_CITYFOREST_CAVE_A01");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_CAVE_A02");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_CITYFOREST_CAVE_A06");
		Wld_InsertNpc(Lesser_Skeleton,"NW_FARM1_CITYWALL_RIGHT_04");
		Wld_InsertNpc(Zombie03,"NW_FOREST_PATH_38_MONSTER");
		Wld_InsertNpc(Zombie01,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER");
		Wld_InsertNpc(Skeleton,"NW_FOREST_PATH_35_01");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FOREST_PATH_21_MONSTER");
		Wld_InsertNpc(Zombie02,"NW_FARM2_TO_TAVERN_09_MONSTER");
		Wld_InsertNpc(Zombie02,"NW_FARM2_TO_TAVERN_09_MONSTER2");
		Wld_InsertNpc(Zombie02,"NW_FARM2_TO_TAVERN_09_MONSTER3");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM2_TO_TAVERN_09_MONSTER4");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM2_TO_TAVERN_09_MONSTER5");
		Wld_InsertNpc(Skeleton,"NW_CITY_TO_FOREST_04");
		Wld_InsertNpc(Skeleton,"NW_FOREST_CAVE1_01");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_75_2_MONSTER");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_79");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_80_1");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_82");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_82_M");
		Wld_InsertNpc(Skeleton,"NW_FOREST_PATH_66_M");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_FOREST_PATH_62_M");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_57");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_PATH_35_01_MONSTER");
		Wld_InsertNpc(Lesser_Skeleton,"NW_FOREST_PATH_31_NAVIGATION11");
		Wld_InsertNpc(skeleton_dark,"NW_FOREST_PATH_80_1_MOVEMENT6");
		Wld_InsertNpc(skeleton_dark,"NW_FOREST_PATH_80_1_MOVEMENT15");
		Wld_InsertNpc(skeleton_dark,"NW_FOREST_PATH_80_1_MOVEMENT8_M5");
		Wld_InsertNpc(skeleton_dark,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"NW_FOREST_PATH_04_16_MONSTER2");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_04_13");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_04_3");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_04_4");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_FOREST_PATH_72_MONSTER");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_PATH_62_06");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FOREST_PATH_56_MONSTER");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"NW_FOREST_PATH_27_02");
		Wld_InsertNpc(Zombie03,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_35_MONSTER");
		Wld_InsertNpc(orcwarrior2,"NW_FOREST_PATH_31_NAVIGATION_M");
		Wld_InsertNpc(orcwarrior2,"NW_FOREST_PATH_31_NAVIGATION19");
		Wld_InsertNpc(orcwarrior3,"NW_FOREST_PATH_18_MONSTER");
		Wld_InsertNpc(orc_8518_warrior,"NW_FOREST_PATH_79");
		Wld_InsertNpc(orcdog,"NW_FOREST_PATH_72_MONSTER23");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FOREST_PATH_76");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_04_5");
		Wld_InsertNpc(Zombie02,"NW_FOREST_PATH_04_5");
		Wld_InsertNpc(Zombie01,"NW_FOREST_PATH_04_14_MONSTER");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_CITY_SMFOREST_03_M");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FOREST_PATH_25_01_M");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_CAVE1_IN_04_B99");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_CAVE1_IN_04");
		Wld_InsertNpc(skeleton_warrior,"NW_FOREST_CAVE1_IN_05");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_FOREST_CAVE1_IN_06");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_SMFOREST_07");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_SMFOREST_BANDIT_02");
		Wld_InsertNpc(skeleton_dark,"NW_MAGECAVE_23");
		Wld_InsertNpc(skeleton_dark,"NW_MAGECAVE_27");
		Wld_InsertNpc(SkeletonMage,"NW_TROLLAREA_PATH_56");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_TROLLAREA_SEA_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_TROLLAREA_SEA_02");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_TROLLAREA_SEA_03");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_TROLLAREA_SEA_04");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_RITUALFOREST_CAVE_05");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_RITUALFOREST_CAVE_07");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_RITUALFOREST_CAVE_08");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_RITUALFOREST_CAVE_09");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_RITUALFOREST_CAVE_11");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_TROLLAREA_RUINS_01");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_05");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_09");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_NW_TROLLAREA_RUINS_14");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_NW_TROLLAREA_RUINS_15");
		Wld_InsertNpc(Zombie01,"NW_TROLLAREA_RUINS_21");
		Wld_InsertNpc(Zombie01,"FP_ROAM_NW_TROLLAREA_RUINS_21");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_RUINS_24");
		Wld_InsertNpc(Zombie01,"FP_ROAM_NW_TROLLAREA_RUINS_28");
		Wld_InsertNpc(Zombie01,"FP_ROAM_NW_TROLLAREA_RUINS_29");
		Wld_InsertNpc(Zombie01,"FP_ROAM_NW_TROLLAREA_RUINS_30");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"FP_ROAM_NW_TROLLAREA_RUINS_10");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_06");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_07");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_09");
		Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_10");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_11");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_12");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_RUINS_CAVE_14");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_16");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_21");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_23");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_15_A");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_15_B");
		Wld_InsertNpc(Gobbo_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_17_A");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_12");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_09");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_08");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_PORTALTEMPEL_06");
		Wld_InsertNpc(Skeleton,"NW_TROLLAREA_PATH_66_MONSTER");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_07");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_NOVCHASE_01");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_PATH_38_MONSTER");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_RUINS_17");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RUINS_14");
		Wld_InsertNpc(Zombie01,"NW_TROLLAREA_RUINS_32");
		Wld_InsertNpc(Zombie04,"NW_TROLLAREA_PATH_71_MONSTER");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PATH_71_MONSTER2");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PATH_15_MONSTER");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_RITUALPATH_04");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
		Wld_InsertNpc(Zombie04,"NW_TROLLAREA_PATH_08");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_BRIGDE_05");
		Wld_InsertNpc(Skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_10");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_TROLLLAKECAVE_02");
		Wld_InsertNpc(Gobbo_Warrior,"NW_TROLLAREA_TROLLLAKECAVE_08");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_TROLLLAKECAVE_09");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_TROLLAREA_RIVERSIDECAVE_02");
		Wld_InsertNpc(skeleton_warrior_dark,"NW_TROLLAREA_RIVERSIDECAVE_07");
		Wld_InsertNpc(Gobbo_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_24");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_22");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_23");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_25");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_26");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_RITUAL_13");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_CITY_TO_FOREST_50");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_CITY_TO_FOREST_49");
		Wld_InsertNpc(Skeleton,"NW_CITY_TO_FOREST_10");
		Wld_InsertNpc(Skeleton,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Zombie04,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(Zombie04,"NW_TROLLAREA_PATH_75");
		Wld_InsertNpc(Zombie01,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FOREST_PATH_62_02");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(Zombie03,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(Skeleton,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(Zombie02,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(Zombie03,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Zombie03,"NW_PATH_TO_MONASTER_MONSTER22");
		Wld_InsertNpc(Zombie02,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(Zombie02,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_CITY_TO_FOREST_34");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(Zombie03,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(Zombie04,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(Gobbo_Black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(Lesser_Skeleton,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP2_01");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP2_02");
		Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP2_05");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_RIVERSIDE_09");
		Wld_InsertNpc(Zombie02,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
		Wld_InsertNpc(Zombie04,"NW_TROLLAREA_RIVERSIDE_05");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(Zombie03,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_RUINS_36");
		Wld_InsertNpc(Skeleton,"NW_PATH_TO_MONASTER_AREA_10");
		Wld_InsertNpc(Lesser_Skeleton,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_LAKE_03_MOVEMENT5");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_N_3");
		Wld_InsertNpc(skeleton_warrior_dark_axe,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(skeleton_dark,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(skeleton_dark,"NW_CASTLEMINE_TROLL_02");
		Wld_InsertNpc(skeleton_dark,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(skeleton_dark,"NW_FARM3_MOUNTAINLAKE_03");
		Wld_InsertNpc(skeleton_dark,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(Zombie02,"NW_LITTLESTONEHENDGE");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(Zombie01,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(Zombie04,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_BRIGDE_01");
		Wld_InsertNpc(Lesser_Skeleton,"NW_TROLLAREA_BRIGDE_01");

		Wld_InsertNpc(Lesser_Skeleton,"FP_CAMPFIRE_NW_ATC_ORC_50");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_NW_ATC_ORC_177");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_176");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_178");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_ATC_ORC_179");
		Wld_InsertNpc(Zombie04,"NW_CITY_CONNECT_FOREST");

		Wld_InsertNpc(Lesser_Skeleton,"FP_CAMPFIRE_NW_ATC_ORC_124");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_101");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_102");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_104");
		Wld_InsertNpc(Zombie02,"NW_FARM1_CONNECT_CITY");

		Wld_InsertNpc(Lesser_Skeleton,"NW_BIGFARM_VORPOSTEN1_01");
		Wld_InsertNpc(skeleton_dark,"NW_BIGFARM_CAMPON_56");
		Wld_InsertNpc(skeleton_warrior,"NW_BIGFARM_VORPOSTEN1_02");
		Wld_InsertNpc(skeleton_dark,"NW_BIGFARM_ALLEE_01");
		Wld_InsertNpc(Lesser_Skeleton,"NW_BIGFARM_PATH_HODGES");
		Wld_InsertNpc(skeleton_dark,"NW_BIGFARM_CAMPON_KDF_07");
		Wld_InsertNpc(skeleton_warrior,"NW_BIGFARM_CAMPON_KDF_01");
		Wld_InsertNpc(skeleton_dark,"NW_BIGFARM_CAMPON_66");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_PATH_04");
		Wld_InsertNpc(Zombie04,"NW_BIGFARM_HOUSE_OUT_04");
		Wld_InsertNpc(skeleton_dark,"NW_BIGFARM_CAMPON_KDF_04");
		Wld_InsertNpc(Lesser_Skeleton,"NW_BIGFARM_PATH_02");

		Wld_InsertNpc(skeleton_warrior,"WP_NW_PSICAMP_PATH_LESTER");
		Wld_InsertNpc(skeleton_dark,"WP_NW_PSICAMP_PATH_02");
		Wld_InsertNpc(Zombie02,"WP_NW_PSICAMP_PATH_02_01");

		Wld_InsertNpc(skeleton_dark,"FP_STAND_NW_ATC_PAL_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_401");
		Wld_InsertNpc(skeleton_dark,"FP_STAND_NW_ATC_PAL_04");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_ATC_ORC_400");
		Wld_InsertNpc(Zombie04,"FP_ROAM_NW_ATC_BOWMEN_30");
		Wld_InsertNpc(skeleton_dark,"FP_STAND_NW_ATC_PAL_12");
		Wld_InsertNpc(Lesser_Skeleton,"NW_PASS_GATE_01");


		Wld_InsertNpc(PAL_9171_RITTER,"NW_CITY_DEADWATCH_01");
		Wld_InsertNpc(PAL_9172_RITTER,"NW_CITY_DEADWATCH_02");
		Wld_InsertNpc(PAL_9173_RITTER,"NW_CITY_DEADWATCH_03");
		Wld_InsertNpc(PAL_9174_RITTER,"NW_CITY_DEADWATCH_04");
		Wld_InsertNpc(PAL_9175_RITTER,"NW_CITY_DEADWATCH_05");


		//--------------------resp Temnogo Ordena----------------------------------------

		if(DarkPathStart == FALSE)
		{
			B_KillNpc(xardas_skeleton_guard_01);
			B_KillNpc(xardas_skeleton_guard_02);
			B_KillNpc(Xardas_Skeleton_Servant_01);
			B_KillNpc(Xardas_Skeleton_Servant_02);
		};

		EnterNW_Kapitel5 = TRUE;
	};
	if((MIS_OCGateOpen == TRUE) && (Pal_Schiffswache_Exchange_onetime == FALSE))
	{
		B_StartOtherRoutine(PAL_212_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_213_Schiffswache,"ShipFree");
		Pal_Schiffswache_Exchange_onetime = TRUE;
		MIS_ShipIsFree = TRUE;
	};
	if((Biff_FollowsThroughPass == LOG_Running) && (DJG_BIFF_ISDEAD == FALSE))
	{
		Wld_InsertNpc(DJG_713_Biff_NW,"LEVELCHANGE");
		Biff_FollowsThroughPass = LOG_SUCCESS;
	};
};

func void B_ENTER_NEWWORLD_Kapitel_6()
{
	if(EnterNW_Kapitel6 == FALSE)
	{
		if((SNIPSGETNUGGETS == TRUE) && (SNIPESRECRUITEDDT == FALSE))
		{
			B_KillNpc(BAU_987_SNIPES);
		};
		if(Bartok_InCamp == FALSE)
		{
			B_KillNpc(VLK_440_Bartok);
		};
		if(RosiTillDied == TRUE)
		{
			B_KillNpc(BAU_936_Rosi);
			B_KillNpc(BAU_931_Till);
		};
		if(MIS_HOLGER_QUEST >= 5)
		{
			B_KillNpc(NOV_11114_HOLGER);
		};
		if(MIS_KILLWAY == FALSE)
		{
			B_KillNpc(PIR_1390_Addon_InExtremo_DrPymonte);
			B_KillNpc(PIR_1391_Addon_InExtremo_TheFlail);
			B_KillNpc(PIR_1395_Addon_InExtremo_Lutter);
			B_KillNpc(PIR_1396_Addon_InExtremo_Flex);
			B_KillNpc(pir_1397_addon_inextremo_charlotte);
			B_KillNpc(pir_1398_addon_inextremo_announcer);
		};

		B_KillNpc(Mil_309_Stadtwache);
		B_KillNpc(Mil_310_Stadtwache);
		B_KillNpc(VLK_458_Rupert);
		B_KillNpc(VLK_499_Buerger);
		B_KillNpc(VLK_416_Matteo);
		B_KillNpc(Mil_325_Miliz);
		B_KillNpc(VLK_425_Regis);
		B_KillNpc(VLK_451_Buerger);
		B_KillNpc(VLK_452_Buerger);
		B_KillNpc(VLK_413_Bosper);
		B_KillNpc(VLK_427_Buergerin);
		B_KillNpc(VLK_462_Thorben);
		B_KillNpc(VLK_418_Gritta);
		B_KillNpc(VLK_457_Brian);
		B_KillNpc(VLK_448_Joe);
		B_KillNpc(MIL_319_Pablo);
		B_KillNpc(VLK_417_Constantino);
		B_KillNpc(VLK_420_Coragon);
		B_KillNpc(Mil_323_Miliz);
		B_KillNpc(VLK_426_Buergerin);
		B_KillNpc(VLK_428_Buergerin);
		B_KillNpc(VLK_450_Buerger);
		B_KillNpc(VLK_454_Buerger);
		B_KillNpc(VLK_455_Buerger);
		B_KillNpc(Mil_322_Miliz);
		B_KillNpc(VLK_4201_Wirt);
		B_KillNpc(NOV_602_Ulf);
		B_KillNpc(VLK_406_Herold);
		B_KillNpc(VLK_456_Abuyin);
		B_KillNpc(VLK_414_Hanna);
		B_KillNpc(VLK_407_Hakon);
		B_KillNpc(VLK_408_Jora);
		B_KillNpc(VLK_409_Zuris);
		B_KillNpc(VLK_410_Baltram);
		B_KillNpc(VLK_470_Sarah);
		B_KillNpc(VLK_492_Rengaru);
		B_KillNpc(VLK_486_Buergerin);
		B_KillNpc(VLK_495_Buergerin);
		B_KillNpc(VLK_496_Buergerin);
		B_KillNpc(VLK_497_Buergerin);
		B_KillNpc(Mil_320_Miliz);
		B_KillNpc(Mil_332_Stadtwache);
		B_KillNpc(Mil_333_Stadtwache);
		B_KillNpc(VLK_484_Lehmar);
		B_KillNpc(VLK_488_Buergerin);
		B_KillNpc(VLK_415_Meldor);
		B_KillNpc(VLK_487_Buergerin);

		if(AlrikRECRUITEDDT == FALSE)
		{
			B_KillNpc(VLK_438_Alrik);
		};

		B_KillNpc(VLK_467_Buerger);
		B_KillNpc(VLK_475_Buerger);
		B_KillNpc(VLK_489_Buerger);
		B_KillNpc(Vlk_424_Alwin);
		B_KillNpc(VLK_479_Lucy);

		if(CARLRECRUITEDDT == FALSE)
		{
			B_KillNpc(VLK_461_Carl);
		};

		B_KillNpc(VLK_429_Buergerin);
		B_KillNpc(VLK_453_Buerger);
		B_KillNpc(VLK_430_Buergerin);
		B_KillNpc(VLK_498_Ignaz);

		if(EDDARECRUITEDDT == FALSE)
		{
			B_KillNpc(VLK_471_Edda);
		};

		B_KillNpc(VLK_480_Fellan);
		B_KillNpc(VLK_478_Buergerin);
		B_KillNpc(VLK_481_Buerger);
		B_KillNpc(VLK_482_Buergerin);
		B_KillNpc(VLK_466_Gernod);
		B_KillNpc(VLK_485_Buergerin);
		B_KillNpc(VLK_459_Buerger);
		B_KillNpc(VLK_472_Buergerin);
		B_KillNpc(VLK_460_Buerger);
		B_KillNpc(VLK_473_Buergerin);
		B_KillNpc(VLK_432_Moe);
		B_KillNpc(VLK_431_Kardif);
		B_KillNpc(VLK_493_Nagur);
		B_KillNpc(VLK_433_Bromor);
		B_KillNpc(VLK_434_Borka);
		B_KillNpc(VLK_435_Nadja);
		B_KillNpc(VLK_436_Sonja);
		B_KillNpc(VLK_491_Vanja);
		B_KillNpc(VLK_469_Halvor);
		B_KillNpc(VLK_476_Fenia);
		B_KillNpc(VLK_437_Brahim);
		B_KillNpc(VLK_477_Buergerin);
		B_KillNpc(VLK_441_Garvell);
		B_KillNpc(VLK_442_Arbeiter);
		B_KillNpc(VLK_443_Arbeiter);
		B_KillNpc(Mil_350_Addon_Martin);

		if(FARIMRECRUITEDDT == FALSE)
		{
			B_KillNpc(VLK_4301_Addon_Farim);
		};

		B_KillNpc(MIL_324_Peck);
		B_KillNpc(Mil_317_Ruga);
		B_KillNpc(Mil_313_Boltan);
		B_KillNpc(Mil_327_Miliz);
		B_KillNpc(Mil_314_Mortis);
		B_KillNpc(Mil_315_Kasernenwache);
		B_KillNpc(Mil_329_Miliz);
		B_KillNpc(Mil_359_Miliz);
		B_KillNpc(Mil_330_Miliz);
		B_KillNpc(Mil_331_Miliz);
		B_KillNpc(Mil_318_Miliz);
		B_KillNpc(Mil_328_Miliz);
		B_KillNpc(Mil_337_Mika);
		B_KillNpc(PIR_1301_Addon_Skip_NW);
		B_KillNpc(Mil_304_Torwache);
		B_KillNpc(Mil_305_Torwache);
		B_KillNpc(PAL_203_Lothar);
		B_KillNpc(VLK_400_Larius);
		B_KillNpc(Vlk_402_Richter);
		B_KillNpc(VLK_403_Gerbrandt);
		B_KillNpc(VLK_6038_BUERGER);
		B_KillNpc(VLK_6039_BUERGER);
		B_KillNpc(VLK_6040_BUERGER);
		B_KillNpc(VLK_6041_BUERGER);
		B_KillNpc(VLK_404_Lutero);
		B_KillNpc(VLK_405_Fernando);

		if(GAYVERNRECRUITEDDT == FALSE)
		{
			B_KillNpc(vlk_6132_gayvern);
		};

		B_KillNpc(vlk_6133_maxi);

		if(VALERANRECRUITEDDT == FALSE)
		{
			B_KillNpc(vlk_6134_valeran);
		};

		B_KillNpc(VLK_411_Gaertner);
		B_KillNpc(VLK_419_Buerger);
		B_KillNpc(VLK_4000_Buerger);
		B_KillNpc(VLK_4001_Buergerin);
		B_KillNpc(VLK_4002_Buergerin);
		B_KillNpc(VLK_4003_Buergerin);
		B_KillNpc(VLK_4004_Arbeiter);
		B_KillNpc(VLK_4005_Arbeiter);
		B_KillNpc(Mil_302_Torwache);
		B_KillNpc(Mil_303_Torwache);
		B_KillNpc(Mil_306_Tuerwache);
		B_KillNpc(Mil_307_Tuerwache);
		B_KillNpc(Mil_316_Wambo);
		B_KillNpc(MIL_321_Rangar);
		B_KillNpc(Mil_326_Miliz);
		B_KillNpc(mil_357_miliz);
		B_KillNpc(mil_358_miliz);

		if(VIPERRECRUITEDDT == FALSE)
		{
			B_KillNpc(vlk_986_viper);
		};

		B_KillNpc(STRF_1124_Addon_Monty_NW);
		B_KillNpc(vlk_6028_buerger);
		//B_KillNpc(vlk_6029_buergerin);
		B_KillNpc(vlk_6030_buerger);
		//B_KillNpc(vlk_6031_buergerin);
		//B_KillNpc(vlk_6032_buergerin);
		B_KillNpc(vlk_6033_buerger);
		//B_KillNpc(vlk_6034_buergerin);
		B_KillNpc(vlk_6035_buerger);
		//B_KillNpc(vlk_6036_buergerin);
		B_KillNpc(vlk_6037_buerger);
		B_KillNpc(VLK_4302_Addon_Elvrich);
		B_KillNpc(SLD_827_Soeldner);
		B_KillNpc(BAU_930_Sekob);
		B_KillNpc(BAU_932_Balthasar);
		B_KillNpc(PAL_187_MELHIOR);
		B_KillNpc(BAU_933_Rega);
		B_KillNpc(BAU_934_Babera);
		B_KillNpc(BAU_935_Bronko);
		B_KillNpc(BAU_937_Bauer);
		B_KillNpc(BAU_938_Bauer);
		B_KillNpc(BAU_970_Orlan);
		B_KillNpc(SLD_851_Roscoe);
		B_KillNpc(BAU_971_Bauer);
		B_KillNpc(BAU_972_Bauer);
		B_KillNpc(BAU_973_Rukhar);
		B_KillNpc(BAU_974_Bauer);

		if(EROLRECRUITEDDT == FALSE)
		{
			B_KillNpc(VLK_4303_Addon_Erol);
		};

		B_KillNpc(vlk_6026_miguel);
		B_KillNpc(vlk_6021_fisk);
		B_KillNpc(vlk_6025_tom);
		B_KillNpc(vlk_6023_snaf);
		B_KillNpc(pal_188_ritter);
		B_KillNpc(pal_189_ritter);
		B_KillNpc(VLK_412_Harad);
		B_KillNpc(vlk_6027_taliasan);
		B_KillNpc(BAU_954_Maleth);
		B_KillNpc(BAU_950_Lobart);
		B_KillNpc(BAU_951_Hilda);
		B_KillNpc(BAU_952_Vino);
		B_KillNpc(BAU_953_Bauer);
		B_KillNpc(BAU_955_Bauer);
		B_KillNpc(vlk_989_reinar);
		B_KillNpc(PAL_9171_RITTER);
		B_KillNpc(PAL_9172_RITTER);
		B_KillNpc(PAL_9173_RITTER);
		B_KillNpc(PAL_9174_RITTER);
		B_KillNpc(PAL_9175_RITTER);
		B_KillNpc(VLK_4991_Fisher);
		B_KillNpc(VLK_4992_Fisher);
		B_KillNpc(VLK_4993_Fisher);
		B_KillNpc(VLK_4350_Priscila);
		B_KillNpc(Pal_204_Torwache);
		B_KillNpc(Pal_205_Torwache);
		B_KillNpc(Pal_206_Ritter);
		B_KillNpc(Pal_208_Paladin);
		B_KillNpc(Pal_209_Paladin);
		B_KillNpc(Pal_210_Torwache);
		B_KillNpc(Pal_211_Torwache);
		B_KillNpc(Pal_226_Schiffswache);
		B_KillNpc(Pal_220_Schiffswache);
		B_KillNpc(Pal_286_RITTER);
		B_KillNpc(Pal_287_Ritter);
		B_KillNpc(Pal_288_Ritter);
		B_KillNpc(Pal_289_Ritter);
		B_KillNpc(Pal_290_Ritter);
		B_KillNpc(Pal_292_Ritter);
		B_KillNpc(Pal_293_Ritter);
		B_KillNpc(PAL_213_Schiffswache);
		B_KillNpc(VLK_6137_GASPAR);
		B_KillNpc(VLK_660_Olaf);
		B_KillNpc(VLK_661_Graden);
		B_KillNpc(VLK_662_Bram);
		B_KillNpc(VLK_663_Valgard);
		B_KillNpc(VLK_664_Masbo);

		if(MoveKillNewPlace == FALSE)
		{
			B_RemoveNpc(pir_1397_addon_inextremo_charlotte);
			B_RemoveNpc(PIR_1390_Addon_InExtremo_DrPymonte);
			B_RemoveNpc(PIR_1391_Addon_InExtremo_TheFlail);
			B_RemoveNpc(PIR_1395_Addon_InExtremo_Lutter);
			B_RemoveNpc(PIR_1396_Addon_InExtremo_Flex);
			NewsKillDead = TRUE;
		};

		B_RemoveNpc(VLK_6120_LEMARGUARD);
		B_RemoveNpc(SEK_8034_NOVIZE);

		if(MIS_NOVICECANJOIN == LOG_SUCCESS)
		{
			B_StartOtherRoutine(VLK_421_Valentino,"PsiCamp");
		}
		else
		{
			B_KillNpc(VLK_421_Valentino);
		};

		B_StartOtherRoutine(BAU_935_Bronko,"CampOn");
		B_RemoveNpc(VLK_6130_BENCHEL);
		B_StartOtherRoutine(PAL_212_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_213_Schiffswache,"ShipFree");

		if(Npc_IsDead(STRF_1126_Addon_Telbor_NW) == FALSE)
		{
			B_StartOtherRoutine(STRF_1126_Addon_Telbor_NW,"HideInCave");
		};
		if(Npc_IsDead(STRF_1125_Addon_Tonak_NW) == FALSE)
		{
			B_StartOtherRoutine(STRF_1125_Addon_Tonak_NW,"HideInCave");
		};
		if(Npc_IsDead(BAU_940_Akil) == FALSE)
		{
			B_StartOtherRoutine(BAU_940_Akil,"HideInCave");
		};
		if(Npc_IsDead(BAU_941_Kati) == FALSE)
		{
			B_StartOtherRoutine(BAU_941_Kati,"HideInCave");
		};
		if(Npc_IsDead(vlk_988_gravo) == FALSE)
		{
			B_StartOtherRoutine(vlk_988_gravo,"Orcatcbegan");
		};
		if(Npc_IsDead(BAU_942_Randolph) == FALSE)
		{
			B_StartOtherRoutine(BAU_942_Randolph,"HideInCave");
		};
		if(Npc_IsDead(BAU_943_Bauer) == FALSE)
		{
			B_StartOtherRoutine(BAU_943_Bauer,"HideInCave");
		};
		if(Npc_IsDead(BAU_944_Ehnim) == FALSE)
		{
			B_StartOtherRoutine(BAU_944_Ehnim,"HideInCave");
		};
		if(Npc_IsDead(BAU_945_Egill) == FALSE)
		{
			B_StartOtherRoutine(BAU_945_Egill,"HideInCave");
		};
		if(Npc_IsDead(gur_8004_parvez) == FALSE)
		{
			B_StartOtherRoutine(gur_8004_parvez,"Psicamp");
		};
		if(Npc_IsDead(PAL_299_Sergio) == FALSE)
		{
			B_StartOtherRoutine(PAL_299_Sergio,"Monastery");
		};
		if(Npc_IsDead(Sld_816_Fester) == FALSE)
		{
			B_StartOtherRoutine(Sld_816_Fester,"Farm");
		};

		B_StartOtherRoutine(Pal_204_Torwache,"Start");
		B_StartOtherRoutine(Pal_205_Torwache,"Start");
		B_StartOtherRoutine(Pal_206_Ritter,"Start");
		B_StartOtherRoutine(Pal_208_Paladin,"Start");
		B_StartOtherRoutine(Pal_209_Paladin,"Start");
		B_StartOtherRoutine(Pal_210_Torwache,"Start");
		B_StartOtherRoutine(Pal_211_Torwache,"Start");
		B_StartOtherRoutine(BAU_905_Bauer,"OrcWar");
		B_StartOtherRoutine(BAU_915_Baeuerin,"OrcWar");
		B_StartOtherRoutine(dmt_1212_dagot,"WaitInSecretLab");
		B_RemoveNpc(BDT_1009_Bandit_L);
		B_RemoveNpc(BDT_1010_Bandit_L);
		B_RemoveNpc(BDT_1011_Bandit_M);
		B_RemoveNpc(BDT_1025_Bandit_H);
		B_RemoveNpc(BDT_1026_Bandit_H);
		B_RemoveNpc(BDT_1027_Bandit_H);
		B_RemoveNpc(SLD_840_Alvares);
		B_RemoveNpc(SLD_841_Engardo);
		B_RemoveNpc(vlk_6110_nigel);

		if(TELLMORAKREOLDONE == TRUE)
		{
			B_RemoveNpc(PAL_187_MELHIOR);
		};

		if(TOPIC_END_MinenAnteile == FALSE)
		{
			B_KillNpc(VLK_422_Salandril);
		};

		B_StartOtherRoutine(PAL_200_Hagen,"TOT");
		B_StartOtherRoutine(Pal_201_Ingmar,"TOT");
		B_StartOtherRoutine(PAL_202_Albrecht,"TOT");
		B_StartOtherRoutine(Pal_216_Cedric,"TOT");
		B_StartOtherRoutine(MIL_311_Andre,"TOT");
		B_StartOtherRoutine(MIL_312_Wulfgar,"TOT");
		B_StartOtherRoutine(Pal_230_Ritter,"TOT");
		B_StartOtherRoutine(Pal_231_Ritter,"TOT");
		B_StartOtherRoutine(Pal_232_Ritter,"TOT");
		B_StartOtherRoutine(Pal_233_Ritter,"TOT");
		B_StartOtherRoutine(Pal_234_Ritter,"TOT");
		B_StartOtherRoutine(Pal_235_Ritter,"TOT");
		B_StartOtherRoutine(Pal_236_Ritter,"TOT");
		B_StartOtherRoutine(Pal_237_Ritter,"TOT");
		B_StartOtherRoutine(Pal_238_Ritter,"TOT");
		B_StartOtherRoutine(Pal_239_Ritter,"TOT");
		B_StartOtherRoutine(Pal_240_Ritter,"TOT");
		B_StartOtherRoutine(Pal_241_Ritter,"TOT");
		B_StartOtherRoutine(PAL_212_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_214_Ritter,"TOT");
		B_StartOtherRoutine(Pal_215_Ritter,"TOT");
		B_StartOtherRoutine(Pal_291_Ritter,"TOT");
		B_StartOtherRoutine(Pal_221_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_222_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_223_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_224_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_225_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_227_Schiffswache,"TOT");
		B_StartOtherRoutine(Pal_228_Schiffswache,"TOT");

		if(Npc_IsDead(BAU_4300_Addon_Cavalorn) == FALSE)
		{
			B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"FarmHide");
		};
		if((THORUS_ISDEAD == FALSE) && !Npc_IsDead(vlk_6022_thorus))
		{
			B_StartOtherRoutine(vlk_6022_thorus,"OrcAtcBegan");
		};
		if((SCATTY_ISDEAD == FALSE) && !Npc_IsDead(vlk_6024_scatty))
		{
			B_StartOtherRoutine(vlk_6024_scatty,"OrcAtcBegan");
		};
		if(!Npc_IsDead(KDF_511_Daron))
		{
			B_StartOtherRoutine(KDF_511_Daron,"OrcAtcBegan");
		};
		if(!Npc_IsDead(KDF_509_Isgaroth))
		{
			B_StartOtherRoutine(KDF_509_Isgaroth,"OrcAtcBegan");
		};
		if(!Npc_IsDead(KDW_140300_Addon_Myxir_CITY))
		{
			B_StartOtherRoutine(KDW_140300_Addon_Myxir_CITY,"OrcAtcBegan");
		};
		if(!Npc_IsDead(SLD_802_Buster))
		{
			B_StartOtherRoutine(SLD_802_Buster,"OrcAtcBegan");
		};
		if(!Npc_IsDead(BAU_982_Grimbald))
		{
			B_StartOtherRoutine(BAU_982_Grimbald,"OrcAtcBegan");
		};
		if(!Npc_IsDead(BAU_961_Gaan))
		{
			B_StartOtherRoutine(BAU_961_Gaan,"OrcAtcBegan");
		};
		if(!Npc_IsDead(BAU_984_Niclas))
		{
			if(NICLASRECRUITEDDT == FALSE)
			{
				B_StartOtherRoutine(BAU_984_Niclas,"OrcAtcBegan");
			};
		};
		if((JorgenIsCaptain == TRUE) && (LI_CHECK_JORGEN == TRUE))
		{
			B_StartOtherRoutine(VLK_4250_Jorgen,"TOT");
			B_KillNpc(VLK_4250_Jorgen);
		};
		if((TorlofIsCaptain == TRUE) && (LI_CHECK_TORLOF == TRUE))
		{
			B_StartOtherRoutine(SLD_801_Torlof,"TOT");
			B_KillNpc(SLD_801_Torlof);
		};
		if((JackIsCaptain == TRUE) && (LI_CHECK_JACK == TRUE))
		{
			B_StartOtherRoutine(VLK_444_Jack,"TOT");
			B_KillNpc(VLK_444_Jack);
		};
		if((Lee_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LEE == TRUE))
		{
			B_StartOtherRoutine(SLD_800_Lee,"TOT");
			B_KillNpc(SLD_800_Lee);
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_MAGE == TRUE))
		{
			B_StartOtherRoutine(PC_Mage_NW,"TOT");
			B_KillNpc(PC_Mage_NW);
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_PSIONIC == TRUE))
		{
			B_StartOtherRoutine(PC_Psionic,"TOT");
			B_KillNpc(PC_Psionic);
		};
		if((Mario_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_MARIO == TRUE))
		{
			B_StartOtherRoutine(None_101_Mario,"TOT");
			B_KillNpc(None_101_Mario);
		};
		if((Wolf_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_WOLF == TRUE))
		{
			B_StartOtherRoutine(SLD_811_Wolf,"TOT");
			B_KillNpc(SLD_811_Wolf);
		};
		if((Vatras_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_VATRAS == TRUE))
		{
			B_StartOtherRoutine(VLK_439_Vatras,"TOT");
			B_KillNpc(VLK_439_Vatras);
		};
		if((Bennet_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BENNET == TRUE))
		{
			B_StartOtherRoutine(SLD_809_Bennet,"TOT");
			B_KillNpc(SLD_809_Bennet);
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_THIEF == TRUE))
		{
			B_StartOtherRoutine(PC_Thief_NW,"TOT");
			B_KillNpc(PC_Thief_NW);
		};
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_FIGHTER == TRUE))
		{
			B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"TOT");
			B_KillNpc(PC_Fighter_NW_nach_DJG);
		};
		if((Lares_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LARES == TRUE))
		{
			B_StartOtherRoutine(VLK_449_Lares,"TOT");
			B_KillNpc(VLK_449_Lares);
		};
		if((Biff_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BIFF == TRUE))
		{
			B_StartOtherRoutine(DJG_713_Biff_NW,"TOT");
			B_KillNpc(DJG_713_Biff_NW);
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_ANGAR == TRUE))
		{
			B_StartOtherRoutine(DJG_705_Angar_NW,"TOT");
			B_KillNpc(DJG_705_Angar_NW);
		};
		if((Girion_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_GIRION == TRUE))
		{
			B_StartOtherRoutine(Pal_207_Girion,"TOT");
			B_KillNpc(Pal_207_Girion);
		};
		if(LI_CHECK_PEDRO == TRUE)
		{
			B_StartOtherRoutine(NOV_600_Pedro,"TOT");
			B_KillNpc(NOV_600_Pedro);
		};
		if((JorgenIsCaptain == TRUE) && (LI_CHECK_JORGEN == FALSE))
		{
			JORGENBACKNW = TRUE;
			B_StartOtherRoutine(VLK_4250_Jorgen,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((JackIsCaptain == TRUE) && (LI_CHECK_JACK == FALSE))
		{
			JACKBACKNW = TRUE;
			B_StartOtherRoutine(VLK_444_Jack,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((TorlofIsCaptain == TRUE) && (LI_CHECK_TORLOF == FALSE))
		{
			TORLOFBACKNW = TRUE;
			B_StartOtherRoutine(SLD_801_Torlof,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Lee_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LEE == FALSE))
		{
			LEEBACKNW = TRUE;
			B_StartOtherRoutine(SLD_800_Lee,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_MAGE == FALSE))
		{
			MAGEBACKNW = TRUE;
			B_StartOtherRoutine(PC_Mage_NW,"ShipNew");
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_PSIONIC == FALSE))
		{
			PSIONICBACKNW = TRUE;
			B_StartOtherRoutine(PC_Psionic,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Wolf_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_WOLF == FALSE))
		{
			WOLFBACKNW = TRUE;
			B_StartOtherRoutine(SLD_811_Wolf,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Vatras_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_VATRAS == FALSE))
		{
			VATRASBACKNW = TRUE;
			B_StartOtherRoutine(VLK_439_Vatras,"ShipNew");
		};
		if((Bennet_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BENNET == FALSE))
		{
			BENNETBACKNW = TRUE;
			B_StartOtherRoutine(SLD_809_Bennet,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_THIEF == FALSE))
		{
			THIEFBACKNW = TRUE;
			B_StartOtherRoutine(PC_Thief_NW,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_FIGHTER == FALSE))
		{
			FIGHTERBACKNW = TRUE;
			B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Ship_New");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Lares_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LARES == FALSE))
		{
			LARESBACKNW = TRUE;
			B_StartOtherRoutine(VLK_449_Lares,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Biff_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BIFF == FALSE))
		{
			BIFFBACKNW = TRUE;
			B_StartOtherRoutine(DJG_713_Biff_NW,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_ANGAR == FALSE))
		{
			ANGARBACKNW = TRUE;
			B_StartOtherRoutine(DJG_705_Angar_NW,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((Girion_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_GIRION == FALSE))
		{
			GIRIONBACKNW = TRUE;
			B_StartOtherRoutine(Pal_207_Girion,"ShipNew");
			GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW + 1;
		};
		if((LI_CHECK_PEDRO == FALSE) && (PEDROWITHUS == TRUE))
		{
			PEDROBACKNW = TRUE;
			B_StartOtherRoutine(NOV_600_Pedro,"Ship");
		};
		if((JorgenIsCaptain == FALSE) && !Npc_IsDead(VLK_4250_Jorgen))
		{
			B_StartOtherRoutine(VLK_4250_Jorgen,"TOT");
			B_KillNpc_Force(VLK_4250_Jorgen);
		};
		if((JackIsCaptain == FALSE) && !Npc_IsDead(VLK_444_Jack))
		{
			B_StartOtherRoutine(VLK_444_Jack,"TOT");
			B_KillNpc(VLK_444_Jack);
		};
		if((MiltenNW_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(PC_Mage_NW))
		{
			B_StartOtherRoutine(PC_Mage_NW,"OrcAtcNW");
		};
		if((Lester_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(PC_Psionic))
		{
			B_StartOtherRoutine(PC_Psionic,"PsiCamp");
		};
		if(Mario_IsOnBoard != LOG_SUCCESS)
		{
			B_KillNpc(None_101_Mario);
		};
		if((Vatras_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(VLK_439_Vatras))
		{
			B_StartOtherRoutine(VLK_439_Vatras,"OrcAtcNW");
		};
		if((Diego_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(PC_Thief_NW))
		{
			B_StartOtherRoutine(PC_Thief_NW,"OrcAtcNW");
		};
		if((Lares_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(VLK_449_Lares))
		{
			B_StartOtherRoutine(VLK_449_Lares,"OrcAtcNW");
		};
		if((Biff_IsOnBoard != LOG_SUCCESS) && (Biff_FollowsThroughPass == LOG_SUCCESS) && !Npc_IsDead(DJG_713_Biff_NW))
		{
			B_StartOtherRoutine(DJG_713_Biff_NW,"OrcAtcNW");
		};
		if((Girion_IsOnBoard != LOG_SUCCESS) && !Npc_IsDead(Pal_207_Girion))
		{
			B_StartOtherRoutine(Pal_207_Girion,"TOT");
		};

		B_StartOtherRoutine(KDF_500_Pyrokar,"Ship");
		B_RemoveNpc(SLD_806_Sylvio);
		B_RemoveNpc(Sld_807_Bullco);
		B_RemoveNpc(Sld_803_Cipher);
		B_RemoveNpc(Sld_804_Rod);
		B_StartOtherRoutine(SLD_821_Soeldner,"RODWEG");


		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_01");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_FARM1_PATH_SPAWN_03_02");
		Wld_InsertNpc(orkelite_addon2,"FP_STAND_DEMENTOR_KDF_25");
		Wld_InsertNpc(orkelite_addon2,"FP_STAND_DEMENTOR_16");
		Wld_InsertNpc(orkelite_addon2,"FP_STAND_DEMENTOR_KDF_24");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_FARM1_GOBBO_01");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM1_FIELD_06");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM1_FIELD_05");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM1_FIELD_04");
		Wld_InsertNpc(orkelite_addon2,"NW_FARM1_FIELD_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_07");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_08");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_10");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_11");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_12");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_13");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_14");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM1_SHEEP_15");

		if(FLAG_ORCS_CHK_26 == TRUE)
		{
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_02");
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_13");
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_04_B");
			Wld_InsertNpc(orcwarrior4,"NW_PASS_13");
			Wld_InsertNpc(orcwarrior4,"NW_PASS_14");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_07");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_06");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_01");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_04");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_08");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_03");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_03");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_09");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_10");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_12");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_PASS_ORK_WATCHER");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_05");
			Wld_InsertNpc(orkelite_addon3_chkflg_26,"NW_PASS_ORKS_03");
			FLAG_ORCS_CHK_26 = FALSE;
		};

		Wld_InsertNpc(bloodfly_poison,"NW_FARM1_PATH_SPAWN_02");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(Gobbo_Black,"NW_FARM1_PATH_CITY_19_B");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM1_PATH_CITY_10_B");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_PATH_CITY_05_B");
		Wld_InsertNpc(DragonSnapper,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(DragonSnapper,"NW_FARM1_OUT_13");
		Wld_InsertNpc(DragonSnapper,"NW_FARM1_OUT_15");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM1_CITYWALL_02_B");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_CITYWALL_FOREST_03");
		Wld_InsertNpc(Shadowbeast,"NW_FARM1_CITYWALL_FOREST_04_B");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM1_CITYWALL_FOREST_06");
		Wld_InsertNpc(Shadowbeast,"NW_FARM1_CITYWALL_FOREST_08_B");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_TOWER_04");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_PATH_FARM1_11");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_MONSTER_INSERT_01");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
		Wld_InsertNpc(FireWaran,"FP_ROAM_XARDAS_SECRET_08");
		Wld_InsertNpc(FireWaran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(FireWaran,"FP_ROAM_XARDAS_SECRET_04");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_TOWER_WATERFALL_CAVE_03");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_02");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_GOBBO");
		Wld_InsertNpc(DragonSnapper,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_VALLEY_03");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_VALLEY_04");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_VALLEY_06");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_VALLEY_08");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_TOWER_VALLEY_RAT");
		Wld_InsertNpc(BlackWolf,"NW_XARDAS_TOWER_VALLEY_WOLF");
		Wld_InsertNpc(bloodfly_poison,"NW_XARDAS_TOWER_VALLEY_08");
		Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_TOWER_SECRET_CAVE_01");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_MONSTER22");
		Wld_InsertNpc(scavenger_old,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(Gobbo_Black,"NW_PATH_TO_MONASTER_AREA_02");
		Wld_InsertNpc(Gobbo_Black,"NW_PATH_TO_MONASTER_AREA_10");
		Wld_InsertNpc(Gobbo_Black,"NW_PATH_TO_MONASTER_AREA_08");
		Wld_InsertNpc(Gobbo_Black,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(Lurker,"NW_BIGMILL_FIELD_MONSTER_03");
		Wld_InsertNpc(DragonSnapper,"NW_BIGMILL_FIELD_MONSTER_01");
		Wld_InsertNpc(DragonSnapper,"NW_BIGMILL_FIELD_MONSTER_02");
		Wld_InsertNpc(scavenger_old,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
		Wld_InsertNpc(BlackWolf,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
		Wld_InsertNpc(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(BlackWolf,"NW_BIGFARM_LAKE_MONSTER_01_01");
		Wld_InsertNpc(Lurker,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(BlackWolf,"NW_BIGFARM_LAKE_MONSTER_03_01");
		Wld_InsertNpc(Lurker,"NW_LAKE_GREG_TREASURE_01");
		Wld_InsertNpc(Warg,"NW_FARM4_WOOD_MONSTER_01");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_MONSTER_02");
		Wld_InsertNpc(BlackWolf,"NW_FARM4_WOOD_MONSTER_03");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_04");
		Wld_InsertNpc(BlackWolf,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_MONSTER_06");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_MONSTER_07");
		Wld_InsertNpc(Shadowbeast,"NW_FARM4_WOOD_MONSTER_08");
		Wld_InsertNpc(skeleton_dark,"NW_FARM4_WOOD_MONSTER_09");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_MONSTER_10");
		Wld_InsertNpc(Troll_Black,"NW_CASTLEMINE_TROLL_08");
		Wld_InsertNpc(Troll_Black,"NW_TROLLAREA_PATH_84");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
		Wld_InsertNpc(Gobbo_Warrior,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_07");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_08");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_10");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_11");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_BIGFARM_LAKE_CAVE_13");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_BIGFARMFORESTCAVE_05");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_BIGFARMFORESTCAVE_07");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_NW_BIGFARMFORESTCAVE_08");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_BIGFARMFORESTCAVE_10");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_01");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_03");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_04");
		Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_05");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_BIGFARM_LAKE_CAVE_06");
		Wld_InsertNpc(bloodfly_poison,"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
		Wld_InsertNpc(DragonSnapper,"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");
		Wld_InsertNpc(BlackWolf,"NW_SAGITTA_MOREMONSTER_01");
		Wld_InsertNpc(DragonSnapper,"NW_SAGITTA_MOREMONSTER_03");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_NEARPEASANT7");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_NEARPEASANT2_14");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM4_WOOD_NEARPEASANT2_10");
		Wld_InsertNpc(BlackWolf,"NW_FARM4_WOOD_NEARPEASANT2_8");
		Wld_InsertNpc(Scavenger,"NW_FARM4_WOOD_NEARPEASANT2_7");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_NEARPEASANT2_12");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_N_3");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_N_2");
		Wld_InsertNpc(DragonSnapper,"NW_BIGFARM_FOREST_02");
		Wld_InsertNpc(Keiler,"NW_BIGFARM_FOREST_03_NAVIGATION");
		Wld_InsertNpc(Keiler,"NW_FARM4_WOOD_NAVIGATION_09");
		Wld_InsertNpc(BlackWolf,"NW_CASTLEMINE_TROLL_05");
		Wld_InsertNpc(DragonSnapper,"NW_BIGFARM_ALLEE_08_N");
		Wld_InsertNpc(DragonSnapper,"NW_BIGFARM_ALLEE_08_N_2");
		Wld_InsertNpc(DragonSnapper,"NW_BIGFARM_ALLEE_08_N_5");
		Wld_InsertNpc(Scavenger,"NW_BIGMILL_FARM3_03");
		Wld_InsertNpc(Scavenger,"NW_FARM3_BIGWOOD_02");
		Wld_InsertNpc(Keiler,"NW_FARM3_BIGWOOD_03");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_02");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_04");
		Wld_InsertNpc(scavenger_old,"NW_FARM3_PATH_11_SMALLRIVER_08");
		Wld_InsertNpc(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_17");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_20");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM3_PATH_11_SMALLRIVER_24");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_02");
		Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_03");
		Wld_InsertNpc(Keiler,"NW_FARM3_PATH_12_MONSTER_01");
		Wld_InsertNpc(Keiler,"NW_FARM3_PATH_12_MONSTER_03");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_03");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
		Wld_InsertNpc(Keiler,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(DragonSnapper,"NW_BIGFARM_LAKE_03_MOVEMENT3");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP2_12");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP2_10");
		Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_28");
		Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_29");
		Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_17");
		Wld_InsertNpc(Scavenger,"FP_ROAM_MEDIUMFOREST_KAP2_13");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP2_36");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP2_34");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_08");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_09");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_11");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MEDIUMFOREST_KAP3_15");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP3_17");
		Wld_InsertNpc(Keiler,"FP_ROAM_MEDIUMFOREST_KAP3_21");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_23");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_28");
		Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_29");
		Wld_InsertNpc(Shadowbeast,"FP_ROAM_MEDIUMFOREST_KAP3_20");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP3_27");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP3_26");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_MEDIUMFOREST_KAP3_32");
		Wld_InsertNpc(BlackWolf,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(BlackWolf,"NW_CITY_TO_FOREST_07");
		Wld_InsertNpc(BlackWolf,"NW_CITY_TO_FOREST_11");
		Wld_InsertNpc(BlackWolf,"NW_CITY_TO_FOREST_12");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_15");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_CITY_TO_FOREST_47");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_CITY_TO_FOREST_11");
		Wld_InsertNpc(FireWaran,"FP_ROAM_CITY_TO_FOREST_32");
		Wld_InsertNpc(FireWaran,"FP_ROAM_CITY_TO_FOREST_31");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITY_TO_FOREST_42");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(Shadowbeast,"FP_ROAM_CITYFOREST_KAP3_04");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_07");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_06");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_08");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_09");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_10");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_11");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_12");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_14");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_15");
		Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_17");
		Wld_InsertNpc(BlackWolf,"NW_FOREST_VINOSKELLEREI_01");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_SMFOREST_05");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_SMFOREST_06");
		Wld_InsertNpc(gobbo_mage,"NW_CITY_SMFOREST_08");
		Wld_InsertNpc(gobbo_mage,"NW_CITY_SMFOREST_09");
		Wld_InsertNpc(BlackWolf,"NW_CITY_SMFOREST_03");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_SMFOREST_01_01");
		Wld_InsertNpc(Shadowbeast,"NW_FOREST_PATH_35_06");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_04_05");
		Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FOREST_04_05_01");
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERN_TO_FOREST_05_05");
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERN_TO_FOREST_05_06");
		Wld_InsertNpc(Gobbo_Green,"NW_CITYFOREST_CAVE_A01");
		Wld_InsertNpc(Gobbo_Black,"NW_CITYFOREST_CAVE_A02");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_CITYWALL_RIGHT_04");
		Wld_InsertNpc(scavenger_old,"NW_FOREST_PATH_38_MONSTER");
		Wld_InsertNpc(Keiler,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER");
		Wld_InsertNpc(BlackWolf,"NW_FOREST_PATH_35_01");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_21_MONSTER");
		Wld_InsertNpc(DragonSnapper,"NW_FARM2_TO_TAVERN_09_MONSTER");
		Wld_InsertNpc(DragonSnapper,"NW_FARM2_TO_TAVERN_09_MONSTER2");
		Wld_InsertNpc(DragonSnapper,"NW_FARM2_TO_TAVERN_09_MONSTER3");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM2_TO_TAVERN_09_MONSTER5");
		Wld_InsertNpc(BlackWolf,"NW_CITY_TO_FOREST_04");
		Wld_InsertNpc(BlackWolf,"NW_FOREST_CAVE1_01");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_75_2_MONSTER");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_79");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_80_1");
		Wld_InsertNpc(FireWaran,"NW_FOREST_PATH_82");
		Wld_InsertNpc(FireWaran,"NW_FOREST_PATH_82_M");
		Wld_InsertNpc(BlackWolf,"NW_FOREST_PATH_66_M");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_57");
		Wld_InsertNpc(bloodfly_poison,"NW_FOREST_PATH_35_01_MONSTER");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_80_1_MOVEMENT8_M");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_80_1_MOVEMENTF");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_31_NAVIGATION3");
		Wld_InsertNpc(Wolf,"NW_FOREST_PATH_31_NAVIGATION10");
		Wld_InsertNpc(BlackWolf,"NW_FOREST_PATH_31_NAVIGATION11");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER2");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_04_13");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_04_3");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_04_4");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER");
		Wld_InsertNpc(bloodfly_poison,"NW_FOREST_PATH_62_06");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_56_MONSTER");
		Wld_InsertNpc(bloodfly_poison,"NW_FOREST_PATH_27_03");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_27_02");
		Wld_InsertNpc(Scavenger,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
		Wld_InsertNpc(bloodfly_poison,"NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_35_MONSTER");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION_M");
		Wld_InsertNpc(orcwarrior4,"NW_FOREST_PATH_31_NAVIGATION19");
		Wld_InsertNpc(orcwarrior4,"NW_FOREST_PATH_18_MONSTER");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_72_MONSTER23");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_76");
		Wld_InsertNpc(Warg,"NW_FOREST_PATH_66_MONSTER");
		Wld_InsertNpc(DragonSnapper,"NW_FOREST_PATH_04_5");
		Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_14_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_CITY_SMFOREST_03_M");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_25_01_M");
		Wld_InsertNpc(Gobbo_Green,"NW_MAGECAVE_20");
		Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PATH_56");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_PATH_56");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_RITUALFOREST_CAVE_05");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_NW_TROLLAREA_RUINS_01");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_NW_TROLLAREA_RUINS_14");
		Wld_InsertNpc(BlackWolf,"FP_ROAM_NW_TROLLAREA_RUINS_15");
		Wld_InsertNpc(FireWaran,"NW_TROLLAREA_RUINS_21");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_21");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_NW_TROLLAREA_RUINS_22");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_NW_TROLLAREA_RUINS_24");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_30");
		Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_TROLLAREA_RUINS_10");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_01");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_03");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_05");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_06");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_07");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_09");
		Wld_InsertNpc(gobbo_grandwarrior,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_10");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_11");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_12");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_14");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_PORTALTEMPEL_12");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_PORTALTEMPEL_09");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_PORTALTEMPEL_08");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_PORTALTEMPEL_06");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_PATH_66_MONSTER");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_07");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_NOVCHASE_01");
		Wld_InsertNpc(bloodfly_poison,"NW_TROLLAREA_PATH_38_MONSTER");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RUINS_17");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RUINS_14");
		Wld_InsertNpc(FireWaran,"NW_TROLLAREA_RUINS_32");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_71_MONSTER");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PATH_71_MONSTER2");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PATH_15_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RITUALPATH_04");
		Wld_InsertNpc(bloodfly_poison,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Keiler,"NW_TROLLAREA_PLANE_01");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_08");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_BRIGDE_05");
		Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_TROLLLAKECAVE_03A");
		Wld_InsertNpc(BlackWolf,"NW_TROLLAREA_TROLLLAKECAVE_02");
		Wld_InsertNpc(Gobbo_Warrior,"NW_TROLLAREA_TROLLLAKECAVE_08");
		Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_TROLLLAKECAVE_08");
		Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_TROLLLAKECAVE_09");
		Wld_InsertNpc(Shadowbeast,"NW_TROLLAREA_RIVERSIDECAVE_02");
		Wld_InsertNpc(Shadowbeast,"NW_TROLLAREA_RIVERSIDECAVE_07");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_75");
		Wld_InsertNpc(FireWaran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_FOREST_PATH_62_02");
		Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(scavenger_old,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(DragonSnapper,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_MONSTER22");
		Wld_InsertNpc(DragonSnapper,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_PATH_CITY_10_B");
		Wld_InsertNpc(BlackWolf,"NW_FARM1_PATH_CITY_SHEEP_04");
		Wld_InsertNpc(DragonSnapper,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_CITY_TO_FOREST_34");
		Wld_InsertNpc(bloodfly_poison,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(Lurker,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(Gobbo_Black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(gobbo_grandwarrior,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MEDIUMFOREST_KAP2_01");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MEDIUMFOREST_KAP2_02");
		Wld_InsertNpc(DragonSnapper,"FP_ROAM_MEDIUMFOREST_KAP2_05");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(bloodfly_poison,"NW_TROLLAREA_RIVERSIDE_09");
		Wld_InsertNpc(DragonSnapper,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(scavenger_old,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_10");
		Wld_InsertNpc(Warg,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(bloodfly_poison,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(FireWaran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(FireWaran,"FP_ROAM_FIREWARAN_04");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_01");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_02");
		Wld_InsertNpc(orcwarrior5,"NW_BIGMILL_FARM3_RANGERBANDITS_03");
		Wld_InsertNpc(orkelite_addon3,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
		Wld_InsertNpc(orcwarrior5,"NW_FARM4_WOOD_RANGERBANDITS_03");
		Wld_InsertNpc(orcwarrior5,"NW_FARM4_WOOD_RANGERBANDITS_04");
		Wld_InsertNpc(orkelite_addon3,"NW_FARM4_WOOD_RANGERBANDITS_05");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM1_CITYWALL_FOREST_14");
		Wld_InsertNpc(orkelite_addon1,"NW_FARM1_CITYWALL_FOREST_15");
		Wld_InsertNpc(orkelite_addon3,"NW_FARM1_CITYWALL_FOREST_16");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_DARKTOWER_01");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_DARKTOWER_03");
		Wld_InsertNpc(FireWaran,"FP_ROAM_NW_DARKTOWER_05");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NW_PSINEWLAGER_01");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NW_PSINEWLAGER_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_NW_PSINEWLAGER_03");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_PSINEWLAGER_04");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_PSINEWLAGER_05");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_PSINEWLAGER_06");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_02_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_04_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_06_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_TURTLE_08_01");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_01");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_02");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_03");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_04");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_05");
		Wld_InsertNpc(Keiler,"X_SOUTHBEACH_MONSTER_06");
		Wld_InsertNpc(FireWaran,"X_SOUTHBEACH_MONSTER_07");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_08");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_10");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_09");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_11");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_15");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_14");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_16");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_17");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_18");
		Wld_InsertNpc(Lurker,"X_SOUTHBEACH_MONSTER_19");
		Wld_InsertNpc(Waran,"X_SOUTHBEACH_MONSTER_20");
		Wld_InsertNpc(Muritan,"X_SOUTHBEACH_MONSTER_22");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_23");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_24");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_25");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_26");
		Wld_InsertNpc(Bloodfly,"X_SOUTHBEACH_MONSTER_27");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_29");
		Wld_InsertNpc(Snapper,"X_SOUTHBEACH_MONSTER_30");
		Wld_InsertNpc(Scavenger,"X_SOUTHBEACH_MONSTER_31");
		Wld_InsertNpc(Keiler,"X_SOUTHBEACH_MONSTER_32");
		Wld_InsertNpc(GOBBO_MAGE,"NW_DARKFOREST_CAVE_02_01");
		Wld_InsertNpc(GOBBO_MAGE,"NW_DARKFOREST_CAVE_02_03");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_07");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_04");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_CAVE_03_02");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_IN_01_01");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_IN_01_07");
		Wld_InsertNpc(Lurker,"NW_DARKFOREST_OUT_01_06");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_03");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_34");
		Wld_InsertNpc(Keiler,"NW_DARKFOREST_IN_01_45");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_05");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_13");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_22");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_28");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_43");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_IN_01_55");
		Wld_InsertNpc(Bloodfly,"NW_DARKFOREST_OUT_01_40");
		Wld_InsertNpc(Waran,"NW_DARKFOREST_IN_01_11");
		Wld_InsertNpc(Warg,"NW_DARKFOREST_IN_01_16");
		Wld_InsertNpc(Warg,"NW_DARKFOREST_IN_01_19");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_29");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_36");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_37");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_40");
		Wld_InsertNpc(Wolf,"NW_DARKFOREST_IN_01_47");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_IN_01_25");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_OUT_01_01");
		Wld_InsertNpc(Snapper,"NW_DARKFOREST_OUT_01_03");
		Wld_InsertNpc(Troll,"NW_DARKFOREST_OUT_01_07");
		Wld_InsertNpc(Troll,"NW_DARKFOREST_OUT_01_23");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_IN_01_52");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_IN_01_50");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_21");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_18");
		Wld_InsertNpc(Scavenger,"NW_DARKFOREST_OUT_01_16");
		Wld_InsertNpc(Oster,"NW_DARKFOREST_OUT_01_11");
		Wld_InsertNpc(Oster,"NW_DARKFOREST_OUT_01_14");
		PERMTOPRISON = TRUE;
		EnterNW_Kapitel6 = TRUE;
	};
};

var int SouthMuritanIns;
var int MyxirIsBackFT;

func void b_enter_newworld()
{
	var int randomchance;
	var C_Npc fellangorcheck;
	var C_Npc asmalcheck;
	var C_Npc strangercheck;
	var C_Npc scarcheck;
	var int daynow;
	B_InitNpcGlobals();

	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE) && (CHANGEONETIMEKAPITALNW == FALSE))
	{
		EnterNW_Kapitel2 = TRUE;
		EnterNW_Kapitel3 = TRUE;
		EnterNW_Kapitel4 = TRUE;
		EnterNW_Kapitel5 = TRUE;
		CHANGEONETIMEKAPITALNW = TRUE;
	};
	if(Kapitel >= 1)
	{
		B_ENTER_NEWWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_NEWWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_NEWWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_NEWWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_NEWWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE) && (KAPITELORCATC == FALSE))
		{
			PlayVideo("RET2_ShipBack.BIK");
			B_ENTER_NEWWORLD_Kapitel_6();
		};
	};
	if((ULFTAVERNE == FALSE) && (Npc_IsDead(NOV_602_Ulf) == FALSE))
	{
		ULFTAVERNE = TRUE;

		if(Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartOtherRoutine(NOV_602_Ulf,"Taverne");
		}
		else
		{
			B_StartOtherRoutine(NOV_602_Ulf,"TaverneDrink");
		};
	};
	if((FORTUNOISDEAD == FALSE) && (FORTUNOAWFLAG == FALSE) && (FORTUNOBACK == TRUE))
	{
		FORTUNOAWFLAG = TRUE;
		Wld_InsertNpc(sek_8048_fortuno,"NW_PSICAMP_FORTUNO");
	};
	if((ANGARISBACK == TRUE) && (ANGARCANBACK == TRUE) && (ANGAROWFLAG == FALSE) && (ANGARISDEAD == FALSE))
	{
		ANGAROWFLAG = TRUE;
		Wld_InsertNpc(DJG_705_Angar_NW,"NW_PSICAMP_ANGAR");
		B_StartOtherRoutine(DJG_705_Angar_NW,"PsiCamp");
	};
	if((ANGARISNOBACK == TRUE) && (ANGAROWFLAG == FALSE) && (ANGARISDEAD == FALSE))
	{
		ANGAROWFLAG = TRUE;
		Wld_InsertNpc(DJG_705_Angar_NW,"BIGFARM");
	};
	if((MIS_FERDSPECWINE == LOG_Running) && (FERDINANDMANISREADY == FALSE))
	{
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_WOLF_01");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_WOLF_02");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_WOLF_03");
		Wld_InsertNpc(Wolf,"FP_ROAM_FARM1_WOLF_04");
		Wld_InsertNpc(vlk_6135_ferdinandman,"NW_FARM1_PATH_CITY_05_B");
		B_KillNpc(ferdinandman);
		FERDINANDMANISREADY = TRUE;
	};
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLMORAKREOL == TRUE) && (TELLMORAKREOLDONE == FALSE))
	{
		Wld_InsertNpc(pal_187_melhior,"NW_CITY_HABOUR_MELHIOR");
		TELLMORAKREOLDONE = TRUE;
	};
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == FALSE))
	{
		B_StartOtherRoutine(VLK_414_Hanna,"InPrision");
		Wld_InsertNpc(vlk_6137_gaspar,"NW_CITY_HANNA");
		HANNAISKNAST = TRUE;
	};
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == TRUE) && (GRITTAISBACK == FALSE) && !Npc_IsDead(Gritta))
	{
		GRITTAISBACK = TRUE;
		B_StartOtherRoutine(VLK_462_Thorben,"Start");
		B_StartOtherRoutine(VLK_418_Gritta,"Start");
	};
	if((TELLTOHAGENFORT == TRUE) && (MIS_HELPCREW == LOG_SUCCESS) && (ORCCAPTURESHIP == FALSE))
	{
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_04");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_05");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_08");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_10");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_11");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_12");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_13");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_14");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_15");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_16");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_17");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_18");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_19");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_20");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_21");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_22");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_23");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_24");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_25");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_26");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_27");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_SHIP_28");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_SHIP_29");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_SHIP_30");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_31,"FP_ROAM_NW_ATC_ORC_SHIP_31");
		ORCCAPTURESHIP = TRUE;
	};
	if((PLAYVIDEOGUARDIANS == TRUE) && (TRIGGERGUARDIANCHAMBER == FALSE))
	{
		Wld_SendTrigger("EVT_TRIGGER_ENTRANCECHAMBER");
		TRIGGERGUARDIANCHAMBER = TRUE;
	};
	if((HAGENOTHERSAGREED == TRUE) && (INSERTLASORKS == FALSE))
	{
		Wld_InsertNpc(orkelite_addon3_nwchkflg_32,"FP_ROAM_NW_ATC_ELITEORC_26");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_396");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_395");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_403");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_402");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_400");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_397");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_401");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_BOWMEN_30");
		INSERTLASORKS = TRUE;
	};
	if((ALLAWAYFROMPLACE == TRUE) && (ALLAWAYFROMPLACEONCE == FALSE))
	{
		ALLAWAYFROMPLACEONCE = TRUE;
		if(ELITEORKPASSISDEAD == TRUE)
		{
			Wld_InsertNpc(orkelite_addon3_nwchkflg_26,"FP_ROAM_NW_ATC_ELITEORC_26");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_396");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_395");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_403");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_402");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_400");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_397");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_401");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_BOWMEN_30");
		};
		if(GARONDISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_2500_garond,"NW_ENTERVALLEY_01");
		};
		if(ORICISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_2510_oric,"NW_ENTERVALLEY_02");
		};
		if(PARCIVALISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_2520_parcival,"NW_ENTERVALLEY_03");
		};
		if(UDARISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_2680_udar,"NW_ENTERVALLEY_04");
		};
		if(MARCOSISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_2170_marcos,"NW_ENTERVALLEY_08");
		};
		if(ALBERTISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75230_albert,"NW_ENTERVALLEY_02");
		};
		if(NATANISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_91680_natan,"NW_ENTERVALLEY_07");
		};
		if(PAL_7518_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75180_ritter,"NW_ENTERVALLEY_07");
		};
		if(PAL_7519_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75190_ritter,"NW_ENTERVALLEY_08");
		};
		if(PAL_7520_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75200_ritter,"NW_ENTERVALLEY_09");
		};
		if(PAL_7521_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75210_ritter,"NW_ENTERVALLEY_10");
		};
		if(PAL_7522_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75220_ritter,"NW_ENTERVALLEY_01");
		};
		if(PAL_7524_ISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_75240_ritter,"NW_ENTERVALLEY_03");
		};
		if((PAL_253_ISDEAD == FALSE) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			Wld_InsertNpc(PAL_253_Wache,"NW_ENTERVALLEY_05");
		};
		if((PAL_257_ISDEAD == FALSE) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			Wld_InsertNpc(pal_2570_ritter,"NW_ENTERVALLEY_06");
		};
		if((PAL_9165_ISDEAD == FALSE) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			Wld_InsertNpc(pal_91650_ritter,"NW_ENTERVALLEY_04");
		};
		if((PAL_9166_ISDEAD == FALSE) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			Wld_InsertNpc(pal_91660_ritter,"NW_ENTERVALLEY_05");
		};
		if((PAL_9167_ISDEAD == FALSE) && (MIS_Marcos_Jungs == LOG_SUCCESS))
		{
			Wld_InsertNpc(pal_91670_ritter,"NW_ENTERVALLEY_06");
		};
		if((DGJJOINPALADIN == TRUE) || (DGJMOVEPALADIN == TRUE))
		{
			if(DGJREVENGEME == TRUE)
			{
				if(DRGHUNTER01ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7080_kurgan,"NW_ENTERVALLEY_DJG_01");
				};
				if(DRGHUNTER02ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7100_kjorn,"NW_ENTERVALLEY_DJG_02");
				};
				if(DRGHUNTER03ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7110_godar,"NW_ENTERVALLEY_DJG_03");
				};
				if(DRGHUNTER04ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7120_hokurn,"NW_ENTERVALLEY_DJG_04");
				};
				if(DJG_ROD_ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7020_rod,"NW_BIGFARM_PATH_02");
				};
				if(DJG_CIPHER_ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7030_cipher,"NW_BIGFARM_PATH_04_1");
				};
				if((DJG_BIFF_ISDEAD == FALSE) && (Biff_FollowsThroughPass != LOG_SUCCESS))
				{
					Wld_InsertNpc(DJG_713_Biff_NW,"NW_BIGFARM_PATH_BIFF_01");
					B_StartOtherRoutine(DJG_713_Biff_NW,"OrcAtcNW");
				};
			}
			else
			{
				if(DRGHUNTER01ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7080_kurgan,"NW_BIGFARM_KURGAN");
					B_StartOtherRoutine(djg_7080_kurgan,"Start");
				};
				if(DRGHUNTER02ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7100_kjorn,"NW_BIGFARM_KJORN");
					B_StartOtherRoutine(djg_7100_kjorn,"Start");
				};
				if(DRGHUNTER03ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7110_godar,"NW_BIGFARM_GODAR");
					B_StartOtherRoutine(djg_7110_godar,"Start");
				};
				if(DRGHUNTER04ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7120_hokurn,"NW_BIGFARM_HOKURN");
					B_StartOtherRoutine(djg_7120_hokurn,"Start");
				};
				if(DJG_ROD_ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7020_rod,"NW_BIGFARM_PATH_02");
				};
				if(DJG_CIPHER_ISDEAD == FALSE)
				{
					Wld_InsertNpc(djg_7030_cipher,"NW_BIGFARM_PATH_04_1");
				};
				if((DJG_BIFF_ISDEAD == FALSE) && (Biff_FollowsThroughPass != LOG_SUCCESS))
				{
					Wld_InsertNpc(DJG_713_Biff_NW,"NW_BIGFARM_PATH_BIFF_01");
					B_StartOtherRoutine(DJG_713_Biff_NW,"OrcAtcNW");
				};
			};
		};
	};
	if((MIS_KarrasVergessen == LOG_SUCCESS) && (MIS_POISONNEED == LOG_SUCCESS) && (KILLHAPPENSMADE == FALSE))
	{
		daynow = Wld_GetDay();

		if(KILLHAPPENS < (daynow - 3))
		{
			B_KillNpc(VLK_498_Ignaz);
			B_ClearNpcInventory(VLK_498_Ignaz);
			KILLHAPPENSMADE = TRUE;
		};
	};
	if((REFUSEHELPCAVALORN == TRUE) && (ORCAKILINSERTED == FALSE))
	{
		B_StartOtherRoutine(thorus_nw,"KillHim");
		B_StartOtherRoutine(scatty_nw,"KillHim");
		B_KillNpc(vlk_6022_thorus);
		B_KillNpc(vlk_6024_scatty);
		b_killnpccannodead(BAU_4300_Addon_Cavalorn);
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
		NOOLDGUARD = TRUE;
		ORCAKILINSERTED = TRUE;
	};
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == TRUE) && (HAGENOTHERSAGREED == TRUE) && (MOVEFORCESCOMPLETE_01 == FALSE))
	{
		if(MIS_BEWAREWATERMAGE == LOG_Running)
		{
			MIS_BEWAREWATERMAGE = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_OBSOLETE);
		};
		b_gatherallonbigfarm();
		MOVEFORCESCOMPLETE_01 = TRUE;
	};
	if((KAPITELORCATC == TRUE) && (MOVEFORCESCOMPLETE_01 == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		if(MIS_OREWEAPONSLD == LOG_Running)
		{
			MIS_OREWEAPONSLD = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_OBSOLETE);
		};
		if(MIS_DIEGOOLDFRIENS == LOG_Running)
		{
			MIS_DIEGOOLDFRIENS = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_OBSOLETE);
		};
		if(MIS_HELPCREW == LOG_Running)
		{
			MIS_HELPCREW = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_HELPCREW,LOG_OBSOLETE);
		};
		if(MIS_STRANGETHINGS == LOG_Running)
		{
			MIS_STRANGETHINGS = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_OBSOLETE);
		};

		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_01");
		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_02");
		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_03");

		if(HERONOTJOINBIGBATTLE == FALSE)
		{
			b_bigfight_moveorcsonposition();
			b_bigfight_movehumansonposition();
			Wld_SetTime(6,0);
		}
		else
		{
			STOPBIGBATTLE = TRUE;
			HUMANSWINSBB = TRUE;
			BIGBATTLEBACKPOSITION = TRUE;
			MIS_ORсGREATWAR = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_ORсGREATWAR,LOG_SUCCESS);
		};

		MOVEFORCESCOMPLETE_02 = TRUE;
	};
	if(Bennet.flags == NPC_FLAG_IMMORTAL)
	{
		Bennet.flags = NPC_FLAG_NONE;
	};
	if((EnterOW_Kapitel4 == TRUE) && (ORCRITUALPLACE == FALSE))
	{
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_RITUAL_01");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_02");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_03");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_04");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
		Wld_InsertNpc(Wolf,"NW_TROLLAREA_RITUALPATH_04");
		Wld_InsertNpc(Wolf,"NW_TROLLAREA_RITUALPATH_04");
		Wld_InsertNpc(Wolf,"NW_TROLLAREA_RITUALPATH_04");
		Wld_InsertNpc(orkelite_addon1,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(orkelite_addon2,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(orkelite_addon1,"NW_TROLLAREA_RITUALPATH_032");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
		Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
		ORCRITUALPLACE = TRUE;
	};
	if((FLAGFELLANUP == TRUE) && (FLAGFELLANUPDONE == FALSE))
	{
		B_StartOtherRoutine(Fellan,"Insane");
		FLAGFELLANUPDONE = TRUE;
	};
	if((MIS_BELIARHELPME == LOG_OBSOLETE) && (MEHASTRIRAVAR == TRUE) && (DEMENTORDISAPPEAR == FALSE))
	{
		B_StartOtherRoutine(dmt_1257_dementor,"Start");
		DEMENTORDISAPPEAR = TRUE;
	};
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == TRUE) && (FELLANGORTHIRDMEET == FALSE))
	{
		fellangorcheck = Hlp_GetNpc(VLK_480_Fellan);

		if(FELLANGORSECONDMEET == TRUE)
		{
			Mdl_SetVisualBody(fellangorcheck,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",Face_N_Normal20,0,ITAR_Vlk_L);
			fellangorcheck.name[0] = "Rupert";
		}
		else
		{
			Mdl_SetVisualBody(fellangorcheck,"Hum_Body_Babe0",BodyTexBabe_N,0,"Hum_Head_Babe0",FaceBabe_N_GreyCloth,0,ITAR_BauBabe_L);
			fellangorcheck.name[0] = "Elena";
		};
	};
	if(KNOWSASMAL == TRUE)
	{
		asmalcheck = Hlp_GetNpc(pir_1398_addon_inextremo_announcer);
		asmalcheck.name[0] = "Asmal";
	}
	else
	{
		strangercheck = Hlp_GetNpc(pir_1398_addon_inextremo_announcer);

		if(STRANGERKNOWS == TRUE)
		{
			strangercheck.name[0] = "Cizinec";
		}
		else
		{
			strangercheck.name[0] = "Gillian";
		};
	};
	if((MIS_PrioratStart == LOG_Success) && (NewGonsaIn == FALSE))
	{
		NewGonsaIn = TRUE;
		B_StartOtherRoutine(NONE_119_Assasin,"TOT");

		if((GonsalesIsDead == FALSE) && (GonsalesNWIsDead == FALSE))
		{
			Wld_InsertNpc(NONE_1191_Assasin,"NW_FROM_PW_GONSA");
		};
	};
	if((GonsaGoKloster == TRUE) && (GonsaGoKlosterDone == FALSE))
	{
		B_StartOtherRoutine(NONE_1191_Assasin,"Kloster");
		GonsaGoKlosterDone = TRUE;
	};
	if((GestatBecameHunt == TRUE) && (GestatInHorinis == FALSE) && (GestatIsDead == FALSE))
	{
		GestatInHorinis = TRUE;
		Wld_InsertNpc(VLK_4149_Gestath,"NW_HUNTERCAMP_03");
	};
	if(SCARKNOWS == TRUE)
	{
		scarcheck = Hlp_GetNpc(vlk_6120_lemarguard);
		scarcheck.name[0] = "Scar, Lehmarův osobní strážce";
	};
	if((MIS_HeroOrcJoin_T1 == LOG_Running) && (SouthMuritanIns == FALSE))
	{
		Wld_InsertNpc(Muritan_South,"NW_CITYFOREST_CAVE_A06");
		SouthMuritanIns = TRUE;
	};
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE) && (MIS_TagNorGrHunWeap == LOG_Running) && (NimrodDone == FALSE))
	{
		MIS_TagNorGrHunWeap = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_OBSOLETE);
	};
	if((MIS_RagnarRune == LOG_Success) && (RagnarIsKDF == FALSE))
	{
		CreateInvItems(Ragnar,ItAr_KDF_L,1);
		AI_EquipArmor(Ragnar,ItAr_KDF_L);
		Npc_RemoveInvItems(Ragnar,ItAr_NOV_L,1);
		B_StartOtherRoutine(Ragnar,"StandKDF");
		Ragnar.guild = GIL_KDF;
		RagnarIsKDF = TRUE;
	};
	if((DariusIsFree == TRUE) && (MIS_MissOldFriend == LOG_Running) && (DariusIsDead == FALSE) && (DariusNWIns == FALSE))
	{
		Wld_InsertNpc(SLD_857_Darius,"NW_DARIUS");
		DariusNWIns = TRUE;
	};
	if((DariusNWIns == TRUE) && (BretIsDead == FALSE) && (AlexCanBack == TRUE) && (BretNWIns == FALSE))
	{
		Wld_InsertNpc(SLD_858_Bret,"NW_BRET");
		BretNWIns = TRUE;			
	};
	if((BilgotPassNW == TRUE) && (BilgotIsInNW == FALSE))
	{
		Wld_InsertNpc(VLK_41200_Bilgot,"NW_PASS_GATE_01");
		BilgotIsInNW = TRUE;			
	};
	if((KillersMoveInCave == TRUE) && (MoveKillNewPlace == FALSE))
	{
		if(Npc_IsDead(pir_1397_addon_inextremo_charlotte) == FALSE)
		{
			B_StartOtherRoutine(pir_1397_addon_inextremo_charlotte,"KillCamp");
		};
		if(Npc_IsDead(PIR_1390_Addon_InExtremo_DrPymonte) == FALSE)
		{
			B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"KillCamp");
		};
		if(Npc_IsDead(PIR_1391_Addon_InExtremo_TheFlail) == FALSE)
		{
			B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"KillCamp");
		};
		if(Npc_IsDead(PIR_1395_Addon_InExtremo_Lutter) == FALSE)
		{
			B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"KillCamp");
		};
		if(Npc_IsDead(PIR_1396_Addon_InExtremo_Flex) == FALSE)
		{
			B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"KillCamp");
		};

		MoveKillNewPlace = TRUE;
	};
	if((MIS_RagnarBandits == LOG_Success) && (RagnarIsMIL_H == FALSE))
	{
		CreateInvItems(Ragnar,ItAr_MIL_M,1);
		AI_EquipArmor(Ragnar,ItAr_MIL_M);
		Npc_RemoveInvItems(Ragnar,ItAr_MIL_L,1);
		B_StartOtherRoutine(Ragnar,"StandMILH");
		RagnarIsMIL_H = TRUE;
	};
	if((MyxirIsBack == TRUE) && (MyxirIsBackFT == FALSE))
	{
		Wld_InsertNpc(KDW_140300_Addon_Myxir_CITY,"CITY1");
		MyxirIsBackFT = TRUE;
	};
	if((RiordianIsAlive == TRUE) && (RIORDANEVILDEAD == TRUE) && (KDW_JOINHAGEN == TRUE) && (RioIsBack == FALSE))
	{
		B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"CampOn");
		B_StartOtherRoutine(BAU_910_Maria,"StartRio");
		RioIsBack = TRUE;
	};
	if((MIS_SylvioCrew == LOG_Running) && (SeaMapIns == TRUE) && (SeaMapInsDone == FALSE))
	{
		Wld_InsertItem(ItWr_Seamap_Mirtana,"FP_ITEM_SHIP_SEAMAP");
		SeaMapInsDone = TRUE;
	};
	if((HUNTYGRIMESESCAPEOW == TRUE) && (HUNTYGRIMESINSERTEDNW == FALSE))
	{
		Wld_InsertNpc(vlk_41110_grimesnw,"NW_ENTERVALLEY_09");

		if(HuntyIsDead == FALSE)
		{
			Wld_InsertNpc(vlk_41111_huntynw,"NW_PASS_GATE_01");
		};

		HUNTYGRIMESINSERTEDNW = TRUE;
	};
	if((MIS_PrioratStart == LOG_Success) && (NoWayMasiaf == FALSE))
	{
		Wld_SendTrigger("EVT_MASIAF_ENTER");
		Wld_SendTrigger("EVT_MASIAF_OBVAL");
		Wld_InsertNpc(SEK_7043_NOVIZE,"PW_OBVAL_01");
		Wld_InsertNpc(SEK_7042_NOVIZE,"PW_OBVAL_02");
		Wld_InsertNpc(TPL_9020_TEMPLER,"NW_TO_NEWCAMPPSI");
		Wld_InsertNpc(TPL_9017_TEMPLER,"NW_TO_NEWCAMPPSI");
		NoWayMasiaf = TRUE;
	};
	if((MIS_RebelsWeapon == LOG_Running) && (PW_Exit == TRUE))
	{
		MIS_RebelsWeapon = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_OBSOLETE);
	};
	if((ALLGUARDIANSKILLED == TRUE) && (GUARDIANSISDEFEATED == FALSE))
	{
		GUARDIANSISDEFEATED = TRUE;
	};
	if((Kapitel >= 3) && (DarkMessian == FALSE))
	{
		Wld_InsertNpc(DMT_2200_DarkSpeaker,"NW_PASS_GATE_02");
		DarkMessian = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = NEWWORLD_ZEN;
	B_InitNpcGlobals();
};