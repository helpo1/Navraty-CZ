
func void zs_mm_rtn_huntgone()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	B_SetAttitude(self,ATT_FRIENDLY);
	b_staminainvent();
	AI_Standup(self);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog))
	{
		AI_SetWalkMode(self,NPC_RUN);
	};

	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_huntgone_loop()
{
	var int wanderTime;
	var int randomMove;

	b_staminainvent_monster(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog)) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		if(Npc_GetDistToNpc(self,hero) > 300)
		{
			AI_GotoNpc(self,hero);
		}
		else if(Npc_GetStateTime(self) >= 1)
		{
			if(!Npc_CanSeeNpc(self,hero))
			{
				AI_TurnToNPC(self,hero);
			};
			Npc_SetStateTime(self,0);
		};
		self.wp = Npc_GetNearestWP(self);
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		wanderTime = Hlp_Random(10);
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(Npc_GetStateTime(self) > wanderTime)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
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
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_huntgone_end()
{
	b_staminainvent();
};

