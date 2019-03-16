func void ZS_Pick_Ore()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Pick_Ore_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"ORE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"ORE"))
	{
		if(Npc_HasItems(self,ItMw_2H_Axe_L_01) < 1)
		{
			CreateInvItems(self,ItMw_2H_Axe_L_01,1);
		};

		AI_UseMob(self,"ORE",1);
	};

	return LOOP_CONTINUE;
};

func void ZS_Pick_Ore_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"ORE",-1);
};

func void ZS_Pick_Iron()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Pick_Iron_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"ORE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"ORE"))
	{
		if(Npc_HasItems(self,ItMw_2H_Axe_L_01) < 1)
		{
			CreateInvItems(self,ItMw_2H_Axe_L_01,1);
		};

		AI_UseMob(self,"ORE",1);
	};

	return LOOP_CONTINUE;
};

func void ZS_Pick_Iron_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"ORE",-1);
};
