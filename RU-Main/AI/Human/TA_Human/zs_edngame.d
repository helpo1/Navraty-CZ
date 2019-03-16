
func void zs_edngame()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_edngame_loop()
{
	b_staminainvent();
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 45) && (ENDGAMERIGHTNOW == FALSE))
	{
		PlayVideo("RET2_BlackScreen.bik");
		PlayVideo("Credits_Extro.BIK");
		ExitSession();
		Npc_SetStateTime(self,0);
		ENDGAMERIGHTNOW = TRUE;
	};
	if(ENDGAMERIGHTNOW == TRUE)
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_edngame_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

