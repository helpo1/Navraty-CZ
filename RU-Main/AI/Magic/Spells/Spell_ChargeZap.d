
instance Spell_ChargeZap(C_Spell_Proto)
{
	time_per_mana = 60;
	damage_per_level = SPL_Damage_ChargeZap;
	damagetype = DAM_MAGIC;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_ChargeZap(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < STEP_ChargeZap)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_ChargeZap * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_ChargeZap * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_ChargeZap * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_ChargeZap(var int spellLevel)
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};

	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_ChargeZap;

	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
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

instance Spell_AdanosBall(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_AdanosBall;
	damagetype = DAM_MAGIC;
};

func int Spell_Logic_AdanosBall(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_AdanosBall)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_AdanosBall()
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
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AdanosBall;
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