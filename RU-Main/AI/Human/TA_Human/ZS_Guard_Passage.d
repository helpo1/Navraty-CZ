
func void ZS_Guard_Passage()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	Npc_SetPercTime(self,0.1);
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;

	if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		AI_AlignToWP(self);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Guard_Passage_Loop()
{
	var int random;

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
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(9);

		if(random == 1)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_PERCEPTION");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_BORINGKICK");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"R_LEGSHAKE");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Guard_Passage_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};