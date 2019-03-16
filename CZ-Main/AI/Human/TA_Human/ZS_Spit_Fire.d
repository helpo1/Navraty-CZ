
func void ZS_Spit_Fire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItLsTorchFirespit) == 0)
	{
		CreateInvItem(self,ItLsTorchFirespit);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Spit_Fire_loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			AI_UseItemToState(self,ItLsTorchFirespit,-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	if(Npc_GetStateTime(self) > 10)
	{
		AI_UseItemToState(self,ItLsTorchFirespit,5);
		AI_UseItemToState(self,ItLsTorchFirespit,0);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Spit_Fire_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseItemToState(self,ItLsTorchFirespit,-1);
};

