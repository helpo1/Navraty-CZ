func void B_StopMagicBurn()
{
	var int randypfxdead;

	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		self.attribute[ATR_HITPOINTS] = 0;

		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			randypfxdead = Hlp_Random(2);

			if(randypfxdead == TRUE)
			{
				AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
			}
			else
			{
				AI_PlayAniBS(self,"T_DEADB",BS_DEAD);
			};
		}
		else
		{
			AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
		};

		AI_StartState(self,ZS_Dead,0,"");
	};
};

func void B_RestartBurn()
{
	if((Npc_GetLastHitSpellID(self) == SPL_Firerain) || (Npc_GetLastHitSpellID(self) == SPL_Pyrokinesis) || (Npc_GetLastHitSpellID(self) == SPL_FireMeteor) || (Npc_GetLastHitSpellID(self) == SPL_ChargeFireball) || (Npc_GetLastHitSpellID(self) == SPL_InstantFireball) || (Npc_GetLastHitSpellID(self) == SPL_Firebolt) || (Npc_GetLastHitSpellID(self) == SPL_Firestorm))
	{
		Npc_SetStateTime(self,0);
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_IceWave) || (Npc_GetLastHitSpellID(self) == SPL_IceCube))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicBurn,0,"");
	};
};

func int ZS_MagicBurn()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopMagicBurn);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	return TRUE;
};

func int ZS_MagicBurn_Loop()
{
	var int randypfxdead;

	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartBurn);

	if(Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);

		if(self.protection[PROT_FIRE] != IMMUNE)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-SPL_MAGICBURN_DAMAGE_PER_SEC);
		};
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		self.attribute[ATR_HITPOINTS] = 0;

		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			randypfxdead = Hlp_Random(2);

			if(randypfxdead == TRUE)
			{
				AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
			}
			else
			{
				AI_PlayAniBS(self,"T_DEADB",BS_DEAD);
			};
		}
		else
		{
			AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
		};

		AI_StartState(self,ZS_Dead,0,"");
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_MagicBurn_End()
{
	var int randypfxdead;

	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		self.attribute[ATR_HITPOINTS] = 0;

		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			randypfxdead = Hlp_Random(2);

			if(randypfxdead == TRUE)
			{
				AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
			}
			else
			{
				AI_PlayAniBS(self,"T_DEADB",BS_DEAD);
			};
		}
		else
		{
			AI_PlayAniBS(self,"T_DEAD",BS_DEAD);
		};

		AI_StartState(self,ZS_Dead,0,"");
	};
};