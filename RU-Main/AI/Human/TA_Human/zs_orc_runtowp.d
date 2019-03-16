
func void zs_orc_runtowp()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_orc_runtowp_loop()
{
	var int random;
	B_CheckHealth(self);

	if(Npc_GetStateTime(self) > 5)
	{
		random = Hlp_Random(3);
		if(random == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_orc_runtowp_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

