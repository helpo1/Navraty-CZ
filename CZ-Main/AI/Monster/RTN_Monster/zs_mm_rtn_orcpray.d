

func void zs_mm_rtn_orcpraynail()
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

func int zs_mm_rtn_orcpraynail_loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(Wld_IsFPAvailable(self,"FP_PRAY"))
		{
			AI_GotoFP(self,"FP_PRAY");
		};

		AI_PlayAni(self,"T_STAND_2_PRAY");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void zs_mm_rtn_orcpraynail_end()
{
	b_staminainvent();
	AI_PlayAni(self,"T_PRAY_2_STAND");
};

func void zs_mm_rtn_orcpray()
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

func int zs_mm_rtn_orcpray_loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Wld_IsFPAvailable(self,"FP_PRAY"))
		{
			AI_GotoFP(self,"FP_PRAY");
		}
		else if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		}
		else if(Wld_IsNextFPAvailable(self,"FP_STAND"))
		{
			AI_GotoNextFP(self,"FP_STAND");
		}
		else if(Wld_IsNextFPAvailable(self,"FP_CAMPFIRE"))
		{
			AI_GotoNextFP(self,"FP_CAMPFIRE");
		}
		else
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,Npc_GetNearestWP(self));
			AI_PlayAni(self,"T_STAND_2_PRAY");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_PRAY"))
		{
			AI_PlayAni(self,"T_STAND_2_PRAY");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			AI_PlayAni(self,"T_STAND_2_PRAY");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_STAND"))
		{
			AI_PlayAni(self,"T_STAND_2_PRAY");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(Npc_IsOnFP(self,"FP_CAMPFIRE"))
		{
			AI_PlayAni(self,"T_STAND_2_PRAY");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else
	{
		randomMove = Hlp_Random(6);
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"T_PRAY_RANDOM");
			Snd_Play3d(self,"ORC_SPEECH_01");
		}
		else if(randomMove == 1)
		{
			AI_PlayAni(self,"T_PRAY_RANDOM");
			Snd_Play3d(self,"ORC_SPEECH_02");
		}
		else if(randomMove == 2)
		{
			AI_PlayAni(self,"T_PRAY_RANDOM");
			Snd_Play3d(self,"ORC_SPEECH_03");
		}
		else
		{
			AI_PlayAni(self,"T_PRAY_RANDOM");
		};
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_orcpray_end()
{
	b_staminainvent();
	AI_PlayAni(self,"T_PRAY_2_STAND");
	AI_PlayAni(self,"T_STAND_2_DANCE");
	AI_PlayAni(self,"T_DANCE");
	AI_PlayAni(self,"T_DANCE_RANDOM_1");
	AI_PlayAni(self,"T_DANCE");
	AI_PlayAni(self,"T_DANCE_RANDOM_1");
	AI_PlayAni(self,"T_DANCE");
	AI_PlayAni(self,"T_DANCE_RANDOM_1");
	AI_PlayAni(self,"T_DANCE_2_STAND");
};

func void ZS_MM_Rtn_OrcPreach()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_MM_Rtn_OrcPreach_Loop()
{
	var int guardreaktion;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Npc_IsOnFP(self,"FP_PRAY"))
	{
		if(self.aivar[AIV_TAPOSITION] >= 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};

		if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
		{
			b_preach_orc(self.aivar[AIV_TAPOSITION]);
		};

		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		guardreaktion = Hlp_Random(1200);

		if(guardreaktion >= 1100)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
		}
		else if(guardreaktion >= 1000)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
		}
		else if(guardreaktion >= 900)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
		}
		else if(guardreaktion >= 800)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
		}
		else if(guardreaktion >= 700)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
		}
		else if(guardreaktion >= 800)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
		}
		else if(guardreaktion >= 900)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
		}
		else if(guardreaktion >= 400)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
		};
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(Wld_IsFPAvailable(self,"FP_PRAY"))
		{
			AI_GotoFP(self,"FP_PRAY");
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_OrcPreach_End()
{
	b_staminainvent();
};