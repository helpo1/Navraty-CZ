
func void zs_orc_play_drum()
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

func int zs_orc_play_drum_loop()
{
	B_CheckHealth(self);
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAniBS(self,"T_ORCDRUM_S0_2_S1",BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	}
	else
	{
		AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_1",BS_SIT);
	};
	return LOOP_CONTINUE;
};

func void zs_orc_play_drum_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAniBS(self,"T_ORCDRUM_STAND_2_S0",BS_STAND);
	AI_SetWalkMode(self,NPC_WALK);
};

