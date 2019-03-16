
func void ZS_MM_Rtn_OrcSit()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_OrcSit_loop()
{
	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{
			AI_GotoFP(self,"FP_CAMPFIRE");
		}
		else if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		}
		else if(self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN)
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_CAMPFIRE"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if((self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS))
	{
		if(Wld_IsTime(22,5,5,55))
		{
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_OrcSit_end()
{
	b_staminainvent();
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

