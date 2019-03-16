
func void ZS_Smith_Fire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMi_AnvilPliers) == 0)
	{
		CreateInvItem(self,ItMi_AnvilPliers);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Smith_Fire_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"BSFIRE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSFIRE"))
	{
		AI_UseMob(self,"BSFIRE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Fire_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	Npc_RemoveInvItems(self,ItMi_AnvilPliers,1);
	AI_UseMob(self,"BSFIRE",-1);
};

