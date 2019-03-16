func void B_StopMagicBurnShort()
{
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
};

func void B_RestartBurnShort()
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
		AI_StartState(self,ZS_MagicBurnShort,0,"");
	};
};

func int ZS_MagicBurnShort()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,B_StopMagicBurnShort);

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

func int ZS_MagicBurnShort_Loop()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_RestartBurnShort);

	if(Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-SPL_MAGICBURNSHORT_DAMAGE_PER_SEC);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MagicBurnShort_End()
{
	Npc_ClearAIQueue(self);
	AI_Standup(self);
};