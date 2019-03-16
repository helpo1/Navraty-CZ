
func void zs_mm_rtn_demonrest()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	AI_Wait(self,3);
	AI_Teleport(self,"TOT");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = 0;
};

func int zs_mm_rtn_demonrest_loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

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
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_demonrest_end()
{
	b_staminainvent();
	AI_PlayAni(self,"T_REST_2_STAND");
};

func void zs_mm_rtn_uniqrest()
{
	Npc_SetPercTime(self,1);
	Perception_Set_Monster_Rtn();
	B_MM_DeSynchronize();

	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"FP_ROAM");
	};
};

func int zs_mm_rtn_uniqrest_loop()
{
	var int randomMove;

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

	return LOOP_CONTINUE;
};

func void zs_mm_rtn_uniqrest_end()
{
};

func void zs_mm_rtn_spider()
{
	Npc_SetPercTime(self,1);
	Perception_Set_Monster_Rtn();
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_spider_loop()
{
	var int wanderTime;
	var int randomMove;
	var int random;

	b_staminainvent_monster(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		wanderTime = Hlp_Random(10);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(Npc_GetStateTime(self) > wanderTime)
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

		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};

	return LOOP_CONTINUE;
};

func void zs_mm_rtn_spider_end()
{
	b_staminainvent();
};

func void ZS_MM_Rtn_Ghost()
{
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	Npc_SetPercTime(self,1);
	Perception_Set_Monster_Rtn();
	B_MM_DeSynchronize();
	AI_ReadyMeleeWeapon(self);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Ghost_Loop()
{
	var int wanderTime;
	var int randomMove;
	var int random;

	b_staminainvent_monster(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		wanderTime = Hlp_Random(20);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;

		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		};
	};
	if(Npc_GetStateTime(self) > wanderTime)
	{
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Ghost_End()
{
	b_staminainvent();
};

func void ZS_MM_Rtn_Mount()
{
	Npc_SetPercTime(self,1);
	Perception_Set_Monster_Rtn();
	B_MM_DeSynchronize();
	self.aivar[AIV_TAPOSITION] = ISINPOS;
};

func int ZS_MM_Rtn_Mount_Loop()
{
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Mount_End()
{
	b_staminainvent();
};