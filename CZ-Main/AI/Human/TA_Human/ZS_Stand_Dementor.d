
func void ZS_Stand_Dementor()
{
	AI_Standup(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;

	if(self.guild != GIL_ORC)
	{
		self.senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	};
	if(Npc_KnowsInfo(self,1))
	{
		Npc_SetPercTime(self,0.3);
	}
	else
	{
		Npc_SetPercTime(self,1);
	};
	if(self.guild != GIL_ORC)
	{
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);

		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
		};

		Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
		Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	};
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Dementor_loop()
{
	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_Standup(self);

		if(self.guild != GIL_ORC)
		{
			AI_PlayAni(self,"T_STAND_2_LGUARD");
		}
		else
		{
			AI_PlayAni(self,"R_ROAM1");
			AI_StartState(self,ZS_MM_AllScheduler,1,"");
		};
	
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Dementor_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(self.guild != GIL_ORC)
	{
		AI_PlayAni(self,"T_LGUARD_2_STAND");
	}
	else
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
	};
};