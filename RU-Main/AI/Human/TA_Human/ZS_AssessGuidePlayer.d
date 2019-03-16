
func void B_AssessGuidePlayer()
{
	if(Npc_GetDistToNpc(self,hero) > 3000)
	{
		if(Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			B_TurnToNpc(self,hero);
		};
		if((Npc_GetDistToNpc(self,hero) > 1200) && (self.aivar[AIV_EnemyOverride] == TRUE) && (Npc_GetAttitude(self,hero) == ATT_HOSTILE))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	}
	else
	{
		B_AssessPlayer();
	};
};

func void B_AssessGuideFightSound()
{
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim))
	{
		B_AssessFightSound();
	};
};

func void ZS_Guide_Player()
{
	Perception_Set_Minimal();
	B_ResetAll(self);
	b_staminainvent();
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessGuidePlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessGuideFightSound);

	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		B_SetAttitude(self,ATT_FRIENDLY);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Guide_Player_Loop()
{
	B_CheckHealth(self);

	if((Npc_GetDistToNpc(self,hero) > 3000) && (Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp)))
	{
		B_AssessGuidePlayer();
	}
	else if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};

		AI_GotoWP(self,self.wp);
	}
	else
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			B_TurnToNpc(self,hero);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Guide_Player_End()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npcType != NPCTYPE_FRIEND))
	{
		B_SetAttitude(self,ATT_NEUTRAL);
	};

	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};