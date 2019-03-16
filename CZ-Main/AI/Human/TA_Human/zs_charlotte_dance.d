
func void zs_charlotte_dance()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1397_addon_inextremo_charlotte))
	{
		AI_GotoWP(self,"OCR_CHARLOTTE");
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_435_Nadja))
	{
		AI_GotoWP(self,"NW_PUFF_DANCE");
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_436_Sonja))
	{
		AI_GotoWP(self,"NW_CITY_PIRATESCAMP_04");
	}
	else
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void zs_charlotte_dance_loop()
{
	var int danceStyle;

	B_CheckHealth(self);
	PrintDebugNpc(PD_TA_LOOP,"ZS_Charlotte_Dance_Loop");
	danceStyle = Hlp_Random(9);
	if(danceStyle == 0)
	{
		AI_PlayAni(self,"S_DANCE1");
	};
	if(danceStyle == 1)
	{
		AI_PlayAni(self,"S_DANCE2");
	};
	if(danceStyle == 2)
	{
		AI_PlayAni(self,"S_DANCE3");
	};
	if(danceStyle == 3)
	{
		AI_PlayAni(self,"S_DANCE4");
	};
	if(danceStyle == 4)
	{
		AI_PlayAni(self,"S_DANCE5");
	};
	if(danceStyle == 5)
	{
		AI_PlayAni(self,"S_DANCE6");
	};
	if(danceStyle == 6)
	{
		AI_PlayAni(self,"S_DANCE7");
	};
	if(danceStyle == 7)
	{
		AI_PlayAni(self,"S_DANCE8");
	};
	if(danceStyle == 8)
	{
		AI_PlayAni(self,"S_DANCE9");
	};

	AI_GotoWP(self,self.wp);
};

func void zs_charlotte_dance_end()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

