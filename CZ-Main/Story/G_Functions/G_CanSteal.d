func int B_CountStealASTMoney(var C_Npc pStealedNpc)
{
	var int CsMoney;

	if((pStealedNpc.guild == GIL_NONE) || (pStealedNpc.guild == GIL_OUT) || (pStealedNpc.guild == GIL_SEK) || (pStealedNpc.guild == GIL_NOV))
	{
		CsMoney = 5 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_BAU) || (pStealedNpc.guild == GIL_VLK))
	{
		if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(Bau_900_Onar))
		{
			CsMoney = 100 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_400_Larius))
		{
			CsMoney = 100 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_403_Gerbrandt))
		{
			CsMoney = 80 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_404_Lutero))
		{
			CsMoney = 80 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_405_Fernando))
		{
			CsMoney = 80 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_409_Zuris))
		{
			CsMoney = 50 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_447_Cassia))
		{
			CsMoney = 50 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_445_Ramirez))
		{
			CsMoney = 50 + Hlp_Random(20);
		}
		else if(Hlp_GetInstanceID(pStealedNpc) == Hlp_GetInstanceID(VLK_6027_TALIASAN))
		{
			CsMoney = 50 + Hlp_Random(20);
		}
		else
		{
			CsMoney = 10 + Hlp_Random(20);
		};
	}	
	else if((pStealedNpc.guild == GIL_SLD) || (pStealedNpc.guild == GIL_MIL) || (pStealedNpc.guild == GIL_PIR) || (pStealedNpc.guild == GIL_BDT))
	{
		CsMoney = 20 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_DJG) || (pStealedNpc.guild == GIL_TPL))
	{
		CsMoney = 30 + Hlp_Random(20);
	}
	else if(pStealedNpc.guild == GIL_PAL)
	{
		CsMoney = 50 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_KDF) || (pStealedNpc.guild == GIL_KDW) || (pStealedNpc.guild == GIL_GUR))
	{
		CsMoney = 80 + Hlp_Random(20);
	}
	else
	{
		CsMoney = 1 + Hlp_Random(5);
	};

	return CsMoney;
};

func void G_OpenSteal(var int uKey)
{
	var C_Npc pNpc;
	var int tmpThfXP;
	var int tempPickPocket;
	var int sMoney;
	var int sExp;
	var int sChance;
	var int sChanceProc;
	var string concatText;
	var int daynow;

	daynow = Wld_GetDay();
	pNpc = GetFocusNpc(hero);

	if(bNewSteal[0] == FALSE)
	{
		return;
	};
	if(!Npc_ValidFocusNpc(hero))
	{
		return;
	};
	if(PLAYER_MOBSI_PRODUCTION != MOBSI_NONE) 
	{
		return;
	};
	if((Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(Crait)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8151_Umrak)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(pNpc) == Hlp_GetInstanceID(STRF_2157_Fighter)))
	{
		return;
	};
	if(pNpc.guild == GIL_STRF)
	{
		return;
	}
	if(pNpc.guild > GIL_SEPERATOR_HUM)
	{
		return;
	}
	if(Npc_IsDead(pNpc) == TRUE)
	{
		return;
	}
	if(Npc_GetDistToNpc(pNpc,hero) > 200)
	{
		return;
	};
	if(pNpc.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		return;
	};
	if((pNpc.flags == NPC_FLAG_XARADRIM) || (pNpc.flags == NPC_FLAG_IMMORTAL) || (pNpc.guild == GIL_DMT) || (pNpc.aivar[90] == TRUE) || (pNpc.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (pNpc.aivar[AIV_MM_RestEnd] == TRUE))
	{
		return;
	};
	if((uKey == KEY_O) && (Npc_CanSeeNpc(pNpc,hero) == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (bNewSteal[0] == TRUE) && (pNpc.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		if(StrCmp("SNEAK",GetWalkModeString(hero)) || (PickPocketBonusCount >= 90))
		{
			if(hero.attribute[ATR_DEXTERITY] < pNpc.attribute[ATR_DEXTERITY])
			{	
				sChance = pNpc.attribute[ATR_DEXTERITY] - hero.attribute[ATR_DEXTERITY];

				if(sChance >= 100)
				{
					sChanceProc = 0;
				}
				else
				{
					sChanceProc = 100 - sChance;
				};
			}
			else
			{
				sChanceProc = 100;
			};
			if((sChanceProc < 100) && (PickPocketBonusCount > 0))
			{
				sChanceProc = sChanceProc + (PickPocketBonusCount / 20);

				if(sChanceProc > 100)
				{
					sChanceProc = 100;
				};
			};
			if((sChanceProc < 100) && (Npc_IsInState(pNpc,ZS_Sleep) || Npc_IsInState(pNpc,ZS_MagicSleep)))
			{
				sChanceProc += 20;

				if(sChanceProc > 100)
				{
					sChanceProc = 100;
				};
			};

			concatText = ConcatStrings(PICKPOCKETCHANCE_AST,IntToString(sChanceProc));
			concatText = ConcatStrings(concatText,"%");

			
			if(sChanceProc > 75)
			{
				AI_PrintClr(concatText,52,200,4);
			}
			else if(sChanceProc > 50)
			{
				AI_PrintClr(concatText,155,251,5);
			}
			else if(sChanceProc > 30)
			{
				AI_PrintClr(concatText,255,234,17);
			}
			else if(sChanceProc > 10)
			{
				AI_PrintClr(concatText,255,126,17);
			}
			else
			{
				AI_PrintClr(concatText,244,34,0);
			};

			return;
		};
	}
	if((uKey == MOUSE_XBUTTON1) && (Npc_CanSeeNpc(pNpc,hero) == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (bNewSteal[0] == TRUE) && (pNpc.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		if(StrCmp("SNEAK",GetWalkModeString(hero)) || (PickPocketBonusCount >= 90))
		{
			if(hero.attribute[ATR_DEXTERITY] < pNpc.attribute[ATR_DEXTERITY])
			{	
				sChance = pNpc.attribute[ATR_DEXTERITY] - hero.attribute[ATR_DEXTERITY];

				if(sChance >= 100)
				{
					sChanceProc = 0;
				}
				else
				{
					sChanceProc = 100 - sChance;
				};
			}
			else
			{
				sChanceProc = 100;
			};
			if((sChanceProc < 100) && (PickPocketBonusCount > 0))
			{
				sChanceProc = sChanceProc + (PickPocketBonusCount / 20);

				if(sChanceProc > 100)
				{
					sChanceProc = 100;
				};
			};
			if((sChanceProc < 100) && (Npc_IsInState(pNpc,ZS_Sleep) || Npc_IsInState(pNpc,ZS_MagicSleep)))
			{
				sChanceProc += 20;

				if(sChanceProc > 100)
				{
					sChanceProc = 100;
				};
			};

			concatText = ConcatStrings(PICKPOCKETCHANCE_AST,IntToString(sChanceProc));
			concatText = ConcatStrings(concatText,"%");

			
			if(sChanceProc > 75)
			{
				AI_PrintClr(concatText,52,200,4);
			}
			else if(sChanceProc > 50)
			{
				AI_PrintClr(concatText,155,251,5);
			}
			else if(sChanceProc > 30)
			{
				AI_PrintClr(concatText,255,234,17);
			}
			else if(sChanceProc > 10)
			{
				AI_PrintClr(concatText,255,126,17);
			}
			else
			{
				AI_PrintClr(concatText,244,34,0);
			};

			return;
		};
	}
	else if((uKey == MOUSE_BUTTONRIGHT) && (Npc_CanSeeNpc(pNpc,hero) == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (bNewSteal[0] == TRUE))
	{
		if(StrCmp("SNEAK",GetWalkModeString(hero)) || (PickPocketBonusCount >= 90))
		{
			if((pNpc.guild != GIL_STRF) && (pNpc.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (pNpc.vars[0] == FALSE) && (pNpc.guild <= GIL_SEPERATOR_HUM) && (pNpc.npcType != npctype_friend) && (pNpc.flags != NPC_FLAG_XARADRIM) && (pNpc.flags != NPC_FLAG_IMMORTAL) && (pNpc.guild != GIL_DMT) && (pNpc.aivar[90] != TRUE) && (pNpc.aivar[AIV_MM_REAL_ID] != ID_SKELETON) && (pNpc.aivar[AIV_MM_RestEnd] != TRUE))
			{
				if(hero.attribute[ATR_DEXTERITY] < pNpc.attribute[ATR_DEXTERITY])
				{	
					sChance = pNpc.attribute[ATR_DEXTERITY] - hero.attribute[ATR_DEXTERITY];

					if(sChance >= 100)
					{
						sChanceProc = 0;
					}
					else
					{
						sChanceProc = 100 - sChance;
					};
				}
				else
				{
					sChanceProc = 100;
				};
				if((sChanceProc < 100) && (PickPocketBonusCount > 0))
				{
					sChanceProc = sChanceProc + (PickPocketBonusCount / 20);
				};
				if((sChanceProc < 100) && (Npc_IsInState(pNpc,ZS_Sleep) || Npc_IsInState(pNpc,ZS_MagicSleep)))
				{
					sChanceProc += 20;
	
					if(sChanceProc > 100)
					{
						sChanceProc = 100;
					};
				};

				AI_PlayAni(hero,"T_STEAL");
				AI_Wait(hero,1);

				if(sChanceProc >= (1 + Hlp_Random(99)))
				{
					if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
					{
						INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
					}
					else
					{
						GlobalThiefCount += 1;

						if(GlobalThiefCount >= 3)
						{
							INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
							GlobalThiefCount = FALSE;
						};
					};

					Snd_Play("Geldbeutel");
					sMoney = B_CountStealASTMoney(pNpc);
					PickPocketBonusCount += 1;
					B_GiveInvItems(pNpc,hero,ItMi_Gold,sMoney);
					pNpc.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
					Ext_RemoveFromSlot(pNpc,"BIP01 SPINE1");	

					if(PickPocketBonusCount > 10)
					{
						sExp = (pNpc.attribute[ATR_DEXTERITY] / 10) + (PickPocketBonusCount / 10);
					}
					else
					{
						sExp = pNpc.attribute[ATR_DEXTERITY] / 10;
					};

					B_GivePlayerXP(sExp);

					if(OverallBonusThief < (10 * Kapitel))
					{
						CountThiefOverallBonus += 1;

						if(CountThiefOverallBonus >= 15)
						{
							B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,1);
							CountThiefOverallBonus = FALSE;
							OverallBonusThief += 1;
						};
					};

					return;
				}
				else
				{
					AI_PrintClr("Tvůj pokus o krádež byl odhalen!",177,58,17);
					THIEFCATCHER = Hlp_GetNpc(pNpc);
					HERO_CANESCAPEFROMGOTCHA = TRUE;
					B_ResetThiefLevel();
					pNpc.vars[0] = TRUE;

					if(StrCmp("SNEAK",GetWalkModeString(hero)))
					{
						AI_SetWalkMode(hero,NPC_RUN);
						AI_Standup(hero);
					};

					if(!C_BodyStateContains(pNpc,BS_MOBINTERACT_INTERRUPT) && (Npc_IsInState(pNpc,ZS_Sleep) == FALSE) && (Npc_IsInState(pNpc,ZS_MagicSleep) == FALSE))
					{
						AI_TurnToNPC(pNpc,hero);	
						AI_Dodge(pNpc);						
					};

					return;
				};
			}
			else
			{
				if(pNpc.vars[0] == TRUE)
				{
					AI_PrintClr("Už jsi jednou byl odhalen...",177,58,17);
					B_Say(hero,hero,"$DONTKNOW");
				}
				else if(pNpc.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
				{
					AI_PrintClr("Není tu nic k ukradení...",255,255,255);
					B_Say(hero,hero,"$DONTKNOW");
				};

				return;
			};
		}
		else
		{
			return;
		};
	}
	else if((uKey == KEY_P) && (Npc_CanSeeNpc(pNpc,hero) == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE) && (bNewSteal[0] == TRUE))
	{
		if(StrCmp("SNEAK",GetWalkModeString(hero)) || (PickPocketBonusCount >= 90))
		{
			if((pNpc.guild != GIL_STRF) && (pNpc.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (pNpc.vars[0] == FALSE) && (pNpc.guild <= GIL_SEPERATOR_HUM) && (pNpc.npcType != npctype_friend) && (pNpc.flags != NPC_FLAG_XARADRIM) && (pNpc.flags != NPC_FLAG_IMMORTAL) && (pNpc.guild != GIL_DMT) && (pNpc.aivar[90] != TRUE) && (pNpc.aivar[AIV_MM_REAL_ID] != ID_SKELETON) && (pNpc.aivar[AIV_MM_RestEnd] != TRUE))
			{
				if(hero.attribute[ATR_DEXTERITY] < pNpc.attribute[ATR_DEXTERITY])
				{	
					sChance = pNpc.attribute[ATR_DEXTERITY] - hero.attribute[ATR_DEXTERITY];

					if(sChance >= 100)
					{
						sChanceProc = 0;
					}
					else
					{
						sChanceProc = 100 - sChance;
					};
				}
				else
				{
					sChanceProc = 100;
				};
				if((sChanceProc < 100) && (PickPocketBonusCount > 0))
				{
					sChanceProc = sChanceProc + (PickPocketBonusCount / 20);
				};
				if((sChanceProc < 100) && (Npc_IsInState(pNpc,ZS_Sleep) || Npc_IsInState(pNpc,ZS_MagicSleep)))
				{
					sChanceProc += 20;
	
					if(sChanceProc > 100)
					{
						sChanceProc = 100;
					};
				};

				AI_PlayAni(hero,"T_STEAL");
				AI_Wait(hero,1);

				if(sChanceProc >= (1 + Hlp_Random(99)))
				{
					if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
					{
						INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
					}
					else
					{
						GlobalThiefCount += 1;

						if(GlobalThiefCount >= 3)
						{
							INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
							GlobalThiefCount = FALSE;
						};
					};

					Snd_Play("Geldbeutel");
					sMoney = B_CountStealASTMoney(pNpc);
					PickPocketBonusCount += 1;
					B_GiveInvItems(pNpc,hero,ItMi_Gold,sMoney);
					pNpc.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
					Ext_RemoveFromSlot(pNpc,"BIP01 SPINE1");	

					if(PickPocketBonusCount > 10)
					{
						sExp = (pNpc.attribute[ATR_DEXTERITY] / 10) + (PickPocketBonusCount / 10);
					}
					else
					{
						sExp = pNpc.attribute[ATR_DEXTERITY] / 10;
					};

					B_GivePlayerXP(sExp);

					if(OverallBonusThief < (10 * Kapitel))
					{
						CountThiefOverallBonus += 1;

						if(CountThiefOverallBonus >= 15)
						{
							B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,1);
							CountThiefOverallBonus = FALSE;
							OverallBonusThief += 1;
						};
					};

					return;
				}
				else
				{
					AI_PrintClr("Tvůj pokus o krádež byl odhalen!",177,58,17);
					THIEFCATCHER = Hlp_GetNpc(pNpc);
					HERO_CANESCAPEFROMGOTCHA = TRUE;
					B_ResetThiefLevel();
					pNpc.vars[0] = TRUE;

					if(StrCmp("SNEAK",GetWalkModeString(hero)))
					{
						AI_SetWalkMode(hero,NPC_RUN);
						AI_Standup(hero);
					};

					if(!C_BodyStateContains(pNpc,BS_MOBINTERACT_INTERRUPT) && (Npc_IsInState(pNpc,ZS_Sleep) == FALSE) && (Npc_IsInState(pNpc,ZS_MagicSleep) == FALSE))
					{
						AI_TurnToNPC(pNpc,hero);	
						AI_Dodge(pNpc);						
					};

					return;
				};
			}
			else
			{
				if(pNpc.vars[0] == TRUE)
				{
					AI_PrintClr("Už jsi jednou byl odhalen...",177,58,17);
					B_Say(hero,hero,"$DONTKNOW");
				}
				else if(pNpc.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
				{
					AI_PrintClr("Není tu nic k ukradení...",255,255,255);
					B_Say(hero,hero,"$DONTKNOW");
				};

				return;
			};
		}
		else
		{
			return;
		};
	};
};

func int ItemStealed(var int npc, var int itm,var int amount)
{
	return FALSE;
};

func void B_StealModeIn()
{
};

func void B_GetXPSteal()
{
};

func int G_CanSteal()
{
	return FALSE;
};