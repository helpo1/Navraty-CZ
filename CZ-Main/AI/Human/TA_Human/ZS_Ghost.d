
func void ZS_Ghost()
{
	var C_Npc Quarho;
	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho))
	{
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
		};
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ResetAll(self);
	b_staminainvent();
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (KvarhPeace == FALSE))
	{
		AI_Teleport(self,"AV_UNDEADTHRONE");
	}
	else
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Ghost_Loop()
{
	B_CheckHealth(self);

	if(Npc_GetStateTime(self) >= 5)
	{
		if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
		};

		B_RemoveGhost();
	};

	return LOOP_CONTINUE;
};

func void ZS_Ghost_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_GhostWusel()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ResetAll(self);
	b_staminainvent();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"FP_ROAM");
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_GhostWusel_Loop()
{
	B_CheckHealth(self);

	if(Npc_GetStateTime(self) >= 3)
	{
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				Npc_ClearAIQueue(self);
				AI_GotoNextFP(self,"FP_ROAM");
			};
		}
		else if(!C_BodyStateContains(self,BS_WALK) && !C_BodyStateContains(self,BS_RUN))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_GhostWusel_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_Ghost_Main()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	B_ResetAll(self);
	b_staminainvent();
	Npc_SetPercTime(self,0.1);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Ghost_Main_Loop()
{
	B_CheckHealth(self);

	if((MIS_CurseAncient == LOG_Success) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1159_Rhademes)) && (RhademesAway == FALSE))
	{
		Npc_ExchangeRoutine(NONE_ADDON_1159_Rhademes,"TOT");
		AI_Teleport(NONE_ADDON_1159_Rhademes,"TOT");
		RhademesAway = TRUE;
		return LOOP_END;
	};
	if((MIS_JarCurse == LOG_Success) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (QuarhodronAway == FALSE))
	{
		Npc_ExchangeRoutine(NONE_ADDON_1158_Quarhodron,"TOT");
		AI_Teleport(NONE_ADDON_1158_Quarhodron,"TOT");
		QuarhodronAway = TRUE;
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Ghost_Main_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};