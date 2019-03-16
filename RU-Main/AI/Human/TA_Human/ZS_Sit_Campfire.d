
func void ZS_Sit_Campfire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Campfire_loop()
{
	var int randsit;

	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
		randsit = Hlp_Random(4);

		if(randsit == 0)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Arr.mds");
		}
		else if(randsit == 1)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rel.mds");
		}		
		else if(randsit == 2)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Trd.mds");
		};

		AI_StandupQuick(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"CAMPFIRE");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Campfire_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

func void ZS_Sit_Campfire_Orc()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
};

func int ZS_Sit_Campfire_Orc_loop()
{
	return LOOP_CONTINUE;
};

func void ZS_Sit_Campfire_Orc_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};
