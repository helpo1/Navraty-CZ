instance Spell_Transform(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	canTurnDuringInvest = 0;
};

func int Spell_Logic_TrfSheep(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
			Npc_SetActiveSpellInfo(self,Zombie_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,Zombie02);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfScavenger(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfScavenger;
			Npc_SetActiveSpellInfo(self,Bloodfly);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneBloodfly)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneBloodfly;
			Npc_SetActiveSpellInfo(self,Bloodfly_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfGiantBug(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantBug;
			Npc_SetActiveSpellInfo(self,StoneGolem_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,StoneGolem);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWolf(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWolf;
			Npc_SetActiveSpellInfo(self,Wolf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,Wolf);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWaran(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWaran;
			Npc_SetActiveSpellInfo(self,Waran);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneWaran)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneWaran;
			Npc_SetActiveSpellInfo(self,Waran);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfSnapper(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
			Npc_SetActiveSpellInfo(self,Snapper_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,Snapper);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfWarg(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;
			Npc_SetActiveSpellInfo(self,Warg_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneWarg)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneWarg;
			Npc_SetActiveSpellInfo(self,Warg_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfFireWaran(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfFireWaran;
			Npc_SetActiveSpellInfo(self,FireWaran_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,FireWaran_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfLurker(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfLurker;
			Npc_SetActiveSpellInfo(self,Lurker);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,Lurker);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfShadowbeast(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
			Npc_SetActiveSpellInfo(self,Shadowbeast_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneShadowbeast)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneShadowbeast;
			Npc_SetActiveSpellInfo(self,Shadowbeast_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int Spell_Logic_TrfDragonSnapper(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfDragonSnapper;
			Npc_SetActiveSpellInfo(self,DragonSnapper_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneDragonSnapper)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneDragonSnapper;
			Npc_SetActiveSpellInfo(self,DragonSnapper_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};

func int spell_logic_trfmeatbug(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_COST_TRFMEATBUG)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFMEATBUG;
			Npc_SetActiveSpellInfo(self,Meatbug);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRune)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRune;
			Npc_SetActiveSpellInfo(self,Meatbug);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};


func int Spell_Logic_TrfTroll(var int manaInvested)
{
	var C_Item EquipWeap;

	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Něco mi brání to udělat...");
		//B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfTroll)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfTroll;
			Npc_SetActiveSpellInfo(self,Troll_Trf);
			HeroTransScroll = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	}
	else
	{
	 	if(self.attribute[ATR_MANA] >= SPL_Cost_TrfRuneTroll)
		{
			HeroTransOpen = TRUE;
			//AI_UnequipWeapons(self);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfRuneTroll;
			Npc_SetActiveSpellInfo(self,Dragon_Rune);
			HEROTRANSRUNE = TRUE;
			return SPL_SENDCAST;
		}
		else
		{
			return SPL_SENDSTOP;
		};
	};

	return SPL_SENDSTOP;
};