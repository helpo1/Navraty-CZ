
func void zs_mm_rtn_sleeper()
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
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	self.aivar[AIV_TAPOSITION] = 0;
};

func int zs_mm_rtn_sleeper_loop()
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

func void zs_mm_rtn_sleeper_end()
{
	b_staminainvent();
	AI_PlayAni(self,"T_REST_2_STAND");
};

