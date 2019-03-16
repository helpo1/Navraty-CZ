
func void zs_mm_shemrondemon()
{
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	b_staminainvent();
};

func void zs_mm_shemrondemon_loop()
{
	b_staminainvent_monster(self);
	AI_Wait(self,1);
};

func void zs_mm_shemrondemon_end()
{
	b_staminainvent();
};

