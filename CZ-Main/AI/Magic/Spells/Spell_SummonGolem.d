
var int sumtime_gg_1;
var int sumtime_gg_2;

instance Spell_SummonGolem(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGolem(var int manaInvested)
{
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGolem)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_SummonGolem()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGolem;
	};
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 3)
		{
			Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
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
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonGolem;
			};
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,StoneGolem,1,500);
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

