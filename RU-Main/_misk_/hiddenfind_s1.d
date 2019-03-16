var int rakeplace[50];

const int Greg_FirstSecret = 1;
const int RAKE_BUDDEL_DIST_MAX = 300;
const int RAKE_BUDDEL_DIST_MIN = 200;

func void GraveOpen_s1()
{
	B_Say(hero,hero,"$FOUNDTREASURE");
};

func void hiddenfind_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HIDDENFIND;
		AI_ProcessInfos(her);
	};
};

func void hiddenfindtreasuresuccess(var C_Item itm)
{
	Wld_PlayEffect("spellFX_ItemAusbuddeln",itm,itm,0,0,0,FALSE);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	B_GivePlayerXP(XP_Ambient);
};


instance PC_HIDDENFIND_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_hiddenfind_end_condition;
	information = pc_hiddenfind_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_hiddenfind_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HIDDENFIND) && (OptionCheck == FALSE) && (TeleportCheck == FALSE))
	{
		return TRUE;
	};
};

func void pc_hiddenfind_end_info()
{
	b_endproductiondialog();
};


instance PC_HIDDENFIND_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_hiddenfind_addon_hour_condition;
	information = pc_hiddenfind_addon_hour_info;
	permanent = TRUE;
	description = "Копать.";
};


func int pc_hiddenfind_addon_hour_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HIDDENFIND) && (OptionCheck == FALSE) && (TeleportCheck == FALSE))
	{
		return TRUE;
	};
};

func void pc_hiddenfind_addon_hour_info()
{
	var C_Item GregsArmor;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if((Npc_GetDistToWP(hero,"NW_BIGFARM_LAKE_CAVE_07") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[1] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket25,"NW_BIGFARM_LAKE_CAVE_07");
			RAKEPLACE[1] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItSe_GoldPocket100);
			GregsArmor = Npc_GetEquippedArmor(Greg_NW);

			if(Hlp_IsItem(GregsArmor,ITAR_PIR_H_Addon) == FALSE)
			{
				AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_LAKE_GREG_TREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[2] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket100,"NW_LAKE_GREG_TREASURE_01");
			RAKEPLACE[2] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItSe_GoldPocket100);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[3] == FALSE))
		{
			Wld_InsertItem(ItMi_CupGold,"NW_FARM3_GREGTREASURE_01");
			RAKEPLACE[3] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItMi_CupGold);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_MOUNTAINLAKE_MONSTER_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[4] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverChalice,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
			RAKEPLACE[4] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItMi_SilverChalice);
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_FARM3_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[5] == FALSE))
		{
			Wld_InsertItem(ItAm_Prot_Point_01,"NW_BIGMILL_FARM3_01");
			RAKEPLACE[5] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItAm_Prot_Point_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[12] == FALSE))
		{
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_ENTRANCE_RAKEPLACE_01");
			RAKEPLACE[12] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItMi_SilverChalice,"ADW_ENTRANCE_RAKEPLACE_01");
			PlaceRespPirate = "ADW_ENTRANCE_PATH2BANDITS_13A";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItMi_SilverChalice);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[13] == FALSE))
		{
			Wld_InsertItem(ItWr_DexStonePlate1_Addon,"ADW_ENTRANCE_RAKEPLACE_02");
			RAKEPLACE[13] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItMi_CupGold,"ADW_ENTRANCE_RAKEPLACE_02");
			PlaceRespPirate = "ADW_ENTRANCE_SKEL_01";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItMi_CupGold);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[14] == FALSE))
		{
			Wld_InsertItem(ItPo_Perm_Health,"ADW_ENTRANCE_RAKEPLACE_03");
			RAKEPLACE[14] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItSe_GoldPocket100,"ADW_ENTRANCE_RAKEPLACE_03");
			PlaceRespPirate = "ADW_ENTRANCE_PATH2BANDITSCAVE1_05";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSe_GoldPocket100);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[15] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverRing,"ADW_ENTRANCE_RAKEPLACE_04");
			RAKEPLACE[15] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItMw_Schwert4,"ADW_ENTRANCE_RAKEPLACE_04");
			PlaceRespPirate = "ADW_ENTRANCE_2_PIRATECAMP_22";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItMw_Schwert4);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[16] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket100,"ADW_VALLEY_GREGTREASURE_01");
			RAKEPLACE[16] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItPo_Health_02,"ADW_VALLEY_GREGTREASURE_01");
			Wld_InsertItem(ItPo_Mana_03,"ADW_VALLEY_GREGTREASURE_01");
			PlaceRespPirate = "FP_ROAM_VALLEY_027";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItPo_Mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[17] == FALSE))
		{
			Wld_InsertItem(ItPo_Mana_Addon_04,"ADW_VALLEY_RAKEPLACE_01");
			RAKEPLACE[17] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(itpo_speed_02,"ADW_VALLEY_RAKEPLACE_01");
			Wld_InsertItem(ItPo_Mana_02,"ADW_VALLEY_RAKEPLACE_01");
			PlaceRespPirate = "ADW_ENTRANCE_SKEL_02";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItPo_Mana_02);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[18] == FALSE))
		{
			Wld_InsertItem(ItPo_Health_Addon_04,"ADW_VALLEY_RAKEPLACE_02");
			RAKEPLACE[18] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_VALLEY_RAKEPLACE_02");
			Wld_InsertItem(ItSe_LockpickFisch,"ADW_VALLEY_RAKEPLACE_02");
			PlaceRespPirate = "ADW_VALLEY_SHOWCASE1_01";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSe_LockpickFisch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[19] == FALSE))
		{
			Wld_InsertItem(ItSc_Firerain,"ADW_VALLEY_RAKEPLACE_03");
			RAKEPLACE[19] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItSe_GoldPocket50,"ADW_VALLEY_RAKEPLACE_03");
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_VALLEY_RAKEPLACE_03");
			PlaceRespPirate = "ADW_VALLEY_PATH_129_A";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSe_GoldPocket50);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[20] == FALSE))
		{
			Wld_InsertItem(ItMi_Honigtabak,"ADW_BANDITSCAMP_RAKEPLACE_01");
			RAKEPLACE[20] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_BANDITSCAMP_RAKEPLACE_01");
			Wld_InsertItem(ItAm_Addon_MANA,"ADW_BANDITSCAMP_RAKEPLACE_01");
			PlaceRespPirate = "ADW_SWAMP_HILLS_DOWN_01";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItAm_Addon_MANA);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[21] == FALSE))
		{
			Wld_InsertItem(ItSc_SumGobSkel,"ADW_BANDITSCAMP_RAKEPLACE_02");
			RAKEPLACE[21] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItPo_Mana_03,"ADW_BANDITSCAMP_RAKEPLACE_02");
			PlaceRespPirate = "ADW_SENAT_MONSTER_04";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItPo_Mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[22] == FALSE))
		{
			Wld_InsertItem(ItSc_TrfShadowbeast,"ADW_BANDITSCAMP_RAKEPLACE_03");
			RAKEPLACE[22] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItSc_LightHeal,"ADW_BANDITSCAMP_RAKEPLACE_03");
			PlaceRespPirate = "ADW_ENTRANCE_SKEL_03";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSc_LightHeal);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[23] == FALSE))
		{
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_BANDITSCAMP_RAKEPLACE_04");
			RAKEPLACE[23] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItRi_HP_01,"ADW_BANDITSCAMP_RAKEPLACE_04");
			PlaceRespPirate = "ADW_BRENDIK_01";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItRi_HP_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_MINE1_11") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[24] == FALSE))
		{
			Wld_InsertItem(ItSE_Addon_FrancisChest,"ADW_CANYON_MINE1_11");
			RAKEPLACE[24] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItSE_Addon_FrancisChest);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[25] == FALSE))
		{
			Wld_InsertItem(ItMi_RuneBlank,"ADW_CANYON_RAKEPLACE_01");
			RAKEPLACE[25] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItSe_GoldPocket25,"ADW_CANYON_RAKEPLACE_01");
			PlaceRespPirate = "ADW_CANYON_PATH_TO_LIBRARY_12AB";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSe_GoldPocket25);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[26] == FALSE))
		{
			Wld_InsertItem(ItMi_Nugget,"ADW_CANYON_RAKEPLACE_02");
			RAKEPLACE[26] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItSc_LightningFlash,"ADW_CANYON_RAKEPLACE_02");
			Wld_InsertItem(ItSc_ChargeFireBall,"ADW_CANYON_RAKEPLACE_02");
			PlaceRespPirate = "ADW_CANYON_PATH_TO_BANDITS_36";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItSc_ChargeFireBall);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[27] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket25,"ADW_CANYON_RAKEPLACE_03");
			RAKEPLACE[27] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItWr_ManaStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_03");
			Wld_InsertItem(ItMi_Pitch,"ADW_CANYON_RAKEPLACE_03");
			PlaceRespPirate = "ADW_CANYON_MINE2_09";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItMi_Pitch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[28] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverRing,"ADW_CANYON_RAKEPLACE_04");
			RAKEPLACE[28] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItMi_Sulfur,"ADW_CANYON_RAKEPLACE_04");
			Wld_InsertItem(ItWr_TwoHStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_04");
			PlaceRespPirate = "ADW_CANYON_PATH_TO_BANDITS_27";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItWr_TwoHStonePlate1_Addon);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_05") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[29] == FALSE))
		{
			Wld_InsertItem(ItMi_RingGold,"ADW_CANYON_RAKEPLACE_05");
			RAKEPLACE[29] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			Wld_InsertItem(ItAt_DragonBlood,"ADW_CANYON_RAKEPLACE_05");
			PlaceRespPirate = "ADW_CANYON_PATH_TO_BANDITS_06G";
			TrapPirUp = TRUE;
			hiddenfindtreasuresuccess(ItAt_DragonBlood);
		}
		else if((Npc_GetDistToWP(hero,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[30] == FALSE))
		{
			Wld_InsertItem(ItMi_ChaliceGold,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS");
			Wld_InsertItem(ItMi_ChestGold,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS");
			PlaceRespPirate = "ADW_PIRATECAMP_LONEBEACH_05";
			TrapPirUp = TRUE;
			RAKEPLACE[30] = TRUE;
			TreasureBonus += 1;
			RankPoints = RankPoints + 1;
			hiddenfindtreasuresuccess(ItMi_ChestGold);
		};
	};

	b_endproductiondialog();
};