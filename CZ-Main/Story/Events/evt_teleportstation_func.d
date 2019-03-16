
func void evt_teleportstation_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUsed_TELEPORTER = TRUE;
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_TAVERNE");
			if(SCUsed_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleportační kámen v jeskyni východně od města vede do hostince 'U Mrtvé harpyje'.");
			};
			SCUsed_NW_TELEPORTSTATION_CITY = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_TAVERNE") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_MAYA");
			if(SCUsed_NW_TELEPORTSTATION_TAVERNE == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleportační kámen u hostince 'U Mrtvé harpyje' vede k portálu ve starobylých ruinách.");
			};
			SCUsed_NW_TELEPORTSTATION_TAVERNE = TRUE;
		}
		else if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_MAYA") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_CITY");
			if(SCUsed_NW_TELEPORTSTATION_MAYA == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Teleportační kámen v síních Stavitelů vede do jeskyně východně od města.");
			};
			SCUsed_NW_TELEPORTSTATION_MAYA = TRUE;
		}
		else
		{
			AI_Teleport(hero,"MARKT");
		};
		if((SCUsed_NW_TELEPORTSTATION_MAYA == TRUE) && (SCUsed_NW_TELEPORTSTATION_TAVERNE == TRUE) && (SCUsed_NW_TELEPORTSTATION_CITY == TRUE) && (SCUsed_AllNWTeleporststones == FALSE))
		{
			SCUsed_AllNWTeleporststones = TRUE;
			B_GivePlayerXP(XP_Addon_AllNWTeleporststones);
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_NORTH_WP"))
		{
			AI_Teleport(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleportační kámen blízko portálu, co vede do Khorinisu.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_EAST_WP"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Dokázal jsem aktivovat teleportační kámen v táboře banditů.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHEAST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHEAST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleportační kámen na jih od tábora banditů v bažinách.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP"))
		{
			AI_Teleport(hero,"ADW_SOUTHWEST_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_SOUTHWEST == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Našel jsem teleportační kámen na jihozápadě.");
				B_GivePlayerXP(XP_Ambient);
			};
			SCUsed_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_WEST_WP"))
		{
			AI_Teleport(hero,"ADW_PIRATES_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_PIRATES == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsADW,"Aktivoval jsem teleportační kámen v kaňonu.");
				B_GivePlayerXP(XP_Ambient);
			};
			if((MIS_KrokoJagd == LOG_SUCCESS) && (SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE))
			{
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc(Blattcrawler,"ADW_CANYON_TELEPORT_PATH_07");
				SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};
			SCUsed_ADW_TELEPORTSTATION_PIRATES = TRUE;
		}
		else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT"))
		{
			AI_Teleport(hero,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
			if(SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
			};
			SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
		}
		else
		{
			AI_Teleport(hero,"ADW_ENTRANCE");
		};
	};
};


var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;

func void adw_portaltempel_focus_func()
{
	Npc_RemoveInvItems(hero,ItMi_Focus,1);
	TriggeredTeleporterADW = TriggeredTeleporterADW + 1;
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	if(TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	if((ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE) && (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000))
	{
		if((Npc_IsDead(Stoneguardian_NailedPortalADW1) == FALSE) && (Stoneguardian_NailedPortalADW1.aivar[AIV_EnemyOverride] == TRUE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		b_awake_stoneguardian(Stoneguardian_NailedPortalADW1);
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};


var int adw_golddragon_focus_func_onetime;

func void adw_golddragon_focus_func()
{
	if(adw_golddragon_focus_func_onetime == FALSE)
	{
		Npc_RemoveInvItems(hero,ITMI_DRAGONGOLDFOCUS,1);
		Snd_Play("MFX_TELEKINESIS_STARTINVEST");
		adw_golddragon_focus_func_onetime = TRUE;
		ADW_GOLDDRAGON_ENTER = TRUE;
	};
};

func void evt_teleportstation_golddragon_in_func()
{
	if(ADW_GOLDDRAGON_ENTER == TRUE)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(hero);
		AI_Teleport(hero,"ADW_ENTRANCE_TELEPORT_GOLDDRAGON");
	};
};

func void evt_teleportstation_golddragon_out_func()
{
	if(ADW_GOLDDRAGON_ENTER == TRUE)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(hero);
		AI_Teleport(hero,"ADW_ENTRANCE_TELEPORT_GOLDDRAGON_IN");
		if(SATURASKNOWSASHTAR == TRUE)
		{
			SATURASKNOWSASHTAR = FALSE;
			Npc_ExchangeRoutine(KDW_14000_Addon_Saturas_ADW,"GoldDragon");
		};
		if((TASKFINDSPHERE == TRUE) && (Npc_HasItems(hero,itmi_fireshpere) >= 1) && (Npc_HasItems(hero,itmi_watershpere) >= 1) && (Npc_HasItems(hero,itmi_stoneshpere) >= 1) && (Npc_HasItems(hero,itmi_darkshpere) >= 1) && (SATURASAWAYASHTAR == FALSE))
		{
			SATURASAWAYASHTAR = TRUE;

			if(Kapitel >= 4)
			{
				Npc_ExchangeRoutine(KDW_14000_Addon_Saturas_ADW,"OrcInvasion");
			}
			else
			{
				Npc_ExchangeRoutine(KDW_14000_Addon_Saturas_ADW,"Start");
			};
		};
	};
};

func void event_portalgate_func()
{
};

func void event_orc_portal_gate_open_func()
{
	if((ORCCITY_PORTAL1_FOCUS_FUNC_ONETIME == TRUE) && (ORCCITY_PORTAL2_FOCUS_FUNC_ONETIME == TRUE) && (ORCCITY_TWOPORTAL_OPEN == FALSE))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
		ORCCITY_TWOPORTAL_OPEN = TRUE;
		Wld_SendTrigger("EVENT_PORTALGATE");
	};
};

func void orccity_portal1_focus_func()
{
	if((orccity_portal1_focus_func_onetime == FALSE) && (ORCCITY_TWOPORTAL_OPEN == FALSE))
	{
		Npc_RemoveInvItems(hero,itmi_1_orcportalstone,1);
		orccity_portal1_focus_func_onetime = TRUE;
		Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	};
};

func void orccity_portal2_focus_func()
{
	if((orccity_portal2_focus_func_onetime == FALSE) && (ORCCITY_TWOPORTAL_OPEN == FALSE))
	{
		Npc_RemoveInvItems(hero,itmi_2_orcportalstone,1);
		orccity_portal2_focus_func_onetime = TRUE;
		Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	};
};

func void event_keltuzedawake_func()
{
	if(TUZEDSWITCH == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
		AI_Wait(hero,3);
		Wld_InsertNpc(skeleton_lord_keltuzed,"FP_STAND_DEADKING_05");
		Wld_InsertNpc(skeleton_knight_death_01,"FP_STAND_DEADKING_04");
		Wld_InsertNpc(skeleton_knight_death_02,"FP_STAND_DEADKING_03");
		Wld_InsertNpc(skeleton_knight_death_03,"FP_STAND_DEADKING_02");
		Wld_InsertNpc(skeleton_knight_death_04,"FP_STAND_DEADKING_01");
		TUZEDSWITCH = TRUE;
	};
};

func void evt_li_teleport_down_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"LI_TELEPORT_02");
};

func void evt_li_teleport_up_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"LI_TELEPORT_01");
};

func void evt_teleport_darktower_func()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"NW_DARKTOWER_UP");
};

