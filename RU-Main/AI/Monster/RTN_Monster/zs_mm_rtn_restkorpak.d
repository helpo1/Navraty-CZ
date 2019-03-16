
func void zs_mm_rtn_restkorpak()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_restkorpak_loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_restkorpak_end()
{
	b_staminainvent();
};

