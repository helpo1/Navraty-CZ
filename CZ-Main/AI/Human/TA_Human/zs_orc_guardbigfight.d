
func void zs_orc_guardbigfight()
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

func int zs_orc_guardbigfight_loop()
{
	var string concatText;
	if((STARTBIGBATTLE == TRUE) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		AI_ReadyMeleeWeapon(self);
		AI_Wait(self,2);
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_BIGFIGHT_LEE");
	};
	return LOOP_CONTINUE;
};

func void zs_orc_guardbigfight_end()
{
};

