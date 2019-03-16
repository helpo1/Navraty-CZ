
instance Spell_Deathball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathball;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Deathball(var int manaInvested)
{
	if(SACTANOMEPROGRESS == TRUE)
	{
		SACTANOMEPROGRESS = FALSE;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_Deathball)
	{
		return SPL_SENDCAST;
	}
	else if(Npc_IsPlayer(self) && (XARDAS_KNOWSSACTANOME == TRUE) && (SACTANOMEPROGRESS == FALSE))
	{
		SACTANOMEPROGRESS = TRUE;
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Deathball()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(SACTANOMEPROGRESS == TRUE)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			if(self.attribute[ATR_MANA] >= SPL_COST_SCROLL4)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_COST_SCROLL4 * 2);
			};
		}
		else if(self.attribute[ATR_MANA] >= SPL_COST_Deathball)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Deathball;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_COST_Deathball * 2);
		};

		SACTANOMEPROGRESS = FALSE;
	}
	else if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Deathball;
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

