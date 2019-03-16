
func void ZS_Wash_FP()
{
	Perception_Set_Normal();
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

func int ZS_Wash_FP_Loop()
{
	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"WASH") || Npc_IsOnFP(self,"ITEMSPAWN") || Npc_IsOnFP(self,"SHELLSPAWN"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"WASH"))
	{
		AI_GotoFP(self,"WASH");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else if(Wld_IsFPAvailable(self,"SHELLSPAWN"))
	{
		AI_GotoFP(self,"SHELLSPAWN");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else if(Wld_IsFPAvailable(self,"ITEMSPAWN"))
	{
		AI_GotoFP(self,"ITEMSPAWN");
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
	if((self.aivar[AIV_TAPOSITION] == NOTINPOS) && (Npc_IsOnFP(self,"WASH") || Npc_IsOnFP(self,"ITEMSPAWN") || Npc_IsOnFP(self,"SHELLSPAWN")))
	{
		AI_AlignToFP(self);
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_WASH");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Wash_FP_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_WASH_2_STAND");
};

