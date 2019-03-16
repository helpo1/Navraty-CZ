
func void zs_sleep_lee()
{
	perception_set_none();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_sleep_lee_loop()
{
	B_CheckHealth(self);
	self.attribute[ATR_HITPOINTS] = 50;

	if(!C_BodyStateContains(self,BS_LIE))
	{
		if(Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob(self,"BEDHIGH",1);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_sleep_lee_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

