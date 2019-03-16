
func void zs_preach_parvez()
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

func int zs_preach_parvez_loop()
{
	var int guardreaktion;

	B_CheckHealth(self);

	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};

		if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
		{
			b_preach_parvez(self.aivar[AIV_TAPOSITION]);
		};

		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
		guardreaktion = Hlp_Random(1000);

		if(guardreaktion >= 900)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_11");
		}
		else if(guardreaktion >= 800)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_15");
		}
		else if(guardreaktion >= 700)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_16");
		}
		else if(guardreaktion >= 600)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_18");
		}
		else if(guardreaktion >= 500)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_21");
		}
		else if(guardreaktion >= 400)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_20");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_preach_parvez_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};


func void zs_preach_haniar()
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

func int zs_preach_haniar_loop()
{
	var int guardreaktion;

	B_CheckHealth(self);

	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};

		if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
		{
			b_preach_haniar(self.aivar[AIV_TAPOSITION]);
		};

		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
		guardreaktion = Hlp_Random(1000);

		if(guardreaktion >= 900)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_11");
		}
		else if(guardreaktion >= 800)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_15");
		}
		else if(guardreaktion >= 700)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_16");
		}
		else if(guardreaktion >= 600)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_18");
		}
		else if(guardreaktion >= 500)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_21");
		}
		else if(guardreaktion >= 400)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_20");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_preach_haniar_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

