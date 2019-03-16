
func void zs_mm_rtn_orcsitroam()
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

func int zs_mm_rtn_orcsitroam_loop()
{
	var int randomMove;
	var int randomeat;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_RoamStart],0,self.aivar[AIV_MM_RoamEnd],0) && (self.aivar[AIV_MM_RoamStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoFP(self,"FP_ROAM");
		}
		else if(Wld_IsNextFPAvailable(self,"FP_STAND"))
		{
			AI_GotoNextFP(self,"FP_STAND");
		}
		else
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,Npc_GetNearestWP(self));
			randomMove = Hlp_Random(3);
			randomeat = Hlp_Random(40);
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
			if(randomeat <= 10)
			{
				AI_RemoveWeapon(self);
				if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
				{
					CreateInvItem(self,itfo_addon_orcrum);
				};
				AI_UseItem(self,itfo_addon_orcrum);
				AI_SetWalkMode(self,NPC_WALK);
			};
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_STAND"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if(!Wld_IsTime(22,0,6,0))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_orcsitroam_end()
{
	b_staminainvent();
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

func void zs_mm_rtn_orcdancef()
{
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

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_orcdancef_loop()
{
	b_staminainvent_monster(self);
	AI_PlayAni(self,"T_STAND_2_DANCE");
	AI_PlayAni(self,"T_DANCE_RANDOM_1");
	AI_PlayAni(self,"T_DANCE_2_STAND");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;};

func void zs_mm_rtn_orcdancef_end()
{
};

func void zs_mm_rtn_orcdances()
{
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

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_orcdances_loop()
{
	b_staminainvent_monster(self);
	AI_PlayAni(self,"T_STAND_2_DANCE");
	AI_PlayAni(self,"T_DANCE");
	AI_PlayAni(self,"T_DANCE_2_STAND");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_orcdances_end()
{
};
