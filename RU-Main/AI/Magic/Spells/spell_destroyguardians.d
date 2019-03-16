
instance SPELL_DESTROYGUARDIANS(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectRange = 2000;
	damage_per_level = SPL_DAMAGE_DESTROYGUARDIANS;
	damagetype = DAM_MAGIC;
};


func int spell_logic_destroyguardians(var int manaInvested)
{
	if((self.attribute[ATR_MANA] >= SPL_COST_DESTROYGUARDIANS) && (NETBEKLEADME_STEP1DONE == TRUE))
	{
		if((other.flags == NPC_FLAG_IMMORTAL) && (other.guild == GIL_DMT))
		{
			other.flags = 0;
		};
		if((other.flags == NPC_FLAG_XARADRIM) && (other.guild == GIL_DMT))
		{
			other.flags = 0;
		};
		if((other.flags == NPC_FLAG_IMMORTAL) && (other.guild == GIL_DEMON))
		{
			other.flags = 0;
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_destroyguardians()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_DESTROYGUARDIANS;
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

