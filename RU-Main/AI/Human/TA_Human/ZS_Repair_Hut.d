
func void ZS_Repair_Hut()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Repair_Hut_Loop()
{
	var int zufall;

	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"REPAIR",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"REPAIR"))
	{
		AI_UseMob(self,"REPAIR",1);
	};
	if((Npc_GetStateTime(self) > 5) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		zufall = Hlp_Random(100);

		if(zufall < 50)
		{
			AI_PlayAniBS(self,"T_REPAIR_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		};

		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Repair_Hut_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"REPAIR",-1);
};

