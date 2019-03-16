
func void evt_ornament_switch_bigfarm_01_func()
{
	if(ORNAMENT_SWITCHED_BIGFARM == FALSE)
	{
		Wld_InsertNpc(Stoneguardian_Ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		Wld_InsertItem(ItMi_OrnamentEffekt_BIGFARM_Addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_BIGFARM_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",ItMi_OrnamentEffekt_BIGFARM_Addon,ItMi_OrnamentEffekt_BIGFARM_Addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_OrnamentEffekt_BIGFARM_Addon,ItMi_OrnamentEffekt_BIGFARM_Addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Aktivoval jsem mechanismus v kamenném kruhu blízko Sekobovy farmy. Ozvala se hlasitá rána a objevil se kamenný strážce.");
		ORNAMENT_SWITCHED_BIGFARM = TRUE;
	};
};

func void evt_ornament_switch_farm_01_func()
{
	if(ORNAMENT_SWITCHED_FARM == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Aktivoval jsem mechanismus v kamenném kruhu u Lobartovy farmy. Nenásledovalo nic víc než malé zemětřesení.");
		ORNAMENT_SWITCHED_FARM = TRUE;
	};
};

func void evt_ornament_switch_forest_01_func()
{
	if(ORNAMENT_SWITCHED_FOREST == FALSE)
	{
		Wld_InsertNpc(Stoneguardian_Ornament,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		Wld_InsertItem(ItMi_OrnamentEffekt_FOREST_Addon,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_FOREST_01");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",ItMi_OrnamentEffekt_FOREST_Addon,ItMi_OrnamentEffekt_FOREST_Addon,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Snd_Play("THRILLJINGLE_02");
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_OrnamentEffekt_FOREST_Addon,ItMi_OrnamentEffekt_FOREST_Addon,0,0,0,FALSE);
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Aktivoval jsem mechanismus v kamenném kruhu v severovýchodních lesích. Objevil se velký kamenný strážce. Neměl moc dobrou náladu.");
		ORNAMENT_SWITCHED_FOREST = TRUE;
	};
};

