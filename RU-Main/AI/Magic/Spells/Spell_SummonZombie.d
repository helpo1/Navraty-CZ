
var int sumtime_z1;
var int sumtime_z2;

instance Spell_SummonZombie(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonZombie(var int manaInvested)
{
	if(SACTANOMEPROGRESS == TRUE)
	{
		SACTANOMEPROGRESS = FALSE;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Что-то мешает это сделать...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonZombie)
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

func void Spell_Cast_SummonZombie()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(SACTANOMEPROGRESS == TRUE)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			if(self.attribute[ATR_MANA] >= SPL_COST_SCROLL3)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_COST_SCROLL3 * 2);
			};
		}
		else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonZombie)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonZombie;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_Cost_SummonZombie * 2);
		};

		SACTANOMEPROGRESS = FALSE;
	}
	else if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonZombie;
	};
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			Wld_SpawnNpcRange(self,Summoned_ZOMBIE,1,500);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 2)
		{
			Wld_SpawnNpcRange(self,Summoned_ZOMBIE,1,500);
		}
		else
		{
			B_Say(self,self,"$DONTWORK");
			if(SACTANOMEPROGRESS != TRUE)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonZombie;
			}
			else if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_COST_SCROLL3 * 2);
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_SummonZombie * 2);
			};
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Zombie01,1,700);
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

