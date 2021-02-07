/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int B_CheckRuneSkill - upraveny výpisy
(24x) - upraveny výpisy (PRINT_ProdItemsMissing -> PRINT_ProdItemsMissingCZMateh)

*/



var int CountRunesOverallBonus;
var int CountRunesOverallBonusDay;
var int OverallBonusRunes;

func void B_RaiseIntRuneSkill()
{
	var int daynow;

	daynow = Wld_GetDay();

	if(OverallBonusRunes <= (10 * Kapitel))
	{
		CountRunesOverallBonus += 1;
	
		if(CountRunesOverallBonus >= 5)
		{
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
			{
				ATR_INTELLECT = ATR_INTELLECT + 1;
				Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};

			CountRunesOverallBonus = FALSE;
			OverallBonusRunes += 1;
		};
	};
};

func int B_CheckRuneSkill(var int skill)
{
	var string concatText;

	if(TalentCount_Rune[0] >= Skill)
	{
		return TRUE;
	}
	else
	{
		concatText = ConcatStrings("Vyžaduje dovednost tvorby run na úrovni ",IntToString(Skill));
		concatText = ConcatStrings(concatText," bodů");
		AI_PrintClr(concatText,177,58,17);
		B_Say(self,self,"$NOLEARNNOPOINTS");
		return FALSE;
	};

	return FALSE;
};

func void makerune_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MakeRune;
		AI_ProcessInfos(her);
	};
};

instance PC_MakeRune_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MakeRune_End_Condition;
	information = PC_MakeRune_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_MakeRune_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune)
	{
		return TRUE;
	};
};

func void PC_MakeRune_End_Info()
{
	CreateInvItems(self,ItMi_RuneBlank,1);
	b_endproductiondialog();
};

func void B_Circle_01()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);

	if(PLAYER_TALENT_RUNES[SPL_Light] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_LIGHT,PC_ItRu_Light_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_LightHeal,PC_ItRu_LightHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_UnlockChest] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_UnlockChest,PC_ItRu_Unlock_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Firebolt,PC_ItRu_Firebolt_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Zap,PC_ItRu_Zap_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Icebolt,PC_ItRu_Icebolt_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Sleep,PC_ItRu_Sleep_Info);
	};
	if(PLAYER_TALENT_RUNES[95] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_BERZERK,pc_itru_berzerk_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Deathbolt,pc_itru_deathbolt_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SummonGoblinSkeleton,PC_ItRu_SumGobSkel_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Rage,PC_ItRu_Rage_Info);
	};
};

func void B_Circle_02()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);

	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SummonWolf,PC_ItRu_SumWolf_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_MediumHeal,PC_ItRu_MediumHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_DestroyUndead,PC_ItRu_HarmUndead_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_InstantFireball,PC_ItRu_InstFireball_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_IceLance,PC_ItRu_Icelance_Info);
	};
	if(PLAYER_TALENT_RUNES[98] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SUMMONSHOAL,pc_itru_summonshoal_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_WINDFIST,PC_ItRu_Windfist_Info);
	};
	if(PLAYER_TALENT_RUNES[83] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_TELEKINESIS,pc_itru_telekinesis_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_ManaForLife,pc_itru_suckenergy_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SummonZombie,pc_itru_summonzombie_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_GreenTentacle,pc_itru_greententacle_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Lacerate,PC_ItRu_Lacerate_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_RapidFirebolt,PC_ItRu_RapidFirebolt_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_RapidIcebolt,PC_ItRu_RapidIcebolt_Info);
	};
};

func void B_Circle_03()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);

	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_FullHeal,PC_ItRu_FullHeal_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Firestorm,PC_ItRu_Firestorm_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_IceCube,PC_ItRu_IceCube_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_ChargeZap,PC_ItRu_ThunderBall_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Fear,PC_ItRu_Fear_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Charm] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Charm,pc_itru_charm_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Swarm] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Swarm,pc_itru_swarm_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SummonSkeleton,PC_ItRu_SumSkel_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_BeliarsRage,pc_itru_energyball_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SummonGolem,PC_ItRu_SumGol_Info);
	};
	if(PLAYER_TALENT_RUNES[80] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SUMMONFIREGOLEM,pc_itru_sumfiregol_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_MagicCage] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_MagicCage,PC_ItRu_MagicCage_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_AdanosBall] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_AdanosBall,PC_ItRu_AdanosBall_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Extricate] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Extricate,PC_ItRu_Extricate_Info);
	};
};

func void B_Circle_04()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);


	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_ChargeFireball,PC_ItRu_ChargeFireball_Info);
	};
	if(PLAYER_TALENT_RUNES[93] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_FIRELIGHT,pc_itru_firelight_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_LightningFlash,PC_ItRu_LightningFlash_Info);
	};
	if(PLAYER_TALENT_RUNES[89] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SUMMONICEGOLEM,pc_itru_sumicegol_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Deathball] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Deathball,pc_itru_deathball_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Elevate] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Elevate,PC_ItRu_Elevate_Info);
	};
	if(PLAYER_TALENT_RUNES[100] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SUMMONSWAMPGOLEM,pc_itru_sumswpgol_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Acid,PC_ItRu_Acid_Info);
	};
};

func void B_Circle_05()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Pyrokinesis,PC_ItRu_Pyrokinesis_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_WaterFist,PC_ItRu_Waterfist_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_IceWave,PC_ItRu_IceWave_Info);
	};
	if(PLAYER_TALENT_RUNES[94] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_CONTROL,pc_itru_control_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_ArmyOfDarkness,PC_ItRu_ArmyOfDarkness_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Explosion,PC_ItRu_Explosion_Info);
	};
	if(PLAYER_TALENT_RUNES[96] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_SEVEREFETIDITY,pc_itru_severefetidity_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Whirlwind,PC_ItRu_Whirlwind_Info);
	};
};

func void B_Circle_06()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_Info);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Firerain,PC_ItRu_Firerain_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_FireMeteor] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_FireMeteor,PC_ItRu_FireMeteor_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Geyser,PC_ItRu_Geyser_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Thunderstorm,PC_ItRu_thunderstorm_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_MassDeath,PC_ItRu_MassDeath_Info);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Skull,pc_itru_skull_info);
	};
	if(PLAYER_TALENT_RUNES[SPL_GuruWrath] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_GuruWrath,pc_ItRu_GuruWrath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == TRUE)
	{
		Info_AddChoice(PC_Circle,NAME_SPL_Quake,PC_ItRu_Quake_Info);
	};
};

instance PC_Circle(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Circle_Condition;
	information = PC_Circle_Info;
	permanent = TRUE;
	description = "Vytvořit magickou runu";
};

func int PC_Circle_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune)
	{
		return TRUE;
	};
};

func void PC_Circle_Info()
{
	Info_ClearChoices(PC_Circle);
	Info_AddChoice(PC_Circle,Dialog_Back,PC_Circle_BACK);

	if((PLAYER_TALENT_RUNES[SPL_Rage] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Light] == TRUE) || (PLAYER_TALENT_RUNES[95] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Deathbolt] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE))
	{
		Info_AddChoice(PC_Circle,"1. kruh magie",B_Circle_01);
	};
	if((PLAYER_TALENT_RUNES[SPL_Lacerate] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE) || (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE) || (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE) || (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE) || (PLAYER_TALENT_RUNES[83] == TRUE) || (PLAYER_TALENT_RUNES[98] == TRUE) || (PLAYER_TALENT_RUNES[SPL_GreenTentacle] == TRUE) || (PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ManaForLife] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE))
	{
		Info_AddChoice(PC_Circle,"2. kruh magie",B_Circle_02);
	};
	if((PLAYER_TALENT_RUNES[SPL_Extricate] == TRUE) || (PLAYER_TALENT_RUNES[SPL_MagicCage] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Charm] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE) || (PLAYER_TALENT_RUNES[80] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE) || (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Swarm] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Energyball] == TRUE))
	{
		Info_AddChoice(PC_Circle,"3. kruh magie",B_Circle_03);
	};
	if((PLAYER_TALENT_RUNES[100] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Acid] == TRUE) || (PLAYER_TALENT_RUNES[89] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Deathball] == TRUE) || (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE) || (PLAYER_TALENT_RUNES[93] == TRUE) || (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE))
	{
		Info_AddChoice(PC_Circle,"4. kruh magie",B_Circle_04);
	};
	if((PLAYER_TALENT_RUNES[96] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Explosion] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE) || (PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE) || (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE) || (PLAYER_TALENT_RUNES[94] == TRUE) || (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE))
	{
		Info_AddChoice(PC_Circle,"5. kruh magie",B_Circle_05);
	};
	if((PLAYER_TALENT_RUNES[SPL_Quake] == TRUE) || (PLAYER_TALENT_RUNES[SPL_FireMeteor] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)  || (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE) || (PLAYER_TALENT_RUNES[SPL_GuruWrath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE) || (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE) || (PLAYER_TALENT_RUNES[SPL_Skull] == TRUE))
	{
		Info_AddChoice(PC_Circle,"6. kruh magie",B_Circle_06);
	};
};

func void PC_Circle_BACK()
{
	Info_ClearChoices(PC_Circle);
};

instance PC_Make_RuneBlank(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Make_RuneBlank_Condition;
	information = PC_Make_RuneBlank_Info;
	permanent = TRUE;
	description = "Vytvořit runový kámen";
};

func int PC_Make_RuneBlank_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune)
	{
		return TRUE;
	};
};

func void PC_Make_RuneBlank_Info()
{
	Info_ClearChoices(PC_Make_RuneBlank);
	Info_AddChoice(PC_Make_RuneBlank,Dialog_Back,PC_Make_RuneBlank_BACK);
	Info_AddChoice(PC_Make_RuneBlank,"Obyčejný runový kámen (5 úlomků runového kamene)",PC_Make_RuneBlank_01);
	Info_AddChoice(PC_Make_RuneBlank,"Starší runový kámen (10 úlomků runového kamene, 1 ingot magické rudy)",PC_Make_RuneBlank_02);
	Info_AddChoice(PC_Make_RuneBlank,"Vyšší runový kámen (15 úlomků runového kamene, 2 ingoty magické rudy)",PC_Make_RuneBlank_03);

	if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
	{
		Info_AddChoice(PC_Make_RuneBlank,"Rozebrat všechny obyčejné runové kameny",PC_Make_RuneBlank_04);
	};
};

func void PC_Make_RuneBlank_01()
{
	if(Npc_HasItems(hero,ItMi_StoneGuardianPiece) >= 5)
	{
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(hero,ItMi_StoneGuardianPiece,5);
		CreateInvItems(hero,ItMi_RuneBlank,1);
		TalentCount_Rune[0] += 5;
		B_RaiseIntRuneSkill();
		AI_PrintClr("Vytvořen obyčejný runový kámen!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_Make_RuneBlank_Info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_Make_RuneBlank_Info();
	};
};

func void PC_Make_RuneBlank_02()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItMi_StoneGuardianPiece) >= 10) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1))
		{
			B_GivePlayerXP(25);
			Npc_RemoveInvItems(hero,ItMi_StoneGuardianPiece,10);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
			CreateInvItems(hero,ItMi_UpRuneBlank,1);
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			AI_PrintClr("Vytvořen starší runový kámen!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			PC_Make_RuneBlank_Info();
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_Make_RuneBlank_Info();
		};
	}
	else
	{
		PC_Make_RuneBlank_Info();
	};
};	

func void PC_Make_RuneBlank_03()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItMi_StoneGuardianPiece) >= 15) && (Npc_HasItems(hero,ItMi_OreStuck) >= 2))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItMi_StoneGuardianPiece,15);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,2);
			CreateInvItems(hero,ItMi_HighRuneBlank,1);
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			AI_PrintClr("Vytvořen vyšší runový kámen!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			PC_Make_RuneBlank_Info();
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_Make_RuneBlank_Info();
		};
	}
	else
	{
		PC_Make_RuneBlank_Info();
	};
};	

func void PC_Make_RuneBlank_04()
{
	var string concatText;
	var int CountPieces;

	CountPieces = Npc_HasItems(hero,ItMi_RuneBlank);
	Npc_RemoveInvItems(hero,ItMi_RuneBlank,Npc_HasItems(hero,ItMi_RuneBlank));
	CreateInvItems(hero,ItMi_StoneGuardianPiece,CountPieces * 2);
	concatText = ConcatStrings("Získáno ",IntToString(CountPieces * 2));
	concatText = ConcatStrings(concatText," úlomků...");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	PC_Make_RuneBlank_Info();
};		

func void PC_Make_RuneBlank_BACK()
{
	Info_ClearChoices(PC_Make_RuneBlank);
};

instance PC_MAKERUNE_DESTROYGUARDIANS(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = pc_makerune_destroyguardians_condition;
	information = pc_makerune_destroyguardians_info;
	permanent = TRUE;
	description = "Vytvořit runu 'Hněv Tvůrců'";
};

func int pc_makerune_destroyguardians_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKERUNE == TRUE) && (Npc_HasItems(hero,ItMi_Avatar_Dark) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Fire) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Water) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Stone) >= 1)  && ((Npc_HasItems(hero,ItMi_Focus) >= 1) || (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1)))
	{
		return TRUE;
	};
};

func void pc_makerune_destroyguardians_info()
{
	if(B_CheckRuneSkill(6))
	{
		B_GivePlayerXP(2000);

		if(Npc_HasItems(hero,ItMi_MagicCrystal) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
		}
		else if(Npc_HasItems(hero,ItMi_Focus) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_Focus,1);
		};

		Npc_RemoveInvItems(hero,ItMi_Avatar_Dark,1);
		Npc_RemoveInvItems(hero,ItMi_Avatar_Fire,1);
		Npc_RemoveInvItems(hero,ItMi_Avatar_Water,1);
		Npc_RemoveInvItems(hero,ItMi_Avatar_Stone,1);
		CreateInvItems(hero,itru_destroyguardians,1);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		NETBEKLEADME_STEP2DONE = TRUE;
		TalentCount_Rune[0] += 5;
		B_RaiseIntRuneSkill();
		AI_Print(PRINT_MAKESUPERRUNE);
		//B_Say(self,self,"$ITEMREADY");
		B_LogEntry(TOPIC_GUARDIANS,"Vytvořil jsem runu, která je schopná zničit Strážce. Nastal čas je navštívit!");
		b_endproductiondialog();
	}
	else
	{
		CreateInvItems(self,ItMi_RuneBlank,1);
		b_endproductiondialog();
	};	
};

instance PC_SPL_MasterOfDisaster(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_SPL_MasterOfDisaster_Condition;
	information = PC_SPL_MasterOfDisaster_Info;
	permanent = TRUE;
	description = "Vytvořit runu 'Innosův pohled'";
};

func int PC_SPL_MasterOfDisaster_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE) && (PLAYER_MAKE_RUNES[SPL_MasterOfDisaster] == FALSE))
	{
		return TRUE;
	};
};

func void PC_SPL_MasterOfDisaster_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItMi_HolyWater) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && ((Npc_HasItems(hero,ItPo_PotionOfDeath_01_Mis) >= 1) || (Npc_HasItems(hero,ItPo_PotionOfDeath_02_Mis) >= 1)))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
			Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
			Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_MasterOfDisaster,1);
			PLAYER_MAKE_RUNES[SPL_MasterOfDisaster] = TRUE;
			//Print(PRINT_RuneSuccess);
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			CreateInvItems(self,ItMi_RuneBlank,1);
		};

		b_endproductiondialog();
	}
	else
	{
		CreateInvItems(self,ItMi_RuneBlank,1);
		b_endproductiondialog();
	};
};


instance PC_SPL_PalTeleportSecret(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_SPL_PalTeleportSecret_Condition;
	information = PC_SPL_PalTeleportSecret_Info;
	permanent = TRUE;
	description = "Vytvořit teleportační runu";
};

func int PC_SPL_PalTeleportSecret_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE) && (PLAYER_MAKE_RUNES[SPL_PalTeleportSecret] == FALSE))
	{
		return TRUE;
	};
};

func void PC_SPL_PalTeleportSecret_Info()
{
	if(Npc_HasItems(hero,ItMi_HolyWater) >= 1)
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
		CreateInvItems(hero,ItRu_PalTeleportSecret,1);
		PLAYER_MAKE_RUNES[SPL_PalTeleportSecret] = TRUE;
		//Print(PRINT_RuneSuccess);
		TalentCount_Rune[0] += 5;
		B_RaiseIntRuneSkill();
		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(self,ItMi_RuneBlank,1);
	};

	b_endproductiondialog();
};

instance PC_MAKERUNE_CRESTMAKE(C_Info)
{
	npc = PC_Hero;
	nr = 11;
	condition = pc_makerune_crestmake_condition;
	information = pc_makerune_crestmake_info;
	permanent = TRUE;
	description = "Vytvořit runu 'Kříž elementů'";
};


func int pc_makerune_crestmake_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && (KNOWS_CRESTMAKE == TRUE))
	{
		return TRUE;
	};
};

func void pc_makerune_crestmake_info()
{
	if((Npc_HasItems(hero,itmi_fireshpere) >= 1) && (Npc_HasItems(hero,itmi_watershpere) >= 1) && (Npc_HasItems(hero,itmi_stoneshpere) >= 1) && (Npc_HasItems(hero,itmi_darkshpere) >= 1) && (Npc_HasItems(hero,itat_golddragonheart) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,itmi_fireshpere,1);
		Npc_RemoveInvItems(hero,itmi_watershpere,1);
		Npc_RemoveInvItems(hero,itmi_stoneshpere,1);
		Npc_RemoveInvItems(hero,itmi_darkshpere,1);
		Npc_RemoveInvItems(hero,itat_golddragonheart,1);
		CreateInvItems(hero,itru_crestelements,1);
		//Print(PRINT_RuneSuccess);
		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Vytvořil jsem Kříž elementů! Teď můžu pomýšlet na setkání s arcidémonem.");
		CRESTNATUREISDONE = TRUE;
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(self,ItMi_RuneBlank,1);
	};

	b_endproductiondialog();
};


//------------------------------------sozdaniye------------------------------------------------------

func void PC_ItRu_Light_Info()
{
	if((Npc_HasItems(hero,ItSc_Light) >= 1) && (Npc_HasItems(hero,ItMi_Gold) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Light,1);
		Npc_RemoveInvItems(hero,ItMi_Gold,1);

		CreateInvItems(hero,ItRu_Light,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Light] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Light] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_LightHeal_Info()
{
	if((Npc_HasItems(hero,ItSc_LightHeal) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_LightHeal,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		CreateInvItems(hero,ItRu_LightHeal,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_LightHeal] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_LightHeal] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Unlock_Info()
{
	if((Npc_HasItems(hero,ItSc_Unlock) >= 1) && (Npc_HasItems(hero,ItKE_lockpick) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Unlock,1);
		Npc_RemoveInvItems(hero,ItKE_lockpick,1);
		CreateInvItems(hero,ItRu_Unlock,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_UnlockChest] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_UnlockChest] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Firebolt_Info()
{
	if((Npc_HasItems(hero,ItSc_Firebolt) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Firebolt,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItRu_FireBolt,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Firebolt] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Firebolt] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Zap_Info()
{
	if((Npc_HasItems(hero,ItSc_Zap) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Zap,1);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		CreateInvItems(hero,ItRu_Zap,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Zap] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Zap] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Sleep_Info()
{
	if((Npc_HasItems(hero,ItSc_Sleep) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Sleep,1);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		CreateInvItems(hero,ItRu_Sleep,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Sleep] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Sleep] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void pc_itru_berzerk_info()
{
	if((Npc_HasItems(hero,itsc_berzerk) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,itsc_berzerk,1);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,itru_berzerk,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[95] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[95] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void pc_itru_deathbolt_info()
{
	if((Npc_HasItems(hero,itsc_deathbolt) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,itsc_deathbolt,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		CreateInvItems(hero,ItRu_Deathbolt,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Deathbolt] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Deathbolt] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_SumGobSkel_Info()
{
	if((Npc_HasItems(hero,ItSc_SumGobSkel) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_SumGobSkel,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		CreateInvItems(hero,ItRu_SumGobSkel,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Rage_Info()
{
	if((Npc_HasItems(hero,ItSc_Rage) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ITMI_PLAZMA) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Rage,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,ITMI_PLAZMA,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItRu_Rage,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Rage] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Rage] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_SumWolf_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_SumWolf) >= 1) && (Npc_HasItems(hero,ItAt_WargFur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_SumWolf,1);
			Npc_RemoveInvItems(hero,ItAt_WargFur,1);
			CreateInvItems(hero,ItRu_SumWolf,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_SummonWolf] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_SummonWolf] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_InstFireball_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_InstantFireball) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_InstantFireball,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			CreateInvItems(hero,ItRu_InstantFireball,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_InstantFireball] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_InstantFireball] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_Lacerate_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_Lacerate) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Lacerate,1);
			Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			CreateInvItems(hero,ItRu_Lacerate,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Lacerate] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Lacerate] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_RapidIcebolt_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_RapidIcebolt) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_RapidIcebolt,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			CreateInvItems(hero,ItRu_RapidIcebolt,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_RapidIcebolt] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_RapidIcebolt] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_RapidFirebolt_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_RapidFirebolt) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_RapidFirebolt,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			CreateInvItems(hero,ItRu_RapidFirebolt,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_RapidFirebolt] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_RapidFirebolt] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_Icelance_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_Icelance) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Icelance,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			CreateInvItems(hero,ItRu_Icelance,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Icelance] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Icelance] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_Icebolt_Info()
{
	if((Npc_HasItems(hero,ItSc_Icebolt) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_Icebolt,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItRu_Icebolt,1);
		//Print(PRINT_RuneSuccess);

		if(PLAYER_MAKE_RUNES[SPL_Icebolt] == FALSE)
		{
			TalentCount_Rune[0] += 5;
			B_RaiseIntRuneSkill();
			PLAYER_MAKE_RUNES[SPL_Icebolt] = TRUE;
		};

		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			B_Circle_01();
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		B_Circle_01();
	};
};

func void PC_ItRu_Windfist_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_Windfist) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Windfist,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			CreateInvItems(hero,ItRu_Windfist,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Windfist] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Windfist] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void pc_itru_telekinesis_info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,itwr_telekinesis) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itwr_telekinesis,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			CreateInvItems(hero,itru_telekinesis,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[83] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[83] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void pc_itru_suckenergy_info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_ManaForLife) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_ManaForLife,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			CreateInvItems(hero,ItRu_ManaForLife,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_ManaForLife] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_ManaForLife] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void pc_itru_summonzombie_info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,itsc_sumzombie) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,itmi_zombiecorpse) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_sumzombie,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,itmi_zombiecorpse,1);
			CreateInvItems(hero,ItRu_SummonZombie,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_SummonZombie] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_SummonZombie] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_MediumHeal_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_MediumHeal) >= 1) && (Npc_HasItems(hero,ITPO_ANPOIS) >= 1) && (Npc_HasItems(hero,ItMi_HolyWater) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_MediumHeal,1);
			Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
			Npc_RemoveInvItems(hero,ITPO_ANPOIS,1);
			CreateInvItems(hero,ItRu_MediumHeal,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_MediumHeal] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_MediumHeal] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void pc_itru_summonshoal_info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,itsc_sumshoal) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItAt_IceWolfFur) >= 3))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_sumshoal,1);
			Npc_RemoveInvItems(hero,ItAt_IceWolfFur,3);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,itru_sumshoal,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[98] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[98] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_Firestorm_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_Firestorm) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Firestorm,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Firestorm,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Firestorm] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Firestorm] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};






func void PC_ItRu_MagicCage_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_MagicCage) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_MagicCage,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_MagicCage,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_MagicCage] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_MagicCage] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_AdanosBall_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_AdanosBall) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_AdanosBall,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_AdanosBall,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_AdanosBall] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_AdanosBall] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_Extricate_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_Extricate) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Extricate,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItAt_Wing,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Extricate,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Extricate] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Extricate] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_IceCube_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_IceCube) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_IceCube,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_IceCube,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_IceCube] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_IceCube] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_ThunderBall_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_ThunderBall) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_ThunderBall,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_ThunderBall,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_ChargeZap] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_ChargeZap] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_Fear_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_Fear) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Fear,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Fear,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Fear] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Fear] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void pc_itru_charm_info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_Charm) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Charm,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,itru_charm,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Charm] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Charm] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void pc_itru_swarm_info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,itsc_swarm) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_swarm,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Swarm,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Swarm] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Swarm] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_SumSkel_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_SumSkel) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_SumSkel,1);
			Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_SumSkel,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_SummonSkeleton] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_SummonSkeleton] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_HarmUndead_Info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItSc_HarmUndead) >= 1) && (Npc_HasItems(hero,ItMi_HolyWater) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_HarmUndead,1);
			Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
			CreateInvItems(hero,ItRu_HarmUndead,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_DestroyUndead] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_DestroyUndead] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_ChargeFireball_Info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,ItSc_ChargeFireBall) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_ChargeFireBall,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItem(hero,ItRu_ChargeFireball);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_ChargeFireball] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_ChargeFireball] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void PC_ItRu_Elevate_Info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,ItSc_Elevate) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Elevate,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItem(hero,ItRu_Elevate);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Elevate] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Elevate] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void pc_itru_firelight_info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,itwr_firelight) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itwr_firelight,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItem(hero,itru_firelight);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[93] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[93] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void PC_ItRu_Waterfist_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_Waterfist) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Waterfist,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Waterfist,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Waterfist] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Waterfist] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};


func void PC_ItRu_Explosion_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_Explosion) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Explosion,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Explosion,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Explosion] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Explosion] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void PC_ItRu_LightningFlash_Info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,ItSc_LightningFlash) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_LightningFlash,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_LightningFlash,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_LightningFlash] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_LightningFlash] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void pc_itru_greententacle_info()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,itsc_greententacle) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_greententacle,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			CreateInvItems(hero,ItRu_GreenTentacle,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_GreenTentacle] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_GreenTentacle] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
				B_Circle_02();
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			B_Circle_02();
		};
	}
	else
	{
		B_Circle_02();
	};
};

func void PC_ItRu_SumGol_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_SumGol) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_SumGol,1);
			Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_SumGol,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_SummonGolem] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_SummonGolem] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void pc_itru_sumfiregol_info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,itsc_sumfiregol) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_FireGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_sumfiregol,1);
			Npc_RemoveInvItems(hero,ItAt_FireGolemHeart,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,itru_sumfiregol,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[80] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[80] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void pc_itru_sumicegol_info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,itsc_sumicegol) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_IceGolemHeart) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_sumicegol,1);
			Npc_RemoveInvItems(hero,ItAt_IceGolemHeart,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,itru_sumicegol,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[89] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[89] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void pc_itru_sumswpgol_info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,itsc_sumswpgol) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,itat_swampgolemheart) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 3))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_sumswpgol,1);
			Npc_RemoveInvItems(hero,itat_swampgolemheart,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,3);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,itru_sumswpgol,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[100] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[100] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void PC_ItRu_Acid_Info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,ItSc_Acid) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITPO_POISON) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Acid,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ITPO_POISON,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Acid,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Acid] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Acid] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};


func void pc_itru_energyball_info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,itsc_energyball) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_energyball,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_BeliarsRage,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Energyball] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Energyball] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_FullHeal_Info()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItSc_FullHeal) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_FullHeal,1);
			Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_FullHeal,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_FullHeal] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_FullHeal] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_03();
	}
	else
	{
		B_Circle_03();
	};
};

func void PC_ItRu_Pyrokinesis_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_Pyrokinesis) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Pyrokinesis,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Pyrokinesis,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Pyrokinesis] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Pyrokinesis] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void PC_ItRu_Geyser_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItSc_Geyser) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Geyser,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Geyser,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Geyser] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Geyser] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void PC_ItRu_Quake_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItSc_Quake) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Quake,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Quake,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Quake] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Quake] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void PC_ItRu_IceWave_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_IceWave) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_IceWave,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_IceWave,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_IceWave] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_IceWave] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void pc_itru_severefetidity_info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,itsc_severefetidity) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_severefetidity,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,itru_severefetidity,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[96] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[96] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void PC_ItRu_Whirlwind_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_Whirlwind) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Whirlwind,1);
			Npc_RemoveInvItems(hero,ItAt_Wing,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Whirlwind,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Whirlwind] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Whirlwind] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void pc_itru_deathball_info()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,itsc_deathball) >= 1) && (Npc_HasItems(hero,ItMi_UpRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_deathball,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_UpRuneBlank,1);
			CreateInvItems(hero,ItRu_Deathball,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Deathball] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Deathball] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_04();
	}
	else
	{
		B_Circle_04();
	};
};

func void pc_itru_control_info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,itwr_control) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itwr_control,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,itru_control,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[94] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[94] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void PC_ItRu_ArmyOfDarkness_Info()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItSc_ArmyOfDarkness) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_ArmyOfDarkness,1);
			Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
			Npc_RemoveInvItems(hero,ItAt_DemonHeart,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_ArmyOfDarkness,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_ArmyOfDarkness] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_ArmyOfDarkness] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_05();
	}
	else
	{
		B_Circle_05();
	};
};

func void PC_ItRu_FireMeteor_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItWr_FireMeteor) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItWr_FireMeteor,1);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_FireMeteor,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_FireMeteor] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_FireMeteor] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void PC_ItRu_Firerain_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItSc_Firerain) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Firerain,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Firerain,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Firerain] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Firerain] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void PC_ItRu_thunderstorm_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItSc_Thunderstorm) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_Thunderstorm,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItAt_Wing,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Thunderstorm,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Thunderstorm] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Thunderstorm] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void PC_ItRu_MassDeath_Info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItSc_MassDeath) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,itmi_plazma) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItSc_MassDeath,1);
			Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,itmi_plazma,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_MassDeath,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_MassDeath] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_MassDeath] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void pc_itru_skull_info()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,itsc_skull) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Skull) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,itsc_skull,1);
			Npc_RemoveInvItems(hero,ItMi_Skull,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItAt_DemonHeart,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_Skull,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_Skull] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_Skull] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

func void pc_ItRu_GuruWrath()
{
	if(B_CheckRuneSkill(90))
	{
		if((Npc_HasItems(hero,ItWr_GuruWrath) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_FireGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_IceGolemHeart) >= 1) && (Npc_HasItems(hero,itat_swampgolemheart) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
			Npc_RemoveInvItems(hero,ItAt_FireGolemHeart,1);
			Npc_RemoveInvItems(hero,ItAt_IceGolemHeart,1);
			Npc_RemoveInvItems(hero,itat_swampgolemheart,1);
			Npc_RemoveInvItems(hero,ItWr_GuruWrath,1);
			Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
			CreateInvItems(hero,ItRu_GuruWrath,1);
			//Print(PRINT_RuneSuccess);

			if(PLAYER_MAKE_RUNES[SPL_GuruWrath] == FALSE)
			{
				TalentCount_Rune[0] += 5;
				B_RaiseIntRuneSkill();
				PLAYER_MAKE_RUNES[SPL_GuruWrath] = TRUE;
			};

			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Circle_06();
	}
	else
	{
		B_Circle_06();
	};
};

//---------------------------------------perenos i yuvelirka---------------------------------

func void trfmagic_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_TRFMAGIC;
		AI_ProcessInfos(her);

		if(FindJewelTable == FALSE)
		{
			FindJewelTable = TRUE;
		};
	};
};

instance PC_TrfMagic_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_TrfMagic_End_Condition;
	information = PC_TrfMagic_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_TrfMagic_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC)
	{
		return TRUE;
	};
};

func void PC_TrfMagic_End_Info()
{
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		CreateInvItems(self,ItRu_SummonGuardian,1);
	}
	else
	{
		CreateInvItems(self,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

instance PC_TrfMagic_ADANMAKE(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_TrfMagic_ADANMAKE_condition;
	information = PC_TrfMagic_ADANMAKE_info;
	permanent = TRUE;
	description = "Přenést magii runy do tabulky.";
};

func int PC_TrfMagic_ADANMAKE_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC) && (CurrentLevel == ADDONWORLD_ZEN) && (KnowsMakeOldMgic == TRUE) && (Npc_HasItems(hero,ItWr_CroneAdanos) >= 1))
	{
		return TRUE;
	};
};

func void PC_TrfMagic_ADANMAKE_info()
{
	B_GivePlayerXP(1500);
	Npc_RemoveInvItems(hero,ItWr_CroneAdanos,1);
	CreateInvItems(hero,ItWr_AdanosCrone_Ready,1);
	CreateInvItems(hero,ItMi_AncientRuneStone,1);
	//Print(PRINT_RuneSuccess);
	AI_PrintClr(PRINT_RuneSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_LogEntry(TOPIC_AdanosCrone,"Přenesl jsem magii runy Stavitelů na starobylou tabulku. Nyní je třeba najít místo, kde vyzvu Strážce!");
	b_endproductiondialog();
};

instance PC_TrfMagic_SteelRings(C_Info)
{
	npc = PC_Hero;
	condition = PC_TrfMagic_SteelRings_Condition;
	information =PC_TrfMagic_SteelRings_Info;
	permanent = TRUE;
	description = "Vyrobit ocelový prsten";
};

func int PC_TrfMagic_SteelRings_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC) && (CurrentLevel == NEWWORLD_ZEN) && (JEWERLY_LEVEL_L1 == TRUE) && (Npc_HasItems(hero,ItMi_IronStuck) >= 1))
	{
		return TRUE;
	};
};

func void PC_TrfMagic_SteelRings_Info()
{
	Info_ClearChoices(PC_TrfMagic_SteelRings);
	Info_AddChoice(PC_TrfMagic_SteelRings,Dialog_Back,PC_TrfMagic_SteelRings_BACK);

	if(Npc_HasItems(hero,ItMi_Diamod) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... s diamantem (ochrana proti všemu: 10)",PC_TrfMagic_SteelRings_Diamod);
	};
	if(Npc_HasItems(hero,ItMi_Emerald) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... se smaragdem (obratnost: 10, ochrana proti bodnému poškození: 5)",PC_TrfMagic_SteelRings_Emerald);
	};
	if(Npc_HasItems(hero,ItMi_Ruby) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... s rubínem (síla: 10, ochrana proti fyzickému poškození: 5)",PC_TrfMagic_SteelRings_Ruby);
	};
	if(Npc_HasItems(hero,ItMi_Sapphire) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... se safírem (mana: 15, ochrana proti magickému poškození: 5, inteligence: 5)",PC_TrfMagic_SteelRings_Sapphire);
	};
	if(Npc_HasItems(hero,ItMi_Opal) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... s opálem (zdraví: 25, ochrana proti ohni: 5)",PC_TrfMagic_SteelRings_Opal);
	};
	if(Npc_HasItems(hero,ItMi_Topaz) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_SteelRings,"... s topazem (výdrž: 5, odolnost: 2)",PC_TrfMagic_SteelRings_Topaz);
	};
};

func void PC_TrfMagic_SteelRings_BACK()
{
	Info_ClearChoices(PC_TrfMagic_SteelRings);
};

func void PC_TrfMagic_SteelRings_Diamod()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);	
		B_GivePlayerXP(XP_HandMade_Rune);	
		Npc_RemoveInvItems(hero,ItMi_Diamod,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Diam,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_SteelRings_Emerald()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Emerald,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Emer,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_SteelRings_Ruby()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Ruby,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Ruby,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_SteelRings_Sapphire()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Sapphire,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Sapp,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_SteelRings_Opal()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Opal,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Opal,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_SteelRings_Topaz()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Topaz,1);
		Npc_RemoveInvItems(hero,ItMi_IronStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		CreateInvItems(hero,ItRi_Steel_Topa,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

instance PC_TrfMagic_GoldRings(C_Info)
{
	npc = PC_Hero;
	condition = PC_TrfMagic_GoldRings_Condition;
	information =PC_TrfMagic_GoldRings_Info;
	permanent = TRUE;
	description = "Vyrobit zlatý prsten";
};

func int PC_TrfMagic_GoldRings_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC) && (CurrentLevel == NEWWORLD_ZEN) && (JEWERLY_LEVEL_L2 == TRUE) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1))
	{
		return TRUE;
	};
};

func void PC_TrfMagic_GoldRings_Info()
{
	Info_ClearChoices(PC_TrfMagic_GoldRings);
	Info_AddChoice(PC_TrfMagic_GoldRings,Dialog_Back,PC_TrfMagic_GoldRings_BACK);

	if(Npc_HasItems(hero,ItMi_Diamod) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... s diamantem (ochrana proti všemu: 20)",PC_TrfMagic_GoldRings_Diamod);
	};
	if(Npc_HasItems(hero,ItMi_Emerald) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... se smaragdem (obratnost: 15, ochrana proti bodnému poškození: 10)",PC_TrfMagic_GoldRings_Emerald);
	};
	if(Npc_HasItems(hero,ItMi_Ruby) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... s rubínem (síla: 15, ochrana proti fyzickému poškození: 10)",PC_TrfMagic_GoldRings_Ruby);
	};
	if(Npc_HasItems(hero,ItMi_Sapphire) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... se safírem (mana: 30, ochrana proti magickému poškození: 10, inteligence: 10)",PC_TrfMagic_GoldRings_Sapphire);
	};
	if(Npc_HasItems(hero,ItMi_Opal) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... s opálem (zdraví: 50, ochrana proti ohni: 10)",PC_TrfMagic_GoldRings_Opal);
	};
	if(Npc_HasItems(hero,ItMi_Topaz) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_GoldRings,"... s topazem (výdrž: 10, odolnost: 3)",PC_TrfMagic_GoldRings_Topaz);
	};
};

func void PC_TrfMagic_GoldRings_BACK()
{
	Info_ClearChoices(PC_TrfMagic_GoldRings);
};

func void PC_TrfMagic_GoldRings_Diamod()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);	
		B_GivePlayerXP(XP_HandMade_Rune);	
		Npc_RemoveInvItems(hero,ItMi_Diamod,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Diam,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_GoldRings_Emerald()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Emerald,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Emer,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_GoldRings_Ruby()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Ruby,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Ruby,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_GoldRings_Sapphire()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Sapphire,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Sapp,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_GoldRings_Opal()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Opal,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Opal,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_GoldRings_Topaz()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Topaz,1);
		Npc_RemoveInvItems(hero,ItMi_StuckGold,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItRi_Gold_Topa,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

instance PC_TrfMagic_OreRings(C_Info)
{
	npc = PC_Hero;
	condition = PC_TrfMagic_OreRings_Condition;
	information =PC_TrfMagic_OreRings_Info;
	permanent = TRUE;
	description = "Vyrobit prsten z magické rudy";
};

func int PC_TrfMagic_OreRings_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC) && (CurrentLevel == NEWWORLD_ZEN) && (JEWERLY_LEVEL_L3 == TRUE) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1))
	{
		return TRUE;
	};
};

func void PC_TrfMagic_OreRings_Info()
{
	Info_ClearChoices(PC_TrfMagic_OreRings);
	Info_AddChoice(PC_TrfMagic_OreRings,Dialog_Back,PC_TrfMagic_OreRings_BACK);

	if(Npc_HasItems(hero,ItMi_Diamod) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... s diamantem (ochrana proti všemu: 30)",PC_TrfMagic_OreRings_Diamod);
	};
	if(Npc_HasItems(hero,ItMi_Emerald) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... se smaragdem (obratnost: 20, ochrana proti bodnému poškození: 15)",PC_TrfMagic_OreRings_Emerald);
	};
	if(Npc_HasItems(hero,ItMi_Ruby) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... s rubínem (síla: 20, ochrana proti fyzickému poškození: 15)",PC_TrfMagic_OreRings_Ruby);
	};
	if(Npc_HasItems(hero,ItMi_Sapphire) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... se safírem (mana: 45, ochrana proti magickému poškození: 15, inteligence: 15)",PC_TrfMagic_OreRings_Sapphire);
	};
	if(Npc_HasItems(hero,ItMi_Opal) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... s opálem (zdraví: 100, ochrana proti ohni: 15)",PC_TrfMagic_OreRings_Opal);
	};
	if(Npc_HasItems(hero,ItMi_Topaz) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_OreRings,"... s topazem (výdrž: 15, odolnost: 4)",PC_TrfMagic_OreRings_Topaz);
	};
};

func void PC_TrfMagic_OreRings_BACK()
{
	Info_ClearChoices(PC_TrfMagic_OreRings);
};

func void PC_TrfMagic_OreRings_Diamod()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);	
		B_GivePlayerXP(XP_HandMade_Rune);	
		Npc_RemoveInvItems(hero,ItMi_Diamod,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Diam,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_OreRings_Emerald()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Emerald,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Emer,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_OreRings_Ruby()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Ruby,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Ruby,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_OreRings_Sapphire()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Sapphire,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Sapp,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_OreRings_Opal()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Opal,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Opal,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_OreRings_Topaz()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 3) && (Npc_HasItems(hero,ItMi_Pitch) >= 3))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Topaz,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,3);
		CreateInvItems(hero,ItRi_Ore_Topa,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

instance PC_TrfMagic_Amulets(C_Info)
{
	npc = PC_Hero;
	condition = PC_TrfMagic_Amulets_Condition;
	information =PC_TrfMagic_Amulets_Info;
	permanent = TRUE;
	description = "Vyrobit amulet z magické rudy";
};

func int PC_TrfMagic_Amulets_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRFMAGIC) && (CurrentLevel == NEWWORLD_ZEN) && (JEWERLY_LEVEL_AMUL == TRUE) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1))
	{
		return TRUE;
	};
};

func void PC_TrfMagic_Amulets_Info()
{
	Info_ClearChoices(PC_TrfMagic_Amulets);
	Info_AddChoice(PC_TrfMagic_Amulets,Dialog_Back,PC_TrfMagic_Amulets_BACK);

	if(Npc_HasItems(hero,ItMi_Diamod) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... s diamantem (ochrana proti všemu: 40)",PC_TrfMagic_Amulets_Diamond);
	};
	if(Npc_HasItems(hero,ItMi_Emerald) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... se smaragdem (obratnost: 25, ochrana proti bodnému poškození: 20)",PC_TrfMagic_Amulets_Emerald);
	};
	if(Npc_HasItems(hero,ItMi_Ruby) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... s rubínem (síla: 25, ochrana proti fyzickému poškození: 20)",PC_TrfMagic_Amulets_Ruby);
	};
	if(Npc_HasItems(hero,ItMi_Sapphire) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... se safírem (mana: 60, inteligence: 20)",PC_TrfMagic_Amulets_Sapphire);
	};
	if(Npc_HasItems(hero,ItMi_Opal) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... s opálem (zdraví: 150, ochrana proti ohni: 20)",PC_TrfMagic_Amulets_Opal);
	};
	if(Npc_HasItems(hero,ItMi_Topaz) >= 1)
	{
		Info_AddChoice(PC_TrfMagic_Amulets,"... s topazem (výdrž: 20, odolnost: 6)",PC_TrfMagic_Amulets_Topaz);
	};
};

func void PC_TrfMagic_Amulets_BACK()
{
	Info_ClearChoices(PC_TrfMagic_Amulets);
};

func void PC_TrfMagic_Amulets_Diamond()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);		
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Diamod,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Diamond,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_Amulets_Emerald()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Emerald,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Emerald,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_Amulets_Ruby()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Ruby,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Ruby,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_Amulets_Sapphire()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Sapphire,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Sapphire,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_Amulets_Opal()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Opal,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Opal,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

func void PC_TrfMagic_Amulets_Topaz()
{
	if((Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
	{
		AI_Wait(self,1);
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItMi_Topaz,1);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1);		
		Npc_RemoveInvItems(hero,ItMi_Pitch,2);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Coal,2);
		CreateInvItems(hero,ItAm_Topaz,1);
		CreateInvItems(hero,ItMi_SteelForm,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		CreateInvItems(hero,ItMi_SteelForm,1);
	};

	b_endproductiondialog();
};

instance PC_TransRune(C_Info)
{
	npc = PC_Hero;
	condition = PC_TransRune_Condition;
	information = PC_TransRune_Info;
	permanent = TRUE;
	description = "Vytvořit kámen transformace";
};

func int PC_TransRune_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune) && ((HeroKnownTrans_DragonSnapper == TRUE) || (HeroKnownTrans_Troll == TRUE) || (HeroKnownTrans_ShadowBeast == TRUE) || (HeroKnownTrans_Warg == TRUE) || (HeroKnownTrans_FireWaran == TRUE) || (HeroKnownTrans_BloodFly == TRUE)))
	{
		return TRUE;
	};
};

func void PC_TransRune_Info()
{
	Info_ClearChoices(PC_TransRune);
	Info_AddChoice(PC_TransRune,Dialog_Back,PC_TransRune_BACK);

	if(HeroKnownTrans_BloodFly == TRUE)
	{
		Info_AddChoice(PC_TransRune,"Přeměna v krvavou mouchu",PC_TransRune_BloodFly);
	};
	if(HeroKnownTrans_FireWaran == TRUE)
	{
		Info_AddChoice(PC_TransRune,"Přeměna v ohnivého ještěra",PC_TransRune_FireWaran);
	};
	if(HeroKnownTrans_Warg == TRUE)
	{
		Info_AddChoice(PC_TransRune,"Přeměna ve warga",PC_TransRune_Warg);
	};
	if(HeroKnownTrans_ShadowBeast == TRUE)
	{
		Info_AddChoice(PC_TransRune,"Přeměna ve stínovou šelmu",PC_TransRune_ShadowBeast);
	};
	if(HeroKnownTrans_DragonSnapper == TRUE)
	{
		Info_AddChoice(PC_TransRune,"Přeměna v dračího chňapavce",PC_TransRune_DragonSnapper);
	};
};


func void PC_TransRune_BACK()
{
	Info_ClearChoices(PC_TransRune);
};

func void PC_TransRune_BloodFly()
{
	if((Npc_HasItems(hero,ItAt_Wing) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItAt_Wing,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		Npc_RemoveInvItems(hero,ItMi_Pitch,1);
		CreateInvItems(hero,ItRu_TrfBloodFly,1);
		//Print(PRINT_RuneSuccess);
		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");

		if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
		}
		else
		{
			b_endproductiondialog();
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_TransRune_Info();
	};
};

func void PC_TransRune_FireWaran()
{
	if(B_CheckRuneSkill(15))
	{
		if((Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(hero,itat_LurkerSkin) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,itat_LurkerSkin,1);
			CreateInvItems(hero,ItRu_TrfFireWaran,1);
			//Print(PRINT_RuneSuccess);
			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			}
			else
			{
				b_endproductiondialog();
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_TransRune_Info();
		};
	}
	else
	{
		PC_TransRune_Info();
	};
};

func void PC_TransRune_Warg()
{
	if(B_CheckRuneSkill(30))
	{
		if((Npc_HasItems(hero,ItAt_Teeth) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItAt_WargFur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItAt_Teeth,2);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItAt_WargFur,1);
			CreateInvItems(hero,ItRu_TrfWarg,1);
			//Print(PRINT_RuneSuccess);
			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			}
			else
			{
				b_endproductiondialog();
			};	
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_TransRune_Info();
		};
	}
	else
	{
		PC_TransRune_Info();
	};
};

func void PC_TransRune_ShadowBeast()
{
	if(B_CheckRuneSkill(50))
	{
		if((Npc_HasItems(hero,ItAt_ShadowHorn) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItAt_ShadowFur) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItAt_ShadowHorn,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,ItAt_ShadowFur,1);
			CreateInvItems(hero,ItRu_TrfShadowbeast,1);
			//Print(PRINT_RuneSuccess);
			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			}
			else
			{
				b_endproductiondialog();
			};	
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_TransRune_Info();
		};
	}
	else
	{
		PC_TransRune_Info();
	};
};

func void PC_TransRune_DragonSnapper()
{
	if(B_CheckRuneSkill(70))
	{
		if((Npc_HasItems(hero,ItAt_DrgSnapperHorn) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 1))
		{
			B_GivePlayerXP(XP_HandMade_Rune);
			Npc_RemoveInvItems(hero,ItAt_DrgSnapperHorn,1);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ItMi_Nugget,1);
			CreateInvItems(hero,ItRu_TrfDragonSnapper,1);
			//Print(PRINT_RuneSuccess);
			AI_PrintClr(PRINT_RuneSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ItMi_RuneBlank) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_RuneBlank,1);
			}
			else
			{
				b_endproductiondialog();
			};	
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
			PC_TransRune_Info();
		};
	}
	else
	{
		PC_TransRune_Info();
	};
};

//---------------------------------------perenos i yuvelirka---------------------------------

func void MAKESCROLLS_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_MAKESCROLLS_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_MAKESCROLLS_End_Condition;
	information = PC_MAKESCROLLS_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_MAKESCROLLS_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && ((Npc_GetDistToWP(hero,"OC_MAKESC_01") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01") < 500) || (Npc_GetDistToWP(hero,"NW_MAKESC_01") < 500) || (Npc_GetDistToWP(hero,"NW_MAKESC_02") < 500)))

	{
		return TRUE;
	};
};

func void PC_MAKESCROLLS_End_Info()
{
	b_endproductiondialog();
	CreateInvItems(hero,ItMi_Feder,2);
};

instance PC_MAKESCROLLS_ITSC(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_MAKESCROLLS_ITSC_condition;
	information = PC_MAKESCROLLS_ITSC_info;
	permanent = TRUE;
	description = "Vytvořit magický svitek";
};

func int PC_MAKESCROLLS_ITSC_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (HOWCANMAKERUNE_ITSC == 1) && ((Npc_GetDistToWP(hero,"OC_MAKESC_01") < 500) || (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01") < 500) || (Npc_GetDistToWP(hero,"NW_MAKESC_01") < 500) || (Npc_GetDistToWP(hero,"NW_MAKESC_02") < 500)))
	{
		return TRUE;
	};
};

func void PC_MAKESCROLLS_ITSC_info()
{
	Info_ClearChoices(PC_MAKESCROLLS_ITSC);
	Info_AddChoice(PC_MAKESCROLLS_ITSC,Dialog_Back,PC_MAKESCROLLS_ITSC_BACK);

	if(HOWCANMAKERUNE_ITSC1 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Ohnivý déšť'",PC_MAKESCROLLS_itsc_firerain);
	};
	if(HOWCANMAKERUNE_ITSC2 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Zničení nemrtvého'",PC_MAKESCROLLS_itsc_hurmundead);
	};
	if(HOWCANMAKERUNE_ITSC4 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Ledový blok'",PC_MAKESCROLLS_itsc_icecube);
	};
	if(HOWCANMAKERUNE_ITSC5 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Ledová vlna'",PC_MAKESCROLLS_itsc_icewave);
	};
	if(HOWCANMAKERUNE_ITSC6 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Tornádo'",PC_MAKESCROLLS_itsc_tornado);
	};
	if(HOWCANMAKERUNE_ITSC7 == TRUE)
	{
		Info_AddChoice(PC_MAKESCROLLS_itsc,"Vytvořit svitek 'Požírač zámků'",PC_MAKESCROLLS_itsc_unlock);
	};
};

func void PC_MAKESCROLLS_ITSC_BACK()
{
	Info_ClearChoices(PC_MAKESCROLLS_ITSC);
};

func void PC_MAKESCROLLS_itsc_unlock()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_Unlock);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func void PC_MAKESCROLLS_itsc_firerain()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_Firerain);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func void PC_MAKESCROLLS_itsc_hurmundead()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_HarmUndead);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func void PC_MAKESCROLLS_itsc_icecube()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_IceCube);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func void PC_MAKESCROLLS_itsc_icewave()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_IceWave);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func void PC_MAKESCROLLS_itsc_tornado()
{
	if(Npc_HasItems(hero,itwr_magicpaper) >= 1)
	{
		B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,itwr_magicpaper,1);
		CreateInvItem(hero,ItSc_Whirlwind);
		AI_PrintClr("Vytvořil jsi magický svitek!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		PC_MAKESCROLLS_ITSC_info();
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
		PC_MAKESCROLLS_ITSC_info();
	};
};

func int CANONE_FIRE_COND()
{
	if(Npc_HasItems(hero,ItLsTorch) >= 1)
	{
		return TRUE;
	};

	return FALSE;	
};

func void CANONE_FIRE_s1()
{
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_CANONE_FIRE_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_CANONE_FIRE_End_Condition;
	information = PC_CANONE_FIRE_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_CANONE_FIRE_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && ((Npc_GetDistToWP(hero,"ADW_PIRATECAMP_BEACH_BRENDIK") < 500) || (Npc_GetDistToWP(hero,"ADW_PIRATECAMP_BEACH_BRENDIK_99") < 500)))

	{
		return TRUE;
	};
};

func void PC_CANONE_FIRE_End_Info()
{
	CreateInvItem(hero,ItMi_CanoneBall);
	b_endproductiondialog();
};

instance PC_CANONE_FIRE_SHOOT(C_Info)
{
	npc = PC_Hero;
	condition = PC_CANONE_FIRE_SHOOT_Condition;
	information = PC_CANONE_FIRE_SHOOT_Info;
	permanent = TRUE;
	description = "Provést výstřel";
};

func int PC_CANONE_FIRE_SHOOT_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ADW_PIRATECAMP_BEACH_BRENDIK_99") < 500))
	{
		return TRUE;
	};
};

func void PC_CANONE_FIRE_SHOOT_Info()
{
	var C_Npc targ;

	targ = Hlp_GetNpc(SchwaPuFass);

	if(Npc_HasItems(hero,ItMi_MagicPowder) >= 1)
	{
		Npc_ChangeAttribute(targ,ATR_HITPOINTS,-targ.attribute[ATR_HITPOINTS_MAX]);
		Wld_InsertItem(ItMi_CanoneBall_Fire,"FP_ITEM_CANONE_01");
		Wld_SendTrigger("EVT_ADANOSCHAN_01");
		Snd_Play("CANONE");
		Wld_SendTrigger("EVT_CANONEBALL_CAM_01");
		Npc_RemoveInvItems(hero,ItMi_MagicPowder,1);
		Npc_RemoveInvItems(hero,ItMi_CanoneBall,1);

		if((MIS_MagicPowder == LOG_Running) && (CanonIsFire == FALSE))
		{
			B_GivePlayerXP(300);
			B_LogEntry(TOPIC_MagicPowder,"Zdá se, že Gallahadův magický dělostřelecký prášek funguje. Musím ho o tom informovat!");
			CanonIsFire = TRUE;
		};
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

//-----------------------------demonologiya--------------------------------------------------------

func void DEMONCASTER_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_DemonCaster_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_DemonCaster_End_Condition;
	information = PC_DemonCaster_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_DemonCaster_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"NW_DEMONCASTER_01") < 350))
	{
		return TRUE;
	};
};

func void PC_DemonCaster_End_Info()
{
	b_endproductiondialog();
};

instance PC_DemonCaster_Rune(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_DemonCaster_Rune_Condition;
	information = PC_DemonCaster_Rune_Info;
	permanent = TRUE;
	description = "Vytvořit démonologickou runu";
};

func int PC_DemonCaster_Rune_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (SummonRuneDone == FALSE) && (Npc_GetDistToWP(hero,"NW_DEMONCASTER_01") < 350) && (XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE))
	{
		return TRUE;
	};
};

func void PC_DemonCaster_Rune_Info()
{
	if((Npc_HasItems(hero,ItSc_SumDemon) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1) && (Npc_HasItems(hero,ItMi_HighRuneBlank) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 3))
	{
		B_GivePlayerXP(XP_HandMade_Rune);
		Npc_RemoveInvItems(hero,ItSc_SumDemon,1);
		Npc_RemoveInvItems(hero,ItAt_DemonHeart,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
		Npc_RemoveInvItems(hero,ItMi_Pitch,3);
		Npc_RemoveInvItems(hero,ItMi_Coal,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,3);
		Npc_RemoveInvItems(hero,ItMi_HighRuneBlank,1);
		CreateInvItems(hero,ItRu_SumDemon,1);
		AI_PrintClr(PRINT_RuneSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		SummonRuneDone = TRUE;
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_DemonCaster_UpRune(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_DemonCaster_UpRune_Condition;
	information = PC_DemonCaster_UpRune_Info;
	permanent = TRUE;
	description = "Vylepšit démonologickou runu";
};

func int PC_DemonCaster_UpRune_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (SummonRuneDone == TRUE) && (Npc_GetDistToWP(hero,"NW_DEMONCASTER_01") < 350) && (DemonologSkill[0] < 6) && (XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE))
	{
		return TRUE;
	};
};

func void PC_DemonCaster_UpRune_Info()
{
	Info_ClearChoices(PC_DemonCaster_UpRune);
	Info_AddChoice(PC_DemonCaster_UpRune,Dialog_Back,PC_DemonCaster_UpRune_BACK);

	if(DemonologSkill[0] == 0)
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"1. kruh démonologie (VB: 5, malá esence démona)",PC_DemonCaster_UpRune_01);
	};
	if(DemonologSkill[0] == 1)
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"2. kruh démonologie (VB: 10, esence démona)",PC_DemonCaster_UpRune_02);
	};
	if(DemonologSkill[0] == 2)
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"3. kruh démonologie (VB: 15, silná esence démona)",PC_DemonCaster_UpRune_03);
	};
	if((DemonologSkill[0] == 3) && (XARDASTEACHCASTDEMON_LORD == TRUE))
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"4. kruh démonologie (VB: 20, malá esence arcidémona)",PC_DemonCaster_UpRune_04);
	};
	if((DemonologSkill[0] == 4) && (XARDASTEACHCASTDEMON_LORD == TRUE))
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"5. kruh démonologie (VB: 25, esence arcidémona)",PC_DemonCaster_UpRune_05);
	};
	if((DemonologSkill[0] == 5) && (XARDASTEACHCASTDEMON_LORD == TRUE))
	{
		Info_AddChoice(PC_DemonCaster_UpRune,"6. kruh démonologie (VB: 30, silná esence arcidémona)",PC_DemonCaster_UpRune_06);
	};
};

func void PC_DemonCaster_UpRune_BACK()
{
	Info_ClearChoices(PC_DemonCaster_UpRune);
};

func void PC_DemonCaster_UpRune_01()
{
	if((hero.lp >= 5) && (Npc_HasItems(hero,ItMi_SMD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 1;
		hero.lp = hero.lp - 5;
		Npc_RemoveInvItems(hero,ItRu_SumDemon,1);
		CreateInvItems(hero,ItRu_SumDemon_01,1);
		Npc_RemoveInvItems(hero,ItMi_SMD_Mutagen,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC1);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,2);
	}
	else
	{
		if(hero.lp < 5)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};

func void PC_DemonCaster_UpRune_02()
{
	if((hero.lp >= 10) && (Npc_HasItems(hero,ItMi_MD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon_01) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 2;
		hero.lp = hero.lp - 10;
		Npc_RemoveInvItems(hero,ItRu_SumDemon_01,1);
		CreateInvItems(hero,ItRu_SumDemon_02,1);
		Npc_RemoveInvItems(hero,ItMi_MD_Mutagen,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC2);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,3);
	}
	else
	{
		if(hero.lp < 10)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};

func void PC_DemonCaster_UpRune_03()
{
	if((hero.lp >= 15) && (Npc_HasItems(hero,ItMi_LMD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon_02) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 3;
		hero.lp = hero.lp - 15;
		Npc_RemoveInvItems(hero,ItRu_SumDemon_02,1);
		CreateInvItems(hero,ItRu_SumDemon_03,1);
		Npc_RemoveInvItems(hero,ItMi_LMD_Mutagen,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC3);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,4);
	}
	else
	{
		if(hero.lp < 15)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};

func void PC_DemonCaster_UpRune_04()
{
	if((hero.lp >= 20) && (Npc_HasItems(hero,ItMi_SMAD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon_03) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 4;
		hero.lp = hero.lp - 20;
		Npc_RemoveInvItems(hero,ItRu_SumDemon_03,1);
		Npc_RemoveInvItems(hero,ItMi_SMAD_Mutagen,1);
		CreateInvItems(hero,ItRu_SumDemon_04,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC4);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,5);
	}
	else
	{
		if(hero.lp < 20)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};

func void PC_DemonCaster_UpRune_05()
{
	if((hero.lp >= 25) && (Npc_HasItems(hero,ItMi_MAD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon_04) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 5;
		hero.lp = hero.lp - 25;
		Npc_RemoveInvItems(hero,ItMi_MAD_Mutagen,1);
		Npc_RemoveInvItems(hero,ItRu_SumDemon_04,1);
		CreateInvItems(hero,ItRu_SumDemon_05,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC5);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,6);
	}
	else
	{
		if(hero.lp < 25)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};

func void PC_DemonCaster_UpRune_06()
{
	if((hero.lp >= 30) && (Npc_HasItems(hero,ItMi_LMAD_Mutagen) >= 1) && (Npc_HasItems(hero,ItRu_SumDemon_05) >= 1))
	{
		AI_Wait(hero,1);
		Snd_Play("DEM_AMBIENT");
		DemonologSkill[0] = 6;
		hero.lp = hero.lp - 30;
		Npc_RemoveInvItems(hero,ItMi_LMAD_Mutagen,1);
		Npc_RemoveInvItems(hero,ItRu_SumDemon_05,1);
		CreateInvItems(hero,ItRu_SumDemon_06,1);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(PRINT_LEARNDEMONOLOGFC6);
		AI_PrintClr(PRINT_UpRuneSuccess,83,152,48);
		Npc_SetTalentSkill(self,NPC_TALENT_DEMONOLOG,7);
	}
	else
	{
		if(hero.lp < 30)
		{
			AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		}
		else
		{
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		};
	};

	PC_DemonCaster_UpRune_Info();
};