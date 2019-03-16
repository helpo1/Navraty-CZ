
instance SPELL_BELIARRUNE(C_Spell_Proto)
{
	time_per_mana = 0;

	if(NUMBERBELIARRUNE == FALSE)
	{
		if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG06 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_06;
		}
		else if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG05 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_05;
		}
		else if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG04 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_04;
		}
		else if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG03 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_03;
		}
		else if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG02 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_02;
		}
		else if((BeliarsWeaponUpgrated == TRUE) && (BELIARWEAPUPG01 == TRUE))
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_01;
		}
		else
		{
			damage_per_level = SPL_DAMAGE_BELIARSRUNE_01;
		};
	}
	else if(NUMBERBELIARRUNE == TRUE)
	{
		damage_per_level = SPL_DAMAGE_SUPERBELIARSRUNE;
	};
	damagetype = DAM_MAGIC;
};


func int spell_logic_beliarrune(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if((NUMBERBELIARRUNE == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_SUPER))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG06 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_06))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG05 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_05))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG04 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_04))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG03 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_03))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG02 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_02))
	{
		return SPL_SENDCAST;
	}
	else if((BELIARWEAPUPG01 == TRUE) && (self.attribute[ATR_MANA] >= SPL_COST_BELIARSRUNE_01))
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_beliarrune()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else if(NUMBERBELIARRUNE == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_SUPER;
	}
	else if(BELIARWEAPUPG06 == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_06;
	}
	else if(BELIARWEAPUPG05 == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_05;
	}
	else if(BELIARWEAPUPG04 == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_04;
	}
	else if(BELIARWEAPUPG03 == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_03;
	}
	else if(BELIARWEAPUPG02 == TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_02;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BELIARSRUNE_01;
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

