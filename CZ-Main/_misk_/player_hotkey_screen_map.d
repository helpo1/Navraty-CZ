func int B_GetBestPlayerMap()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_NewWorld_1) >= 1)
		{
			return ItWr_Map_NewWorld_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS_1) >= 1)
		{
			return ItWr_Map_Shrine_MIS_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS_1) >= 1)
		{
			return ItWr_Map_Caves_MIS_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Ornaments_Addon_1) >= 1)
		{
			return ItWr_Map_NewWorld_Ornaments_Addon_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Dexter_1) >= 1)
		{
			return ItWr_Map_NewWorld_Dexter_1;
		}
		else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS_1) >= 1)
		{
			return ItWr_ShatteredGolem_MIS_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS_1) >= 1)
		{
			return ItWr_Map_Orcelite_MIS_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City_1) >= 1)
		{
			return ItWr_Map_NewWorld_City_1;
		};
	}
	else if(CurrentLevel == OldWorld_Zen)
	{
		if(Npc_HasItems(hero,ITWR_MAP_OLDWORLD_FOREST_1) >= 1)
		{
			return ITWR_MAP_OLDWORLD_FOREST_1;
		}
		if(Npc_HasItems(hero,ItWr_Map_OldWorld_1) >= 1)
		{
			return ItWr_Map_OldWorld_1;
		}
		else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS_1) >= 1)
		{
			return ItWr_Map_OldWorld_Oremines_MIS_1;
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
	}
	else if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_AdanosValley_1) >= 1)
		{
			return ItWr_Map_AdanosValley_1;
		};
	}
	else if(CurrentLevel == ORCCITY_ZEN)
	{
		if(Npc_HasItems(hero,ITWR_MAP_ORCCITY_1) >= 1)
		{
			return ITWR_MAP_ORCCITY_1;
		};
	}
	else if(CurrentLevel == PSICAMP_ZEN)
	{
		if(Npc_HasItems(hero,ITWR_MAP_PSICAMP) >= 1)
		{
			return ITWR_MAP_PSICAMP;
		};
	}
	else if(CurrentLevel == ORCTEMPEL_ZEN)
	{
		if(Npc_HasItems(hero,ITWR_MAP_ORCTEMPEL) >= 1)
		{
			return ITWR_MAP_ORCTEMPEL;
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_AddonWorld_1) >= 1)
		{
			return ItWr_Map_AddonWorld_1;
		}
		else if(Npc_HasItems(hero,ItWR_Addon_TreasureMap_1) >= 1)
		{
			return ItWR_Addon_TreasureMap_1;
		};
	};

	return 0;
};

func int B_GetAnyPlayerMap()
{
	return 0;
};

func int player_hotkey_screen_map()
{
	var int OldInstance;
	var int NewInstance;

	OldInstance = B_GetPlayerMap();

	if((OldInstance > 0) && (Npc_HasItems(hero,OldInstance) < 1))
	{
		OldInstance = 0;
	};

	B_SetPlayerMap(OldInstance);
	NewInstance = OldInstance;

	if(CurrentLevel != NEWWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_Caves_MIS_1) || (OldInstance == ItWr_Map_NewWorld_1) || (OldInstance == ItWr_Map_NewWorld_City_1) || (OldInstance == ItWr_Map_NewWorld_Dexter_1) || (OldInstance == ItWr_Map_NewWorld_Ornaments_Addon_1) || (OldInstance == ItWr_Map_Orcelite_MIS_1) || (OldInstance == ItWr_Map_Shrine_MIS_1) || (OldInstance == ItWr_ShatteredGolem_MIS_1))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != OldWorld_Zen)
	{
		if((OldInstance == ItWr_Map_OldWorld_1) || (OldInstance == ItWr_Map_OldWorld_Oremines_MIS_1) || (OldInstance == ITWR_MAP_OLDWORLD_FOREST_1))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != DRAGONISLAND_ZEN)
	{
	};
	if(CurrentLevel != ADANOSVALLEY_ZEN)
	{
		if(OldInstance == ItWr_Map_AdanosValley_1)
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != ADDONWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_AddonWorld_1) || (OldInstance == ItWR_Addon_TreasureMap_1))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != ORCCITY_ZEN)
	{
		if(OldInstance == ITWR_MAP_ORCCITY_1)
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != PSICAMP_ZEN)
	{
		if(OldInstance == ITWR_MAP_PSICAMP)
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != ORCTEMPEL_ZEN)
	{
		if(OldInstance == ITWR_MAP_ORCTEMPEL)
		{
			NewInstance = 0;
		};
	};
	if(NewInstance <= 0)
	{
		NewInstance = B_GetBestPlayerMap();
	};
	if((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};
	if(NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	}
	else
	{
		return OldInstance;
	};

	return OldInstance;
};

func void B_Hotkey_Speed_Potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ITPO_SPEED_03) >= 1)
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ITPO_SPEED_03);
		}
		else if(Npc_HasItems(hero,ItPo_Speed_02) >= 1)
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Speed_02);	
		}
		else if(Npc_HasItems(hero,ItPo_Speed) >= 1)
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Speed);
		}
		else if(Npc_HasItems(hero,ItFo_Addon_SchnellerHering) >= 1)
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItFo_Addon_SchnellerHering);
		}
		else
		{
			AI_Print("Nemáš žádný lektvar rychlosti...");
		};
	};
};