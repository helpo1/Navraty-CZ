
func void ZS_Preach_Vatras()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Preach_Vatras_loop()
{
	B_CheckHealth(self);

	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};
	
		if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
		{
			B_Preach_Vatras(self.aivar[AIV_TAPOSITION]);
		};

		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Preach_Vatras_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};


func void ZS_Preach_Marduk()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	self.aivar[AIV_TAPOSITION] = FALSE;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Preach_Marduk_loop()
{
	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"PREACH"))
	{
		AI_AlignToFP(self);
	}
	else if(Wld_IsFPAvailable(self,"PREACH"))
	{
		AI_GotoFP(self,"PREACH");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 15)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};

		if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
		{
			B_Preach_Marduk(self.aivar[AIV_TAPOSITION]);
		};

		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Preach_Marduk_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};