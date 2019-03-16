
func void zs_mm_rtn_followtrf()
{
	perception_set_helper_rtn();
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_mm_rtn_followtrf_loop()
{
	b_staminainvent_monster(self);

	if(Npc_GetDistToNpc(self,hero) > 1000)
	{
		AI_Teleport(self,Npc_GetNearestWP(hero));
		AI_GotoNpc(self,hero);
		self.wp = Npc_GetNearestWP(self);
	}
	else if(Npc_GetDistToNpc(self,hero) > 200)
	{
		AI_GotoNpc(self,hero);
		self.wp = Npc_GetNearestWP(self);
	};
	if(!Npc_CanSeeNpc(self,hero))
	{
		AI_TurnToNPC(self,hero);
		self.wp = Npc_GetNearestWP(self);
	};
	if(HEROISTRANSFORMED == FALSE)
	{
		if(hero.guild > GIL_SEPERATOR_HUM)
		{
			HEROISTRANSFORMED = TRUE;
		};
	}
	else if(hero.guild <= GIL_SEPERATOR_HUM)
	{
		HEROISTRANSFORMED = FALSE;
	};
	b_staminainventbug();
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_followtrf_end()
{
};

