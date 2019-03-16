
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
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара и других прочих магов, я могу использовать рунную магию. Что бы это значило?!");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара, я могу использовать рунную магию. Что бы это значило?!");
		};
		TESTRUNEME = TRUE;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

