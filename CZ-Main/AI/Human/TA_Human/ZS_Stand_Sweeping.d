
func void ZS_Stand_Sweeping()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (LeaveMeetGhost == TRUE) && (FinishStoryLH == FALSE))
	{
		Npc_PercDisable(self,PERC_ASSESSTALK);
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMi_Broom) == 0)
	{
		CreateInvItem(self,ItMi_Broom);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Sweeping_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			AI_UseItemToState(self,ItMi_Broom,-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(Npc_IsOnFP(self,"SWEEP"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"SWEEP"))
	{
		AI_GotoFP(self,"SWEEP");
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
		AI_UseItemToState(self,ItMi_Broom,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_Sweeping_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseItemToState(self,ItMi_Broom,-1);
};

