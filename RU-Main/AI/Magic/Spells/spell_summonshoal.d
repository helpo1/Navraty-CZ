
var int sumtime_iw_1;
var int sumtime_iw_2;

instance SPELL_SUMMONSHOAL(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonshoal(var int manaInvested)
{
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
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONSHOAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_summonshoal(var int spellLevel)
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONSHOAL;
	};
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			Wld_SpawnNpcRange(self,icewolf_summoned,3,500);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 2)
		{
			Wld_SpawnNpcRange(self,icewolf_summoned,3,500);
		}
		else
		{
			B_Say(self,self,"$DONTWORK");

			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_COST_SCROLL3;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_COST_SUMMONSHOAL;
			};
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Icewolf,3,600);
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

