
var int guardsumtime_1;
var int guardsumtime_2;

instance Spell_SummonGuardian(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGuardian(var int manaInvested)
{
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Что-то мешает это сделать...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGuardian)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_SummonGuardian()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGuardian;
	};
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 3)
		{
			Wld_SpawnNpcRange(self,Summoned_Guardian,1,500);
		}
		else
		{
			B_Say(self,self,"$DONTWORK");
			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonGuardian;
			};
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Stoneguardian,1,500);
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

