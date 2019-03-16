func void ZS_Idle()
{
};

func int ZS_Idle_loop()
{
	return LOOP_CONTINUE;
};

func void ZS_Idle_end()
{
};

func void ZS_Stand_WP()
{
	b_staminainvent();

	if((self.guild == GIL_ORC) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCBF))
	{
		Perception_Set_Monster_Rtn();
		AI_SetWalkMode(self,NPC_WALK);
		B_MM_DeSynchronize();

		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		}
		else
		{
			AI_AlignToWP(self);
		};

		AI_ReadyMeleeWeapon(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	}
	else
	{
		Perception_Set_Normal();
		B_ResetAll(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_WP_loop()
{
	var int random;
	var int randomMove;

	B_CheckHealth(self);

	if((self.guild == GIL_ORC) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCBF))
	{
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
		{
			if(Wld_IsFPAvailable(self,"FP_STAND"))
			{
				AI_GotoFP(self,"FP_STAND");
			};
			if(Npc_IsOnFP(self,"FP_STAND"))
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			};
		}
		else if(Hlp_Random(1000) <= 5)
		{
			randomMove = Hlp_Random(3);
			if(randomMove == 0)
			{
				AI_PlayAni(self,"R_ROAM1");
			};
			if(randomMove == 1)
			{
				AI_PlayAni(self,"R_ROAM2");
			};
			if(randomMove == 2)
			{
				AI_PlayAni(self,"R_ROAM3");
			};
		};
	}
	else
	{
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
		{
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	
		if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR) && (self.guild != GIL_KDM) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS))
		{
			random = Hlp_Random(11);

			if(random == 0)
			{
				AI_PlayAni(self,"T_LGUARD_SCRATCH");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"CLEARTHROAT");
				};
			}
			else if(random == 1)
			{
				AI_PlayAni(self,"T_LGUARD_STRETCH");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"SNIFF");
				};
			}
			else if(random == 2)
			{
				AI_PlayAni(self,"T_LGUARD_CHANGELEG");
			}
			else if(random == 3)
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"YAWN");
				};
			}
			else if(random == 4)
			{
				AI_PlayAni(self,"T_PERCEPTION");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"COUGH");
				};
			}
			else if(random == 5)
			{
				AI_PlayAni(self,"T_BORINGKICK");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"SNIFF");
				};
			}
			else if(random == 6)
			{
				AI_PlayAni(self,"T_SEARCH");
			}
			else if(random == 7)
			{
				AI_PlayAni(self,"R_LEGSHAKE");
			}
			else if(random == 8)
			{
				AI_PlayAni(self,"R_SCRATCHLSHOULDER");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"SNIFF");
				};
			}
			else if(random == 9)
			{
				AI_PlayAni(self,"R_SCRATCHEGG");
			}
			else if(random == 10)
			{
				AI_PlayAni(self,"R_SCRATCHHEAD");

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"YAWN");
				};
			};

			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

func void ZS_Stand_Summon()
{
	Perception_Set_None();
	B_ResetAll(self);
	AI_AlignToWP(self);
	self.noFocus = TRUE;
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
};

func int ZS_Stand_Summon_loop()
{
	if((Npc_IsDead(Raven_Mummy_01) == TRUE) && (Npc_IsDead(Raven_Mummy_02) == TRUE) && (Npc_IsDead(Raven_Mummy_03) == TRUE) && (Npc_IsDead(Raven_Mummy_04) == TRUE) && (FightRaven_St_01 == FALSE))
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
		Wld_InsertNpc(Raven_SkelWar_01,"FP_ROAM_RAVENGUARD_01");
		Wld_InsertNpc(Raven_SkelWar_02,"FP_ROAM_RAVENGUARD_02");
		Wld_InsertNpc(Raven_SkelWar_03,"FP_ROAM_RAVENGUARD_03");
		Wld_InsertNpc(Raven_SkelWar_04,"FP_ROAM_RAVENGUARD_04");
		FightRaven_St_01 = TRUE;
	};

	if((Npc_IsDead(Raven_SkelWar_01) == TRUE) && (Npc_IsDead(Raven_SkelWar_02) == TRUE) && (Npc_IsDead(Raven_SkelWar_03) == TRUE) && (Npc_IsDead(Raven_SkelWar_04) == TRUE) && (FightRaven_St_01 == TRUE) && (FightRaven_St_02 == FALSE))
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
		Wld_InsertNpc(Raven_SkelMag_01,"FP_ROAM_RAVENGUARD_01");
		Wld_InsertNpc(Raven_SkelMag_02,"FP_ROAM_RAVENGUARD_02");
		Wld_InsertNpc(Raven_SkelMag_03,"FP_ROAM_RAVENGUARD_03");
		Wld_InsertNpc(Raven_SkelMag_04,"FP_ROAM_RAVENGUARD_04");
		FightRaven_St_02 = TRUE;
	};

	if((Npc_IsDead(Raven_SkelMag_01) == TRUE) && (Npc_IsDead(Raven_SkelMag_02) == TRUE) && (Npc_IsDead(Raven_SkelMag_03) == TRUE) && (Npc_IsDead(Raven_SkelMag_04) == TRUE) && (FightRaven_St_02 == TRUE) && (FightRaven_St_03 == FALSE))
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
		Wld_InsertNpc(Raven_Seeker_01,"FP_ROAM_RAVENGUARD_01");
		Wld_InsertNpc(Raven_Seeker_02,"FP_ROAM_RAVENGUARD_02");
		Wld_InsertNpc(Raven_Seeker_03,"FP_ROAM_RAVENGUARD_03");
		Wld_InsertNpc(Raven_Seeker_04,"FP_ROAM_RAVENGUARD_04");
		FightRaven_St_03 = TRUE;
	};
	if((Npc_IsDead(Raven_Seeker_01) == TRUE) && (Npc_IsDead(Raven_Seeker_02) == TRUE) && (Npc_IsDead(Raven_Seeker_03) == TRUE) && (Npc_IsDead(Raven_Seeker_04) == TRUE) && (FightRaven_St_03 == TRUE) && (FightRaven_St_04 == FALSE))
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
		FightRaven_St_04 = TRUE;
	};
	if((FightRaven_St_01 == TRUE) && (FightRaven_St_02 == TRUE) && (FightRaven_St_03 == TRUE) && (FightRaven_St_04 == TRUE))
	{
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Summon_end()
{
	AI_Wait(self,5);
	Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");

	if((FightRaven_St_01 == TRUE) && (FightRaven_St_02 == TRUE) && (FightRaven_St_03 == TRUE) && (FightRaven_St_04 == TRUE))
	{
		Perception_Set_Normal();
		self.noFocus = FALSE;
		self.flags = FALSE;
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_ExchangeRoutine(self,"Battle");
		B_Attack(self,hero,AR_SuddenEnemyInferno,1);
	};
};

func void ZS_Stand_WP_Fight()
{
	b_staminainvent();
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_WP_Fight_loop()
{
	var int random;
	var int randomMove;

	B_CheckHealth(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_FIGHT"))
		{
			AI_GotoFP(self,"FP_FIGHT");
		};
		if(Npc_IsOnFP(self,"FP_FIGHT"))
		{
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR) && (self.guild != GIL_KDM) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS))
	{
		random = Hlp_Random(11);

		if(random == 0)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_PERCEPTION");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_BORINGKICK");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_LEGSHAKE");
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");
		}
		else if(random == 9)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		}
		else if(random == 10)
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_Fight_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

func void ZS_Stand_WatchFight()
{
	b_staminainvent();
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_WatchFight_loop()
{
	var int random;
	var int randomMove;
	var int zufall;

	B_CheckHealth(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) == 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		zufall = Hlp_Random(3);

		if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			if(zufall == 0)
			{
				B_Say_Overlay(self,self,"$OOH01");
			};
			if(zufall == 1)
			{
				B_Say_Overlay(self,self,"$OOH02");
			};
			if(zufall == 2)
			{
				B_Say_Overlay(self,self,"$OOH03");
			};
		}
		else
		{
			if(zufall == 0)
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND01");
			};
			if(zufall == 1)
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND02");
			};
			if(zufall == 2)
			{
				B_Say_Overlay(self,self,"$CHEERFRIEND03");
			};
		};
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR) && (self.guild != GIL_KDM) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS))
	{
		random = Hlp_Random(11);

		if(random == 0)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"CLEARTHROAT");
			};
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_PERCEPTION");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_BORINGKICK");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_LEGSHAKE");
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 9)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		}
		else if(random == 10)
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_WatchFight_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};