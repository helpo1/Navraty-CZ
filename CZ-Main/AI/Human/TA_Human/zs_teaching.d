
func void zs_teaching()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void zs_teaching_loop()
{
	var int guardreaktion;

	B_CheckHealth(self);
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
	AI_Wait(self,1);
};

func void zs_teaching_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

