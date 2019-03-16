
func void zs_mm_rtn_watchtime()
{
	b_staminainvent();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_mm_rtn_watchtime_loop()
{
	b_staminainvent_monster(self);

	if(Npc_GetDistToNpc(self,hero) > 1)
	{
		B_LookAtNpc(self,hero);
		Wld_SetTime(20,0);
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_watchtime_end()
{
	b_staminainvent();
};

