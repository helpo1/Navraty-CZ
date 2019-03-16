
func void b_stoptelekinesis()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NOV) || (self.guild == GIL_NDW) || (self.guild == GIL_NDM) || (self.guild == GIL_PAL))
		{
			B_AssessDamage();
			AI_ContinueRoutine(self);
		}
		else
		{
			AI_StartState(self,ZS_ReactToDamage,0,"");
			AI_ContinueRoutine(self);
		};
	};
};

func int zs_telekinesis()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stoptelekinesis);
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
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	};
	return TRUE;
};

func int zs_telekinesis_loop()
{
	if(Npc_GetStateTime(self) >= 1)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",self,self,0,0,0,FALSE);
		Npc_SetStateTime(self,0);
		if(self.protection[PROT_MAGIC] != IMMUNE)
		{
			b_magicgivenpc(other,self,SPL_TELEKINESIS_DAMAGE_PER_SEC);
		};
		if((other.attribute[ATR_MANA] >= other.attribute[ATR_MANA_MAX]) || (other.attribute[ATR_MANA] <= 0))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};

func void zs_telekinesis_end()
{
};

