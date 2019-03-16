
func void ZS_MM_Rtn_DragonRest()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);

	if(self.guild == GIL_ORC)
	{
		AI_RemoveWeapon(self);
	};

	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if((KvarhPeace == TRUE) && (self.guild == GIL_SKELETON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (CurrentLevel == ADANOSVALLEY_ZEN))
	{
		B_KillNpc(self);
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else if(Wld_IsFPAvailable(self,"FP_STAND"))
	{
		AI_GotoFP(self,"FP_STAND");
	}
	else
	{
		AI_AlignToWP(self);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(YelaMinion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ItarMinion)))
	{
		AI_GotoFP(self,"FP_ROAM");
	};

	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Rtn_DragonRest_Loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)) && (StoneTitanAwake == FALSE))
	{
		Npc_SetRefuseTalk(hero,2);
	};
	if(!Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],0) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.guild == GIL_DRAGON)
	{
		self.aivar[AIV_TAPOSITION] += 1;
		if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (self.aivar[AIV_TAPOSITION] >= 2))
		{
			self.attribute[ATR_HITPOINTS] += 5;
			self.aivar[AIV_TAPOSITION] = 0;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(YelaMinion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ItarMinion)))
	{
		return LOOP_CONTINUE;
	};
	if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		AI_Standup(self);
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
		if(self.guild == GIL_DRAGON)
		{
			if(Hlp_Random(1000) <= 10)
			{
				AI_PlayAni(self,"T_WARN");
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			};
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_End()
{
	b_staminainvent();
	AI_PlayAni(self,"T_REST_2_STAND");
};

func void ZS_MM_Rtn_DragonRest_Sit()
{
	Npc_SetPercTime(self,1);
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	B_ResetAll(self);

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Rtn_DragonRest_Sit_Loop()
{
	b_staminainvent_monster(self);

	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"THRONE"))
	{
		AI_UseMob(self,"THRONE",1);
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_Sit_End()
{
	AI_UseMob(self,"THRONE",-1);
};

func void ZS_MM_Rtn_DragonRest_Train()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Rtn_DragonRest_Train_Loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if((ArenaBattle_03 == FALSE) && (CurrentLevel == ORCCITY_ZEN))
	{
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_1HSFREE");
		AI_GotoWP(self,self.wp);
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_Train_End()
{
	b_staminainvent();
	AI_RemoveWeapon(self);
};

var int DabarShakOut;

func void ZS_MM_Rtn_DragonRest_Shak()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
	B_TurnToNpc(self,STRF_8127_Addon_Hildur);
};

func int ZS_MM_Rtn_DragonRest_Shak_Loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if((DabarShakIsSleep == FALSE) || (DabarShakIsAwake == TRUE))
	{
		if(DabarShakOut == TRUE)
		{
			AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
			DabarShakOut = FALSE;
		};

		if(Hlp_Random(1000) <= 5)
		{
			randomMove = Hlp_Random(4);
			AI_Standup(self);
			
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
			if(randomMove == 3)
			{
				AI_PlayAni(self,"T_BORINGKICK");
			};
		};
	}
	else
	{
		if(DabarShakOut == FALSE)
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			DabarShakOut = TRUE;	
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_Shak_End()
{
	b_staminainvent();

	if(DabarShakOut == TRUE)
	{
		AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
		DabarShakOut = FALSE;
	};
};

var int OrcGuardSit;

func void ZS_MM_Rtn_DragonRest_OrcSit()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);

	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Orc_8208_MineGuard))
	{
		AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8208_MineGuard))
	{
		NutsRest = FALSE;
		OrcGuardSit = FALSE;
		B_StartOtherRoutine(STRF_8125_Addon_Nuts,"Start");
	};
};

func int ZS_MM_Rtn_DragonRest_OrcSit_loop()
{
	b_staminainvent_monster(self);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8208_MineGuard))
	{
		if((RemoveOrcDone == FALSE) || (OrcDoneWalArDagar == TRUE))
		{
			if((Npc_GetStateTime(self) > 10) && (OrcGuardSit == FALSE))
			{
				OrcGuardSit = TRUE;
				AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			};
			if((NutsRest == FALSE) && (OrcGuardSit == TRUE) && (Npc_GetStateTime(self) > 15))
			{
				NutsRest = TRUE;
				B_StartOtherRoutine(STRF_8125_Addon_Nuts,"Rest");
			};
		};
		if((RemoveOrcDone == TRUE) && (OrcDoneWalArDagar == FALSE))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"OM_SKLAD_KAR_SLAVE_SLEEP_01");
			self.wp = "OM_SKLAD_KAR_SLAVE_SLEEP_01";
			AI_AlignToWP(self);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_OrcSit_end()
{
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8208_MineGuard))
	{
		OrcGuardSit = FALSE;
		NutsRest = FALSE;
		B_StartOtherRoutine(STRF_8125_Addon_Nuts,"Start");
	};
};

func void ZS_MM_Rtn_OrcRitual()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	perception_set_none();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};

func int ZS_MM_Rtn_OrcRitual_loop()
{
	b_staminainvent_monster(self);

	AI_PlayAni(self,"T_PRAY_RANDOM");
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_OrcRitual_end()
{
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
};
