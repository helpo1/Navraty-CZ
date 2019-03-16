
instance SPELL_TELEKINESIS(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_BAD;
	damage_per_level = SPL_TELEKINESIS_DAMAGE_PER_SEC;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectType = TARGET_TYPE_HUMANS;
	targetCollectRange = 500;
};


func int spell_logic_telekinesis(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_TELEKINESIS) && (self.attribute[ATR_MANA] < self.attribute[ATR_MANA_MAX]))
	{
		return SPL_NEXTLEVEL;
	}
	else if((self.attribute[ATR_MANA] >= SPL_COST_TELEKINESIS) && (self.attribute[ATR_MANA] < self.attribute[ATR_MANA_MAX]))
	{
		return SPL_NEXTLEVEL;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_telekinesis()
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
	self.aivar[AIV_SelectSpell] += 1;
};

