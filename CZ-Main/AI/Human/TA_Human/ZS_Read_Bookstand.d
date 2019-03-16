
func void ZS_Read_Bookstand()
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

func int ZS_Read_Bookstand_Loop()
{
	var int randomizer;

	B_CheckHealth(self);
	randomizer = Hlp_Random(40);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"BOOK",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BOOK"))
	{
		AI_UseMob(self,"BOOK",1);
	}
	else if(Npc_GetStateTime(self) >= (80 + randomizer))
	{
		b_interruptmob("BOOK");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Read_Bookstand_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"BOOK",-1);
};

func void ZS_Read_WriteBookstand()
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

func int ZS_Read_WriteBookstand_Loop()
{
	var int randomizer;

	B_CheckHealth(self);
	randomizer = Hlp_Random(40);

	if((Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG) && ((self.vars[0] == TRUE) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_202_Albrecht)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MIL_311_Andre))))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"BUCHSCHREIBEN",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BUCHSCHREIBEN"))
	{
		AI_UseMob(self,"BUCHSCHREIBEN",1);
	}
	else if(Npc_GetStateTime(self) >= (80 + randomizer))
	{
		b_interruptmob("BUCHSCHREIBEN");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Read_WriteBookstand_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"BUCHSCHREIBEN",-1);
	Npc_RemoveInvItems(self,ItMi_Feder,Npc_HasItems(self,ItMi_Feder));
};

func void ZS_Paint()
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

func int ZS_Paint_Loop()
{
	var int randomizer;

	B_CheckHealth(self);
	randomizer = Hlp_Random(40);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"MALEN",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"MALEN"))
	{
		AI_UseMob(self,"MALEN",1);
	}
	else if(Npc_GetStateTime(self) >= (80 + randomizer))
	{
		b_interruptmob("MALEN");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Paint_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"MALEN",-1);
};