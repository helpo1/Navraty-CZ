
instance Spell_PalHeal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

func int Spell_Logic_PalLightHeal(var int manaInvested)
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalLightHeal)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_PAL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_PalMediumHeal(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll2))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalMediumHeal)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_PAL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_PalFullHeal(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalFullHeal)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_PAL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_PalHeal()
{
	if(Npc_GetActiveSpell(self) == SPL_PalLightHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLightHeal;
		};

		Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalMediumHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll2;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalMediumHeal;
		};

		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PalFullHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll3;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalFullHeal;
		};

		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		return;
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


//----------------------khil Strazha------------------------------

instance SPELL_TPLHEAL(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

func int spell_logic_tpllightheal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLLIGHTHEAL)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int spell_logic_tplmediumheal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLMEDIUMHEAL)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int spell_logic_tplheavyheal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLHEAVYHEAL)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int spell_logic_tplsuperheal(var int manaInvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_TPLSUPERHEAL)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_TPL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void spell_cast_tplheal()
{
	var int TempHeal;

	if(Npc_GetActiveSpell(self) == SPL_TPLLIGHTHEAL)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLLIGHTHEAL;

		TempHeal = self.attribute[ATR_HITPOINTS_MAX] / 4;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,TempHeal);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{	
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_TPLMEDIUMHEAL)
	{
		Wld_PlayEffect("SPELLFX_WHIRLWIND_TARGET",self,self,0,0,0,FALSE);
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLMEDIUMHEAL;

		TempHeal = self.attribute[ATR_HITPOINTS_MAX] / 2;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,TempHeal);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{	
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_TPLHEAVYHEAL)
	{
		Wld_PlayEffect("SPELLFX_SLEEP_TARGET",self,self,0,0,0,FALSE);
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLHEAVYHEAL;

		TempHeal = (self.attribute[ATR_HITPOINTS_MAX] / 2) + (self.attribute[ATR_HITPOINTS_MAX] / 4);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,TempHeal);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{	
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_TPLSUPERHEAL)
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TPLSUPERHEAL;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		HeroNoCC = TRUE;
		return;
	};

	self.aivar[AIV_SelectSpell] += 1;
};


//----------------------obychnyy khil------------------------------

instance Spell_Heal(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
};

func int Spell_Logic_LightHeal(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_MediumHeal(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL2))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_FullHeal(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_Heal()
{
	var int TempHeal;

	if(Npc_GetActiveSpell(self) == SPL_LightHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LightHeal;
		};

		TempHeal = self.attribute[ATR_HITPOINTS_MAX] / 2;
		Npc_ChangeAttribute(self,ATR_HITPOINTS,TempHeal);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{	
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_MediumHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL2;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MediumHeal;
		};

		POISONED = FALSE;
		POISONED_TIC = FALSE;
		CanPoisonMe = FALSE;
		MM_Poison_01_Up = FALSE;
		MM_Poison_02_Up = FALSE;
		MM_Poison_03_Up = FALSE;
		TimerPoisonUpTic = FALSE;
		TimerPoisonUp = FALSE;
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
		TempPlayerIsWeakness = FALSE;
		PlayerIsWeakness = FALSE;
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_FullHeal)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_FullHeal;
		};

		ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		return;
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
