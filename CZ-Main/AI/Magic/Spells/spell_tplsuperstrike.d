
instance SPELL_TPLSUPERSTRIKE(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_TPLSUPERSTRIKE;
	damagetype = DAM_MAGIC;
	targetCollectRange = 1500;
};


func int spell_logic_tplsuperstrike(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLSUPERSTRIKE)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_tplsuperstrike()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara a ostatních mágů, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		};
		TESTRUNEME = TRUE;
	};
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLSUPERSTRIKE;
	self.aivar[AIV_SelectSpell] += 1;
};

instance SPELL_GuruWrath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_GuruWrath;
	damagetype = DAM_MAGIC;
};


func int spell_logic_GuruWrath(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_GuruWrath)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void spell_cast_GuruWrath()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll4;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_GuruWrath;
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara a ostatních mágů, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		};
		TESTRUNEME = TRUE;
	};

	self.aivar[AIV_SelectSpell] += 1;
};