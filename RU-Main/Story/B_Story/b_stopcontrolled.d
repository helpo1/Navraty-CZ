
func void b_stopcontrolled()
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

func int zs_controlled()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stopcontrolled);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
	return TRUE;
};

func int zs_controlled_loop()
{
	if(Npc_GetStateTime(self) >= 1)
	{
		Npc_SetStateTime(self,0);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-SPL_CONTROL_DAMAGE_PER_SEC);

		if(self.attribute[ATR_HITPOINTS] <= 0)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};

func void zs_controlled_end()
{
};

