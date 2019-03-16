
func void ZS_Cook_Stove()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItFoMuttonRaw) == 0)
	{
		CreateInvItem(self,ItFoMuttonRaw);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Cook_Stove_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"STOVE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"STOVE"))
	{
		AI_UseMob(self,"STOVE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Cook_Stove_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"STOVE",-1);
	if(Npc_HasItems(self,ItFoMutton) >= 1)
	{
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
};

