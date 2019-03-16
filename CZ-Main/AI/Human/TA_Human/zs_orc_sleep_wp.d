
func void zs_orc_sleep_wp()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_orc_sleep_wp_loop()
{
	B_CheckHealth(self);
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_orc_sleep_wp_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

