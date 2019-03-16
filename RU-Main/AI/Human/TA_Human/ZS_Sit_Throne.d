
func void ZS_Sit_Throne()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV))
	{
		Npc_PercDisable(self,PERC_ASSESSTALK);

		if(Npc_HasItems(self,ItAr_Helm_Arahar) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Arahar);
			AI_EquipArmor(self,ItAr_Helm_Arahar);
		};		
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Throne_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"THRONE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"THRONE"))
	{
		AI_UseMob(self,"THRONE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Throne_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"THRONE",-1);
};

func void ZS_Sit_Trone()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Trone_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"TRONE",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"TRONE"))
	{
		AI_UseMob(self,"TRONE",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Trone_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"TRONE",-1);
};

func void ZS_Sit_Baron()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Baron_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"BARON",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"BARON"))
	{
		AI_UseMob(self,"BARON",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Baron_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"BARON",-1);
};
