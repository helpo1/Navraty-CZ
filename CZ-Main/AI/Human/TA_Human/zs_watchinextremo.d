
func void zs_watchinextremo()
{
	Perception_Set_Normal();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_watchinextremo_loop()
{
	var int random;

	B_CheckHealth(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_GotoFP(self,"STAND");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	random = Hlp_Random(10);
	if(random <= 5)
	{
		AI_PlayAni(self,"T_STAND_2_CLAPHANDS");
	};
	return LOOP_CONTINUE;
};

func void zs_watchinextremo_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

