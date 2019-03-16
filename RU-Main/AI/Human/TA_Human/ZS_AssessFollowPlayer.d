
func void B_AssessFollowPlayer()
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack)) && (JackMeetLHGhost == TRUE) && (FinishStoryLH == FALSE))
	{
		Npc_PercDisable(self,PERC_ASSESSTALK);
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			self.aivar[AIV_TAPOSITION] = TRUE;
		}
		else if(C_DiegoTooFar(0) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			self.aivar[AIV_TAPOSITION] = TRUE;
			if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
			{
				B_Say(self,other,"$SC_HEYWAITASECOND");
			};
		}
		else
		{
			B_AssessPlayer();
		};
		return;
	};
	if((Npc_GetDistToNpc(self,hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	}
	else
	{
		B_AssessPlayer();
	};
};

func void B_AssessFollowFightSound()
{
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim) || (other.aivar[AIV_PARTYMEMBER] == TRUE) || (victim.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		B_AssessFightSound();
	};
};

func void B_MoveFollowNpc()
{
};

func void ZS_Follow_Player()
{
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,0.3);
	Perception_Set_Minimal();

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10920_Loa)) && (LoaBackToFarm == TRUE) && (LoaBackToFarmDone == FALSE))
	{
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessFollowPlayer);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessFollowPlayer);
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
		Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
		Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFollowFightSound);
	};

	B_ResetAll(self);
	b_staminainvent();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);

	if(self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		B_SetAttitude(self,ATT_FRIENDLY);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Follow_Player_Loop()
{
	B_CheckHealth(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_186_SLAVEOBSSEK)) && (SlaveArrived_01 == TRUE))
	{
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_387_SLAVEOBSSEK)) && (SlaveArrived_02 == TRUE))
	{
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,hero) > self.aivar[AIV_FollowDist])
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
		{
			if(C_DiegoTooFar(0))
			{
				if(Npc_GetStateTime(self) > 1)
				{
					B_TurnToNpc(self,hero);
					Npc_SetStateTime(self,0);
				};
				return LOOP_CONTINUE;
			};
		};
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		if(Npc_GetDistToNpc(self,hero) > 500)
		{
			AI_GotoNPC(self,hero);
		};

		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else if(Npc_GetStateTime(self) > 1)
	{
		B_TurnToNpc(self,hero);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Follow_Player_End()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npcType != NPCTYPE_FRIEND))
	{
		B_SetAttitude(self,ATT_NEUTRAL);
	};

	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};