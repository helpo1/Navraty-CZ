var int danceStyle;

func void ZS_Dance()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Dance_Loop()
{
	B_CheckHealth(self);

	if(danceStyle == 0)
	{
		AI_PlayAni(self,"T_DANCE_01");
	};
	if(danceStyle == 1)
	{
		AI_PlayAni(self,"T_DANCE_02");
	};
	if(danceStyle == 2)
	{
		AI_PlayAni(self,"T_DANCE_03");
	};
	if(danceStyle == 3)
	{
		AI_PlayAni(self,"T_DANCE_04");
	};
	if(danceStyle == 4)
	{
		AI_PlayAni(self,"T_DANCE_05");
	};
	if(danceStyle == 5)
	{
		AI_PlayAni(self,"T_DANCE_06");
	};
	if(danceStyle == 6)
	{
		AI_PlayAni(self,"T_DANCE_07");
	};
	if(danceStyle == 7)
	{
		AI_PlayAni(self,"T_DANCE_08");
	};
	if(danceStyle == 8)
	{
		AI_PlayAni(self,"T_DANCE_09");
	};

	danceStyle += 1;

	if(danceStyle > 9)
	{
		danceStyle = 0;
	};

	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void ZS_Dance_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_Standup(self);
};

var int danceStyleKira;

func void ZS_Dance_Kira()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	self.name[0] = "";
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
};

func int ZS_Dance_Kira_Loop()
{
	if(danceStyleKira == 0)
	{
		AI_PlayAni(self,"S_DANCE2");
	};
	if(danceStyleKira == 1)
	{
		AI_PlayAni(self,"S_DANCE3");
	};
	if(danceStyleKira == 2)
	{
		AI_PlayAni(self,"S_DANCE4");
	};
	if(danceStyleKira == 3)
	{
		AI_PlayAni(self,"S_DANCE5");
	};
	if(danceStyleKira == 4)
	{
		AI_PlayAni(self,"S_DANCE6");
	};
	if(danceStyleKira == 5)
	{
		AI_PlayAni(self,"S_DANCE7");
	};
	if(danceStyleKira == 6)
	{
		AI_PlayAni(self,"S_DANCE8");
	};
	if(danceStyleKira == 7)
	{
		AI_PlayAni(self,"S_DANCE9");
	};

	danceStyleKira += 1;
	
	if(danceStyleKira >= 8)
	{
		danceStyleKira = 0;
	};
	if(Npc_GetDistToWP(self,"NW_BIGFARM_CAMPON_PSI_GURU_04") > 100)
	{
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Dance_Kira_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_Standup(self);
};

var int danceStyleKiraSrn;

func void ZS_Dance_SRN()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	self.name[0] = "";
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
};

func int ZS_Dance_SRN_Loop()
{
	if(danceStyleKiraSrn == 0)
	{
		AI_PlayAni(self,"S_DANCE1");
	};
	if(danceStyleKiraSrn == 1)
	{
		AI_PlayAni(self,"S_DANCE2");
	};
	if(danceStyleKiraSrn == 2)
	{
		AI_PlayAni(self,"S_DANCE3");
	};
	if(danceStyleKiraSrn == 3)
	{
		AI_PlayAni(self,"S_DANCE4");
	};
	if(danceStyleKiraSrn == 4)
	{
		AI_PlayAni(self,"S_DANCE5");
	};
	if(danceStyleKiraSrn == 5)
	{
		AI_PlayAni(self,"S_DANCE6");
	};
	if(danceStyleKiraSrn == 6)
	{
		AI_PlayAni(self,"S_DANCE7");
	};
	if(danceStyleKiraSrn == 7)
	{
		AI_PlayAni(self,"S_DANCE8");
	};
	if(danceStyleKiraSrn == 8)
	{
		AI_PlayAni(self,"S_DANCE9");
	};

	danceStyleKira += 1;
	
	if(danceStyleKira >= 9)
	{
		danceStyleKira = 0;
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Dance_SRN_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_Standup(self);
};