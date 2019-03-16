
func void ZS_RunToWP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_RUN);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_RunToWP_Loop()
{
	var int random;

	B_CheckHealth(self);
	if(Npc_GetStateTime(self) > 5)
	{
		random = Hlp_Random(2);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func int ZS_RunToWP_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	return TRUE;
};

