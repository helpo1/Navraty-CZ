
instance Spell_WindFist(C_Spell_Proto)
{
	time_per_mana = 30;
	damage_per_level = SPL_Damage_Windfist;
	damagetype = DAM_FLY | DAM_MAGIC;
	canTurnDuringInvest = TRUE;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange = 1000;
};


func int Spell_Logic_WindFist(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < STEP_WindFist)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_WindFist * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_WindFist * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WindFist;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_WindFist * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WindFist;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_WindFist * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WindFist;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_WindFist * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_WindFist(var int spellLevel)
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WindFist;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
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

