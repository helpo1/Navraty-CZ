
var int sumtime;
var int sumtime_1;
var int sumtime_2;

instance Spell_SummonGoblinSkeleton(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int Spell_Logic_SummonGoblinSkeleton(var int manaInvested)
{
	if(SACTANOMEPROGRESS == TRUE)
	{
		SACTANOMEPROGRESS = FALSE;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinSkeleton)
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

func void Spell_Cast_SummonGoblinSkeleton()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(SACTANOMEPROGRESS == TRUE)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			if(self.attribute[ATR_MANA] >= SPL_Cost_Scroll)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_Cost_Scroll * 2);
			};
		}
		else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinSkeleton)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGoblinSkeleton;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_Cost_SummonGoblinSkeleton * 2);
		};
		SACTANOMEPROGRESS = FALSE;
	}
	else if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else if(SACTANOMEPROGRESS != TRUE)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonGoblinSkeleton;
	};
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1)
		{
			Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
		}
		else
		{
			B_Say(self,self,"$DONTWORK");
			if(SACTANOMEPROGRESS != TRUE)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonGoblinSkeleton;
			}
			else if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_Scroll * 2);
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_SummonGoblinSkeleton * 2);
			};
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Lesser_Skeleton,1,500);
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

