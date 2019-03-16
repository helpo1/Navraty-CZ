
func void B_RestartFreeze()
{
	if((Npc_GetLastHitSpellID(self) == SPL_IceCube) || (Npc_GetLastHitSpellID(self) == SPL_IceWave))
	{
		Npc_SetStateTime(self,0);
	};
};

func void B_StopMagicFreeze()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		Perception_Set_Normal();
	};

	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);

	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_SetWalkMode(self,NPC_WALK);
		B_AssessDamage();
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,hero);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

func int ZS_MagicFreeze()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	self.aivar[AIV_FreezeNoHeal] = TRUE;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartFreeze);
		Npc_StopAni(self,"S_FIRE_VICTIM");

		if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
		};
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartFreeze);
		Npc_StopAni(self,"S_FIRE_VICTIM");

		if(self.guild > GIL_SEPERATOR_HUM)
		{
			if(!C_BodyStateContains(self,BS_STUMBLE))
			{
				AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
			};
		}
		else if(self.guild != GIL_DMT)
		{
			if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
			{
				AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
			};
		}
		else if(!C_BodyStateContains(self,BS_STUMBLE))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
		};
	};

	return TRUE;
};

func int ZS_MagicFreeze_Loop()
{
	var int randypfxdead;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(Npc_GetStateTime(self) > SPL_TIME_FREEZE)
		{
			B_StopMagicFreeze();
			return LOOP_END;
		}
		else
		{
			return LOOP_CONTINUE;
		};

		return LOOP_CONTINUE;
	}
	else
	{
		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			if(!C_NpcIsToughGuy(self) && (self.npcType != NPCTYPE_FRIEND))
			{
				B_MemorizePlayerCrime(self,hero,CRIME_ATTACK);
			};
		}
		else
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		if(Npc_GetStateTime(self) > SPL_TIME_FREEZE)
		{
			B_StopMagicFreeze();
			return LOOP_END;
		};

		return LOOP_CONTINUE;
	};

	return LOOP_END;
};

func void ZS_MagicFreeze_End()
{
};

func int ZS_MagicFreezeShort()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_ClearAIQueue(self);
	AI_Standup(self);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartFreeze);
		Npc_StopAni(self,"S_FIRE_VICTIM");

		if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
		};
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartFreeze);
		Npc_StopAni(self,"S_FIRE_VICTIM");

		if(self.guild > GIL_SEPERATOR_HUM)
		{
			if(!C_BodyStateContains(self,BS_STUMBLE))
			{
				AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
			};
		}
		else if(self.guild != GIL_DMT)
		{
			if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
			{
				AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
			};
		}
		else if(!C_BodyStateContains(self,BS_STUMBLE))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
		};
	};

	return TRUE;
};

func int ZS_MagicFreezeShort_Loop()
{
	var int randypfxdead;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(Npc_GetStateTime(self) > SPL_TIME_FREEZE_SHORT)
		{
			B_StopMagicFreeze();
			return LOOP_END;
		}
		else
		{
			return LOOP_CONTINUE;
		};

		return LOOP_CONTINUE;
	}
	else
	{
		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			if(!C_NpcIsToughGuy(self) && (self.npcType != NPCTYPE_FRIEND))
			{
				B_MemorizePlayerCrime(self,hero,CRIME_ATTACK);
			};
		}
		else
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		if(Npc_GetStateTime(self) > SPL_TIME_FREEZE_SHORT)
		{
			B_StopMagicFreeze();
			return LOOP_END;
		};

		return LOOP_CONTINUE;
	};

	return LOOP_END;
};

func void ZS_MagicFreezeShort_End()
{
};

func int ZS_MagicStanceShort()
{
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(!C_BodyStateContains(self,BS_STUMBLE))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
		};
	}
	else if(self.guild != GIL_DMT)
	{
		if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
		{
			AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
		};
	}
	else if(!C_BodyStateContains(self,BS_STUMBLE))
	{
		AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_STUMBLE);
	};

	Npc_SetStateTime(self,0);
	return TRUE;
};

func int ZS_MagicStanceShort_Loop()
{
	var int randypfxdead;

	if(Npc_GetStateTime(self) > SPL_TIME_FREEZE_SHORT)
	{
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Npc_ClearAIQueue(self);
		AI_Standup(self);

		if(self.guild < GIL_SEPERATOR_HUM)
		{
			B_AssessDamage();
		}
		else
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
	
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_MagicStanceShort_End()
{
};

func void B_RestartMagicCage()
{
	if(Npc_GetLastHitSpellID(self) == SPL_MagicCage)
	{
		Npc_SetStateTime(self,0);
	};
};

func void B_StopMagicCage()
{
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_StandUp(self);

	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,hero);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

func int ZS_MagicCage()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_StopAni(self, "S_FIRE_VICTIM");

	if(!C_BodyStateContains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
	};
};

func int ZS_MagicCage_Loop()
{
	if(Npc_GetStateTime(self) > SPL_Time_MagicCage)
	{
		B_StopMagicCage();
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_MagicCage_End()
{ 
};
