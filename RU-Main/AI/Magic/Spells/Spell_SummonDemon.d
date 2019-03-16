
var int sumtime_d1;
var int sumtime_d;

instance Spell_SummonDemon(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonDemon(var int manaInvested)
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
	if(Npc_IsPlayer(self))
	{
		if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			AI_PrintClr("Это не сработает...",177,58,17);
			//B_Say(self,self,"$DONTREADYFORTHIS");
			return SPL_SENDSTOP;
		};
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonDemon)
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

func void Spell_Cast_SummonDemon()
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
		else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonDemon)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonDemon;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_Cost_SummonDemon * 2);
		};
		SACTANOMEPROGRESS = FALSE;
	}
	else if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonDemon;
	};
	if(Npc_IsPlayer(self))
	{
		if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,500);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 0))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 1))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 2))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_01,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 3))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_02,1,1000);
			}
			else
			{
				B_Say(self,self,"$DONTWORK");

				if(SACTANOMEPROGRESS != TRUE)
				{
					self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonDemon;
				}
				else if(Npc_GetActiveSpellIsScroll(self))
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_COST_SCROLL4 * 2);
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_SummonDemon * 2);
				};
			};
		}
		else if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == TRUE))
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,500);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 0))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 1))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 2))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_01,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 3))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_02,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 4))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 5))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord_Up_01,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 6))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord_Up_02,1,1000);
			}
			else
			{
				B_Say(self,self,"$DONTWORK");

				if(SACTANOMEPROGRESS != TRUE)
				{
					self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonDemon;
				}
				else if(Npc_GetActiveSpellIsScroll(self))
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_COST_SCROLL4 * 2);
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_SummonDemon * 2);
				};
			};
		}
		else if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == TRUE))
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,500);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 0))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Low,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 1))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 2))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_01,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 3))
			{
				Wld_SpawnNpcRange(self,Summoned_Demon_Up_02,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 4))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 5))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord_Up_01,1,1000);
			}
			else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && (DemonologSkill[0] == 6))
			{
				Wld_SpawnNpcRange(self,Summoned_DemonLord_Up_02,1,1000);
			}
			else
			{
				B_Say(self,self,"$DONTWORK");

				if(SACTANOMEPROGRESS != TRUE)
				{
					self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + SPL_Cost_SummonDemon;
				}
				else if(Npc_GetActiveSpellIsScroll(self))
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_COST_SCROLL4 * 2);
				}
				else
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (SPL_Cost_SummonDemon * 2);
				};
			};
		}
		else
		{
			AI_Print("Ничего не произошло...");
			CreateInvItems(hero,ItMi_RuneBlank,1);
			Snd_Play("MFX_MASSDEATH_CAST");
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Demon,1,1000);
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

