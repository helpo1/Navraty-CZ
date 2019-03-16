
func void zs_orc_commandbigfight()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = ISINPOS;
};

func int zs_orc_commandbigfight_loop()
{
	var string concatText;
	if((SIGNALSTARTBIGBATTLE == TRUE) && (STARTBIGBATTLE == FALSE))
	{
		if(Npc_HasItems(self,itmi_orcwarhorn) == 0)
		{
			CreateInvItem(self,itmi_orcwarhorn);
		};
		AI_UseItem(self,itmi_orcwarhorn);
		AI_Wait(self,0.2);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_WARN");
		STARTBIGBATTLE = TRUE;
		AI_Wait(self,0.5);
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_BIGFIGHT_LEE");
	};
	if((PRESTARTBIGBATTLE == TRUE) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (SIGNALSTARTBIGBATTLE == FALSE))
	{
		if(Npc_HasItems(self,itmi_orcwarhorn) == 0)
		{
			CreateInvItem(self,itmi_orcwarhorn);
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		AI_Wait(self,15);
		AI_PlayAni(self,"T_WARN");
		AI_PlayAni(self,"T_WARN");
		AI_Wait(self,0.5);
		AI_UseItem(self,itmi_orcwarhorn);
		SIGNALSTARTBIGBATTLE = TRUE;
	};
	return LOOP_CONTINUE;
};

func void zs_orc_commandbigfight_end()
{
};

