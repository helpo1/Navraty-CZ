
func void zs_orc_bigfight()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = ISINPOS;
};

func int zs_orc_bigfight_loop()
{
	var string concatText;
	var int randomMove;

	if(STARTBIGBATTLE == FALSE)
	{
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
			AI_AlignToWP(self);
			AI_TurnToNPC(self,self);
		};
		if(Hlp_Random(1000) <= 5)
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
	};
	if((STARTBIGBATTLE == TRUE) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		concatText = IntToString(self.id);
		concatText = ConcatStrings("NW_BIGFIGHT_",concatText);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_WARN");
		AI_PlayAni(self,"T_WARN");
		AI_Wait(self,0.5);
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,concatText);
	};
	if((STARTBIGBATTLE == TRUE) && (CANATTACKBIGBATTLE == FALSE))
	{
		concatText = IntToString(self.id);
		concatText = ConcatStrings("NW_BIGFIGHT_",concatText);
		if(Npc_GetDistToWP(self,concatText) < 100)
		{
			b_bigfight_moveorcstohumans();
			CANATTACKBIGBATTLE = TRUE;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_orc_bigfight_end()
{
};

