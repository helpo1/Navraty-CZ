/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



func void b_enter_paladinfort_kapitel_1()
{
};


var int enterpaladinfort_kapitel2;

func void b_enter_paladinfort_kapitel_2()
{
	if(ENTERPALADINFORT_KAPITEL2 == FALSE)
	{
		ENTERPALADINFORT_KAPITEL2 = TRUE;
	};
};


var int enterpaladinfort_kapitel3;

func void b_enter_paladinfort_kapitel_3()
{
	if(ENTERPALADINFORT_KAPITEL3 == FALSE)
	{
		ENTERPALADINFORT_KAPITEL3 = TRUE;
	};
};


var int enterpaladinfort_kapitel4;

func void b_enter_paladinfort_kapitel_4()
{
	if(ENTERPALADINFORT_KAPITEL4 == FALSE)
	{
		ENTERPALADINFORT_KAPITEL4 = TRUE;
	};
};


var int enterpaladinfort_kapitel5;

func void b_enter_paladinfort_kapitel_5()
{
	if(ENTERPALADINFORT_KAPITEL5 == FALSE)
	{
		ENTERPALADINFORT_KAPITEL5 = TRUE;
	};
};


var int enterpaladinfort_kapitel6;

func void b_enter_paladinfort_kapitel_6()
{
	if(ENTERPALADINFORT_KAPITEL6 == FALSE)
	{
		Wld_InsertNpc(Bloodfly,"WIL_MONSTERSPAWNS_01");
		Wld_InsertNpc(scavenger_old,"WIL_MONSTERSPAWNS_10");
		Wld_InsertNpc(Scavenger,"WIL_MONSTERSPAWNS_06");
		Wld_InsertNpc(Scavenger,"WIL_MONSTERSPAWNS_03");
		Wld_InsertNpc(Scavenger,"WIL_MONSTERSPAWNS_05");
		Wld_InsertNpc(scavenger_old,"WIL_FLEISCHWANZE_02");
		Wld_InsertNpc(scavenger_old,"WIL_MONSTERSPAWNS_04");
		Wld_InsertNpc(Scavenger,"WIL_MONSTERSPAWNS_02");
		Wld_InsertNpc(Waran,"WIL_ZUMSTRAND_02_02");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_09");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_07");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_05");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_04");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_03");
		Wld_InsertNpc(Wolf,"WIL_AUSSEN_01");
		Wld_InsertNpc(Gobbo_Green,"WIL_ZUMSTRAND_02_09");
		Wld_InsertNpc(Wolf,"WIL_ZUMSTRAND_02_10");
		Wld_InsertNpc(Bloodfly,"WIL_ZUMSTRAND_02_11");
		Wld_InsertNpc(Scavenger,"WIL_HEILPFLANZE_03");
		Wld_InsertNpc(Scavenger,"WIL_SCAVANGER_09");
		Wld_InsertNpc(Scavenger,"FP_ROAM_75");
		Wld_InsertNpc(Scavenger,"WIL_WALD_12");
		Wld_InsertNpc(Scavenger,"FP_ROAM_147");
		Wld_InsertNpc(Scavenger,"FP_ROAM_149");
		Wld_InsertNpc(Scavenger,"WIL_BLAUFLIEDER_10");
		Wld_InsertNpc(Keiler,"WIL_KEILER_09");
		Wld_InsertNpc(Keiler,"WIL_HEILPFLANZE_08");
		Wld_InsertNpc(Bloodfly,"WIL_SPOKAL_02");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_226");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_252");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_251");
		Wld_InsertNpc(Waran,"FP_ROAM_56");
		Wld_InsertNpc(Waran,"FP_ROAM_248");
		Wld_InsertNpc(Waran,"WIL_HEILPFLANZE_06");
		Wld_InsertNpc(Waran,"WIL_MANAPFLANZEH_08");
		Wld_InsertNpc(Gobbo_Green,"WIL_ZULAGERERN_13");
		Wld_InsertNpc(Snapper,"FP_ROAM_256");
		Wld_InsertNpc(Snapper,"FP_ROAM_257");
		Wld_InsertNpc(Snapper,"FP_ROAM_254");
		Wld_InsertNpc(Snapper,"WIL_WALD_03");
		Wld_InsertNpc(Snapper,"FP_ROAM_259");
		Wld_InsertNpc(Snapper,"WIL_HEILPFLANZE_24");
		Wld_InsertNpc(Keiler,"FP_ROAM_136");
		Wld_InsertNpc(Keiler,"FP_ROAM_139");
		Wld_InsertNpc(Keiler,"FP_ROAM_135");
		Wld_InsertNpc(Waran,"FP_ROAM_141");
		Wld_InsertNpc(Waran,"WIL_BLAUFLIEDER_01");
		Wld_InsertNpc(Waran,"WIL_KRONSTOECKEL_02");
		Wld_InsertNpc(Waran,"WIL_HEILPFLANZE_22");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_26222");
		Wld_InsertNpc(gobbo_mage,"FP_ROAM_26233");
		Wld_InsertNpc(Wolf,"WIL_ZULAGERERN_10");
		Wld_InsertNpc(Snapper,"WIL_SNAPPER_01");
		Wld_InsertNpc(Snapper,"WIL_WOLF_16");
		Wld_InsertNpc(Bloodfly,"WIL_ZULAGERERN_07");
		Wld_InsertNpc(scavenger_old,"WIL_MANAPFLANZEH_07");
		Wld_InsertNpc(Scavenger,"WIL_HEILPFLANZE_37");
		Wld_InsertNpc(scavenger_old,"FP_ROAM_120");
		Wld_InsertNpc(Scavenger,"FP_ROAM_123");
		Wld_InsertNpc(Scavenger,"FP_ROAM_58");
		Wld_InsertNpc(Scavenger,"WIL_SCAVANGER_03");
		Wld_InsertNpc(scavenger_old,"FP_ROAM_122");
		Wld_InsertNpc(scavenger_old,"WIL_FELDKNOETERICH_02");
		Wld_InsertNpc(Scavenger,"FP_ROAM_124");
		Wld_InsertNpc(Scavenger,"WIL_FELDKNOETERICH_01");
		Wld_InsertNpc(Warg,"FP_ROAM_12422");
		Wld_InsertNpc(Warg,"FP_ROAM_12433");
		Wld_InsertNpc(Warg,"FP_ROAM_12444");
		Wld_InsertNpc(Warg,"FP_ROAM_12455");
		Wld_InsertNpc(Snapper,"FP_ROAM_12400");
		Wld_InsertNpc(Snapper,"FP_ROAM_12466");
		Wld_InsertNpc(Snapper,"FP_ROAM_12477");
		Wld_InsertNpc(Snapper,"FP_ROAM_12488");
		Wld_InsertNpc(Snapper,"FP_ROAM_12499");
		Wld_InsertNpc(Snapper,"WIL_HEILPFLANZE_38");
		Wld_InsertNpc(Snapper,"FP_ROAM_124000");
		Wld_InsertNpc(Bloodfly,"WIL_KRONSTOECKEL_03");
		Wld_InsertNpc(Bloodfly,"WIL_BOGEN_02");
		Wld_InsertNpc(Gobbo_Black,"WIL_LAGERER_CAMPFIRE_02");
		Wld_InsertNpc(Gobbo_Black,"WIL_LAGERER_CAMPFIRE_03");
		Wld_InsertNpc(Gobbo_Black,"WIL_LAGERER_CAMPFIRE_04");
		Wld_InsertNpc(Gobbo_Black,"WIL_LAGERER_CAMPFIRE_01");
		Wld_InsertNpc(Bloodfly,"WIL_LAGERER_05");
		Wld_InsertNpc(Scavenger,"WIL_HEILPFLANZE_40");
		Wld_InsertNpc(Scavenger,"WIL_MANAPFLANZE_14");
		Wld_InsertNpc(Scavenger,"WIL_HEILPFLANZE_41");
		Wld_InsertNpc(Scavenger,"WIL_HEILPFLANZE_42");
		Wld_InsertNpc(Scavenger,"FP_ROAM_61");
		Wld_InsertNpc(Scavenger,"WIL_SPOKAL_05");
		Wld_InsertNpc(Scavenger,"FP_ROAM_119");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_52");
		Wld_InsertNpc(Bloodfly,"WIL_KEILER_07");
		Wld_InsertNpc(Scavenger,"WIL_MANAPFLANZEH_09");
		Wld_InsertNpc(Scavenger,"SIT_CAMPFIRE_EVA_01");
		Wld_InsertNpc(Scavenger,"WIL_LICHTUNG_02_SPAWN_01");
		Wld_InsertNpc(Scavenger,"WIL_LICHTUNG_02_SPAWN_02");
		Wld_InsertNpc(Scavenger,"WIL_LAGEREINGANG_SCAV_01");
		Wld_InsertNpc(Scavenger,"WIL_LAGEREINGANG_SCAV_02");
		Wld_InsertNpc(Scavenger,"WIL_LAGEREINGANG_SCAV_03");
		Wld_InsertNpc(Waran,"WIL_WARAN_01");
		Wld_InsertNpc(Waran,"WIL_HEILPFLANZE_11");
		Wld_InsertNpc(Waran,"WIL_HEILPFLANZE_49");
		Wld_InsertNpc(Waran,"WIL_BLAUFLIEDER_06");
		Wld_InsertNpc(Lurker,"FP_ROAM_266");
		Wld_InsertNpc(Lurker,"FP_ROAM_265");
		Wld_InsertNpc(Lurker,"FP_ROAM_269");
		Wld_InsertNpc(Lurker,"FP_ROAM_270");
		Wld_InsertNpc(Lurker,"FP_ROAM_268");
		Wld_InsertNpc(Lurker,"WIL_FISCH_03");
		Wld_InsertNpc(Lurker,"WIL_GUERTEL_03");
		Wld_InsertNpc(Lurker,"FP_ROAM_187");
		Wld_InsertNpc(Lurker,"FP_ROAM_186");
		Wld_InsertNpc(Lurker,"WIL_LURKER_08");
		Wld_InsertNpc(Lurker,"FP_ROAM_192");
		Wld_InsertNpc(Lurker,"WIL_LURKER_15");
		Wld_InsertNpc(Lurker,"WIL_LURKER_13");
		Wld_InsertNpc(Lurker,"WIL_LURKER_14");
		Wld_InsertNpc(Waran,"WIL_LURKER_07");
		Wld_InsertNpc(Waran,"WIL_GOLDSACK_02");
		Wld_InsertNpc(Lurker,"WIL_STRAND_08");
		Wld_InsertNpc(Lurker,"WIL_STRAND_10");
		Wld_InsertNpc(Lurker,"WIL_GUERTEL_02");
		Wld_InsertNpc(FireWaran,"WIL_LURKER_03");
		Wld_InsertNpc(FireWaran,"WIL_LURKER_11");
		Wld_InsertNpc(FireWaran,"WIL_LURKER_05");
		Wld_InsertNpc(FireWaran,"WIL_PRAMVORSWARAN");
		Wld_InsertNpc(Lurker,"WIL_STRAND_19");
		Wld_InsertNpc(Lurker,"WIL_STRAND_19");
		Wld_InsertNpc(Lurker,"WIL_ZUMSTRAND_02_13");
		Wld_InsertNpc(FireWaran,"WIL_LURKER_02");
		Wld_InsertNpc(Lurker,"WIL_LURKER_12");
		Wld_InsertNpc(Lurker,"WIL_STRAND_CAMPFIRE");
		Wld_InsertNpc(Lurker,"WIL_LURKER_10");
		Wld_InsertNpc(Waran,"WIL_STRAND_NEU_02");
		Wld_InsertNpc(Troll,"WIL_TROLL_ROAM_01");
		Wld_InsertNpc(Warg,"WIL_BLAUFLIEDER_05");
		Wld_InsertNpc(Warg,"WIL_KARATOS_WARG");
		Wld_InsertNpc(Warg,"WIL_WOLF_22");
		Wld_InsertNpc(Warg,"WIL_KARATOS_WARG");
		Wld_InsertNpc(Shadowbeast,"FP_STAND_WIL_BLAUFLIEDER_05");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_01_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_02_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_03_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_04_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_05_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_06_01");
		Wld_InsertNpc(schildkroete,"FP_ROAM_PAL_TURTLE_07_01");
		ENTERPALADINFORT_KAPITEL6 = TRUE;
	};
};

func void b_enter_paladinfort()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		b_enter_paladinfort_kapitel_1();
	};
	if(Kapitel >= 2)
	{
		b_enter_paladinfort_kapitel_2();
	};
	if(Kapitel >= 3)
	{
		b_enter_paladinfort_kapitel_3();
	};
	if(Kapitel >= 4)
	{
		b_enter_paladinfort_kapitel_4();
	};
	if(Kapitel >= 5)
	{
		b_enter_paladinfort_kapitel_5();
	};
	if(Kapitel >= 6)
	{
		b_enter_paladinfort_kapitel_6();
	};
	if((MIS_ORCGREATWAR == LOG_Running) && (PLACEPALADINSTOFORT == FALSE))
	{
		Wld_InsertNpc(pal_2000_hagen,"LGR_RATSHAUS_13_97");
		Wld_InsertNpc(pal_2010_ingmar,"FP_INGMAR");
		Wld_InsertNpc(pal_2020_albrecht,"FP_ALBRECHT");
		Wld_InsertNpc(pal_2160_cedric,"FP_CEDRIC");
		Wld_InsertNpc(mil_3110_andre,"FP_ANDRE");
		Wld_InsertNpc(mil_3120_wulfgar,"FP_WULFGAR");
		B_StartOtherRoutine(pal_9158_varus,"Hagen");
		PLACEPALADINSTOFORT = TRUE;
	};
	if((GARONDGOFORT == TRUE) && (PAL_FIRSTGROUP == FALSE))
	{
		PAL_FIRSTGROUP = TRUE;
		if(GARONDNWISDEAD == FALSE)
		{
			GARONDISBACK = TRUE;
			Wld_InsertNpc(pal_25000_garond,"PLFT_GAROND");
		};
		if(ORICNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_25100_oric,"PLFT_ORIC");
		};
		if(PARCIVALNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_25200_parcival,"PLFT_PERCIVAL");
		};
		if(MARCOSNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_21700_marcos,"PLFT_MARCOS");
		};
		if(ALBERTNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_752300_albert,"PLFT_ALBERT");
		};
	};
	if((GARONDGOFORT == TRUE) && (MIS_NATANDOLG == FALSE) && (PAL_SECONDGROUP == FALSE))
	{
		PAL_SECONDGROUP = TRUE;
		if(UDARNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_26800_udar,"PLFT_UDAR");
		};
		if(NATANNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_916800_natan,"PLFT_NATAN");
		};
	}
	else if((GARONDGOFORT == TRUE) && (MIS_NATANDOLG == LOG_SUCCESS) && (PAL_SECONDGROUP == FALSE))
	{
		PAL_SECONDGROUP = TRUE;
		if(UDARNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_26800_udar,"PLFT_UDAR");
		};
		if(NATANNWISDEAD == FALSE)
		{
			Wld_InsertNpc(pal_916800_natan,"PLFT_NATAN");
		};
	};
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESPAL == FALSE))
	{
		Wld_SendTrigger("EVT_TRIGGER_CLOSEPALADINSGATE");
		B_RemoveNpc(pal_9100_ritter);
		B_RemoveNpc(pal_9101_ritter);
		B_RemoveNpc(pal_9102_ritter);
		B_RemoveNpc(pal_9103_ritter);
		B_RemoveNpc(pal_9104_ritter);
		B_RemoveNpc(pal_9105_ritter);
		B_RemoveNpc(pal_9106_ritter);
		B_RemoveNpc(pal_9107_ritter);
		B_RemoveNpc(pal_9108_ritter);
		B_RemoveNpc(pal_9109_ritter);
		B_RemoveNpc(pal_9110_ritter);
		B_RemoveNpc(pal_9111_ritter);
		B_RemoveNpc(pal_9112_ritter);
		B_RemoveNpc(pal_9113_ritter);
		B_RemoveNpc(pal_9114_ritter);
		B_RemoveNpc(pal_9115_ritter);
		B_RemoveNpc(pal_9116_ritter);
		B_RemoveNpc(pal_9117_ritter);
		B_RemoveNpc(pal_9118_ritter);
		B_RemoveNpc(pal_9119_ritter);
		B_RemoveNpc(pal_9120_ritter);
		B_RemoveNpc(pal_9121_ritter);
		B_RemoveNpc(pal_9122_ritter);
		B_RemoveNpc(pal_9123_ritter);
		B_RemoveNpc(pal_9124_ritter);
		B_RemoveNpc(pal_9125_ritter);
		B_RemoveNpc(pal_9126_ritter);
		B_RemoveNpc(pal_9127_ritter);
		B_RemoveNpc(pal_9128_ritter);
		B_RemoveNpc(pal_9129_ritter);
		B_RemoveNpc(pal_9130_ritter);
		B_RemoveNpc(pal_9131_ritter);
		B_RemoveNpc(pal_9132_ritter);
		B_RemoveNpc(pal_9133_ritter);
		B_RemoveNpc(pal_9134_ritter);
		B_RemoveNpc(pal_9135_ritter);
		B_RemoveNpc(pal_9136_ritter);
		B_RemoveNpc(pal_9137_ritter);
		B_RemoveNpc(pal_9138_ritter);
		B_RemoveNpc(pal_9139_ritter);
		B_RemoveNpc(pal_9140_ritter);
		B_RemoveNpc(pal_9141_ritter);
		B_RemoveNpc(pal_9142_ritter);
		B_RemoveNpc(pal_9143_ritter);
		B_RemoveNpc(pal_9144_ritter);
		B_RemoveNpc(pal_9145_ritter);
		B_RemoveNpc(pal_9146_ritter);
		B_RemoveNpc(pal_9147_ritter);
		B_RemoveNpc(pal_9148_ritter);
		B_RemoveNpc(pal_9149_ritter);
		B_RemoveNpc(pal_9150_ritter);
		B_RemoveNpc(pal_9151_ritter);
		B_RemoveNpc(pal_9152_ritter);
		B_RemoveNpc(pal_9153_ritter);
		B_RemoveNpc(pal_9154_ritter);
		B_RemoveNpc(pal_9155_ritter);
		B_RemoveNpc(pal_9156_ritter);
		B_RemoveNpc(pal_9157_ritter);
		B_RemoveNpc(pal_9158_varus);
		B_RemoveNpc(pal_9159_rayne);
		B_RemoveNpc(pal_9160_orto);
		B_RemoveNpc(pal_9161_guardwatch);
		B_RemoveNpc(pal_9162_ritter);
		B_RemoveNpc(pal_25000_garond);
		B_RemoveNpc(pal_25100_oric);
		B_RemoveNpc(pal_25200_parcival);
		B_RemoveNpc(pal_21700_marcos);
		B_RemoveNpc(pal_752300_albert);
		B_RemoveNpc(pal_26800_udar);
		B_RemoveNpc(pal_916800_natan);
		B_RemoveNpc(pal_2000_hagen);
		B_RemoveNpc(pal_2010_ingmar);
		B_RemoveNpc(pal_2020_albrecht);
		B_RemoveNpc(pal_2160_cedric);
		B_RemoveNpc(mil_3110_andre);
		B_RemoveNpc(mil_3120_wulfgar);
		MOVEFORCESPAL = TRUE;
	};

	HelmIsUpTemp = FALSE;
	CraitIsUp = FALSE;
	CraitCanUp = FALSE;
	CurrentLevel = PALADINFORT_ZEN;
	B_InitNpcGlobals();
};

