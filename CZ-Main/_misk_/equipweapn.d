/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(13x) CZ TELEPORTY - nově přidané teleporty

*/



var C_Item EQUIPWEAPN;

func void B_PrintTeleportTooFarAway(var int level)
{
	if(level != CurrentLevel)
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(self,self,"$DONTWORK");
	};
};

//---------------logika teleportov-----------------------------

instance Spell_Teleport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};

instance Spell_teleportorc(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_GOOD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

//---------------Kvestovyye runy-----------------------------

func int Spell_Logic_PalTeleportSecret(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
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

func void Spell_Cast_PalTeleportSecret()
{
	B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
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
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
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
	AI_Teleport(self,"NW_PAL_SECRETCHAMBER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int Spell_Logic_TeleportMonastery(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
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

func void Spell_Cast_TeleportMonastery()
{
	B_PrintTeleportTooFarAway(NEWWORLD_ZEN);
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
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	if(self.id != 0)
	{
		AI_Teleport(self,"KLOSTER");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	};
};

func int spell_logic_teleportdagot(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
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

func void spell_cast_teleportdagot()
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
			AI_Teleport(hero,"NW_GUARDIANS_CHAMBER");
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
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
			AI_Teleport(hero,"WP_UNDEAD_CENTER_01");
			AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		}
		else
		{
			AI_Print(PRINT_TeleportTooFarAway);
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
};

func int spell_logic_teleportorc(var int manaInvested)
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
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

func void spell_cast_teleportorc()
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
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		AI_Teleport(self,"OW_ORCCITY_ENTRANCE");
	}
	else if(CurrentLevel == ORCCITY_ZEN)
	{
		AI_Teleport(self,"ORC_CITY_21");
	}
	else if(CurrentLevel == ORCOREMINE_ZEN)
	{
		AI_Teleport(self,"OM_LEVEL_03_WAY_UP_10");
	}
	else if(CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if(ORCTELEPORTSTATUS == FALSE)
		{
			AI_Teleport(self,"GRYD_072");
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
			ORCTELEPORTSTATUS = TRUE;
		}
		else if(ORCTELEPORTSTATUS == TRUE)
		{
			AI_Teleport(self,"GRYD_060");
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
			ORCTELEPORTSTATUS = FALSE;
		};
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
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
};

//----------------------staryye runy-----------------------------------------

func int Spell_Logic_TeleportFarm(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportFarm()
{
};

func int Spell_Logic_TeleportPassNW(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportPassNW()
{
};

func int Spell_Logic_TeleportPassOW(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportPassOW()
{
};

func int Spell_Logic_TeleportOC(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportOC()
{
};

func int Spell_Logic_TeleportOWDemonTower(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportOWDemonTower()
{
};

func int Spell_Logic_TeleportTaverne(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportTaverne()
{
};

func int spell_logic_teleportpsicamp(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void spell_cast_teleportpsicamp()
{
};


//----------------novaya sistema------------------------------------------------

func int Spell_Logic_TeleportXardas(var int manaInvested)
{
	if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
	{
		B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return SPL_SENDSTOP;
	};
	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
		Print("Něco mi brání to udělat...");
		B_Say(self,self,"$DOESNTWORK");
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

func void Spell_Cast_TeleportXardas()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if((Kapitel >= 3) && (MeetDarkRavenSpeaker == FALSE) && (CurrentLevel == NEWWORLD_ZEN))
	{
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
		if(self.id == 0)
		{
			TeleportCheck = TRUE;
			AI_ProcessInfos(self);
		};
	};
};

func void Spell_Cast_Teleport()
{
	if(Npc_GetActiveSpell(self) == SPL_PalTeleportSecret)
	{
		Spell_Cast_PalTeleportSecret();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportSeaport)
	{
		Spell_Cast_TeleportSeaport();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportMonastery)
	{
		Spell_Cast_TeleportMonastery();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportFarm)
	{
		Spell_Cast_TeleportFarm();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportXardas)
	{
		Spell_Cast_TeleportXardas();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassNW)
	{
		Spell_Cast_TeleportPassNW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportPassOW)
	{
		Spell_Cast_TeleportPassOW();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOC)
	{
		Spell_Cast_TeleportOC();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)
	{
		Spell_Cast_TeleportOWDemonTower();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTDAGOT)
	{
		spell_cast_teleportdagot();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTORC)
	{
		spell_cast_teleportorc();
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPSICAMP)
	{
		spell_cast_teleportpsicamp();
	};
	if(Npc_GetActiveSpell(self) == SPL_TeleportTaverne)
	{
		Spell_Cast_TeleportTaverne();
	};
};

instance PC_TELEPORT_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_TELEPORT_end_condition;
	information = PC_TELEPORT_end_info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_TELEPORT_end_condition()
{
	if(TeleportCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_TELEPORT_end_info()
{
	TeleportCheck = FALSE;
	AI_StopProcessInfos(self);
};

instance PC_TELEPORTLOCATION_ON(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_TELEPORTLOCATION_ON_condition;
	information = PC_TELEPORTLOCATION_ON_info;
	permanent = TRUE;
	description = "Teleportovat se do jiné části ostrova... (40 bodů many)";
};

func int PC_TELEPORTLOCATION_ON_condition()
{
	if(TeleportCheck == TRUE)
	{
		if((MeetDarkRavenSpeaker == FALSE) && (MIS_ReadyForChapter3 == TRUE))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
};

func void PC_TELEPORTLOCATION_ON_info()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if((CurrentLevel != NEWWORLD_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((VINOCAVE_TP == TRUE) || (SAGITTA_TP == TRUE) || (SUNCIRCLE_TP == TRUE) || (BLACKTROLL_TP == TRUE) || (ADWRUINS_TP == TRUE) || (PSI_TP == TRUE) || (HUNT_TP == TRUE) || (TAVERNE_TP == TRUE) || (PASSOW_TP == TRUE) || (KLOSTER_TP == TRUE) || (BIGFARM_TP == TRUE) || (TOWN_TP == TRUE) || (XARDAS_TP == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do Khorinisu",PC_TELEPORTLOCATION_ON_HOR);			
		};
	};
	if((CurrentLevel != ADDONWORLD_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((ADW_TP == TRUE) || (PIRATCAMP_TP == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do Jharkendaru",PC_TELEPORTLOCATION_ON_ADW);			
		};
	};
	if((CurrentLevel != OLDWORLD_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((SKLEP_TP == TRUE) || (PASSNW_TP == TRUE) || (OLDPSI_TP == TRUE) || (OLDFORT_TP == TRUE) || (DARKTOWER_TP == TRUE) || (ICE_TP == TRUE) || (NETBEK_TP == TRUE) || (CASTLE_TP == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do Hornického údolí",PC_TELEPORTLOCATION_ON_OW);			
		};
	};
	if((CurrentLevel != ADANOSVALLEY_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((COMPLEX_TP == TRUE) || (LIFECIRCLE_TP == TRUE) || (PASSAV_TP == TRUE) || (PYRAMIDE_TP == TRUE) || (TEARHRAM_TP == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... na Prastarou plošinu",PC_TELEPORTLOCATION_ON_AV);			
		};
	};	
	if((CurrentLevel != ORCMOUNTAIN_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if(ORCMOUNTAIN_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do skřetích hor",PC_TELEPORTLOCATION_ON_ORM);			
		};
	};	



	/*     // ----- CZ TELEPORTY ----- \\     */

	if((CurrentLevel != PALADINFORT_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((VarusMeet == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do pevnosti Azgan",PC_TELEPORTLOCATION_ON_PALADINFORT_CZ);			
		};
	};
	if((CurrentLevel != DEADGROT_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((Npc_KnowsInfo(hero,DIA_KREOL_HELLO) == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do Zamlžené věže",PC_TELEPORTLOCATION_ON_DEADGROT_CZ);			
		};
	};
	if((CurrentLevel != ORCCITY_ZEN) && (CurrentLevel != ITUSELDTOWER_ZEN) && (CurrentLevel != LOSTVALLEY_ZEN) && (CurrentLevel != DRAGONTEMPLE_ZEN) && (CurrentLevel != PASHALWORLD_ZEN) && (CurrentLevel != HAOSWORLD_ZEN) && (CurrentLevel != PRIORATWORLD_ZEN) && (CurrentLevel != DRAGONISLAND_ZEN) && (CurrentLevel != SHVALLEY_ZEN) && (CurrentLevel != SECRETISLAND_ZEN) && (CurrentLevel != UNDEADZONE_ZEN) && (CurrentLevel != LOSTISLAND_ZEN) && (CurrentLevel != FIRECAVE_ZEN) && (CurrentLevel != GUARDIANCHAMBERS_ZEN) && (CurrentLevel != HARADRIMARENA_ZEN) && (CurrentLevel != TEARSTEMPLE_ZEN))
	{
		if((PASSORKCHAMBER == TRUE) || (Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Hello) == TRUE) || (CanEnterOrcMine == TRUE) || (UrTrallOkShv == TRUE))
		{
			Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do skřetího města",PC_TELEPORTLOCATION_ON_ORCCITY_CZ);			
		};
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */



	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_BACK()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);
};

func void PC_TELEPORTLOCATION_ON_ADW()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(ADW_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k poustevníkově chýši",PC_TELEPORTLOCATION_ON_OLDHOUSE);
	};
	if(PIRATCAMP_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do tábora pirátů",PC_TELEPORTLOCATION_ON_PIRATCAMP);
	};

	/*     // ----- CZ TELEPORTY ----- \\     */

	if(Npc_KnowsInfo(hero,DIA_Addon_Saturas_ADWStart) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] na teleportační náměstí",PC_TELEPORTLOCATION_ON_ADW_TELEPORTSQUARE_CZ);			
	};
	if(DRAGONGOLDMEET == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] ke zlatému drakovi",PC_TELEPORTLOCATION_ON_ADW_GOLDDRAGON_CZ);			
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_HOR()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(VINOCAVE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do západního lesa",PC_TELEPORTLOCATION_ON_VINOCAVE);
	};
	if(SAGITTA_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k Sagittině jeskyni",PC_TELEPORTLOCATION_ON_SAGITTA);
	};
	if(SUNCIRCLE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke kruhu Slunce",PC_TELEPORTLOCATION_ON_SUNCIRCLE);
	};
	if(BLACKTROLL_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k doupěti černého trola",PC_TELEPORTLOCATION_ON_BLACKTROLL);
	};
	if(ADWRUINS_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k vykopávkám mágů Vody",PC_TELEPORTLOCATION_ON_ADWRUINS);
	};
	if(PSI_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do tábora Bratrstva",PC_TELEPORTLOCATION_ON_PSI);
	};
	if(HUNT_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do tábora lovců",PC_TELEPORTLOCATION_ON_HUNT);
	};
	if(TAVERNE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k hostinci 'U Mrtvé harpyje'",PC_TELEPORTLOCATION_ON_TAVERNE);
	};
	if(PASSOW_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k průsmyku do Hornického údolí",PC_TELEPORTLOCATION_ON_PASSOW);
	};
	if(KLOSTER_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do Innosova kláštera",PC_TELEPORTLOCATION_ON_KLOSTER);
	};
	if(BIGFARM_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... na Onarovu farmu",PC_TELEPORTLOCATION_ON_BIGFARM);
	};
	if(TOWN_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k východní bráně města Khorinis",PC_TELEPORTLOCATION_ON_TOWN);
	};
	if(XARDAS_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke Xardasově věži",PC_TELEPORTLOCATION_ON_XARDAS);
	};

	/*     // ----- CZ TELEPORTY ----- \\     */

	if(Npc_KnowsInfo(hero,DIA_Lothar_Hallo) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] k jižní bráně města Khorinis",PC_TELEPORTLOCATION_ON_NW_DOWNTOWN_CZ);			
	};
	if((Npc_KnowsInfo(hero,DIA_Lares_HALLO) == TRUE) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do přístavu",PC_TELEPORTLOCATION_ON_NW_HAFEN_CZ);			
	};
	if(PasswordSet == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do tábora Atros",PC_TELEPORTLOCATION_ON_NW_ATROS_CZ);			
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_OW()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(SKLEP_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k opuštěné kryptě",PC_TELEPORTLOCATION_ON_SKLEP);
	};
	if(OLDPSI_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k táboru Bratrstva Spáče",PC_TELEPORTLOCATION_ON_OLDPSI);
	};
	if(OLDFORT_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke zničené pevnosti",PC_TELEPORTLOCATION_ON_OLDFORT);
	};
	if(DARKTOWER_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke Xardasově staré věži",PC_TELEPORTLOCATION_ON_DARKTOWER);
	};
	if(ICE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k průchodu do Nového tábora",PC_TELEPORTLOCATION_ON_ICE);
	};
	if(NETBEK_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... do zničeného kláštera",PC_TELEPORTLOCATION_ON_NETBEK);
	};
	if(PASSNW_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k průsmyku do Khorinisu",PC_TELEPORTLOCATION_ON_PASSNW);
	};
	if(CASTLE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... na hrad rudobaronů",PC_TELEPORTLOCATION_ON_CASTLE);
	};

	/*     // ----- CZ TELEPORTY ----- \\     */

	if(Npc_KnowsInfo(hero,DIA_ORC_8552_WATCHER_HELLO) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] ke skřetímu městu",PC_TELEPORTLOCATION_ON_OW_ORCCITY_CZ);			
	};
	if((ORCTEMPLEONETIME == TRUE) || (ORCTEMPLEGATEOPENED == TRUE))
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] ke Spáčovu chrámu",PC_TELEPORTLOCATION_ON_OW_SLEEPERTEMPLE_CZ);			
	};
	if(Npc_KnowsInfo(hero,XBS_7513_DARRION_HI) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do Darrionovy kovárny",PC_TELEPORTLOCATION_ON_OW_DARRION_CZ);			
	};
	if(Npc_KnowsInfo(hero,DIA_NagShor_Hello) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do skřetího klanu Vysoké skály",PC_TELEPORTLOCATION_ON_OW_HIGHROCK_CZ);			
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_AV()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(COMPLEX_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... na chrámové náměstí",PC_TELEPORTLOCATION_ON_COMPLEX);
	};
	if(LIFECIRCLE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke Kruhu života",PC_TELEPORTLOCATION_ON_LIFECIRCLE);
	};
	if(PASSAV_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k průchodu na Prastarou plošinu",PC_TELEPORTLOCATION_ON_PASSAV);
	};
	if(PYRAMIDE_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... ke Chrámu pravdy",PC_TELEPORTLOCATION_ON_PYRAMIDE);
	};
	if(TEARHRAM_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k Oltáři slz",PC_TELEPORTLOCATION_ON_TEARHRAM);
	};

	/*     // ----- CZ TELEPORTY ----- \\     */

	if(Npc_KnowsInfo(hero,DIA_Dragon_AV_HELLO) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] k Er'Khazirově hrobce",PC_TELEPORTLOCATION_ON_ADV_ERHAZIR_CZ);			
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_ORM()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(ORCMOUNTAIN_TP == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... k runovému kameni",PC_TELEPORTLOCATION_ON_ORCMOUNTAIN);
	};

	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};



/*     // ----- CZ TELEPORTY ----- \\     */

func void PC_TELEPORTLOCATION_ON_PALADINFORT_CZ()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(VarusMeet == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do pevnosti Azgan",PC_TELEPORTLOCATION_ON_PF_AZGAN_CZ);
	};
	
	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_DEADGROT_CZ()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(Npc_KnowsInfo(hero,DIA_KREOL_HELLO) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] k nekromantovi",PC_TELEPORTLOCATION_ON_DG_CREOL_CZ);
	};
	
	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

func void PC_TELEPORTLOCATION_ON_ORCCITY_CZ()
{
	Info_ClearChoices(PC_TELEPORTLOCATION_ON);

	if(PASSORKCHAMBER == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] ke skřetímu vůdci",PC_TELEPORTLOCATION_ON_OC_URTHRALL_CZ);
	};
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Hello) == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do skřetí arény",PC_TELEPORTLOCATION_ON_OC_ARENA_CZ);
	};
	if(CanEnterOrcMine == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] do skřetího dolu",PC_TELEPORTLOCATION_ON_OC_ORCMINE_CZ);
	};
	if(UrTrallOkShv == TRUE)
	{
		Info_AddChoice(PC_TELEPORTLOCATION_ON,"... [!] k portálu do Údolí stínů",PC_TELEPORTLOCATION_ON_OC_SHVENTRANCE_CZ);
	};
	
	Info_AddChoice(PC_TELEPORTLOCATION_ON,DIALOG_BACK,PC_TELEPORTLOCATION_ON_BACK);
};

/*     \\ ----- CZ TELEPORTY ----- //     */



func void PC_TELEPORTLOCATION_ON_OLDHOUSE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PIRATCAMP()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PIRATCAMP_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ORCMOUNTAIN()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ORCMOUNTAIN_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_XARDAS()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LOC_XARDAS_TP_OK = TRUE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_XARDAS_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TOWN()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TOWN_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TAVERNE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TAVERNE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PSI()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PSI_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSOW()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSOW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_BIGFARM()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_BIGFARM_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_KLOSTER()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_KLOSTER_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SAGITTA()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SAGITTA_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_HUNT()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_HUNT_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_VINOCAVE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LOC_VINOCAVE_TP_OK = TRUE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_VINOCAVE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SUNCIRCLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SUNCIRCLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ADWRUINS()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADWRUINS_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_BLACKTROLL()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_BLACKTROLL_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_CASTLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_CASTLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ICE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ICE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SKLEP()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SKLEP_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_DARKTOWER()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_DARKTOWER_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OLDFORT()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OLDFORT_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OLDPSI()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OLDPSI_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 4040 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_NETBEK()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_NETBEK_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSNW()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSNW_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_TEARHRAM()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_TEARHRAM_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PYRAMIDE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PYRAMIDE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PASSAV()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PASSAV_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_LIFECIRCLE()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_LIFECIRCLE_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_COMPLEX()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_COMPLEX_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};



/*     // ----- CZ TELEPORTY ----- \\     */

func void PC_TELEPORTLOCATION_ON_ADV_ERHAZIR_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADV_ERHAZIR_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ADW_TELEPORTSQUARE_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADW_TELEPORTSQUARE_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_ADW_GOLDDRAGON_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_ADW_GOLDDRAGON_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_NW_DOWNTOWN_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_NW_DOWNTOWN_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_NW_HAFEN_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_NW_HAFEN_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_NW_ATROS_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_NW_ATROS_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_PF_AZGAN_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_PF_AZGAN_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_DG_CREOL_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_DG_CREOL_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OW_ORCCITY_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OW_ORCCITY_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OW_SLEEPERTEMPLE_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OW_SLEEPERTEMPLE_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OW_DARRION_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OW_DARRION_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OW_HIGHROCK_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OW_HIGHROCK_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OC_URTHRALL_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OC_URTHRALL_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OC_ARENA_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OC_ARENA_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OC_ORCMINE_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OC_ORCMINE_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_OC_SHVENTRANCE_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_OC_SHVENTRANCE_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

/*

func void PC_TELEPORTLOCATION_ON_SHV_OCPORTAL_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SHV_OCPORTAL_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SHV_HUMANCAMP_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SHV_HUMANCAMP_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SHV_ORCCAMP_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SHV_ORCCAMP_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

func void PC_TELEPORTLOCATION_ON_SHV_AZGALOR_CZ()
{
	var string concatText;
	var int tmpMissMana;

	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TeleportCheck = FALSE;

	if(self.attribute[ATR_MANA] >= 40)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 40;
		LOC_SHV_AZGALOR_CZ_TP_OK = TRUE;
	}
	else
	{
		tmpMissMana = 40 - self.attribute[ATR_MANA];
		concatText = ConcatStrings("Chybí ",IntToString(tmpMissMana));
		concatText = ConcatStrings(concatText," bodů many...");
		AI_PrintClr(concatText,177,58,17);
	};
};

*/

/*     \\ ----- CZ TELEPORTY ----- //     */



instance PC_TELEPORT_ON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_TELEPORT_ON_condition;
	information = PC_TELEPORT_ON_info;
	permanent = TRUE;
	description = "Teleportovat se...";
};

func int PC_TELEPORT_ON_condition()
{
	if(TeleportCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_TELEPORT_ON_info()
{
	Info_ClearChoices(PC_TELEPORT_ON);

	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(VINOCAVE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do západního lesa",PC_TELEPORT_ON_VINOCAVE);
		};
		if(SAGITTA_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k Sagittině jeskyni",PC_TELEPORT_ON_SAGITTA);
		};
		if(SUNCIRCLE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke kruhu Slunce",PC_TELEPORT_ON_SUNCIRCLE);
		};
		if(BLACKTROLL_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k doupěti černého trola",PC_TELEPORT_ON_BLACKTROLL);
		};
		if(ADWRUINS_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k vykopávkám mágů Vody",PC_TELEPORT_ON_ADWRUINS);
		};
		if(PSI_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do tábora Bratrstva",PC_TELEPORT_ON_PSI);
		};
		if(HUNT_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do tábora lovců",PC_TELEPORT_ON_HUNT);
		};
		if(TAVERNE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k hostinci 'U Mrtvé harpyje'",PC_TELEPORT_ON_TAVERNE);
		};
		if(PASSOW_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k průsmyku do Hornického údolí",PC_TELEPORT_ON_PASSOW);
		};
		if(KLOSTER_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do Innosova kláštera",PC_TELEPORT_ON_KLOSTER);
		};
		if(BIGFARM_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... na Onarovu farmu",PC_TELEPORT_ON_BIGFARM);
		};
		if(TOWN_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k východní bráně města Khorinis",PC_TELEPORT_ON_TOWN);
		};
		if(XARDAS_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke Xardasově věži",PC_TELEPORT_ON_XARDAS);
		};

		/*     // ----- CZ TELEPORTY ----- \\     */

		if(Npc_KnowsInfo(hero,DIA_Lothar_Hallo) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] k jižní bráně města Khorinis",PC_TELEPORT_ON_NW_DOWNTOWN_CZ);			
		};
		if((Npc_KnowsInfo(hero,DIA_Lares_HALLO) == TRUE) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do přístavu",PC_TELEPORT_ON_NW_HAFEN_CZ);			
		};
		if(PasswordSet == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do tábora Atros",PC_TELEPORT_ON_NW_ATROS_CZ);			
		};

		/*     \\ ----- CZ TELEPORTY ----- //     */

	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(ADW_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k poustevníkově chýši",PC_TELEPORT_ON_ADW);
		};
		if(PIRATCAMP_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do tábora pirátů",PC_TELEPORT_ON_PIRATCAMP);
		};

		/*     // ----- CZ TELEPORTY ----- \\     */

		if(Npc_KnowsInfo(hero,DIA_Addon_Saturas_ADWStart) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] na teleportační náměstí",PC_TELEPORT_ON_ADW_TELEPORTSQUARE_CZ);			
		};
		if(DRAGONGOLDMEET == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] ke zlatému drakovi",PC_TELEPORT_ON_ADW_GOLDDRAGON_CZ);			
		};

		/*     \\ ----- CZ TELEPORTY ----- //     */

	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(SKLEP_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k opuštěné kryptě",PC_TELEPORT_ON_SKLEP);
		};
		if(OLDPSI_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k táboru Bratrstva Spáče",PC_TELEPORT_ON_OLDPSI);
		};
		if(OLDFORT_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke zničené pevnosti",PC_TELEPORT_ON_OLDFORT);
		};
		if(DARKTOWER_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke Xardasově staré věži",PC_TELEPORT_ON_DARKTOWER);
		};
		if(ICE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k průchodu do Nového tábora",PC_TELEPORT_ON_ICE);
		};
		if(NETBEK_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... do zničeného kláštera",PC_TELEPORT_ON_NETBEK);
		};
		if(PASSNW_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k průsmyku do Khorinisu",PC_TELEPORT_ON_PASSNW);
		};
		if(CASTLE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... na hrad rudobaronů",PC_TELEPORT_ON_CASTLE);
		};

		/*     // ----- CZ TELEPORTY ----- \\     */

		if(Npc_KnowsInfo(hero,DIA_ORC_8552_WATCHER_HELLO) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] ke skřetímu městu",PC_TELEPORT_ON_OW_ORCCITY_CZ);			
		};
		if((ORCTEMPLEONETIME == TRUE) || (ORCTEMPLEGATEOPENED == TRUE))
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] ke Spáčovu chrámu",PC_TELEPORT_ON_OW_SLEEPERTEMPLE_CZ);			
		};
		if(Npc_KnowsInfo(hero,XBS_7513_DARRION_HI) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do Darrionovy kovárny",PC_TELEPORT_ON_OW_DARRION_CZ);			
		};
		if(Npc_KnowsInfo(hero,DIA_NagShor_Hello) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do skřetího klanu Vysoké skály",PC_TELEPORT_ON_OW_HIGHROCK_CZ);			
		};

		/*     \\ ----- CZ TELEPORTY ----- //     */

	}
	else if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
		if(COMPLEX_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... na chrámové náměstí",PC_TELEPORT_ON_COMPLEX);
		};
		if(LIFECIRCLE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke Kruhu života",PC_TELEPORT_ON_LIFECIRCLE);
		};
		if(PASSAV_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k průchodu na Prastarou plošinu",PC_TELEPORT_ON_PASSAV);
		};
		if(PYRAMIDE_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... ke Chrámu pravdy",PC_TELEPORT_ON_PYRAMIDE);
		};
		if(TEARHRAM_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k Oltáři slz",PC_TELEPORT_ON_TEARHRAM);
		};

		/*     // ----- CZ TELEPORTY ----- \\     */

		if(Npc_KnowsInfo(hero,DIA_Dragon_AV_HELLO) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] k Er'Khazirově hrobce",PC_TELEPORT_ON_ADV_ERHAZIR_CZ);			
		};

		/*     \\ ----- CZ TELEPORTY ----- //     */

	}
	else if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
		if(ORCMOUNTAIN_TP == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... k runovému kameni",PC_TELEPORT_ON_ORCMOUNTAIN);
		};
	}



	/*     // ----- CZ TELEPORTY ----- \\     */

	else if(CurrentLevel == PALADINFORT_ZEN)
	{
		if(VarusMeet == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do pevnosti Azgan",PC_TELEPORT_ON_PF_AZGAN_CZ);
		};
	}
	else if(CurrentLevel == DEADGROT_ZEN)
	{
		if(Npc_KnowsInfo(hero,DIA_KREOL_HELLO) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] k nekromantovi",PC_TELEPORT_ON_DG_CREOL_CZ);
		};
	}
	else if(CurrentLevel == ORCCITY_ZEN)
	{
		if(PASSORKCHAMBER == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] ke skřetímu vůdci",PC_TELEPORT_ON_OC_URTHRALL_CZ);
		};
		if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Hello) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do skřetí arény",PC_TELEPORT_ON_OC_ARENA_CZ);
		};
		if(CanEnterOrcMine == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do skřetího dolu",PC_TELEPORT_ON_OC_ORCMINE_CZ);
		};
		if(UrTrallOkShv == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] k portálu do Údolí stínů",PC_TELEPORT_ON_OC_SHVENTRANCE_CZ);
		};
	}
	else if(CurrentLevel == SHVALLEY_ZEN)
	{
		if(UrTrallOkShv == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] k portálu do skřetího města",PC_TELEPORT_ON_SHV_OCPORTAL_CZ);
		};
		if(Npc_KnowsInfo(hero,DIA_DUGO_HELLO) == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do tábora lidí",PC_TELEPORT_ON_SHV_HUMANCAMP_CZ);
		};
		if(FIRSTVANHAN == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] do tábora skřetů",PC_TELEPORT_ON_SHV_ORCCAMP_CZ);
		};
		if(READ_AZGOLOR == TRUE)
		{
			Info_AddChoice(PC_TELEPORT_ON,"... [!] ke svatyni Velikého Stínu",PC_TELEPORT_ON_SHV_AZGALOR_CZ);
		};
	};

	/*     \\ ----- CZ TELEPORTY ----- //     */



	Info_AddChoice(PC_TELEPORT_ON,DIALOG_BACK,PC_TELEPORT_ON_BACK);
};

func void PC_TELEPORT_ON_BACK()
{
	Info_ClearChoices(PC_TELEPORT_ON);
};

func void PC_TELEPORT_ON_ADW()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PIRATCAMP()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PIRATCAMP_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ORCMOUNTAIN()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ORCMOUNTAIN_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_XARDAS()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	XARDAS_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TOWN()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TOWN_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TAVERNE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TAVERNE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PSI()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PSI_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSOW()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSOW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_BIGFARM()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	BIGFARM_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_KLOSTER()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	KLOSTER_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SAGITTA()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SAGITTA_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_HUNT()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	HUNT_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_VINOCAVE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	VINOCAVE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SUNCIRCLE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SUNCIRCLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ADWRUINS()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADWRUINS_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_BLACKTROLL()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	BLACKTROLL_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_CASTLE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	CASTLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ICE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ICE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SKLEP()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SKLEP_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_DARKTOWER()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	DARKTOWER_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OLDFORT()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OLDFORT_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OLDPSI()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OLDPSI_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_NETBEK()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	NETBEK_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSNW()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSNW_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_TEARHRAM()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	TEARHRAM_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PYRAMIDE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PYRAMIDE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PASSAV()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PASSAV_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_LIFECIRCLE()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	LIFECIRCLE_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_COMPLEX()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	COMPLEX_TP_OK = TRUE;
	TeleportCheck = FALSE;
};



/*     // ----- CZ TELEPORTY ----- \\     */
	
func void PC_TELEPORT_ON_ADV_ERHAZIR_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADV_ERHAZIR_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ADW_TELEPORTSQUARE_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADW_TELEPORTSQUARE_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_ADW_GOLDDRAGON_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	ADW_GOLDDRAGON_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_NW_DOWNTOWN_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	NW_DOWNTOWN_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_NW_HAFEN_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	NW_HAFEN_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_NW_ATROS_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	NW_ATROS_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_PF_AZGAN_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	PF_AZGAN_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_DG_CREOL_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	DG_CREOL_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OW_ORCCITY_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OW_ORCCITY_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OW_SLEEPERTEMPLE_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OW_SLEEPERTEMPLE_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OW_DARRION_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OW_DARRION_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OW_HIGHROCK_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OW_HIGHROCK_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OC_URTHRALL_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OC_URTHRALL_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OC_ARENA_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OC_ARENA_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OC_ORCMINE_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OC_ORCMINE_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_OC_SHVENTRANCE_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	OC_SHVENTRANCE_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SHV_OCPORTAL_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SHV_OCPORTAL_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SHV_HUMANCAMP_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SHV_HUMANCAMP_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SHV_ORCCAMP_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SHV_ORCCAMP_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

func void PC_TELEPORT_ON_SHV_AZGALOR_CZ()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	SHV_AZGALOR_CZ_TP_OK = TRUE;
	TeleportCheck = FALSE;
};

/*     \\ ----- CZ TELEPORTY ----- //     */
