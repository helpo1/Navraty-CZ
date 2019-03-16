/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(9x) ExitSession - zamezeno ukončení hry po použití cheatů
if(PrologCount == 0) - upraveno vložení předmětu do hry (ITMW_1H_CREST)
(2x) upraveny titulky - intro a úvodní (PrologCredits), závěrečné (ENDGAMECREDITS)
func void EveryDayEconomicStuff - přidán Bilgot jako lovec (kvůli úpravám úkolů Noví lovci (TOPIC_NewHunters) a Lidé pro tábor (TOPIC_PPL_FOR_TOWER))

*/



var int IlarahCountAct_01;
var int IlarahCountAct_02;
var int IlarahCountAct_03;
var int IlarahCountAct_04;
var int RemoveGodsEquip;

func void CheckGameStatus()
{
	if((CheckStatusHero[0] != SBMODE) && (CanChangeItem == TRUE) && (CheckStatusHero[1] == FALSE))
	{
		CheckStatusHero[1] = TRUE;
	};
	if((CheckStatusHero[0] == 1) && (CanChangeItem == TRUE) && (CheckStatusHero[1] == FALSE) && ((CheckLevelOption[CH_XP_PER_VICTORY] != XP_PER_VICTORY) || (CheckLevelOption[CH_SURPRISE] != SURPRISE) || (CheckLevelOption[CH_SLEEPDIS] != SLEEPDIS)))
	{
		CheckStatusHero[1] = TRUE;
	}
	else if((CheckStatusHero[0] == 2) && (CanChangeItem == TRUE) && (CheckStatusHero[1] == FALSE) && ((CheckLevelOption[CH_XP_PER_VICTORY] != XP_PER_VICTORY) || (CheckLevelOption[CH_SURPRISE] != SURPRISE) || (CheckLevelOption[CH_SLEEPDIS] != SLEEPDIS)))
	{
		CheckStatusHero[1] = TRUE;
	}
	else if((CheckStatusHero[0] == 4) && (CanChangeItem == TRUE) && (CheckStatusHero[1] == FALSE) && ((CheckLevelOption[CH_XP_PER_VICTORY]!= XP_PER_VICTORY) || (CheckLevelOption[CH_SURPRISE] != SURPRISE) || (CheckLevelOption[CH_SLEEPDIS] != SLEEPDIS)))
	{
		CheckStatusHero[1] = TRUE;
	};
};

func void B_CheckMenuOption()
{
	var c_item EqWp;
	var int tempMinDam;
	var int tmpPhisDef;
	var int tmpPointDef;
	var int tmpFlyDef;
	
	
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) && (PickPocketBonusCount == 0))
	{
	//AI_Print(IntToString(PickPocketBonusCount));
	//AI_Print(IntToString(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET)));
	

		PickPocketBonusCount = 1;
	};


	if((RealMode[2] == TRUE) && (Menu_ReadInt("AST","bCanSaveLeg") == TRUE) && (CheckRealMode[1] == TRUE))
	{
		CheckRealMode[1] = FALSE;
	};
	if((RealMode[2] == TRUE) && (Menu_ReadInt("AST","bCanSaveLeg") == FALSE) && (CheckRealMode[1] == FALSE))
	{
		Menu_WriteInt("AST","bCanSaveLeg",TRUE);
	};
	if((Menu_ReadInt("AST","bCanNewSteal") == TRUE) && (bNewSteal[0] == FALSE))
	{
		bNewSteal[0] = TRUE;	
	}
	else if((Menu_ReadInt("AST","bCanNewSteal") == FALSE) && (bNewSteal[0] == TRUE))
	{
		bNewSteal[0] = FALSE;
	};
	if(RealMode[2] == TRUE)
	{
		if(Menu_ReadInt("AST","AutoAIM") == TRUE)
		{
			Menu_WriteInt("AST","AutoAIM",FALSE);
		};
		if(Menu_ReadInt("AST","bCanNewSteal") == FALSE)
		{
			Menu_WriteInt("AST","bCanNewSteal",TRUE);
			bNewSteal[0] = TRUE;
		};
	};
	if((_bCanSave == TRUE) && (Menu_ReadInt("AST","bCanSaveGame") == FALSE))
	{
 		Menu_WriteInt("AST","bCanSaveGame",TRUE);
	}
	else if((_bCanSave == FALSE) && (Menu_ReadInt("AST","bCanSaveGame") == TRUE))
	{
 		Menu_WriteInt("AST","bCanSaveGame",FALSE);
	};
	if(Menu_ReadInt("KEYS","keyLockTarget") != FALSE)
	{
		Menu_WriteInt("KEYS","keyLockTarget",FALSE);
	};
	if(Menu_ReadInt("KEYSDEFAULT0","keyLockTarget") != FALSE)
	{
		Menu_WriteInt("KEYSDEFAULT0","keyLockTarget",FALSE);
	};
	if(Menu_ReadInt("KEYSDEFAULT1","keyLockTarget") != FALSE)
	{
		Menu_WriteInt("KEYSDEFAULT1","keyLockTarget",FALSE);
	};
	if(Menu_ReadInt("KEYS","keyShowStatus") != FALSE)
	{
		Menu_WriteInt("KEYS","keyShowStatus",FALSE);
	};
	if(Menu_ReadInt("KEYSDEFAULT0","keyShowStatus") != FALSE)
	{
		Menu_WriteInt("KEYSDEFAULT0","keyShowStatus",FALSE);
	};
	if(Menu_ReadInt("KEYSDEFAULT1","keyShowStatus") != FALSE)
	{
		Menu_WriteInt("KEYSDEFAULT1","keyShowStatus",FALSE);
	};
	if((Menu_ReadInt("AST","bHFTStatus") == TRUE) && (SBMODE != TRUE))
	{
		Menu_WriteInt("AST","bHFTStatus",0);
	};
	if(Menu_ReadInt("AST","bHideHelm") == 1)
	{
		Menu_WriteInt("AST","bHideHelm",0);
	};
	if(Menu_ReadInt("GAME","spawnRemoveNpcOnlyIfEmpty") == 0)
	{
		Menu_WriteInt("GAME","spawnRemoveNpcOnlyIfEmpty",1);
	};
	if(Menu_ReadInt("GAME","spawnUseDeadNpcRoutinePos") == 0)
	{
		Menu_WriteInt("GAME","spawnUseDeadNpcRoutinePos",1);
	};
	if(Menu_ReadInt("AST","bShowDamage") == 1)
	{
		Menu_WriteInt("AST","bShowDamage",0);
	};
	if((Menu_ReadInt("AST","bAltHair") == TRUE) && (HeroBoldHead == TRUE))
	{
		Menu_WriteInt("AST","bAltHair",0);
	};
	if((Menu_ReadInt("GAME","invMaxColumns") > 6) || (Menu_ReadInt("GAME","invMaxColumns") == FALSE))
	{
		Menu_WriteInt("GAME","invMaxColumns",6);
	};
	if(ModVersion[0] == 66)
	{
		if(CheckVersion == FALSE)
		{
			CheckVersion = TRUE;
		};
	}
	else
	{
		if(CheckVersion == TRUE)
		{
			CheckVersion = FALSE;
		};
	};
	if(RhetorikSkillValue[1] > 100)
	{
		RhetorikSkillValue[1] = 100;
	};
	if(hero.attribute[ATR_MANA] < 0)
	{
		hero.attribute[ATR_MANA] = 0;
	};		
	if(ATR_STAMINA_MAX[0] > 100)
	{
		ATR_STAMINA_MAX[0] = 100;
	};		
	if(ATR_STAMINA[0] > 1000)
	{
		ATR_STAMINA[0] = 1000;
	};		
	if(hero.protection[PROT_EDGE] < 0)
	{
		hero.protection[PROT_EDGE] = 0;
	};		
	if(hero.protection[PROT_BLUNT] < 0)
	{
		hero.protection[PROT_BLUNT] = 0;
	};		
	if(hero.protection[PROT_POINT] < 0)
	{
		hero.protection[PROT_POINT] = 0;
	};		
	if(hero.protection[PROT_MAGIC] < 0)
	{
		hero.protection[PROT_MAGIC] = 0;
	};		
	if(hero.protection[PROT_FIRE] < 0)
	{
		hero.protection[PROT_FIRE] = 0;
	};		
	if(hero.protection[PROT_FLY] < 0)
	{
		hero.protection[PROT_FLY] = 0;
	};		
	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	//----------------proverka na chit i overkap---------------------------
	
	if(SBMODE == TRUE)
	{
		if((hero.attribute[ATR_HITPOINTS_MAX] > 7500) && (SBMODE == TRUE))
		{
			hero.attribute[ATR_HITPOINTS_MAX] = 7500;
			AI_PrintClr(PRINT_OvercapSkill,177,58,17);
		};
		if((hero.attribute[ATR_HITPOINTS] > 7500) && (SBMODE == TRUE))
		{
			hero.attribute[ATR_HITPOINTS] = 7500;
		};
		if((hero.attribute[ATR_MANA_MAX] > 2500) && (SBMODE == TRUE))
		{
			hero.attribute[ATR_MANA_MAX] = 2500;
			AI_PrintClr(PRINT_OvercapSkill,177,58,17);
		};
		if((hero.attribute[ATR_MANA] > 2500) && (SBMODE == TRUE))
		{	
			hero.attribute[ATR_MANA] = 2500;
		};
		if((hero.attribute[ATR_STRENGTH] > 1000) && (SBMODE == TRUE))
		{	
			hero.attribute[ATR_STRENGTH] = 1000;
			AI_PrintClr(PRINT_OvercapSkill,177,58,17);
		};
		if((hero.attribute[ATR_DEXTERITY] > 1000) && (SBMODE == TRUE))
		{	
			hero.attribute[ATR_DEXTERITY] = 1000;
			AI_PrintClr(PRINT_OvercapSkill,177,58,17);
		};
	};
	if((BeMusic == FALSE) && (Menu_ReadInt("SOUND","musicEnabled") == TRUE) && ((PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit) || (PLAYER_MOBSI_PRODUCTION == MOBSI_HERD)))
	{
		Menu_WriteInt("SOUND","musicEnabled",FALSE);
		BeMusic = TRUE;
	}
	else if((PLAYER_MOBSI_PRODUCTION != MOBSI_SleepAbit) && (PLAYER_MOBSI_PRODUCTION != MOBSI_HERD) && (BeMusic == TRUE))
	{
		if(Menu_ReadInt("SOUND","musicEnabled") == FALSE)
		{
			Menu_WriteInt("SOUND","musicEnabled",TRUE);
		};
	
		BeMusic = FALSE;
	};
	if(SwitchMusicOff == TRUE)
	{
		if((Menu_ReadInt("SOUND","musicEnabled") == TRUE) && (BeFightMusic == FALSE))
		{
			Menu_WriteInt("SOUND","musicEnabled",FALSE);
			BeFightMusic = TRUE;
		}
		else if(BeFightMusic == TRUE)
		{
			TempCountFightMusic += 1;

			if(TempCountFightMusic >= 407)
			{
				if(Menu_ReadInt("SOUND","musicEnabled") == FALSE)
				{
					Menu_WriteInt("SOUND","musicEnabled",TRUE);
				};

				TempCountFightMusic = FALSE;
				BeFightMusic = FALSE;
				SwitchMusicOff = FALSE;
			};
		};
	};
	if(hero.attribute[ATR_REGENERATEHP] != hero.HitChance[NPC_TALENT_BOW])
	{
		hero.attribute[ATR_REGENERATEHP] = hero.HitChance[NPC_TALENT_BOW];
	};
	if(hero.mission[0] != hero.HitChance[NPC_TALENT_CROSSBOW])
	{
		hero.mission[0] = hero.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(hero.mission[1] != ATR_STAMINA_MAX[0])
	{
		hero.mission[1] = ATR_STAMINA_MAX[0];
	};	
	if(Npc_GetTalentSkill(hero,NPC_TALENT_FOREIGNLANGUAGE) != hero.protection[PROT_EDGE])
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_FOREIGNLANGUAGE,hero.protection[PROT_EDGE]);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) >= 1)
	{
		if(TalentCount_PickLock[0] >= 100)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKLOCK,3);
		}
		else if(TalentCount_PickLock[0] >= 50)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKLOCK,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_PICKLOCK,1);
		};
	};
	if((PickPocketBonusCount < 100) && (PickPocketBonus == TRUE))
	{
		PickPocketBonusCount	= 100;
	};
	if(PickPocketBonusCount > 100)
	{
		PickPocketBonusCount = 100;
	};
	if((ProStatStr == FALSE) && (hero.aivar[REAL_STRENGTH] > 50) && (hero.aivar[REAL_STRENGTH] > hero.aivar[REAL_DEXTERITY]) && (hero.aivar[REAL_STRENGTH] > hero.aivar[REAL_MANA_MAX]))
	{
		ProStatStr = TRUE;
		ProStatDex = FALSE;
		ProStatMan = FALSE;
	};
	if((ProStatDex == FALSE) && (hero.aivar[REAL_DEXTERITY] > 50) && (hero.aivar[REAL_DEXTERITY] > hero.aivar[REAL_STRENGTH]) && (hero.aivar[REAL_DEXTERITY] > hero.aivar[REAL_MANA_MAX]))
	{
		ProStatStr = FALSE;
		ProStatDex = TRUE;
		ProStatMan = FALSE;
	};
	if((ProStatMan == FALSE) && (hero.aivar[REAL_MANA_MAX] > 50) && (hero.aivar[REAL_MANA_MAX] > hero.aivar[REAL_DEXTERITY]) && (hero.aivar[REAL_MANA_MAX] > hero.aivar[REAL_STRENGTH]))
	{
		ProStatStr = FALSE;
		ProStatDex = FALSE;
		ProStatMan = TRUE;
	};

	STR_ATR_STAMINA_MAX = IntToString(ATR_STAMINA_MAX[0] * 10);
	STR_ATR_STAMINA = IntToString(ATR_STAMINA[0]);
	INT_ATR_STAMINA_MAX = ATR_STAMINA_MAX[0] * 10;
	INT_ATR_STAMINA = ATR_STAMINA[0];
	STR_HUNGER = IntToString(100 - (Hero_Hunger * 10));
	STR_THIRST = IntToString(100 - (Hero_Thirst * 20));
	STR_FATIGUE = IntToString(100 - (Hero_Fatigue * 10));
	STR_MAGICPLUSDAMAGE = ConcatStrings(IntToString(CountLearnSpell),"%");

	if(CraitSumFT == TRUE)
	{
		if(CraitIsUp == TRUE)
		{
			CRT_LVL = IntToString(CraitLvl);
			CRT_STR = IntToString(Crait.attribute[ATR_STRENGTH]);
			CRT_DEX = IntToString(Crait.attribute[ATR_DEXTERITY]);
			CRT_HPS = IntToString(Crait.attribute[ATR_HITPOINTS_MAX]);
			CRT_PBL = IntToString(Crait.protection[PROT_BLUNT]);
			CRT_PED = IntToString(Crait.protection[PROT_EDGE]);
			CRT_PPO = IntToString(Crait.protection[PROT_POINT]);
			CRT_PFI = IntToString(Crait.protection[PROT_FIRE]);
			CRT_PMA = IntToString(Crait.protection[PROT_MAGIC]);
		}
		else
		{
			CRT_LVL = "-";
			CRT_STR = "-";
			CRT_DEX = "-";
			CRT_HPS = "-";
			CRT_PBL = "-";
			CRT_PED = "-";
			CRT_PPO = "-";
			CRT_PFI = "-";
			CRT_PMA = "-";
		};
	};
	if((Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (RemoveGodsEquip == FALSE))
	{
		AI_UnequipWeapons(hero);
		AI_UnequipArmor(hero);

		if(Npc_HasItems(hero,ItAr_GodArmor) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAr_GodArmor,Npc_HasItems(hero,ItAr_GodArmor));
		};
		if(Npc_HasItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC,Npc_HasItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC));
		};
		if(Npc_HasItems(hero,ITMW_2H_BLESSEDBLACK_MAGIC) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMW_2H_BLESSEDBLACK_MAGIC,Npc_HasItems(hero,ITMW_2H_BLESSEDBLACK_MAGIC));
		};
		if(Npc_HasItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC_DEX) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC_DEX,Npc_HasItems(hero,ITMW_1H_BLESSEDBLACK_MAGIC_DEX));
		};

		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
		Snd_Play("OPEN_PORTAL");
		RemoveGodsEquip = TRUE;
	};
	if((Npc_IsInFightMode(hero,FMODE_NONE) == FALSE) && (FlyCarpetIsOn == TRUE))
	{
		Ext_RemoveFromSlot(hero,"BIP01");	
		Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
		AI_Dodge(hero);
		Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
		FlyCarpetIsOn = FALSE;
		CheckDismount = TRUE;
	};
	if((CurrentLevel == ADANOSVALLEY_ZEN) && (Npc_GetDistToWP(hero,"AV_PYRAMIDE_IN") <= 2000) && C_BodyStateContains(hero,BS_FALL))
	{
		AI_StandUpQuick(hero);
	};
	if((LowHealth == FALSE) && (HelmIsUpTemp == FALSE))
	{
		if(HelmIsUp == TRUE)
		{
			if(TempHelmModel == FALSE)
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					};
				};
			}
			else
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
					};
				};
			};
		}
		else
		{
			if(HeroBoldHead == TRUE)
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}	
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				};	
			}
			else
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{	
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
				};	
			};
		};

		HelmIsUpTemp = TRUE;
	}
	else	if((LowHealth == TRUE) && (HelmIsUpTemp == FALSE))
	{
		if(HelmIsUp == TRUE)
		{
			if(TempHelmModel == FALSE)
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else	
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{	
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
					};
				};
			}	
			else
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}	
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
					}	
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
					};
				};
			};
		}
		else
		{
			if(HeroBoldHead == TRUE)
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{	
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				};
			}
			else
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
				};
			};
		};	

		HelmIsUpTemp = TRUE;
	};
	if(Menu_ReadInt("AST","bShowPocket") == TRUE)
	{
		if(HeroPocketIsOn == FALSE)
		{
			ActivateZSSlot(hero,"BIP01 SPINE1");
			Ext_RemoveFromSlot(hero,"BIP01 SPINE1");			
			Ext_PutInSlot(hero,"BIP01 SPINE1",ItSl_HeroPocket);
			Npc_RemoveInvItems(hero,ItSl_HeroPocket,Npc_HasItems(hero,ItSl_HeroPocket));
			HeroPocketIsOn = TRUE;
		};
	}
	else
	{
		if(HeroPocketIsOn == TRUE)
		{
			Ext_RemoveFromSlot(hero,"BIP01 SPINE1");			
			HeroPocketIsOn = FALSE;
		};
	};
	if(Menu_ReadInt("AST","bShowBag") == TRUE)
	{
		if(HeroBagIsOn == FALSE)
		{
			ActivateZSSlot(hero,"BIP01 SPINE2");
			Ext_RemoveFromSlot(hero,"BIP01 SPINE2");			
			Ext_PutInSlot(hero,"BIP01 SPINE2",ItSl_HeroBags);
			Npc_RemoveInvItems(hero,ItSl_HeroBags,Npc_HasItems(hero,ItSl_HeroBags));
			HeroBagIsOn = TRUE;
		};
	}
	else
	{
		if(HeroBagIsOn == TRUE)
		{
			Ext_RemoveFromSlot(hero,"BIP01 SPINE2");			
			HeroBagIsOn = FALSE;
		};
	};	
	if(Npc_IsInFightMode(hero,FMODE_MELEE) && (AIV_GiveShieldRes == FALSE) && (EquipedIndex_1H == TRUE) && ((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE)))
	{		
		Hero_PROT_EDGE = hero.protection[PROT_EDGE];
		Hero_PROT_BLUNT = hero.protection[PROT_BLUNT];
		Hero_PROT_POINT = hero.protection[PROT_POINT];
		Hero_PROT_FIRE = hero.protection[PROT_FIRE];
		Hero_PROT_MAGIC = hero.protection[PROT_MAGIC];
		Hero_PROT_FLY = hero.protection[PROT_FLY];
		BlockChance = FALSE;

		if(AIV_Shield_01 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 20) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 40) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 50) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 20 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 20 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 40 + tmpPointDef;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 50 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 20;
		}
		else if(AIV_Shield_02 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 30) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 50) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 80) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 30 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 30 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 50 + tmpPointDef;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 80 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 30;
		}
		else if(AIV_Shield_03 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 40) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 60) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 120) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 40 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 40 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 60 + tmpPointDef;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 120 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 40;
		}
		else if(AIV_Shield_04 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 50) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 70) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 150) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 50 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 50 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 70 + tmpPointDef;
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 5;
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 5;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 150 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 50;
		}
		else if(AIV_Shield_07 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 70) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 90) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 180) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 70 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 70 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 90 + tmpPointDef;
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 25;
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 25;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 180 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 70;
		}
		else if(AIV_Shield_06 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 80) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 100) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 200) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 80 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 80 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 100 + tmpPointDef;
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 15;
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 15;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 200 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 70;
		}
		else if(AIV_Shield_Caracust == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 50) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 70) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 220) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 50 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 50 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 70 + tmpPointDef;
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 40;
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 40;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 220 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 60;
		}
		else if(AIV_Shield_05 == TRUE)
		{	
			tmpPhisDef = (hero.attribute[ATR_REGENERATEMANA] * 100) / 100;
			tmpPointDef = (hero.attribute[ATR_REGENERATEMANA] * 120) / 100;
			tmpFlyDef = (hero.attribute[ATR_REGENERATEMANA] * 250) / 200;
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 100 + tmpPhisDef;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 100 + tmpPhisDef;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 120 + tmpPointDef;
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 50;
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 50;
			hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + 250 + tmpFlyDef;
			BlockChance = hero.attribute[ATR_REGENERATEMANA] + 90;
		};

		AIV_GiveShieldRes = TRUE;
	};
	if((AIV_GiveShieldRes == TRUE) && ((Npc_IsInFightMode(hero,FMODE_MELEE) == FALSE) || (C_BodyStateContains(hero,BS_UNCONSCIOUS) == TRUE) || (C_BodyStateContains(hero,BS_DEAD) == TRUE))) 
	{		
		hero.protection[PROT_EDGE] = Hero_PROT_EDGE;
		hero.protection[PROT_BLUNT] = Hero_PROT_BLUNT;
		hero.protection[PROT_POINT] = Hero_PROT_POINT;
		hero.protection[PROT_FIRE] = Hero_PROT_FIRE;
		hero.protection[PROT_MAGIC] = Hero_PROT_MAGIC;
		hero.protection[PROT_FLY] = Hero_PROT_FLY;
		tmpPhisDef = FALSE;
		tmpPointDef = FALSE;
		BlockChance = FALSE;
		AIV_GiveShieldRes = FALSE;
	};
	if(SBMODE == TRUE)
	{
		tempMinDam = (Kapitel * 10) - 10;

		if(Kapitel == 1)
		{
			if(NPC_MINIMAL_DAMAGE != 5)
			{
				NPC_MINIMAL_DAMAGE = 5;
			};
		}
		else
		{
			if(NPC_MINIMAL_DAMAGE < tempMinDam)
			{
				NPC_MINIMAL_DAMAGE = tempMinDam;
			};
		};
	}
	else
	{
		if(NPC_MINIMAL_DAMAGE != 5)
		{
			NPC_MINIMAL_DAMAGE = 5;
		};
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (CheckAniFight == TRUE))
	{
		B_CheckFightAni(hero,NPC_TALENT_1H);
		B_CheckFightAni(hero,NPC_TALENT_2H);
		B_CheckFightAni(hero,NPC_TALENT_BOW);
		B_CheckFightAni(hero,NPC_TALENT_CROSSBOW);
		CheckAniFight = FALSE;
	};
	if(DoLearn1H == TRUE)
	{
		B_AddFightSkill_NoAni(hero,NPC_TALENT_1H,1);
		AI_Print(PRINT_Learn1H);
		DoLearn1H = FALSE;
		DoCheckFightSkill1H = TRUE;
	};
	if(DoLearn2H == TRUE)
	{
		B_AddFightSkill_NoAni(hero,NPC_TALENT_2H,1);
		AI_Print(PRINT_Learn2H);
		DoLearn2H = FALSE;
		DoCheckFightSkill2H = TRUE;
	};
	if(DoLearnBow == TRUE)
	{
		B_AddFightSkill_NoAni(hero,NPC_TALENT_BOW,1);
		AI_Print(PRINT_LearnBow);
		DoLearnBow = FALSE;
		DoCheckFightSkillBow = TRUE;
	};
	if(DoLearnCBow == TRUE)
	{
		B_AddFightSkill_NoAni(hero,NPC_TALENT_CROSSBOW,1);
		AI_Print(PRINT_LearnCrossbow);
		DoLearnCBow = FALSE;
		DoCheckFightSkillCBow = TRUE;
	};
	if((DoCheckFightSkill1H == TRUE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_CheckFightAni(hero,NPC_TALENT_1H);
		DoCheckFightSkill1H = FALSE;
	};
	if((DoCheckFightSkill2H == TRUE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_CheckFightAni(hero,NPC_TALENT_2H);
		DoCheckFightSkill2H = FALSE;
	};
	if((DoCheckFightSkillBow == TRUE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_CheckFightAni(hero,NPC_TALENT_BOW);
		DoCheckFightSkillBow = FALSE;
	};
	if((DoCheckFightSkillCBow == TRUE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (C_BodyStateContains(hero,BS_ITEMINTERACT) == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (PlayerSitDust == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		B_CheckFightAni(hero,NPC_TALENT_CROSSBOW);
		DoCheckFightSkillCBow = FALSE;
	};

	CheckGameStatus();

	if((CamModeOn == FALSE) && (C_BodyStateContains(hero,BS_MOD_CONTROLLED) == TRUE))
	{
		Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
	};
	if((CurrentLevel == DRAGONTEMPLE_ZEN) && (UndeadDragonIsDead == TRUE))
	{
		B_ATR_STAMINA = ATR_STAMINA[0];
		B_ATR_STAMINA_MAX = ATR_STAMINA_MAX[0];
		B_ATR_INTELLECT = ATR_INTELLECT;
		B_ATR_INTELLECT_REAL = ATR_INTELLECT_REAL;
		CurInDRT = TRUE;
	};
	if((CurrentLevel == DRAGONISLAND_ZEN) && (CurInDRT == TRUE) && (UndeadDragonIsDead == TRUE))
	{
		ATR_STAMINA[0] = B_ATR_STAMINA;
		ATR_STAMINA_MAX[0] = B_ATR_STAMINA_MAX;
		ATR_INTELLECT = B_ATR_INTELLECT;
		ATR_INTELLECT_REAL = B_ATR_INTELLECT_REAL;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
		Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		CurInDRT = FALSE;
	};
	if((CurrentLevel == LOSTVALLEY_ZEN) && (ReadyForBoss5 == TRUE) && (OpenKeeperDoor == FALSE))
	{
		Wld_SendTrigger("EVT_SOULKEEPER_TRIGGER");
		OpenKeeperDoor = TRUE;
	};
	if((TeleportItuseld == TRUE) && (Hlp_InventoryIsOpen() == FALSE))
	{
		TeleportItuseld = FALSE;

		if(CurrentLevel != ITUSELDTOWER_ZEN)
		{
			if(IlTowerOnce == FALSE)
			{
				IlTowerOnce = TRUE;
				CreateInvItems(hero,ItMi_Darktransfer,1);
				Wld_ChangeLevel("OLDWORLD\ITUSELDTOWER.ZEN","ITUSELDTOWER_START");
			};
		}
		else
		{
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","ITUSELDTOWER_EXIT");
		};
	};
	if(Npc_HasEquippedMeleeWeapon(hero) == TRUE)
	{
		EqWp = Npc_GetEquippedMeleeWeapon(hero);

		if((Itm_OneHanded(EqWp) == TRUE) && (EquipedIndex_1H == FALSE))
		{
			EquipedIndex_1H = TRUE;
			EquipedIndex_2H = FALSE;
		}
		else if((Itm_TwoHanded(EqWp) == TRUE) && (EquipedIndex_2H == FALSE))
		{
			EquipedIndex_2H = TRUE;			
			EquipedIndex_1H = FALSE;
		};
	}
	else
	{
		if(EquipedIndex_1H == TRUE)
		{
			EquipedIndex_1H = FALSE;
		};
		if(EquipedIndex_2H == TRUE)
		{
			EquipedIndex_2H = FALSE;
		};
	};
	if(TorchIsOn == TRUE)
	{
		if(Npc_IsInFightMode(hero,FMODE_FAR) == TRUE)
		{
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
			TorchFarCheck = TRUE;
		}
		else if(Npc_IsInFightMode(hero,FMODE_MAGIC) == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		}
		else if((Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE) && ((EquipedIndex_2H == TRUE) || (AIV_Staff_10 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_01 == TRUE) || (AIV_Speer == TRUE) || (AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE)))
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		}
		else if((Mount_Up == TRUE) || (ShakoIsOn[0] == TRUE) || (HeroTRANS == TRUE) || (LowHealth == TRUE) || (HeroIsDead == TRUE))
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		}
		else if((Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (PLAYER_MOBSI_PRODUCTION != MOBSI_NONE) && (PLAYER_MOBSI_PRODUCTION != MOBSI_TALK))
		{
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		}	
		else if(C_BodyStateContains(hero,BS_SWIM) || C_BodyStateContains(hero,BS_DIVE))
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(hero,"BIP01 L HAND");
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
			TorchIsOn = FALSE;
		};
	};	
	if((TorchFarCheck == TRUE) && (Npc_IsInFightMode(hero,FMODE_FAR) != TRUE))
	{
		Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
		TorchFarCheck = FALSE;
	};
	if((LowHealth == TRUE) && (BowmenCheck == TRUE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		Mdl_RemoveOverlayMds(hero,"humans_BowT2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_BowT1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_CBowT2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_CBowT1.mds");
		BowmenCheck = FALSE;
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_INTELLECT) != ATR_INTELLECT)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	};
};

func void EveryDayEconomicStuff()
{
	var int DT_TOTAL_DAILY_ORECOME;
	var int DT_TOTAL_DAILY_FOODLOSS;
	var int DT_TOTAL_DAILY_FOODGATHER;
	var int DT_TOTAL_DAILY_PAYMENTS;
	var int DT_TOTAL_DAILY_IRONCOME;
	var int DayNow;
	var int DailyFoodLoss;

	DayNow = Wld_GetDay();
	DailyFoodLoss = Hlp_Random(10);
	DT_TOTAL_DAILY_IRONCOME = FALSE;
	DT_TOTAL_DAILY_ORECOME = FALSE;
	DT_TOTAL_DAILY_FOODLOSS = FALSE;
	DT_TOTAL_DAILY_FOODGATHER = FALSE;
	DT_TOTAL_DAILY_PAYMENTS = FALSE;

	if(DT_FOODSTOCKACTIVE == TRUE)
	{
		if(EVERYDAYDTFOOD < DayNow)
		{
			if((VALERANRECRUITEDDT == TRUE) && (ValeranIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += VALERANFOODCONS;
			};
			if((EROLRECRUITEDDT == TRUE) && (ErolIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += EROLFOODCONS;
			};
			if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardOneIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GUARD1FOODCONS;
			};
			if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardTwoIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GUARD2FOODCONS;
			};
			if((niclasrecruiteddt == TRUE) && (NiclasIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += NICLASFOODCONS;
				DT_TOTAL_DAILY_FOODGATHER += NICLASHUNTFOOD;
			};
			if((talbinrecruiteddt == TRUE) && (TalbinNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += TALBINFOODCONS;
				DT_TOTAL_DAILY_FOODGATHER += TALBINHUNTFOOD;
			};
			if((farimrecruiteddt == TRUE) && (FarimIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += FARIMFOODCONS;
				DT_TOTAL_DAILY_FOODGATHER += FARIMSUPPLIESFOOD;
			};
			if((huntygrimesrecruiteddt == TRUE) && (HuntyNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += HUNTYFOODCONS;
			};
			if((huntygrimesrecruiteddt == TRUE) && (GrimesNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GRIMESFOODCONS;
			};
			if((viperrecruiteddt == TRUE) && (ViperIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += VIPERFOODCONS;
			};
			if((eddarecruiteddt == TRUE) && (EddaIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += EDDAFOODCONS;
			};
			if((wolfrecruiteddt == TRUE) && (WolfMIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += WOLFFOODCONS;
			};
			if((wolfrecruiteddt == TRUE) && (GuardThreeIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GUARD3FOODCONS;
			};
			if((wolfrecruiteddt == TRUE) && (GuardFourIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GUARD4FOODCONS;
			};
			if((CARLRECRUITEDDT == TRUE) && (CarlIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += CARLFOODCONS;
			};
			if((SagittaRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += SAGITTAFOODCONS;
			};
			if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += SNIPESFOODCONS;
			};
			if((AlrikRECRUITEDDT == TRUE) && (AlrikIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += ALRIKFOODCONS;
			};
			if((GAYVERNRECRUITEDDT == TRUE) && (GayvernIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += GAYVERNFOODCONS;
			};
			if((BILGOTRECRUITEDDT == TRUE) && (BilgotNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_FOODLOSS += BILGOTFOODCONS;
				DT_TOTAL_DAILY_FOODGATHER += BILGOTHUNTFOOD;
			};
			if((DT_TOTAL_DAILY_FOODGATHER > 0) && (CanHireCook == FALSE))
			{
				CanHireCook = TRUE;
			};

			DT_FOODSTOCK = DT_FOODSTOCK - DT_TOTAL_DAILY_FOODLOSS + DT_TOTAL_DAILY_FOODGATHER;

			if(EDDARECRUITEDDT == FALSE)
			{
				if(DT_FOODSTOCK > 130)
				{
					DT_FOODSTOCK -= DailyFoodLoss;
				};
			}
			else
			{
				if(EddaIsDead == TRUE)
				{
					if(DT_FOODSTOCK > 130)
					{
						DT_FOODSTOCK -= DailyFoodLoss;
					};
				};

			};
			if(DT_FOODSTOCK <= 0)
			{
				AI_Print("Tvůj tábor nemá dost jídla!");
				DTFOODCRISIS = TRUE;
				DT_FOODSTOCK = FALSE;
				DTFOODDEBT = DT_TOTAL_DAILY_FOODLOSS * 7;
			};

			EVERYDAYDTFOOD = Wld_GetDay();
		};
	};
	if(DT_OREGATHER_START == TRUE)
	{
		if(EVERYDAYDTORE < DayNow)
		{
			DT_TOTAL_DAILY_ORECOME = FALSE;
			DELTA_VIPER = Hlp_Random(75);
			DELTA_GRIMES = Hlp_Random(125);

			if((ViperIsDead == FALSE) && (VIPERRECRUITEDDT == TRUE))
			{
				DT_TOTAL_DAILY_ORECOME = DT_TOTAL_DAILY_ORECOME + 75 + DELTA_VIPER;
			};
			if(HUNTYGRIMESRECRUITEDDT == TRUE)
			{
				if(GrimesNWIsDead == FALSE)
				{
					DT_TOTAL_DAILY_ORECOME = DT_TOTAL_DAILY_ORECOME + 125 + DELTA_GRIMES;
				};
			};
			if((DT_TOTAL_DAILY_ORECOME > 0) && (CanHireSmith == FALSE))
			{
				CanHireSmith = TRUE;
			};

			DT_BUDGET_ORE = DT_BUDGET_ORE + DT_TOTAL_DAILY_ORECOME;

			if((SendHagenOre == TRUE) && (DT_BUDGET_ORE >= 100))
			{
				DT_BUDGET_ORE = DT_BUDGET_ORE - 100;
				DT_BUDGET = DT_BUDGET + HagenOreBuy;
			};
			if((CanSellOre == TRUE) && (DoSellOre == TRUE) && (DT_BUDGET_ORE >= 25))
			{
				DT_SMITH_INC_ORE = (DT_BUDGET_ORE / 25) * 40; 
				DT_BUDGET = DT_BUDGET + DT_SMITH_INC_ORE; 
				DT_BUDGET_ORE = 0;
			}
			else
			{
				DT_SMITH_INC_ORE = FALSE;
			};

			EVERYDAYDTORE = Wld_GetDay();
		};
	};
	if(DT_IRONGATHER_START == TRUE)
	{
		if(EVERYDAYDTIRON < DayNow)
		{
			DT_TOTAL_DAILY_IRONCOME = FALSE;
			DELTA_HUNTY = Hlp_Random(75);
			DELTA_SNIPES = Hlp_Random(100);

			if(HUNTYGRIMESRECRUITEDDT == TRUE)
			{
				if(HuntyNWIsDead == FALSE) 
				{
					DT_TOTAL_DAILY_IRONCOME = DT_TOTAL_DAILY_IRONCOME + 75 + DELTA_HUNTY;
				};
			};
			if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
			{
				DT_TOTAL_DAILY_IRONCOME = DT_TOTAL_DAILY_IRONCOME + 100 + DELTA_SNIPES;
			};

			if((DT_TOTAL_DAILY_IRONCOME > 0) && (CanHireSmith == FALSE))
			{
				CanHireSmith = TRUE;
			};

			DT_BUDGET_IRON = DT_BUDGET_IRON + DT_TOTAL_DAILY_IRONCOME;

			if((CanSellOre == TRUE) && (DoSellOre == TRUE) && (DT_BUDGET_IRON >= 25))
			{
				DT_SMITH_INC_IRON = (DT_BUDGET_IRON / 25) * 10; 
				DT_BUDGET = DT_BUDGET + DT_SMITH_INC_IRON; 
				DT_BUDGET_IRON = 0;
			}
			else
			{
				DT_SMITH_INC_IRON = FALSE;
			};

			EVERYDAYDTIRON = Wld_GetDay();
		};
	};
	if(DT_BUDGETACTIVE == TRUE)
	{
		if(EVERYDAYDTMONEY < DayNow)
		{
			if((VALERANRECRUITEDDT == TRUE) && (ValeranIsDead == FALSE))
			{
				if(VALERANBONUS == TRUE)
				{
					DT_TOTAL_DAILY_PAYMENTS += VALERANWAGECH;
				}
				else
				{
					DT_TOTAL_DAILY_PAYMENTS += VALERANWAGE;
				};
			};
			if((EROLRECRUITEDDT == TRUE) && (ErolIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += EROLWAGE;
			};
			if((niclasrecruiteddt == TRUE) && (NiclasIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += NICLASWAGE;
			};
			if((farimrecruiteddt == TRUE) && (FarimIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += FARIMWAGE;
			};
			if((huntygrimesrecruiteddt == TRUE) && (HuntyNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += HUNTYWAGE;
			};
			if((huntygrimesrecruiteddt == TRUE) && (GrimesNWIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += GRIMESWAGE;
			};
			if((CARLRECRUITEDDT == TRUE) && (CarlIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += CARLWAGE;
			};
			if((SagittaRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += SAGITTAWAGE;
			};
			if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += SNIPESWAGE;
			};
			if((AlrikRECRUITEDDT == TRUE) && (AlrikIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += ALRIKWAGE;
			};
			if((GAYVERNRECRUITEDDT == TRUE) && (GayvernIsDead == FALSE))
			{
				DT_TOTAL_DAILY_PAYMENTS += GAYVERNWAGE;
			};

			DT_BUDGET = DT_BUDGET - DT_TOTAL_DAILY_PAYMENTS - DT_TOTAL_DAILY_PAYMENTS_ONAR;

			if(DT_BUDGET <= 0)
			{
				AI_Print("Tvůj tábor nemá dost zlata!");
				DTMONEYCRISIS = TRUE;
			};
			if(DTFOODDEBT > 0)
			{
				DT_BUDGET = DT_BUDGET - DTFOODDEBT;
			};

			EVERYDAYDTMONEY = Wld_GetDay();
		};
	};
};

func void B_NoticeBoard()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"Z_TORCH_01") <= 2000)
		{
			AI_NoticePrint(500,7000,"Opuštěný maják");
		};
		if(Npc_GetDistToWP(hero,"CITY1") <= 2000)
		{
			AI_NoticePrint(500,7000,"Jižní brána města Khorinis");
		};
		if(Npc_GetDistToWP(hero,"CITY2") <= 2000)
		{
			AI_NoticePrint(500,7000,"Východní brána města Khorinis");
		};
		if(Npc_GetDistToWP(hero,"HAFEN") <= 4200)
		{
			AI_NoticePrint(500,7000,"Přístav");
		};
		if(Npc_GetDistToWP(hero,"NW_CITY_UPTOWN_PATH_03") <= 1000)
		{
			AI_NoticePrint(500,7000,"Horní čtvrt");
		};
		if(Npc_GetDistToWP(hero,"SAVE_SPOT_MIL") <= 1000)
		{
			AI_NoticePrint(500,7000,"Kasárna domobrany");
		};
		if(Npc_GetDistToWP(hero,"NW_PSICAMP_PARVEZ") <= 1000)
		{
			AI_NoticePrint(500,7000,"Tržiště");
		};
		if(Npc_GetDistToWP(hero,"NW_CITY_MAINSTREET_07") <= 1000)
		{
			AI_NoticePrint(500,7000,"Ulice mistrů");
		};
		if(Npc_GetDistToWP(hero,"NW_BIGFARM_PATH_03") <= 7000)
		{
			AI_NoticePrint(500,7000,"Onarova farma");
		};
		if(Npc_GetDistToWP(hero,"KLOSTER") <= 5000)
		{
			AI_NoticePrint(500,7000,"Klášter mágů Ohně");
		};
		if(Npc_GetDistToWP(hero,"NW_TROLLAREA_RUINS_35") <= 2500)
		{
			AI_NoticePrint(500,7000,"Prastaré zříceniny");
		};
		if(Npc_GetDistToWP(hero,"XARDAS") <= 1000)
		{
			AI_NoticePrint(500,7000,"Xardasova věž");
		};
		if(Npc_GetDistToWP(hero,"FARM3") <= 1500)
		{
			AI_NoticePrint(500,7000,"Bengarova farma");
		};
		if(Npc_GetDistToWP(hero,"FARM4") <= 2000)
		{
			AI_NoticePrint(500,7000,"Sekobova farma");
		};
		if(Npc_GetDistToWP(hero,"FARM1") <= 1500)
		{
			AI_NoticePrint(500,7000,"Lobartova farma");
		};
		if(Npc_GetDistToWP(hero,"FARM2") <= 1500)
		{
			AI_NoticePrint(500,7000,"Akilova farma");
		};
		if((Npc_GetDistToWP(hero,"NW_CASTLEMINE_PATH_02") <= 2000) || (Npc_GetDistToWP(hero,"NW_CASTLEMINE_TOWER_06") <= 1500))
		{
			AI_NoticePrint(500,7000,"Věž Atros");
		};
		if(Npc_GetDistToWP(hero,"NW_TAVERNE_IN_RANGERMEETING") <= 2000)
		{
			AI_NoticePrint(500,7000,"Hostinec 'U Mrtvé harpyje'");
		};
		if(Npc_GetDistToWP(hero,"SAVE_SPOT_PSI") <= 3000)
		{
			AI_NoticePrint(500,7000,"Tábor Bratrstva");
		};
		if(Npc_GetDistToWP(hero,"SAVE_SPOT_HUN") <= 1500)
		{
			AI_NoticePrint(500,7000,"Tábor lovců");
		};
		if(Npc_GetDistToWP(hero,"NW_TROLLAREA_RITUALPATH_01") <= 3000)
		{
			AI_NoticePrint(500,7000,"Kruh Slunce");
		};
		if(Npc_GetDistToWP(hero,"TROLL") <= 1000)
		{
			AI_NoticePrint(500,7000,"Doupě černého trola");
		};
		if(Npc_GetDistToWP(hero,"NW_LIGHTHOUSE_OUT_01") <= 1000)
		{
			AI_NoticePrint(500,7000,"Khoriniský maják");
		};
		if(Npc_GetDistToWP(hero,"X_SOUTHBEACH_HANTEDTOWER_06") <= 1500)
		{
			AI_NoticePrint(500,7000,"Ahironova věž");
		};
	};
	if(CurrentLevel == OldWorld_Zen)
	{
		if(Npc_GetDistToWP(hero,"OC_GATE_GUARD_01") <= 4000)
		{
			AI_NoticePrint(500,7000,"Hrad rudobaronů");
		}
		else if(Npc_GetDistToWP(hero,"WP_COAST_FOREST_58") <= 1000)
		{
			AI_NoticePrint(500,7000,"Lesní tábor");
		}
		else if(Npc_GetDistToWP(hero,"DRAKAR_SHIP") <= 1000)
		{
			AI_NoticePrint(500,7000,"Skřetí drakar");
		}
		else if(Npc_GetDistToWP(hero,"WP_COAST_FOREST_121") <= 500)
		{
			AI_NoticePrint(500,7000,"Darrionova kovárna");
		}
		else if((Npc_GetDistToWP(hero,"OW_ORC_ALTAR_01") <= 500) || (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_02") <= 500) || (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_04") <= 500))
		{
			AI_NoticePrint(500,7000,"Skřetí svatyně");
		}
		else if(Npc_GetDistToWP(hero,"OW_LAGERCLAN") <= 1000)
		{
			AI_NoticePrint(500,7000,"Skřetí klan Vysoké skály");
		}
		else if(Npc_GetDistToWP(hero,"OW_ICEDRAGON_24") <= 2000)
		{
			AI_NoticePrint(500,7000,"Doupě ledového draka");
		}
		else if(Npc_GetDistToWP(hero,"OW_SAWHUT_MEATBUG_SPAWN") <= 1000)
		{
			AI_NoticePrint(500,7000,"Cavalornova chatrč");
		}
		else if(Npc_GetDistToWP(hero,"OW_DRAGONSWAMP_007") <= 2000)
		{
			AI_NoticePrint(500,7000,"Doupě bažinného draka");
		}
		else if(Npc_GetDistToWP(hero,"WP_ORCTEMPLE_04") <= 2000)
		{
			AI_NoticePrint(500,7000,"Starý skřetí tábor");
		}
		else if(Npc_GetDistToWP(hero,"LOCATION_03_OUT") <= 1000)
		{
			AI_NoticePrint(500,7000,"Stará Xardasova věž");
		}
		else if(Npc_GetDistToWP(hero,"DM_RITUAL_08") <= 2000)
		{
			AI_NoticePrint(500,7000,"Doupě ohnivého draka");
		}
		else if(Npc_GetDistToWP(hero,"LOCATION_19_03_PATH_RUIN9") <= 2000)
		{
			AI_NoticePrint(500,7000,"Stará pevnost");
		}
		else if(Npc_GetDistToWP(hero,"OW_ROCKDRAGON_06") <= 2000)
		{
			AI_NoticePrint(500,7000,"Doupě kamenného draka");
		};
	};
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"ADW_VALLEY_BIGCAVE_07") <= 2000)
		{
			AI_NoticePrint(500,7000,"Quarhodronova hrobka");
		}
		else if(Npc_GetDistToWP(hero,"ADW_VALLEY_PATH_132") <= 1000)
		{
			AI_NoticePrint(500,7000,"Dům kněží");
		}
		else if(Npc_GetDistToWP(hero,"ADW_VALLEY_PATH_067") <= 1000)
		{
			AI_NoticePrint(500,7000,"Dům strážců smrti");
		}
		else if(Npc_GetDistToWP(hero,"ADW_SENAT_ENTRANCE_02") <= 1000)
		{
			AI_NoticePrint(500,7000,"Dům léčitelů");
		}
		else if(Npc_GetDistToWP(hero,"ADW_ADANOSTEMPEL_ENTRANCE_03") <= 1000)
		{
			AI_NoticePrint(500,7000,"Dům válečníků");
		}
		else if(Npc_GetDistToWP(hero,"BL_DOWN_CENTER_06") <= 5000)
		{
			AI_NoticePrint(500,7000,"Tábor banditů");
		}
		else if(Npc_GetDistToWP(hero,"BL_MINELAGER_03") <= 1000)
		{
			AI_NoticePrint(500,7000,"Ravenův zlatý důl");
		}
		else if(Npc_GetDistToWP(hero,"ADW_MINE_TO_GRUFT_06") <= 1000)
		{
			AI_NoticePrint(500,7000,"Khardimonova hrobka");
		}
		else if(Npc_GetDistToWP(hero,"ADW_ADANOSTEMPEL_RAVEN_01") <= 2000)
		{
			AI_NoticePrint(500,7000,"Adanův chrám");
		}
		else if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_SCAVENGER") <= 5000)
		{
			AI_NoticePrint(500,7000,"Pirátský tábor");
		}
		else if(Npc_GetDistToWP(hero,"ADW_CANYON_LIBRARY_01") <= 1000)
		{
			AI_NoticePrint(500,7000,"Dům učenců");
		};
	};
	if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
		if(Npc_GetDistToWP(hero,"OZ_MAN_07") <= 1000)
		{
			AI_NoticePrint(500,7000,"Zničená pevnost");
		}
		else if(Npc_GetDistToWP(hero,"OZ_UNIQTROLL") <= 1000)
		{
			AI_NoticePrint(500,7000,"Doupě bílého trola");
		}
		else if(Npc_GetDistToWP(hero,"LOA_WUESTE_OFFROAD_110") <= 2000)
		{
			AI_NoticePrint(500,7000,"Skřetí svatyně");
		}
		else if(Npc_GetDistToWP(hero,"WP_ORCCAMP_3") <= 3000)
		{
			AI_NoticePrint(500,7000,"Tábor skřetů 'Ledového větru'");
		}
		else if(Npc_GetDistToWP(hero,"ORM_AVABUL_01") <= 1000)
		{
			AI_NoticePrint(500,7000,"Brány");
		}
		else if(Npc_GetDistToWP(hero,"ORM_CAMPLAGER") <= 1000)
		{
			AI_NoticePrint(500,7000,"Tábor skřetů 'Ohnivého kamene'");
		};
	};
	if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
		if(Npc_GetDistToWP(hero,"HRAMWIND") <= 1000)
		{
			AI_NoticePrint(500,7000,"Svatyně Irkh'Shas");
		}
		else if(Npc_GetDistToWP(hero,"AV_DRAGONEGG") <= 500)
		{
			AI_NoticePrint(500,7000,"GETTING TIME2");
		}
		else if(Npc_GetDistToWP(hero,"AV_OAZIS_01") <= 2000)
		{
			AI_NoticePrint(500,7000,"Svatyně Sak'Shar");
		}
		else if(Npc_GetDistToWP(hero,"AV_OAZIS_02") <= 2000)
		{
			AI_NoticePrint(500,7000,"Svatyně Al'Sar");
		}
		else if(Npc_GetDistToWP(hero,"AV_OAZIS_03") <= 2000)
		{
			AI_NoticePrint(500,7000,"Svatyně Ben'Shas");
		}
		else if(Npc_GetDistToWP(hero,"AV_OAZIS_04") <= 2000)
		{
			AI_NoticePrint(500,7000,"Svatyně Ishar'Arkh");
		}
		else if((Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_01") <= 1000) || (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_02") <= 1000) || (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_03") <= 1000) || (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_04") <= 1000))
		{
			AI_NoticePrint(500,7000,"Posvátná nádoba Prastarých");
		}
		else if((Npc_GetDistToWP(hero,"AV_ANCIENTALTAR_01") <= 1500) || (Npc_GetDistToWP(hero,"AV_ANCIENTALTAR_02") <= 1500) || (Npc_GetDistToWP(hero,"AV_ANCIENTALTAR_03") <= 1500) || (Npc_GetDistToWP(hero,"AV_ANCIENTALTAR_04") <= 1500) || (Npc_GetDistToWP(hero,"AV_ANCIENTALTAR_05") <= 1500))
		{
			AI_NoticePrint(500,7000,"Obětní oltář Prastarých");
		}
		else if(Npc_GetDistToWP(hero,"PYRAMIDE3") <= 7500)
		{
			AI_NoticePrint(500,7000,"Veliký chrám Amu'Anos");
		}
		else if(Npc_GetDistToWP(hero,"OASE_022") <= 7500)
		{
			AI_NoticePrint(500,7000,"Er'Khazirova hrobka");
		}
		else if(Npc_GetDistToWP(hero,"AV_ADANOSTREE") <= 2000)
		{
			AI_NoticePrint(500,7000,"Strom života");
		}
		else if(Npc_GetDistToWP(hero,"ZV_MAGETOWER_01") <= 2000)
		{
			AI_NoticePrint(500,7000,"Im'Arahova věž");
		}
		else if(Npc_GetDistToWP(hero,"AV_UNDEADTHRONE") <= 3000)
		{
			AI_NoticePrint(500,7000,"Svatyně Khar'Aram");
		};
	};
	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		if(PlayerChooseSpy_PW == TRUE)
		{
			if(Npc_GetDistToWP(hero,"PW_HANIAR") <= 2500)
			{
				AI_NoticePrint(500,7000,"Masyafský chrám");
			}
			else if(Npc_GetDistToWP(hero,"PW_GROT_PRISION_CAVE_01") <= 500)
			{
				AI_NoticePrint(500,7000,"Osairova jeskyně");
			}
			else if(Npc_GetDistToWP(hero,"PW_OUT_TO_IN_CHAMBERS") <= 1000)
			{
				AI_NoticePrint(500,7000,"Vnitřní svatyně Masyafu");
			};
		};
	};
	if(CurrentLevel == ORCCITY_ZEN)
	{
		if(Npc_GetDistToWP(hero,"ORC_CITY_45") <= 500)
		{
			AI_NoticePrint(500,7000,"Ur-Thrallovy síně");
		}
		else if(Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") <= 2000)
		{
			AI_NoticePrint(500,7000,"Skřetí aréna");
		}
		else if(Npc_GetDistToWP(hero,"ORC_CITY_27") <= 1000)
		{
			AI_NoticePrint(500,7000,"Chrámové náměstí");
		}
		else if(Npc_GetDistToWP(hero,"ORC_CITY_HASHTOR") <= 500)
		{
			AI_NoticePrint(500,7000,"Skřetí kovárna");
		}
		else
		{
			AI_NoticePrint(500,7000,"Skřetí město");
		};
	};
	if(CurrentLevel == SHVALLEY_ZEN)
	{
		if(Npc_GetDistToWP(hero,"WP_CAMP_09") <= 500)
		{
			AI_NoticePrint(500,7000,"Tábor lidí");
		}
		else if(Npc_GetDistToWP(hero,"WP_URGROM_PLACE") <= 3000)
		{
			AI_NoticePrint(500,7000,"Tábor skřetů");
		}
		else if(Npc_GetDistToWP(hero,"SV_KINGOFDEAD") <= 2000)
		{
			AI_NoticePrint(500,7000,"Krypta prokletých");
		}
		else if(Npc_GetDistToWP(hero,"WP_URGROM_ALIVE") <= 1000)
		{
			AI_NoticePrint(500,7000,"Svatyně Velikého Stínu");
		}
		else
		{
			AI_NoticePrint(500,7000,"Údolí stínů");
		};
	};
	if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(Npc_GetDistToWP(hero,"DI_DRACONIANAREA_54") <= 2000)
		{
			AI_NoticePrint(500,7000,"Beliarův chrám");
		}
		else
		{
			AI_NoticePrint(500,7000,"Ostrov Irdorath");
		};
	};
	if(CurrentLevel == PSICAMP_ZEN)
	{
		if(Npc_GetDistToWP(hero,"PSI_TEMPLE_IN_1") <= 1000)
		{
			AI_NoticePrint(500,7000,"Chrám Bratrstva Spáče");
		}
		else
		{
			AI_NoticePrint(500,7000,"Tábor Bratrstva Spáče");
		};
	};
	if(CurrentLevel == PALADINFORT_ZEN)
	{
		if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 3000)
		{
			AI_NoticePrint(500,7000,"Pevnost Azgan");
		};
	};
	if(CurrentLevel == TEARSTEMPLE_ZEN)
	{
		if(Npc_GetDistToWP(hero,"TEARSNOTICE") <= 2000)
		{
			AI_NoticePrint(500,7000,"Chrám slz");
		};
	};
	if(CurrentLevel == ORCOREMINE_ZEN)
	{
		AI_NoticePrint(500,7000,"Skřetí důl");
	};
	if(CurrentLevel == ORCTEMPEL_ZEN)
	{
		AI_NoticePrint(500,7000,"Spáčův chrám");
	};
	if(CurrentLevel == ABANDONEDMINE_ZEN)
	{
		AI_NoticePrint(500,7000,"Opuštěný důl");
	};
	if(CurrentLevel == GOLDMINE_ZEN)
	{
		AI_NoticePrint(500,7000,"Horský průchod");
	};
	if(CurrentLevel == OLDMINE_ZEN)
	{
		AI_NoticePrint(500,7000,"Starý důl");
	};
	if(CurrentLevel == FREEMINE_ZEN)
	{
		AI_NoticePrint(500,7000,"Nový důl");
	};
	if(CurrentLevel == GUARDIANCHAMBERS_ZEN)
	{
		AI_NoticePrint(500,7000,"Příbytek Strážců");
	};
	if(CurrentLevel == FREEMINELAGER_ZEN)
	{
		AI_NoticePrint(500,7000,"Horský průchod");
	};
	if(CurrentLevel == DEMONSTOWER_ZEN)
	{
		AI_NoticePrint(500,7000,"Zatopená věž");
	};
	if(CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		AI_NoticePrint(500,7000,"Skřetí hřbitov");
	};
	if(CurrentLevel == DEADGROT_ZEN)
	{
		AI_NoticePrint(500,7000,"Zamlžená věž");
	};
	if(CurrentLevel == SECRETISLAND_ZEN)
	{
		AI_NoticePrint(500,7000,"Ostrov Etlu");
	};
	if(CurrentLevel == UNDEADZONE_ZEN)
	{
		AI_NoticePrint(500,7000,"Město mrtvých");
	};
	if(CurrentLevel == DEMONCAVE_ZEN)
	{
		AI_NoticePrint(500,7000,"Jeskyně bolesti");
	};
	if(CurrentLevel == FIRECAVE_ZEN)
	{
		AI_NoticePrint(500,7000,"Jeskyně Ohně");
	};
	if(CurrentLevel == HARADRIMARENA_ZEN)
	{
		AI_NoticePrint(500,7000,"Aréna Asgardů");
	};
	if(CurrentLevel == GINNOKWORLD_ZEN)
	{
		AI_NoticePrint(500,7000,"Ginnokova hrobka");
	};
	if(CurrentLevel == HAOSWORLD_ZEN)
	{
		AI_NoticePrint(500,7000,"Vakhanské síně");
	};
	if(CurrentLevel == DRAGONTEMPLE_ZEN)
	{
		AI_NoticePrint(500,7000,"Svatyně Bestie");
	};
	if(CurrentLevel == ASHTARTEMPLE_ZEN)
	{
		if(DRAGONGOLDMEET == TRUE)
		{
			AI_NoticePrint(500,7000,"Svatyně Ashtara");
		};
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		if((EpicJorneyStart == TRUE) && (LVTextOnce == FALSE))
		{
			AI_NoticePrint(500,7000,"Příbytek ztracených duší");
			LVTextOnce = TRUE;
		};
	};
	if((RealMode[2] == TRUE) && (CheckRealMode[1] == TRUE) && (_bCanSave == TRUE) && (FlagSaveOn == TRUE))
	{
		AI_NoticePrint(3000,4098,"Tady možno ukládat hru...");
	};
	if((CurrentLevel == LOSTVALLEY_ZEN) && (CheckRealMode[1] == TRUE) && (SBMode == TRUE) && (_bCanSave == TRUE))
	{
		AI_NoticePrint(3000,4098,"Tady možno ukládat hru...");
	};
};

func void B_CheckAutoDismount()
{
	if((CurrentLevel == NEWWORLD_ZEN) && ((MeetOnarFarmFirst == FALSE) || (MeetMonasteryFirst == FALSE) || (MeetTownFirst == FALSE) || (MeetAncientFirst == FALSE)))
	{
		if((Npc_GetDistToWP(hero,"NW_BIGFARM_PATH_03") <= 10000) && (MeetOnarFarmFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_ONARFARM");
			MeetOnarFarmFirst = TRUE;
		};
		if((Npc_GetDistToWP(hero,"KLOSTER") <= 5000) && (MeetMonasteryFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_MONASTERY");
			MeetMonasteryFirst = TRUE;
		};
		if((MeetTownFirst == FALSE) && ((Npc_GetDistToWP(hero,"CITY1") <= 2000) || (Npc_GetDistToWP(hero,"CITY2") <= 2000)))
		{
			B_Say(hero,hero,"$MEET_TOWN");
			MeetTownFirst = TRUE;
		};
		if((Npc_GetDistToWP(hero,"NW_TROLLAREA_RUINS_35") <= 2500) && (MeetAncientFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_ANCIENT");
			MeetAncientFirst = TRUE;
		};
	};
	if((CurrentLevel == ADANOSVALLEY_ZEN) && (MeetAdanosValleyFirst == FALSE))
	{
		if((Npc_GetDistToWP(hero,"AV_CAVE_START") <= 1500) && (MeetAdanosValleyFirst == FALSE))
		{
			B_Say(hero,hero,"$ADANOSPLATO");
			MeetAdanosValleyFirst = TRUE;
		};
	};
	if((CurrentLevel == GUARDIANCHAMBERS_ZEN) && (MeetGuardiansFirst == FALSE))
	{
		if((Npc_GetDistToWP(hero,"WP_GUARDIANS_13") <= 2000) && (MeetGuardiansFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_GUARDIANS");
			MeetGuardiansFirst = TRUE;
		};
	};
	if((CurrentLevel == ORCTEMPEL_ZEN) && (MeetOrcTempleFirst == FALSE))
	{
		if((Npc_GetDistToWP(hero,"TPL_006") <= 500) && (MeetOrcTempleFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_ORCTEMPLE");
			MeetOrcTempleFirst = TRUE;
		};
	};
	if((CurrentLevel == OldWorld_Zen) && (MeetCastleFirst == FALSE))
	{
		if((Npc_GetDistToWP(hero,"OC_GATE_GUARD_01") <= 10000) && (MeetCastleFirst == FALSE))
		{
			B_Say(hero,hero,"$MEET_OWCASTLE");
			MeetCastleFirst = TRUE;
		};
	};
};

func void View_Current_Hour()
{
	//-----------Obshchaya informatsiya---------------

	if(Menu_ReadInt("AST","bShowKarma") == 1)
	{
		print_karma_innos(90,1);
		print_karma_beliar(95,1);
	};
	if((Menu_ReadInt("AST","bHFTStatus") == 1) && (SBMODE == TRUE))
	{
		print_real_status_hunger(15,1);
		print_real_status_thirs(18,1);
		print_real_status_fatigue(21,1);
	};

	print_arrow_count(1,7);

	//-----------Status-bary---------------

	print_threat_status(0,93);
	print_canint_status(0,93);
	print_acrobat_status(0,93);
	print_sprint_status(0,93);
	print_iceshield_status(0,93);
	print_fireshield_status(0,93);
	print_health_res(0,93);
	print_mana_res(0,93);
	print_regenmobs_status(0,93);
	print_ogonek_status(0,93);

	print_poison_status(45,93);
	print_sick_status(47,93);
	print_bleeding_status(49,93);
	print_curse_status(51,93);
	print_weakness_status(53,93);
	print_ignition_status(55,93);
	StatusOnline = TRUE;
};

func void View_Current_Hour_None()
{
	if(StatusOnline == TRUE)
	{
		AI_PrintClrScreen();
		StatusOnline = FALSE;
	};

	threatPosX = FALSE;
	canintPosX = FALSE;
	acrobatPosX = FALSE;
	sprintPosX = FALSE;
	iceshieldPosX = FALSE;
	fireshieldPosX = FALSE;
	healthPosX = FALSE;
	manaPosX = FALSE;
	regenmobsPosX = FALSE;
	ogonekPosX = FALSE;
	threatST = FALSE;
	canintST = FALSE;
	acrobatST = FALSE;
	sprintST = FALSE;
	iceshieldST = FALSE;
	fireshieldST = FALSE;
	healthST = FALSE;
	manaST = FALSE;
	regenmobsST = FALSE;
	ogonekST = FALSE;
};

func void b_gettime()
{
	var int randomchance;
	var string concatText;
	var int t;
	var int m;
	var int s;
	var int danceStyle;
	var int DayNow;
	var int tempPressed;
	var int DeathCount;
	var C_Npc Mage_Xar;
	var C_Npc Mage_Pyr;
	var C_Npc Mage_Vat;

	DayNow = Wld_GetDay();

	if((Open_ITKE_PORTALTEMPELWALKTHROUGH_ADDON == TRUE) && (Open_ITKE_PORTALTEMPELWALKTHROUGH_ADDON_DONE == FALSE))
	{
		if(Npc_HasItems(hero,ITKE_PORTALTEMPELWALKTHROUGH_ADDON) >= 1)
		{
			Npc_RemoveInvItems(hero,ITKE_PORTALTEMPELWALKTHROUGH_ADDON,1);
		};

		Open_ITKE_PORTALTEMPELWALKTHROUGH_ADDON_DONE = TRUE;
	};
	if((ThiefTreasureRem == TRUE) && (Open_ThiefTreasureRem == FALSE))
	{
		if(Npc_HasItems(hero,ItKe_ThiefTreasure) >= 1)
		{
			Npc_RemoveInvItems(hero,ItKe_ThiefTreasure,1);
		};

		Open_ThiefTreasureRem = TRUE;
	};
	if((HagenKeyRem == TRUE) && (Open_HagenKeyRem == FALSE))
	{
		if(Npc_HasItems(hero,ITKE_HAGEN_SECRETKEY) >= 1)
		{
			Npc_RemoveInvItems(hero,ITKE_HAGEN_SECRETKEY,1);
		};

		Open_HagenKeyRem = TRUE;
	};
	if((PassOwKey == TRUE) && (Open_PassOwKey == FALSE))
	{
		if(Npc_HasItems(hero,ItKe_Pass_MIS) >= 1)
		{
			Npc_RemoveInvItems(hero,ItKe_Pass_MIS,1);
		};

		Open_PassOwKey = TRUE;
	};
	if(RemoveStoneGader == TRUE)		
	{
		if(Npc_HasItems(hero,itmi_gaderstone) >= 1)
		{
			Npc_RemoveInvItems(hero,itmi_gaderstone,1);
		};

		RemoveStoneGader = FALSE;
	};
	if(RemoveOrcBlackCrystals == TRUE)		
	{
		if(Npc_HasItems(hero,ITMI_CRYSTALBLACK) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMI_CRYSTALBLACK,1);
		};

		RemoveOrcBlackCrystals = FALSE;
	};
	if((ORCAMULETWATERSOUL == TRUE) && (Npc_HasItems(hero,ITMI_CRYSTALBLACK) >= 1))
	{
		Npc_RemoveInvItems(hero,ITMI_CRYSTALBLACK,1);
	};
	if((hero.attribute[ATR_HITPOINTS] < 1) && (FlyCarpetIsOn == TRUE))
	{
		Ext_RemoveFromSlot(hero,"BIP01");	
		Npc_RemoveInvItems(hero,ItSe_FlyCarpet,Npc_HasItems(hero,ItSe_FlyCarpet));
		Mdl_RemoveOverlayMds(hero,"fliegender_drache.mds");
		FlyCarpetIsOn = FALSE;
	};
	if((hero.attribute[ATR_HITPOINTS] < 1) && (HeroIsDead == FALSE))
	{
		HeroIsDead = TRUE;
		bManaBar = 0;
		bFocusBar = 0;
		bHealthBar = 0;
		Wld_StopEffect("DRAGONLOOK_FX");
		Wld_StopEffect("LOWHEALTH_FX");
		Wld_StopEffect("POISONED_FX");
		Wld_StopEffect("SPELLFX_FOG_SMOKE");
		Wld_StopEffect("DIALOGSCOPE_FX");
		AI_Print("Zemřel jsi...");
	};
	/*	if((HeroIsDead == TRUE) && (hero.attribute[ATR_HITPOINTS] > 1) && (TrailerMake == FALSE))
	{
		AI_Wait(hero,9999);
		AI_PrintClr("Znelíbil ses bohům!",177,58,17);

		if(ATR_INTELLECT > 0)
		{
			ATR_INTELLECT -= 1;
			concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
			concatText = ConcatStrings(concatText," sekund...");
			AI_PrintClr(concatText,177,58,17);
		}
		else
		{
			ExitSession();
		};
	};	*/
	if((SLEEPONGROUND == FALSE) && (Npc_HasItems(hero,ITMI_SLEEPSACK_TEMP) >= 1))
	{
		Npc_RemoveInvItems(hero,ITMI_SLEEPSACK_TEMP,Npc_HasItems(hero,ITMI_SLEEPSACK_TEMP));

		if(Npc_HasItems(hero,ITMI_SLEEPSACK) == FALSE)
		{
			CreateInvItems(hero,ITMI_SLEEPSACK,1);
		};
	};

	//-----------------Khorinis----------------------------------

	if(CurrentLevel == NEWWORLD_ZEN)
	{
		Mage_Xar = Hlp_GetNpc(NONE_100_Xardas);
		Mage_Pyr = Hlp_GetNpc(KDF_500_Pyrokar);
		Mage_Vat = Hlp_GetNpc(VLK_439_Vatras);

		if((MageSpeechStart == FALSE) && (Npc_GetDistToWP(hero,"NW_TROLLAREA_RITUAL_01") <= 3000) && (Xardas_GoesToRitualInnosEye == TRUE) && (Pyrokar_GoesToRitualInnosEye == TRUE) && (Vatras_GoesToRitualInnosEye == TRUE) && (Npc_GetDistToWP(Mage_Xar,"NW_TROLLAREA_RITUAL_01") <= 1000) && (Npc_GetDistToWP(Mage_Pyr,"NW_TROLLAREA_RITUAL_02") <= 1000) && (Npc_GetDistToWP(Mage_Vat,"NW_TROLLAREA_RITUAL_04") <= 1000))
		{
			bManaBar = 0;
			bHealthBar = 0;
			CamModeOn = TRUE;
			Mage_Xar.aivar[AIV_INVINCIBLE] = TRUE;
			Mage_Pyr.aivar[AIV_INVINCIBLE] = TRUE;
			Mage_Vat.aivar[AIV_INVINCIBLE] = TRUE;
			hero.aivar[AIV_INVINCIBLE] = TRUE;
			Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);
			Mage_Xar.aivar[AIV_EnemyOverride] = TRUE;
			Mage_Pyr.aivar[AIV_EnemyOverride] = TRUE;
			Mage_Vat.aivar[AIV_EnemyOverride] = TRUE;
			Wld_SendTrigger("EVT_CAM_MAGESPEECH");
			B_StartOtherRoutine(Mage_Xar,"MageSpeech");
			B_StartOtherRoutine(Mage_Pyr,"MageSpeech");
			B_StartOtherRoutine(Mage_Vat,"MageSpeech");
			MageSpeechStart = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (CHIEFKILLERISDEAD == FALSE) && ((GUILDKILLKNOWNLOC == TRUE) || (JOINKILLERS == TRUE)))
		{
			if(Npc_HasItems(announcer,ItLsTorchFirespit) > 0)
			{
				Npc_RemoveInvItems(announcer,ItLsTorchFirespit,Npc_HasItems(announcer,ItLsTorchFirespit));
			};
			if(Npc_HasEquippedArmor(announcer) == FALSE)
			{
				if(Npc_HasItems(announcer,itar_asmal) == 0)
				{
					CreateInvItems(announcer,itar_asmal,1);
				};
	
				AI_EquipBestArmor(announcer);	
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Ragnar.guild == GIL_NOV) && (RagnarIsDead == FALSE))
		{
			if(Npc_HasEquippedArmor(Ragnar) == FALSE)
			{
				if(Npc_HasItems(Ragnar,ItAr_Sld_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_Sld_L,Npc_HasItems(Ragnar,ItAr_Sld_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_M) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_M,Npc_HasItems(Ragnar,ItAr_MIL_M));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_L,Npc_HasItems(Ragnar,ItAr_MIL_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_KDF_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_KDF_L,Npc_HasItems(Ragnar,ItAr_KDF_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_NOV_L) == 0)
				{
					CreateInvItems(Ragnar,ItAr_NOV_L,1);
				};
	
				AI_EquipBestArmor(Ragnar);	
				AI_UnequipWeapons(Ragnar);

				if(Npc_HasItems(Ragnar,ItMw_StoneHammer) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItMw_StoneHammer,Npc_HasItems(Ragnar,ItMw_StoneHammer));
				};
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Ragnar.guild == GIL_SLD) && (RagnarIsDead == FALSE))
		{
			if(Npc_HasEquippedArmor(Ragnar) == FALSE)
			{
				if(Npc_HasItems(Ragnar,ItAr_NOV_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_NOV_L,Npc_HasItems(Ragnar,ItAr_NOV_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_M) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_M,Npc_HasItems(Ragnar,ItAr_MIL_M));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_L,Npc_HasItems(Ragnar,ItAr_MIL_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_KDF_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_KDF_L,Npc_HasItems(Ragnar,ItAr_KDF_L));
				};	
				if(Npc_HasItems(Ragnar,ItAr_Sld_L) == 0)
				{
					CreateInvItems(Ragnar,ItAr_Sld_L,1);
				};

				AI_EquipBestArmor(Ragnar);	
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Ragnar.guild == GIL_MIL) && (RagnarIsDead == FALSE))
		{
			if(Npc_HasEquippedArmor(Ragnar) == FALSE)
			{
				if(RagnarIsMIL_H == TRUE)
				{
					if(Npc_HasItems(Ragnar,ItAr_NOV_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_NOV_L,Npc_HasItems(Ragnar,ItAr_NOV_L));
					};
					if(Npc_HasItems(Ragnar,ItAr_Sld_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_Sld_L,Npc_HasItems(Ragnar,ItAr_Sld_L));
					};
					if(Npc_HasItems(Ragnar,ItAr_MIL_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_MIL_L,Npc_HasItems(Ragnar,ItAr_MIL_L));
					};
					if(Npc_HasItems(Ragnar,ItAr_KDF_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_KDF_L,Npc_HasItems(Ragnar,ItAr_KDF_L));
					};
					if(Npc_HasItems(Ragnar,ItAr_MIL_M) == 0)
					{
						CreateInvItems(Ragnar,ItAr_MIL_M,1);
					};
	
					AI_EquipBestArmor(Ragnar);	
				}
				else
				{
					if(Npc_HasItems(Ragnar,ItAr_NOV_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_NOV_L,Npc_HasItems(Ragnar,ItAr_NOV_L));
					};
					if(Npc_HasItems(Ragnar,ItAr_Sld_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_Sld_L,Npc_HasItems(Ragnar,ItAr_Sld_L));
					};	
					if(Npc_HasItems(Ragnar,ItAr_MIL_M) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_MIL_M,Npc_HasItems(Ragnar,ItAr_MIL_M));
					};
					if(Npc_HasItems(Ragnar,ItAr_KDF_L) > 0)
					{
						Npc_RemoveInvItems(Ragnar,ItAr_KDF_L,Npc_HasItems(Ragnar,ItAr_KDF_L));
					};
					if(Npc_HasItems(Ragnar,ITAR_Mil_L) == 0)
					{
						CreateInvItems(Ragnar,ITAR_Mil_L,1);
					};
	
					AI_EquipBestArmor(Ragnar);	
				};
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Ragnar.guild == GIL_KDF) && (RagnarIsDead == FALSE))
		{
			if(Npc_HasEquippedArmor(Ragnar) == FALSE)
			{
				if(Npc_HasItems(Ragnar,ItAr_NOV_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_NOV_L,Npc_HasItems(Ragnar,ItAr_NOV_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_M) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_M,Npc_HasItems(Ragnar,ItAr_MIL_M));
				};
				if(Npc_HasItems(Ragnar,ItAr_MIL_L) > 0)
				{	
					Npc_RemoveInvItems(Ragnar,ItAr_MIL_L,Npc_HasItems(Ragnar,ItAr_MIL_L));
				};	
				if(Npc_HasItems(Ragnar,ItAr_Sld_L) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItAr_Sld_L,Npc_HasItems(Ragnar,ItAr_Sld_L));
				};
				if(Npc_HasItems(Ragnar,ItAr_KDF_L) == 0)
				{
					CreateInvItems(Ragnar,ItAr_KDF_L,1);
				};
	
				AI_EquipBestArmor(Ragnar);	
				AI_UnequipWeapons(Ragnar);
	
				if(Npc_HasItems(Ragnar,ItMw_StoneHammer) > 0)
				{
					Npc_RemoveInvItems(Ragnar,ItMw_StoneHammer,Npc_HasItems(Ragnar,ItMw_StoneHammer));
				};
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (CoragonGuestBack == TRUE) && (WirtIsDead == FALSE))
		{
			if(Npc_HasEquippedArmor(VLK_4201_Wirt) == FALSE)
			{
				if(Npc_HasItems(VLK_4201_Wirt,ITAR_Mil_L) == 0)
				{
					CreateInvItems(VLK_4201_Wirt,ITAR_Mil_L,1);
				};		

				AI_EquipBestArmor(VLK_4201_Wirt);	
			};
		};
		if((LesterGoXar == FALSE) && (LesterCanGoXar == TRUE) && (LesterCanGoXarDay > 0) && (LesterCanGoXarDay < DayNow))
		{
			Npc_ExchangeRoutine(PC_Psionic,"XARDAS");
			LesterGoXar = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (CanGiveArmorDocs == TRUE) && (GiveNewArmorDocs > 0) && (GiveNewArmorDocs < (DayNow - 1)) && (CanGiveOtherArmor == FALSE))
		{
			if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardOneIsDead == FALSE))
			{
				AI_UnequipArmor(Mil_360_Miliz);
				CreateInvItems(Mil_360_Miliz,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(Mil_360_Miliz,ItMw_Schwert2,1);
				AI_EquipArmor(Mil_360_Miliz,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(Mil_360_Miliz);
			};
			if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardTwoIsDead == FALSE))
			{
				AI_UnequipArmor(Mil_361_Miliz);
				CreateInvItems(Mil_361_Miliz,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(Mil_361_Miliz,ItMw_Schwert2,1);
				AI_EquipArmor(Mil_361_Miliz,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(Mil_361_Miliz);
			};
			if((wolfrecruiteddt == TRUE) && (WolfMIsDead == FALSE))
			{
				AI_UnequipArmor(SLD_811_Wolf);
				CreateInvItems(SLD_811_Wolf,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(SLD_811_Wolf,ItMw_Schwert2,1);
				AI_EquipArmor(SLD_811_Wolf,ItAr_OldSteelArmor_NPC);
			};
			if((wolfrecruiteddt == TRUE) && (GuardThreeIsDead == FALSE))
			{
				AI_UnequipArmor(SLD_8111_Soeldner);
				CreateInvItems(SLD_8111_Soeldner,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(SLD_8111_Soeldner,ItMw_Schwert2,1);
				AI_EquipArmor(SLD_8111_Soeldner,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(SLD_8111_Soeldner);
			};
			if((wolfrecruiteddt == TRUE) && (GuardFourIsDead == FALSE))
			{
				AI_UnequipArmor(SLD_8112_Soeldner);
				CreateInvItems(SLD_8112_Soeldner,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(SLD_8112_Soeldner,ItMw_Schwert2,1);
				AI_EquipArmor(SLD_8112_Soeldner,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(SLD_8112_Soeldner);
			};
			if((AlrikRECRUITEDDT == TRUE) && (AlrikIsDead == FALSE))
			{
				AI_UnequipArmor(VLK_438_Alrik);
				CreateInvItems(VLK_438_Alrik,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(VLK_438_Alrik,ItMw_Schwert2,1);
				AI_EquipArmor(VLK_438_Alrik,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(VLK_438_Alrik);
			};
			if((GAYVERNRECRUITEDDT == TRUE) && (GayvernIsDead == FALSE))
			{
				AI_UnequipArmor(vlk_6132_gayvern);
				CreateInvItems(vlk_6132_gayvern,ItAr_OldSteelArmor_NPC,1);
				CreateInvItems(vlk_6132_gayvern,ItMw_Schwert2,1);
				AI_EquipArmor(vlk_6132_gayvern,ItAr_OldSteelArmor_NPC);
				AI_EquipBestMeleeWeapon(vlk_6132_gayvern);
			};

			CanGiveOtherArmor = TRUE;
		};
		if((CITYGATEACCESSGRANTED == TRUE) && (QuestEnterOnce == FALSE))
		{
			if(MIS_Addon_Lester_PickForConstantino == LOG_Running)
			{
				MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			};

			QuestEnterOnce = FALSE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MageSpeechStart == TRUE) && (MageSpeechEnd == TRUE) && (MageSpeechEndStop == FALSE))
		{
			B_StartOtherRoutine(KDF_500_Pyrokar,"RitualInnosEyeRepair");
			B_StartOtherRoutine(NONE_100_Xardas,"RitualInnosEyeRepair");
			B_StartOtherRoutine(VLK_439_Vatras,"RitualInnosEyeRepair");
			hero.aivar[AIV_INVINCIBLE] = FALSE;
			MageSpeechEndStop = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Diebesgilde_Verraten == TRUE) && (Andre_Diebesgilde_aufgeraeumt == FALSE))
		{
			if(Npc_IsDead(VLK_447_Cassia) == FALSE)
			{
				B_KillNpc(VLK_447_Cassia);
			};
			if(Npc_IsDead(VLK_446_Jesper) == FALSE)
			{
				B_KillNpc(VLK_446_Jesper);
			};
			if(Npc_IsDead(VLK_445_Ramirez) == FALSE)
			{
				B_KillNpc(VLK_445_Ramirez);
			};
			if(Npc_IsDead(VLK_494_Attila) == FALSE)
			{
				B_KillNpc(VLK_494_Attila);
			};

			Andre_Diebesgilde_aufgeraeumt = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_ReadyForChapter3 == TRUE) && (B_Chapter3_OneTime == FALSE))
		{
			B_Kapitelwechsel(3,NEWWORLD_ZEN);
			B_Chapter3_OneTime = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_AllDragonsDead == TRUE) && (OWDragonsDeadIsDead == TRUE) && (B_Chapter5_OneTime == FALSE))
		{
			B_Kapitelwechsel(5,NEWWORLD_ZEN);
			B_Chapter5_OneTime = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Npc_KnowsInfo(hero,DIA_FERNANDO_GOTBOOK) == TRUE) && (RhetInsertAgain == FALSE))
		{
			Npc_RemoveInvItems(VLK_405_Fernando,itwr_rhetorikbook,Npc_HasItems(VLK_405_Fernando,itwr_rhetorikbook));
			Mob_CreateItems("NW_CHEST_103",itwr_rhetorikbook,1);
			RhetInsertAgain = TRUE;
		};
		if((MIS_DarkWeb == LOG_Running) && (Npc_HasItems(hero,ItMi_LotarRing) >= 1) && (FindLotarRing == FALSE))
		{
			B_GivePlayerXP(250);
			FindLotarRing = TRUE;
			B_LogEntry(TOPIC_DarkWeb,"Aha! Myslím, že jsem našel prsten, který kdysi patřil Lotharovi. Alespoň je na něm tohle jméno vyryto. S největší pravděpodobností se uvolnil z prstu oběti, když spadla na zem, a odkutálel se pod most. Není tedy divu, že ho paladinové nenašli. Ale něco mi na tom prstenu nesedí. Vypadá sice jako obyčejný stříbrný prsten, ale má slabou magickou auru. Myslím, že stojí za to si o tom promluvit s některým z mágů. Možná mi pomůže Vatras?");
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_Rukhar_Wettkampf_Day > 0) && (Kapitel < 6) && (MIS_Rukhar_Wettkampf_Day < DayNow) && (RandolphGoParty == FALSE))
		{
			RandolphGoParty = TRUE;
			B_StartOtherRoutine(BAU_942_Randolph,"Wettkampf");
			B_StartOtherRoutine(BAU_970_Orlan,"Wettkampf");
			B_StartOtherRoutine(BAU_973_Rukhar,"Wettkampf");
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_HauntedLighthouse == LOG_Running) && (JackGoLH == TRUE) && (JackGoLHDay <= (DayNow - 1)) && (JackMainIsDead == FALSE) && (JackOnLH == FALSE))
		{
			JackOnLH = TRUE;
			B_StartOtherRoutine(VLK_444_Jack,"MeetLH");
			AI_Teleport(VLK_444_Jack,"NW_JACK_LH_01");
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == TRUE) && (StefanCanFight == FALSE) && (LHIsOn == TRUE) && (FinishStoryLH == FALSE))
		{
			FinishStoryLH = TRUE;

			if(JackDontDie == TRUE)
			{
				JackMeetGhost = TRUE;
				B_StartOtherRoutine(VLK_444_Jack,"JackFight");
				AI_Teleport(Skeleton_Stefan,"TOT");
				Npc_ExchangeRoutine(Skeleton_Stefan,"TOT");
				Mdl_SetVisualBody(VLK_444_Jack,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",FaceBabe_N_PinkHair,0,NO_ARMOR);
			}
			else
			{
				Snd_Play("MFX_GHOSTVOICE");
				VLK_444_Jack.aivar[AIV_StoryBandit] = TRUE;
				JackMainIsDead = TRUE;
				B_KillNpc(VLK_444_Jack);
				AI_Teleport(Skeleton_Stefan,"TOT");
				Npc_ExchangeRoutine(Skeleton_Stefan,"TOT");
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_HauntedLighthouse == LOG_Running) && (FindOldRing == FALSE) && (Npc_HasItems(hero,ItMi_StafanRing) >= 1))
		{
			B_GivePlayerXP(100);
			B_LogEntry(TOPIC_HauntedLighthouse,"Našel jsem starý stříbrný prsten. Na jeho vnitřní straně je vyrytý nápis - 'Stefanovi od Ha...'. Zbytek nápisu je nečitelný. Zajímalo by mě, komu patřil. A kdo je Ha...?");
			FindOldRing = TRUE;
		};
		if((TillRosiAway == FALSE) && (MIS_RosisFlucht == LOG_SUCCESS))
		{
			if(TillRosiCity == TRUE)
			{
				B_StartOtherRoutine(BAU_936_Rosi,"CITY");
				B_StartOtherRoutine(BAU_931_Till,"CITY");
				RosiTillDied = TRUE;
				TillRosiAway = TRUE;
			}
			else if(TillRosiFarm == TRUE)
			{
				B_StartOtherRoutine(BAU_936_Rosi,"BIGFARM");
				B_StartOtherRoutine(BAU_931_Till,"BIGFARM");
				TillRosiAway = TRUE;
			}
			else if(TillRosiKloster == TRUE)
			{
				B_StartOtherRoutine(BAU_936_Rosi,"KLOSTER");
				B_StartOtherRoutine(BAU_931_Till,"KLOSTER");
				TillRosiAway = TRUE;
			}
			else if(TillRosiPsiCamp == TRUE)
			{
				B_StartOtherRoutine(BAU_936_Rosi,"PSICAMP");
				B_StartOtherRoutine(BAU_931_Till,"PSICAMP");
				TillRosiAway = TRUE;
			}
			else
			{
				B_StartOtherRoutine(BAU_936_Rosi,"BIGFARM");
				B_StartOtherRoutine(BAU_931_Till,"BIGFARM");
				TillRosiAway = TRUE;
			};
		};

		//--------------odevayem yesli soglasilis' s Asmalom-------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (CHECKFLAGKILLSJOIN == TRUE) && (EQUIPALLKILLERS == FALSE) && (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_KILL_03") <= 1500))
		{
			if(Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal) == 0)
			{
				CreateInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
			};
			if(Npc_HasItems(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl,1);
			};

			AI_EquipArmor(pir_1398_addon_inextremo_announcer,itar_asmal);
			AI_EquipArmor(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl);
			AI_EquipArmor(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl);
			AI_EquipArmor(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl);
			AI_EquipArmor(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl);
			Mdl_SetVisualBody(pir_1397_addon_inextremo_charlotte,"AML_Body_Naked0",4,0,"Bab_Head_Hair1",0,DEFAULT,-1);
			EQUIPALLKILLERS = TRUE;
		};

		//--------------odevayem yesli prishli na vstrechu u pristani-------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (CHECKFLAGKILLSMEET == TRUE) && (EQUIPALLKILLERS == FALSE) && (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_KILL_03") <= 2000))
		{
			if(Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal) == 0)
			{
				CreateInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
			};
			if(Npc_HasItems(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl,1);
			};
			if(Npc_HasItems(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl) == 0)
			{
				CreateInvItems(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl,1);
			};

			AI_EquipArmor(pir_1398_addon_inextremo_announcer,itar_asmal);
			AI_EquipArmor(PIR_1390_Addon_InExtremo_DrPymonte,itar_kil_sl);
			AI_EquipArmor(PIR_1395_Addon_InExtremo_Lutter,itar_kil_sl);
			AI_EquipArmor(PIR_1396_Addon_InExtremo_Flex,itar_kil_sl);
			AI_EquipArmor(PIR_1391_Addon_InExtremo_TheFlail,itar_kil_sl);
			Mdl_SetVisualBody(pir_1397_addon_inextremo_charlotte,"AML_Body_Naked0",4,0,"Bab_Head_Hair1",0,DEFAULT,-1);
			EQUIPALLKILLERS = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (KILLSMEET == TRUE) && (MEETKILLLATE == FALSE) && (CHECKFLAGKILLSMEET == FALSE) && (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_KILL_03") <= 2000) && (Wld_IsTime(0,0,4,0) && (MIS_KILLSMEET_DAY == (DayNow - 2))))
		{
			Npc_ExchangeRoutine(vlk_6028_buerger,"TOT");
			//Npc_ExchangeRoutine(vlk_6029_buergerin,"TOT");
			Npc_ExchangeRoutine(vlk_6030_buerger,"TOT");
			//Npc_ExchangeRoutine(vlk_6031_buergerin,"TOT");
			//Npc_ExchangeRoutine(vlk_6032_buergerin,"TOT");
			Npc_ExchangeRoutine(vlk_6033_buerger,"TOT");
			//Npc_ExchangeRoutine(vlk_6034_buergerin,"TOT");
			Npc_ExchangeRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"Logovo");
			Npc_ExchangeRoutine(PIR_1395_Addon_InExtremo_Lutter,"Logovo");
			Npc_ExchangeRoutine(PIR_1396_Addon_InExtremo_Flex,"Logovo");
			Npc_ExchangeRoutine(PIR_1391_Addon_InExtremo_TheFlail,"Logovo");
			Npc_ExchangeRoutine(pir_1397_addon_inextremo_charlotte,"Logovo");
			Npc_ExchangeRoutine(pir_1398_addon_inextremo_announcer,"Logovo");
			AI_Teleport(pir_1398_addon_inextremo_announcer,"NW_CITY_HABOUR_KILL_01");
			AI_Teleport(pir_1397_addon_inextremo_charlotte,"NW_CITY_HABOUR_KILL_02");
			AI_Teleport(PIR_1390_Addon_InExtremo_DrPymonte,"NW_CITY_HABOUR_KILL_03");
			AI_Teleport(PIR_1395_Addon_InExtremo_Lutter,"NW_CITY_HABOUR_KILL_04");
			AI_Teleport(PIR_1396_Addon_InExtremo_Flex,"NW_CITY_HABOUR_KILL_05");
			AI_Teleport(PIR_1391_Addon_InExtremo_TheFlail,"NW_CITY_HABOUR_KILL_06");
			CHECKFLAGKILLSMEET = TRUE;
			MSINEXTREMO = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == TRUE))
		{
			MIS_VALENTINOHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_VALENTINOHELP);
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (KILLSMEET == TRUE) && (MEETKILLLATE == FALSE) && (GUILDKILLKNOWNLOC == FALSE) && (CHECKFLAGKILLSMEET == FALSE) && (MIS_KILLSMEET_DAY < (DayNow - 2)))
		{
			if(CHECKFLAGKILLSMEET == TRUE)
			{
				Npc_ExchangeRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"TOT");
				Npc_ExchangeRoutine(PIR_1395_Addon_InExtremo_Lutter,"TOT");
				Npc_ExchangeRoutine(PIR_1396_Addon_InExtremo_Flex,"TOT");
				Npc_ExchangeRoutine(PIR_1391_Addon_InExtremo_TheFlail,"TOT");
				Npc_ExchangeRoutine(pir_1397_addon_inextremo_charlotte,"TOT");
				Npc_ExchangeRoutine(pir_1398_addon_inextremo_announcer,"TOT");
				AI_Teleport(pir_1398_addon_inextremo_announcer,"TOT");
				AI_Teleport(pir_1397_addon_inextremo_charlotte,"TOT");
				AI_Teleport(PIR_1390_Addon_InExtremo_DrPymonte,"TOT");
				AI_Teleport(PIR_1395_Addon_InExtremo_Lutter,"TOT");
				AI_Teleport(PIR_1396_Addon_InExtremo_Flex,"TOT");
				AI_Teleport(PIR_1391_Addon_InExtremo_TheFlail,"TOT");
			};
			if((MIS_GUILDKILL == LOG_Running) && (MEETKILLLATELOG == FALSE))
			{
				B_LogEntry(TOPIC_GUILDKILL,"Sakra! Zdá se, že jsem na tu schůzku, co zmiňoval Gillian, přišel příliš pozdě.");
				MEETKILLLATELOG = TRUE;
			};

			MEETKILLLATE = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (KILLSMEET == TRUE) && (MEETKILLLATE == FALSE) && (GUILDKILLKNOWNLOC == FALSE) && (CHECKFLAGKILLSMEET == FALSE) && Wld_IsTime(4,1,23,59) && (MIS_KILLSMEET_DAY == (DayNow - 2)))
		{
			if(CHECKFLAGKILLSMEET == TRUE)
			{
				Npc_ExchangeRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"TOT");
				Npc_ExchangeRoutine(PIR_1395_Addon_InExtremo_Lutter,"TOT");
				Npc_ExchangeRoutine(PIR_1396_Addon_InExtremo_Flex,"TOT");
				Npc_ExchangeRoutine(PIR_1391_Addon_InExtremo_TheFlail,"TOT");
				Npc_ExchangeRoutine(pir_1397_addon_inextremo_charlotte,"TOT");
				Npc_ExchangeRoutine(pir_1398_addon_inextremo_announcer,"TOT");
				AI_Teleport(pir_1398_addon_inextremo_announcer,"TOT");
				AI_Teleport(pir_1397_addon_inextremo_charlotte,"TOT");
				AI_Teleport(PIR_1390_Addon_InExtremo_DrPymonte,"TOT");
				AI_Teleport(PIR_1395_Addon_InExtremo_Lutter,"TOT");
				AI_Teleport(PIR_1396_Addon_InExtremo_Flex,"TOT");
				AI_Teleport(PIR_1391_Addon_InExtremo_TheFlail,"TOT");
			};
			if((MIS_GUILDKILL == LOG_Running) && (MEETKILLLATELOG == FALSE))
			{
				B_LogEntry(TOPIC_GUILDKILL,"Sakra! Zdá se, že jsem na tu schůzku, co zmiňoval Gillian, přišel příliš pozdě.");
				MEETKILLLATELOG = TRUE;
			};

			MEETKILLLATE = TRUE;
		};

		//----------------Gillian poyavlyayetsya v taverne-------------------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_GERBRANDTHELP == LOG_Running) && (MEETCHIEFKILLERSLAIT == FALSE) && (MEETCHIEFKILLERS == FALSE) && (APEARKILLER == FALSE))
		{
			if((Wld_IsTime(23,30,23,59) && (MIS_GERBRANDT_MEETINTAVERNE_DAY == DayNow)) || (Wld_IsTime(0,0,1,30) && (MIS_GERBRANDT_MEETINTAVERNE_DAY == (DayNow - 1))))
			{
				pir_1398_addon_inextremo_announcer.name[0] = "Cizinec";
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Taverne");
				AI_Teleport(pir_1398_addon_inextremo_announcer,"NW_TAVERNE_KILLER");
				Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,ItLsTorchFirespit,Npc_HasItems(pir_1398_addon_inextremo_announcer,ItLsTorchFirespit));
				APEARKILLER = TRUE;
				CheckGillianTaverne = TRUE;
				STRANGERKNOWS = TRUE;
			};
		};

		//---------------- Opozdali na vstrechu -------------------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (MIS_GERBRANDTHELP == LOG_Running) && (MEETCHIEFKILLERS == FALSE) && (MEETCHIEFKILLERSLAIT == FALSE))
		{
			if(Wld_IsTime(1,31,23,59) && (MIS_GERBRANDT_MEETINTAVERNE_DAY == (DayNow - 1)))
			{
				pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
				AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
				Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
				AI_Teleport(pir_1398_addon_inextremo_announcer,"OCR_ANNOUNCER");
				B_LogEntry(TOPIC_GERBRANDTHELP,"Sakra! Zdá se, že jsem na tu schůzku, co zmiňoval Gerbrandt, přišel příliš pozdě.");
				MEETCHIEFKILLERSLAIT = TRUE;
				STRANGERKNOWS = FALSE;
				CheckGillianTaverne = FALSE;
			}
			else if(MIS_GERBRANDT_MEETINTAVERNE_DAY < (DayNow - 1))
			{
				pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
				AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
				Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
				AI_Teleport(pir_1398_addon_inextremo_announcer,"OCR_ANNOUNCER");
				B_LogEntry(TOPIC_GERBRANDTHELP,"Sakra! Zdá se, že jsem na tu schůzku, co zmiňoval Gerbrandt, přišel příliš pozdě.");
				MEETCHIEFKILLERSLAIT = TRUE;
				STRANGERKNOWS = FALSE;
				CheckGillianTaverne = FALSE;
			};
		};

		//----------------Gillian vozvrashchayetsya na mesto-------------------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (MEETCHIEFKILLERS == TRUE) && (Npc_GetDistToWP(hero,"NW_TAVERNE_KILLER") > 2000) && (MEETCHIEFKILLERSAWAY == FALSE))
		{
			pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
			AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
			Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
			AI_Teleport(pir_1398_addon_inextremo_announcer,"OCR_ANNOUNCER");
			B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
			MEETCHIEFKILLERSAWAY = TRUE;
			STRANGERKNOWS = FALSE;
			CheckGillianTaverne = FALSE;
		};

		//---------------------Otpravlyayem Vambo i Gilliana k mestu vstrechi-------------------------------

		if((CurrentLevel == NEWWORLD_ZEN) && (ASMALCANAPPEAR == TRUE) && (KILLFLAG == FALSE) && (JOINKILLERS == FALSE)  && (KILLCANJOIN == FALSE) && (CHIEFKILLERISDEAD == FALSE))
		{
			if((AsmalDayMeet == DayNow) && Wld_IsTime(22,0,23,59))
			{		
				if(Npc_GetDistToWP(hero,"NW_CITY_KILLWAMBO_02") > 1500)
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Cizinec";
					B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"WaitFight");
					B_StartOtherRoutine(Mil_316_Wambo,"WaitFight");
					AI_Teleport(pir_1398_addon_inextremo_announcer,"NW_CITY_KILLWAMBO_01");
					AI_Teleport(Mil_316_Wambo,"NW_CITY_KILLWAMBO_02");
					CheckGillianWambo = TRUE;
				}
				else
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Cizinec";
					B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"WaitFight");
					B_StartOtherRoutine(Mil_316_Wambo,"WaitFight");
					CheckGillianWambo = TRUE;
				};

				KILLFLAG = TRUE;
				STRANGERKNOWS = TRUE;
			};
		};

		//---------------------Vse na meste vstrechi i nas ne vidno -------------------------------
	
		if((CurrentLevel == NEWWORLD_ZEN) && (ASMALCANAPPEAR == TRUE) && (KILLFLAG == TRUE) && (KILLFLAG2 == FALSE) && (JOINKILLERS == FALSE)  && (KILLCANJOIN == FALSE) && (CHIEFKILLERISDEAD == FALSE))
		{
			if((AsmalDayMeet == DayNow) && Wld_IsTime(22,0,23,59) && (Npc_GetDistToWP(hero,"NW_CITY_KILLWAMBO_02") <= 1500) && (Npc_GetDistToWP(Mil_316_Wambo,"NW_CITY_KILLWAMBO_02") <= 200) && (Npc_GetDistToWP(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,"NW_CITY_KILLWAMBO_01") <= 200))
			{	
				if(Npc_CanSeeNpc(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,hero) == FALSE)
				{
					WamboTimer += 1;

					if(WamboTimer >= 10)
					{
						Mil_316_Wambo.aivar[AIV_DropDeadAndKill] = TRUE;
						b_changeguild(Mil_316_Wambo,GIL_BDT);
						KILLFLAG2 = TRUE;
						WamboMustDie = TRUE;
						CheckGillianWambo = FALSE;
					};
				}
				else
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
					B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
					B_StartOtherRoutine(Mil_316_Wambo,"Start");
					KILLFLAG2 = TRUE;
					STRANGERKNOWS = FALSE;
					CheckGillianWambo = FALSE;
				};
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (ASMALCANAPPEAR == TRUE) && (KILLFLAG == TRUE) && (KILLFLAG2 == FALSE) && (JOINKILLERS == FALSE)  && (KILLCANJOIN == FALSE) && (CHIEFKILLERISDEAD == FALSE))
		{
			if(AsmalDayMeet < DayNow)
			{		
				pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
				AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
				Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,1);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
				B_StartOtherRoutine(Mil_316_Wambo,"Start");
				KILLFLAG2 = TRUE;
				STRANGERKNOWS = FALSE;
				CheckGillianWambo = FALSE;
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (KILLFLAG == TRUE) && (WamboMustDie == TRUE) && (KILLFLAG2 == TRUE) && (WAMBOISDEAD == FALSE))
		{
			WamboTimerEx += 1;

			if(WamboTimerEx >= 10)
			{
				B_KillNpc(Mil_316_Wambo);
				b_changeguild(pir_1398_addon_inextremo_announcer,GIL_VLK);
				AI_StandupQuick(pir_1398_addon_inextremo_announcer);
				Npc_ClearAIQueue(pir_1398_addon_inextremo_announcer);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");
	
				if(Npc_GetDistToWP(hero,"NW_CITY_KILLWAMBO_01") <= 1500)
				{
					KILLCANJOIN = TRUE;
				}
				else
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Gillian";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};

				WAMBOISDEAD = TRUE;
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (ConcertIsOn == TRUE) && (ConcertBonus == FALSE))
		{
			ConcertTimer += 1;
	
			if(ConcertTimer >= 97)
			{
				bManaBar = 1;
				bHealthBar = 1;
				CamModeOn = FALSE;
				Npc_RemoveInvItems(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,ItMi_IEDudelGelb,Npc_HasItems(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,ItMi_IEDudelGelb));
				B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"Start");
				B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"Start");
				B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"Start");
				B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"Start");
				B_StartOtherRoutine(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,"Start");
				hero.exp = hero.exp + 500;
				//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
				//PrintScreen(ConcatStrings(NAME_Addon_ConcertBonus,IntToString(500)),-1,60,FONT_NEWLEVEL,4);
				Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
				ConcertBonus = TRUE;
				ConcertIsOn = FALSE;
				ConcertTimer = FALSE;
				AI_NoticePrint(3000,4098,NAME_Addon_ConcertBonus);
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE))
		{
			ConcertLoaTimer += 1;

			if(ConcertLoaTimer >= 372)
			{
				bManaBar = 1;
				bHealthBar = 1;
				CamModeOn = FALSE;
				B_StartOtherRoutine(Sld_822_Raoul,"Start");
				B_StartOtherRoutine(SLD_819_Soeldner,"Start");

				if(WOLFRECRUITEDDT == FALSE)
				{
					B_StartOtherRoutine(SLD_811_Wolf,"Start");
				};

				B_StartOtherRoutine(SLD_842_SOELDNER,"Start");
				B_StartOtherRoutine(SLD_843_SOELDNER,"Start");
				B_StartOtherRoutine(SLD_844_SOELDNER,"Start");
				B_StartOtherRoutine(SLD_823_Khaled,"Start");
				B_StartOtherRoutine(SLD_10920_Loa,"Start");
				hero.exp = hero.exp + 500;
				SLD_10920_Loa.name[0] = "Loa";
				Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
				ConcertLoaBonus = TRUE;
				ConcertLoaTimer = FALSE;
				AI_NoticePrint(3000,4098,NAME_Addon_ConcertLoaBonus);
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (resettime == FALSE) && (SBMODE != FALSE))
		{
			Wld_SetTime(23,59);
			resettime = TRUE;
		};
		if((Fight_Valgard_Now == TRUE) || (Fight_Graden_Now == TRUE) || (Fight_Olaf_Now == TRUE) || (Fight_Bram_Now == TRUE))
		{
			if((Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE) || (Npc_IsInFightMode(hero,FMODE_FAR) == TRUE) || (Npc_IsInFightMode(hero,FMODE_MAGIC) == TRUE))
			{
				FightCurrentLost = TRUE;
				Fight_Valgard_Now = FALSE;
				Fight_Graden_Now = FALSE;
				Fight_Olaf_Now = FALSE;
				Fight_Bram_Now = FALSE;
				Snd_Play3d(hero,"YOULOST");
				B_StartOtherRoutine(VLK_663_Valgard,"Start");
				B_StartOtherRoutine(VLK_660_Olaf,"Start");
				B_StartOtherRoutine(VLK_662_Bram,"Start");
				B_StartOtherRoutine(VLK_661_Graden,"Start");
			};
		};
		if(MIS_HELPCREW == LOG_Running)
		{
			if((CurrentLevel == NEWWORLD_ZEN) && (MIS_HELPCREW == LOG_Running) && (CanMoveCrewBack == TRUE) && (CHECKCREWTOHOME == FALSE) && (Npc_GetDistToWP(hero,"SHIP_DECK_15") > 15000))
			{
				if((ANGARBATTLETHROUGTH == TRUE) || (ANGARNOBATTLETHROUGTH == TRUE))
				{
					if(ANGARBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);

						if(randomchance >= 10)
						{
							B_StartOtherRoutine(DJG_705_Angar_NW,"PsiCamp");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(DJG_705_Angar_NW,"CaptureThrBattle");
							ANGARCAPTURED = TRUE;
							COUNTCAPTURED = COUNTCAPTURED + 1;
						};
					};
					if(ANGARNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(DJG_705_Angar_NW,"PsiCamp");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Angar_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_ANGAR == FALSE))
				{
					B_StartOtherRoutine(DJG_705_Angar_NW,"CaptureThrBattle");
					ANGARCAPTURED = TRUE;
					COUNTCAPTURED = COUNTCAPTURED + 1;
				};
				if((TORLOFBATTLETHROUGTH == TRUE) || (TORLOFNOBATTLETHROUGTH == TRUE))
				{
					if(TORLOFBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);
	
						if(randomchance >= 20)
						{
							B_StartOtherRoutine(SLD_801_Torlof,"PreStart");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(SLD_801_Torlof,"CaptureThrBattle");
							TORLOFCAPTURED = TRUE;
							COUNTCAPTURED = COUNTCAPTURED + 1;
						};
					};
					if(TORLOFNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(SLD_801_Torlof,"PreStart");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((TorlofIsCaptain == TRUE) && (LI_CHECK_TORLOF == FALSE))
				{
					B_StartOtherRoutine(SLD_801_Torlof,"CaptureThrBattle");
					TORLOFCAPTURED = TRUE;
					COUNTCAPTURED = COUNTCAPTURED + 1;
				};
				if((BIFFBATTLETHROUGTH == TRUE) || (BIFFNOBATTLETHROUGTH == TRUE))
				{
					if(BIFFBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);
	
						if(randomchance >= 30)
						{
							B_StartOtherRoutine(DJG_713_Biff_NW,"OrcAtcNW");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(DJG_713_Biff_NW,"KillHim");
							B_KillNpc(DJG_713_Biff_NW);
							COUNTKILLERS = COUNTKILLERS + 1;
						};
					};
					if(BIFFNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(DJG_713_Biff_NW,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Biff_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BIFF == FALSE))
				{
					B_StartOtherRoutine(DJG_713_Biff_NW,"Start");
					B_KillNpc(DJG_713_Biff_NW);
					COUNTKILLERS = COUNTKILLERS + 1;
				};
				if((GIRIONBATTLETHROUGTH == TRUE) || (GIRIONNOBATTLETHROUGTH == TRUE))
				{
					if(GIRIONBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);

						if(randomchance >= 40)
						{
							B_StartOtherRoutine(Pal_207_Girion,"CaptureThrBattle");
							GIRIONCAPTURED = TRUE;
							COUNTCAPTURED = COUNTCAPTURED + 1;
						}
						else
						{
							B_StartOtherRoutine(Pal_207_Girion,"KillHim");
							B_KillNpc(Pal_207_Girion);
							COUNTKILLERS = COUNTKILLERS + 1;
						};
					};
					if(GIRIONNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(Pal_207_Girion,"CaptureThrBattle");
						GIRIONCAPTURED = TRUE;
						COUNTCAPTURED = COUNTCAPTURED + 1;
					};
				}
				else if((Girion_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_GIRION == FALSE))
				{
					B_StartOtherRoutine(Pal_207_Girion,"Start");
					B_KillNpc(Pal_207_Girion);
					COUNTKILLERS = COUNTKILLERS + 1;
				};
				if((WOLFBATTLETHROUGTH == TRUE) || (WOLFNOBATTLETHROUGTH == TRUE))
				{
					if(WOLFBATTLETHROUGTH == TRUE)
					{
						if(WOLFRECRUITEDDT == FALSE)
						{
							randomchance = Hlp_Random(100);

							if(randomchance >= 50)
							{
								B_StartOtherRoutine(SLD_811_Wolf,"CaptureThrBattle");
								WOLFCAPTURED = TRUE;
								COUNTCAPTURED = COUNTCAPTURED + 1;
							}
							else
							{
								B_StartOtherRoutine(SLD_811_Wolf,"Start");
								COUNTSURVIVERS = COUNTSURVIVERS + 1;
							};
						};
					};
					if(WOLFNOBATTLETHROUGTH == TRUE)
					{
						if(WOLFRECRUITEDDT == FALSE)
						{
							B_StartOtherRoutine(SLD_811_Wolf,"Start");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						};
					};
				}
				else if((Wolf_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_WOLF == FALSE))
				{
					if(WOLFRECRUITEDDT == FALSE)
					{
						B_StartOtherRoutine(SLD_811_Wolf,"CaptureThrBattle");
						WOLFCAPTURED = TRUE;
						COUNTCAPTURED = COUNTCAPTURED + 1;
					};
				};
				if((LARESBATTLETHROUGTH == TRUE) || (LARESNOBATTLETHROUGTH == TRUE))
				{
					if(LARESBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);
	
						if(randomchance >= 40)
						{
							B_StartOtherRoutine(VLK_449_Lares,"OrcAtcNW");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(VLK_449_Lares,"CaptureThrBattle");
							LARESCAPTURED = TRUE;
							COUNTCAPTURED = COUNTCAPTURED + 1;
						};
					};
					if(LARESNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(VLK_449_Lares,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Lares_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LARES == FALSE))
				{
					B_StartOtherRoutine(VLK_449_Lares,"CaptureThrBattle");
					LARESCAPTURED = TRUE;
					COUNTCAPTURED = COUNTCAPTURED + 1;
				};
				if((BENNETBATTLETHROUGTH == TRUE) || (BENNETNOBATTLETHROUGTH == TRUE))
				{
					if(BENNETBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);

						if(randomchance >= 75)
						{
							B_StartOtherRoutine(SLD_809_Bennet,"Start");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(SLD_809_Bennet,"CaptureThrBattle");
							BENNETCAPTURED = TRUE;
							COUNTCAPTURED = COUNTCAPTURED + 1;
						};
					};
					if(BENNETNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(SLD_809_Bennet,"Start");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Bennet_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_BENNET == FALSE))
				{
					B_StartOtherRoutine(SLD_809_Bennet,"CaptureThrBattle");
					BENNETCAPTURED = TRUE;
					COUNTCAPTURED = COUNTCAPTURED + 1;
				};
				if((JORGENBATTLETHROUGTH == TRUE) || (JORGENNOBATTLETHROUGTH == TRUE))
				{
					if(JORGENBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);

						if(randomchance >= 90)
						{
							B_StartOtherRoutine(VLK_4250_Jorgen,"RausAusKloster");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(VLK_4250_Jorgen,"KillHim");
							B_KillNpc(VLK_4250_Jorgen);
							COUNTKILLERS = COUNTKILLERS + 1;
						};
					};
					if(JORGENNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(VLK_4250_Jorgen,"RausAusKloster");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((JorgenIsCaptain == TRUE) && (LI_CHECK_JORGEN == FALSE))
				{
					B_StartOtherRoutine(VLK_4250_Jorgen,"KillHim");
					B_KillNpc(VLK_4250_Jorgen);
					COUNTKILLERS = COUNTKILLERS + 1;
				};
				if((JACKBATTLETHROUGTH == TRUE) || (JACKNOBATTLETHROUGTH == TRUE))
				{
					if(JACKBATTLETHROUGTH == TRUE)
					{
						randomchance = Hlp_Random(100);

						if(randomchance >= 90)
						{
							B_StartOtherRoutine(VLK_444_Jack,"RausAusKloster");
							COUNTSURVIVERS = COUNTSURVIVERS + 1;
						}
						else
						{
							B_StartOtherRoutine(VLK_444_Jack,"KillHim");
							B_KillNpc(VLK_444_Jack);
							COUNTKILLERS = COUNTKILLERS + 1;
						};
					};
					if(JACKNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(VLK_444_Jack,"RausAusKloster");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((JackIsCaptain == TRUE) && (LI_CHECK_JACK == FALSE))
				{
					B_StartOtherRoutine(VLK_444_Jack,"KillHim");
					B_KillNpc(VLK_444_Jack);
					COUNTKILLERS = COUNTKILLERS + 1;
				};
				if((LEEBATTLETHROUGTH == TRUE) || (LEENOBATTLETHROUGTH == TRUE))
				{
					if(LEEBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(SLD_800_Lee,"Start");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
					if(LEENOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(SLD_800_Lee,"Start");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Lee_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_LEE == FALSE))
				{
					B_StartOtherRoutine(SLD_800_Lee,"Start");
					COUNTSURVIVERS = COUNTSURVIVERS + 1;
				};
				if((FIGHTERBATTLETHROUGTH == TRUE) || (FIGHTERNOBATTLETHROUGTH == TRUE))
				{
					if(FIGHTERBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Start");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
					if(FIGHTERNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Start");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Gorn_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_FIGHTER == FALSE))
				{
					B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Start");
					COUNTSURVIVERS = COUNTSURVIVERS + 1;
				};
				if((PSIONICBATTLETHROUGTH == TRUE) || (PSIONICNOBATTLETHROUGTH == TRUE))
				{
					if(PSIONICBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Psionic,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
					if(PSIONICNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Psionic,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Lester_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_PSIONIC == FALSE))
				{
					B_StartOtherRoutine(PC_Psionic,"OrcAtcNW");
					COUNTSURVIVERS = COUNTSURVIVERS + 1;
				};
				if((THIEFBATTLETHROUGTH == TRUE) || (THIEFNOBATTLETHROUGTH == TRUE))
				{
					if(THIEFBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Thief_NW,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
					if(THIEFNOBATTLETHROUGTH == TRUE)
					{
						B_StartOtherRoutine(PC_Thief_NW,"OrcAtcNW");
						COUNTSURVIVERS = COUNTSURVIVERS + 1;
					};
				}
				else if((Diego_IsOnBoard == LOG_SUCCESS) && (LI_CHECK_THIEF == FALSE))
				{
					B_StartOtherRoutine(PC_Thief_NW,"OrcAtcNW");
					COUNTSURVIVERS = COUNTSURVIVERS + 1;
				};
				if((Lee_IsOnBoard != LOG_SUCCESS) && (Diego_IsOnBoard != LOG_SUCCESS) && (Lester_IsOnBoard != LOG_SUCCESS) && (Gorn_IsOnBoard != LOG_SUCCESS))
				{
					MIS_HELPCREW = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
					B_LogEntry(TOPIC_HELPCREW,"Teď už jen Innos rozhodne, kdo přežije a kdo ne!");
				};

				REPLACEPLACESCREW = TRUE;
				MOVECREWTOHOME = TRUE;
				CHECKCREWTOHOME = TRUE;
			};
		};
		if((MIS_JESPERMUSIC == LOG_SUCCESS) && (JesperDanceDay != FALSE) && (JesperDanceDay <= (daynow - 1)) && (JesperCalm == FALSE))
		{
			B_StartOtherRoutine(VLK_446_Jesper,"Start");
			JesperCalm = TRUE;
		};
		if((MIS_JESPERMUSIC == LOG_Running) && (IS_INEXTREMO_PLAYING_DONE == FALSE) && ((MSINEXTREMO == TRUE) || (GUILDKILLKNOWNLOC == TRUE)))
		{
			MIS_JESPERMUSIC = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_JESPERMUSIC);
		};
		if((MIS_KILLIGNAZ == LOG_Running) && (Kapitel >= 5))
		{
			MIS_KILLIGNAZ = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_KILLIGNAZ);
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (PabloSpeakUp == TRUE) && (CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (PabloSpeakUpDay <= (DayNow - 1)))
		{
			CanTeachTownMaster = TRUE;
			MIS_PathFromDown = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
			B_LogEntry(TOPIC_PathFromDown,"Myslím, že je čas promluvit si s mistry.");
		};
		if(Wld_IsTime(21,15,23,0) && (Hagen_BringProof == TRUE) && (Kapitel <= 2) && (Npc_IsInState(VLK_4350_Priscila,ZS_Play_Lute) == TRUE) && (Npc_IsDead(VLK_4350_Priscila) == FALSE) && (CurrentLevel == NEWWORLD_ZEN) && (AbigailPlaySong == FALSE) && (PriscilaOnSc == TRUE) && (Npc_GetDistToWP(hero,"NW_PUFF_DANCE") < 400) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
		{
			bManaBar = 0;
			bHealthBar = 0;
			CamModeOn = TRUE;
			VLK_4350_Priscila.name[0] = "";
			Snd_Play("CS_ABIGAILSONG");
			Wld_SendTrigger("EVT_NADAJ_SONG");
			AbigailPlaySong = TRUE;
			Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);

			if(MIS_Andre_REDLIGHT != LOG_SUCCESS)
			{
				B_StartOtherRoutine(VLK_434_Borka,"Keira");
			};	

			AI_Teleport(VLK_434_Borka,"NW_CITY_HABOUR_PUFF_IN_07_09");		
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (AbigailPlaySong == TRUE) && (AbigailPlaySongDone == FALSE))
		{
			ConcertAbiTimer += 1;

			if(ConcertAbiTimer >= 196)
			{
				bManaBar = 1;
				bHealthBar = 1;
				CamModeOn = FALSE;
				VLK_4350_Priscila.name[0] = "Ayri";
				Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
				AbigailPlaySongDone = TRUE;
				ConcertAbiTimer = FALSE;

				if(MIS_Andre_REDLIGHT != LOG_SUCCESS)
				{
					B_StartOtherRoutine(VLK_434_Borka,"Start");
				};
	
				hero.exp = hero.exp + 1000;
				AI_NoticePrint(3000,4098,NAME_Addon_ConcertKeiraBonus);
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (CoragonGuestBack == FALSE) && (MartinSpeakUpDay != FALSE) && (MIS_CoragonFixBeer == LOG_Running) && (MartinSpeakUpDay <= (DayNow - 1)))
		{
			CreateInvItems(VLK_4201_Wirt,ITAR_Mil_L,1);
			AI_EquipArmor(VLK_4201_Wirt,ITAR_Mil_L);
			Npc_RemoveInvItems(VLK_4201_Wirt,ITAR_Barkeeper,1);
			B_StartOtherRoutine(VLK_4201_Wirt,"MilGuard");
			B_StartOtherRoutine(NOV_602_Ulf,"tavernedrink");
			B_StartOtherRoutine(VLK_440_Bartok,"Coragon");
			CoragonGuestBack = TRUE;		
			Wld_InsertNpc(VLK_6038_BUERGER,"NW_CORAGON_GUEST_01");
			Wld_InsertNpc(VLK_6039_BUERGER,"NW_CORAGON_GUEST_02");
			Wld_InsertNpc(VLK_6040_BUERGER,"NW_CORAGON_GUEST_03");
			Wld_InsertNpc(VLK_6041_BUERGER,"NW_CORAGON_GUEST_04");
			B_LogEntry(TOPIC_CoragonFixBeer,"Teoreticky by už Martin měl mít Coragonův problém vyřešený! Je čas jít do hospody a zeptat se ho.");
		};
		if(Wld_IsTime(0,0,4,0) && (MIS_LoaRomance == LOG_Success) && (LoaInLH == FALSE) && (LoaLover == TRUE) && (LoaLoverDay <= (DayNow - 1)))
		{
			B_StartOtherRoutine(SLD_10920_Loa,"Mayak");
			AI_Teleport(SLD_10920_Loa,"NW_LIGHTHOUSE_IN_16");
			LoaInLH = TRUE;
		};
		if(!Wld_IsTime(0,0,4,0) && (MIS_LoaRomance == LOG_Success) && (LoaInLH == TRUE) && (LoaTellInLH == FALSE) && (LoaAwayLH == FALSE))
		{
			B_StartOtherRoutine(SLD_10920_Loa,"Start");
			LoaAwayLH = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Wld_IsTime(20,0,5,0)) && (HorLightOn == FALSE))
		{
			Wld_SendTrigger("EVT_TOWNLIGHT");
			Wld_SendTrigger("EVT_INNOSFIRE");
			HorLightOn = TRUE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (Wld_IsTime(5,1,19,59)) && (HorLightOn == TRUE))
		{
			Wld_SendTrigger("EVT_TOWNLIGHT");
			Wld_SendTrigger("EVT_INNOSFIRE");
			HorLightOn = FALSE;
		};
	};
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		if((CurrentLevel == OLDWORLD_ZEN) && (MIS_BrutusBaby == LOG_Running) && (Kapitel < 3) && (BrutusBabyDay > 0) && (BrutusBabyDay < DayNow) && Wld_IsTime(20,0,23,59) && (BrutusGoPartyNever == FALSE) && (BrutusGoParty == FALSE))
		{
			BrutusGoParty = TRUE;
			B_LogEntry(TOPIC_BrutusBaby,"Myslím, že Milten už všechno připravil. Je čas jít za ním.");
			B_StartOtherRoutine(VLK_4100_Brutus,"BabyParty");
			B_StartOtherRoutine(PC_Mage_OW,"BabyParty");
			B_StartOtherRoutine(VLK_4101_Waffenknecht,"BabyParty");
			B_StartOtherRoutine(VLK_4102_Waffenknecht,"BabyParty");
		};
		if((CurrentLevel == OLDWORLD_ZEN) && (MIS_BrutusBaby == LOG_Running) && (BrutusRitualDone == FALSE) && (BrutusBabyDay > 0) && (BrutusBabyDay < (DayNow - 1)) && (BrutusGoPartyNever == FALSE))
		{
			BrutusGoPartyNever = TRUE;
			MIS_BrutusBaby = LOG_Success;
			Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Success);
			B_LogEntry(TOPIC_BrutusBaby,"Nešel jsem zjistit, jak si Milten s tím úkolem poradil. Doufám, že se mu to povedlo.");
			B_StartOtherRoutine(VLK_4100_Brutus,"Start");
			B_StartOtherRoutine(PC_Mage_OW,"Start");
			B_StartOtherRoutine(VLK_4101_Waffenknecht,"Start");
			B_StartOtherRoutine(VLK_4102_Waffenknecht,"Start");
		};
		if((CurrentLevel == OLDWORLD_ZEN) && (ParlafIsDead == FALSE) && (MIS_DobarOut == LOG_Running) && (ParlafFind == FALSE) && (DayParlafDead < (DayNow - 7)))
		{
			ParlafIsDead = TRUE;
			B_KillNpc(VLK_4107_Parlaf);
		};
		/*	if((MIS_OLDWORLD == FALSE) && (CurrentLevel == OLDWORLD_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
		if((CurrentLevel == OLDWORLD_ZEN) && (GomezSoulAway == TRUE) && (GomezSoulAwayDone == FALSE))
		{
			B_StartOtherRoutine(none_104_gomez,"TOT");
			AI_Teleport(none_104_gomez,"TOT");
			GomezSoulAwayDone = TRUE;
		};
	};
	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		if((MIS_OsairTrait == LOG_Running) && (HaniarWriteLetter == TRUE) && (HaniarWriteLetterDone == FALSE))
		{
			HaniarWriteLetterTick += 1;

			if(HaniarWriteLetterTick >= 60)
			{
				HaniarWriteLetterDone = TRUE;
				HaniarWriteLetterTick = FALSE;
			};
		};
	};
	if(CurrentLevel == HAOSWORLD_ZEN)
	{
		if((CurrentLevel == HAOSWORLD_ZEN) && (Npc_GetDistToWP(hero,"KRATUK") > 2000) && (PLACEKRATUKHEART == TRUE) && (CircleFightIlArah == TRUE) && (hero.attribute[ATR_HITPOINTS] > 0) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
		{
			if(tIlARahAura == FALSE)
			{
				Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",hero,hero,0,0,0,FALSE);
			};

			tIlARahAura += 1;
	
			if(tIlARahAura > 10)
			{
				tIlARahAura = FALSE;
			};

			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-500);
		};
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		if((MIS_Miss_Brother == LOG_Running) && (Npc_HasItems(hero,ItMi_IlesilSoul) >= 1) && (SoulKeeperIsDead == TRUE) && (IlesilSoulStoneIsUp == FALSE))
		{
			B_LogEntry(TOPIC_Miss_Brother,"U poraženého Strážce duší jsem objevil magickou sféru s Ile'Silovou duší. Myslím, že bych měl využít sílu tohoto místa a pokusit se ho osvobodit...");
			IlesilSoulStoneIsUp = TRUE;
		};
		if((IlesilIsDead == TRUE) && (LostValleyBonus == FALSE))
		{
			Snd_Play("LevelUp");
			B_GivePlayerXP(5000);
			LostValleyBonus = TRUE;
			RankPoints = RankPoints + 10;
			AI_NoticePrint(3000,4098,NAME_Addon_LostValleyBonus);
		};
		if(IlesilCount == TRUE)
		{
			IlesilCountTime += 1;

			if(IlesilCountTime > 30)
			{
				IlesilCount = FALSE;
				IlesilCountDone = TRUE;
				IlesilCountTime = FALSE;
			};
		};
		if((HintIlesilDone == TRUE) && (IlesilCountNextDone == FALSE))
		{
			IlesilCountTimeNext += 1;

			if(IlesilCountTimeNext > 60)
			{
				IlesilCountNextDone = TRUE;
				IlesilCountTimeNext = FALSE;
			};
		};
		if((Active4Boss == TRUE) && (Active4Boss_DONE == FALSE))
		{
			if(Npc_HasItems(hero,ItMi_ArahArEye) >= 1)
			{
				Npc_RemoveInvItems(hero,ItMi_ArahArEye,1);
			};

			Active4Boss_DONE = TRUE;
		};
	};
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if((CurrentLevel == ADDONWORLD_ZEN) && (MIS_OldElza == LOG_Running) && (SkipShipRepair == TRUE) && (SkipShipRepairDay < DayNow) && (SkipReadySailDrakia == FALSE))
		{
			Wld_SendTrigger("EVT_SHIP_DRAKIA");
			Npc_ExchangeRoutine(PIR_1355_Addon_Skip,"ReadyDrakia");
			AI_Teleport(PIR_1355_Addon_Skip,"ADW_TO_DRAKIA");
			SkipReadySailDrakia = TRUE;
		};
		if((CurrentLevel == ADDONWORLD_ZEN) && (Npc_HasItems(hero,ItMi_PortalRing_Addon) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_PortalRing_Addon,1);
		};
		if((CurrentLevel == ADDONWORLD_ZEN) && (Npc_GetDistToWP(WATERRITUALDEMON,"ADW_ADANOSTEMPEL_RAVEN_01") >= 1000) && (Npc_IsInState(WATERRITUALDEMON,ZS_MM_Attack) == TRUE))
		{
			AI_Teleport(WATERRITUALDEMON,"ADW_ADANOSTEMPEL_RAVEN_01");

			if(WATERRITUALDEMON.attribute[ATR_HITPOINTS] < WATERRITUALDEMON.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute(WATERRITUALDEMON,ATR_HITPOINTS,WATERRITUALDEMON.attribute[ATR_HITPOINTS_MAX]);
			};
		};
	};
	if(CurrentLevel == ORCTEMPEL_ZEN)
	{
		/*	if((ORCTEMPLEGATEOPENED == FALSE) && (CurrentLevel == ORCTEMPEL_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
	};
	if(CurrentLevel == PASHALWORLD_ZEN)
	{
		/*	if((EGEZARTDOOROPEN == FALSE) && (CurrentLevel == PASHALWORLD_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
		if((CurrentLevel == PASHALWORLD_ZEN) && (Npc_GetDistToWP(hero,"RITUAL_ROOM_08") < 2000) && (XranFregIsDead == FALSE) && (CaptureCheat == TRUE))
		{
			Wld_PlayEffect("SPELLFX_BLOODDEAD3",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(CurrentLevel == ORCOREMINE_ZEN) 
	{
		if((CurrentLevel == ORCOREMINE_ZEN) && (Npc_GetDistToWP(HaosDemon_Orcmine,"OM_ARENA_CENTER_03") >= 900) && (Npc_IsInState(HaosDemon_Orcmine,ZS_MM_Attack) == TRUE))
		{
			AI_Teleport(HaosDemon_Orcmine,"OM_ARENA_CENTER_03");

			if(HaosDemon_Orcmine.attribute[ATR_HITPOINTS] < HaosDemon_Orcmine.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute(HaosDemon_Orcmine,ATR_HITPOINTS,HaosDemon_Orcmine.attribute[ATR_HITPOINTS_MAX]);
			};
		};
		/*	if((CurrentLevel == ORCOREMINE_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE) && ((CanEnterOrcMine == FALSE) || (OrcMineClosed == TRUE))) 
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
	};
	if(CurrentLevel == PALADINFORT_ZEN)
	{
		/*	if((GRANTTOFORT == FALSE) && (CurrentLevel == PALADINFORT_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
		if((CurrentLevel == PALADINFORT_ZEN) && (FingersInFort == FALSE) && (MIS_FingersOpenDoor == LOG_Running) && (FingersCrack == TRUE) && (FingersIsDead == FALSE) && (FingersGoFort != FALSE) && (FingersGoFort < DayNow))
		{
			B_StartOtherRoutine(NONE_1801_Fingers,"Fort");
			AI_Teleport(NONE_1801_Fingers,"FT_FINGERS_02");
			FingersInFort = TRUE;
			NONE_1801_Fingers.guild = GIL_MIL;
			B_LogEntry(TOPIC_FingersOpenDoor,"Myslím, že Fingers by už touhle dobou měl být v pevnosti.");
		};
	};
	if(CurrentLevel == PSICAMP_ZEN) 
	{
		if((CurrentLevel == PSICAMP_ZEN) && (Npc_GetDistToWP(HaosDemon_Psicamp,"PSI_DEMONMAIN") >= 1900) && (Npc_IsInState(HaosDemon_Psicamp,ZS_MM_Attack) == TRUE))
		{
			AI_Teleport(HaosDemon_Psicamp,"PSI_DEMONMAIN");

			if(HaosDemon_Psicamp.attribute[ATR_HITPOINTS] < HaosDemon_Psicamp.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute(HaosDemon_Psicamp,ATR_HITPOINTS,HaosDemon_Psicamp.attribute[ATR_HITPOINTS_MAX]);
			};
		};
	};
	if(CurrentLevel == GUARDIANCHAMBERS_ZEN)
	{
		if((CurrentLevel == GUARDIANCHAMBERS_ZEN) && (DAGOTTELLALL == TRUE) && (hero.attribute[ATR_HITPOINTS] > 0) && ((SleeperStone == FALSE) || (NETBEKLEADME_STEP1DONE == FALSE)))
		{
			if((GuardChamberCount == 5) && (HaosComeWarn == FALSE))
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_WARN01");
				AI_PlayAni(hero,"T_INSANE");
				MIS_GUARDIANS = LOG_Running;
				Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
				B_LogEntry(TOPIC_GUARDIANS,"Co se to děje?! Tohle místo mě přivádí k šílenství! Celé moje tělo proniká strašlivá bolest a moji mysl zahaluje mrak neskonalé hrůzy. Myslím, že bych se měl vrátit, než bude příliš pozdě...");
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
				HaosComeWarn = TRUE;
			};
			if((GuardChamberCount == 20) || (GuardChamberCount == 40))
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_WARN01");
				AI_PlayAni(hero,"T_INSANE");
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
			}
			else if(GuardChamberCount >= 60)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_WARN01");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
				GuardChamberCount = FALSE;
			};
	
			GuardChamberCount = GuardChamberCount + 1;
		};
	};
	if(CurrentLevel == SHVALLEY_ZEN)
	{
		/*	if((UrTrallOkShv == FALSE) && (CurrentLevel == SHVALLEY_ZEN) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
		{
			AI_Wait(hero,9999);
			AI_PrintClr("Znelíbil ses bohům!",177,58,17);

			if(ATR_INTELLECT > 0)
			{
				ATR_INTELLECT -= 1;
				concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
				concatText = ConcatStrings(concatText," sekund...");
				AI_PrintClr(concatText,177,58,17);
			}
			else
			{
				ExitSession();
			};
		};	*/
	};
	if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
		if((CurrentLevel == ORCMOUNTAIN_ZEN) && (Npc_HasItems(hero,ItMi_BretMeet) >= 1) && (BretInsert == FALSE))
		{
			Wld_InsertNpc(SLD_853_Bret,"OZ_MAN_11");
			BretInsert = TRUE;
		};
		if((CurrentLevel == ORCMOUNTAIN_ZEN) && (MIS_PashalQuest == LOG_SUCCESS) && (DoorPasClosed == FALSE))
		{
			Wld_SendTrigger("EVT_OPENGORKMORKTEMPLEDOOR");
			DoorPasClosed = TRUE;
		};
	};

	//---------------------schetchik bonusov---------------------------------------------

	if((MIS_OldTeleports == FALSE) && ((Npc_GetDistToWP(hero,"TP_XARDAS") <= 500) || (Npc_GetDistToWP(hero,"TP_TOWN") <= 500) || (Npc_GetDistToWP(hero,"TP_TAVERNE") <= 500) || (Npc_GetDistToWP(hero,"TP_PSI") <= 500) || (Npc_GetDistToWP(hero,"TP_PASSOW") <= 500) || (Npc_GetDistToWP(hero,"TP_BIGFARM") <= 500) || (Npc_GetDistToWP(hero,"TP_KLOSTER") <= 500) || (Npc_GetDistToWP(hero,"TP_SAGITTA") <= 500) || (Npc_GetDistToWP(hero,"TP_HUNT") <= 500) || (Npc_GetDistToWP(hero,"TP_VINOCAVE") <= 500) || (Npc_GetDistToWP(hero,"TP_SUNCIRCLE") <= 500) || (Npc_GetDistToWP(hero,"TP_ADWRUINS") <= 500) || (Npc_GetDistToWP(hero,"TP_BLACKTROLL") <= 500)))
	{
		MIS_OldTeleports = LOG_Running;
		Log_CreateTopic(TOPIC_OldTeleports,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OldTeleports,LOG_Running);
		B_LogEntry(TOPIC_OldTeleports,"Našel jsem velice podivný druh kamene, celý pokrytý runami a nerozluštitelnými nápisy. Myslím, že stojí za to zeptat se na něj Xardase. Třeba o tom bude něco vědet.");
	};
	if(TreasureBonus >= 24)
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1500);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_TreasureBonus,IntToString(1500)),-1,60,FONT_NEWLEVEL,4);		
		TreasureBonus = FALSE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_TreasureBonus);
	};
	if((ATR_INTELLECT >= 100) && (WizardBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_WizardBonus,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		WizardBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_WizardBonus);
	};
	if((RhetorikSkillValue[1] >= 100) && (RhetorikBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		RhetorikBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_RhetorikBonus);
	};
	if((Npc_HasItems(hero,ItMi_Gold) >= 150000) && (WealthBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(500);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_WealthBonus,IntToString(500)),-1,60,FONT_NEWLEVEL,4);
		WealthBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_WealthBonus);
	};
	if((INNOSPRAYCOUNT >= 200) && (BELIARPRAYCOUNT >= 200) && (GodBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_GodsBonus,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		GodBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_GodsBonus);
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 100) && (hero.HitChance[NPC_TALENT_2H] >= 100) && (WeaponWieldBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(2000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_WarriorBonus,IntToString(2000)),-1,60,FONT_NEWLEVEL,4);
		WeaponWieldBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_WarriorBonus);
	};
	if((TalentCount_Alchemy[0] >= 100) && (AlchemyBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_TalentCount_Alchemy,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		AlchemyBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_TalentCount_Alchemy);
	};
	if((TalentCount_Rune[0] >= 100) && (RunesBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_TalentCount_Rune,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		RunesBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_TalentCount_Rune);
	};
	if((TalentCount_Smith[0] >= 100) && (SmithBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_TalentCount_Smith,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		SmithBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_TalentCount_Smith);
	};
	if((InnosBonus == FALSE) && (InnosBonusCount >= 250))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_InnosBonus,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		InnosBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_InnosBonus);
	};
	if((BeliarBonus == FALSE) && (BeliarBonusCount >= 100))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_BeliarBonus,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		BeliarBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_BeliarBonus);
	};
	if((MIS_PPL_FOR_TOWER == LOG_Running) && (KAPITELORCATC == TRUE))
	{
		MIS_PPL_FOR_TOWER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PPL_FOR_TOWER,LOG_SUCCESS);
		B_LogEntry(TOPIC_PPL_FOR_TOWER,"Zdá se, že můj tábor je už plně obsazený!");
	};
	if((CanBeatRodFistDo == TRUE) && (CanBeatRodFistDone == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_StreetFighterBonus,IntToString(1000)),-1,60,FONT_NEWLEVEL,4);
		CanBeatRodFistDone = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_StreetFighterBonus);
	};
	if((PickPocketBonus == FALSE) && (PickPocketBonusCount >= 100) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(500);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_PickPocketBonus,IntToString(500)),-1,60,FONT_NEWLEVEL,4);
		PickPocketBonus = TRUE;
		RankPoints = RankPoints + 15;
		THIEF_REPUTATION = THIEF_REPUTATION + 15;
		AI_NoticePrint(3000,4098,NAME_Addon_PickPocketBonus);
	};
	if((PickLockBonus == FALSE) && (TalentCount_PickLock[0] >= 100) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(500);
		PickLockBonus = TRUE;
		RankPoints = RankPoints + 15;
		THIEF_REPUTATION = THIEF_REPUTATION + 15;
		AI_NoticePrint(3000,4098,NAME_Addon_PickLockBonus);
	};
	if((TP_Count >= 28) && (TPBonus == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(3000);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_TPBonus,IntToString(3000)),-1,60,FONT_NEWLEVEL,4);
		TPBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_TPBonus);
	};
	if((SARG_DIGG >= 18) && (SargBonus == FALSE))
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(1500);
		//PrintScreen(PRINT_AchivmentUp,-1,YPOS_LevelUp,FONT_NEWLEVEL,4);
		//PrintScreen(ConcatStrings(NAME_Addon_SargBonus,IntToString(1500)),-1,60,FONT_NEWLEVEL,4);
		SargBonus = TRUE;
		RankPoints = RankPoints + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_SargBonus);
	};

	//-----------------permanentnyye proverki---------------------------------------

	if((MIS_WomanForSkip == LOG_Running) && (SonyaJobDone == FALSE) && (SonyaJob == TRUE) && (SonyaGoWithMeDay != FALSE) && (SonyaGoWithMeDay == (daynow - 3)))
	{
		B_LogEntry(TOPIC_WomanForSkip,"Uplynuly tři dny! Teď musím doprovodit Soniu zpátky k Bromorovi.");
		SonyaJobDone = TRUE;
	};
	if((MIS_MissOldFriend == LOG_Running) && (FinishSTLSD == TRUE))
	{
		MIS_MissOldFriend = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_MissOldFriend);
	};
	if((DragonGoldIsDead == TRUE) && (tmpKillGoldDrgFlag == FALSE))
	{
		tmpKillGoldDrg += 1;

		if(tmpKillGoldDrg >= 3)
		{
			B_KillNpc(none_103_dragon_gold);
			tmpKillGoldDrg = FALSE;
			tmpKillGoldDrgFlag = TRUE;
		};
	};
	if(ConvertToUndead == TRUE)
	{
		ConvertToUndeadTikc += 1;

		if(ConvertToUndeadTikc >= 120)
		{
			ConvertToUndead = FALSE;
			ConvertToUndeadTikc = FALSE;
		};
	};
	if(WayToIrat == TRUE)
	{
		Wld_ChangeLevel("DARKWORLD\DARKTEMPLE.ZEN","START_DARKTEMPLE");
		WayToIrat = FALSE;
	};
 	/*	if(CheckStatusHero[1] == TRUE)
	{
		AI_Wait(hero,9999);
		AI_PrintClr("Znelíbil ses bohům!",177,58,17);

		if(ATR_INTELLECT > 0)
		{
			ATR_INTELLECT -= 1;
			concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
			concatText = ConcatStrings(concatText," sekund...");
			AI_PrintClr(concatText,177,58,17);
		}
		else
		{
			ExitSession();
		};
	};
	if((hero.guild != CheckHeroGuild[1]) && (CheckHeroGuild[0] == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
	{
		AI_Wait(hero,9999);
		AI_PrintClr("Znelíbil ses bohům!",177,58,17);

		if(ATR_INTELLECT > 0)
		{
			ATR_INTELLECT -= 1;
			concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
			concatText = ConcatStrings(concatText," sekund...");
			AI_PrintClr(concatText,177,58,17);
		}
		else
		{
			ExitSession();
		};
	};
	if((HEROTRANS == FALSE) && (Mount_Up == FALSE) && (hero.id != FALSE) && (CaptureCheat == TRUE) && (TrailerMake == FALSE))
	{
		AI_Wait(hero,9999);
		AI_PrintClr("Znelíbil ses bohům!",177,58,17);

		if(ATR_INTELLECT > 0)
		{
			ATR_INTELLECT -= 1;
			concatText = ConcatStrings("Ukončení hry za ",IntToString(ATR_INTELLECT));
			concatText = ConcatStrings(concatText," sekund...");
			AI_PrintClr(concatText,177,58,17);
		}
		else
		{
			ExitSession();
		};
	};	*/
	if(RestPoolDay < Wld_GetDay())
	{
		RestPoolDay = Wld_GetDay();
		JointRest = FALSE;
		HolyRest = FALSE;
	};
	if(RestPool < 3)
	{
		if(RestPoolTimer >= 250)
		{
			RestPoolTimer = FALSE;

			if(RestPool < 3)
			{
				RestPool += 1;
			};
		}
		else
		{
			RestPoolTimer += 1;
		};
	}
	else
	{
		if(RestPoolTimer > 0)
		{
			RestPoolTimer = FALSE;
		};
	};
	if(DaySleepHour > 0)
	{
		if(SleepPoolTimer >= 250)
		{
			SleepPoolTimer = FALSE;

			if(DaySleepHour > 0)
			{
				DaySleepHour -= 1;
			};
		}
		else
		{
			SleepPoolTimer += 1;
		};
	}
	else
	{
		if(SleepPoolTimer > 0)
		{
			SleepPoolTimer = FALSE;
		};
	};
	if((NETBEKPOTIONUSED == TRUE) && (NETBEKPOTIONSTOP == FALSE))
	{
		TimerNetbekPot += 1;

		if((TimerNetbekPot >= 200) && (HEROTRANS == FALSE))
		{
			NETBEKPOTIONSTOP = TRUE;
			TimerNetbekPot = FALSE;
			hero.flags = NPC_FLAG_NONE;
			Snd_Play("MFX_MASSDEATH_CAST");
		};
	};
};

func void B_DamageCalcRunes()
{
	if(CountLearnSpell >= 1)
	{
		if(MageRobeIsUp == TRUE)
		{
			SPL_DAMAGE_BELIARSRUNE_01 = 150 + (ATR_INTELLECT / 2) + ((150 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_02 = 300 + (ATR_INTELLECT / 2) + ((300 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_03 = 450 + (ATR_INTELLECT / 2) + ((450 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_04 = 600 + (ATR_INTELLECT / 2) + ((600 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_05 = 750 + (ATR_INTELLECT / 2) + ((750 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_06 = 1000 + (ATR_INTELLECT / 2) + ((1000 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_SUPERBELIARSRUNE = 600 + (ATR_INTELLECT / 2) + ((600 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;

			SPL_DAMAGE_DESTROYGUARDIANS = 1000 + (ATR_INTELLECT / 4) + ((1000 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_DESTROYUNDEAD = 1000 + (ATR_INTELLECT / 2) + ((1000 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_BreathOfDeath = 750 + (ATR_INTELLECT / 2) + ((750 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;

			//--------------runy magov Ognya------------

			SPL_Damage_Firebolt = 70 + (ATR_INTELLECT / 2) + ((70 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_InstantFireball = 150 + (ATR_INTELLECT / 2) + ((150 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_InstantFireStorm = 250 + (ATR_INTELLECT / 2) + ((250 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_ChargeFireball = 250 + (ATR_INTELLECT / 2) + ((250 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_FireLight = 25 + (ATR_INTELLECT / 2) + ((25 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_Firestorm = 350 + (ATR_INTELLECT / 2) + ((350 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_Explosion = 400 + (ATR_INTELLECT / 2) + ((600 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_FireRain = 950 + (ATR_INTELLECT / 2) + ((950 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_FireMeteor = 750 + (ATR_INTELLECT / 2) + ((750 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_MasterOfDisaster = 600 + (ATR_INTELLECT / 2) + ((600 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_MAGICBURN_DAMAGE_PER_SEC = 50 + (ATR_INTELLECT / 2) + ((50 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 25 + (ATR_INTELLECT / 2) + ((25 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;

			//--------------runy magov Vody------------

			SPL_Damage_Zap = 40 + (ATR_INTELLECT / 2) + ((40 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Icebolt = 90 + (ATR_INTELLECT / 2) + ((90 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Icelance = 150 + (ATR_INTELLECT / 2) + ((150 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_ChargeZap = 175 + (ATR_INTELLECT / 2) + ((175 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_AdanosBall = 900 + (ATR_INTELLECT / 2) + ((900 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_LightningFlash = 500 + (ATR_INTELLECT / 2) + ((350 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Waterfist = 700 + (ATR_INTELLECT / 2) + ((500 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_ICEWAVE = 10 + (ATR_INTELLECT / 2) + ((10 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Geyser = 850 + (ATR_INTELLECT / 2) + ((750 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Thunderstorm = 900 + (ATR_INTELLECT / 2) + ((900 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_FREEZE_DAMAGE = 5 + (ATR_INTELLECT / 2) + ((5 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;

			//--------------runy Guru------------

			SPL_DAMAGE_BERZERK = 50 + ATR_INTELLECT + ((50 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_Damage_Windfist = 125 + ATR_INTELLECT + ((125 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_Whirlwind_DAMAGE = 250 + ATR_INTELLECT + ((250 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_DAMAGE_Acid = 350 + ATR_INTELLECT + ((350 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_DAMAGE_GuruWrath = 500 + ATR_INTELLECT + ((500 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_DAMAGE_Quake = 800 + ATR_INTELLECT + ((800 + ATR_INTELLECT) * CountLearnSpell) / 100;
			SPL_Damage_Extricate = 150 + ATR_INTELLECT + ((150 + ATR_INTELLECT) * CountLearnSpell) / 100;

			//--------------runy Nekromantov------------

			SPL_DAMAGE_Deathbolt = 80 + (ATR_INTELLECT / 2) + ((80 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_Lacerate = 150 + (ATR_INTELLECT / 2) + ((150 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Swarm_Damage = 25 + (ATR_INTELLECT / 4) + ((25 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Energyball = 350 + (ATR_INTELLECT / 2) + ((350 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Deathball = 500 + (ATR_INTELLECT / 2) + ((500 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_MassDeath = 1000 + (ATR_INTELLECT / 2) + ((1000 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
			SPL_Damage_Skull = 850 + (ATR_INTELLECT / 2) + ((850 + (ATR_INTELLECT / 2)) * CountLearnSpell) / 100;
		}
		else
		{
			SPL_DAMAGE_BELIARSRUNE_01 = 150 + (ATR_INTELLECT / 4) + ((150 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_02 = 300 + (ATR_INTELLECT / 4) + ((300 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_03 = 450 + (ATR_INTELLECT / 4) + ((450 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_04 = 600 + (ATR_INTELLECT / 4) + ((600 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_05 = 750 + (ATR_INTELLECT / 4) + ((750 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_BELIARSRUNE_06 = 1000 + (ATR_INTELLECT / 4) + ((1000 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_SUPERBELIARSRUNE = 600 + (ATR_INTELLECT / 4) + ((600 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;

			SPL_DAMAGE_DESTROYGUARDIANS = 1000 + (ATR_INTELLECT / 4) + ((1000 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_DESTROYUNDEAD = 1000 + (ATR_INTELLECT / 4) + ((1000 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_BreathOfDeath = 750 + (ATR_INTELLECT / 4) + ((750 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;

			//--------------runy magov Ognya------------

			SPL_Damage_Firebolt = 70 + (ATR_INTELLECT / 4) + ((70 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_InstantFireball = 150 + (ATR_INTELLECT / 4) + ((150 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_InstantFireStorm = 250 + (ATR_INTELLECT / 4) + ((250 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_ChargeFireball = 250 + (ATR_INTELLECT / 4) + ((250 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_FireLight = 25 + (ATR_INTELLECT / 4) + ((25 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Firestorm = 350 + (ATR_INTELLECT / 4) + ((350 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Explosion = 400 + (ATR_INTELLECT / 4) + ((600 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_FireRain = 950 + (ATR_INTELLECT / 4) + ((950 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_FireMeteor = 750 + (ATR_INTELLECT / 4) + ((750 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_MasterOfDisaster = 600 + (ATR_INTELLECT / 4) + ((600 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_MAGICBURN_DAMAGE_PER_SEC = 50 + (ATR_INTELLECT / 4) + ((50 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 25 + (ATR_INTELLECT / 4) + ((25 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;

			//--------------runy magov Vody------------

			SPL_Damage_Zap = 40 + (ATR_INTELLECT / 4) + ((40 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Icebolt = 90 + (ATR_INTELLECT / 4) + ((90 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Icelance = 150 + (ATR_INTELLECT / 4) + ((150 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_ChargeZap = 175 + (ATR_INTELLECT / 4) + ((175 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_AdanosBall = 900 + (ATR_INTELLECT / 4) + ((900 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_LightningFlash = 500 + (ATR_INTELLECT / 4) + ((350 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Waterfist = 700 + (ATR_INTELLECT / 4) + ((500 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_ICEWAVE = 10 + (ATR_INTELLECT / 4) + ((10 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Geyser = 850 + (ATR_INTELLECT / 4) + ((750 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Thunderstorm = 900 + (ATR_INTELLECT / 4) + ((900 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_FREEZE_DAMAGE = 5 + (ATR_INTELLECT / 4) + ((5 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;

			//--------------runy Guru------------

			SPL_DAMAGE_BERZERK = 50 + (ATR_INTELLECT / 4) + ((50 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Windfist = 125 + (ATR_INTELLECT / 4) + ((125 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Whirlwind_DAMAGE = 250 + (ATR_INTELLECT / 4) + ((250 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Acid = 350 + (ATR_INTELLECT / 4) + ((350 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_GuruWrath = 500 + (ATR_INTELLECT / 4) + ((500 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Quake = 800 + (ATR_INTELLECT / 4) + ((800 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Extricate = 150 + (ATR_INTELLECT / 4) + ((150 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;

			//--------------runy Nekromantov------------

			SPL_DAMAGE_Deathbolt = 80 + (ATR_INTELLECT / 4) + ((80 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Lacerate = 150 + (ATR_INTELLECT / 4) + ((150 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Swarm_Damage = 25 + (ATR_INTELLECT / 4) + ((25 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Energyball = 350 + (ATR_INTELLECT / 4) + ((350 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_DAMAGE_Deathball = 500 + (ATR_INTELLECT / 4) + ((500 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_MassDeath = 1000 + (ATR_INTELLECT / 4) + ((1000 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
			SPL_Damage_Skull = 850 + (ATR_INTELLECT / 4) + ((850 + (ATR_INTELLECT / 4)) * CountLearnSpell) / 100;
		};
	}
	else
	{
		if(MageRobeIsUp == TRUE)
		{
			SPL_DAMAGE_BELIARSRUNE_01 = 150 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_BELIARSRUNE_02 = 300 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_BELIARSRUNE_03 = 450 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_BELIARSRUNE_04 = 600 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_BELIARSRUNE_05 = 750 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_BELIARSRUNE_06 = 1000 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_SUPERBELIARSRUNE = 600 + (ATR_INTELLECT / 2);

			SPL_DAMAGE_DESTROYGUARDIANS = 1000 + (ATR_INTELLECT / 4);
			SPL_Damage_DESTROYUNDEAD = 1000 + (ATR_INTELLECT / 2);
			SPL_Damage_BreathOfDeath = 750 + (ATR_INTELLECT / 2);

			//--------------runy magov Ognya------------

			SPL_Damage_Firebolt = 70 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_InstantFireball = 150 + (ATR_INTELLECT / 2);
			SPL_Damage_InstantFireStorm = 250 + (ATR_INTELLECT / 2);
			SPL_Damage_ChargeFireball = 250 + (ATR_INTELLECT / 2);
			SPL_Damage_FireLight = 25 + (ATR_INTELLECT / 4);
			SPL_Damage_Firestorm = 350 + (ATR_INTELLECT / 2);
			SPL_Damage_Explosion = 400 + (ATR_INTELLECT / 2);
			SPL_Damage_FireRain = 950 + (ATR_INTELLECT / 2);
			SPL_Damage_FireMeteor = 750 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_MasterOfDisaster = 600 + (ATR_INTELLECT / 2);
			SPL_MAGICBURN_DAMAGE_PER_SEC = 50 + (ATR_INTELLECT / 2);
			SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 25 + (ATR_INTELLECT / 2);

			//--------------runy magov Vody------------

			SPL_Damage_Zap = 40 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Icebolt = 90 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Icelance = 150 + (ATR_INTELLECT / 2);
			SPL_Damage_ChargeZap = 175 + (ATR_INTELLECT / 2);
			SPL_Damage_AdanosBall = 900 + (ATR_INTELLECT / 2);
			SPL_Damage_LightningFlash = 500 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Waterfist = 700 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_ICEWAVE = 10 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Geyser = 850 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Thunderstorm = 900 + (ATR_INTELLECT / 2);
			SPL_FREEZE_DAMAGE = 5 + (ATR_INTELLECT / 2);

			//--------------runy Guru------------
	
			SPL_DAMAGE_BERZERK = 50 + ATR_INTELLECT;
			SPL_Damage_Windfist = 125 + ATR_INTELLECT;
			SPL_Whirlwind_DAMAGE = 250 + ATR_INTELLECT;
			SPL_DAMAGE_Acid = 350 + ATR_INTELLECT;
			SPL_DAMAGE_GuruWrath = 500 + ATR_INTELLECT;
			SPL_DAMAGE_Quake = 800 + ATR_INTELLECT;
			SPL_Damage_Extricate = 150 + ATR_INTELLECT;

			//--------------runy Nekromantov------------

			SPL_DAMAGE_Deathbolt = 80 + (ATR_INTELLECT / 2);
			SPL_Damage_Lacerate = 150 + (ATR_INTELLECT / 2);
			SPL_Swarm_Damage = 25 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Energyball = 350 + (ATR_INTELLECT / 2);
			SPL_DAMAGE_Deathball = 500 + (ATR_INTELLECT / 2);
			SPL_Damage_MassDeath = 1000 + (ATR_INTELLECT / 2);
			SPL_Damage_Skull = 850 + (ATR_INTELLECT / 2);
		}
		else
		{
			SPL_DAMAGE_BELIARSRUNE_01 = 150 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_BELIARSRUNE_02 = 300 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_BELIARSRUNE_03 = 450 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_BELIARSRUNE_04 = 600 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_BELIARSRUNE_05 = 750 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_BELIARSRUNE_06 = 1000 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_SUPERBELIARSRUNE = 600 + (ATR_INTELLECT / 4);

			SPL_DAMAGE_DESTROYGUARDIANS = 1000 + (ATR_INTELLECT / 4);
			SPL_Damage_DESTROYUNDEAD = 1000 + (ATR_INTELLECT / 4);
			SPL_Damage_BreathOfDeath = 750 + (ATR_INTELLECT / 4);

			//--------------runy magov Ognya------------

			SPL_Damage_Firebolt = 70 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_InstantFireball = 150 + (ATR_INTELLECT / 4);
			SPL_Damage_InstantFireStorm = 250 + (ATR_INTELLECT / 4);
			SPL_Damage_ChargeFireball = 250 + (ATR_INTELLECT / 4);
			SPL_Damage_FireLight = 25 + (ATR_INTELLECT / 4);
			SPL_Damage_Firestorm = 350 + (ATR_INTELLECT / 4);
			SPL_Damage_Explosion = 400 + (ATR_INTELLECT / 4);
			SPL_Damage_FireRain = 950 + (ATR_INTELLECT / 4);
			SPL_Damage_FireMeteor = 750 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_MasterOfDisaster = 600 + (ATR_INTELLECT / 4);
			SPL_MAGICBURN_DAMAGE_PER_SEC = 50 + (ATR_INTELLECT / 4);
			SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 25 + (ATR_INTELLECT / 4);

			//--------------runy magov Vody------------

			SPL_Damage_Zap = 40 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Icebolt = 90 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Icelance = 150 + (ATR_INTELLECT / 4);
			SPL_Damage_ChargeZap = 175 + (ATR_INTELLECT / 4);
			SPL_Damage_AdanosBall = 900 + (ATR_INTELLECT / 4);
			SPL_Damage_LightningFlash = 500 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Waterfist = 700 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_ICEWAVE = 10 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Geyser = 850 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Thunderstorm = 900 + (ATR_INTELLECT / 4);
			SPL_FREEZE_DAMAGE = 5 + (ATR_INTELLECT / 4);
	
			//--------------runy Guru------------

			SPL_DAMAGE_BERZERK = 50 + (ATR_INTELLECT / 4);
			SPL_Damage_Windfist = 125 + (ATR_INTELLECT / 4);
			SPL_Whirlwind_DAMAGE = 250 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Acid = 350 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_GuruWrath = 500 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Quake = 800 + (ATR_INTELLECT / 4);
			SPL_Damage_Extricate = 150 + (ATR_INTELLECT / 4);

			//--------------runy Nekromantov------------
	
			SPL_DAMAGE_Deathbolt = 80 + (ATR_INTELLECT / 4);
			SPL_Damage_Lacerate = 150 + (ATR_INTELLECT / 4);
			SPL_Swarm_Damage = 25 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Energyball = 350 + (ATR_INTELLECT / 4);
			SPL_DAMAGE_Deathball = 500 + (ATR_INTELLECT / 4);
			SPL_Damage_MassDeath = 1000 + (ATR_INTELLECT / 4);
			SPL_Damage_Skull = 850 + (ATR_INTELLECT / 4);
		};
	};
};

func void B_DamageBonusDamage()
{
	var string concatText;
	var C_Item PotionBlade;
	var C_Item SharpBlade;

	if(Npc_IsInFightMode(hero,FMODE_MELEE))
	{
		PotionBlade = Npc_GetReadiedWeapon(hero);

		if((Hlp_GetInstanceID(PotionBlade) == PotionBladeID) && (PotionBlade.damage[DAM_INDEX_MAGIC] == TRUE))
		{		
			if(PotionBlade.weight == FALSE)
			{
				PotionBlade.weight = TRUE;
				concatText = PotionBlade.visual_change;
				concatText = ConcatStrings(concatText," | Otrávená");
				PotionBlade.visual_change = concatText;
				PotionBlade.text[4] = concatText;
			};
		};
	}
	else
	{
		PotionBlade = Npc_GetEquippedMeleeWeapon(hero);

		if((Hlp_GetInstanceID(PotionBlade) == PotionBladeID) && (PotionBlade.damage[DAM_INDEX_MAGIC] == TRUE))
		{		
			if(PotionBlade.weight == FALSE)
			{
				PotionBlade.weight = TRUE;
				concatText = PotionBlade.visual_change;
				concatText = ConcatStrings(concatText," | Otrávená");
				PotionBlade.visual_change = concatText;
				PotionBlade.text[4] = concatText;
			};
		};
	};
	if(Npc_IsInFightMode(hero,FMODE_MELEE))
	{
		SharpBlade = Npc_GetReadiedWeapon(hero);

		if((Hlp_GetInstanceID(SharpBlade) == SharpBladeID) && (SharpBlade.damage[DAM_INDEX_FIRE] == TRUE))
		{		
			if(SharpBlade.hp == FALSE)
			{
				SharpBlade.hp = TRUE;
				SharpBlade.damage[DAM_INDEX_EDGE] = SharpBlade.damage[DAM_INDEX_EDGE] + ((SharpBlade.damage[DAM_INDEX_EDGE] * 10) / 100);
				SharpBlade.count[1] = SharpBlade.damage[DAM_INDEX_EDGE];
				concatText = SharpBlade.visual_change;
				concatText = ConcatStrings(concatText," | Otrávená");
				SharpBlade.visual_change = concatText;
				SharpBlade.text[4] = concatText;
			};
		};
	}
	else
	{
		SharpBlade = Npc_GetEquippedMeleeWeapon(hero);

		if((Hlp_GetInstanceID(SharpBlade) == SharpBladeID) && (SharpBlade.damage[DAM_INDEX_FIRE] == TRUE))
		{		
			if(SharpBlade.hp == FALSE)
			{
				SharpBlade.hp = TRUE;
				SharpBlade.damage[DAM_INDEX_EDGE] = SharpBlade.damage[DAM_INDEX_EDGE] + ((SharpBlade.damage[DAM_INDEX_EDGE] * 10) / 100);
				SharpBlade.count[1] = SharpBlade.damage[DAM_INDEX_EDGE];
				concatText = SharpBlade.visual_change;
				concatText = ConcatStrings(concatText," | Otrávená");
				SharpBlade.visual_change = concatText;
				SharpBlade.text[4] = concatText;
			};
		};
	};
};

func void b_initdamage()
{
};

func void B_LOC_TeleportMe_NW()
{
	if(CurrentLevel != NEWWORLD_ZEN)
	{
		if(LOC_XARDAS_TP_OK == TRUE)
		{
			LOC_XARDAS_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_XARDAS");
		}
		else if(LOC_TOWN_TP_OK == TRUE)
		{
			LOC_TOWN_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_TOWN");
		}			
		else if(LOC_TAVERNE_TP_OK == TRUE)
		{
			LOC_TAVERNE_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_TAVERNE");
		}	
		else if(LOC_PSI_TP_OK == TRUE)
		{
			LOC_PSI_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_PSI");
		}
		else if(LOC_PASSOW_TP_OK == TRUE)
		{
			LOC_PASSOW_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_PASSOW");
		}
		else if(LOC_BIGFARM_TP_OK == TRUE)
		{
			LOC_BIGFARM_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_BIGFARM");
		}
		else if(LOC_KLOSTER_TP_OK == TRUE)
		{
			LOC_KLOSTER_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_KLOSTER");
		}
		else if(LOC_SAGITTA_TP_OK == TRUE)
		{
			LOC_SAGITTA_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_SAGITTA");
		}
		else if(LOC_HUNT_TP_OK == TRUE)
		{
			LOC_HUNT_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_HUNT");
		}
		else if(LOC_VINOCAVE_TP_OK == TRUE)
		{
			LOC_VINOCAVE_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_VINOCAVE");
		}
		else if(LOC_SUNCIRCLE_TP_OK == TRUE)
		{
			LOC_SUNCIRCLE_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_SUNCIRCLE");
		}
		else if(LOC_ADWRUINS_TP_OK == TRUE)
		{
			LOC_ADWRUINS_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_ADWRUINS");
		}
		else if(LOC_BLACKTROLL_TP_OK == TRUE)
		{
			LOC_BLACKTROLL_TP_OK = FALSE;
			Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN","TP_BLACKTROLL");
		};
	};
};

func void B_LOC_TeleportMe_OW()
{
	if(CurrentLevel != OLDWORLD_ZEN)
	{
		if(LOC_CASTLE_TP_OK == TRUE)
		{
			LOC_CASTLE_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_CASTLE");
		}
		else if(LOC_ICE_TP_OK == TRUE)
		{
			LOC_ICE_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_ICE");
		}			
		else if(LOC_SKLEP_TP_OK == TRUE)
		{
			LOC_SKLEP_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_SKLEP");
		}	
		else if(LOC_DARKTOWER_TP_OK == TRUE)
		{
			LOC_DARKTOWER_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_DARKTOWER");
		}	
		else if(LOC_OLDFORT_TP_OK == TRUE)
		{
			LOC_OLDFORT_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_OLDFORT");
		}	
		else if(LOC_OLDPSI_TP_OK == TRUE)
		{
			LOC_OLDPSI_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_OLDPSI");
		}	
		else if(LOC_NETBEK_TP_OK == TRUE)
		{
			LOC_NETBEK_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_NETBEK");
		}	
		else if(LOC_PASSNW_TP_OK == TRUE)
		{
			LOC_PASSNW_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN","TP_PASSNW");
		};
	};
};

func void B_LOC_TeleportMe_AV()
{
	if(CurrentLevel != ADANOSVALLEY_ZEN)
	{
		if(LOC_TEARHRAM_TP_OK == TRUE)
		{
			LOC_TEARHRAM_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADANOSVALLEY.ZEN","TP_TEARHRAM");
		}
		else if(LOC_PYRAMIDE_TP_OK == TRUE)
		{
			LOC_PYRAMIDE_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADANOSVALLEY.ZEN","TP_PYRAMIDE");
		}
		else if(LOC_PASSAV_TP_OK == TRUE)
		{
			LOC_PASSAV_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADANOSVALLEY.ZEN","TP_PASSAV");
		}
		else if(LOC_LIFECIRCLE_TP_OK == TRUE)
		{
			LOC_LIFECIRCLE_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADANOSVALLEY.ZEN","TP_LIFECIRCLE");
		}
		else if(LOC_COMPLEX_TP_OK == TRUE)
		{
			LOC_COMPLEX_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADANOSVALLEY.ZEN","TP_COMPLEX");
		};
	};
};

func void B_LOC_TeleportMe_OZ()
{
	if(CurrentLevel != ORCMOUNTAIN_ZEN)
	{
		if(LOC_ORCMOUNTAIN_TP_OK == TRUE)
		{
			LOC_ORCMOUNTAIN_TP_OK = FALSE;
			Wld_ChangeLevel("OLDWORLD\ORCMOUNTAIN.ZEN","TP_ORCMOUNTAIN");
		};
	};
};

func void B_LOC_TeleportMe_ADW()
{
	if(CurrentLevel != ADDONWORLD_ZEN)
	{
		if(LOC_ADW_TP_OK == TRUE)
		{
			LOC_ADW_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADDONWORLD.ZEN","TP_ADW");
		}
		else if(LOC_PIRATCAMP_TP_OK == TRUE)
		{
			LOC_PIRATCAMP_TP_OK = FALSE;
			Wld_ChangeLevel("ADDON\ADDONWORLD.ZEN","TP_PIRATCAMP");
		};
	};
};

func void B_TeleportMe_NW()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(XARDAS_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_XARDAS");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			XARDAS_TP_OK = FALSE;
		}
		else if(TOWN_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_TOWN");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			TOWN_TP_OK = FALSE;
		}			
		else if(TAVERNE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_TAVERNE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			TAVERNE_TP_OK = FALSE;
		}	
		else if(PSI_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PSI");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PSI_TP_OK = FALSE;
		}
		else if(PASSOW_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PASSOW");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PASSOW_TP_OK = FALSE;
		}
		else if(BIGFARM_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_BIGFARM");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			BIGFARM_TP_OK = FALSE;
		}
		else if(KLOSTER_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_KLOSTER");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			KLOSTER_TP_OK = FALSE;
		}
		else if(SAGITTA_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_SAGITTA");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
			SAGITTA_TP_OK = FALSE;
		}
		else if(HUNT_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_HUNT");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			HUNT_TP_OK = FALSE;
		}
		else if(VINOCAVE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_VINOCAVE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			VINOCAVE_TP_OK = FALSE;
		}
		else if(SUNCIRCLE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_SUNCIRCLE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			SUNCIRCLE_TP_OK = FALSE;
		}
		else if(ADWRUINS_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_ADWRUINS");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			ADWRUINS_TP_OK = FALSE;
		}
		else if(BLACKTROLL_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_BLACKTROLL");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			BLACKTROLL_TP_OK = FALSE;
		};
	};
};

func void B_TeleportMe_OW()
{
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(CASTLE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_CASTLE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			CASTLE_TP_OK = FALSE;
		}
		else if(ICE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_ICE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			ICE_TP_OK = FALSE;
		}			
		else if(SKLEP_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_SKLEP");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			SKLEP_TP_OK = FALSE;
		}	
		else if(DARKTOWER_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_DARKTOWER");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			DARKTOWER_TP_OK = FALSE;
		}	
		else if(OLDFORT_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_OLDFORT");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			OLDFORT_TP_OK = FALSE;
		}	
		else if(OLDPSI_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_OLDPSI");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			OLDPSI_TP_OK = FALSE;
		}	
		else if(NETBEK_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_NETBEK");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			NETBEK_TP_OK = FALSE;
		}	
		else if(PASSNW_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PASSNW");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PASSNW_TP_OK = FALSE;
		};
	};
};

func void B_TeleportMe_AV()
{
	if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
		if(TEARHRAM_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_TEARHRAM");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			TEARHRAM_TP_OK = FALSE;
		}
		else if(PYRAMIDE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PYRAMIDE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PYRAMIDE_TP_OK = FALSE;
		}
		else if(PASSAV_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PASSAV");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PASSAV_TP_OK = FALSE;
		}
		else if(LIFECIRCLE_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_LIFECIRCLE");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			LIFECIRCLE_TP_OK = FALSE;
		}
		else if(COMPLEX_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_COMPLEX");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			COMPLEX_TP_OK = FALSE;
		};
	};
};

func void B_TeleportMe_OZ()
{
	if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
		if(ORCMOUNTAIN_TP_OK == TRUE)
		{
			if((AvabulIsDead == FALSE) && (AvabulWar == TRUE))
			{
				B_Say(hero,hero,"$DONTKNOW");
				Snd_Play("DEM_AMBIENT");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			}
			else
			{
				AI_Teleport(hero,"TP_ORCMOUNTAIN");
				Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
				Snd_Play("MFX_SLEEP_CAST");
			};

			ORCMOUNTAIN_TP_OK = FALSE;
		};
	};
};

func void B_TeleportMe_ADW()
{
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(ADW_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_ADW");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			ADW_TP_OK = FALSE;
		}
		else if(PIRATCAMP_TP_OK == TRUE)
		{
			AI_Teleport(hero,"TP_PIRATCAMP");
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_SLEEP_CAST");
			PIRATCAMP_TP_OK = FALSE;
		};
	};
};

func void B_InitMunitionLoad()
{
	var C_Item weapon;

	if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_PoisonArrow == TRUE)
			{
				weapon.munition = ItRw_PoisonArrow;
				Use_Arrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
			}
			else if(Use_Arrow == TRUE)
			{
				weapon.munition = ItRw_Arrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
			}
			else if(Use_FireArrow == TRUE)
			{
				weapon.munition = ItRw_Addon_FireArrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_Arrow = FALSE;
				Use_MagicArrow = FALSE;
			}
			else if(Use_MagicArrow == TRUE)
			{
				weapon.munition = ItRw_Addon_MagicArrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_Arrow = FALSE;
				Use_FireArrow = FALSE;
			}
			else if(Use_HolyArrow == TRUE)
			{
				weapon.munition = ItRw_HolyArrow;
				Use_PoisonArrow = FALSE;
				Use_MagicArrow = FALSE;
				Use_Arrow = FALSE;
				Use_FireArrow = FALSE;
			}
			else
			{
				weapon.munition = ItRw_Arrow;
				Use_Arrow = TRUE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
			};
		};
		if((Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
		{
			if(Use_Bolt == TRUE)
			{
				weapon.munition = ItRw_Bolt;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = FALSE;
			}
			else if(Use_MagicBolt == TRUE)
			{
				weapon.munition = ItRw_Addon_MagicBolt;
				Use_Bolt = FALSE;
				Use_HolyBolt = FALSE;
			}
			else if(Use_HolyBolt == TRUE)
			{
				weapon.munition = ItRw_HolyBolt;
				Use_Bolt = FALSE;
				Use_MagicBolt = FALSE;
			}
			else
			{
				weapon.munition = ItRw_Bolt;
				Use_Bolt = TRUE;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = FALSE;
			};
		};
	};
};

func void B_CheckTrophy()
{
	if(Trophy_StoneClaw == TRUE)
	{
		if(Trophy_StoneClawIsUp == FALSE)
		{
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 5;
			Trophy_StoneClawIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_StoneClawIsUp == TRUE)
		{
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] - 5;
			Trophy_StoneClawIsUp = FALSE;
		};
	};
	if(Trophy_BlackTeeth == TRUE)
	{
		if(Trophy_BlackTeethIsUp == FALSE)
		{
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 5;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 5;
			Trophy_BlackTeethIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_BlackTeethIsUp == TRUE)
		{
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] - 5;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] - 5;
			Trophy_BlackTeethIsUp = FALSE;
		};
	};
	if(Trophy_IshiCurrat == TRUE)
	{
		if(Trophy_IshiCurratIsUp == FALSE)
		{
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + 5;
			Trophy_IshiCurratIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_IshiCurratIsUp == TRUE)
		{
			hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] - 5;
			Trophy_IshiCurratIsUp = FALSE;
		};
	};
	if(Trophy_UturTrollHorn == TRUE)
	{
		if(Trophy_UturTrollHornIsUp == FALSE)
		{
			B_AddFightSkill(hero,NPC_TALENT_2H,5);
			Trophy_UturTrollHornIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_UturTrollHornIsUp == TRUE)
		{
			B_AddFightSkill(hero,NPC_TALENT_2H,-5);
			Trophy_UturTrollHornIsUp = FALSE;
		};
	};
	if(Trophy_CaracustPlate == TRUE)
	{
		if(Trophy_CaracustPlateIsUp == FALSE)
		{
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + 15;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + 15;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + 15;
			Trophy_CaracustPlateIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_CaracustPlateIsUp == TRUE)
		{
			hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] - 15;
			hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] - 15;
			hero.protection[PROT_POINT] = hero.protection[PROT_POINT] - 15;
			Trophy_CaracustPlateIsUp = FALSE;
		};
	};
	if(Trophy_MuritanTooth == TRUE)
	{
		if(Trophy_MuritanToothIsUp == FALSE)
		{
			Trophy_MuritanToothIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_MuritanToothIsUp == TRUE)
		{
			Trophy_MuritanToothIsUp = FALSE;
		};
	};
	if(Trophy_LURKERLEADER == TRUE)
	{
		if(Trophy_LURKERLEADERIsUp == FALSE)
		{
			B_AddFightSkill(hero,NPC_TALENT_1H,5);
			Trophy_LURKERLEADERIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_LURKERLEADERIsUp == TRUE)
		{
			B_AddFightSkill(hero,NPC_TALENT_1H,-5);
			Trophy_LURKERLEADERIsUp = FALSE;
		};
	};
	if(Trophy_SERDCEGARPII == TRUE)
	{
		if(Trophy_SERDCEGARPIIIsUp == FALSE)
		{
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 5;
			Trophy_SERDCEGARPIIIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_SERDCEGARPIIIsUp == TRUE)
		{
			hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - 5;
			Trophy_SERDCEGARPIIIsUp = FALSE;
		};
	};
	if(Trophy_Skalozub == TRUE)
	{
		if(Trophy_SkalozubIsUp == FALSE)
		{
			Trophy_SkalozubIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_SkalozubIsUp == TRUE)
		{
			Trophy_SkalozubIsUp = FALSE;
		};
	};
	if(Trophy_STONEPUMAPIECE == TRUE)
	{
		if(Trophy_STONEPUMAPIECEIsUp == FALSE)
		{
			B_AddFightSkill(hero,NPC_TALENT_BOW,5);
			Trophy_STONEPUMAPIECEIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_STONEPUMAPIECEIsUp == TRUE)
		{
			B_AddFightSkill(hero,NPC_TALENT_BOW,-5);
			Trophy_STONEPUMAPIECEIsUp = FALSE;
		};
	};
	if(Trophy_DragonSkull == TRUE)
	{
		if(Trophy_DragonSkullIsUp == FALSE)
		{
			Trophy_DragonSkullIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_DragonSkullIsUp == TRUE)
		{
			Trophy_DragonSkullIsUp = FALSE;
		};
	};
	if(Trophy_UrTrallHead == TRUE)
	{
		if(Trophy_UrTrallHeadIsUp == FALSE)
		{
			Trophy_UrTrallHeadIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_UrTrallHeadIsUp == TRUE)
		{
			Trophy_UrTrallHeadIsUp = FALSE;
		};
	};
	if(Trophy_WhiteTrollSkull == TRUE)
	{
		if(Trophy_WhiteTrollSkullIsUp == FALSE)
		{
			hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 200;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 200;
			Trophy_WhiteTrollSkullIsUp = TRUE;
		};
	}
	else
	{
		if(Trophy_WhiteTrollSkullIsUp == TRUE)
		{
			hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - 200;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 200;
			Trophy_WhiteTrollSkullIsUp = FALSE;
		};
	};
};

var int CountTiks;
var int CountTiksSH;
var int CountTiksGlb_Stam;
var int CountTiks_2x2_L;
var int CountTiksSH_L;
var int CountTiks_Staff;
var int CountTiks_OrcWeapon;
var int CountTiks_Swim;
var int CountTiks_Stam;
var int CountTiks_StamFar;
var int ShieldTiks_Stam;
var int JumpDone;
var int HeroDrunkCount;
var int IsNpcReactTime;
var int TempMagicCircle;
var int TempheroLevel;
var int TempTransTime;
var int ObsessedTick;
var int FocusIsDone;
var int TempSwimTick;
var int RainDayCount;
var int SunDownDayCount;
var int SunRiseDayCount;
var int PashalSVM;
var int FixSteal;

func void Hero_poisoned()
{
	var int Poison_Lvls;
	var int Health_Lvls;
	var int Health_RegLvl;
	var int Mana_RegLvl;
	var C_Npc npc;
	var C_Npc MountCrt;
	var C_Npc herz;
	var C_Npc xardascheck;
	var C_NPC FocusNPC;
	var string comtext;
	var string inst_id;
	var C_Item itm;
	var C_Item pItm;
	var C_Item itmleft;
	var c_item ExStItem;
	var c_item CurHlm;
	var int TempSwimDelta;
	var int TempArmorStamina;
	var int tempaim;
	var int TempHungerThirstDeBuff;
	var int TempDayNow;
	var int tempcurmaxstam;
	var int rainrandom;
	var int SunDownRandom;
	var int SunRiseRandom;
	var int WhistleRandom;
	var int ResetRandom;
	var int TempHealth;
	var int TempCritHealth;
	var int randsiz;
	var int PaleCrawler_RandyAttack;
	var int AraharPlague_RandyAttack;
	var int DamageAraharPlagueAOE;
	var int DamageSoulKeeperAOE;
	var int TempBleedingReduce;
	var int TempBleedingDamage;
	var int DamageFireGolem_LVAOE;
	var int DamageEkronAOE;
	var int TempDistToSkel;
	var int tmpHungerPool;
	var int tmpThirstPool;
	var int tmpTimerHPRegen;
	var int debManaReg;
	var int tmpDamageIlarah;
	var int tmpIlarahCountDamage_02;

	TempDayNow = Wld_GetDay();

	//Titry
	
	if(PrologCredits == FALSE)
	{
		if(PrologCount == 0)
		{
			ShakoIsOn[0] = FALSE;
			Kapitel = 1;
			Hero_HackChance = 0;
			HERO_HACKCHANCEORE = 0;
			INNOSPRAYCOUNT = 0;
			INNOSCRIMECOUNT = 0;
			BELIARPRAYCOUNT = 0;
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
			ATR_INTELLECT = 5;
			Use_Arrow = TRUE;
			Use_Bolt = TRUE;
			ModVersion[0] = 66;
 			Menu_WriteInt("GAME","playLogoVideos",0);
 			Menu_WriteInt("GAME","bloodDetail",3);
 			Menu_WriteInt("GAME","subTitles",1);
 			Menu_WriteInt("GAME","subTitlesPlayer",1);
 			Menu_WriteInt("GAME","spawnRemoveNpcOnlyIfEmpty",1);
 			Menu_WriteInt("GAME","spawnUseDeadNpcRoutinePos",1);
			CraitLvl = 1;
			CraitExpLvl = 0;
			CraitExpLvl_Next = 500;
			Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);
			StaminaBar.bShow = 0;
			xardascheck = Hlp_GetNpc(NONE_100_Xardas);
			xardascheck.name[0] = "";
			xardascheck.noFocus = TRUE;
			Snd_Play("STARTGAME");
			Snd_Play("MFX_THUNDERSTORM_THUNDER");
			Wld_SendTrigger("EVT_CAMERA_PROLOG");
			Mob_CreateItems("NW_CHEST_12",ITMW_1H_CREST,1);
		}
		else if(PrologCount == 3)
		{
			Snd_Play("MFX_THUNDERSTORM_THUNDER");
			Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
		}
		else if(PrologCount == 4)
		{
			AI_NoticePrint(500,7000,"Gothic 2 - Návraty 2.0a v66.2 - CZ v1.00");
		}
		else if(PrologCount == 13)
		{
			Snd_Play("Xardas_Intro");
		}
		else if(PrologCount == 16)
		{
			Snd_Play("MFX_THUNDERSTORM_THUNDER");
			Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
		}
		else if(PrologCount == 26)
		{
			Snd_Play("MFX_THUNDERSTORM_THUNDER");
			Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
		}
		else if(PrologCount == 36)
		{
			//Wld_PlayEffect("STARTGAME_FX",hero,hero,0,0,0,FALSE);
		}
		else if(PrologCount == 50)
		{
			//Wld_StopEffect("STARTGAME_FX");
		}
		else if(PrologCount == 53)
		{
			Snd_Play("MFX_THUNDERSTORM_THUNDER");
			AI_NoticePrint(500,7000,"Khorinis - Xardasova věž");
			//PrintScreen("Khorinis - Bashnya Ksardasa",-1,85,FONT_NEWLEVEL,5);
		}
		else if(PrologCount == 58)
		{
			PrologCredits = TRUE;
			Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
		};



		if(PrologCount == 3)
		{
			PrintScreen("Překlad do češtiny vytvořili:",-1,24,FONT_Screen,43);
		}
		else if(PrologCount == 6)
		{
			PrintScreen("helpo1   &   Kaiser   &   Nemrtvý Rysec   &   Greg",-1,44,FONT_Screen,8);
		}
		else if(PrologCount == 8)
		{
			PrintScreen("Algirion   &   irendie   &   r33i   &   Winea",-1,52,FONT_Screen,8);
		}
		else if(PrologCount == 18)
		{
			PrintScreen("Aeyon, Aky, Carrion, deusex",-1,40,FONT_Screen,8);
		}
		else if(PrologCount == 20)
		{
			PrintScreen("Diademos, g1g2g3, Garruk, Gustik 5",-1,48,FONT_Screen,8);
		}
		else if(PrologCount == 22)
		{
			PrintScreen("herek, Hokaido, Illidan61, Karasuuu",-1,56,FONT_Screen,8);
		}
		else if(PrologCount == 24)
		{
			PrintScreen("Keel, kral66, Kristi, lopez.com",-1,64,FONT_Screen,8);
		}
		else if(PrologCount == 34)
		{
			PrintScreen("Mike1, palino, s.bukviar, Saturas222",-1,44,FONT_Screen,8);
		}
		else if(PrologCount == 36)
		{
			PrintScreen("Septor, shadegm, Snupy, Stone",-1,52,FONT_Screen,8);
		}
		else if(PrologCount == 38)
		{
			PrintScreen("Tomislav, Trivett, Vojta1122, Xort",-1,60,FONT_Screen,8);
		}
		else if(PrologCount == 40)
		{
			PrintScreen("Všem patří velké uznání a obdiv",-1,80,FONT_Screen,12);
		};



		if(PrologCount == 13)
		{
			PrintScreen("Jediný vězeň dokázal změnit osud stovky ostatních.",-1,90,FONT_ScreenSmall,5);
		}
		else if(PrologCount == 18)
		{
			PrintScreen("Zaplatil za to však vysokou cenu.",-1,90,FONT_ScreenSmall,5);
		}
		else if(PrologCount == 23)
		{
			PrintScreen("Porazil Spáče, zničil bariéru...",-1,90,FONT_ScreenSmall,5);
		}
		else if(PrologCount == 28)
		{
			PrintScreen("... ale zatímco ostatní vězni uprchli, on zůstal pod hromadou suti.",-1,90,FONT_ScreenSmall,8);
		}
		else if(PrologCount == 37)
		{
			PrintScreen("Byl jsem to já, kdo ho vyslal proti Spáči, a jsem to opět já, kdo ho přivádí zpět.",-1,90,FONT_ScreenSmall,7);
		}
		else if(PrologCount == 44)
		{
		PrintScreen("Je slabý a mnohé zapomněl.",-1,90,FONT_ScreenSmall,3);
		}
		else if(PrologCount == 47)
		{
		PrintScreen("Ale je naživu...",-1,90,FONT_ScreenSmall,3);
		}
		else if(PrologCount == 50)
		{
		PrintScreen("Je zpátky!",-1,90,FONT_ScreenSmall,3);
		};



		PrologCount = PrologCount + 1;

	};
	if((ENDGAMECREDITS == TRUE) && (EpilogeGame == FALSE))
	{
		bManaBar = 0;
		bHealthBar = 0;
		CamModeOn = TRUE;
		Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);

		if(EpilogeCount == 7)
		{
			Wld_StopEffect("DRAGONLOOK_FX");
			Wld_StopEffect("LOWHEALTH_FX");
			Wld_StopEffect("POISONED_FX");
			Wld_StopEffect("SPELLFX_FOG_SMOKE");
			Wld_StopEffect("DIALOGSCOPE_FX");
			AI_Wait(hero,9999);
			Snd_Play("ENDGAME");
			Wld_PlayEffect("ENDGAME_FX_01",hero,hero,0,0,0,FALSE);
			PrintScreen("Na vývoji modifikace se podíleli:",-1,85,FONT_ScreenSmall,5);
		}
		else if(EpilogeCount == 13)
		{
			PrintScreen("TRAZEGE",-1,85,FONT_Prolog,8);
			PrintScreen("- autor a tvůrce modifikace -",-1,92,FONT_ScreenSmall,8);
		}
		else if(EpilogeCount == 22)
		{
			PrintScreen("MaGoth",-1,85,FONT_Prolog,3);
			PrintScreen("- vývoj SystemPacku, vytvoření instalátoru -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 26)
		{
			PrintScreen("Saturas",-1,85,FONT_Prolog,3);
			PrintScreen("- vývoj AST verze módu -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 30)
		{
			PrintScreen("Alex_Draven",-1,85,FONT_Prolog,3);
			PrintScreen("- vytvoření modelů a animací -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 34)
		{
			PrintScreen("Gratt",-1,85,FONT_Prolog,3);
			PrintScreen("- vytvoření modelů a animací -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 38)
		{
			PrintScreen("Yelawolf",-1,85,FONT_Prolog,3);
			PrintScreen("- informační podpora, lightpack textur -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 42)
		{
			PrintScreen("Jména testerů budou nahrazena",-1,85,FONT_ScreenSmall,3);
			PrintScreen("jmény překladatelů české verze:",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 46)
		{
			PrintScreen("Kaiser, helpo1",-1,85,FONT_Prolog,3);
			PrintScreen("Nemrtvý Rysec, Greg",-1,92,FONT_Prolog,3);
		}
		else if(EpilogeCount == 50)
		{
			PrintScreen("irendie, Keel",-1,85,FONT_Prolog,3);
			PrintScreen("r33i, Winea",-1,92,FONT_Prolog,3);
		}
		else if(EpilogeCount == 54)
		{
			PrintScreen("Aeyon, Aky",-1,85,FONT_ScreenSmall,3);
			PrintScreen("Algirion, Carrion",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 58)
		{
			PrintScreen("deusex, Diademos",-1,85,FONT_ScreenSmall,3);
			PrintScreen("g1g2g3, Garruk",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 62)
		{
			PrintScreen("Gustik 5, herek",-1,85,FONT_ScreenSmall,3);
			PrintScreen("Hokaido, Illidan61",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 66)
		{
			PrintScreen("Karasuuu, kral66",-1,85,FONT_ScreenSmall,3);
			PrintScreen("Kristi, lopez.com",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 70)
		{
			PrintScreen("Mike1, palino",-1,85,FONT_ScreenSmall,3);
			PrintScreen("s.bukviar, Saturas222",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 74)
		{
			PrintScreen("Septor, shadegm",-1,85,FONT_ScreenSmall,3);
			PrintScreen("Snupy, Stone",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 78)
		{
			PrintScreen("Tomislav, Trivett",-1,85,FONT_ScreenSmall,3);
			PrintScreen("Vojta1122, Xort",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 82)
		{
			PrintScreen("Pokud vydržíte až do konce,",-1,85,FONT_ScreenSmall,3);
			PrintScreen("- na konci ještě něco je... -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 86)
		{
			PrintScreen("Zvláštní poděkování vývojářům Gothic SystemPack:",-1,85,FONT_ScreenSmall,3);
			PrintScreen("KuDeSnik, Guzz aka killer-m, Mukhomor",-1,90,FONT_Prolog,3);
		}
		else if(EpilogeCount == 90)
		{
			PrintScreen("Dabing modifikace:",-1,85,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 94)
		{
			PrintScreen("!sTaR",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing více než 100 postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 100)
		{
			PrintScreen("Adept",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing více než 75 postav, střih a editování dialogů -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 106)
		{
			PrintScreen("Potr Ivashchenko 'Glants'",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing Bezejmenného (více než 10 000 replik) -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 110)
		{
			PrintScreen("Aleksandr Kovrizhnykh",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav (původní G2) -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 114)
		{
			PrintScreen("Gor Na Drak",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 118)
		{
			PrintScreen("AlexBel",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 122)
		{
			PrintScreen("Blade",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 126)
		{
			PrintScreen("Sergey Sokol",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav (frontman kapely 'Vikont') -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 130)
		{
			PrintScreen("Koloyar",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 134)
		{
			PrintScreen("Inear",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 138)
		{
			PrintScreen("Naja",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 142)
		{
			PrintScreen("Gerard",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 146)
		{
			PrintScreen("Dennis",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 150)
		{
			PrintScreen("Taja",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 154)
		{
			PrintScreen("Shurik Om",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 158)
		{
			PrintScreen("Hullabaloo",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 162)
		{
			PrintScreen("Khimera",-1,85,FONT_Prolog,3);
			PrintScreen("- dabing postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 166)
		{
			PrintScreen("107",-1,85,FONT_Prolog,3);
			PrintScreen("- střih postav -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 170)
		{
			PrintScreen("Během vývoje byly použity materiály z následovných modifikací:",-1,85,FONT_ScreenSmall,3);
			PrintScreen("(To by mě zajímalo jestli někdo na ty titulky kouká?)",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 174)
		{
			PrintScreen("The Dark Saga",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: SAGA-Team -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 178)
		{
			PrintScreen("Unnamed Mod v 1.1",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Dixie -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 182)
		{
			PrintScreen("Jaktyl",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Caphalor & HanterDakness -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 186)
		{
			PrintScreen("Die Gemeinschaft des Grauens",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Milgo & Freddy -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 190)
		{
			PrintScreen("Der Pakt des Bosen",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Sharkdata Modteam -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 194)
		{
			PrintScreen("Piratenleben",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Freddy & Fizzban -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 198)
		{
			PrintScreen("The long voyage home",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Alex_Draven, MaGoth -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 202)
		{
			PrintScreen("Aus dem Leben eines Diebes",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Team K (Kurzer, Klabautermann, harhar!) -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 206)
		{
			PrintScreen("Laer Gjoll – Horror of cematary",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: FaWl MT -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 210)
		{
			PrintScreen("Caduon",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Esmeralda-Mod Team -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 214)
		{
			PrintScreen("Juran",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: ThomasBausB -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 218)
		{
			PrintScreen("Gothic II - L'HIVER Edition",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: unknown111 -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 222)
		{
			PrintScreen("Carnage Graphic Patch",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Carnage, Mark56 -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 226)
		{
			PrintScreen("Zlote Wrota",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: Zlote Wrota Team -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 230)
		{
			PrintScreen("Czas Zaplaty",-1,85,FONT_Prolog,3);
			PrintScreen("- autor: The Modders -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 234)
		{
			PrintScreen("a další...",-1,85,FONT_Prolog,3);
			PrintScreen("- Na konci... nic není :D -",-1,92,FONT_ScreenSmall,3);
		}
		else if(EpilogeCount == 238)
		{
			PrintScreen("Za to vše jim Trazege a tým vývojářů",-1,85,FONT_ScreenSmall,4);
			PrintScreen("vyslovuje upřímné díky (a nezapomeňtě na ty překladatele)!",-1,90,FONT_ScreenSmall,4);
		}
		else if(EpilogeCount == 242)
		{
			PrintScreen("Návraty 2.0a",-1,85,FONT_Prolog,11);
			PrintScreen("- Trazege & Returning ModTeam, 2015 -",-1,92,FONT_ScreenSmall,6);
		}
		else if(EpilogeCount == 246)
		{
			Wld_StopEffect("ENDGAME_FX_01");
			EpilogeGame = TRUE;
			ExitSession();
		};

		EpilogeCount = EpilogeCount + 1;
	};
	if(ShutDownGame == TRUE)
	{
		tmpShutDownGame += 1;
		comtext = ConcatStrings("Ukončení hry za ",IntToString(6 - tmpShutDownGame));
		comtext = ConcatStrings(comtext," sekund...");
		AI_PrintClr(comtext,177,58,17);

		if(tmpShutDownGame > 6)
		{
			ShutDownGame = FALSE;
			ExitSession();
		};
	};
	if(hero.attribute[ATR_HITPOINTS_MAX] > 500)
	{
		TempHealth = (hero.attribute[ATR_HITPOINTS_MAX] - 500) / (SBMODE * 10);
		TempHealth = TempHealth + 100;
		TempCritHealth = TempHealth / 2;
	}
	else
	{
		TempHealth = hero.attribute[ATR_HITPOINTS_MAX] / (SBMODE * 5);
		TempCritHealth = TempHealth / 2;
	};

	//-------------------Zagruzka------------------------------

	if((GameReload == TRUE) && (CanChangeItem == TRUE))
	{
		nCycleChar = FALSE;
		ArmorWithCapisUpCheck = FALSE;

		if(RealMode == TRUE)
		{
			RealMode[2] = TRUE;
			RealMode = FALSE;
		};
		if(FixSteal == FALSE)
		{
			if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0)
			{
				PickPocketBonusCount = Npc_GetTalentValue(hero,NPC_TALENT_PICKPOCKET);
			}
			else
			{
				PickPocketBonusCount = 0;
			};

			FixSteal = TRUE;
		};

		threatPosX = FALSE;
		canintPosX = FALSE;
		acrobatPosX = FALSE;
		sprintPosX = FALSE;
		iceshieldPosX = FALSE;
		fireshieldPosX = FALSE;
		healthPosX = FALSE;
		manaPosX = FALSE;
		regenmobsPosX = FALSE;
		ogonekPosX = FALSE;

		threatST = FALSE;
		canintST = FALSE;
		acrobatST = FALSE;
		sprintST = FALSE;
		iceshieldST = FALSE;
		fireshieldST = FALSE;
		healthST = FALSE;
		manaST = FALSE;
		regenmobsST = FALSE;
		ogonekST = FALSE;

		PressedFeithgt = FALSE;
		bSprintTime = FALSE;
		PressedFtwo = FALSE;
		PressedFtwoAtt = FALSE;
		PlayerSitDust = FALSE;
		WhistleCount = FALSE;

		B_DamageBonusDamage();
		B_DamageCalcRunes();
		B_InitMunitionLoad();

		CheckRoomPresense = TRUE;

		if(AutoRunIs == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Humans_AutoRun.MDS");
			AutoRunIs = FALSE;
		};
		if(hero.attribute[ATR_HITPOINTS] <= TempCritHealth)
		{
			TimerLowHealthUp = TRUE;
		}
		else	if((POISONED == TRUE) && (ResistPoisonKnow == FALSE))
		{
			TimerPoisonUp = TRUE;
		};

		GameReload = FALSE;
		TimerLowHealthUpTic = FALSE;
		TimerPoisonUpTic = FALSE;

		Mdl_RemoveOverlayMds(hero,"humans_pirate.mds");
		Mdl_RemoveOverlayMds(hero,"Humans_Arr.mds");
		Mdl_RemoveOverlayMds(hero,"Humans_Rel.mds");
		Mdl_RemoveOverlayMds(hero,"Humans_Trd.mds");

		if(hero.attribute[ATR_HITPOINTS] > TempHealth)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");	
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		};

		B_CheckFightAni(hero,NPC_TALENT_1H);
		B_CheckFightAni(hero,NPC_TALENT_2H);
		B_CheckFightAni(hero,NPC_TALENT_BOW);
		B_CheckFightAni(hero,NPC_TALENT_CROSSBOW);

		if(SBMODE == TRUE)
		{
			Mob_ScrambleContainers();
		};
		if(AcidIsOn == TRUE)
		{
			AcidIsOn = FALSE;
		};
		if(PalLightIsOn == TRUE)
		{
			if(HolyAuraIsUp == TRUE)
			{
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - 25;
				HolyAuraIsUp = FALSE;
			};

			TempPalLightIsOn = FALSE;
			PalLightIsOn = FALSE;
		};

		SPRINT_ACTIVE = FALSE;
		SPRINT_ACTIVE_DO = FALSE;
		Mdl_RemoveOverlayMds(hero,"Humans_MageSprint.MDS");

		if(Menu_ReadInt("GAME","spawnRemoveNpcOnlyIfEmpty") == 0)
		{
			Menu_WriteInt("GAME","spawnRemoveNpcOnlyIfEmpty",1);
		};
		if(Menu_ReadInt("GAME","spawnUseDeadNpcRoutinePos") == 0)
		{
			Menu_WriteInt("GAME","spawnUseDeadNpcRoutinePos",1);
		};
		if(HelmIsUp == TRUE)
		{
			if(Menu_ReadInt("AST","bHideHelm") == TRUE)
			{
				CurHlm = Hlp_GetSlotItem(hero,"ZS_HELMET");

				if(Hlp_IsValidItem(CurHlm) == TRUE)
				{
					Vob_SetVisual(hero,CurHlm,"NoHelmModel.3ds");
					TempHelmModel = TRUE;
				};
			};
		};
		if(NewStamUpIsUp == FALSE)
		{
			if(ATR_STAMINA[0] == FALSE)
			{
				ATR_STAMINA = ATR_STAMINA[0];
			};
			if(ATR_STAMINA_MAX[0] == FALSE)
			{
				ATR_STAMINA_MAX = ATR_STAMINA_MAX[0];
			};

			NewStamUpIsUp = TRUE;
		};
		if(Menu_ReadInt("AST","bScaleStr") == TRUE)
		{
			if(hero.attribute[ATR_STRENGTH] >= 400)
			{
				Mdl_SetModelScale(hero,1.3,1,1.3);
			}
			else if(hero.attribute[ATR_STRENGTH] >= 350)
			{
				Mdl_SetModelScale(hero,1.2,1,1.3);
			}
			else if(hero.attribute[ATR_STRENGTH] >= 300)
			{
				Mdl_SetModelScale(hero,1.2,1,1.2);
			}
			else if(hero.attribute[ATR_STRENGTH] >= 250)
			{
				Mdl_SetModelScale(hero,1.1,1,1.2);
			}
			else if(hero.attribute[ATR_STRENGTH] >= 200)
			{
				Mdl_SetModelScale(hero,1.1,1,1.1);
			}
			else if(hero.attribute[ATR_STRENGTH] >= 100)
			{
				Mdl_SetModelScale(hero,1,1,1.1);
			};
		}
		else
		{
			Mdl_SetModelFatness(hero,0);
			Mdl_SetModelScale(hero,1,1,1);
		};
		if(ModVersion[0] != 66)
		{
			AI_PrintClr("Načtena uložená hra starší verze!",177,58,17);
			ShutDownGame = TRUE;
			tmpShutDownGame = FALSE;
			AI_Wait(hero,9999);
		};
		if((CurrentLevel == LOSTVALLEY_ZEN) && (EpicJorneyStart == TRUE) && (LVTextOnce == TRUE))
		{
			LVTextOnce = FALSE;
		};
		if(RealMode[2] == TRUE)
		{
			if(CheckRealMode[1] == TRUE)
			{
				sHardLvl = "'Legendární'";
			}
			else
			{
				sHardLvl = "'Legendární' (s ukl.)";
			};
		}
		else
		{
			sHardLvl = "Těžká";
		};
		if(AcrobatTurnOFF == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Acrobatic.MDS");
		}
		else
		{
			if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_Acrobatic.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Humans_Acrobatic.MDS");
			};
		};
		if(FixOrcArmor == FALSE)
		{
			if((Npc_HasItems(hero,ITAR_ORCARMOR) >= 1) && (hero.attribute[ATR_DEXTERITY] > hero.attribute[ATR_STRENGTH]))
			{
				Npc_RemoveInvItems(hero,ITAR_ORCARMOR,Npc_HasItems(hero,ITAR_ORCARMOR));
				CreateInvItems(hero,ITAR_ORCARMOR_DEX,1);
				FixOrcArmor = TRUE;
			};
		};
	};

	//-------------------Zagruzka------------------------------

	if(TimerLowHealthUp == TRUE)
	{
		TimerLowHealthUpTic += 1;

		if((TimerLowHealthUpTic >= 10) && (hero.attribute[ATR_HITPOINTS] <= TempCritHealth))
		{
			TimerLowHealthUpTic = FALSE;
			TimerLowHealthUp = FALSE;
		};
	}
	else if(TimerPoisonUp == TRUE)
	{
		TimerPoisonUpTic += 1;

		if((TimerPoisonUpTic >= 10) && (POISONED == TRUE))
		{
			TimerPoisonUpTic = FALSE;
			TimerPoisonUp = FALSE;
		};
	};
	if(IsLockPickBroken == TRUE)
	{
		if(IsNpcReactTime >= 1)
		{
			IsLockPickBroken = FALSE;
			IsNpcReactTime = FALSE;
		};

		IsNpcReactTime += 1;
	};
	if(HeroDrunk == TRUE)
	{
		HeroDrunkCount += 1;

		if(HeroDrunkCount >= 60)
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Drunken.MDS");	
			Mdl_RemoveOverlayMds(hero,"Humans_DrunkenExt.MDS");	
			HeroDrunk = FALSE;
			HeroDrunkCount = FALSE;
		};
	};
	if(HeroInvisible == TRUE)
	{
		HeroInvisibleTimer += 1;

		if(HeroInvisibleTimer == (HeroInvisibleTimerNow - 15))
		{
			AI_Print("Černá mlha se začíná rozplývat...");
		}
		else if(HeroInvisibleTimer > HeroInvisibleTimerNow)
		{
			HeroInvisible = FALSE;
			HeroInvisibleTimer = FALSE;
			Wld_StopEffect("SPELLFX_FOG_SMOKE");

			if(HeroDragonLook == TRUE)
			{
				Wld_StopEffect("DRAGONLOOK_FX");	
				HeroDragonLook = FALSE;
			};
		};
	};
	if((TaskHram_03 == TRUE) && (CurrentLevel == ADANOSVALLEY_ZEN) && (MagolemusIsDead == FALSE))
	{
		if(Wld_IsTime(4,0,22,0) == TRUE)
		{
			if((AOE_IsDown == FALSE) && (AOE_IsUp == TRUE))
			{
				Wld_SendTrigger("EVT_MAGOLEMUS_AOE");
				AOE_IsDown = TRUE;
				AOE_IsUp = FALSE;
			};
		}
		else
		{
			if((AOE_IsUp == FALSE) && (AOE_IsDown == TRUE))
			{
				Wld_SendTrigger("EVT_MAGOLEMUS_AOE");
				AOE_IsUp = TRUE;
				AOE_IsDown	= FALSE;
			};
		};
	};
	if(PalLightIsOn == TRUE)
	{
		TempPalLightIsOn += 1;

		if(TempPalLightIsOn >= 299)
		{
			if(HolyAuraIsUp == TRUE)
			{
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - 25;
				HolyAuraIsUp = FALSE;
			};

			TempPalLightIsOn = FALSE;
			PalLightIsOn = FALSE;
		};
	};
	if(AcidIsOn == TRUE)
	{
		TempAcidIsOn += 1;

		if(TempAcidIsOn >= 30)
		{
			AcidIsOn = FALSE;
			TempAcidIsOn = FALSE;
		};
	};
	if(CheckDismount == TRUE)
	{
		tmpDismount += 1;

		if(tmpDismount >= 2)
		{
			if(C_BodyStateContains(hero,BS_FALL))
			{
				AI_Teleport(hero,Npc_GetNearestWP(hero));
			}
			else if(!C_BodyStateContains(hero,BS_FALL))
			{
				tmpDismount = FALSE;
				CheckDismount = FALSE;
			};
		};
	};
	if(KillCrait == TRUE)
	{
		tmpKillCrait += 1;

		if(tmpKillCrait >= 2)
		{
			B_RemoveNpc(Crait);
			tmpKillCrait = FALSE;
			KillCrait = FALSE;
			CraitIsUp = FALSE;
			Mount_Up = FALSE;
		};
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) || (PLAYER_MOBSI_PRODUCTION == MOBSI_OREHACKEN) || (PLAYER_MOBSI_PRODUCTION == MOBSI_IRONHACKEN))
	{
		tempcurmaxstam = ATR_STAMINA_MAX[0] * 10;
		concatText = "Výdrž: ";
		concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA[0]));
		concatText = ConcatStrings(concatText,"/");
		concatText = ConcatStrings(concatText,IntToString(tempcurmaxstam));
		AI_Print(concatText);
	};
	if(PAL_EliteDay == TRUE)
	{
		TempPalEliteDo += 1;

		if(TempPalEliteDo >= 8)
		{
			PAL_EliteDay = FALSE;
			TempPalEliteDo = FALSE;
		};
	};
	if(KDW_EliteDo == TRUE)
	{
		TempKDW_EliteDo += 1;

		if(TempKDW_EliteDo >= 8)
		{
			KDW_EliteDo = FALSE;
			TempKDW_EliteDo = FALSE;
		};
	};
	if(KDM_EliteDo == TRUE)
	{
		TempKDM_EliteDo += 1;

		if(TempKDM_EliteDo >= 8)
		{
			KDM_EliteDo = FALSE;
			TempKDM_EliteDo = FALSE;
		};
	};
	if(GUR_EliteDo == TRUE)
	{
		TempGUR_EliteDo += 1;

		if(TempGUR_EliteDo >= 60)
		{
			GUR_EliteDo = FALSE;
			TempGUR_EliteDo = FALSE;
			Wld_StopEffect("SPELLFX_CAST_GURU");
		};
	};
	if(SLD_EliteDo == TRUE)
	{
		TempSLD_EliteDo += 1;

		if(TempSLD_EliteDo >= TempSLDEliteTime)
		{
			SLD_EliteDo = FALSE;
			TempSLD_EliteDo = FALSE;
			TempSLDEliteTime = FALSE;
		};
	};
	if(TPL_EliteDo == TRUE)
	{
		TempTPL_EliteDo += 1;

		if(TempTPL_EliteDo >= 3)
		{
			TPL_EliteDo = FALSE;
			TempTPL_EliteDo = FALSE;
			TempTPLEliteTime = FALSE;
		};
	};
	if(PlayerIsBleeding == TRUE)
	{
		TempPlayerIsBleeding += 1;

		if(hero.protection[PROT_EDGE] >= 10)
		{
			TempBleedingReduce = hero.protection[PROT_EDGE] / 10;
		}
		else
		{
			TempBleedingReduce = 1;
		};
		if(BleedingPower > TempBleedingReduce)
		{
			TempBleedingDamage = BleedingPower - TempBleedingReduce;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - TempBleedingDamage;

			if(TempPlayerIsBleeding >= 10)
			{
				TempPlayerIsBleeding = FALSE;
				PlayerIsBleeding = FALSE;
				BleedingPower = FALSE;
			};
		}
		else
		{
			TempPlayerIsBleeding = FALSE;
			PlayerIsBleeding = FALSE;
			BleedingPower = FALSE;
		};
	};
	if(PlayerIsWeakness == TRUE)
	{
		TempPlayerIsWeakness += 1;

		if(ATR_STAMINA[0] >= 10)
		{
			ATR_STAMINA[0] = ATR_STAMINA[0] - 10;
		}
		else
		{
			ATR_STAMINA[0] = 0;
		};
		if(TempPlayerIsWeakness >= 10)
		{
			TempPlayerIsWeakness = FALSE;
			PlayerIsWeakness = FALSE;
		};
	};
	if(PlayerIsSick == TRUE)
	{
		TempPlayerIsSick += 1;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 1;

		if(TempPlayerIsSick >= 1000)
		{
			TempPlayerIsSick = FALSE;
			PlayerIsSick = FALSE;
		};
	};
	if(PlayerIsCurse == TRUE)
	{
		TempPlayerIsCurse += 1;

		if(hero.attribute[ATR_MANA] > 10)
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 10;
		}
		else
		{
			hero.attribute[ATR_MANA] = 0;
		};
		if(TempPlayerIsCurse >= 100)
		{
			TempPlayerIsCurse = FALSE;
			PlayerIsCurse = FALSE;
		};
	};
	if(PlayerIsIgnition == TRUE)
	{
		TempPlayerIsIgnition += 1;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 50;

		if(TempPlayerIsIgnition >= 5)
		{
			TempPlayerIsIgnition = FALSE;
			PlayerIsIgnition = FALSE;
		};
	};
	if(FireShieldIsUp == TRUE)
	{
		TempFireShieldTick += 1;

		if(Menu_ReadInt("AST","bShowFireShield") == TRUE)
		{
			if((TempFireShieldTick / 5) > TempFireShieldEffect)
			{
				TempFireShieldEffect = TempFireShieldTick / 5;
				Wld_PlayEffect("VOB_MAGICBURN_NOSND",hero,hero,0,0,0,FALSE);	
			};
		};
		if(TempFireShieldTick > 120)
		{
			FireShieldIsUp = FALSE;
			TempFireShieldTick = FALSE;
			TempFireShieldEffect = FALSE;
		};
	};
	if(PLAYER_MOBSI_PRODUCTION != MOBSI_NONE)
	{
		if(FireShieldIsUp == TRUE)
		{
			FireShieldIsUp = FALSE;
			TempFireShieldTick = FALSE;
			TempFireShieldEffect = FALSE;
		};
	};
	if((IceShield == TRUE) || (IceSHTimer == TRUE))
	{
		TempIceShieldTick += 1;

		pItm = Npc_GetEquippedArmor(hero);

		if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
		{
			if(Hlp_IsItem(pItm,ITAR_KDW_L_Addon))
			{
				hero.attribute[ATR_MANA] += 1;
			}
			else if(Hlp_IsItem(pItm,ITAR_KDW_H))
			{
				hero.attribute[ATR_MANA] += 2;
			}
			else if(Hlp_IsItem(pItm,ITAR_KDW_ADANOS))
			{
				hero.attribute[ATR_MANA] += 3;
			}
			else if(Hlp_IsItem(pItm,ItAr_KDW_SH))
			{
				hero.attribute[ATR_MANA] += 4;
			};
		};
		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
		if((TempIceShieldTick > 10) && (IceShield == TRUE))
		{
			if(Menu_ReadInt("AST","bShowFireShield") == TRUE)
			{
				Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",hero,hero,0,0,0,FALSE);
			};

			hero.protection[PROT_EDGE] -= IceSH;  
			hero.protection[PROT_BLUNT] -= IceSH;  
			hero.protection[PROT_POINT] -= IceSH; 
			hero.protection[PROT_FIRE] -= IceSH; 
			hero.protection[PROT_MAGIC] -= IceSH; 
			IceShield = FALSE;
			IceSH = FALSE;
		};
		if((TempIceShieldTick > 30) && (IceSHTimer == TRUE))
		{
			IceSHTimer = FALSE;
			TempIceShieldTick = FALSE;
			IceSH = FALSE;
		};
	};
	if(PrintNowSuccessFlag == TRUE)
	{
		TempPrintNow += 1;

		if(TempPrintNow >= 3)
		{
			TempPrintNow = FALSE;
			PrintNowSuccessFlag = FALSE;
			PrintNowSuccess = FALSE;
		};
	};
	if((KardifDayPlay < TempDayNow) && (KardifDayPlay > 0) && (KardifDayFlag == TRUE))
	{
		KardifPlayResult = KardifPlayResult + 50;
		KardifDayPlay = Wld_GetDay();

		if(KardifPlayResult >= 100)
		{
			KardifDayFlag = FALSE;
		};
	};
	if((SalandrilDayPlay < TempDayNow) && (SalandrilDayPlay > 0) && (SalandrilDayFlag == TRUE))
	{
		SalandrilPlayResult = SalandrilPlayResult + 50;
		SalandrilDayPlay = Wld_GetDay();

		if(SalandrilPlayResult >= 150)
		{
			SalandrilDayFlag = FALSE;
		};
	};
	if((OrlanDayPlay < TempDayNow) && (OrlanDayPlay > 0) && (OrlanDayFlag == TRUE))
	{
		OrlanPlayResult = OrlanPlayResult + 50;
		OrlanDayPlay = Wld_GetDay();

		if(OrlanPlayResult >= 100)
		{
			OrlanDayFlag = FALSE;
		};
	};
	if((RaoulDayPlay < TempDayNow) && (RaoulDayPlay > 0) && (RaoulDayFlag == TRUE))
	{
		RaoulPlayResult = RaoulPlayResult + 50;
		RaoulDayPlay = Wld_GetDay();

		if(RaoulPlayResult >= 100)
		{
			RaoulDayFlag = FALSE;
		};
	};
	if((SnafDayPlay < TempDayNow) && (SnafDayPlay > 0) && (SnafDayFlag == TRUE))
	{
		SnafPlayResult = SnafPlayResult + 50;
		SnafDayPlay = Wld_GetDay();

		if(SnafPlayResult >= 100)
		{
			SnafDayFlag = FALSE;
		};
	};
	if((SamuelDayPlay < TempDayNow) && (SamuelDayPlay > 0) && (SamuelDayFlag == TRUE))
	{
		SamuelPlayResult = SamuelPlayResult + 50;
		SamuelDayPlay = Wld_GetDay();

		if(SamuelPlayResult >= 150)
		{
			SamuelDayFlag = FALSE;
		};
	};

	//---------------------------------------regen potami-----------------------------------

	if((RestoreHealth == TRUE) && (CurrentLevel != ITUSELDTOWER_ZEN) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] <= 100)
		{
			TempHPRes = 1;
		}
		else
		{
			TempHPRes = hero.attribute[ATR_HITPOINTS_MAX] / 100;
		};

		Npc_ChangeAttribute(hero,ATR_HITPOINTS,TempHPRes);
		SumTempHPRes = SumTempHPRes + TempHPRes;

		if((SumTempHPRes >= RestoreHealth_Proc) || (hero.attribute[ATR_HITPOINTS] >= hero.attribute[ATR_HITPOINTS_MAX]))
		{
			TempHPRes = FALSE;
			SumTempHPRes = FALSE;
			RestoreHealth_Proc = FALSE;
			RestoreHealth = FALSE;
		};
	};
	if((RestoreMana == TRUE) && (CurrentLevel != ITUSELDTOWER_ZEN) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		if(hero.attribute[ATR_MANA_MAX] <= 100)
		{
			TempManaRes = 1;
		}
		else
		{
			TempManaRes = hero.attribute[ATR_MANA_MAX] / 100;
		};

		Npc_ChangeAttribute(hero,ATR_MANA,TempManaRes);
		SumTempManaRes = SumTempManaRes + TempManaRes;

		if((SumTempManaRes >= RestoreMana_Proc) || (hero.attribute[ATR_MANA] >= hero.attribute[ATR_MANA_MAX]))
		{
			TempManaRes = FALSE;
			SumTempManaRes = FALSE;
			RestoreMana_Proc = FALSE;
			RestoreMana = FALSE;
		};
	};

	//--------------------------regen staminy normal'---------------------------------------------

	if((ATR_STAMINA[0] < (ATR_STAMINA_MAX[0] * 10)) && (SBMODE != TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0) && (POISONED == FALSE) && (!C_BodyStateContains(hero,BS_SWIM) || !C_BodyStateContains(hero,BS_DIVE) || !C_BodyStateContains(hero,BS_CLIMB) || !C_BodyStateContains(hero,BS_JUMP) || !C_BodyStateContains(hero,BS_SPRINT)))
	{
		if(VATRAS_TEACHREGENSTAM == TRUE)
		{
			if(RELOADSTAM >= 4)
			{
				if(C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_SIT))
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + SBMODE + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += SBMODE + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				}
				else
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += ATR_STAMINA_MAX[0] / (5 - SBMODE);
					};
				};
	
				RELOADSTAM = 0;
			}
			else
			{
				RELOADSTAM += 1;
			};
		}
		else 
		{
			if(RELOADSTAM >= 8)
			{
				if(C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_SIT))
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + SBMODE + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += SBMODE + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				}
				else
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += ATR_STAMINA_MAX[0] / (5 - SBMODE);
					};
				};

				RELOADSTAM = 0;
			}
			else
			{
				RELOADSTAM += 1;
			};
		};
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
	}
	else if((ATR_STAMINA[0] < (ATR_STAMINA_MAX[0] * 10)) && (PlayerIsSick == FALSE) && (SBMODE == TRUE) && (Hero_Fatigue >= 1) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0) && (POISONED == FALSE) && (!C_BodyStateContains(hero,BS_SWIM) || !C_BodyStateContains(hero,BS_DIVE) || !C_BodyStateContains(hero,BS_CLIMB) || !C_BodyStateContains(hero,BS_JUMP) || !C_BodyStateContains(hero,BS_SPRINT)))
	{
		if(VATRAS_TEACHREGENSTAM == TRUE)
		{
			if(RELOADSTAM >= 4)
			{
				if(C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_SIT))
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + SBMODE + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += SBMODE + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				}
				else
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				};
	
				RELOADSTAM = 0;
			}
			else
			{
				RELOADSTAM += 1;
			};
		}
		else 
		{
			if(RELOADSTAM >= 8)
			{
				if(C_BodyStateContains(hero,BS_STAND) || C_BodyStateContains(hero,BS_SIT))
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + SBMODE + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += SBMODE + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				}
				else
				{
					if(Trophy_SkalozubIsUp == TRUE)
					{
						ATR_STAMINA[0] += 2 + (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					}
					else
					{
						ATR_STAMINA[0] += (Hero_Fatigue / 5) + (ATR_STAMINA_MAX[0] / (5 - SBMODE));
					};
				};

				RELOADSTAM = 0;
			}
			else
			{
				RELOADSTAM += 1;
			};
		};
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
	}
	else
	{
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		RELOADSTAM = 0;
	};

	//--------------------------regen khp normal'---------------------------------------------

	if((VATRAS_TEACHREGEN == TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (ATR_STAMINA[0] > 0) && (SBMODE != TRUE) && (hero.attribute[ATR_HITPOINTS] > 0) && (POISONED == FALSE) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]))
	{
		if(RELOAD_HEALTH >= 4)
		{
			if(hero.level > 5)
			{
				Health_RegLvl = 1 + hero.level / (5 - SBMODE);
			}
			else
			{
				Health_RegLvl = 1;
			};

			if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SBMODE + Health_RegLvl;
			};
			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};

			RELOAD_HEALTH = FALSE;
		}
		else
		{
			RELOAD_HEALTH += 1;
		};
	};

	//--------------------------regen khp khard---------------------------------------------

	if((VATRAS_TEACHREGEN == TRUE) && (SBMODE == TRUE) && (ATR_STAMINA[0] > 0) && (Hero_Hunger >= 1) && (Hero_Thirst >= 1) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0) && (POISONED == FALSE) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]))
	{
		if(RELOAD_HEALTH >= 4)
		{
			if(hero.level > 5)
			{
				Health_RegLvl = 1 + (Hero_Hunger / 5) + (Hero_Thirst / 5) + (hero.level / 3);
			}
			else
			{
				Health_RegLvl = 1 + (Hero_Hunger / 5) + (Hero_Thirst / 5);
			};

			if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SBMODE + Health_RegLvl;
			};
			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};

			RELOAD_HEALTH = FALSE;
		}
		else
		{
			RELOAD_HEALTH += 1;
		};
	}
	else if((VATRAS_TEACHREGEN == FALSE) && (SBMODE == TRUE) && (PlayerIsSick == FALSE) && (ATR_STAMINA[0] > 0) && (Hero_Hunger >= 1) && (Hero_Thirst >= 1) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0) && (POISONED == FALSE) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]))
	{
		tmpTimerHPRegen = ((11 - Hero_Hunger) * 10) + ((6 - Hero_Thirst) * 10);

		if(RELOAD_HEALTH >= tmpTimerHPRegen)
		{
			if(hero.level > 10)
			{
				Health_RegLvl = 1 + (Hero_Hunger / 5) + (Hero_Thirst / 5) + hero.level / (10 - SBMODE);
			}
			else
			{
				Health_RegLvl = 1 + (Hero_Hunger / 5) + (Hero_Thirst / 5);
			};

			if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SBMODE + Health_RegLvl;
			};
			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};

			RELOAD_HEALTH = FALSE;
		}
		else
		{
			RELOAD_HEALTH += 1;
		};
	};
	if((FightMeditation == TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE))
	{
		if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 5;
		};
	};

	//--------------------------regen many khard---------------------------------------------

	if((VATRAS_TEACHREGENMANA == TRUE) && (PlayerIsSick == FALSE) && (SBMODE == TRUE) && (Hero_Thirst >= 1) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX]))
	{
		if(RELOAD_MANA >= 4)
		{
			debManaReg = 5 - Hero_Thirst;

			if(ATR_INTELLECT >= 20)
			{
				Mana_RegLvl = ATR_INTELLECT / 20;
			}
			else
			{
				Mana_RegLvl = 1;
			};
			if(Mana_RegLvl > debManaReg)
			{
				Mana_RegLvl = Mana_RegLvl - debManaReg;
			}
			else
			{
				Mana_RegLvl = 1;
			};
			if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + Mana_RegLvl;
			};
			if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			};

			RELOAD_MANA = FALSE;
		}
		else
		{
			RELOAD_MANA += 1;
		};
	};

	//--------------------------regen many normal---------------------------------------------

	if((VATRAS_TEACHREGENMANA == TRUE) && (PlayerIsSick == FALSE) && (SBMODE != TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX]))
	{
		if(RELOAD_MANA >= 4)
		{
			if(ATR_INTELLECT >= 20)
			{
				Mana_RegLvl = ATR_INTELLECT / 20;
			}
			else
			{
				Mana_RegLvl = 1;
			};
			if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + Mana_RegLvl;
			};
			if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			};

			RELOAD_MANA = FALSE;
		}
		else
		{
			RELOAD_MANA += 1;
		};
	};

	if((MagicMeditation == TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE))
	{
		if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 5;
		};
		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};
	if((Trophy_DragonSkullIsUp == TRUE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE))
	{
		if(RELOAD_DRAGONSKULL >= 3)
		{
			if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] += 1;
			};
			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};
			if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] += 1;
			};
			if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			};
			if(ATR_STAMINA[0] < (ATR_STAMINA_MAX[0] * 10))
			{
				ATR_STAMINA[0] += 1;
			};
			if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
			{
				ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
			};

			RELOAD_DRAGONSKULL = FALSE;
		}
		else
		{
			RELOAD_DRAGONSKULL += 1;
		};
	};
	if((JointBonusType != FALSE) && (HEROTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (HeroIsDead == FALSE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)))
	{
		TempJointBonusCount += 1;

		if((JointBonusType == 1) && (TempJointBonusCount >= 600))
		{
			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] - JointBonus_01;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - JointBonus_01;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] - JointBonus_01;
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] - JointBonus_01;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] - JointBonus_01;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] - JointBonus_01;
			};

			AI_Print("Cítíš se opět jako dřív...");
			JointBonusType = FALSE;
			TempJointBonusCount = FALSE;
		}
		else 	if((JointBonusType == 2) && (TempJointBonusCount >= 900))
		{
			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] - JointBonus_02;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - JointBonus_02;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] - JointBonus_02;
				MagicMeditation = FALSE;
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] - JointBonus_02;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] - JointBonus_02;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] - JointBonus_02;
				FightMeditation = FALSE;
			};

			AI_Print("Cítíš se opět jako dřív...");
			JointBonusType = FALSE;
			TempJointBonusCount = FALSE;
		}
		else if((JointBonusType == 3) && (TempJointBonusCount >= 1200))
		{
			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] - JointBonus_03;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] - JointBonus_03;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] - JointBonus_03;
				MagicMeditation = FALSE;
				ATR_INTELLECT -= 50;
				Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] - JointBonus_03;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] - JointBonus_03;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] - JointBonus_03;
				FightMeditation = FALSE;
				WarTranse = FALSE;
			};

			AI_Print("Cítíš se opět jako dřív...");
			JointBonusType = FALSE;
			TempJointBonusCount = FALSE;
		};
	};
	if((SBMODE == TRUE) && (HEROTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION != MOBSI_SleepAbit) && (Hero_Hunger >= 1))
	{
		GLTempStatusHungerCount += 1;			

		if(CurrentLevel == ORCMOUNTAIN_ZEN)
		{
			tmpHungerPool = 372 + (hero.level * 5);

			if(GLTempStatusHungerCount >= tmpHungerPool)
			{
				GLTempStatusHungerCount = FALSE;

				if(Hero_Hunger > 1)
				{
					Hero_Hunger -= 1;
				}
				else
				{
					Hero_Hunger = FALSE;
	
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						if(HeroNotMobsi == FALSE)
						{
							B_Say(hero,hero,"$NEEDEAT");
						};
					};
	
					AI_Print("Jsi hladový!");
				};
			};
		}
		else
		{
			tmpHungerPool = 496 + (hero.level * 5);

			if(GLTempStatusHungerCount >= tmpHungerPool)
			{
				GLTempStatusHungerCount = FALSE;

				if(Hero_Hunger > 1)
				{
					Hero_Hunger -= 1;
				}
				else
				{
					Hero_Hunger = FALSE;
	
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						if(HeroNotMobsi == FALSE)
						{
							B_Say(hero,hero,"$NEEDEAT");
						};
					};
	
					AI_Print("Jsi hladový!");
				};
			};
		};
	};
	if((SBMODE == TRUE) && (HEROTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION != MOBSI_SleepAbit) && (Hero_Thirst >= 1))
	{
		GLTempStatusThirstCount += 1;

		if(CurrentLevel == ADANOSVALLEY_ZEN)
		{
			tmpThirstPool = 462 + (hero.level * 5);

			if(GLTempStatusThirstCount >= tmpThirstPool)
			{
				GLTempStatusThirstCount = FALSE;

				if(Hero_Thirst > 1)
				{
					Hero_Thirst -= 1;
				}
				else
				{
					Hero_Thirst = FALSE;
	
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						if(HeroNotMobsi == FALSE)
						{
							B_Say(hero,hero,"$NEEDDRINK");
						};
					};
	
					AI_Print("Jsi hladový!");
				};
			};
		}
		else
		{
			tmpThirstPool = 616 + (hero.level * 5);

			if(GLTempStatusThirstCount >= tmpThirstPool)
			{
				GLTempStatusThirstCount = FALSE;

				if(Hero_Thirst > 1)
				{
					Hero_Thirst -= 1;
				}
				else
				{
					Hero_Thirst = FALSE;
	
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						if(HeroNotMobsi == FALSE)
						{
							B_Say(hero,hero,"$NEEDDRINK");
						};
					};
	
					AI_Print("Jsi hladový!");
				};
			};
		};
	};
	if((SBMODE == TRUE) && (HEROTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION != MOBSI_SleepAbit) && (CanChangeItem == TRUE) && (Hero_Fatigue >= 1) && (C_BodyStateContains(hero,BS_SIT) == FALSE))
	{
		GLTempStatusFatigueCount += 1;

		if(GLTempStatusFatigueCount >= 864)
		{
			GLTempStatusFatigueCount = FALSE;

			if(Hero_Fatigue > 1)
			{
				Hero_Fatigue -= 1;
			}
			else
			{
				Hero_Fatigue = FALSE;

				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					if(HeroNotMobsi == FALSE)
					{
						B_Say(hero,hero,"$NEEDSLEEP");
					};
				};

				AI_Print("Jsi unavený! Je čas si odpočinout...");
			};
		};
	};
	if((C_BodyStateContains(hero,BS_SIT) == TRUE) && (HEROTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE))
	{
		TempResetFatigue += 1;

		if(TempResetFatigue >= 216)
		{
			Hero_Fatigue += 1;				

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			TempResetFatigue = FALSE;
		};
	};
	if((BuffStoneGolemHeart == TRUE) && (BuffStoneGolemHeartDone == FALSE))
	{
		hero.protection[PROT_EDGE] += 50;
		hero.protection[PROT_BLUNT] += 50;
		hero.protection[PROT_POINT] += 50;
		BuffStoneGolemHeartDone = TRUE;
		BuffStoneGolemHeartCount  = FALSE;
	};
	if((BuffStoneGolemHeart == TRUE) && (BuffStoneGolemHeartDone == TRUE))
	{
		BuffStoneGolemHeartCount += 1;

		if(BuffStoneGolemHeartCount >= 300)
		{
			hero.protection[PROT_EDGE] -= 50;
			hero.protection[PROT_BLUNT] -= 50;
			hero.protection[PROT_POINT] -= 50;
			BuffStoneGolemHeartCount = FALSE;
			BuffStoneGolemHeartDone = FALSE;
			BuffStoneGolemHeart = FALSE;
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		};
	};
	if((BuffFireGolemHeart == TRUE) && (BuffFireGolemHeartDone == FALSE))
	{
		hero.protection[PROT_FIRE] += 25;
		BuffFireGolemHeartDone = TRUE;
		BuffFireGolemHeartCount  = FALSE;
	};
	if((BuffFireGolemHeart == TRUE) && (BuffFireGolemHeartDone == TRUE))
	{
		BuffFireGolemHeartCount += 1;

		if(BuffFireGolemHeartCount >= 300)
		{
			hero.protection[PROT_FIRE] -= 25;
			BuffFireGolemHeartCount = FALSE;
			BuffFireGolemHeartDone = FALSE;
			BuffFireGolemHeart = FALSE;
			Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
		};
	};
	if((BuffIceGolemHeart == TRUE) && (BuffIceGolemHeartDone == FALSE))
	{
		hero.protection[PROT_MAGIC] += 15;
		BuffIceGolemHeartDone = TRUE;
		BuffIceGolemHeartCount  = FALSE;
	};
	if((BuffIceGolemHeart == TRUE) && (BuffIceGolemHeartDone == TRUE))
	{
		BuffIceGolemHeartCount += 1;

		if(BuffIceGolemHeartCount >= 300)
		{
			hero.protection[PROT_MAGIC] -= 15;
			BuffIceGolemHeartCount = FALSE;
			BuffIceGolemHeartDone = FALSE;
			BuffIceGolemHeart = FALSE;
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
		};
	};
	if((BuffSwampGolemHeart == TRUE) && (BuffSwampGolemHeartDone == FALSE))
	{
		hero.protection[PROT_FLY] += 100;
		BuffSwampGolemHeartDone = TRUE;
		BuffSwampGolemHeartCount  = FALSE;
	};
	if((BuffSwampGolemHeart == TRUE) && (BuffSwampGolemHeartDone == TRUE))
	{
		BuffSwampGolemHeartCount += 1;

		if(BuffSwampGolemHeartCount >= 300)
		{
			hero.protection[PROT_FLY] -= 100;
			BuffSwampGolemHeartCount = FALSE;
			BuffSwampGolemHeartDone = FALSE;
			BuffSwampGolemHeart = FALSE;
			Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",hero,hero,0,0,0,FALSE);
		};
	};
	if(SleeperMaskIntBonus == TRUE)
	{
		tmpSleeperMaskIntBonus += 1;

		if(tmpSleeperMaskIntBonus >= 20)
		{
			ATR_INTELLECT -= 100;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			SleeperMaskIntBonus = FALSE;
			tmpSleeperMaskIntBonus = FALSE;
		};
	}

	//-----------------------------Tsiklicheskiy trigger-------------------------------------------

	if((HEROTRANS == FALSE) && (HeroNotMobsi == FALSE) && (ShakoIsOn == FALSE) && (ENDGAMECREDITS == FALSE) && (CamModeOn == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		itm = Npc_GetEquippedArmor(hero);

		B_CheckLog_Failed();
		B_CheckAutoDismount();

		if((CheckCampInfoDay < TempDayNow) && ((VALERANRECRUITEDDT == TRUE) || (EROLRECRUITEDDT == TRUE)))
		{
			EveryDayEconomicStuff();
			CheckCampInfoDay = Wld_GetDay();
		};

		B_DamageBonusDamage();

		if(HeroTransOpen == FALSE)
		{
			B_CheckMenuOption();
		};
		if(Npc_IsInFightMode(hero,FMODE_MAGIC) || (Hlp_InventoryIsOpen() == TRUE))
		{
			B_DamageCalcRunes();
		};
		if(Menu_ReadInt("AST","bShowNotice") == TRUE)
		{
			B_NoticeBoard();
		};
		if(Npc_HasEquippedArmor(hero) == FALSE)
		{
			tmpNoArmor += 1;

			if(tmpNoArmor >= 120)
			{
				if(PlayerIsWeakness == FALSE)
				{
					PlayerIsWeakness = TRUE;
				};
				if(PlayerIsSick == FALSE)
				{
					PlayerIsSick = TRUE;
				};

				tmpNoArmor = FALSE;
			};
		}
		else
		{
			if(tmpNoArmor != FALSE)
			{
				tmpNoArmor = FALSE;
			};
		};
		if((hero.aivar[AIV_INVINCIBLE] == TRUE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
		{
			hero.aivar[AIV_INVINCIBLE] = FALSE;
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (LoaOverParty == TRUE) && (LoaShadows == FALSE))
		{
			Wld_InsertNpc(Shadowbeast_Loa_01,"NW_FOREST_SHADOW_LOA_01");
			Wld_InsertNpc(Shadowbeast_Loa_02,"NW_FOREST_SHADOW_LOA_02");
			LoaShadows = TRUE;
		};
		if(CheckTorchIsOn == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
			CheckTorchIsOn = FALSE;
		};
		if(Npc_HasItems(hero,ItMw_DS_MonWeapon) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MonWeapon,Npc_HasItems(hero,ItMw_DS_MonWeapon));
		};
		if(Npc_HasItems(hero,ItMw_DS_MonWeapon_ExElite) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(hero,ItMw_DS_MonWeapon_ExElite));
		};
		if(Npc_HasItems(hero,ItMw_DS_MonWeapon_Elite) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MonWeapon_Elite,Npc_HasItems(hero,ItMw_DS_MonWeapon_Elite));
		};
		if(Npc_HasItems(hero,ItMw_DS_MonWeapon_Med) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MonWeapon_Med,Npc_HasItems(hero,ItMw_DS_MonWeapon_Med));
		};
		if(Npc_HasItems(hero,ItRw_Ass_2x2) >= 1)
		{
			Npc_RemoveInvItems(hero,ItRw_Ass_2x2,Npc_HasItems(hero,ItRw_Ass_2x2));
		};
		if(Npc_HasItems(hero,ItLsFireTorch) >= 1)
		{
			Npc_RemoveInvItems(hero,ItLsFireTorch,Npc_HasItems(hero,ItLsFireTorch));
		};
		if((SoulSenyakFree == TRUE) && (Npc_HasItems(hero,ItMi_StoneSoul_Senyak) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_StoneSoul_Senyak,Npc_HasItems(hero,ItMi_StoneSoul_Senyak));
		};
		if(Npc_HasItems(hero,ItMw_1H_AssBlade_View) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1H_AssBlade_View,Npc_HasItems(hero,ItMw_1H_AssBlade_View));
		};
		if(Npc_HasItems(hero,ItMw_2h_Rod_Fake) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,Npc_HasItems(hero,ItMw_2h_Rod_Fake));
		};
		if(Npc_HasItems(hero,ItMi_CanoneBall_Fire) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_CanoneBall_Fire,Npc_HasItems(hero,ItMi_CanoneBall_Fire));
		};
		if(Npc_HasItems(hero,ItMw_1h_MISC_Sword_Sum) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword_Sum,Npc_HasItems(hero,ItMw_1h_MISC_Sword_Sum));
		};
		if(Npc_HasItems(hero,ItMw_1h_MISC_Sword_Str) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword_Str,Npc_HasItems(hero,ItMw_1h_MISC_Sword_Str));
		};
		if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD_SUM) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD_SUM,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD_SUM));
		};
		if(Npc_HasItems(hero,ItMw_1h_MISC_Sword_Mst) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword_Mst,Npc_HasItems(hero,ItMw_1h_MISC_Sword_Mst));
		};
		if((CanSayLoaStay == TRUE) && (CamLoaLove == FALSE) && (LoaLoveSceneFailed == FALSE))
		{
			TempLoaAway += 1;

			if(LoaLoveScene == TRUE)
			{
				CamLoaLove = TRUE;
				TempLoaAway = FALSE;
			}
			else if(TempLoaAway == TRUE)
			{
				Wld_SendTrigger("EVT_CAM_LH");
			}
			else if(TempLoaAway == 20)
			{
				AI_Teleport(SLD_10920_Loa,"NW_LIGHTHOUSE_OUT_LOA_01");
				B_StartOtherRoutine(SLD_10920_Loa,"LoveScene");
			}
			else if(TempLoaAway >= 100)
			{
				if(LoaLoveScene == TRUE)
				{
					CamLoaLove = TRUE;
					TempLoaAway = FALSE;
				}
				else
				{
					AI_Teleport(SLD_10920_Loa,"BIGFARM");
					B_StartOtherRoutine(SLD_10920_Loa,"Start");
					TempLoaAway = FALSE;
					LoaLoveSceneFailed = TRUE;
				};
			};
		};
		if(IntroduceCH_01 == TRUE)
		{
			TempIntCH_01 += 1;

			if(TempIntCH_01 >= 3)
			{
				IntroduceChapter(KapWechsel_1_Text,"","chapter1.tga","New_Chapter.wav",8000);
				IntroduceCH_01 = FALSE;
				TempIntCH_01 = FALSE;			
			};
		}
		else if(IntroduceCH_02 == TRUE)
		{
			TempIntCH_02 += 1;

			if(TempIntCH_02 >= 3)
			{
				IntroduceChapter(KapWechsel_2_Text,"","chapter2.tga","New_Chapter.wav",8000);
				IntroduceCH_02 = FALSE;
				TempIntCH_02 = FALSE;			
			};
		}
		else if(IntroduceCH_03 == TRUE)
		{
			TempIntCH_03 += 1;

			if(TempIntCH_03 >= 3)
			{
				IntroduceChapter(KapWechsel_3_Text,"","chapter3.tga","New_Chapter.wav",8000);
				IntroduceCH_03 = FALSE;
				TempIntCH_03 = FALSE;			
			};
		}
		else if(IntroduceCH_04 == TRUE)
		{
			TempIntCH_04 += 1;

			if(TempIntCH_04 >= 3)
			{
				IntroduceChapter(KapWechsel_4_Text,"","chapter4.tga","New_Chapter.wav",8000);
				IntroduceCH_04 = FALSE;
				TempIntCH_04 = FALSE;			
			};
		}
		else if(IntroduceCH_05 == TRUE)
		{
			TempIntCH_05 += 1;

			if(TempIntCH_05 >= 3)
			{
				IntroduceChapter(KapWechsel_5_Text,"","chapter5.tga","New_Chapter.wav",8000);
				IntroduceCH_05 = FALSE;
				TempIntCH_05 = FALSE;			
			};
		}
		else if(IntroduceCH_06 == TRUE)
		{
			TempIntCH_06 += 1;

			if(TempIntCH_06 >= 3)
			{
				IntroduceChapter(KapWechsel_6_Text,"","chapter6.tga","New_Chapter.wav",8000);
				IntroduceCH_06 = FALSE;
				TempIntCH_06 = FALSE;			
			};
		}
		else if(IntroduceCH_07 == TRUE)
		{
			TempIntCH_07 += 1;

			if(TempIntCH_07 >= 3)
			{
				IntroduceChapter(KapWechsel_7_Text,"","chapter7.tga","New_Chapter.wav",8000);
				IntroduceCH_07 = FALSE;
				TempIntCH_07 = FALSE;	
			};

			CanMoveCrewBack = TRUE;		
		};

		B_CheckLog_Done();

		//--------------------------golod, zhazhda i utomlyayemost'---------------------------------------

		if((Hero_Thirst == FALSE) && (SBMODE == TRUE))
		{
			TempThirstCount += 1;

			if(TempThirstCount >= 31)
			{
				TempThirstCount = FALSE;

				if(Hero_Fatigue == FALSE)
				{
					if(hero.attribute[ATR_HITPOINTS_MAX] >= 100)
					{
						TempHungerThirstDeBuff = hero.attribute[ATR_HITPOINTS_MAX] / 100;
					}
					else
					{
						TempHungerThirstDeBuff = 1;
					};
				}
				else
				{
					if(hero.attribute[ATR_HITPOINTS_MAX] >= 100)
					{
						TempHungerThirstDeBuff = (hero.attribute[ATR_HITPOINTS_MAX] * 2) / 100;
					}
					else
					{
						TempHungerThirstDeBuff = 2;
					};
				};
				if(hero.attribute[ATR_HITPOINTS_MAX] > TempHungerThirstDeBuff)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-TempHungerThirstDeBuff);
				}
				else
				{
					if(Npc_IsInFightMode(hero,FMODE_NONE) == TRUE)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-TempHungerThirstDeBuff);
					};
				};
			};
		};
		if((Hero_Hunger == FALSE) && (SBMODE == TRUE))
		{
			TempHungerCount += 1;

			if(TempHungerCount >= 31)
			{
				TempHungerCount = FALSE;

				if(Hero_Fatigue == FALSE)
				{
					if(hero.attribute[ATR_HITPOINTS_MAX] >= 100)
					{
						TempHungerThirstDeBuff = hero.attribute[ATR_HITPOINTS_MAX] / 100;
					}
					else
					{
						TempHungerThirstDeBuff = 1;
					};
				}
				else
				{
					if(hero.attribute[ATR_HITPOINTS_MAX] >= 100)
					{
						TempHungerThirstDeBuff = (hero.attribute[ATR_HITPOINTS_MAX] * 2) / 100;
					}
					else
					{
						TempHungerThirstDeBuff = 2;
					};
				};
				if(hero.attribute[ATR_HITPOINTS_MAX] > TempHungerThirstDeBuff)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-TempHungerThirstDeBuff);
				}
				else
				{
					if(Npc_IsInFightMode(hero,FMODE_NONE) == TRUE)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-TempHungerThirstDeBuff);
					};
				};
			};
		};
		if((Hero_Fatigue == FALSE) && (SBMODE == TRUE))
		{
			TempFatigueCount += 1;

			if(TempFatigueCount >= 62)
			{
				TempFatigueCount = FALSE;
				TempHungerThirstDeBuff = (ATR_STAMINA_MAX[0] * 50) / 100;

				if(ATR_STAMINA[0] > TempHungerThirstDeBuff)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] - TempHungerThirstDeBuff;
				}
				else
				{
					ATR_STAMINA[0] = 0;
				};
			};
		};
		if((CurrentLevel == NEWWORLD_ZEN) && (NearFountainDone == FALSE))
		{
			if(Npc_GetDistToWP(hero,"NW_CITY_FOUNTAIN_01") <= 600)
			{
				if(NearFountain == TRUE)
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && C_BodyStateContains(hero,BS_STAND))
					{
						CountWaitSong += 1;

						if(CountWaitSong >= 5)
						{
							B_GivePlayerXP(100);
							B_Say(hero,hero,"$SONG_01");
							NearFountainDone = TRUE;
							CountWaitSong = FALSE;
						};
					};
				};
				if(NearFountain == FALSE)
				{
					B_Say(hero,hero,"$SURPRISE");
					NearFountain = TRUE;
					CountWaitSong = FALSE;
				};
			};
		};
		if(Wld_IsTime(4,0,5,0) == TRUE)
		{
			if(SunRiseDayCount < TempDayNow)
			{
				SunRiseRandom = Hlp_Random(5) ;

				if(SunRiseRandom == 0)
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						B_Say(hero,hero,"$SUNRISE");
					};
				};

				SunRiseDayCount = Wld_GetDay();
			};
		};
		if(Wld_IsTime(19,0,20,0) == TRUE)
		{
			if(SunDownDayCount < TempDayNow)
			{
				SunDownRandom = Hlp_Random(5) ;

				if(SunDownRandom == 0)
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						B_Say(hero,hero,"$SUNDOWN");
					};
				};

				SunDownDayCount = Wld_GetDay();
			};
		};
		if(Wld_IsRaining() == TRUE)
		{
			if(RainDayCount < TempDayNow)
			{
				rainrandom = Hlp_Random(5) ;

				if(rainrandom == 1)
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						B_Say(hero,hero,"$RAIN_01");
					};
				}
				else if(rainrandom == 2)
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						B_Say(hero,hero,"$RAIN_02");
					};
				};

				RainDayCount = Wld_GetDay();
			};
		};
		if((SBMODE == TRUE) && (PashalSVM == FALSE) && ((Npc_GetDistToWP(hero,"NW_CITY_HABOUR_TAVERN01_STAND_01") <= 500) || (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_09") <= 500) || (Npc_GetDistToWP(hero,"NW_TAVERNE_IN_GRAVO") <= 500) || (Npc_GetDistToWP(hero,"NW_TAVERNE_IN_RANGERMEETING") <= 500) || (Npc_GetDistToWP(hero,"NW_CITY_TAVERN_IN_04") <= 500)))
		{
			if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
			{
				B_Say(hero,hero,"$PASHAL_01");
			};

			PashalSVM = TRUE;
		};
		if((Mount_Up == FALSE) && (LowHealth == FALSE) && (PlayerSitDust == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
		{
			if(C_BodyStateContains(hero,BS_STAND))
			{
				WhistleCount += 1;
				//Print(IntToString(WhistleCount));

				if(WhistleCount == 100)
				{
					Mdl_RemoveOverlayMds(hero,"Humans_Arr.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Rel.mds");
					Mdl_RemoveOverlayMds(hero,"Humans_Trd.mds");
					randsiz = Hlp_Random(4);

					if(randsiz == 0)
					{
						Mdl_ApplyOverlayMds(hero,"Humans_Arr.mds");
					}
					else if(randsiz == 1)
					{
						Mdl_ApplyOverlayMds(hero,"Humans_Rel.mds");
					}		
					else if(randsiz == 2)
					{
						Mdl_ApplyOverlayMds(hero,"Humans_Trd.mds");
					};

					AI_PlayAniBS(hero,"T_STAND_2_SIT",BS_SIT);
					PlayerSitDust = TRUE;
				};
			}
			else if(!C_BodyStateContains(hero,BS_STAND) && !C_BodyStateContains(hero,BS_SIT))
			{
				if(PlayerSitDust == TRUE)
				{
					AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
				};

				PlayerSitDust = FALSE;
				WhistleCount = FALSE;
				bHeroRestStatus = FALSE;
				PauseCount = FALSE;
			}
			else if(Hlp_InventoryIsOpen() == TRUE)
			{
				if(PlayerSitDust == TRUE)
				{
					AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
				};

				PlayerSitDust = FALSE;
				WhistleCount = FALSE;
				bHeroRestStatus = FALSE;
				PauseCount = FALSE;
			};
		};
		if((PlayerSitDust == TRUE) && (bHeroRestStatus == FALSE))
		{
			PauseCount += 1;
			//Print(IntToString(PauseCount));

			if(PauseCount >= 10)
			{
				bHeroRestStatus = TRUE;
				PauseCount = FALSE;
			};
		};
		if((PlayerSitDust == TRUE) && (Hlp_GetHeroStatus() != HERO_NORMAL))
		{
			AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_SIT);
			PlayerSitDust = FALSE;
			WhistleCount = FALSE;
			bHeroRestStatus = FALSE;
			PauseCount = FALSE;
		};
		if(IhiyalRegen == TRUE)
		{
			if(SkeletonMage_Azgolor.attribute[ATR_HITPOINTS] > 100)
			{
				if(IzulgRingUp == FALSE)
				{
					Npc_ChangeAttribute(SkeletonMage_Azgolor,ATR_HITPOINTS,500);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				}
				else
				{
					IhiyalRegen = FALSE;
				};
				if(SkeletonMage_Azgolor.attribute[ATR_HITPOINTS] > SkeletonMage_Azgolor.attribute[ATR_HITPOINTS_MAX])
				{
					SkeletonMage_Azgolor.attribute[ATR_HITPOINTS] = SkeletonMage_Azgolor.attribute[ATR_HITPOINTS_MAX];
					IhiyalRegen = FALSE;
				};
				if(hero.attribute[ATR_MANA] > 1)
				{
					IhiyalRegen = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_BELIARSHRINE",SkeletonMage_Azgolor,SkeletonMage_Azgolor,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
				SkeletonMage_Azgolor.attribute[ATR_HITPOINTS] = SkeletonMage_Azgolor.attribute[ATR_HITPOINTS_MAX];
				hero.attribute[ATR_MANA] = 0;
				IhiyalRegen = FALSE;
			};
		};
		if((IzgulStep_01 == TRUE) && (IzgulCurse_01 == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0))
		{
			Wld_PlayEffect("SPELLFX_SUCKENERGY_BLOODFLY",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_SUCKENERGY_SENDPERCEPTION",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100);
			Npc_ChangeAttribute(Ghost_Uniq,ATR_HITPOINTS,100);
			TempIzgulCount +=1;

			if(TempIzgulCount >= 10)
			{
				AI_Dodge(Ghost_Uniq);
				TempIzgulCount = FALSE;
				IzgulCurse_01 = TRUE;
			};
		};
		if((IzgulStep_02 == TRUE) && (IzgulCurse_02 == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0))
		{
			Wld_PlayEffect("SPELLFX_SUCKENERGY_BLOODFLY",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_SUCKENERGY_SENDPERCEPTION",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100);
			Npc_ChangeAttribute(Ghost_Uniq,ATR_HITPOINTS,100);
			TempIzgulCount +=1;

			if(TempIzgulCount >= 10)
			{
				AI_Dodge(Ghost_Uniq);
				TempIzgulCount = FALSE;
				IzgulCurse_02 = TRUE;
			};
		};
		if((IzgulStep_03 == TRUE) && (IzgulCurse_03 == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0))
		{
			Wld_PlayEffect("SPELLFX_SUCKENERGY_BLOODFLY",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_SUCKENERGY_SENDPERCEPTION",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100);
			Npc_ChangeAttribute(Ghost_Uniq,ATR_HITPOINTS,100);
			TempIzgulCount +=1;

			if(TempIzgulCount >= 10)
			{
				AI_Dodge(Ghost_Uniq);
				TempIzgulCount = FALSE;
				IzgulCurse_03 = TRUE;
			};
		};
		if((CinemaMod == TRUE) && (OptionCheck == FALSE) && (HeroNotMobsi == FALSE) && (PrayMobileCheck == FALSE) && (IdolMobileCheck == FALSE))
		{
			Wld_StopEffect("DIALOGSCOPE_FX");
		}
		else if(CinemaMod == FALSE)
		{
			Wld_StopEffect("DIALOGSCOPE_FX");
		};
		if(Hlp_HasInSlot(hero,"ZS_LEFTHAND") == TRUE)
		{
			itmleft = Hlp_GetSlotItem(hero,"ZS_LEFTHAND");

			if(Hlp_IsItem(itmleft,ItLsTorchburning) == TRUE)
			{
				FakelIsOn = TRUE;
			};
		}
		else
		{
 			FakelIsOn = FALSE;
		};

		B_CheckTrophy();

		if((CanChangeItem == TRUE) && (STGameFT == FALSE))
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			bManaBar = 1;
			bHealthBar = 1;
			StaminaBar.bShow = 1;
			CanShowStamina = TRUE;
			STGameFT = TRUE;
		};
		if((CurrentLevel == PASHALWORLD_ZEN) && (MIS_PashalQuest == LOG_SUCCESS) && (PASHALAWAY == FALSE))
		{
			Wld_SendTrigger("EVT_BACK_ORCMOUNT");
			PASHALAWAY = TRUE;
		};
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) >= 1) && (ChelDrakGiveRight == FALSE))
		{
			Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
			CreateInvItems(hero,ItMw_1H_ChelDrak_Right_Hero,1);
			ChelDrakGiveRight = TRUE;
		};
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) >= 1) && (ChelDrakGiveLeft == FALSE))
		{
			Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
			CreateInvItems(hero,ItMw_1H_ChelDrak_Left_Hero,1);
			ChelDrakGiveLeft = TRUE;
		};
		if(Npc_HasItems(hero,ItMw_1H_IlArahBlade_Right_Npc) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1H_IlArahBlade_Right_Npc,Npc_HasItems(hero,ItMw_1H_IlArahBlade_Right_Npc));
			CreateInvItems(hero,ItMw_1H_IlArahBlade_Right,1);
		};
		if(Npc_HasItems(hero,ItMw_1H_IlArahBlade_Left_Npc) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_1H_IlArahBlade_Left_Npc,Npc_HasItems(hero,ItMw_1H_IlArahBlade_Left_Npc));
			CreateInvItems(hero,ItMw_1H_IlArahBlade_Left,1);
		};
		if((KvarhPeace == TRUE) && (KvarhAway == FALSE))
		{
			Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",NONE_ADDON_1158_Quarhodron,NONE_ADDON_1158_Quarhodron,0,0,0,FALSE);
			B_StartOtherRoutine(NONE_ADDON_1158_Quarhodron,"TOT");
			AI_Teleport(NONE_ADDON_1158_Quarhodron,"TOT");
			KvarhAway = TRUE;
		};
		if((PashalQuestJanusStep == TRUE) && (AvabulAway == FALSE))
		{
			Wld_PlayEffect("SPELLFX_INCOVATION_RED",VLK_4570_Avabul,VLK_4570_Avabul,0,0,0,FALSE);
			B_StartOtherRoutine(VLK_4570_Avabul,"TOT");
			AI_PlayAni(VLK_4570_Avabul,"T_PRACTICEMAGIC4");
			AI_Wait(VLK_4570_Avabul,1);
			AI_Teleport(VLK_4570_Avabul,"TOT");
			Wld_SendTrigger("EVT_DEMONSKULLUP");
			AvabulAway = TRUE;
		};
		if(CrushBonus2HOn == FALSE)
		{
			CrushBonus2HOn = TRUE;
		};
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			if((XARDAS_TP_OK == TRUE) || (TOWN_TP_OK == TRUE) || (TAVERNE_TP_OK == TRUE) || (PSI_TP_OK == TRUE) || (PASSOW_TP_OK == TRUE) || (BIGFARM_TP_OK == TRUE) || (KLOSTER_TP_OK == TRUE) || (SAGITTA_TP_OK == TRUE) || (HUNT_TP_OK == TRUE) || (VINOCAVE_TP_OK == TRUE) || (SUNCIRCLE_TP_OK == TRUE) || (ADWRUINS_TP_OK == TRUE) || (BLACKTROLL_TP_OK == TRUE))
			{
				B_TeleportMe_NW();
			};
		};
		if(CurrentLevel == OLDWORLD_ZEN)
		{
			if((CASTLE_TP_OK == TRUE) || (ICE_TP_OK == TRUE) || (SKLEP_TP_OK == TRUE) || (DARKTOWER_TP_OK == TRUE) || (OLDFORT_TP_OK == TRUE) || (OLDPSI_TP_OK == TRUE) || (NETBEK_TP_OK == TRUE) || (PASSNW_TP_OK == TRUE))
			{
				B_TeleportMe_OW();
			};
		};
		if(CurrentLevel == ADANOSVALLEY_ZEN)
		{
			if((TEARHRAM_TP_OK == TRUE) || (PYRAMIDE_TP_OK == TRUE) || (PASSAV_TP_OK == TRUE) || (LIFECIRCLE_TP_OK == TRUE) || (COMPLEX_TP_OK == TRUE))
			{
				B_TeleportMe_AV();
			};
		};
		if(CurrentLevel == ORCMOUNTAIN_ZEN)
		{
			if(ORCMOUNTAIN_TP_OK == TRUE)
			{
				B_TeleportMe_OZ();
			};
		};
		if(CurrentLevel == ADDONWORLD_ZEN)
		{
			if((ADW_TP_OK == TRUE) || (PIRATCAMP_TP_OK == TRUE))
			{
				B_TeleportMe_ADW();
			};
		};
		if(CurrentLevel != NEWWORLD_ZEN)
		{
			if((LOC_XARDAS_TP_OK == TRUE) || (LOC_TOWN_TP_OK == TRUE) || (LOC_TAVERNE_TP_OK == TRUE) || (LOC_PSI_TP_OK == TRUE) || (LOC_PASSOW_TP_OK == TRUE) || (LOC_BIGFARM_TP_OK == TRUE) || (LOC_KLOSTER_TP_OK == TRUE) || (LOC_SAGITTA_TP_OK == TRUE) || (LOC_HUNT_TP_OK == TRUE) || (LOC_VINOCAVE_TP_OK == TRUE) || (LOC_SUNCIRCLE_TP_OK == TRUE) || (LOC_ADWRUINS_TP_OK == TRUE) || (LOC_BLACKTROLL_TP_OK == TRUE))
			{
				B_LOC_TeleportMe_NW();
			};
		};
		if(CurrentLevel != OLDWORLD_ZEN)
		{
			if((LOC_CASTLE_TP_OK == TRUE) || (LOC_ICE_TP_OK == TRUE) || (LOC_SKLEP_TP_OK == TRUE) || (LOC_DARKTOWER_TP_OK == TRUE) || (LOC_OLDFORT_TP_OK == TRUE) || (LOC_OLDPSI_TP_OK == TRUE) || (LOC_NETBEK_TP_OK == TRUE) || (LOC_PASSNW_TP_OK == TRUE))
			{
				B_LOC_TeleportMe_OW();
			};
		};
		if(CurrentLevel != ADANOSVALLEY_ZEN)
		{
			if((LOC_TEARHRAM_TP_OK == TRUE) || (LOC_PYRAMIDE_TP_OK == TRUE) || (LOC_PASSAV_TP_OK == TRUE) || (LOC_LIFECIRCLE_TP_OK == TRUE) || (LOC_COMPLEX_TP_OK == TRUE))
			{
				B_LOC_TeleportMe_AV();
			};
		};
		if(CurrentLevel != ORCMOUNTAIN_ZEN)
		{
			if(LOC_ORCMOUNTAIN_TP_OK == TRUE)
			{
				B_LOC_TeleportMe_OZ();
			};
		};
		if(CurrentLevel != ADDONWORLD_ZEN)
		{
			if((LOC_ADW_TP_OK == TRUE) || (LOC_PIRATCAMP_TP_OK == TRUE))
			{
				B_LOC_TeleportMe_ADW();
			};
		};
		if((hero.guild != CheckHeroGuild[1]) && (CheckHeroGuild[0] == TRUE))
		{
			CheckHeroGuild[1] = hero.guild;
			CheckHeroGuild[0] = FALSE;
		};
		if((HeroIsDead == FALSE) && (hero.attribute[ATR_HITPOINTS] > 0) && (ATR_STAMINA[0] > 0) && (AIV_GiveShieldRes == TRUE))
		{
			if(SHIELDSTAM >= 4)
			{
				if(ATR_STAMINA[0] > CurShieldRes)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] - CurShieldRes;
				}
				else
				{
					ATR_STAMINA[0] = 0;
				};

				SHIELDSTAM = 0;
			}
			else
			{
				SHIELDSTAM += 1;
			};
		};
		if((POISONED == TRUE) && (ResistPoisonKnow == FALSE))
		{
			Poison_Lvls = 5 - SBMODE;

			if(Npc_IsInFightMode(hero,FMODE_MELEE))
			{
				Health_Lvls = 5 + (itm.weight + MELEEWEAPONINDEX + HelmStam + CurShieldRes) * Poison_Lvls;

				if(Poison_Lvls > 0)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-Poison_Lvls);
				};
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					if((ATR_STAMINA[0] > Health_Lvls) && (Health_Lvls > 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - Health_Lvls;
					}
					else if((ATR_STAMINA[0] > Health_Lvls) && (Health_Lvls == 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};
			}
			else if(Npc_IsInFightMode(hero,FMODE_FAR))
			{
				Health_Lvls = 5 + (itm.weight + RANGEWEAPONINDEX + HelmStam) * Poison_Lvls;

				if(Poison_Lvls > 0)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-Poison_Lvls);
				};
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					if((ATR_STAMINA[0] > Health_Lvls) && (Health_Lvls > 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - Health_Lvls;
					}
					else if((ATR_STAMINA[0] > Health_Lvls) && (Health_Lvls == 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};			
			}
			else if(Npc_IsInFightMode(hero,FMODE_FIST))
			{
				Health_Lvls = 5 + (itm.weight + HelmStam) * Poison_Lvls;

				if(Poison_Lvls > 0)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-Poison_Lvls);
				};
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					if((ATR_STAMINA[0] > Poison_Lvls) && (Poison_Lvls > 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - Poison_Lvls;
					}
					else if((ATR_STAMINA[0] > Poison_Lvls) && (Poison_Lvls == 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};	
				};
			}
			else
			{
				Health_Lvls = 5 + (itm.weight + HelmStam) * Poison_Lvls;

				if(Poison_Lvls > 0)
				{
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-Poison_Lvls);
				};
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					if((ATR_STAMINA[0] > Poison_Lvls) && (Poison_Lvls > 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - Poison_Lvls;
					}
					else if((ATR_STAMINA[0] > Poison_Lvls) && (Poison_Lvls == 0))
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};
			};
			if(SBMODE >= 1)
			{
				POISONED_TIC += 1;
	
				if((SBMODE == 2) && (POISONED_TIC >= 20))
				{
					POISONED = FALSE;
					POISONED_TIC = FALSE;
					CanPoisonMe = FALSE;
					MM_Poison_01_Up = FALSE;
					MM_Poison_02_Up = FALSE;
					MM_Poison_03_Up = FALSE;
				}
				else if((SBMODE == 4) && (POISONED_TIC >= 5))
				{
					POISONED = FALSE;
					POISONED_TIC = FALSE;
					CanPoisonMe = FALSE;
					MM_Poison_01_Up = FALSE;
					MM_Poison_02_Up = FALSE;
					MM_Poison_03_Up = FALSE;
				}
				else if((ResistPoisonKnow == TRUE) && (POISONED_TIC >= 2))
				{
					POISONED = FALSE;
					POISONED_TIC = FALSE;
					CanPoisonMe = FALSE;
					MM_Poison_01_Up = FALSE;
					MM_Poison_02_Up = FALSE;
					MM_Poison_03_Up = FALSE;
				};
			};
		}
		else
		{
			Poison_Lvls = 5 - SBMODE;
	
			if(Npc_IsInFightMode(hero,FMODE_MELEE))
			{
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}	
				else
				{
					if(SLD_EliteDo == FALSE)
					{
						if(C_BodyStateContains(hero,BS_HIT))
						{
							TempArmorStamina = itm.weight + MELEEWEAPONINDEX + HelmStam + CurShieldRes;

							if(ATR_STAMINA[0] > TempArmorStamina)
							{
								ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
							}
							else
							{
								ATR_STAMINA[0] = 0;
							};
						}
						else
						{
							CountTiks_Stam = CountTiks_Stam + 1;
	
							if((CountTiks_Stam >= 2) && C_BodyStateContains(hero,BS_STAND))
							{
								ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
								CountTiks_Stam = 0;
							}
							else if((CountTiks_Stam >= 1) && C_BodyStateContains(hero,BS_RUN))
							{
								ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
								CountTiks_Stam = 0;
							};
						};
					};
				};
			}
			else if(Npc_IsInFightMode(hero,FMODE_FAR))
			{
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					TempArmorStamina = RANGEWEAPONINDEX + (itm.weight / 2);

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						if(Npc_GetTarget(hero) == TRUE)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - 1;
						};
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};
			}
			else if(Npc_IsInFightMode(hero,FMODE_FIST))
			{
				if(ATR_STAMINA[0] <= 0)
				{
					if(hero.attribute[ATR_HITPOINTS] > 1)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1);
					};
				}
				else
				{
					if(C_BodyStateContains(hero,BS_HIT))
					{
						TempArmorStamina = itm.weight + HelmStam;
				
						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
						};
					};
				};
			};
		};

		//--------------------------raskhod vynosa pri podkradyvanii---------------------------------------

		if(C_BodyStateContains(hero,BS_SNEAK) && (FlyCarpetIsOn == FALSE) && (SLD_EliteDo == FALSE) && (Mount_Up == FALSE))
		{
			TempArmorStamina = 1 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 4;

			if(ATR_STAMINA[0] > TempArmorStamina)
			{
				ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
			}
			else
			{
				ATR_STAMINA[0] = 0;

				if(Npc_IsInFightMode(hero,FMODE_NONE) == TRUE)
				{
					ExStItem = Hlp_GetSlotItem(hero,"ZS_LEFTHAND");
		
					if(Hlp_IsValidItem(ExStItem))
					{
						Ext_RemoveFromSlot(hero,"ZS_LEFTHAND");	
						CreateInvItems(hero,ItLsTorch,1);
					};

					Mdl_RemoveOverlayMds(hero,"HUMANS_TORCH.MDS");
				};

				AI_PlayAniBS(hero,"T_SNEAK_2_RUN",BS_STAND);
				AI_Standup(hero);
			};
		};

		//--------------------------raskhod vynosa pri pryzhke---------------------------------------

		if((JumpDone == FALSE) && (FlyCarpetIsOn == FALSE) && (SLD_EliteDo == FALSE) && (Mount_Up == FALSE) && (HeroDrunk == FALSE) && (C_BodyStateContains(hero,BS_CLIMB) || C_BodyStateContains(hero,BS_JUMP) || C_BodyStateContains(hero,BS_PARADE)))
		{
			JumpDone = TRUE;

			if(IS_LOVCACH_ARMOR == TRUE)
			{
				if(LowHealth == FALSE)
				{
					if(CassiaTeachRegen == FALSE)
					{
						TempArmorStamina = 2 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 2;

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
						};
					}
					else
					{
						TempArmorStamina = 2 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 4;

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
						};
					};
				}
				else
				{
					TempArmorStamina = 2 + itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX;

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};
			}
			else
			{
				if(LowHealth == FALSE)
				{
					TempArmorStamina = 2 + itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX;

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				}
				else
				{
					TempArmorStamina = 2 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
					}
					else
					{
						ATR_STAMINA[0] = 0;
					};
				};
			};
		};

		//--------------------------raskhod vynosa pri sprinte---------------------------------------

		if(C_BodyStateContains(hero,BS_RUN) && (FlyCarpetIsOn == FALSE) && (Mount_Up == FALSE) && (SPRINT_ACTIVE == TRUE) && (bSprintTime == FALSE) && (ATR_STAMINA[0] > 0))
		{
			if(Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE)
			{
				if(IS_LOVCACH_ARMOR == TRUE)
				{
					if(CassiaTeachRegen == FALSE)
					{
						TempArmorStamina = 6 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX);

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
							SPRINT_ACTIVE = FALSE;
						};
					}
					else
					{
						TempArmorStamina = 6 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 2;

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
							SPRINT_ACTIVE = FALSE;
						};
					};
				}
				else
				{
					TempArmorStamina = 6 + itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX;

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
					}
					else
					{
						ATR_STAMINA[0] = 0;
						SPRINT_ACTIVE = FALSE;
					};
				};
			}
			else
			{
				if(IS_LOVCACH_ARMOR == TRUE)
				{
					if(CassiaTeachRegen == FALSE)
					{
						TempArmorStamina = 3 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 2;

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
							SPRINT_ACTIVE = FALSE;
						};
					}
					else
					{
						TempArmorStamina = 3 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) / 4;

						if(ATR_STAMINA[0] > TempArmorStamina)
						{
							ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
						}
						else
						{
							ATR_STAMINA[0] = 0;
							SPRINT_ACTIVE = FALSE;
						};
					};
				}
				else
				{
					TempArmorStamina = 3 + itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX;

					if(ATR_STAMINA[0] > TempArmorStamina)
					{
						ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
					}
					else
					{
						ATR_STAMINA[0] = 0;
						SPRINT_ACTIVE = FALSE;
					};
				};
			};
		};

		//--------------------------raskhod vynosa plavanii---------------------------------------

		if((Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (C_BodyStateContains(hero,BS_SWIM) || C_BodyStateContains(hero,BS_DIVE)))
		{
			TempSwimDelta = 3 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;

			if(TempSwimTick >= 2)
			{
				if(ATR_STAMINA[0] > tempswimdelta)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] - tempswimdelta;
				}
				else
				{
					ATR_STAMINA[0] = 0;

					if(hero.attribute[ATR_HITPOINTS] > 10)
					{
						AI_PlayAniBS(hero,"T_DIVE_2_DROWNED",BS_SWIM);
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS]/2);
					}
					else
					{
						hero.attribute[ATR_HITPOINTS] = 0;
						AI_PlayAniBS(hero,"T_DIVE_2_DROWNED",BS_DEAD);
					};
				};

				TempSwimTick = FALSE;
			}
			else
			{
				TempSwimTick += 1;
			};
		};

		//--------------------------Kholod i zhar---------------------------------------

		tmpPortalGuild = Wld_GetPlayerPortalGuild();

		if((Npc_HasEquippedArmor(hero) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE))
		{
			if(WarnNakedDay == FALSE)
			{
				AI_Print("Neběhej po světě nahý! Někdo si to může špatně vysvětlit...");
				WarnNakedDay = TRUE;
			};
		}
		else
		{
			if(WarnNakedDay == TRUE)
			{
				WarnNakedDay = FALSE;
			};
		};
		if((CurrentLevel == OLDWORLD_ZEN) && (Npc_GetDistToWP(hero,"OW_ICEREGION_99") <= 20000) && (ColdReduceKnow == FALSE) && (DragonIceIsDead == FALSE))
		{
			if((ColdReduceKnow == FALSE) && (ColdReduceKnowAtt == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$VERYCOLD");
				};

				AI_Print("Je tady velmi chladno!");
				ColdReduceKnowAtt = TRUE;
			};

			TempArmorStamina = 20 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;

			if(ATR_STAMINA[0] >= TempArmorStamina)
			{
				ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
			}
			else
			{
				ATR_STAMINA[0] = 0;
				hero.attribute[ATR_HITPOINTS] -= 5;
			};
		};
		if((CurrentLevel == OLDWORLD_ZEN) && (Npc_GetDistToWP(hero,"CASTLE_36") <= 5000) && (HotReduceKnow == FALSE) && (DragonFireIsDead == FALSE))
		{
			if((HotReduceKnow == FALSE) && (HotReduceKnowAtt == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$VERYHOT");
				};

				AI_Print("Je tady strašné horko!");
				HotReduceKnowAtt = TRUE;
			};

			TempArmorStamina = 20 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;

			if(ATR_STAMINA[0] >= TempArmorStamina)
			{
				ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
			}
			else
			{
				ATR_STAMINA[0] = 0;
				hero.attribute[ATR_HITPOINTS] -= 5;
			};
		};
		if((CurrentLevel == OLDWORLD_ZEN) && (Npc_GetDistToWP(hero,"OW_SWAMPDRAGON_01") <= 4000) && (ResistPoisonKnow == FALSE) && (DragonSwampIsDead == FALSE) && (POISONED == FALSE))
		{
			POISONED = TRUE;

			if((ResistPoisonKnow == FALSE) && (ResistPoisonKnowAtt == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$COUGH");
				};

				AI_Print("Jsou tady jedovaté výpary!");
				ResistPoisonKnowAtt = TRUE;
			};
		};
		if((CurrentLevel == PSICAMP_ZEN) && (ResistPoisonKnow == FALSE) && (POISONED == FALSE))
		{
			POISONED = TRUE;

			if((ResistPoisonKnow == FALSE) && (ResistPoisonKnowAtt == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$COUGH");
				};

				AI_Print("Jsou tady jedovaté výpary!");
				ResistPoisonKnowAtt = TRUE;
			};
		};
		if((CurrentLevel == LOSTVALLEY_ZEN) && (Npc_HasItems(hero,ItMi_IlisilAmulet) == FALSE))
		{
			if((HotReduceKnow == FALSE) && (HotReduceKnowAttLV == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$VERYHOT");
				};

				AI_Print("Je tady strašné horko!");
				HotReduceKnowAttLV = TRUE;
			};
	
			TempArmorStamina = 20 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;
	
			if(ATR_STAMINA[0] >= TempArmorStamina)
			{
				ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
			}
			else
			{
				ATR_STAMINA[0] = 0;
				hero.attribute[ATR_HITPOINTS] -= 5;
			};
		};
		if((CurrentLevel == ADANOSVALLEY_ZEN) && (Wld_IsTime(10,0,19,0) == TRUE) && (Wld_IsRaining() == FALSE) && (HotReduceKnow == FALSE))
		{
			if((Npc_GetDistToWP(hero,"TALL_DES_TODES_515") > 3000) && (Npc_GetDistToWP(hero,"NW_TROLLAREA_RITUAL_08_TEMP") > 3000) && (Npc_GetDistToWP(hero,"NW_TROLLAREA_RITUAL_08") > 3000) && (Npc_GetDistToWP(hero,"PYRAMIDE153") > 5000) && (Npc_GetDistToWP(hero,"PYRAMIDE153") > 5000) && (Npc_GetDistToWP(hero,"AV_HOTPOINT_01") > 3000) && (Npc_GetDistToWP(hero,"AV_HOTPOINT_02") > 1500) && (Npc_GetDistToWP(hero,"AV_PYRAMIDE_IN") > 5500) && (Npc_GetDistToWP(hero,"HOLLE11") > 10000))
			{
				if((HotReduceKnow == FALSE) && (HotReduceKnowAttAv == FALSE))
				{
					if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
					{
						B_Say(hero,hero,"$VERYHOT");
					};

					AI_Print("Je tady strašné horko!");
					HotReduceKnowAttAv = TRUE;
				};
	
				TempArmorStamina = 20 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;
	
				if(ATR_STAMINA[0] >= TempArmorStamina)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
				}
				else
				{
					ATR_STAMINA[0] = 0;
					hero.attribute[ATR_HITPOINTS] -= 5;
				};
			};
		};
		if((CurrentLevel == ORCMOUNTAIN_ZEN) && (ColdReduceKnow == FALSE))
		{
			if((ColdReduceKnow == FALSE) && (ColdReduceKnowAttOM == FALSE))
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					B_Say(hero,hero,"$VERYCOLD");
				};

				AI_Print("Je tady velmi chladno!");
				ColdReduceKnowAttOM = TRUE;
			};

			TempArmorStamina = 20 + (itm.weight + HelmStam + CurShieldRes + MELEEWEAPONINDEX + RANGEWEAPONINDEX) * 2;

			if(ATR_STAMINA[0] >= TempArmorStamina)
			{
				ATR_STAMINA[0] = ATR_STAMINA[0] - TempArmorStamina;
			}
			else
			{
				ATR_STAMINA[0] = 0;
				hero.attribute[ATR_HITPOINTS] -= 5;
			};
		};
 		if((SleeperStone == FALSE) && (InsanePower == TRUE))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100);
		};

		//---------------------------------------------------------------------------

		if((hero.attribute[ATR_HITPOINTS] <= 0) && (HERDIED == 0))
		{
			AI_RemoveWeapon(hero);
			hero.attribute[ATR_HITPOINTS] = 0;

			if(!C_BodyStateContains(hero,BS_SWIM) && !C_BodyStateContains(hero,BS_DIVE))
			{
				AI_PlayAniBS(hero,"T_DEAD",BS_DEAD);
			};

			Snd_Play("SVM_15_DEAD");
			HERDIED = 1;
		};
		if(SC_IsObsessed == TRUE)
		{
			ObsessedTick += 1;

			if(ObsessedTick > 20)
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-50);
				ObsessedTick = FALSE;
			};
		};
		if((PsiCamp_03_Ok == TRUE) && (HanisIsDead == FALSE))
		{	
			npc = Hlp_GetNpc(tpl_8045_hanis);

			if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
			{
				npc.aivar[93] = FALSE;
				Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("SPELLFX_POISONBLADE",npc,npc,0,0,0,FALSE);
			};

			HanisIsDead = TRUE;
		};
		if(POISONED == FALSE)
		{
			FONT_PERC_BAR = "FONT_OLD_10_WHITE_PB.tga";

			if(PoisonedMe == TRUE)
			{
				Wld_StopEffect("POISONED_FX");
				PoisonedMe = FALSE;
				TimerPoisonUpTic = FALSE;
				TimerPoisonUp = FALSE;
			};
		}
		else
		{
			if(PoisonedMe == FALSE)
			{
				//Wld_PlayEffect("POISONED_FX",hero,hero,0,0,0,FALSE);
				PoisonedMe = TRUE;
			};
		};
		if((Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (hero.attribute[ATR_HITPOINTS] <= TempHealth))
		{
			if(LowHealth == FALSE)
			{
				if(HelmIsUp == TRUE)
				{
					if(TempHelmModel == FALSE)
					{
						if(HeroBoldHead == TRUE)
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							};
						}
						else
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
							};
						};
					}
					else
					{
						if(HeroBoldHead == TRUE)
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							};
						}
						else
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
							};
						};
					};
				}
				else
				{
					if(HeroBoldHead == TRUE)
					{
						if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
						};
					}
					else
					{
						if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
						};
					};
				};
				if(SPRINT_ACTIVE == TRUE)
				{
					SPRINT_ACTIVE = FALSE;
				};

				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");

				if(Npc_IsInFightMode(hero,FMODE_FAR) == FALSE)
				{
					Mdl_RemoveOverlayMds(hero,"humans_BowT2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_BowT1.mds");
					Mdl_RemoveOverlayMds(hero,"humans_CBowT2.mds");
					Mdl_RemoveOverlayMds(hero,"humans_CBowT1.mds");
				}
				else
				{
					BowmenCheck = TRUE;
				};
				if((RH_Ready_2X2 == TRUE) && (LH_Ready_2X2 == TRUE))
				{
					Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
					Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE) || (AIV_Speer == TRUE))
				{
					if((AIV_Staff_01 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_10 == TRUE))
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					}
					else if((AIV_Staff_02 == TRUE) || (AIV_Staff_07 == TRUE))
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					}
					else if((AIV_Staff_03 == TRUE) || (AIV_Staff_08 == TRUE))
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					}
					else if((AIV_Staff_04 == TRUE) || (AIV_Staff_09 == TRUE))
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					}
					else if((AIV_Staff_05 == TRUE) || (AIV_Staff_Blood == TRUE))
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					}
					else if(AIV_Speer == TRUE)
					{
						Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
				}
				else
				{
					Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
				};

				LowHealth = TRUE;

				if(Npc_IsInFightMode(hero,FMODE_NONE) == TRUE)
				{
					B_Say(hero,hero,"$Aargh_3");
				};

				if(PlayerSitDust == TRUE)
				{
					AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
				};

				PlayerSitDust = FALSE;
				WhistleCount = FALSE;
			};
		}
		else
		{
			if(LowHealth == TRUE)
			{
				if(HelmIsUp == TRUE)
				{
					if(TempHelmModel == FALSE)
					{
						if(HeroBoldHead == TRUE)
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							};
						}
						else
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
							};
						};
					}
					else
					{
						if(HeroBoldHead == TRUE)
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
							};
						}
						else
						{
							if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
							}
							else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
							{
								Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
							};
						};
					};
				}
				else
				{
					if(HeroBoldHead == TRUE)
					{
						if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
						};
					}
					else
					{
						if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
						}
						else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
						{
							Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
						};
					};
				};

				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_BowT2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_BowT1.mds");
				Mdl_RemoveOverlayMds(hero,"humans_CBowT2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_CBowT1.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");

				if((RH_Ready_2X2 == TRUE) && (LH_Ready_2X2 == TRUE))
				{
					Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE) || (AIV_Speer == TRUE))
				{
					if((AIV_Staff_01 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_10 == TRUE))
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					}
					else if((AIV_Staff_02 == TRUE) || (AIV_Staff_07 == TRUE))
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					}
					else if((AIV_Staff_03 == TRUE) || (AIV_Staff_08 == TRUE))
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					}
					else if((AIV_Staff_04 == TRUE) || (AIV_Staff_09 == TRUE))
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					}
					else if((AIV_Staff_05 == TRUE) || (AIV_Staff_Blood == TRUE))
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					}
					else if(AIV_Speer == TRUE)
					{
						if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
						{
							Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
						}
						else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
						{
							Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
						};
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					if(hero.attribute[ATR_REGENERATEMANA] >= 90)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
					};
				}
				else if((RH_Ready_2X2 == TRUE) && (LH_Ready_2X2 == FALSE))
				{
					Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				}
				else
				{
					if((hero.HitChance[NPC_TALENT_1H] >= 90) && (EquipedIndex_Chief == FALSE))
					{
						Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
					}
					else if((hero.HitChance[NPC_TALENT_1H] >= 60) && (EquipedIndex_Chief == FALSE))
					{
						Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
					}
					else if((hero.HitChance[NPC_TALENT_1H] >= 30) && (EquipedIndex_Chief == FALSE))
					{
						Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
					};
					if(hero.HitChance[NPC_TALENT_2H] >= 90)
					{
						if(AXE_ST3 == TRUE)
						{
							Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
						}
						else
						{
							Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
						};
					}
					else if(hero.HitChance[NPC_TALENT_2H] >= 60)
					{
						if(AXE_ST2 == TRUE)
						{
							Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
						}
						else
						{
							Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
						};
					}
					else if(hero.HitChance[NPC_TALENT_2H] >= 30)
					{
						Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
					};
				};
				if(hero.HitChance[NPC_TALENT_BOW] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_BowT2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_BOW] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_BowT1.mds");
				};
				if(hero.HitChance[NPC_TALENT_CROSSBOW] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_CBowT2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_CROSSBOW] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_CBowT1.mds");
				};

				B_CheckAcroAni(hero);
				BowmenCheck = FALSE;
				LowHealth = FALSE;
			};
		};
		if(hero.attribute[ATR_HITPOINTS] <= TempCritHealth)
		{
			if(CritHealth == FALSE)
			{
				//Wld_PlayEffect("LOWHEALTH_FX",hero,hero,0,0,0,FALSE);
				CritHealth = TRUE;
			};
		}
		else
		{
			if(CritHealth == TRUE)
			{
				Wld_StopEffect("LOWHEALTH_FX");
				CritHealth = FALSE;
				TimerLowHealthUpTic = FALSE;
				TimerLowHealthUp = FALSE;
			};
		};
		if(CheckCampfireMeat == TRUE)
		{
			Npc_RemoveInvItems(hero,ItFoMutton,1);
			CreateInvItems(hero,ItFoMuttonRaw,1);
			CheckCampfireMeat = FALSE;
		};
		if(LVStatsCheck[8] == TRUE)
		{
			LVStatsCheck[8] = FALSE;
			Wld_ChangeLevel("NEWWORLD\LOSTVALLEY.ZEN","LOSTVALLEY_START");
		};
	};
	if((CraitExpLvl >= CraitExpLvl_Next) && (CraitIsUp == TRUE))
	{
		CraitLvl += 1;
		CraitExpLvl_Next = CraitExpLvl_Next + ((CraitLvl + 1) * 500);
		CraitCanUp = TRUE;
		AI_Print("Nová úroveň zvířat!");
	};
	if((CraitIsUp == TRUE) && (CraitCanUp == TRUE))
	{
		Crait.attribute[ATR_STRENGTH] = 275 + (CraitLvl * 10);
		Crait.attribute[ATR_DEXTERITY] = 200 + (CraitLvl * 10);
		Crait.attribute[ATR_HITPOINTS_MAX] = 1000 + (CraitLvl * 50);
		Crait.protection[PROT_BLUNT] = 145 + (CraitLvl * 5);
		Crait.protection[PROT_EDGE] = 120 + (CraitLvl * 5);
		Crait.protection[PROT_POINT] = 100 + (CraitLvl * 5);
		Crait.protection[PROT_FIRE] = 20 + (CraitLvl * 5);
		Crait.protection[PROT_FLY] = 50 + (CraitLvl * 5);
		Crait.protection[PROT_MAGIC] = 20 + (CraitLvl * 5);
		CraitCanUp = FALSE;
	};
	if((bDevMode == TRUE) && (GuruTest[1] == FALSE))
	{
		AI_Wait(hero,1);
	};
	if((InsertJohnJonni == TRUE) && (RemoveJohnJonni == FALSE) && (Npc_GetDistToWP(hero,"NW_CITY_HABOUR_KASERN_JOHN_01") > 2000))
	{
		B_StartOtherRoutine(Mil_362_Miliz,"TOT");
		AI_Teleport(Mil_362_Miliz,"TOT");
		B_StartOtherRoutine(Mil_363_Miliz,"TOT");
		AI_Teleport(Mil_363_Miliz,"TOT");
		RemoveJohnJonni = TRUE;
	};
	if((MineKingArrive == TRUE) && (MineKingArriveDone == FALSE))
	{
		tmpTimerCaracust += 1;

		if(tmpTimerCaracust > 10)
		{
			tmpTimerCaracust = FALSE;
			MineKingArriveDone = TRUE;
			AI_Teleport(Caracust,"FEUERHOLLESW");
			AI_GotoWP(Caracust,"DAMAGE_KOLONA");
			AI_AlignToWP(Caracust);
		};
	};

	//-------------------epik danzh------------------------------------------

	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		if((CurrentLevel == LOSTVALLEY_ZEN) && (EpicJorneyStart == FALSE) && (Npc_GetDistToWP(hero,"LOSTVALLEY_START") > 1500) && (Npc_HasItems(hero,ItMi_IlisilAmulet) == FALSE))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
		};
		if(PaleCrawlerFight == TRUE)
		{
			if(Npc_GetDistToNpc(PaleCrawler,hero) > 650)
			{
				PaleCrawler_RandyAttack = Hlp_Random(100);

				if(PaleCrawler_RandyAttack <= 5)
				{
					AI_TurnToNPC(PaleCrawler,hero);
					AI_PlayAni(PaleCrawler,"T_WARN");
					AI_Wait(PaleCrawler,2);
					Wld_PlayEffect("SPELLFX_SPIDERWEB",PaleCrawler,hero,2,500,DAM_MAGIC,TRUE);
				};
			}
			else if(Npc_GetDistToWP(hero,"LOSTVALLEY_PALECRAWLER") > 3000)
			{
				AI_TurnToNPC(PaleCrawler,hero);
				AI_PlayAni(PaleCrawler,"T_WARN");
				AI_Wait(PaleCrawler,2);
				Wld_PlayEffect("SPELLFX_SPIDERWEB",PaleCrawler,hero,2,10000,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			}
			else if(Npc_GetDistToWP(PaleCrawler,"LOSTVALLEY_PALECRAWLER") > 3000)
			{
				AI_TurnToNPC(PaleCrawler,hero);
				AI_PlayAni(PaleCrawler,"T_WARN");
				AI_Wait(PaleCrawler,2);
				Wld_PlayEffect("SPELLFX_SPIDERWEB",PaleCrawler,hero,2,10000,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			}
			else if(Npc_GetDistToNpc(PaleCrawler,hero) > 3000)
			{
				AI_TurnToNPC(PaleCrawler,hero);
				AI_PlayAni(PaleCrawler,"T_WARN");
				AI_Wait(PaleCrawler,2);
				Wld_PlayEffect("SPELLFX_SPIDERWEB",PaleCrawler,hero,2,10000,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			};
			if(HeroIsDead == TRUE)
			{
				PaleCrawlerFight = FALSE;
			};
		};
		if(AraharPlagueFight == TRUE)
		{
			AraharPlagueCountAOE += 1;

			if((AraharPlagueSpawn_01 == FALSE) && (AraharPlagueSpawn_02 == FALSE) && (AraharPlagueSpawn_03 == FALSE) && (AraharPlagueSpawn_04 == FALSE) && (AraharPlagueSpawn_05 == FALSE))
			{
				AraharPlagueCount += 1;
			};
			if(AraharPlagueCountAOE >= 50)
			{
				AI_TurnToNPC(AraharPlague,hero);
				AI_PlayAni(AraharPlague,"T_WARN");
				AI_Wait(AraharPlague,2);
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",AraharPlague,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",AraharPlague,hero,0,0,0,FALSE);
				PlayerIsCurse = TRUE;
				PlayerIsSick = TRUE;

				if(hero.protection[PROT_MAGIC] < 1200)
				{
					DamageAraharPlagueAOE = 1200 - hero.protection[PROT_MAGIC];
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-DamageAraharPlagueAOE);
				};

				AraharPlagueCountAOE = FALSE;
			}
			else
			{
				AraharPlague_RandyAttack = Hlp_Random(100);

				if(AraharPlague_RandyAttack <= 5)
				{
					AI_TurnToNPC(AraharPlague,hero);
					Wld_PlayEffect("SPELLFX_SWARM",AraharPlague,hero,2,750,DAM_MAGIC,TRUE);
				};
	
				if(AraharPlagueCount >= 50)
				{
					Wld_InsertNpc(Zombie_AraharPlague_01,"LOSTVALLEY_ZOMBIE_01");
					Wld_InsertNpc(Zombie_AraharPlague_02,"LOSTVALLEY_ZOMBIE_02");
					Wld_InsertNpc(Zombie_AraharPlague_03,"LOSTVALLEY_ZOMBIE_03");
					Wld_InsertNpc(Zombie_AraharPlague_04,"LOSTVALLEY_ZOMBIE_04");
					Wld_InsertNpc(Zombie_AraharPlague_05,"LOSTVALLEY_ZOMBIE_05");
					AraharPlagueCount = FALSE;
					AraharPlagueSpawn_01 = TRUE;
					AraharPlagueSpawn_02 = TRUE;
					AraharPlagueSpawn_03 = TRUE;
					AraharPlagueSpawn_04 = TRUE;
					AraharPlagueSpawn_05 = TRUE;
				};
				if(Npc_GetDistToWP(AraharPlague,"LOSTVALLEY_ARAHARPLAGUE") > 3000)
				{
					AI_TurnToNPC(AraharPlague,hero);
					AI_PlayAni(AraharPlague,"T_WARN");
					AI_Wait(AraharPlague,2);
					Wld_PlayEffect("SPELLFX_SWARM",AraharPlague,hero,2,10000,DAM_MAGIC,TRUE);
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				}		
				else if(Npc_GetDistToNpc(AraharPlague,hero) > 3000)
				{
					AI_TurnToNPC(AraharPlague,hero);
					AI_PlayAni(AraharPlague,"T_WARN");
					AI_Wait(AraharPlague,2);
					Wld_PlayEffect("SPELLFX_SWARM",AraharPlague,hero,2,10000,DAM_MAGIC,TRUE);
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				};
				if((Npc_GetDistToNpc(AraharPlague,Zombie_AraharPlague_01) <= 350) && (AraharPlagueSpawn_01 == TRUE))
				{
					Wld_PlayEffect("VOB_MAGICBURN",Zombie_AraharPlague_01,Zombie_AraharPlague_01,0,0,0,FALSE);
					Npc_ChangeAttribute(Zombie_AraharPlague_01,ATR_HITPOINTS,-10000);
					Wld_PlayEffect("spellFX_INCOVATION_RED",AraharPlague,AraharPlague,0,0,0,FALSE);
					AraharPlagueSpawn_01 = FALSE;
					AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS] + ((AraharPlague.attribute[ATR_HITPOINTS_MAX] * 5) / 100);
	
					if(AraharPlague.attribute[ATR_HITPOINTS] > AraharPlague.attribute[ATR_HITPOINTS_MAX])
					{
						AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS_MAX];
					};

					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				};
				if((Npc_GetDistToNpc(AraharPlague,Zombie_AraharPlague_02) <= 350) && (AraharPlagueSpawn_02 == TRUE))
				{
					Wld_PlayEffect("VOB_MAGICBURN",Zombie_AraharPlague_02,Zombie_AraharPlague_02,0,0,0,FALSE);
					Npc_ChangeAttribute(Zombie_AraharPlague_02,ATR_HITPOINTS,-10000);
					Wld_PlayEffect("spellFX_INCOVATION_RED",AraharPlague,AraharPlague,0,0,0,FALSE);
					AraharPlagueSpawn_02 = FALSE;
					AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS] + ((AraharPlague.attribute[ATR_HITPOINTS_MAX] * 5) / 100);
	
					if(AraharPlague.attribute[ATR_HITPOINTS] > AraharPlague.attribute[ATR_HITPOINTS_MAX])
					{
						AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS_MAX];
					};
	
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				};
				if((Npc_GetDistToNpc(AraharPlague,Zombie_AraharPlague_03) <= 350) && (AraharPlagueSpawn_03 == TRUE))
				{
					Wld_PlayEffect("VOB_MAGICBURN",Zombie_AraharPlague_03,Zombie_AraharPlague_03,0,0,0,FALSE);
					Npc_ChangeAttribute(Zombie_AraharPlague_03,ATR_HITPOINTS,-10000);
					Wld_PlayEffect("spellFX_INCOVATION_RED",AraharPlague,AraharPlague,0,0,0,FALSE);
					AraharPlagueSpawn_03 = FALSE;
					AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS] + ((AraharPlague.attribute[ATR_HITPOINTS_MAX] * 5) / 100);
	
					if(AraharPlague.attribute[ATR_HITPOINTS] > AraharPlague.attribute[ATR_HITPOINTS_MAX])
					{
						AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS_MAX];
					};
	
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				};
				if((Npc_GetDistToNpc(AraharPlague,Zombie_AraharPlague_04) <= 350) && (AraharPlagueSpawn_04 == TRUE))
				{
					Wld_PlayEffect("VOB_MAGICBURN",Zombie_AraharPlague_04,Zombie_AraharPlague_04,0,0,0,FALSE);
					Npc_ChangeAttribute(Zombie_AraharPlague_04,ATR_HITPOINTS,-10000);
					Wld_PlayEffect("spellFX_INCOVATION_RED",AraharPlague,AraharPlague,0,0,0,FALSE);
					AraharPlagueSpawn_04 = FALSE;
					AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS] + ((AraharPlague.attribute[ATR_HITPOINTS_MAX] * 5) / 100);
	
					if(AraharPlague.attribute[ATR_HITPOINTS] > AraharPlague.attribute[ATR_HITPOINTS_MAX])
					{
						AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS_MAX];
					};

					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				};
				if((Npc_GetDistToNpc(AraharPlague,Zombie_AraharPlague_05) <= 350) && (AraharPlagueSpawn_05 == TRUE))
				{
					Wld_PlayEffect("VOB_MAGICBURN",Zombie_AraharPlague_05,Zombie_AraharPlague_05,0,0,0,FALSE);
					Npc_ChangeAttribute(Zombie_AraharPlague_05,ATR_HITPOINTS,-10000);
					Wld_PlayEffect("spellFX_INCOVATION_RED",AraharPlague,AraharPlague,0,0,0,FALSE);
					AraharPlagueSpawn_05 = FALSE;
					AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS] + ((AraharPlague.attribute[ATR_HITPOINTS_MAX] * 5) / 100);
	
					if(AraharPlague.attribute[ATR_HITPOINTS] > AraharPlague.attribute[ATR_HITPOINTS_MAX])
					{
						AraharPlague.attribute[ATR_HITPOINTS] = AraharPlague.attribute[ATR_HITPOINTS_MAX];
					};

					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-250);
				};
			};
			if(HeroIsDead == TRUE)
			{
				AraharPlagueFight = FALSE;
			};
		};
		if(ShadowGuardFight == TRUE)
		{
			if((ShadowGuardOneIsDead == FALSE) && (ShadowGuardTwoIsDead == FALSE))
			{
				ShadowTwinsCount += 1;

				if(FirstAppearMoonSun == FALSE)
				{
					PrintScreen("... Slunce a Měsíc jsou silnější než kdy jindy...",-1,60,FONT_NEWLEVEL,4);
					FirstAppearMoonSun = TRUE;
				};
				if((Npc_GetDistToWP(ShadowGuardOne,"LOSTVALLEY_SHADOWGUARD_01") > 3000) || (Npc_GetDistToWP(ShadowGuardTwo,"LOSTVALLEY_SHADOWGUARD_02") > 3000))
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				}	
				else if((Npc_GetDistToNpc(ShadowGuardOne,hero) > 3000) || (Npc_GetDistToNpc(ShadowGuardTwo,hero) > 3000))
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				}
				else if(Npc_GetDistToWP(hero,"LOSTVALLEY_SHADOWGUARD_CENTER") > 3000)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				};
				if((ShadowTwinsCount >= 15) && (ShadowSunRests == FALSE) && (ShadowMoonRests == FALSE))
				{
					if((ShadowDayTime_Sun == FALSE) && (ShadowDayTime_Moon == FALSE))
					{
						ShadowDayTime_Sun = FALSE;	
						ShadowDayTime_Moon = TRUE;
						ShadowKeyTime = FALSE;
					}
					else if((ShadowDayTime_Sun == TRUE) && (ShadowDayTime_Moon == FALSE))
					{
						ShadowDayTime_Sun = FALSE;	
						ShadowDayTime_Moon = TRUE;
						ShadowKeyTime = FALSE;
					}
					else if((ShadowDayTime_Sun == FALSE) && (ShadowDayTime_Moon == TRUE))
					{
						ShadowDayTime_Sun = TRUE;	
						ShadowDayTime_Moon = FALSE;
						ShadowKeyTime = FALSE;
					};

					ShadowTwinsCount = FALSE;
				};
				if((ShadowDayTime_Moon == TRUE) && (ShadowKeyTime == FALSE))			//-----------Nastupayet noch'----------------------
				{
					ShadowSunCount += 1;

					if(ShadowSunRests == FALSE)
					{
						TempGuardOneHP = ShadowGuardOne.attribute[ATR_HITPOINTS];
						TempGuardTwoHP = ShadowGuardTwo.attribute[ATR_HITPOINTS];
						Wld_SetTime(22,0);
						PrintScreen("... noc přišla, Měsíc vyšel...",-1,60,FONT_NEWLEVEL,3);
						ShadowGuardOne.attribute[ATR_HITPOINTS] = TempGuardOneHP;
						ShadowGuardTwo.attribute[ATR_HITPOINTS] = TempGuardTwoHP;
						ShadowGuardOne.flags = NPC_FLAG_IMMORTAL;
						ShadowGuardTwo.flags = 0;
						Npc_PerceiveAll(ShadowGuardOne);
						Npc_ClearAIQueue(ShadowGuardOne);
						AI_Standup(ShadowGuardOne);
						AI_PlayAni(ShadowGuardOne,"T_MAGRUN_2_HEASHOOT");
						Wld_PlayEffect("SPELLFX_HEALSHRINE",ShadowGuardOne,ShadowGuardOne,0,0,0,FALSE);
						AI_Wait(ShadowGuardOne,15);
						ShadowSunRests = TRUE;
					};
					if(ShadowSunCount >= 15)
					{
						PrintScreen("... Slunce a Měsíc jsou blízko sebe...",-1,60,FONT_NEWLEVEL,3);
						AI_PlayAni(ShadowGuardOne,"T_HEASHOOT_2_STAND");
						ShadowGuardOne.flags = NPC_FLAG_IMMORTAL;
						ShadowGuardTwo.flags = NPC_FLAG_IMMORTAL;
						ShadowTwinsCount = FALSE;
						ShadowSunCount = FALSE;
						ShadowSunRests = FALSE;
						ShadowKeyTime = TRUE;
						Wld_PlayEffect("spellFX_INCOVATION_BLUE",ShadowGuardOne,ShadowGuardOne,0,0,0,FALSE);

						if(Npc_GetDistToNpc(ShadowGuardOne,hero) < 1000)
						{
							Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",hero,hero,0,0,0,FALSE);
							Npc_ChangeAttribute(hero,ATR_HITPOINTS,-500);
						};
					}
					else
					{
						ShadowGuardOne.attribute[ATR_HITPOINTS] += 50;
	
						if(ShadowGuardOne.attribute[ATR_HITPOINTS] >= ShadowGuardOne.attribute[ATR_HITPOINTS_MAX])
						{
							ShadowGuardOne.attribute[ATR_HITPOINTS] = ShadowGuardOne.attribute[ATR_HITPOINTS_MAX];
						};
					};
				}
				else if((ShadowDayTime_Sun == TRUE) && (ShadowKeyTime == FALSE))		//-----------Nastupayet den'----------------------
				{
					ShadowMoonCount += 1;

					if(ShadowMoonRests == FALSE)
					{
						TempGuardOneHP = ShadowGuardOne.attribute[ATR_HITPOINTS];
						TempGuardTwoHP = ShadowGuardTwo.attribute[ATR_HITPOINTS];
						Wld_SetTime(8,0);
						PrintScreen("... ráno přišlo, Slunce vyšlo...",-1,60,FONT_NEWLEVEL,3);
						ShadowGuardOne.attribute[ATR_HITPOINTS] = TempGuardOneHP;
						ShadowGuardTwo.attribute[ATR_HITPOINTS] = TempGuardTwoHP;
						ShadowGuardOne.flags = 0;
						ShadowGuardTwo.flags = NPC_FLAG_IMMORTAL;
						Npc_PerceiveAll(ShadowGuardTwo);
						Npc_ClearAIQueue(ShadowGuardTwo);
						AI_Standup(ShadowGuardTwo);
						AI_PlayAni(ShadowGuardTwo,"T_MAGRUN_2_HEASHOOT");
						Wld_PlayEffect("SPELLFX_BELIARSHRINE",ShadowGuardTwo,ShadowGuardTwo,0,0,0,FALSE);
						ShadowMoonRests = TRUE;
						AI_Wait(ShadowGuardTwo,15);
					};
					if(ShadowMoonCount >= 15)
					{
						PrintScreen("... Slunce a Měsíc jsou blízko sebe...",-1,60,FONT_NEWLEVEL,3);
						AI_PlayAni(ShadowGuardTwo,"T_HEASHOOT_2_STAND");
						ShadowGuardOne.flags = NPC_FLAG_IMMORTAL;
						ShadowGuardTwo.flags = NPC_FLAG_IMMORTAL;
						ShadowTwinsCount = FALSE;
						ShadowMoonRests = FALSE;
						ShadowMoonCount = FALSE;
						ShadowKeyTime = TRUE;
						Wld_PlayEffect("spellFX_INCOVATION_FIRE",ShadowGuardTwo,ShadowGuardTwo,0,0,0,FALSE);

						if(Npc_GetDistToNpc(ShadowGuardTwo,hero) < 1000)
						{
							Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
							Npc_ChangeAttribute(hero,ATR_HITPOINTS,-500);
						};
					}
					else
					{
						ShadowGuardTwo.attribute[ATR_HITPOINTS] += 50;

						if(ShadowGuardTwo.attribute[ATR_HITPOINTS] >= ShadowGuardTwo.attribute[ATR_HITPOINTS_MAX])
						{
							ShadowGuardTwo.attribute[ATR_HITPOINTS] = ShadowGuardTwo.attribute[ATR_HITPOINTS_MAX];
						};
					};
				};
			}
			else
			{
				if(ShadowGuardOneIsDead == TRUE)
				{
					if(ShadowGuardTwo.flags != 0)
					{
						ShadowGuardTwo.flags = 0;
					};
					if(ShadowMoonRests == TRUE)
					{
						Wld_SetTime(22,0);
						AI_PlayAni(ShadowGuardTwo,"T_HEASHOOT_2_STAND");
						ShadowMoonRests = FALSE;
					};
				}
				else if(ShadowGuardTwoIsDead == TRUE)
				{
					if(ShadowGuardOne.flags != 0)
					{
						ShadowGuardOne.flags = 0;
					};
					if(ShadowSunRests == TRUE)
					{
						Wld_SetTime(8,0);
						AI_PlayAni(ShadowGuardOne,"T_HEASHOOT_2_STAND");
						ShadowSunRests = FALSE;
					};
				};
			};
			if(HeroIsDead == TRUE)
			{
				ShadowGuardFight = FALSE;
			};
		};
		if(SoulKeeperFight == TRUE)
		{
			if((SoulKeeperSpawn_01 == FALSE) && (SoulKeeperSpawn_02 == FALSE) && (SoulKeeperSpawn_03 == FALSE) && (SoulKeeperSpawn_04 == FALSE) && (SoulKeeperSpawn_05 == FALSE) && (SoulKeeperSpawn_06 == FALSE))
			{
				SoulKeeperCount += 1;
			};
			if((Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") > 2000) && (SoulKeeperIsDead == FALSE))
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
				SoulKeeperFight = FALSE;
			}
			else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") > 1400) && (SoulKeeperIsDead == FALSE))
			{
				if(SoulKeeperAOECount == FALSE)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",Ghost_SoulKeeper,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",Ghost_SoulKeeper,hero,0,0,0,FALSE);
					SoulKeeperAOECount = TRUE;
				};

				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100);
			}
			else if(Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") <= 1400)
			{
				SoulKeeperAOECount = FALSE;
			};
			if((Npc_GetDistToWP(Ghost_SoulKeeper,"LOSTVALLEY_SOULKEEPER_01") > 1500) && (Ghost_SoulKeeper.attribute[ATR_HITPOINTS] < Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX]) && (SoulKeeperCanBack == FALSE))
			{
				Ghost_SoulKeeper.attribute[ATR_HITPOINTS] = Ghost_SoulKeeper.attribute[ATR_HITPOINTS] + 250;

				if(Ghost_SoulKeeper.attribute[ATR_HITPOINTS] > Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX])
				{
					Ghost_SoulKeeper.attribute[ATR_HITPOINTS] = Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX];
				};
			};
			if(SoulKeeperCount >= 50)
			{
				AI_PlayAni(hero,"T_FALLB_2_FALLENB");
				AI_Wait(hero,1);
				AI_PlayAni(hero,"T_FALLENB_2_STAND");
				Wld_InsertNpc(SoulKeeperWisp_01,"LOSTVALLEY_WISP_01");
				Wld_InsertNpc(SoulKeeperWisp_02,"LOSTVALLEY_WISP_02");
				Wld_InsertNpc(SoulKeeperWisp_03,"LOSTVALLEY_WISP_03");
				Wld_InsertNpc(SoulKeeperWisp_04,"LOSTVALLEY_WISP_04");
				Wld_InsertNpc(SoulKeeperWisp_05,"LOSTVALLEY_WISP_05");
				Wld_InsertNpc(SoulKeeperWisp_06,"LOSTVALLEY_WISP_05");
				SoulKeeperCount = FALSE;
				SoulKeeperSpawn_01 = TRUE;
				SoulKeeperSpawn_02 = TRUE;
				SoulKeeperSpawn_03 = TRUE;
				SoulKeeperSpawn_04 = TRUE;
				SoulKeeperSpawn_05 = TRUE;
				SoulKeeperCanBack = TRUE;
				Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX] = Ghost_SoulKeeper.attribute[ATR_HITPOINTS];
				Wld_PlayEffect("spellFX_INCOVATION_RED",Ghost_SoulKeeper,hero,2,0,0,FALSE);
				Ghost_SoulKeeper.flags = NPC_FLAG_IMMORTAL;
				Ghost_SoulKeeper.wp = "TOT";
				SoulKeeperHP = Ghost_SoulKeeper.attribute[ATR_HITPOINTS];
				SoulKeeperHPMax = Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX];
				Npc_PerceiveAll(Ghost_SoulKeeper);
				Npc_ClearAIQueue(Ghost_SoulKeeper);
				AI_Standup(Ghost_SoulKeeper);
				AI_Teleport(Ghost_SoulKeeper,"TOT");
			};
			if(SoulKeeperSpawn_01 == TRUE)
			{
				SKWispCount_01 += 1;

				if(SKWispCount_01 > 20)
				{
					AI_Teleport(SoulKeeperWisp_01,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_01,ATR_HITPOINTS,SoulKeeperWisp_01.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_01 = FALSE;
					SoulKeeperSpawn_01 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_01");
				};
			};
			if(SoulKeeperSpawn_02 == TRUE)
			{
				SKWispCount_02 += 1;

				if(SKWispCount_02 > 20)
				{
					AI_Teleport(SoulKeeperWisp_02,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_02,ATR_HITPOINTS,SoulKeeperWisp_02.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_02 = FALSE;
					SoulKeeperSpawn_02 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_02");
				};
			};
			if(SoulKeeperSpawn_03 == TRUE)
			{
				SKWispCount_03 += 1;

				if(SKWispCount_03 > 20)
				{
					AI_Teleport(SoulKeeperWisp_03,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_03,ATR_HITPOINTS,SoulKeeperWisp_03.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_03 = FALSE;
					SoulKeeperSpawn_03 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_03");
				};
			};	
			if(SoulKeeperSpawn_04 == TRUE)
			{
				SKWispCount_04 += 1;

				if(SKWispCount_04 > 20)
				{
					AI_Teleport(SoulKeeperWisp_04,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_04,ATR_HITPOINTS,SoulKeeperWisp_04.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_04 = FALSE;
					SoulKeeperSpawn_04 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_04");
				};
			};
			if(SoulKeeperSpawn_05 == TRUE)
			{
				SKWispCount_05 += 1;

				if(SKWispCount_05 > 20)
				{
					AI_Teleport(SoulKeeperWisp_05,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_05,ATR_HITPOINTS,SoulKeeperWisp_05.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_05 = FALSE;
					SoulKeeperSpawn_05 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_05");
				};
			};
			if(SoulKeeperSpawn_06 == TRUE)
			{
				SKWispCount_06 += 1;

				if(SKWispCount_06 > 20)
				{
					AI_Teleport(SoulKeeperWisp_06,"TOT");
					Npc_ChangeAttribute(SoulKeeperWisp_06,ATR_HITPOINTS,SoulKeeperWisp_06.attribute[ATR_HITPOINTS_MAX]);
					SKWispCount_06 = FALSE;
					SoulKeeperSpawn_06 = FALSE;
					Wld_InsertNpc(Skeleton_SoulKeeper,"LOSTVALLEY_WISP_06");
				};
			};
			if((SoulKeeperCanBack == TRUE) && (SoulKeeperIsDead == FALSE))
			{
				SoulKeeperCountBack += 1;

				if(SoulKeeperCountBack > 20)
				{
					PlayerIsCurse = TRUE;
					SoulKeeperInRage += 1;
					Ghost_SoulKeeper.flags = NPC_FLAG_NONE;
					Ghost_SoulKeeper.wp = "LOSTVALLEY_SOULKEEPER_01";
					AI_Teleport(Ghost_SoulKeeper,"LOSTVALLEY_SOULKEEPER_01");
					Ghost_SoulKeeper.attribute[ATR_HITPOINTS_MAX] = SoulKeeperHPMax;
					Ghost_SoulKeeper.attribute[ATR_HITPOINTS] = SoulKeeperHP;
					SoulKeeperCanBack = FALSE;
					SoulKeeperCountBack = FALSE;
					SoulKeeperSpawn_01 = FALSE;
					SoulKeeperSpawn_02 = FALSE;
					SoulKeeperSpawn_03 = FALSE;
					SoulKeeperSpawn_04 = FALSE;
					SoulKeeperSpawn_05 = FALSE;
					SoulKeeperSpawn_06 = FALSE;
					SKWispCount_01 = FALSE;
					SKWispCount_02 = FALSE;
					SKWispCount_03 = FALSE;
					SKWispCount_04 = FALSE;
					SKWispCount_05 = FALSE;
					SKWispCount_06 = FALSE;
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",Ghost_SoulKeeper,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);

					if(SoulKeeperInRage > 5)
					{
						PrintScreen("Strážce vysál celou tvou duši!",-1,60,FONT_NEWLEVEL,3);
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
						SoulKeeperInRage = FALSE;
					}
					else
					{
						if(hero.protection[PROT_MAGIC] < 1000)
						{
							DamageSoulKeeperAOE = 1000 - hero.protection[PROT_MAGIC];
							Npc_ChangeAttribute(hero,ATR_HITPOINTS,-DamageSoulKeeperAOE);
						};

						PrintScreen("Strážce vysál část tvé duše!",-1,60,FONT_NEWLEVEL,3);
					};
				};
			};
			if(HeroIsDead == TRUE)
			{
				SoulKeeperFight = FALSE;
			};
		};
		if(FiarasFight == TRUE)
		{
			if(Npc_GetDistToWP(FireGolem_LV,"WDS_LAVA_DEADTREE_01") <= 1100)
			{
				FireGolem_LV_Count += 1;
				FireGolem_LV_RandyAttack = Hlp_Random(100);

				if(FireGolem_LV_RandyAttack <= 5)
				{	
					if(hero.protection[PROT_FIRE] < 1000)
					{
						DamageFireGolem_LVAOE = 1000 - hero.protection[PROT_FIRE];
						AI_TurnToNPC(FireGolem_LV,hero);
						AI_PlayAni(FireGolem_LV,"T_WARN");
						AI_Wait(FireGolem_LV,2);
						Wld_PlayEffect("spellFX_Explosion",FireGolem_LV,hero,2,DamageFireGolem_LVAOE,DAM_FIRE,TRUE);
					};
				};
			}
			else	if(Npc_GetDistToWP(FireGolem_LV,"WDS_LAVA_DEADTREE_01") > 1100)
			{
				FireGolem_LV_Count = FALSE;
				FireGolem_LV.attribute[ATR_HITPOINTS] = FireGolem_LV.attribute[ATR_HITPOINTS_MAX];
				Npc_PerceiveAll(FireGolem_LV);
				Npc_ClearAIQueue(FireGolem_LV);
				AI_Standup(FireGolem_LV);
				AI_Teleport(FireGolem_LV,"WDS_LAVA_DEADTREE_01");
				FiarasFight = FALSE;
				FireGolem_LV.aivar[AIV_EnemyOverride] = TRUE;
				FireGolem_LV.flags = NPC_FLAG_IMMORTAL;
			}
			else if(HeroIsDead == TRUE)
			{
				FireGolem_LV_Count = FALSE;
				FireGolem_LV.attribute[ATR_HITPOINTS] = FireGolem_LV.attribute[ATR_HITPOINTS_MAX];
				Npc_PerceiveAll(FireGolem_LV);
				Npc_ClearAIQueue(FireGolem_LV);
				AI_Standup(FireGolem_LV);
				AI_Teleport(FireGolem_LV,"WDS_LAVA_DEADTREE_01");
				FiarasFight = FALSE;
				FireGolem_LV.aivar[AIV_EnemyOverride] = TRUE;
				FireGolem_LV.flags = NPC_FLAG_IMMORTAL;
			};
		};
		if(EkronFight == TRUE)
		{
			EkronCount += 1;

			if(Npc_GetDistToWP(AncientTreeGolem,"WDS_LAVA_EKRON_01") > 1500)
			{
				EkronCount = FALSE;
				EkronFight = FALSE;
				AncientTreeGolem.attribute[ATR_HITPOINTS] = AncientTreeGolem.attribute[ATR_HITPOINTS_MAX];
				Npc_PerceiveAll(AncientTreeGolem);
				Npc_ClearAIQueue(AncientTreeGolem);
				AI_Standup(AncientTreeGolem);
				AI_Teleport(AncientTreeGolem,"WDS_LAVA_EKRON_01");
				AncientTreeGolem.aivar[AIV_EnemyOverride] = TRUE;
				AncientTreeGolem.flags = NPC_FLAG_IMMORTAL;
			};
			if((EkronCount == 25) || (EkronCount == 75))
			{
				if(hero.protection[PROT_FLY] < 500)
				{	
					DamageEkronAOE = 500 - hero.protection[PROT_MAGIC];
					AI_TurnToNPC(AncientTreeGolem,hero);
					AI_PlayAni(AncientTreeGolem,"T_WARN");
					AI_Wait(AncientTreeGolem,1);
					Wld_PlayEffect("spellFX_Quake",AncientTreeGolem,hero,2,DamageEkronAOE,DAM_MAGIC,TRUE);
				};
			}
			else if((EkronCount == 26) || (EkronCount == 76))
			{
				if(hero.protection[PROT_FLY] < 750)
				{
					DamageEkronAOE = 750 - hero.protection[PROT_MAGIC];
					AI_Wait(AncientTreeGolem,1);
					Wld_PlayEffect("spellFX_Quake",AncientTreeGolem,hero,2,DamageEkronAOE,DAM_MAGIC,TRUE);
				};
			}
			else if((EkronCount == 27) || (EkronCount == 77))
			{
				if(hero.protection[PROT_FLY] < 1000)
				{
					DamageEkronAOE = 1000 - hero.protection[PROT_MAGIC];
					AI_Wait(AncientTreeGolem,1);
					Wld_PlayEffect("spellFX_Quake",AncientTreeGolem,hero,2,DamageEkronAOE,DAM_MAGIC,TRUE);
				};
			}
			else if(EkronCount >= 100)
			{
				if(EkronCount == 100)
				{
					AncientTreeGolem.noFocus = TRUE;
					AncientTreeGolem.name[0] = CZ_NAME_EMPTY;
					AncientTreeGolem.flags = NPC_FLAG_IMMORTAL;
					Wld_PlayEffect("SPELLFX_ROOTS_TARGET",AncientTreeGolem,AncientTreeGolem,2,0,0,FALSE);
					Wld_PlayEffect("spellFX_INCOVATION_GREEN",AncientTreeGolem,AncientTreeGolem,2,0,0,FALSE);
					AI_PlayAni(AncientTreeGolem,"T_DEAD");
					Wld_InsertNpc(ShadowWolf_DeadTree,"WDS_LAVA_HIGHLEVEL_02");
					Wld_InsertNpc(ShadowWolf_DeadTree,"WDS_LAVA_HIGHLEVEL_04FIX");
					Wld_InsertNpc(ShadowWolf_DeadTree,"WDS_LAVA_HIGHLEVEL_03");
				}
				else if((EkronCount == 102) || (EkronCount == 104) || (EkronCount == 106) || (EkronCount == 108) || (EkronCount == 110))
				{
					AncientTreeGolem.attribute[ATR_HITPOINTS] += 1000;

					if(AncientTreeGolem.attribute[ATR_HITPOINTS] >= AncientTreeGolem.attribute[ATR_HITPOINTS_MAX])
					{
						AncientTreeGolem.attribute[ATR_HITPOINTS] = AncientTreeGolem.attribute[ATR_HITPOINTS_MAX];
					};
				}
				else if(EkronCount > 110)
				{		
					AncientTreeGolem.noFocus = FALSE;
					AncientTreeGolem.name[0] = CZ_NAME_Monster_SwampGolem_Ekron_Title;
					AncientTreeGolem.flags = 0;
					EkronCount = FALSE;
					AI_PlayAni(AncientTreeGolem,"T_RISE");	
				};

				AI_Wait(AncientTreeGolem,1);
			};
			if(HeroIsDead == TRUE)
			{
				EkronCount = FALSE;
				EkronFight = FALSE;
				AncientTreeGolem.attribute[ATR_HITPOINTS] = AncientTreeGolem.attribute[ATR_HITPOINTS_MAX];
				AncientTreeGolem.aivar[AIV_EnemyOverride] = TRUE;
				AncientTreeGolem.flags = NPC_FLAG_IMMORTAL;
				Npc_PerceiveAll(AncientTreeGolem);
				Npc_ClearAIQueue(AncientTreeGolem);
				AI_Standup(AncientTreeGolem);
				AI_Teleport(AncientTreeGolem,"WDS_LAVA_EKRON_01");
			};
		};
		if((CurrentLevel == LOSTVALLEY_ZEN) && (MIS_Miss_Brother == LOG_Running) && (ReadyForBoss6 == TRUE) && (SkelBrosFightWin == FALSE))
		{
			if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_09") <= 500) && (SkelFinalReady_Dex == FALSE) && (StartBroDex == FALSE))
			{
				AI_SetWalkMode(Skeleton_Bro_Dex,NPC_WALK);
				AI_ReadyMeleeWeapon(Skeleton_Bro_Dex);
				AI_GotoWP(Skeleton_Bro_Dex,"WDS_LAVA_CASTLEYARD_09");
				StartBroDex = TRUE;
				StartBroFight = TRUE;
			};
			if((SkelFinalReady_Dex == TRUE) && (ReadyForBoss6 == TRUE) && (SkelFinalReady_Str == FALSE) && (StartBroStr == FALSE))
			{
				AI_SetWalkMode(Skeleton_Bro_Str,NPC_WALK);
				AI_ReadyMeleeWeapon(Skeleton_Bro_Str);
				AI_GotoWP(Skeleton_Bro_Str,"WDS_LAVA_CASTLEYARD_09");
				StartBroStr = TRUE;
			};
			if((SkelFinalReady_Dex == TRUE) && (SkelFinalReady_Str == TRUE) && (ReadyForBoss6 == TRUE) && (SkelFinalReady_Mag == FALSE) && (StartBroMag == FALSE))
			{
				AI_SetWalkMode(Skeleton_Bro_Mag,NPC_WALK);
				AI_ReadyMeleeWeapon(Skeleton_Bro_Mag);
				AI_GotoWP(Skeleton_Bro_Mag,"WDS_LAVA_CASTLEYARD_09");
				StartBroMag = TRUE;
			};
			if((Npc_GetDistToWP(Skeleton_Bro_Dex,"WDS_LAVA_CASTLEYARD_09") <= 250) && (StartBroDex == TRUE) && (StartBroDexDone == FALSE))
			{
				Skeleton_Bro_Dex.flags = 0;
				Skeleton_Bro_Dex.aivar[AIV_EnemyOverride] = FALSE;
				StartBroDexDone = TRUE;
				SkelBroDexFight = TRUE;
				SkelBrosFight = TRUE;
			};
			if((Npc_GetDistToWP(Skeleton_Bro_Str,"WDS_LAVA_CASTLEYARD_09") <= 250) && (StartBroStr == TRUE) && (StartBroStrDone == FALSE))
			{
				Skeleton_Bro_Str.flags = 0;
				Skeleton_Bro_Str.aivar[AIV_EnemyOverride] = FALSE;
				StartBroStrDone = TRUE;
				SkelBroStrFight = TRUE;
			};
			if((Npc_GetDistToWP(Skeleton_Bro_Mag,"WDS_LAVA_CASTLEYARD_09") <= 250) && (StartBroMag == TRUE) && (StartBroMagDone == FALSE))
			{
				Skeleton_Bro_Mag.flags = 0;
				Skeleton_Bro_Mag.aivar[AIV_EnemyOverride] = FALSE;
				StartBroMagDone = TRUE;
				SkelBroMagFight = TRUE;
			};
			if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_09") > 1500) && (StartBroFight == TRUE) && (SkelBrosFightWin == FALSE) && (HeroIsDead == FALSE))
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			};
		};
		if((SkelBrosFight == TRUE) && (SkelBrosFightWin == FALSE))
		{
			if(SkelBroDexFight == TRUE)
			{
				TempDistToSkel = Npc_GetDistToNpc(Skeleton_Bro_Dex,hero);
				Skeleton_Bro_Dex.attribute[ATR_HITPOINTS] += TempDistToSkel / 10;

				if(Skeleton_Bro_Dex.attribute[ATR_HITPOINTS] >= Skeleton_Bro_Dex.attribute[ATR_HITPOINTS_MAX])
				{
					Skeleton_Bro_Dex.attribute[ATR_HITPOINTS] = Skeleton_Bro_Dex.attribute[ATR_HITPOINTS_MAX];
				};
				if(Skeleton_Bro_Dex.attribute[ATR_HITPOINTS] <= 10000)
				{
					//AI_Wait(hero,2);
					SkelBroDexFight = FALSE;
					SkelFinalReady_Dex = TRUE;
					Skeleton_Bro_Dex.aivar[AIV_EnemyOverride] = TRUE;
					Skeleton_Bro_Dex.flags = NPC_FLAG_IMMORTAL;
					Npc_ClearAIQueue(Skeleton_Bro_Dex);
					AI_Standup(Skeleton_Bro_Dex);
					Skeleton_Bro_Dex.attribute[ATR_HITPOINTS_MAX] = 10000;
					Skeleton_Bro_Dex.attribute[ATR_HITPOINTS] = 10000;
					//AI_SetWalkMode(Skeleton_Bro_Dex,NPC_WALK);
					//AI_GotoWP(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01");
					AI_Teleport(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01");
					AI_TurnToNPC(Skeleton_Bro_Dex,hero);
				};
			};
			if(SkelBroStrFight == TRUE)
			{
				TempDistToSkel = Npc_GetDistToNpc(Skeleton_Bro_Str,hero);
				Skeleton_Bro_Str.attribute[ATR_HITPOINTS] += TempDistToSkel / 10;

				if(Skeleton_Bro_Str.attribute[ATR_HITPOINTS] >= Skeleton_Bro_Str.attribute[ATR_HITPOINTS_MAX])
				{
					Skeleton_Bro_Str.attribute[ATR_HITPOINTS] = Skeleton_Bro_Str.attribute[ATR_HITPOINTS_MAX];
				};
				if(Skeleton_Bro_Str.attribute[ATR_HITPOINTS] <= 10000)
				{
					//AI_Wait(hero,2);
					SkelBroStrFight = FALSE;
					SkelFinalReady_Str = TRUE;
					Skeleton_Bro_Str.aivar[AIV_EnemyOverride] = TRUE;
					Skeleton_Bro_Str.flags = NPC_FLAG_IMMORTAL;
					Npc_ClearAIQueue(Skeleton_Bro_Str);
					AI_Standup(Skeleton_Bro_Str);
					Skeleton_Bro_Str.attribute[ATR_HITPOINTS_MAX] = 10000;
					Skeleton_Bro_Str.attribute[ATR_HITPOINTS] = 10000;
					//AI_SetWalkMode(Skeleton_Bro_Str,NPC_WALK);
					//AI_GotoWP(Skeleton_Bro_Str,"LV_SKELETON_STR_01");
					AI_Teleport(Skeleton_Bro_Str,"LV_SKELETON_STR_01");
					AI_TurnToNPC(Skeleton_Bro_Str,hero);
				};
			};
			if(SkelBroMagFight == TRUE)
			{
				TempDistToSkel = Npc_GetDistToNpc(Skeleton_Bro_Mag,hero);
				Skeleton_Bro_Mag.attribute[ATR_HITPOINTS] += TempDistToSkel / 10;

				if(Skeleton_Bro_Mag.attribute[ATR_HITPOINTS] >= Skeleton_Bro_Mag.attribute[ATR_HITPOINTS_MAX])
				{
					Skeleton_Bro_Mag.attribute[ATR_HITPOINTS] = Skeleton_Bro_Mag.attribute[ATR_HITPOINTS_MAX];
				};
				if(Skeleton_Bro_Mag.attribute[ATR_HITPOINTS] <= 10000)
				{
					//AI_Wait(hero,2);
					SkelBroMagFight = FALSE;
					SkelFinalReady_Mag = TRUE;
					Skeleton_Bro_Mag.aivar[AIV_EnemyOverride] = TRUE;
					Skeleton_Bro_Mag.flags = NPC_FLAG_IMMORTAL;
					Npc_ClearAIQueue(Skeleton_Bro_Mag);
					AI_Standup(Skeleton_Bro_Mag);
					Skeleton_Bro_Mag.attribute[ATR_HITPOINTS_MAX] = 10000;
					Skeleton_Bro_Mag.attribute[ATR_HITPOINTS] = 10000;
					//AI_SetWalkMode(Skeleton_Bro_Mag,NPC_WALK);
					//AI_GotoWP(Skeleton_Bro_Mag,"LV_SKELETON_MAG_01");
					AI_Teleport(Skeleton_Bro_Mag,"LV_SKELETON_MAG_01");
					AI_TurnToNPC(Skeleton_Bro_Mag,hero);
				};
			};
			if((SkelFinalReady_Dex == TRUE) && (SkelFinalReady_Str == TRUE) && (SkelFinalReady_Mag == TRUE) && (SkelBroFinalFight == FALSE))
			{
				if((AllSkelMoveFight == FALSE) && (Npc_GetDistToWP(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01") <= 250) && (Npc_GetDistToWP(Skeleton_Bro_Str,"LV_SKELETON_STR_01") <= 250) && (Npc_GetDistToWP(Skeleton_Bro_Mag,"LV_SKELETON_MAG_01") <= 250))
				{
					SkelFinalCountDown += 1;

					if(SkelFinalCountDown >= 5)
					{
						AI_SetWalkMode(Skeleton_Bro_Dex,NPC_WALK);
						AI_ReadyMeleeWeapon(Skeleton_Bro_Dex);
						AI_GotoWP(Skeleton_Bro_Dex,"WDS_LAVA_CASTLEYARD_09");
						AI_SetWalkMode(Skeleton_Bro_Str,NPC_WALK);
						AI_ReadyMeleeWeapon(Skeleton_Bro_Str);
						AI_GotoWP(Skeleton_Bro_Str,"WDS_LAVA_CASTLEYARD_09");
						AI_SetWalkMode(Skeleton_Bro_Mag,NPC_WALK);
						AI_ReadyMeleeWeapon(Skeleton_Bro_Mag);
						AI_GotoWP(Skeleton_Bro_Mag,"WDS_LAVA_CASTLEYARD_09");
						SkelFinalCountDown = FALSE;
						AllSkelMoveFight = TRUE;
					};
				};
				if(AllSkelMoveFight == TRUE)
				{
					if((Npc_GetDistToWP(Skeleton_Bro_Dex,"WDS_LAVA_CASTLEYARD_09") <= 250) && (AllSkelMoveFightDex == FALSE))
					{
						Skeleton_Bro_Dex.flags = 0;
						Skeleton_Bro_Dex.aivar[AIV_EnemyOverride] = FALSE;
						AI_TurnToNPC(Skeleton_Bro_Dex,hero);
						AllSkelMoveFightDex = TRUE;
					};
					if((Npc_GetDistToWP(Skeleton_Bro_Str,"WDS_LAVA_CASTLEYARD_09") <= 250) && (AllSkelMoveFightStr == FALSE))
					{
						Skeleton_Bro_Str.flags = 0;
						Skeleton_Bro_Str.aivar[AIV_EnemyOverride] = FALSE;
						AI_TurnToNPC(Skeleton_Bro_Str,hero);
						AllSkelMoveFightStr = TRUE;
					};
					if((Npc_GetDistToWP(Skeleton_Bro_Mag,"WDS_LAVA_CASTLEYARD_09") <= 250) && (AllSkelMoveFightMag == FALSE))
					{
						Skeleton_Bro_Mag.flags = 0;
						Skeleton_Bro_Mag.aivar[AIV_EnemyOverride] = FALSE;
						AI_TurnToNPC(Skeleton_Bro_Mag,hero);
						AllSkelMoveFightMag = TRUE;
					};
					if((AllSkelMoveFightDex == TRUE) && (AllSkelMoveFightStr == TRUE) && (AllSkelMoveFightMag == TRUE))
					{
						SkelBroFinalFight = TRUE;
					};
				};
			};
		};
	};

	//----------------KratAr------------------------------------------------

	if(CurrentLevel == HAOSWORLD_ZEN)
	{
		if((IlarahStarts == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
		{
			if((IlArahActOne == TRUE) && (IlArahActTwo == FALSE) && (IlArahActThree == FALSE) && (IlArahActFour == FALSE))
			{
				tmpIlarahCount_01 += 1;

				if(IlarahCountAct_01 == FALSE)
				{
					AI_NoticePrint(500,7000,"- Kapitola I -");
					IlarahCountAct_01 = TRUE;
				};
				if(tmpIlarahCount_01 >= 50)
				{
					AI_PlayAni(Ilarah,"T_PALELITE");
					AI_Wait(Ilarah,1);
					Snd_Play("OPENSOUL");
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",Ilarah,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",Ilarah,hero,0,0,0,FALSE);
					Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					PlayerIsSick = TRUE;
					PlayerIsCurse = TRUE;
					tmpIlarahCount_01 = FALSE;

					if(hero.protection[PROT_MAGIC] < 2000)
					{
						tmpDamageIlArah = 2000 - hero.protection[PROT_MAGIC];
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-tmpDamageIlArah);
					}
					else
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1000);
					};
				};
				if(Ilarah.attribute[ATR_HITPOINTS] <= 75000)
				{
					IlArahActTwo = TRUE;
				};
			}
			else if((IlArahActOne == TRUE) && (IlArahActTwo == TRUE) && (IlArahActThree == FALSE) && (IlArahActFour == FALSE))
			{
				if(IlarahCountAct_02 == FALSE)
				{
					AI_NoticePrint(500,7000,"- Kapitola II -");
					IlarahCountAct_02 = TRUE;
				};
				if(IlArahOneShotHit == FALSE)
				{
					Wld_InsertNpc(IlArah_Chaos_Lord_01,"KRATUK_01");
					Wld_InsertNpc(IlArah_Chaos_Lord_02,"KRATUK_02");
					Wld_InsertNpc(IlArah_Chaos_Lord_03,"KRATUK_03");
					Wld_InsertNpc(IlArah_Chaos_Lord_04,"KRATUK_04");
					IlArahOneShotHit = TRUE;
				};
	
				tmpIlarahCount_02 += 1;

				if((IlArahAllDemonsIsDead == TRUE) && (IlArahAllDemonsRage == FALSE))
				{
					tmpIlarahCountDamage_02 = tmpIlarahCount_02 * 30;
					Snd_Play("IMARAHCURSE");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-tmpIlarahCount_02);
					AI_SetWalkMode(IlArah,NPC_RUN);
					IlArahAllDemonsRage = TRUE;
				};
				if(Ilarah.attribute[ATR_HITPOINTS] <= 50000)
				{
					IlArahActThree = TRUE;
				};
			}
			else if((IlArahActOne == TRUE) && (IlArahActTwo == TRUE) && (IlArahActThree == TRUE) && (IlArahActFour == FALSE))
			{
				if(IlarahCountAct_03 == FALSE)
				{
					AI_NoticePrint(500,7000,"- Kapitola III -");
					IlarahCountAct_03 = TRUE;
				};

				tmpIlarahCount_03 += 1;

				if(tmpIlarahCount_03 == 50)
				{
					Snd_Play("DRG_WARN");
					Wld_PlayEffect("SPELLFX_BELIARSHRINE",Ilarah,Ilarah,0,0,0,FALSE);
					Wld_PlayEffect("VOB_MAGICBURN",Ilarah,Ilarah,0,0,0,FALSE);
					AI_Wait(Ilarah,5);
				}
				else if(tmpIlarahCount_03 > 55)
				{
					AI_PlayAni(Ilarah,"T_PALELITE");
					Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",Ilarah,hero,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",Ilarah,hero,0,0,0,FALSE);
					Snd_Play("DRG_DIE");
					IlArahSuckStrike = Npc_GetDistToNpc(Ilarah,hero);

					if(IlArahSuckStrike <= 500)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-5000);
					}
					else if(IlArahSuckStrike <= 1000)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-3500);
					}
					else if(IlArahSuckStrike <= 1500)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-2500);
					}
					else
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-1500);
					};

					tmpIlarahCount_03 = FALSE;
					IlArahSuckStrike = FALSE;
				};
				if(Ilarah.attribute[ATR_HITPOINTS] <= 25000)
				{
					IlArahActFour = TRUE;
					AI_RemoveWeapon(Ilarah);
					AI_UnequipWeapons(Ilarah);
					CreateInvItems(Ilarah,ITMW_CHAOSSTAFF_01,1);

					if(Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Left_Npc) >= 1)
					{
						Npc_RemoveInvItems(Ilarah,ItMw_1H_IlArahBlade_Left_Npc,Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Left_Npc));
					};
					if(Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Right_Npc) >= 1)
					{
						Npc_RemoveInvItems(Ilarah,ItMw_1H_IlArahBlade_Right_Npc,Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Right_Npc));
					};
					if(Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Left) >= 1)
					{
						Npc_RemoveInvItems(Ilarah,ItMw_1H_IlArahBlade_Left,Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Left));
					};
					if(Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Right) >= 1)
					{
						Npc_RemoveInvItems(Ilarah,ItMw_1H_IlArahBlade_Right,Npc_HasItems(Ilarah,ItMw_1H_IlArahBlade_Right));
					};

					Ext_RemoveFromSlot(Ilarah,"ZS_LEFTHAND");	
					Ext_RemoveFromSlot(Ilarah,"ZS_RIGHTHAND");	

					AI_Wait(Ilarah,1);
					AI_PlayAni(hero,"T_FALLB_2_FALLENB");
					AI_Wait(hero,1);
					AI_PlayAni(hero,"T_FALLENB_2_STAND");
				};
			}
			else if((IlArahActOne == TRUE) && (IlArahActTwo == TRUE) && (IlArahActThree == TRUE) && (IlArahActFour == TRUE))
			{
				if(IlarahCountAct_04 == FALSE)
				{
					AI_EquipBestMeleeWeapon(Ilarah);
					AI_ReadyMeleeWeapon(Ilarah);
					AI_NoticePrint(500,7000,"- Kapitola IV -");
					IlarahCountAct_04 = TRUE;
				};
				if(Ilarah.attribute[ATR_HITPOINTS] <= 2000)
				{
					Ilarah.flags = FALSE;
					Ilarah.protection[PROT_BLUNT] = 1;
					Ilarah.protection[PROT_EDGE] = 1;
					Ilarah.protection[PROT_POINT] = 1;
					Ilarah.protection[PROT_FIRE] = 1;
					Ilarah.protection[PROT_MAGIC] = 1;
				};
			};
		};
	};
};

func void b_cycle_trigger_01()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_01");
		return;
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_01");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_01");
};

func void b_cycle_trigger_02()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_02");
		return;
	};

	b_gettime();
	Hero_poisoned();

	if(Npc_IsDead(orkelite_addon3_chkflg_12) && (SENDPATROW1 == FALSE))
	{
		Wld_InsertNpc(orc_8522_warrior,"OW_PATH_STONEHENGE_1");
		Wld_InsertNpc(orc_8522_warrior,"OW_PATH_STONEHENGE_1");
		Wld_InsertNpc(orc_8521_warrior,"OW_PATH_STONEHENGE_1");
		Wld_InsertNpc(orc_8521_warrior,"OW_PATH_STONEHENGE_1");
		SENDPATROW1 = TRUE;
	};

	Wld_SendTrigger("CYCLE_TRIGGER_02");
};

func void b_cycle_trigger_03()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_03");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_03");
};

func void b_cycle_trigger_04()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_04");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_04");
};

func void b_cycle_trigger_05()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_05");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_05");
};

func void b_cycle_trigger_06()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_06");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_06");
};

func void b_cycle_trigger_07()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_07");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_07");
};

func void b_cycle_trigger_08()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_08");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_08");
};

func void b_cycle_trigger_09()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_09");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_09");
};

func void b_cycle_trigger_10()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_10");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_10");
};

func void b_cycle_trigger_11()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_11");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_11");
};

func void b_cycle_trigger_12()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_12");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_12");
};

func void b_cycle_trigger_13()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_13");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_13");
};

func void b_cycle_trigger_14()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_14");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_14");
};

func void b_cycle_trigger_15()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_15");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_15");
};

func void b_cycle_trigger_16()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_16");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_16");
};

func void b_cycle_trigger_17()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_17");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_17");
};

func void b_cycle_trigger_18()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_18");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_18");
};

func void b_cycle_trigger_19()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_19");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_19");
};

func void b_cycle_trigger_20()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_20");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_20");
};

func void b_cycle_trigger_21()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_21");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_21");
};

func void b_cycle_trigger_22()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_22");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_22");
};

func void b_cycle_trigger_23()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_23");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_23");
};

func void b_cycle_trigger_25()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_25");
		return;
	};
	if((MOBCR_PW_ARMOR == FALSE) && (hero.guild == GIL_GUR))
	{
		Mob_CreateItems("PW_GALOM_CHEST",ITAR_ASSASINS_DEMONMAGE,1);
		MOBCR_PW_ARMOR = TRUE;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_25");
};

func void b_cycle_trigger_26()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_26");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_26");
};

func void b_cycle_trigger_27()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_27");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_27");
};

func void b_cycle_trigger_28()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_28");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_28");
};

func void b_cycle_trigger_29()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_29");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_29");
};

func void b_cycle_trigger_30()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_30");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_30");
};

func void b_cycle_trigger_31()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_31");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_31");
};

func void b_cycle_trigger_32()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_32");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_32");
};

func void b_cycle_trigger_33()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_33");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_33");
};

func void b_cycle_trigger_34()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};

	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_34");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_34");
};

func void b_cycle_trigger_35()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_35");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_35");
};

func void b_cycle_trigger_36()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_36");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_36");
};

func void b_cycle_trigger_37()
{
	_hero = Hlp_GetNpc(PC_HERO);

	if((hero.guild > GIL_SEPERATOR_HUM) && (HeroTransOpen == TRUE))
	{
		HEROTRANS = TRUE;
		HeroTransOpen = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((hero.guild <= GIL_SEPERATOR_HUM) && (HeroTrans == TRUE))
	{
		AI_UnequipWeapons(hero);
		HeroTrans = FALSE;
		HeroTransScroll = FALSE;
		HeroTransRune = FALSE;
		HeroTRANSCOUNT = FALSE;
		TransformWarn = FALSE;
	};
	if((HEROTRANS == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroIsDead == FALSE) && (HeroTransScroll == TRUE))
	{
		HeroTRANSCOUNT += 1;
		TempTransTime = 30 + (hero.level * 5);

		if(HeroTRANSCOUNT > TempTransTime)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);

			if(TransformWarn == FALSE)
			{
				AI_Print("Tělesná schránka stvoření se začíná hroutit...");
				TransformWarn = TRUE;
			};
		};
	};
	if(_hero.attribute[ATR_HITPOINTS_MAX] == 0)
	{
		Wld_SendTrigger("CYCLE_TRIGGER_37");
		return;
	};

	b_gettime();
	Hero_poisoned();
	Wld_SendTrigger("CYCLE_TRIGGER_37");
};

func void LoopUSec()
{
};

func void B_CheckStamina()
{
	if(CamModeOn == FALSE)
	{
		bHeroIsInCutscene = FALSE;
	}
	else
	{
		bHeroIsInCutscene = TRUE;
	};
	if((Menu_ReadInt("AST","bViewStatusBars") == TRUE) && (ATR_STAMINA[0] == ATR_STAMINA_MAX[0] * 10) && (Hlp_GetHeroStatus() == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		if(StaminaBar.bShow != 0)
		{
			StaminaBar.bShow = 0;
		};
	}
	else if(C_BodyStateContains(hero,BS_DIVE) || (Hlp_InventoryIsOpen() == TRUE) || (HeroNotMobsi == TRUE) || (C_BodyStateContains(hero,BS_MOBINTERACT_INTERRUPT) == TRUE))
	{
		if(StaminaBar.bShow != 0)
		{
			StaminaBar.bShow = 0;
		};
	}
	else
	{
		if((HeroTRANS == FALSE) && (HeroNotMobsi == FALSE) && (OptionCheck == FALSE) && (CamModeOn == FALSE) && (HeroIsDead == FALSE))
		{
			if((POISONED == TRUE) && (ResistPoisonKnow == FALSE))
			{
				StaminaBar.bShow = 1;
				StaminaBar.bartex = "BAR_Poison.tga";
				StaminaBar.value = ATR_STAMINA[0];
				StaminaBar.maxrange = ATR_STAMINA_MAX[0] * 10;
			}
			else
			{
				StaminaBar.bShow = 1;
				StaminaBar.bartex = "BAR_Stamina.tga";
				StaminaBar.value = ATR_STAMINA[0];
				StaminaBar.maxrange = ATR_STAMINA_MAX[0] * 10;
			};
		}
		else
		{
			if(StaminaBar.bShow != 0)
			{
				StaminaBar.bShow = 0;
			};
		};
		if(bHeroIsInCutscene == FALSE)
		{
			bManaBar = 1;
			bHealthBar = 1;
		}
		else
		{
			bManaBar = 0;
			bHealthBar = 0;
			StaminaBar.bShow = 0;
		};
	};
	if(SBMode != TRUE)
	{
		if(_bCanSave == TRUE)
		{
			if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
			{
				_bCanSave = FALSE;
			}
			else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
			{
				_bCanSave = FALSE;
			}
			else
			{
				_bCanSave = TRUE;
			};
		}
		else
		{
			if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
			{
				_bCanSave = FALSE;
			}
			else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
			{
				_bCanSave = FALSE;
			}
			else
			{
				_bCanSave = TRUE;
			};
		};
	}
	else if((SBMode == TRUE) && ((RealMode[2] == FALSE) || (Menu_ReadInt("AST","bCanSaveLeg") == TRUE)))
	{
		if(CurrentLevel == LOSTVALLEY_ZEN)
		{
			if((Npc_GetDistToWP(hero,"LOSTVALLEY_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"WDS_LAVA_LOWESTLEVEL_35") <= 1000))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"LOSTVALLEY_ARAHARPLAGUE") <= 1000) && (AraharPlagueIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SHADOWGUARD_CENTER") <= 1000) && (ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") <= 1000) && (SoulKeeperIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"WDS_LAVA_DEADTREE_01") <= 1000) && (FiarasIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if(Npc_GetDistToWP(hero,"LV_WAITFORHERO_01") <= 1000)
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if(Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_01") <= 1000)
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_09") <= 1000) && (SkelBrosFightWin == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"LOSTVALLEY_TEMPLE_IN") <= 1000) && (OpenHramDone == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_21") <= 1000) && (ChelDrakIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_30") <= 1000) && (IlesilIsDead == TRUE))
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else	
				{
					_bCanSave = TRUE;
				};
			}
			else
			{
				_bCanSave = FALSE;
			};
		}
		else
		{
			if(_bCanSave == TRUE)
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else
				{
					_bCanSave = TRUE;
				};
			}
			else
			{
				if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
				{
					_bCanSave = FALSE;
				}
				else if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
				{
					_bCanSave = FALSE;
				}
				else
				{
					_bCanSave = TRUE;
				};
			};
		};
	}
	else if(RealMode[2] == TRUE)
	{
		if((_bCanSave == TRUE) && (FlagSaveOn == FALSE))
		{
			_bCanSave = FALSE;
		}
		else if((_bCanSave == TRUE) && (FlagSaveOn == TRUE) && ((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING)))
		{
			_bCanSave = FALSE;
		}
		else if(Hlp_GetHeroStatus() == HERO_NORMAL)
		{
			if(KAPITELORCATC == FALSE)
			{
				if(CurrentLevel == NEWWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_01") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_02") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_03") <= 2000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_NW_AW") <= 500) && (DIA_Addon_Saturas_OpenPortal_NoPerm == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((hero.guild == GIL_MIL) && (Npc_GetDistToWP(hero,"SAVE_SPOT_MIL") <= 1500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((hero.guild == GIL_PAL) && ((Npc_GetDistToWP(hero,"SAVE_SPOT_MIL") <= 1500) || (Npc_GetDistToWP(hero,"SAVE_SPOT_PAL") <= 1500) || (Npc_GetDistToWP(hero,"SAVE_SPOT_PAL_02") <= 2000)))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_GetDistToWP(hero,"SAVE_SPOT_SLD") <= 3000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)) && (Npc_GetDistToWP(hero,"SAVE_SPOT_PSI") <= 3000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(((hero.guild == GIL_KDW) || (hero.guild == GIL_NDW)) && (Npc_GetDistToWP(hero,"SAVE_SPOT_KDW") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (Npc_GetDistToWP(hero,"SAVE_SPOT_KDF") <= 4000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((HeroISHUNTER == TRUE) && (SAVESPOTHUNTER == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_HUN") <= 1500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((IS_LOVCACH == TRUE) && (THIEF_REPUTATION >= 10) && (Npc_GetDistToWP(hero,"SAVE_SPOT_THF") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((TRADEMASTERBEGAN == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_TRD") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Player_IsApprentice == APP_Harad) && (Npc_GetDistToWP(hero,"SAVE_SPOT_HARAD") <= 300))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Player_IsApprentice == APP_Bosper) && (Npc_GetDistToWP(hero,"SAVE_SPOT_BOSPER") <= 300))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Player_IsApprentice == APP_Constantino) && (Npc_GetDistToWP(hero,"SAVE_SPOT_CONST") <= 300))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((JOINWATERRING == TRUE) && (Npc_GetDistToWP(hero,"NW_TAVERNE_IN_RANGERMEETING_LARES") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((SaggitaCanSave == TRUE) && (Npc_GetDistToWP(hero,"NW_SAGITTA_CAVE_IN_02") <= 750))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((MIS_Thekla_Paket == LOG_SUCCESS) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_07") <= 750))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == OldWorld_Zen)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_05") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_06") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_07") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_08") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_09") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_10") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_11") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_12") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DRAGONISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ADDONWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((AdanosPortalOpen == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_05") <= 2000))
					{
						if((AWORCINVASIONSTART == FALSE) || (AWORCINVASIONSTOP == TRUE))
						{
							_bCanSave = TRUE;
							FlagSaveOn = TRUE;
						}
						else
						{
							FlagSaveOn = FALSE;
						};
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCTEMPEL_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) && ((DARKMAGE_ISDEAD == TRUE) || (MeetDarkTempleMage == FALSE)))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ABANDONEDMINE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCGRAVEYARD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCCITY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((CanEnterOrcMine == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((UrTrallOkShv == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == SHVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FREEMINELAGER_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == OLDMINE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FREEMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEMONSTOWER_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEADGROT_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PSICAMP_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == SECRETISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == UNDEADZONE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEMONCAVE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PALADINFORT_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 3000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == LOSTISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 4000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FIRECAVE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GUARDIANCHAMBERS_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == HARADRIMARENA_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PRIORATWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"PW_INNER_TEMPLE_BOSS_MAIN") <= 2000) && (PW_Exit == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ADANOSVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == TEARSTEMPLE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"TT_WAY_HERO") <= 2000) && (BossTear == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCOREMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GINNOKWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == HAOSWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DRAGONTEMPLE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCMOUNTAIN_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					};
				}
				else if(CurrentLevel == PASHALWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GOLDMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"START_NW_GM") <= 1000) || (Npc_GetDistToWP(hero,"START_OW_GM") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ASHTARTEMPLE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"START_ASHTAR") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == LOSTVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"LOSTVALLEY_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"WDS_LAVA_LOWESTLEVEL_35") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_ARAHARPLAGUE") <= 1000) && (AraharPlagueIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SHADOWGUARD_CENTER") <= 1000) && (ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") <= 1000) && (SoulKeeperIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_DEADTREE_01") <= 1000) && (FiarasIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(Npc_GetDistToWP(hero,"LV_WAITFORHERO_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_09") <= 1000) && (SkelBrosFightWin == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_TEMPLE_IN") <= 1000) && (OpenHramDone == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_21") <= 1000) && (ChelDrakIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_30") <= 1000) && (IlesilIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else
				{
					FlagSaveOn = FALSE;
				};
			}
			else
			{
				if(CurrentLevel == NEWWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_01") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_02") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_XAR_03") <= 2000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(Npc_GetDistToWP(hero,"SAVE_SPOT_CHAPTER_7") <= 500)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_NW_AW") <= 500) && (DIA_Addon_Saturas_OpenPortal_NoPerm == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_SLD") <= 3000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_PSI") <= 3000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_HUN") <= 1500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((SaggitaCanSave == TRUE) && (Npc_GetDistToWP(hero,"NW_SAGITTA_CAVE_IN_02") <= 750))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((MIS_Thekla_Paket == LOG_SUCCESS) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_07") <= 750))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == OldWorld_Zen)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_05") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_06") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_07") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_08") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_09") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_10") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_11") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_12") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DRAGONISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ADDONWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((AdanosPortalOpen == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					};
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 2000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_05") <= 2000))
					{
						if((AWORCINVASIONSTART == FALSE) || (AWORCINVASIONSTOP == TRUE))
						{
							_bCanSave = TRUE;
							FlagSaveOn = TRUE;
						}
						else
						{
							FlagSaveOn = FALSE;
						};
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCTEMPEL_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) && ((DARKMAGE_ISDEAD == TRUE) || (MeetDarkTempleMage == FALSE)))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ABANDONEDMINE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCGRAVEYARD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCCITY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_04") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((CanEnterOrcMine == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((UrTrallOkShv == TRUE) && (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == SHVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FREEMINELAGER_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == OLDMINE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FREEMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEMONSTOWER_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEADGROT_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PSICAMP_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == SECRETISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == UNDEADZONE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DEMONCAVE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PALADINFORT_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 3000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == LOSTISLAND_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 4000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 500))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == FIRECAVE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GUARDIANCHAMBERS_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == HARADRIMARENA_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PRIORATWORLD_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"PW_INNER_TEMPLE_BOSS_MAIN") <= 2000) && (PW_Exit == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ADANOSVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == TEARSTEMPLE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"TT_WAY_HERO") <= 2000) && (BossTear == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCOREMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GINNOKWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == HAOSWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == DRAGONTEMPLE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ORCMOUNTAIN_ZEN)
				{
					if((Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_03") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == PASHALWORLD_ZEN)
				{
					if(Npc_GetDistToWP(hero,"SAVE_SPOT_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == GOLDMINE_ZEN)
				{
					if((Npc_GetDistToWP(hero,"START_NW_GM") <= 1000) || (Npc_GetDistToWP(hero,"START_OW_GM") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == ASHTARTEMPLE_ZEN)
				{
					if(Npc_GetDistToWP(hero,"START_ASHTAR") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else if(CurrentLevel == LOSTVALLEY_ZEN)
				{
					if((Npc_GetDistToWP(hero,"LOSTVALLEY_01") <= 1000) || (Npc_GetDistToWP(hero,"SAVE_SPOT_02") <= 1000) || (Npc_GetDistToWP(hero,"WDS_LAVA_LOWESTLEVEL_35") <= 1000))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_ARAHARPLAGUE") <= 1000) && (AraharPlagueIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SHADOWGUARD_CENTER") <= 1000) && (ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") <= 1000) && (SoulKeeperIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_DEADTREE_01") <= 1000) && (FiarasIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(Npc_GetDistToWP(hero,"LV_WAITFORHERO_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if(Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_01") <= 1000)
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLEYARD_09") <= 1000) && (SkelBrosFightWin == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"LOSTVALLEY_TEMPLE_IN") <= 1000) && (OpenHramDone == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_21") <= 1000) && (ChelDrakIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else if((Npc_GetDistToWP(hero,"WDS_LAVA_CASTLE_30") <= 1000) && (IlesilIsDead == TRUE))
					{
						_bCanSave = TRUE;
						FlagSaveOn = TRUE;
					}
					else
					{
						FlagSaveOn = FALSE;
					};
				}
				else
				{
					FlagSaveOn = FALSE;
				};
			};
		};
	};
	if(HeroIsDead == TRUE)
	{
		_bCanSave = TRUE;
	};
	if(bDevMode == TRUE)
	{
		_bCanSave = FALSE;
	};
};

func void B_CheckFPSMove()
{
	if(EquipedIndex_Chief == FALSE)
	{
		if((ATR_STAMINA[0] == 0) && (Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE))
		{
			if(WarTranse == FALSE)
			{
				Mdl_SetHeroAniFps(hero,"S_1HATTACK",20);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKL",20);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKR",20);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0",20);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A2",20);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A3",20);
				Mdl_SetHeroAniFps(hero,"S_2HATTACK",17);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKL",17);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKR",17);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0",17);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A2",17);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A3",17);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",17);
				Mdl_SetHeroAniFps(hero,"T_2HPARADEJUMPB",22);

				if(AIV_Speer == TRUE)
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",15);
				}
				else
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",17);	
				};
			}
			else
			{
				Mdl_SetHeroAniFps(hero,"S_1HATTACK",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKL",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKR",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A2",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A3",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKMOVE",32);
				Mdl_SetHeroAniFps(hero,"S_2HATTACK",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKL",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKR",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A2",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A3",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",29);
				Mdl_SetHeroAniFps(hero,"T_1HPARADEJUMPB",25);
				Mdl_SetHeroAniFps(hero,"T_2HPARADEJUMPB",25);
			};
		}
		else if((ATR_STAMINA[0] > 0) && (Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE))
		{
			if(WarTranse == FALSE)
			{
				Mdl_SetHeroAniFps(hero,"S_1HATTACK",25);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKL",25);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKR",25);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0",25);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A2",25);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A3",25);
				Mdl_SetHeroAniFps(hero,"T_1HPARADEJUMPB",25);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKMOVE",25);
				Mdl_SetHeroAniFps(hero,"S_2HATTACK",25);

				if(LH_Ready_2X2 == TRUE)
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKL",23);
					Mdl_SetHeroAniFps(hero,"T_2HATTACKR",15);
				}
				else
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKL",25);
					Mdl_SetHeroAniFps(hero,"T_2HATTACKR",25);
				};

				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0",25);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A2",25);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A3",25);
				Mdl_SetHeroAniFps(hero,"T_2HPARADEJUMPB",25);

				if(AIV_Speer == TRUE)
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",17);
				}
				else
				{
					Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",20);	
				};
			}
			else
			{
				Mdl_SetHeroAniFps(hero,"S_1HATTACK",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKL",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKR",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A2",32);
				Mdl_SetHeroAniFps(hero,"T_1HPARADE_0_A3",32);
				Mdl_SetHeroAniFps(hero,"T_1HATTACKMOVE",32);
				Mdl_SetHeroAniFps(hero,"S_2HATTACK",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKL",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKR",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A2",29);
				Mdl_SetHeroAniFps(hero,"T_2HPARADE_0_A3",29);
				Mdl_SetHeroAniFps(hero,"T_2HATTACKMOVE",29);
				Mdl_SetHeroAniFps(hero,"T_1HPARADEJUMPB",25);
				Mdl_SetHeroAniFps(hero,"T_2HPARADEJUMPB",25);
			};
		};
	};
};	

func void B_CheckNpcHealth()
{
	var C_NPC pNpc;
	var string npcname;

	pNpc = GetFocusNpc(hero);

	if(Npc_ValidFocusNpc(hero))
	{
		if((pNpc.attribute[ATR_HITPOINTS_MAX] > 0) && (Hlp_GetInstanceID(pNpc) != Hlp_GetInstanceID(hero)) && (pNpc.attribute[ATR_HITPOINTS] > 0) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (OptionCheck == FALSE) && (CamModeOn == FALSE) && (HeroIsDead == FALSE))
		{
			if(pNpc.aivar[94] == NPC_EPIC)	
			{
				TargetHealthBar.bShow = 0;
				TargetHealthBarLege.bShow = 0;
				TargetHealthBarRare.bShow = 0;
				TargetHealthBarEpic.bShow = 1;
				TargetHealthBarEpic.value = pNpc.attribute[ATR_HITPOINTS];
				TargetHealthBarEpic.maxrange = pNpc.attribute[ATR_HITPOINTS_MAX];
			}
			else if(pNpc.aivar[94] == NPC_LEGEND)	
			{
				TargetHealthBar.bShow = 0;
				TargetHealthBarEpic.bShow = 0;
				TargetHealthBarRare.bShow = 0;
				TargetHealthBarLege.bShow = 1;
				TargetHealthBarLege.value = pNpc.attribute[ATR_HITPOINTS];
				TargetHealthBarLege.maxrange = pNpc.attribute[ATR_HITPOINTS_MAX];
			}
			else if(pNpc.aivar[94] == NPC_UNCOMMON)	
			{
				TargetHealthBar.bShow = 0;
				TargetHealthBarEpic.bShow = 0;
				TargetHealthBarLege.bShow = 0;
				TargetHealthBarRare.bShow = 1;
				TargetHealthBarRare.value = pNpc.attribute[ATR_HITPOINTS];
				TargetHealthBarRare.maxrange = pNpc.attribute[ATR_HITPOINTS_MAX];
			}
			else
			{
				TargetHealthBarEpic.bShow = 0;
				TargetHealthBarLege.bShow = 0;
				TargetHealthBarRare.bShow = 0;
				TargetHealthBar.bShow = 1;
				TargetHealthBar.value = pNpc.attribute[ATR_HITPOINTS];
				TargetHealthBar.maxrange = pNpc.attribute[ATR_HITPOINTS_MAX];
			};
		}
		else if((OptionCheck == TRUE) || (CamModeOn == TRUE) || (HeroIsDead == TRUE) || (PLAYER_MOBSI_PRODUCTION != MOBSI_NONE))
		{
			TargetHealthBar.bShow = 0;
			TargetHealthBarEpic.bShow = 0;
			TargetHealthBarLege.bShow = 0;
			TargetHealthBarRare.bShow = 0;
		}
		else
		{
			TargetHealthBar.bShow = 0;
			TargetHealthBarEpic.bShow = 0;
			TargetHealthBarLege.bShow = 0;
			TargetHealthBarRare.bShow = 0;
		};
	}
	else
	{
		TargetHealthBar.bShow = 0;
		TargetHealthBarEpic.bShow = 0;
		TargetHealthBarLege.bShow = 0;
		TargetHealthBarRare.bShow = 0;
		return;
	};
};

func void UnPauseHeroCraft()
{
	bHaltHeroCr= FALSE;
};

func void RefreshCraftMenuData()
{
	bHaltHeroCr = TRUE;
};

func void UnPauseHero()
{
	bHaltHero = FALSE;
};

func void RefreshStatusMenuData()
{
	var int TempRankPoints;
	var int karma_innos;
	var int TempStatusFly;

	bHaltHero = TRUE;

	if(KAPITELORCATC == FALSE)
	{
		sKapitel = IntToString(Kapitel);
	}
	else
	{
		sKapitel = IntToString(7);
	};
	if(SBMODE == 1)
	{
		if(RealMode[2] == TRUE)
		{
			if(CheckRealMode[1] == TRUE)
			{
				sHardLvl = "'Legendární'";
			}
			else
			{
				sHardLvl = "'Legendární' (s ukl.)";
			};
		}
		else
		{
			sHardLvl = "Těžká";
		};
	}
	else if(SBMODE == 2)
	{
		sHardLvl = "Střední";
	}
	else if(SBMODE == 4)
	{	
		sHardLvl = "Lehká";
	};

	sAllDay = IntToString(Wld_GetDay());

	//----------Gil'diya vorov---------------------


	if(IS_LOVCACH == TRUE)
	{
		if((hero.attribute[ATR_DEXTERITY] >= 220) && (THIEF_REPUTATION >= 30))
		{
			sThiefGuild = "mistr";
		}
		else if((hero.attribute[ATR_DEXTERITY] >= 150) && (THIEF_REPUTATION >= 15))
		{
			sThiefGuild = "stín";
		}
		else if((hero.attribute[ATR_DEXTERITY] >= 80) && (THIEF_REPUTATION >= 10))
		{
			sThiefGuild = "šejdíř";
		}
		else
		{
			sThiefGuild = "zloděj";
		};
	}
	else
	{
		sThiefGuild = "-";
	};

	//----------Gil'diya ubiyts---------------------

	if(JOINKILLERS == TRUE)
	{
		if(BEKILLMASTER == TRUE)
		{
			sKillersGuild = "vůdce";
		}
		else
		{
			sKillersGuild = "žoldák";
		};
	}
	else
	{
		sKillersGuild = "-";
	};

	//----------Gil'diya torgovtsev---------------------
	
	if(MEMBERTRADEGUILD == TRUE)
	{
		if(TRADEMASTERBEGAN == TRUE)
		{
			sTradeGuild = "mistr";
		}
		else
		{
			sTradeGuild = "obchodník";
		};
	}
	else
	{
		sTradeGuild = "-";
	};


	sMonsterKilled = IntToString(MonsterKilled);
	sPeopleKilled = IntToString(PeopleKilled);
	sRankPoints = IntToString(RankPoints);
	TempRankPoints = RankPoints / SBMODE; 
	
	if(TempRankPoints >= 0)
	{
		if(TempRankPoints <= 500)
		{
			sGrade = "trestanec";
		}
		else if(TempRankPoints <= 1000)
		{
			sGrade = "žebrák";
		}
		else if(TempRankPoints <= 2000)
		{
			sGrade = "rolník";
		}
		else if(TempRankPoints <= 6000)
		{
			sGrade = "dělník";
		}
		else if(TempRankPoints <= 10000)
		{
			sGrade = "zahradník";
		}
		else if(TempRankPoints <= 16000)
		{
			sGrade = "učedník";
		}
		else if(TempRankPoints <= 22000)
		{
			sGrade = "řemeslník";
		}
		else if(TempRankPoints <= 28000)
		{
			sGrade = "lichvář";
		}
		else if(TempRankPoints <= 40000)
		{
			sGrade = "obchodník";
		}
		else if(TempRankPoints <= 52000)
		{
			sGrade = "strážce";
		}
		else if(TempRankPoints <= 65000)
		{
			sGrade = "ozbrojenec";
		}
		else if(TempRankPoints <= 80000)
		{
			sGrade = "voják";
		}
		else if(TempRankPoints <= 100000)
		{
			sGrade = "úředník";
		}
		else if(TempRankPoints <= 125000)
		{
			sGrade = "místodržící";
		}
		else if(TempRankPoints <= 150000)
		{
			sGrade = "rytíř";
		}
		else if(TempRankPoints <= 200000)
		{
			sGrade = "vojevůdce";
		}
		else if(TempRankPoints <= 250000)
		{
			sGrade = "Hrdina Myrtany";
		}
		else if(TempRankPoints <= 300000)
		{
			sGrade = "Boží ruka";
		}
		else if(TempRankPoints <= 400000)
		{
			sGrade = "Vyvolený";
		}
		else if(TempRankPoints < 500000)
		{
			sGrade = "Ochránce světa";
		}
		else
		{
			sGrade = "Legenda";
		};
	};
	if(UseMarvin[1] == TRUE)
	{
		sGrade = ConcatStrings(sGrade," (Marvin)");
	};

	karma_innos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;
	sInnosKarma = IntToString(karma_innos);
	sBeliarKarma = IntToString(BELIARPRAYCOUNT);


	//---------------------Attributy--------------------------

	sRealStr = IntToString(hero.aivar[REAL_STRENGTH]);
	sRealDex = IntToString(hero.aivar[REAL_DEXTERITY]);
	sRealMana = IntToString(hero.aivar[REAL_MANA_MAX]);
	sIntellect = IntToString(ATR_INTELLECT);

	if(hero.attribute[ATR_REGENERATEMANA] > 0)
	{
		sShield = IntToString(hero.attribute[ATR_REGENERATEMANA]);
	}
	else
	{
		sShield = "-";
	};

	if(hero.HitChance[NPC_TALENT_1H] >= 90)
	{
		sMastery1H = "mistr";
	}
	else if(hero.HitChance[NPC_TALENT_1H] >= 60)
	{
		sMastery1H = "expert";
	}
	else if(hero.HitChance[NPC_TALENT_1H] >= 30)
	{
		sMastery1H = "bojovník";
	}
	else
	{
		sMastery1H = "rekrut";
	};

	if(hero.HitChance[NPC_TALENT_2H] >= 90)
	{
		sMastery2H = "mistr";
	}
	else if(hero.HitChance[NPC_TALENT_2H] >= 60)
	{
		sMastery2H = "expert";
	}
	else if(hero.HitChance[NPC_TALENT_2H] >= 30)
	{
		sMastery2H = "bojovník";
	}
	else
	{
		sMastery2H = "rekrut";
	};

	if(hero.HitChance[NPC_TALENT_BOW] >= 60)
	{
		sMasteryBow = "mistr";
	}
	else if(hero.HitChance[NPC_TALENT_BOW] >= 30)
	{
		sMasteryBow = "střelec";
	}
	else
	{
		sMasteryBow = "rekrut";
	};

	if(hero.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		sMasteryCBow = "mistr";
	}
	else if(hero.HitChance[NPC_TALENT_CROSSBOW] >= 30)
	{
		sMasteryCBow = "střelec";
	}
	else
	{
		sMasteryCBow = "rekrut";
	};

	if(hero.attribute[ATR_REGENERATEMANA] >= 90)
	{
		sMasteryShld = "mistr";
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
	{
		sMasteryShld = "expert";
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
	{
		sMasteryShld = "adept";
	}
	else if(hero.attribute[ATR_REGENERATEMANA] > 0)
	{
		sMasteryShld = "nováček";
	}
	else
	{
		sMasteryShld = " ";
	};

	if(AIV_TwoHands == TRUE)
	{
		sDualWeapon = "Naučeno";
	}
	else
	{
		sDualWeapon = "-";
	};

	if(OFStyle == TRUE)
	{
		sOrcWeapon = "Naučeno";
	}
	else
	{
		sOrcWeapon = "-";
	};

	//--------------------TALANTY I UMENIYA-----------------------------

	//Remeslennyye navyki


	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) > 0)
	{
		sStatusSmth = IntToString(TalentCount_Smith[0]);
	}
	else
	{
		sStatusSmth = "-";
	};
	if(TalentCount_Smith[0] >= 90)
	{
		sMasterySmth = "mistr";
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		sMasterySmth = "expert";
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		sMasterySmth = "adept";
	}
	else if(TalentCount_Smith[0] > 0)
	{
		sMasterySmth = "nováček";
	}
	else
	{
		sMasterySmth = " ";
	};

	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) > 0)
	{
		sStatusAlkh = IntToString(TalentCount_Alchemy[0]);
	}
	else
	{
		sStatusAlkh = "-";
	};

	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) > 0)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			sMasteryAlkh = "mistr";
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			sMasteryAlkh = "expert";
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			sMasteryAlkh = "adept";
		}
		else if(TalentCount_Alchemy[0] > 0)
		{
			sMasteryAlkh = "nováček";
		}
		else
		{
			sMasteryAlkh = " ";
		};
	}
	else
	{
		sMasteryAlkh = " ";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_RUNES) > 0)
	{
		sStatusRune = IntToString(TalentCount_Rune[0]);
	}
	else
	{
		sStatusRune = "-";
	};
	if(TalentCount_Rune[0] >= 90)
	{
		sMasteryRune = "mistr";
	}
	else if(TalentCount_Rune[0] >= 60)
	{
		sMasteryRune = "expert";
	}
	else if(TalentCount_Rune[0] >= 30)
	{
		sMasteryRune = "adept";
	}
	else if(TalentCount_Rune[0] > 0)
	{
		sMasteryRune = "nováček";
	}
	else
	{
		sMasteryRune = " ";
	};

	if(Npc_GetTalentSkill(hero,NPC_TALENT_ERZWORK) > 0)
	{
		sStatusOre = IntToString(HERO_HACKCHANCEORE);
	}
	else
	{
		sStatusOre = "-";
	};
	if(HERO_HACKCHANCEORE >= 90)
	{
		sMasteryOre = "mistr";
	}
	else if(HERO_HACKCHANCEORE >= 60)
	{
		sMasteryOre = "expert";
	}
	else if(HERO_HACKCHANCEORE >= 30)
	{
		sMasteryOre = "adept";
	}
	else if(HERO_HACKCHANCEORE > 0)
	{
		sMasteryOre = "nováček";
	}
	else
	{
		sMasteryOre = " ";
	};


	if(Npc_GetTalentSkill(hero,NPC_TALENT_GOLDWORK) > 0)
	{
		sStatusGold = IntToString(Hero_HackChance);
	}
	else
	{
		sStatusGold = "-";
	};
	if(Hero_HackChance >= 90)
	{
		sMasteryGold = "mistr";
	}
	else if(Hero_HackChance >= 60)
	{
		sMasteryGold = "expert";
	}
	else if(Hero_HackChance >= 30)
	{
		sMasteryGold = "adept";
	}
	else if(Hero_HackChance > 0)
	{
		sMasteryGold = "nováček";
	}
	else
	{
		sMasteryGold = " ";
	};

	if(Matteo_TeachJewel == TRUE)
	{
		if(JEWERLY_LEVEL_AMUL == TRUE)
		{
			sStatusJew = "mistr";
		}
		else if(JEWERLY_LEVEL_L3 == TRUE)
		{
			sStatusJew = "expert";
		}
		else if(JEWERLY_LEVEL_L2 == TRUE)
		{
			sStatusJew = "adept";
		}
		else if(JEWERLY_LEVEL_L1 == TRUE)
		{
			sStatusJew = "nováček";
		};
	}
	else
	{
		sStatusJew = "-";
	};
	if(KNOWHOWTOOREFUS == TRUE)
	{
		sStatusPlavka = "Naučeno";
	}
	else
	{
		sStatusPlavka = "-";
	};
	if(PlayerRudoplav == TRUE)
	{
		sStatusMagPlavka = "Naučeno";
	}
	else
	{
		sStatusMagPlavka = "-";
	};
	if(OrcsWeaponSteel == TRUE)
	{
		sStatusOrcPlavka = "Naučeno";
	}
	else
	{
		sStatusOrcPlavka = "-";
	};
	if(KNOWHOWTOOREFUSGOLD == TRUE)
	{
		sStatusGoldSmth = "Naučeno";
	}
	else
	{
		sStatusGoldSmth = "-";
	};
	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		sStatusSharp = "Naučeno";
	}
	else
	{
		sStatusSharp = "-";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0)
	{
		sStatusThft = IntToString(PickPocketBonusCount);

		if(PickPocketBonusCount >= 90)
		{
			sMasteryThft = "mistr";
		}
		else if(PickPocketBonusCount >= 60)
		{
			sMasteryThft = "expert";
		}
		else if(PickPocketBonusCount >= 30)
		{
			sMasteryThft = "adept";
		}
		else if(PickPocketBonusCount > 0)
		{
			sMasteryThft = "nováček";
		};
	}
	else
	{
		sStatusThft = "-";
		sMasteryThft = " ";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) > 0)
	{
		sStatusBrk = IntToString(Npc_GetTalentValue(hero,NPC_TALENT_PICKLOCK));
	}
	else
	{
		sStatusBrk = "-";
	};
	if(Npc_GetTalentValue(hero,NPC_TALENT_PICKLOCK) >= 90)
	{
		sMasteryBrk = "mistr";
	}
	else if(Npc_GetTalentValue(hero,NPC_TALENT_PICKLOCK) >= 60)
	{
		sMasteryBrk = "expert";
	}
	else if(Npc_GetTalentValue(hero,NPC_TALENT_PICKLOCK) >= 30)
	{
		sMasteryBrk = "adept";
	}
	else if(Npc_GetTalentValue(hero,NPC_TALENT_PICKLOCK) > 0)
	{
		sMasteryBrk = "nováček";
	}
	else
	{
		sMasteryBrk = " ";
	};

	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) > 0)
	{
		sStatusAcro = "Naučeno";
	}
	else
	{
		sStatusAcro = "-";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) > 0)
	{
		sStatusStl = "Naučeno";
	}
	else
	{
		sStatusStl = "-";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) > 0)
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
		{
			sStatusCirc = "1. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
		{
			sStatusCirc = "2. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
		{
			sStatusCirc = "3. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
		{
			sStatusCirc = "4. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
		{
			sStatusCirc = "5. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
		{
			sStatusCirc = "6. kruh";
		};
	}
	else
	{
		sStatusCirc = "-";
	};

	if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) > 0)
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 1)
		{
			sStatusDmn = "Naučeno";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 2)
		{
			sStatusDmn = "1. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 3)
		{
			sStatusDmn = "2. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 4)
		{
			sStatusDmn = "3. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 5)
		{
			sStatusDmn = "4. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 6)
		{
			sStatusDmn = "5. kruh";
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG) == 7)
		{
			sStatusDmn = "6. kruh";
		};
	}
	else
	{
		sStatusDmn = "-";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_TAKEANIMALTROPHY) > 0)
	{
		sStatusHunt = "Naučeno";
	}
	else
	{
		sStatusHunt = "-";
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAKEARROWS) > 0)
	{
		sStatusArrow = "Naučeno";
	}
	else
	{
		sStatusArrow = "-";
	};
	if(ButcherSkill == TRUE)
	{
		sStatusMeat = "Naučeno";
	}
	else
	{
		sStatusMeat = "-";
	};
	if(RhetorikSkillValue[1] > 0)
	{
		if(RhetorikSkillValue[1] >= 90)
		{
			sStatusRhet = "mistr";
		}
		else if(RhetorikSkillValue[1] >= 60)
		{
			sStatusRhet = "expert";
		}
		else if(RhetorikSkillValue[1] >= 30)
		{
			sStatusRhet = "adept";
		}
		else if(RhetorikSkillValue[1] > 0)
		{
			sStatusRhet = "nováček";
		};

		sStatusRhetValue = IntToString(RhetorikSkillValue[1]);
	}
	else
	{
		sStatusRhet = "-";
		sStatusRhetValue = "";
	};
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		sStatusOrcL = "Naučeno";
	}
	else
	{
		sStatusOrcL = "-";
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[0] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[2] == TRUE))
	{
		sStatusAncL = "Naučeno";
	}
	else
	{
		sStatusAncL = "-";
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[3] == TRUE)
	{
		sStatusDemL = "Naučeno";
	}
	else
	{
		sStatusDemL = "-";
	};

	//------------Zashchita----------------------------------

	sStatusEdge = IntToString(hero.protection[PROT_EDGE]);
	sStatusBlunt = IntToString(hero.protection[PROT_BLUNT]);
	sStatusPoint = IntToString(hero.protection[PROT_POINT]);
	sStatusFire = IntToString(hero.protection[PROT_FIRE]);
	sStatusMagic = IntToString(hero.protection[PROT_MAGIC]);

	if(ColdReduceKnow == TRUE)
	{
		sStatusCold = "Naučeno";
	}
	else
	{
		sStatusCold = "-";
	};
	if(HotReduceKnow == TRUE)
	{
		sStatusHeat = "Naučeno";
	}
	else
	{
		sStatusHeat = "-";
	};
	if(ResistPoisonKnow == TRUE)
	{
		sStatusPoison = "Naučeno";
	}
	else
	{
		sStatusPoison = "-";
	};
	if(hero.protection[PROT_FLY] >= 10)
	{
		TempStatusFly = hero.protection[PROT_FLY] / 10;
		sStatusFly = IntToString(TempStatusFly);
	}
	else
	{
		sStatusFly = "-";
	};
	if(OberDementorIsDead == TRUE)
	{
		sStatusHeroic_01 = "- Dementor, strážce Bestie";
	};
	if(DARKMAGE_ISDEAD == TRUE)
	{
		sStatusHeroic_02 = "- Hoshkar, nekromant";
	};
	if(KreolIsDead == TRUE)
	{
		sStatusHeroic_03 = "- Creol, nekromant";
	};
	if(ORCLEADERISDEAD == TRUE)
	{
		sStatusHeroic_04 = "- Ur-Thrall, vůdce Hordy";
	};
	if(PW_Exit == TRUE)
	{
		sStatusHeroic_05 = "- Cor Kalom, démon Masyafu";
	};
	if(DragonFireIsDead == TRUE)
	{
		sStatusHeroic_06 = "- Feomathar, ohnivý drak";
	};
	if(DragonIceIsDead == TRUE)
	{
		sStatusHeroic_07 = "- Finkregh, ledový drak";
	};
	if(DragonSwampIsDead == TRUE)
	{
		sStatusHeroic_08 = "- Pandrodor, bažinný drak";
	};
	if(DragonRockIsDead == TRUE)
	{
		sStatusHeroic_09 = "- Pedrakhan, kamenný drak";
	};
	if(DragonRedIsDead == TRUE)
	{
		sStatusHeroic_10 = "- Trakanon, rudý drak";
	};
	if(UndeadDragonIsDead == TRUE)
	{
		sStatusHeroic_11 = "- Nemrtvý drak";
	};
	if(BLKDRAGNISDEAD == TRUE)
	{
		sStatusHeroic_12 = "- Azgalor, černý drak";
	};
	if(RavenIsDead == TRUE)
	{
		sStatusHeroic_13 = "- Raven, démon Stavitelů";
	};
	if(KillDeadPal_Ginnok == TRUE)
	{
		sStatusHeroic_14 = "- Lord Ginnok, Šílený Křižák";
	};
	if(INUBISISDEAD == TRUE)
	{
		sStatusHeroic_15 = "- Lord Inubis, strážce krypty";
	};
	if(QvardemonIsDead == TRUE)
	{
		sStatusHeroic_16 = "- Khardimon, kněz Stavitelů";
	};
	if(LIDEMONISDEAD == TRUE)
	{
		sStatusHeroic_17 = "- Zarkul, démonikon";
	};
	if(SleeperOldIsDead == TRUE)
	{
		sStatusHeroic_18 = "- Spáč, démonikon";
	};
	if(DemonPWISDEAD == TRUE)
	{
		sStatusHeroic_19 = "- Nebiros, démon";
	};
	if(SenyakIsDead == TRUE)
	{
		sStatusHeroic_20 = "- Senyak, arcidémon";
	};
	if(ORCMINEKILL_01 == TRUE)
	{
		sStatusHeroic_21 = "- Irh'Tar, ruka Chaosu";
	};
	if(DemonPsicampIsDead == TRUE)
	{
		sStatusHeroic_22 = "- Morag'Bar, ruka Chaosu";
	};
	if(ALLGUARDIANSNOLEADERISDEAD == TRUE)
	{
		sStatusHeroic_23 = "- Kra'Tuk, Avatar Chaosu";
	};
	if(MagolemusIsDead == TRUE)
	{
		sStatusHeroic_24 = "- Magolemus, ohnivý golem";
	};
	if(HashGorIsDead == TRUE)
	{
		sStatusHeroic_25 = "- Hash-Gor, nemrtvý skřet";
	};
	if(KelTuzedIsDead == TRUE)
	{
		sStatusHeroic_26 = "- Dakat, lord smrti";
	};
	if(DarkZhnezIsDead == TRUE)
	{
		sStatusHeroic_27 = "- Temný žnec";
	};
	if(IzulgIsDead == TRUE)
	{
		sStatusHeroic_28 = "- Izulg, strážce mrtvých";
	};
	if(AraharPlagueIsDead == TRUE)
	{
		sStatusHeroic_29 = "- Arah'Ar Zhoubný";
	};
	if(ShadowGuardOneIsDead == TRUE)
	{
		sStatusHeroic_30 = "- Ksert, Přízračné Slunce";
	};
	if(ShadowGuardTwoIsDead == TRUE)
	{
		sStatusHeroic_31 = "- Elayr, Přízračný Měsíc";
	};
	if(SoulKeeperIsDead == TRUE)
	{
		sStatusHeroic_32 = "- Asinoks, strážce duší";
	};
	if(FiarasIsDead == TRUE)
	{
		sStatusHeroic_33 = "- Fiaras, Věčný Plamen";
	};
	if(EkronIsDead == TRUE)
	{
		sStatusHeroic_34 = "- Ekron, prokletý strom";
	};
	if(SkelBroDexIsDead == TRUE)
	{
		sStatusHeroic_35 = "- Dra'Kzar, přízračný strážce";
	};
	if(SkelBroStrIsDead == TRUE)
	{
		sStatusHeroic_36 = "- Il'Kzar, přízračný strážce";
	};
	if(SkelBroMagIsDead == TRUE)
	{
		sStatusHeroic_37 = "- Ar'Kzar, přízračný strážce";
	};
	if(ChelDrakIsDead == TRUE)
	{
		sStatusHeroic_38 = "- Chel'Drak, prastarý lord";
	};
	if(IlesilIsDead == TRUE)
	{
		sStatusHeroic_39 = "- Ile'Sil, Lord Stínů";
	};
	if(VATRAS_TEACHREGEN == TRUE)
	{
		sStatusRegenHP = "Naučeno";
	}
	else
	{
		sStatusRegenHP = "-";
	};
	if(VATRAS_TEACHREGENMANA == TRUE)
	{
		sStatusRegenMana = "Naučeno";
	}
	else
	{
		sStatusRegenMana = "-";
	};
	if(VATRAS_TEACHREGENSTAM == TRUE)
	{
		sStatusRegenStam = "Naučeno";
	}
	else
	{
		sStatusRegenStam = "-";
	};
	if(TALIASAN_COUNTER > 0)
	{
		sStatusMagScrolls = "Naučeno";
	}
	else
	{
		sStatusMagScrolls = "-";
	};
	if(XARDAS_KNOWSSACTANOME == TRUE)
	{
		sStatusSactaNomen = "Naučeno";
	}
	else
	{
		sStatusSactaNomen = "-";
	};
	if(TrueShot == TRUE)
	{
		sStatusTrueShot = "Naučeno";
	}
	else
	{
		sStatusTrueShot = "-";
	};
	if(SkillBlockShield == TRUE)
	{
		sStatusShldRef = "Naučeno";
	}
	else
	{
		sStatusShldRef = "-";
	};
	if(MoraUlartuIsOn[1] == TRUE)
	{
		sStatusCapSoul = "Naučeno";
	}
	else
	{
		sStatusCapSoul = "-";
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) || (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) || (KNOWNORESWORD == TRUE) || (KNOWNORESWORD == TRUE))
	{
		sStatusMagicSmth = "Naučeno";
	}
	else
	{
		sStatusMagicSmth = "-";
	};
	if(Lovkach_W1 == TRUE)
	{
		sStatusSpageSmth = "Naučeno";
	}
	else
	{
		sStatusSpageSmth = "-";
	};
	if((ORCWEAPON_LINE_STR_01 == TRUE) || (ORCWEAPON_LINE_HP_01 == TRUE))
	{
		sStatusOrcWPSmth = "Naučeno";
	}
	else
	{
		sStatusOrcWPSmth = "-";
	};
	if((KNOWMAKECRAWLERARMOR == TRUE) || (PLAYER_TALENT_SMITH[33] == TRUE) || (PLAYER_TALENT_SMITH[34] == TRUE) || (Know_HuntArmor_01 == TRUE) || (Know_HuntArmor_02 == TRUE) || (Know_HuntArmor_03 == TRUE) || (Know_HuntArmor_04 == TRUE))
	{
		sStatusMakeArmor = "Naučeno";
	}
	else
	{
		sStatusMakeArmor = "-";
	};
	if((PLAYER_TALENT_SMITH[13] == TRUE) || (PLAYER_TALENT_SMITH[14] == TRUE) || (PLAYER_TALENT_SMITH[15] == TRUE) || (PLAYER_TALENT_SMITH[16] == TRUE) || (PLAYER_TALENT_SMITH[17] == TRUE) || (PLAYER_TALENT_SMITH[18] == TRUE) || (PLAYER_TALENT_SMITH[19] == TRUE) || (PLAYER_TALENT_SMITH[20] == TRUE) || (PLAYER_TALENT_SMITH[21] == TRUE) || (PLAYER_TALENT_SMITH[22] == TRUE) || (PLAYER_TALENT_SMITH[25] == TRUE) || (PLAYER_TALENT_SMITH[26] == TRUE) || (PLAYER_TALENT_SMITH[27] == TRUE) || (PLAYER_TALENT_SMITH[29] == TRUE) || (PLAYER_TALENT_SMITH[30] == TRUE) || (PLAYER_TALENT_SMITH[31] == TRUE) || (PLAYER_TALENT_SMITH[32] == TRUE))
	{
		sStatusArmorSmth = "Naučeno";
	}
	else
	{
		sStatusArmorSmth = "-";
	};
	if((BowMake_01 == TRUE) || (BowMake_02 == TRUE) || (BowMake_03 == TRUE) || (BowMake_04 == TRUE) || (BowMake_05 == TRUE))
	{
		sStatusMakeBow = "Naučeno";
	}
	else
	{
		sStatusMakeBow = "-";
	};
	if(KNOWHOWTOMAKEFIREARROWS == TRUE)
	{
		sStatusFireArrow = "Naučeno";
	}
	else
	{
		sStatusFireArrow = "-";
	};
	if((KNOWHOWTOMAKEMAGICARROWS == TRUE) || (KNOWHOWTOMAKEMAGICARROWS == TRUE))
	{
		sStatusMagicArrow = "Naučeno";
	}
	else
	{
		sStatusMagicArrow = "-";
	};
	if(MAKEHOLYARROWS == TRUE)
	{
		sStatusBlessArrow = "Naučeno";
	}
	else
	{
		sStatusBlessArrow = "-";
	};
	if(PoisonArrowKnow == TRUE)
	{
		sStatusPoisonArrow = "Naučeno";
	}
	else
	{
		sStatusPoisonArrow = "-";
	};
	if(KNOWHOWTOMAKEARROWSKER == TRUE)
	{
		sStatusOreArrow = "Naučeno";
	}
	else
	{
		sStatusOreArrow = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		sStatusHuntSkin = "Naučeno";
	}
	else
	{
		sStatusHuntSkin = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE)
	{
		sStatusHuntRepSkin = "Naučeno";
	}
	else
	{
		sStatusHuntRepSkin = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		sStatusHuntTeeth = "Naučeno";
	}
	else
	{
		sStatusHuntTeeth = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE)
	{
		sStatusHuntClaw = "Naučeno";
	}
	else
	{
		sStatusHuntClaw = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE)
	{
		sStatusHuntCrwl = "Naučeno";
	}
	else
	{
		sStatusHuntCrwl = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE)
	{
		sStatusHuntMndb = "Naučeno";
	}
	else
	{
		sStatusHuntMndb = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE)
	{
		sStatusHuntWing = "Naučeno";
	}
	else
	{
		sStatusHuntWing = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE)
	{
		sStatusHuntSting = "Naučeno";
	}
	else
	{
		sStatusHuntSting = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == TRUE)
	{
		sStatusHuntHeart = "Naučeno";
	}
	else
	{
		sStatusHuntHeart = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == TRUE)
	{
		sStatusHuntShwHorn = "Naučeno";
	}
	else
	{
		sStatusHuntShwHorn = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE)
	{
		sStatusHuntSnapHorn = "Naučeno";
	}
	else
	{
		sStatusHuntSnapHorn = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == TRUE)
	{
		sStatusHuntFireLang = "Naučeno";
	}
	else
	{
		sStatusHuntFireLang = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == TRUE)
	{
		sStatusHuntDragScale = "Naučeno";
	}
	else
	{
		sStatusHuntDragScale = "-";
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == TRUE)
	{
		sStatusHuntDragBlood = "Naučeno";
	}
	else
	{
		sStatusHuntDragBlood = "-";
	};
	if((Edda_Soup_00 == TRUE) || (Edda_Soup_01 == TRUE) || (Edda_Soup_02 == TRUE) || (Edda_Soup_03 == TRUE) || (Snaf_Meal_01 == TRUE) || (Snaf_Meal_02 == TRUE) || (Snaf_Meal_03 == TRUE))
	{
		sStatusHerdSoup = "Naučeno";
	}
	else
	{
		sStatusHerdSoup = "-";
	};
	if((Rezept_Compote_01 == TRUE) || (Rezept_Compote_02 == TRUE))
	{
		sStatusHerdCompot = "Naučeno";
	}
	else
	{
		sStatusHerdCompot = "-";
	};
	if((Thekla_Cake_01 == TRUE) || (Thekla_Cake_02 == TRUE) || (Thekla_Cake_03 == TRUE) || (Thekla_Cake_05 == TRUE) || (Thekla_Cake_05 == TRUE))
	{
		sStatusHerdCake = "Naučeno";
	}
	else
	{
		sStatusHerdCake = "-";
	};
};

func void CantUnlock()
{
	AI_PrintClr(PRINT_KeyMissing,177,58,17);
	B_Say(hero,hero,"$KEYMISSING");
};

func void UnlockDone()
{
	AI_PrintClr("Truhlice otevřena!",83,152,48);
	B_Say(hero,hero,"$ITEMREADY");
};

func void UnlockBreakDone()
{
	BreakChest = TRUE;
};


func void DevMode_On()
{
	if(UseMarvin[1] == FALSE)
	{				
		UseMarvin[1] = TRUE;
	};
};

// Puvodni DevMode_On/Off

/*	func void DevMode_On()
{
	var C_NPC pNpc;

	if(bDevMode == FALSE)
	{
		bDevMode = TRUE;
		AI_Print("! Testovací režim !");

		if(GuruTest[1] == FALSE)
		{
			AI_PlayAniBS(hero,"T_STAND_2_SIT",BS_SIT);
			PlayerSitDust = TRUE;
		};
		if(UseMarvin[1] == FALSE)
		{				
			UseMarvin[1] = TRUE;
		};
		/*	if(CurrentLevel == LOSTVALLEY_ZEN)
		{
			if(GuruTest[1] == FALSE)
			{
				ExitSession();
			};
		};
		if(CurrentLevel == PRIORATWORLD_ZEN)
		{
			ExitSession();
		};
		if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
		{
			ExitSession();
		};

		pNpc = GetFocusNpc(hero);

		if(Npc_ValidFocusNpc(hero))
		{
			if(pNpc.aivar[90] == TRUE)
			{
				ExitSession();
			};
		};
	}
	else
	{
		if(CurrentLevel == LOSTVALLEY_ZEN)
		{
			if(GuruTest[1] == FALSE)
			{
				ExitSession();
			};
		};
		if(CurrentLevel == PRIORATWORLD_ZEN)
		{
			ExitSession();
		};
		if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
		{
			ExitSession();
		};

		pNpc = GetFocusNpc(hero);

		if(Npc_ValidFocusNpc(hero))
		{
			if(pNpc.aivar[90] == TRUE)
			{
				ExitSession();
			};
		};
	};	
	if(HeroTpBack == TRUE)
	{
		HeroTpBack = FALSE;
		ExitSession();
	};
	if((bDevMode == TRUE) && (HeroTrans == TRUE))
	{
		ExitSession();
	};
};

func void DevMode_Off()
{
	if(bDevMode == TRUE)
	{
		bDevMode = FALSE;
	};

	HeroTpBack = FALSE;
};	*/

func void ClearPaused()
{
	bHeroRestStatus = FALSE;
	PauseCount = FALSE;
};

func void EnableShieldBlock()
{
	var int RandMoveBlock;

	if(ATR_STAMINA[0] > 0)
	{
		if((Npc_IsInFightMode(hero,FMODE_MELEE) == TRUE) && (EquipedIndex_1H == TRUE) && (AIV_GiveShieldRes == TRUE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE))
		{
			if(BlockChance > Hlp_Random(100))
			{
				if(hero.flags != NPC_FLAG_IMMORTAL)
				{
					hero.flags = NPC_FLAG_IMMORTAL;
				};

				BlockIsUp = TRUE;
				BlockIsUpSnd = TRUE;
			}
			else
			{
				if(hero.flags == NPC_FLAG_IMMORTAL)
				{
					hero.flags = NPC_FLAG_NONE;
				};

				BlockIsUp = FALSE;
				BlockIsUpSnd = FALSE;
			};
		}
		else
		{
			if(hero.flags == NPC_FLAG_IMMORTAL)
			{
				hero.flags = NPC_FLAG_NONE;
			};

			BlockIsUp = FALSE;
			BlockIsUpSnd = FALSE;
		};
	}
	else
	{
		if(hero.flags == NPC_FLAG_IMMORTAL)
		{
			hero.flags = NPC_FLAG_NONE;
		};

		BlockIsUp = FALSE;
		BlockIsUpSnd = FALSE;
	};
};

func void GamePaused()
{
	var int curhour;
	var int curmaxstam;
	var int daynow;
	var string concatText;

	if((MoreInfoOnScreen == TRUE) && (bHeroIsInCutscene == FALSE) && (HeroTrans == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (OptionCheck == FALSE) && (ShakoIsOn[0] == FALSE) && (HeroNotMobsi == FALSE) && (HeroIsDead == FALSE) && (CaptureCheat == TRUE) && (ENDGAMECREDITS == FALSE))
	{
		if(Menu_ReadInt("AST","bSaveInfoFPS") == FALSE)
		{
			View_Current_Hour();
		};

		bStatusBarInfo = TRUE;
	}
	else
	{
		bStatusBarInfo = FALSE;
		View_Current_Hour_None();

		if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) || (IdolMobileCheck == TRUE))
		{
			print_karma_beliar(95,1);
		}
		else if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) || (PrayMobileCheck == TRUE))
		{
			print_karma_innos(90,1);
		};
	};
	if(Menu_ReadInt("AST","bNumlockOff") == TRUE)
	{
		if(bNumlock == FALSE)
		{
			bNumlock = TRUE;
		};
	}
	else
	{
		if(bNumlock == TRUE)
		{
			bNumlock = FALSE;
		};
	};

	bStatusMenuInfo = FALSE;

	if((bStatusBarInfo == FALSE) && (SBMODE == TRUE))
	{
		if((CanShowStamina == TRUE) && (HeroIsDead == FALSE) && (CaptureCheat == TRUE) && (ENDGAMECREDITS == FALSE))
		{
			if(Menu_ReadInt("AST","bSaveInfoFPS") == FALSE)
			{
				if(bHeroIsInCutscene == FALSE)
				{
					if(Hero_Hunger == 0)
					{
						bNotShowHunger = TRUE;
					}
					else
					{
						bNotShowHunger = FALSE;
					};
					if(Hero_Thirst == 0)
					{
						bNotShowThirst = TRUE;
					}
					else
					{
						bNotShowThirst = FALSE;
					};
					if(Hero_Fatigue == 0)
					{
						bNotShowFatigue = TRUE;
					}
					else
					{
						bNotShowFatigue = FALSE;
					};
				};
			};
		};
	};
};

func void PerFrame()
{
	var int tmpDamageImarah;

	bPerFrameTimerP00 += 1;
	bPerFrameTimerP01 += 1;
	bPerFrameTimerP06 += 1;

	if((HeroTransOpen == FALSE) && (HEROTRANS == FALSE))
	{
		//-------------------pokadrovyy tsikl - potok 0-------------------------------------

		if(bPerFrameTimerP00 >= FRM_TIMER_P00)
		{
			bPerFrameTimerP00 = FALSE;

			if((Npc_IsAnimationActive(hero,"T_1HPARADE_0") == FALSE) && (Npc_IsAnimationActive(hero,"T_1HPARADE_0_A2") == FALSE) && (Npc_IsAnimationActive(hero,"T_1HPARADE_0_A3") == FALSE) && (hero.flags == NPC_FLAG_IMMORTAL) && (BlockIsUp == TRUE))
			{
				hero.flags = NPC_FLAG_NONE;
				BlockIsUp = FALSE;
				BlockIsUpSnd = FALSE;
			};
			if((ATR_STAMINA[0] < 1) && (BlockIsUp == TRUE))
			{
				hero.flags = NPC_FLAG_NONE;
				BlockIsUp = FALSE;
				BlockIsUpSnd = FALSE;
			};
			if((BlockIsUp == TRUE) && ((C_BodyStateContains(hero,BS_SWIM) == TRUE) || (C_BodyStateContains(hero,BS_DIVE) == TRUE) || (C_BodyStateContains(hero,BS_FALL) == TRUE)))
			{
				hero.flags = NPC_FLAG_NONE;
				BlockIsUp = FALSE;
				BlockIsUpSnd = FALSE;
			};
			if(!C_BodyStateContains(hero,BS_CLIMB) && !C_BodyStateContains(hero,BS_JUMP) && !C_BodyStateContains(hero,BS_PARADE))
			{
				JumpDone = FALSE;
			};
			if(SPRINT_ACTIVE == FALSE)
			{
				if(SPRINT_ACTIVE_DO == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"Humans_MageSprint.MDS");
					SPRINT_ACTIVE_DO = FALSE;
				};
			}
			else
			{
				if(SPRINT_ACTIVE_DO == FALSE)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_MageSprint.MDS");
					SPRINT_ACTIVE_DO = TRUE;
				};
			};
			if((Steal_Mode == FALSE) && (C_BodyStateContains(hero,BS_JUMP) == FALSE) && (C_BodyStateContains(hero,BS_CRAWL) == FALSE) && (C_BodyStateContains(hero,BS_FALL) == FALSE) && (C_BodyStateContains(hero,BS_SWIM) == FALSE) && (C_BodyStateContains(hero,BS_DIVE) == FALSE) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (Mount_Up == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (HeroNotMobsi == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
			{
				if(bStatusMenuInfo == FALSE)
				{
					bStatusMenuInfo = TRUE;
				};
			}
			else
			{
				if(bStatusMenuInfo == TRUE)
				{
					bStatusMenuInfo = FALSE;
				};
			};
			if((bHaltHero == TRUE) || (bHaltHeroCr == TRUE))
			{
				AI_Waitms(hero,1);	
			};
 			if(bSprintTime != FALSE)
			{
				bSprintTime -= 1;
			};
			if(PLAYER_MOBSI_PRODUCTION != MOBSI_NONE)
			{
				HeroNotMobsi = TRUE;
			};
			if(PLAYER_MOBSI_PRODUCTION == MOBSI_NONE)
			{
				if(!C_BodyStateContains(hero,BS_LIE))
				{
					HeroNotMobsi = FALSE;
				};
			};
			if((bHeroIsInCutscene == FALSE) && (Hlp_InventoryIsOpen() == FALSE) && (C_BodyStateContains(hero,BS_MOBINTERACT_INTERRUPT) == FALSE) && (HeroTrans == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE) && (OptionCheck == FALSE) && (ShakoIsOn[0] == FALSE) && (HeroNotMobsi == FALSE) && (HeroIsDead == FALSE) && (CaptureCheat == TRUE) && (ENDGAMECREDITS == FALSE))
			{
				if(bDebuffStatus == FALSE)
				{
					bDebuffStatus = TRUE;
				};
			}
			else
			{
				if(bDebuffStatus == TRUE)
				{
					bDebuffStatus = FALSE;
				};
			};
			if(Npc_IsInFightMode(hero,FMODE_MAGIC) == TRUE)
			{
				if(Npc_GetActiveSpell(hero) == SPL_UNLOCKCHEST)
				{	
					bCanUnlock = TRUE;
				}
				else
				{
					bCanUnlock = FALSE;
				};
			}	
			else
			{
				bCanUnlock = FALSE;
			};
			if(hero.attribute[ATR_HITPOINTS] < 1)
			{
				_bCanSave = FALSE;
			};
			if(CanShowStamina == TRUE)
			{
				if(hero.guild <= GIL_SEPERATOR_HUM)
				{
					B_CheckStamina();
					B_CheckFPSMove();
				}
				else
				{
					if(StaminaBar.bShow != 0)
					{
						StaminaBar.bShow = 0;
					};
				};
				if(StaminaBar.bShow == FALSE)
				{
					if(bStaminaBar == TRUE)
					{
						bStaminaBar = FALSE;
					};
				}
				else
				{
					if(bStaminaBar == FALSE)
					{
						bStaminaBar = TRUE;
					};
				};

				B_CheckNpcHealth();
			};
		};
		if(bPerFrameTimerP01 >= FRM_TIMER_P01)
		{
			bPerFrameTimerP01 = FALSE;

			if((ATR_STAMINA[0] > 0) && ((Npc_IsAnimationActive(hero,"T_1HATTACKMOVE") == TRUE) || (Npc_IsAnimationActive(hero,"T_2HATTACKMOVE") == TRUE)))
			{
				ATR_STAMINA[0] -= 1;
			};
			if((ArmorWithCapisUp == TRUE) && (ArmorWithCapisUpCheck == FALSE))
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					};
				};

				ArmorWithCapisUpCheck = TRUE;
			};
		};
	}
	else
	{
		if(CanShowStamina == TRUE)
		{
			StaminaBar.bShow = 0;
		};
		if(StaminaBar.bShow == FALSE)
		{
			if(bStaminaBar == TRUE)
			{
				bStaminaBar = FALSE;
			};
		}
		else
		{
			if(bStaminaBar == FALSE)
			{
				bStaminaBar = TRUE;
			};
		};

		B_CheckNpcHealth();
	};

	//-------------------pokadrovyy tsikl - potok 6-------------------------------------

	if(bPerFrameTimerP06 >= FRM_TIMER_P06)
	{
		bPerFrameTimerP06 = FALSE;

		if((ImarahStarts == TRUE) && (ImarahIsDead == FALSE))
		{
			tmpImarahCount += 1;

			if(tmpImarahCount == 1500)
			{
				ImarahHeals = TRUE;
				Snd_Play("IMARAHCURSE");
				AI_PlayAni(Imarah,"T_SLDELITE");
				AI_Wait(Imarah,1);
				Wld_PlayEffect("SPELLFX_BELIARSHRINE",Imarah,Imarah,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",Imarah,Imarah,0,0,0,FALSE);
			}
			else if(tmpImarahCount == 2500)
			{
				AI_PlayAni(Imarah,"T_PALELITE");
				AI_Wait(Imarah,1);
				Wld_PlayEffect("VOB_MAGICBURN",Imarah,Imarah,0,0,0,FALSE);	
				Snd_Play("OPENSOUL");
				Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",Imarah,hero,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",Imarah,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				PlayerIsIgnition = TRUE;

				if(hero.protection[PROT_FIRE] < 1000)
				{
					tmpDamageImarah = 1000 - hero.protection[PROT_FIRE];
					Npc_ChangeAttribute(hero,ATR_HITPOINTS,-tmpDamageImarah);
				};

				ImarahHeals = FALSE;
				tmpImarahCount = FALSE;
			};
		};
	};
};

func void B_CheckFightFocus(var C_Npc slf)
{
};

func void HJGDjdfhSFGhGKLDgjksfGDGjj1()
{
};

func void HJGDjdfhSFGhGKLDgjksfGDGjj()
{
};

func void HJGDjdfhSFGhGKLDgjksfGDGjjJHKJHJFFD()
{
	HJGDjdfhSFGhGKLDgjksfGDGjj();
	HJGDjdfhSFGhGKLDgjksfGDGjj1();
};