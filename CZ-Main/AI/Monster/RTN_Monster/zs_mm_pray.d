
func void zs_mm_pray()
{
	Perception_Set_Normal();
	b_staminainvent();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_mm_pray_loop()
{
	b_staminainvent_monster(self);
	AI_PlayAni(self,"T_STAND_2_PRAY");
	AI_PlayAni(self,"T_PRAY_RANDOM");
	return LOOP_CONTINUE;
};

func void zs_mm_pray_end()
{
	b_staminainvent();
	AI_PlayAni(self,"T_PRAY_2_STAND");
};

