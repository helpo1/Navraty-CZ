var int DemonBlitz;
var int TempCircleMage;
var int ManaCostStaff;

func void B_BeliarsWeaponSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	var int randypfx;
	var int TrueShotDamage;
	var int TributeDaggerZX;
	var int TempIntDamage;
	var int activeSpell;
	var string concatText;
	var int TempDamage;
	var int BasicTrueShotIndex;
	var int TempTrueDistance;
	var int TempDistance;
	var int BasicTrueShotDamage;
	var int TempTrueShotDamage;
	var int TempCrossShotDamage;
	var int TempPoisonDamage;
	var int curproc;
	var int curres;
	var int curres2;
	var int randwait;
	var int FlagCurRes;
	var int TorchRand;
	var C_Item otherweap;

	otherweap = Npc_GetReadiedWeapon(oth);

	if(Npc_IsPlayer(oth) && (Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_2200_DarkSpeaker)))
	{
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
	};
	if(Npc_IsPlayer(oth) && (slf.flags != NPC_FLAG_IMMORTAL) && (slf.flags != NPC_FLAG_XARADRIM) && (slf.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(XranFreg)))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ELIGOR_DEMON))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ELIGOR_DEMON_OW))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_100_Xardas))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4570_Avabul))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(none_103_dragon_gold))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_AV))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_102_Kreol)) && ((MIS_INNOSWILL == FALSE) || (CanKillKreol == FALSE)))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == FALSE) && (URNAZULFUCKOFF == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_126_Haniar)) && (PlayerIsPrioratFake == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(xbs_7507_netbek))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);

			if(Npc_IsInFightMode(oth,FMODE_FAR) == TRUE)
			{
				AI_RemoveWeapon(oth);
			};

			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_IsItem(otherweap,ITMW_1H_BLACKSWORD) == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
		};

		B_RuneProcCheck(slf,oth);

		if((Trophy_UrTrallHeadIsUp == TRUE) && (slf.guild == GIL_ORC) && (slf.flags != NPC_FLAG_GHOST))
		{
			TempDamage = 50;

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((slf.vars[3] == FALSE) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (slf.protection[PROT_EDGE] != IMMUNE) && ((Hlp_IsItem(otherweap,ItMw_Speer_GoblinDemon) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_Silver) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_01) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_02) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_03) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_04) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_05) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_06) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_07) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_08) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_GoldBrand) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Avabul_Dagger) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Hero) == TRUE) || (Hlp_IsItem(otherweap,ITMW_2H_URIZEL) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_01) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_02) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_03) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_04) == TRUE) || (Hlp_IsItem(otherweap,ItMw_SwordSpear) == TRUE) || (Hlp_IsItem(otherweap,ItMw_HeavySwordSpear) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ButcherSpeer) == TRUE) || (Hlp_IsItem(otherweap,ItMw_DemonSpear) == TRUE)))
		{
			if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_01) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 5) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_02) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 10) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_03) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 15) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_04) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 20) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_05) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 25) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_06) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 30) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_07) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 35) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ChiefRapier_08) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 40) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Hero) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 30) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_1H_GoldBrand) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 45) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Avabul_Dagger) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 50) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ITMW_2H_URIZEL) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 25) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_SwordSpear) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 5) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_Silver) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 15) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_01) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 5) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_02) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 10) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_HeavySwordSpear) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 15) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_03) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 20) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_GoblinDemon) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 25) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_ButcherSpeer) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 30) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_04) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 35) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_DemonSpear) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 40) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_Blood) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 45) / 100);
				};
			}
			else if(Hlp_IsItem(otherweap,ItMw_Speer_05) == TRUE)
			{
				if(slf.vars[3] == FALSE)
				{
					slf.vars[3] = slf.protection[PROT_EDGE];
					slf.protection[PROT_EDGE] = slf.protection[PROT_EDGE] - ((slf.protection[PROT_EDGE] * 50) / 100);
				};
			};
		}
		else if((slf.vars[3] != FALSE) && (Hlp_IsItem(otherweap,ItMw_Speer) != TRUE) && (Hlp_IsItem(otherweap,ItMw_Speer_01) != TRUE) && (Hlp_IsItem(otherweap,ItMw_Speer_02) != TRUE) && (Hlp_IsItem(otherweap,ItMw_Speer_03) != TRUE) && (Hlp_IsItem(otherweap,ItMw_Speer_04) != TRUE) && (Hlp_IsItem(otherweap,ItMw_SwordSpear) != TRUE) && (Hlp_IsItem(otherweap,ItMw_HeavySwordSpear) != TRUE) && (Hlp_IsItem(otherweap,ItMw_ButcherSpeer) != TRUE) && (Hlp_IsItem(otherweap,ItMw_DemonSpear) != TRUE))
		{
			slf.protection[PROT_EDGE] = slf.vars[3];
			slf.vars[3] = FALSE;
		};
		if((C_NpcIsUndead(slf) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((Hlp_IsItem(otherweap,ItMw_1H_Blessed_02) == TRUE) || (Hlp_IsItem(otherweap,ItMw_2H_Blessed_02) == TRUE)))
		{
			TempDamage = Hlp_Random(150);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(TempDamage >= 125)
					{
						Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((C_NpcIsUndead(slf) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((Hlp_IsItem(otherweap,ItMw_1H_Blessed_03) == TRUE) || (Hlp_IsItem(otherweap,ItMw_2H_Blessed_03) == TRUE)))
		{
			TempDamage = Hlp_Random(300);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(TempDamage >= 275)
					{
						Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((AcidIsOn == TRUE) && (C_NpcIsUndead(slf) == FALSE) && (slf.flags != NPC_FLAG_IMMORTAL) && (slf.flags != NPC_FLAG_GHOST) && (slf.flags != NPC_FLAG_XARADRIM) && (slf.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(XranFreg)))
		{
			if(slf.attribute[ATR_HITPOINTS] > 200)
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
				B_MagicHurtNpc(oth,slf,200);
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,200);
			};
		};
		if((Npc_IsPlayer(oth) == TRUE) && (SleeperMaskIsOn == TRUE) && (Npc_IsDead(slf) == FALSE) && (SleeperMaskIntBonus == FALSE))
		{
			randwait = Hlp_Random(100);

			if((randwait <= 10) && (SleeperMaskIntBonus == FALSE))
			{
				ATR_INTELLECT += 100;
				Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				SleeperMaskIntBonus = TRUE;
			};
		};
		if((OrcBanish == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (Hlp_IsItem(otherweap,ITMW_1H_SWORD_ORCSLAYER_01) == TRUE) && (slf.guild == GIL_ORC) && (slf.flags != NPC_FLAG_GHOST))
		{
			TempDamage = Hlp_Random(100);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_1H_WOLF) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_GHOST)
			{
				TempDamage = 50 + Hlp_Random(150);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,itmw_normardsword) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_GHOST)
			{
				TempDamage = 50 + Hlp_Random(200);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_2H_WOLF) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_GHOST)
			{
				TempDamage = 100 + Hlp_Random(250);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ItMw_Speer_Silver) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_GHOST)
			{
				TempDamage = 150 + Hlp_Random(300);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_1H_SIGIL) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if((slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.aivar[AIV_MM_REAL_ID] == ID_SANDGOLEM))
			{
				TempDamage = 100 + Hlp_Random(400);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_2H_SIGIL) == TRUE) && (slf.guild != GIL_DRAGON))
		{
			if((slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.aivar[AIV_MM_REAL_ID] == ID_SANDGOLEM))
			{
				TempDamage = 200 + Hlp_Random(500);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ItMw_Staff_Blood) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempDamage) * 5;
			TempDamage = 150 + Hlp_Random(TempDamage * (ATR_INTELLECT / 2));

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_2H_KMR_DAEMONSTAFF_01) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempDamage) * 5;
			TempDamage = 300 + Hlp_Random(TempDamage * (ATR_INTELLECT / 2));

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITMW_2H_DRAGONSTAFF_01) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempDamage) * 5;
			TempDamage = 100 + Hlp_Random(TempDamage * (ATR_INTELLECT / 2));

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ItMW_Addon_Stab01) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempCircleMage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempCircleMage) * 5;

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if((slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((slf.guild == GIL_DEMON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (C_NpcIsUndead(slf) == TRUE)))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == TRUE))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((slf.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ItMW_Addon_Stab02) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempCircleMage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempCircleMage) * 5;

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if((slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((slf.guild == GIL_DEMON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (C_NpcIsUndead(slf) == TRUE)))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						randypfx = Hlp_Random(2);

						if(Hlp_Random(100) >= 50)
						{
							if(randypfx == TRUE)
							{
								Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
							}
							else
							{
								Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
							};
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					randypfx = Hlp_Random(2);

					if(randypfx == TRUE)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						randypfx = Hlp_Random(2);

						if(Hlp_Random(100) >= 50)
						{
							if(randypfx == TRUE)
							{
								Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
							}
							else
							{
								Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
							};
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					randypfx = Hlp_Random(2);

					if(randypfx == TRUE)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == TRUE))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						randypfx = Hlp_Random(2);

						if(Hlp_Random(100) >= 50)
						{
							if(randypfx == TRUE)
							{
								Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
							}
							else
							{
								Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
							};
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					randypfx = Hlp_Random(2);

					if(randypfx == TRUE)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						randypfx = Hlp_Random(2);

						if(Hlp_Random(100) >= 50)
						{
							if(randypfx == TRUE)
							{
								Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
							}
							else
							{
								Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
							};
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					randypfx = Hlp_Random(2);

					if(randypfx == TRUE)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((slf.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						randypfx = Hlp_Random(2);

						if(Hlp_Random(100) >= 50)
						{
							if(randypfx == TRUE)
							{
								Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
							}
							else
							{
								Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
							};
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					randypfx = Hlp_Random(2);

					if(randypfx == TRUE)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ItMW_Addon_Stab03) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempCircleMage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempCircleMage) * 5;

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if((slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((slf.guild == GIL_DEMON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (C_NpcIsUndead(slf) == TRUE)))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == TRUE))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((slf.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ItMW_Addon_Stab04) == TRUE) && (MageRobeIsUp == TRUE) && (hero.attribute[ATR_MANA] > 0))
		{
			TempCircleMage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
			ManaCostStaff = (7 - TempCircleMage) * 5;

			if(hero.attribute[ATR_MANA] >= ManaCostStaff)
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - ManaCostStaff;
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			}; 
			if((slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((slf.guild == GIL_DEMON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (C_NpcIsUndead(slf) == TRUE)))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == TRUE))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((slf.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
			{
				TempDamage = Npc_GetTalentSkill(hero,NPC_TALENT_MAGE);
				TempDamage = Hlp_Random(TempDamage * (ATR_INTELLECT / 3));
	
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ITRW_BOW_BONES) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			if((slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((slf.guild == GIL_DEMON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (C_NpcIsUndead(slf) == TRUE)))
			{
				TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) && (MIS_BELIARWILL == TRUE))
			{
				TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORKELITE_GENERAL_NW))
			{
				TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else if((slf.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR) || (slf.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
			{
				TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						};

						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,ITRW_HOLYBOW) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
		     if(C_NpcIsUndead(slf) == TRUE)
			{
				TempDamage = hero.attribute[ATR_DEXTERITY];
			}
			else
			{
				TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);
			};
			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 75)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITRW_G4_OAK_BOW_01) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ItRw_Bow_Blood) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY]);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("spellFX_Lacerate_FOUNTAIN",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("spellFX_Lacerate_FOUNTAIN",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITRW_G3_DEMON_BOW_01) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = Hlp_Random(hero.attribute[ATR_DEXTERITY] * 2);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ITRW_HAOS_BOW_01) == TRUE) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = hero.attribute[ATR_DEXTERITY] * 2;

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,itmw_beliarsuperweapon_1h) == TRUE) && (slf.guild != GIL_DEMON))
		{
			TempDamage = Hlp_Random(100);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,itmw_beliarsuperweapon_2h) == TRUE) && (slf.guild != GIL_DEMON))
		{
			TempDamage = Hlp_Random(200);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ItMw_2H_IceHammer) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (slf.aivar[90] == FALSE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)) && (slf.guild != GIL_TROLL))
		{
			TempDamage = Hlp_Random(100);

			if(Hlp_Random(1000) <= 50)
			{
				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						if(slf.aivar[90] == FALSE)
						{
							Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",slf,slf,0,0,0,FALSE);
							B_MagicHurtNpc(oth,slf,TempDamage);

							if((Npc_IsInState(slf,ZS_MagicFreeze) == FALSE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)) && (slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_TROLL))
							{
								AI_StartState(slf,ZS_MagicFreeze,0,"");
							};
						}
						else
						{
							Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
							B_MagicHurtNpc(oth,slf,TempDamage);
						};
					};
				}
				else
				{
					Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((Hlp_IsItem(otherweap,itmw_fearund) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (C_NpcIsUndead(slf) == TRUE) && (slf.flags != NPC_FLAG_GHOST) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR))
		{
			TempDamage = Hlp_Random(150);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((Hlp_IsItem(otherweap,ItMw_1H_GinnokSword) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (slf.flags != NPC_FLAG_GHOST) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && ((C_NpcIsUndead(slf) == TRUE) || (slf.guild == GIL_DMT) || (slf.guild == GIL_DEMON)))
		{
			TempDamage = 200 + Hlp_Random(200);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((TrueShot == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (slf.protection[PROT_POINT] >= 1000) && (Npc_GetDistToNpc(oth,slf) <= 3000) && (oth.HitChance[NPC_TALENT_BOW] >= Hlp_Random(100)))
		{
			if((Hlp_IsItem(otherweap,ItRw_Bow_Blood) == TRUE) || (Hlp_IsItem(otherweap,ITRW_HAOS_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_SHADOWBOW) == TRUE) || (Hlp_IsItem(otherweap,ITRW_HOLYBOW) == TRUE) || (Hlp_IsItem(otherweap,ITRW_BOW_DOUBLE_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_G3_LONG_BOW_02) == TRUE) || (Hlp_IsItem(otherweap,ITRW_G3_SILENTDEATH_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_KMR_DARKLONG_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_KMR_KADAT_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_KMR_SHADOWS_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_BOW_BONES) == TRUE) || (Hlp_IsItem(otherweap,ITRW_G4_OAK_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_G3_DEMON_BOW_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_WHITEBOW) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Sld_Bow) == TRUE) || (Hlp_IsItem(otherweap,ITRW_DIEGO_BOW) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Arabic_Bow) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_L_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_L_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_L_03) == TRUE) || (Hlp_IsItem(otherweap,ITRW_BOSPBOW_L_03) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_L_04) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_M_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_M_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_M_03) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_M_04) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_H_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_H_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_H_03) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Bow_H_04) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BowCraft_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BowCraft_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BowCraft_03) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BowCraft_04) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BowCraft_05) == TRUE))
			{
				BasicTrueShotDamage = oth.attribute[ATR_DEXTERITY];
				TempDistance = Npc_GetDistToNpc(oth,slf);
				
				if(TempDistance > 1500)
				{
					TempTrueDistance = TempDistance - 1500;

					if(TempTrueDistance < 100)
					{
						BasicTrueShotIndex = 1;
					}
					else
					{
						BasicTrueShotIndex = TempTrueDistance / 100;
					};

					TempTrueShotDamage = BasicTrueShotIndex * 20;

					if(BasicTrueShotDamage > TempTrueShotDamage)
					{
						TrueShotDamage = BasicTrueShotDamage - TempTrueShotDamage;
					}
					else
					{
						TrueShotDamage = 1;
					};
					if(slf.attribute[ATR_HITPOINTS] > TrueShotDamage)
					{
						B_MagicHurtNpc(oth,slf,TrueShotDamage);
					}
					else
					{
						slf.flags = FALSE;
						B_MagicHurtNpc(oth,slf,TrueShotDamage);
					};
				}
				else if(TempDistance <= 1000)
				{
					TempTrueDistance = 1000 - TempDistance;

					if(TempTrueDistance < 100)
					{
						BasicTrueShotIndex = 1;
					}
					else
					{
						BasicTrueShotIndex = TempTrueDistance / 100;
					};

					TempTrueShotDamage = BasicTrueShotIndex * 20;
					TrueShotDamage = BasicTrueShotDamage + TempTrueShotDamage;

					if(slf.attribute[ATR_HITPOINTS] > TrueShotDamage)
					{
						B_MagicHurtNpc(oth,slf,TrueShotDamage);
					}
					else
					{
						slf.flags = FALSE;
						B_MagicHurtNpc(oth,slf,TrueShotDamage);
					};
				};
			};
		};
		if((slf.protection[PROT_POINT] >= 1000) && (slf.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			if((Hlp_IsItem(otherweap,ItRw_Mil_Crossbow) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_Light) == TRUE) || (Hlp_IsItem(otherweap,ItRw_BDT_Crossbow) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_L_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_L_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_M_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_M_02) == TRUE) || (Hlp_IsItem(otherweap,ItRw_PAL_Crossbow_NPC) == TRUE) || (Hlp_IsItem(otherweap,ItRw_PAL_Crossbow) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_H_01) == TRUE) || (Hlp_IsItem(otherweap,ItRw_Crossbow_H_02) == TRUE) || (Hlp_IsItem(otherweap,ITRW_CROSSBOW_ORC) == TRUE) || (Hlp_IsItem(otherweap,ITRW_CROSSBOW_ORC_LIGHT) == TRUE) || (Hlp_IsItem(otherweap,ITRW_GREATARBALET_ORC_01) == TRUE) || (Hlp_IsItem(otherweap,ITRW_GREATARBALET_ORC_02) == TRUE) || (Hlp_IsItem(otherweap,ITRW_GREATARBALET_ORC_03) == TRUE) || (Hlp_IsItem(otherweap,ITRW_GREATARBALET_ORC_04) == TRUE) || (Hlp_IsItem(otherweap,ITRW_GREATARBALET_ORC_05) == TRUE))
			{
				if(oth.HitChance[NPC_TALENT_CROSSBOW] > Hlp_Random(50))
				{
					TempCrossShotDamage = otherweap.damage[DAM_INDEX_POINT] + (otherweap.damage[DAM_INDEX_POINT] * (oth.HitChance[NPC_TALENT_CROSSBOW] / 100));
				}
				else
				{
					TempCrossShotDamage = otherweap.damage[DAM_INDEX_POINT];
				};
				if(slf.attribute[ATR_HITPOINTS] > TempCrossShotDamage)
				{
					B_MagicHurtNpc(oth,slf,TempCrossShotDamage);
				}
				else
				{
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempCrossShotDamage);
				};
			};
		};
		if((otherweap.munition == ITRW_MYHUNTARROW) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = 100 + Hlp_Random(400);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};		
		};
		if((otherweap.munition == ItRw_Addon_FireArrow) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = 50 + Hlp_Random(250);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((TorchIsOn == TRUE) && (self.guild != GIL_DRAGON) && (self.guild != GIL_DEMON) && (self.guild != GIL_FIREGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN))
		{
			TorchRand = Hlp_Random(100);

			if(TorchRand <= 25)
			{
				TempDamage = Hlp_Random(50);

				if(slf.attribute[ATR_HITPOINTS] > TempDamage)
				{
					if(TempDamage > 0)
					{
						Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				}
				else
				{
					Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			};
		};
		if((otherweap.munition == ItRw_Addon_MagicBolt) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = Hlp_Random(200);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(slf.aivar[90] == FALSE)
					{
						Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,TempDamage);

						if((Npc_IsInState(slf,ZS_MagicFreeze) == FALSE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)) && (slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_TROLL))
						{
							AI_StartState(slf,ZS_MagicFreeze,0,"");
						};
					}
					else
					{
						Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((otherweap.munition == ItRw_Addon_MagicArrow) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = 100 + Hlp_Random(200);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(slf.aivar[90] == FALSE)
					{
						Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,TempDamage);

						if((Npc_IsInState(slf,ZS_MagicFreeze) == FALSE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)) && (slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_TROLL))
						{
							AI_StartState(slf,ZS_MagicFreeze,0,"");
						};
					}
					else
					{
						Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
						B_MagicHurtNpc(oth,slf,TempDamage);
					};
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((otherweap.munition == ItRw_HolyArrow) && (C_NpcIsUndead(slf) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = 150 + Hlp_Random(150);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((otherweap.munition == ItRw_HolyBolt) && (C_NpcIsUndead(slf) == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (slf.aivar[AIV_MM_REAL_ID] != ID_ORCWARRIOR) && (Npc_GetDistToNpc(oth,slf) <= 3000))
		{
			TempDamage = Hlp_Random(200);

			if(slf.attribute[ATR_HITPOINTS] > TempDamage)
			{
				if(TempDamage > 0)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
					};

					B_MagicHurtNpc(oth,slf,TempDamage);
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempDamage);
			};
		};
		if((otherweap.munition == ItRw_PoisonArrow) && (slf.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM) && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (Npc_GetDistToNpc(oth,slf) <= 3000) && (Hlp_Random(100) <= oth.HitChance[NPC_TALENT_BOW]) && (C_NpcIsUndead(slf) != TRUE) && (slf.guild != GIL_DMT) && (slf.guild != GIL_KDM) && (slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_BLOODFLY) && (slf.guild != GIL_TROLL))
		{
			if(Trophy_MuritanToothIsUp == TRUE)
			{
				TempPoisonDamage = 250;
			}
			else
			{
				TempPoisonDamage = 100;
			};
			if(slf.guild <= GIL_SEPERATOR_HUM)
			{
				B_Say(slf,other,"$Aargh_1");
			};
			if(slf.attribute[ATR_HITPOINTS] > TempPoisonDamage)
			{
				B_MagicHurtNpc(oth,slf,TempPoisonDamage);
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
				slf.flags = FALSE;
				B_MagicHurtNpc(oth,slf,TempPoisonDamage);
			};
			if(slf.aivar[AIV_InflateStateTime] == FALSE)
			{
				AI_Print("Cíl otráven!");
				slf.aivar[AIV_InflateStateTime] = TRUE;

				if(slf.attribute[ATR_STRENGTH] > 10)
				{
					slf.attribute[ATR_STRENGTH] = slf.attribute[ATR_STRENGTH] - (slf.attribute[ATR_STRENGTH] / 10);
				};
			};
		};
		if((otherweap.weight == TRUE) && (slf.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM)  && (slf.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (otherweap.damage[DAM_INDEX_MAGIC] == TRUE) && (C_NpcIsUndead(slf) != TRUE) && (slf.guild != GIL_DMT) && (slf.guild != GIL_KDM) && (slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_BLOODFLY) && (slf.guild != GIL_TROLL))
		{
			if((Hlp_IsItem(otherweap,ItMw_OldSpage) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Rapier) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Meisterdegen) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Addon_BanditTrader) == TRUE) || (Hlp_IsItem(otherweap,itmw_scorpionspec) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_01) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_02) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_03) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_04) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_05) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_06) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_07) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ChiefRapier_08) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Known) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Right) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Npc_Right) == TRUE) || (Hlp_IsItem(otherweap,ItMw_1H_AssBlade_Hero) == TRUE))
			{
				if(Hlp_Random(100) <= oth.HitChance[NPC_TALENT_1H])
				{
					if(Trophy_MuritanToothIsUp == TRUE)
					{
						TempPoisonDamage = 150;
					}
					else
					{
						TempPoisonDamage = 50;
					};
					if(slf.attribute[ATR_HITPOINTS] > TempPoisonDamage )
					{
						B_Say(slf,other,"$Aargh_3");
						B_MagicHurtNpc(oth,slf,TempPoisonDamage );
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
						slf.flags = FALSE;
						B_MagicHurtNpc(oth,slf,TempPoisonDamage);
					};
					if(slf.aivar[AIV_InflateStateTime] == FALSE)
					{
						AI_Print("Cíl otráven!");
						slf.aivar[AIV_InflateStateTime] = TRUE;

						if(slf.attribute[ATR_STRENGTH] > 10)
						{
							slf.attribute[ATR_STRENGTH] = slf.attribute[ATR_STRENGTH] - (slf.attribute[ATR_STRENGTH] / 10);
						};
					};
				};
			}
			else if((Hlp_IsItem(otherweap,HEERSCHERSTAB) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_01) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_02) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_03) == TRUE) || (Hlp_IsItem(otherweap,ItMw_Speer_04) == TRUE) || (Hlp_IsItem(otherweap,ItMw_SwordSpear) == TRUE) || (Hlp_IsItem(otherweap,ItMw_HeavySwordSpear) == TRUE) || (Hlp_IsItem(otherweap,ItMw_ButcherSpeer) == TRUE) || (Hlp_IsItem(otherweap,ItMw_DemonSpear) == TRUE))
			{
				if(Hlp_Random(100) <= oth.HitChance[NPC_TALENT_2H])
				{
					if(Trophy_MuritanToothIsUp == TRUE)
					{
						TempPoisonDamage = 150;
					}
					else
					{
						TempPoisonDamage = 50;
					};
					if(slf.attribute[ATR_HITPOINTS] > TempPoisonDamage )
					{
						B_Say(slf,other,"$Aargh_3");
						B_MagicHurtNpc(oth,slf,TempPoisonDamage );
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
						slf.flags = FALSE;
						B_MagicHurtNpc(oth,slf,TempPoisonDamage);
					};
					if(slf.aivar[AIV_InflateStateTime] == FALSE)
					{
						AI_Print("Cíl otráven!");
						slf.aivar[AIV_InflateStateTime] = TRUE;

						if(slf.attribute[ATR_STRENGTH] > 10)
						{
							slf.attribute[ATR_STRENGTH] = slf.attribute[ATR_STRENGTH] - (slf.attribute[ATR_STRENGTH] / 10);
						};
					};
				};
			}
			else
			{
				if(Hlp_Random(100) <= 10)
				{
					if(Trophy_MuritanToothIsUp == TRUE)
					{
						TempPoisonDamage = 150;
					}
					else
					{
						TempPoisonDamage = 50;
					};
					if(slf.attribute[ATR_HITPOINTS] > TempPoisonDamage)
					{
						B_Say(slf,other,"$Aargh_3");
						B_MagicHurtNpc(oth,slf,TempPoisonDamage);
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
					}
					else
					{
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",slf,slf,0,0,0,FALSE);
						slf.flags = FALSE;
						B_MagicHurtNpc(oth,slf,TempPoisonDamage);
					};
					if(slf.aivar[AIV_InflateStateTime] == FALSE)
					{
						AI_Print("Cíl otráven!");
						slf.aivar[AIV_InflateStateTime] = TRUE;

						if(slf.attribute[ATR_STRENGTH] > 10)
						{
							slf.attribute[ATR_STRENGTH] = slf.attribute[ATR_STRENGTH] - (slf.attribute[ATR_STRENGTH] / 10);
						};
					};
				};
			};
		};
	};
	if(Npc_IsPlayer(oth))
	{
		otherweap = Npc_GetReadiedWeapon(oth);

		if((Hlp_IsItem(otherweap,ItMw_1h_TributeDagger) == TRUE) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_8568_NagDumgar)))
		{
			TributeDaggerZX = Hlp_Random(200) + 100;

			if(slf.attribute[ATR_HITPOINTS] > TributeDaggerZX)
			{
				if(Hlp_Random(100) >= 50)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				};

				B_MagicHurtNpc_Immortal(oth,slf,TributeDaggerZX);
			}
			else
			{
				if(slf.aivar[93] == FALSE)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					slf.flags = FALSE;
					B_MagicHurtNpc(oth,slf,TributeDaggerZX);
				};
			};
		};
	};
};

func void B_WeaponSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	var int ShadowPriestDamage;
	var int TempResistInt;
	var int TempResistShield;
	var int HeroResistAll;
	var int BackFinalDamage;
	var int DemonRandy;

	var C_Item selfweap;
	var C_Item otherweap;

	if((SkillBlockShield == TRUE) && (AIV_GiveShieldRes == TRUE))
	{
		if(hero.attribute[ATR_REGENERATEMANA] >= 10)
		{
			TempResistShield = hero.attribute[ATR_REGENERATEMANA] / 10;
		}
		else
		{
			TempResistShield = 1;
		};
	}
	else
	{
		TempResistShield = 0;
	};
	if(ATR_INTELLECT >= 10)
	{
		TempResistInt = ATR_INTELLECT / 10;
	}
	else
	{
		TempResistInt = 1;
	};

	HeroResistAll = (TempResistInt * HeroMageCirlce) + (TempResistShield * CurShieldRes) + hero.level + hero.protection[PROT_MAGIC];

	if(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		selfweap = Npc_GetReadiedWeapon(slf);

		if(Npc_IsPlayer(oth) && ((Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST) == TRUE) || (Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST_ELITE) == TRUE) || (Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST_OBER) == TRUE)))
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NECROMACERZOMBIE))
	{
		ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
		if(ShadowPriestDamage > HeroResistAll)
		{
			BackFinalDamage = ShadowPriestDamage - HeroResistAll;

			if(Hlp_Random(100) >= oth.level)
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				B_MagicHurtMe(oth,BackFinalDamage);
			};
		};
		if(Hlp_Random(100) >= 95)
		{
			PlayerIsSick = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Imarah))
	{
		ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
		if(ShadowPriestDamage > HeroResistAll)
		{
			BackFinalDamage = ShadowPriestDamage - HeroResistAll;

			if(Hlp_Random(100) >= oth.level)
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				B_MagicHurtMe(oth,BackFinalDamage);
			};
		};
		if(Hlp_Random(100) >= 95)
		{
			PlayerIsSick = TRUE;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_2090_Addon_Raven))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(HaosDemon_Orcmine)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(HaosDemon_Psicamp)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(WATERRITUALDEMON)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_12971_STONNOS))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};	
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SLEEPER_OLD))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			if(SleeperStone == FALSE)
			{
				BackFinalDamage = 2500;
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
				B_MagicHurtMe(oth,BackFinalDamage);
			}
			else
			{
				ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
				if(ShadowPriestDamage > HeroResistAll)
				{
					BackFinalDamage = ShadowPriestDamage - HeroResistAll;

					if(Hlp_Random(100) >= oth.level)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
						B_MagicHurtMe(oth,BackFinalDamage);
					};
				};
			};
		};
	}
	else if((slf.guild == GIL_DEMON) && (slf.aivar[90] == TRUE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Troll_Black_AV)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Troll_Black_AV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Demon_Lord_Milten)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		if((Npc_IsPlayer(oth) == TRUE) && (Npc_GetDistToNpc(slf,oth) <= 650))
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("VOB_MAGICBURN",oth,oth,0,0,0,FALSE);
					};

					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		if((Npc_IsPlayer(oth) == TRUE) && (Npc_GetDistToNpc(slf,oth) <= 650))
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",oth,oth,0,0,0,FALSE);
					};

					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else if((slf.guild == GIL_DMT) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(VLK_5570_Avabul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_129_DeadNrozas)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_130_CorGalomDemon)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
		};
	}
	else	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ilarah)) && (IlArahActTwo == TRUE) && (IlArahActThree == FALSE))
	{
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100000);
		IlArahActThree = TRUE;
	}
	else	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AraharPlague))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",slf,slf,0,0,0,FALSE);
					B_MagicHurtMe(oth,BackFinalDamage);
				};
			};
			if(Hlp_Random(100) >= 50)
			{
				PlayerIsSick = TRUE;
			};
		};
	};
	if(Npc_IsPlayer(oth) && (slf.guild == GIL_DEMON))
	{
		otherweap = Npc_GetReadiedWeapon(oth);

		if(Hlp_IsItem(otherweap,ItMw_BeliarWeapon_Raven) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_01) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_02) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_03) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_04) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_05) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_06) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_07) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_08) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_09) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_10) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_11) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_12) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_13) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_14) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_15) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_16) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_17) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_18) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_19) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_1H_20) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_01) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_02) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_03) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_04) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_05) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_06) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_07) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_08) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_09) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_10) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_11) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_12) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_13) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_14) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_15) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_16) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_17) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_18) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_19) || Hlp_IsItem(otherweap,ItMw_BeliarWeapon_2H_20))
		{
			if(DemonBlitz <= 0)
			{
				ShadowPriestDamage = 50 + Hlp_Random(slf.level);
				Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
				B_MagicHurtMe(oth,BackFinalDamage);
				DemonBlitz += 1;
			}
			else if(DemonBlitz >= 3)
			{
				DemonRandy = Hlp_Random(100);

				if(DemonRandy <= 50)
				{
					DemonBlitz = 0;
				};
			}
			else
			{
				DemonBlitz += 1;
			};
		};
	};
};