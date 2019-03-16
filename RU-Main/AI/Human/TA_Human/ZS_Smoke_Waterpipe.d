
func void ZS_Smoke_Waterpipe()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Smoke_Waterpipe_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"SMOKE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"SMOKE"))
	{
		AI_UseMob(self,"SMOKE",1);
		if(Npc_IsPlayer(self))
		{
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Smoke_Waterpipe_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"SMOKE",-1);
};

