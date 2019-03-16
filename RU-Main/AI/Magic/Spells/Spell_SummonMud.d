
instance Spell_SummonMud(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func void b_printteleporttoofaraways(var int level)
{
	if(level != CurrentLevel)
	{
		AI_Print(PRINT_TeleportTooFarAway);
	};
};

func int Spell_Logic_SummonMud(var int manaInvested)
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
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_SummonMud()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_IsPlayer(self))
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
			};
			if(ALLGUARDIANSKILLED == FALSE)
			{
				AI_Teleport(hero,"NW_GUARDIANS_CHAMBER");
				Wld_SetTime(20,0);
			}
			else
			{
				AI_Print(PRINT_TeleportTooFarAway);
				B_Say(self,self,"$DONTWORK");
			};
		}
		else if(CurrentLevel == DRAGONISLAND_ZEN)
		{
			if(Npc_GetActiveSpellIsScroll(self))
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
			}
			else
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
			};
			if(DAGOTTELLALL == TRUE)
			{
				AI_Teleport(hero,"WP_UNDEAD_CENTER_01");
				AI_Print(PRINT_TeleportTooFarAway);
			}
			else
			{
				B_Say(self,self,"$DONTWORK");
			};
		}
		else
		{
			AI_Print(PRINT_TeleportTooFarAway);
			B_Say(self,self,"$DONTWORK");
		};
	}
	else
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
		};
		AI_Teleport(self,"TOT");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	};
};

instance Spell_SummonCrait(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonCrait(var int manaInvested)
{
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Что-то мешает это сделать...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		B_Say(self,self,"$CANTREADTHIS");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_TrfRune))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
	{
		return SPL_SENDCAST;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_SummonCrait()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
	};
	if(Npc_IsPlayer(self))
	{
		if(CraitIsUp == FALSE)
		{
			Wld_SpawnNpcRange(self,Crait,1,500);
			CraitIsUp = TRUE;
			CraitCanUp = TRUE;

			if(CraitSumFT == FALSE)
			{
				CraitSumFT = TRUE;
			};
		}
		else
		{
			Wld_PlayEffect("spellFX_INCOVATION_RED",Crait,Crait,0,0,0,FALSE);
			AI_Wait(Crait,1);
			AI_Teleport(Crait,"TOT");
			CraitIsUp = FALSE;
			KillCrait = TRUE;
			CraitCanUp = FALSE;
		};
	};

	self.aivar[AIV_SelectSpell] += 1;
};