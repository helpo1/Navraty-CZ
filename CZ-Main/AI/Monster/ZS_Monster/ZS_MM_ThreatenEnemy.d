
func void ZS_MM_ThreatenEnemy()
{
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	b_staminainvent();
	AI_Standup(self);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);

	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (TrollSeeMe == FALSE))
	{
		if(MIS_PW_PoisonNrozas == LOG_Running)
		{
			TrollSeeMe = TRUE;

			if((PoisonDoneFull == FALSE) && (PoisonDoneHalf == FALSE) && (PoisonDoneOneTear == FALSE))
			{
				B_LogEntry(TOPIC_PW_PoisonNrozas,"Zatraceně, vylekal jsem toho trola! Teď už jen stěží otrávím tu návnadu a vyzkouším Nrozasův jed...");
			}
			else
			{
				B_LogEntry(TOPIC_PW_PoisonNrozas,"Zatraceně, vylekal jsem toho trola, ale alespoň se mi povedlo otrávit návnadu! Možná se na ni ta příšera přece jen ulakomí...");
			};
		};
	};
};

func int ZS_MM_ThreatenEnemy_loop()
{
	b_staminainvent_monster(self);

	if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
	{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return LOOP_END;
	};
	if(Npc_IsPlayer(other) && (FakelIsOn == TRUE) && (self.aivar[90] == FALSE) && ((self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_Keiler) || (self.aivar[AIV_MM_REAL_ID] == ID_Swamprat) || (self.aivar[AIV_MM_REAL_ID] == ID_LURKER) || (self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT) || (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) || (self.aivar[AIV_MM_REAL_ID] == ID_WOLF)))
	{
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_WARN");
		return LOOP_CONTINUE;
	};
	if(Npc_GetStateTime(self) >= MONSTER_THREATEN_TIME)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return LOOP_END;
	};
	AI_TurnToNPC(self,other);

	if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN))
	{
		AI_DrawWeapon(self);
	};
	if(self.guild == GIL_DRAGON)
	{
		Snd_Play3d(self,"DRAGON_WRATH_01");
		AI_PlayAni(self,"T_GOTHIT");
	}
	else if(self.guild == GIL_DEMON)
	{
		Snd_Play3d(self,"DRAGON_WRATH_02");
		AI_PlayAni(self,"T_GOTHIT");
	}
	else
	{
		AI_PlayAni(self,"T_WARN");
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_ThreatenEnemy_end()
{
	b_staminainvent();
};

