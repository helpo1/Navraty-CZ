
func void b_endproductiondialog()
{
	var string concatText;
	var int random;
	var int tempRuneSkill;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (hero.attribute[ATR_HITPOINTS] <= 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"VOB_MAGICBURN");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (SENYAKSUMMON == FALSE) && (MIS_MORIUSTEST != LOG_Running) && (TALKSENYAK == FALSE) && (SENYAKSEEKSWORD == TRUE) && (CurrentLevel != SHVALLEY_ZEN) && (Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || (Npc_HasItems(hero,itru_beliarsrune01) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune02) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune03) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune04) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune05) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune06) == TRUE)))
	{
		random = Hlp_Random(100);
		if(random >= 75)
		{
			if(SENYAK_SENDPACK1 == FALSE)
			{
				SENYAK_SENDPACK1 = TRUE;

				if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_IDOL_01_00"))
				{
					Wld_InsertNpc(demon_sendsenyak,"NW_IDOL_01_00");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_01_00"))
				{
					Wld_InsertNpc(demon_sendsenyak,"ADW_IDOL_01_00");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_02_00"))
				{
					Wld_InsertNpc(demon_sendsenyak,"ADW_IDOL_02_00");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_01_00"))
				{
					Wld_InsertNpc(demon_sendsenyak,"OW_IDOL_01_00");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_02_00"))
				{
					Wld_InsertNpc(demon_sendsenyak,"OW_IDOL_02_00");
				}
				else
				{
					SENYAK_SENDPACK1 = FALSE;
				};
			};
		}
		else if(random >= 50)
		{
			if(SENYAK_SENDPACK2 == FALSE)
			{
				SENYAK_SENDPACK2 = TRUE;

				if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_1,"NW_IDOL_01_00");
					Wld_InsertNpc(darkskeleton1_sendsenyak,"NW_IDOL_01_01");
					Wld_InsertNpc(darkskeleton2_sendsenyak,"NW_IDOL_01_02");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_1,"ADW_IDOL_01_00");
					Wld_InsertNpc(darkskeleton1_sendsenyak,"ADW_IDOL_01_01");
					Wld_InsertNpc(darkskeleton2_sendsenyak,"ADW_IDOL_01_02");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_02_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_1,"ADW_IDOL_02_00");
					Wld_InsertNpc(darkskeleton1_sendsenyak,"ADW_IDOL_02_01");
					Wld_InsertNpc(darkskeleton2_sendsenyak,"ADW_IDOL_02_02");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_1,"OW_IDOL_01_00");
					Wld_InsertNpc(darkskeleton1_sendsenyak,"OW_IDOL_01_01");
					Wld_InsertNpc(darkskeleton2_sendsenyak,"OW_IDOL_01_02");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_02_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_1,"OW_IDOL_02_00");
					Wld_InsertNpc(darkskeleton1_sendsenyak,"OW_IDOL_02_01");
					Wld_InsertNpc(darkskeleton2_sendsenyak,"OW_IDOL_02_02");
				}
				else
				{
					SENYAK_SENDPACK2 = FALSE;
				};
			};
		}
		else if(random >= 25)
		{
			if(SENYAK_SENDPACK3 == FALSE)
			{
				SENYAK_SENDPACK3 = TRUE;

				if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_2,"NW_IDOL_01_00");
					Wld_InsertNpc(skeleton1_sendsenyak,"NW_IDOL_01_01");
					Wld_InsertNpc(skeleton2_sendsenyak,"NW_IDOL_01_02");
					Wld_InsertNpc(skeleton3_sendsenyak,"NW_IDOL_01_03");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_2,"ADW_IDOL_01_00");
					Wld_InsertNpc(skeleton1_sendsenyak,"ADW_IDOL_01_01");
					Wld_InsertNpc(skeleton2_sendsenyak,"ADW_IDOL_01_02");
					Wld_InsertNpc(skeleton3_sendsenyak,"ADW_IDOL_01_03");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_02_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_2,"ADW_IDOL_02_00");
					Wld_InsertNpc(skeleton1_sendsenyak,"ADW_IDOL_02_01");
					Wld_InsertNpc(skeleton2_sendsenyak,"ADW_IDOL_02_02");
					Wld_InsertNpc(skeleton3_sendsenyak,"ADW_IDOL_02_03");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_01_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_2,"OW_IDOL_01_00");
					Wld_InsertNpc(skeleton1_sendsenyak,"OW_IDOL_01_01");
					Wld_InsertNpc(skeleton2_sendsenyak,"OW_IDOL_01_02");
					Wld_InsertNpc(skeleton3_sendsenyak,"OW_IDOL_01_03");
				}
				else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_02_00"))
				{
					Wld_InsertNpc(skeletonmage_sendsenyak_2,"OW_IDOL_02_00");
					Wld_InsertNpc(skeleton1_sendsenyak,"OW_IDOL_02_01");
					Wld_InsertNpc(skeleton2_sendsenyak,"OW_IDOL_02_02");
					Wld_InsertNpc(skeleton3_sendsenyak,"OW_IDOL_02_03");
				}
				else
				{
					SENYAK_SENDPACK3 = FALSE;
				};
			};
		}
		else if(SENYAK_SENDPACK4 == FALSE)
		{
			SENYAK_SENDPACK4 = TRUE;

			if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_IDOL_01_00"))
			{
				Wld_InsertNpc(skeletonmage_sendsenyak_3,"NW_IDOL_01_00");
				Wld_InsertNpc(zombie1_sendsenyak,"NW_IDOL_01_01");
				Wld_InsertNpc(zombie2_sendsenyak,"NW_IDOL_01_02");
				Wld_InsertNpc(zombie3_sendsenyak,"NW_IDOL_01_03");
				Wld_InsertNpc(zombie4_sendsenyak,"NW_IDOL_01_04");
			}
			else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_01_00"))
			{
				Wld_InsertNpc(skeletonmage_sendsenyak_3,"ADW_IDOL_01_00");
				Wld_InsertNpc(zombie1_sendsenyak,"ADW_IDOL_01_01");
				Wld_InsertNpc(zombie2_sendsenyak,"ADW_IDOL_01_02");
				Wld_InsertNpc(zombie3_sendsenyak,"ADW_IDOL_01_03");
				Wld_InsertNpc(zombie4_sendsenyak,"ADW_IDOL_01_04");
			}
			else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_02_00"))
			{
				Wld_InsertNpc(skeletonmage_sendsenyak_3,"ADW_IDOL_02_00");
				Wld_InsertNpc(zombie1_sendsenyak,"ADW_IDOL_02_01");
				Wld_InsertNpc(zombie2_sendsenyak,"ADW_IDOL_02_02");
				Wld_InsertNpc(zombie3_sendsenyak,"ADW_IDOL_02_03");
				Wld_InsertNpc(zombie4_sendsenyak,"ADW_IDOL_02_04");
			}
			else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_01_00"))
			{
				Wld_InsertNpc(skeletonmage_sendsenyak_3,"OW_IDOL_01_00");
				Wld_InsertNpc(zombie1_sendsenyak,"OW_IDOL_01_01");
				Wld_InsertNpc(zombie2_sendsenyak,"OW_IDOL_01_02");
				Wld_InsertNpc(zombie3_sendsenyak,"OW_IDOL_01_03");
				Wld_InsertNpc(zombie4_sendsenyak,"OW_IDOL_01_04");
			}
			else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_02_00"))
			{
				Wld_InsertNpc(skeletonmage_sendsenyak_3,"OW_IDOL_02_00");
				Wld_InsertNpc(zombie1_sendsenyak,"OW_IDOL_02_01");
				Wld_InsertNpc(zombie2_sendsenyak,"OW_IDOL_02_02");
				Wld_InsertNpc(zombie3_sendsenyak,"OW_IDOL_02_03");
				Wld_InsertNpc(zombie4_sendsenyak,"OW_IDOL_02_04");
			}
			else
			{
				SENYAK_SENDPACK4 = FALSE;
			};
		};
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (BELIARSENDHELPSERVANT == TRUE) && (BELIARSERVANTHERE == FALSE) && (CurrentLevel != SHVALLEY_ZEN))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_IDOL_01_00"))
		{
			Wld_InsertNpc(dmt_1257_dementor,"NW_IDOL_01_00");
			Npc_ExchangeRoutine(dmt_1257_dementor,"NWIDOL01");
			BELIARSERVANTHERE = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_01_00"))
		{
			Wld_InsertNpc(dmt_1257_dementor,"ADW_IDOL_01_00");
			Npc_ExchangeRoutine(dmt_1257_dementor,"ADWIDOL01");
			BELIARSERVANTHERE = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_IDOL_02_00"))
		{
			Wld_InsertNpc(dmt_1257_dementor,"ADW_IDOL_02_00");
			Npc_ExchangeRoutine(dmt_1257_dementor,"ADWIDOL02");
			BELIARSERVANTHERE = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_01_00"))
		{
			Wld_InsertNpc(dmt_1257_dementor,"OW_IDOL_01_00");
			Npc_ExchangeRoutine(dmt_1257_dementor,"OWIDOL01");
			BELIARSERVANTHERE = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_IDOL_02_00"))
		{
			Wld_InsertNpc(dmt_1257_dementor,"OW_IDOL_02_00");
			Npc_ExchangeRoutine(dmt_1257_dementor,"OWIDOL02");
			BELIARSERVANTHERE = TRUE;
		};
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (RITUALCOMPLETE == FALSE) && (AZGOLORAPPEAR == TRUE))
	{
		Wld_InsertNpc(Skeleton,"FP_ROAM_MONSTER_228");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MONSTER_229");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MONSTER_230");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MONSTER_231");
		RITUALCOMPLETE = TRUE;
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (SOUL_PRAY_AFTER == TRUE) && (SOUL_PRAY_AFTER_END == FALSE))
	{
		SOUL_PRAY_AFTER_END = TRUE;
		AI_Standup(hero);

		if(GUARDIAN_RING == TRUE)
		{
			SAFEYOURING = TRUE;
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_FEAR_CAST");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			concatText = "Сила кольца Хранителей защитила вас от гнева Темного Бога!";
			AI_Print(concatText);
			AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
			Snd_Play("MYSTERY_05");
			AI_Wait(hero,2);
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		}
		else
		{
			BELIARCURSEYOU = TRUE;
			MIS_BELIARCURSE = LOG_Running;
			Log_CreateTopic(TOPIC_BELIARCURSE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BELIARCURSE,LOG_Running);
			B_LogEntry(TOPIC_BELIARCURSE,"Я оказался беззащитным перед могуществом Темного Бога и за свою дерзость был проклят им! Мне неизвестно, как это повлияет на мою судьбу в будущем, но уверен - что следует как можно скорее найти способ избавится от этого 'дара'.");
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			concatText = "Темный Бог проклял вас!";
			AI_Print(concatText);
			Snd_Play("MFX_FEAR_CAST");
			AI_PlayAni(hero,"T_STAND_2_WOUNDED");
			B_Say(hero,hero,"$DEAD");
			AI_Wait(hero,2);
			AI_PlayAni(hero,"T_WOUNDED_2_STAND");
		};
	};
	if(TrapPirUp == TRUE)
	{
		if(SBMODE == TRUE)
		{
			Wld_InsertNpc(Skeleton_Capitan,PlaceRespPirate);
			Wld_InsertNpc(Skeleton_Sailor,PlaceRespPirate);
			Wld_InsertNpc(Skeleton_Sailor,PlaceRespPirate);
		}
		else if(SBMODE == 2)
		{
			Wld_InsertNpc(Skeleton_Sailor,PlaceRespPirate);
			Wld_InsertNpc(Skeleton_Sailor,PlaceRespPirate);
		}
		else
		{
			Wld_InsertNpc(Skeleton_Sailor,PlaceRespPirate);
		};

		Snd_Play("AMBIENTSCREAM_1");
		TrapPirUp = FALSE;
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (EQUIPBLESSEDARMOR_M2 == TRUE) && (DOFISTPAL_M == FALSE))
	{
		Npc_RemoveInvItems(hero,itar_pal_m_v1,1);
		DOFISTPAL_M = TRUE;
	};
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (EQUIPBLESSEDARMOR_H2 == TRUE) && (DOFISTPAL_H == FALSE))
	{
		Npc_RemoveInvItems(hero,itar_pal_h_v1,1);
		DOFISTPAL_H = TRUE;
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1)
	{
		if(TalentCount_Alchemy[0] > 100)
		{
			TalentCount_Alchemy[0] = 100;
		};
		if(TalentCount_Alchemy[0] >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,4);
		}
		else if(TalentCount_Alchemy[0]>= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,3);
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_ALCHEMY,TalentCount_Alchemy[0]);		
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_RUNES) >= 1)
	{
		if(TalentCount_Rune[0] > 100)
		{
			TalentCount_Rune[0] = 100;
		};
		if(TalentCount_Rune[0] >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,4);
		}
		else if(TalentCount_Rune[0] >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,3);
		}
		else if(TalentCount_Rune[0] >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_RUNES,TalentCount_Rune[0]);		
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		if(TalentCount_Smith[0] > 100)
		{
			TalentCount_Smith[0] = 100;
		};
		if(TalentCount_Smith[0] >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,4);
		}
		else if(TalentCount_Smith[0] >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,3);
		}
		else if(TalentCount_Smith[0] >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	};

	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	
	if(TorchIsOn == FALSE)
	{
		Mdl_RemoveOverlayMds(hero,"HUMANS_NEWTORCH.MDS");
	};
};