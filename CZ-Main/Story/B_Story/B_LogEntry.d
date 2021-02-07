/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)
MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)


v1.00:

func void B_LogEntry - upraveny výpisy

*/



func void B_CloseTopic_Now(var string topic,var int MissionVar,var int CommonVar,var int EndChapter)
{
	var string concatText;
	var int LogCurStatus;

	LogCurStatus = Log_GetTopicStatus(topic);

	//PrintScreen(IntToString(LogCurStatus),-1,YPOS_LOGENTRY_DONE,FONT_XP,3);
	//PrintScreen(IntToString(MissionVar),-1,YPOS_LOGENTRY_DONE + 3,FONT_XP,3);

	if((LogCurStatus == 1) && ((MissionVar == 4) || (CommonVar == 1)))
	{
		if(PrintNowSuccess == 0)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 1)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 2)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 3)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		};
	}
	else if((LogCurStatus == 4) && ((MissionVar == 4) || (CommonVar == 1)))
	{
		if(PrintNowSuccess == 0)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 1)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 2)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		}
		else if(PrintNowSuccess == 3)
		{
			concatText = "Úkol '";
			concatText = ConcatStrings(concatText,topic);
			concatText = ConcatStrings(concatText,"' splněn!");

			if(PrintNowSuccessFlag == FALSE)
			{
				PrintNowSuccessFlag = TRUE;
				Snd_Play("QUEST_DONE");
			};

			Log_SetTopicStatus(topic,2);
			AI_PrintClr(concatText,83,152,48);
			PrintNowSuccess += 1;
		};
	};
};

func void B_CheckLog_Done()
{
	B_CloseTopic_Now(TOPIC_RescueBennet,MIS_RescueBennet,0,4);
	B_CloseTopic_Now(Topic_Ship,0,MIS_ReadyforChapter6,6);
	B_CloseTopic_Now(Topic_Captain,0,SCGotCaptain,6);
	B_CloseTopic_Now(Topic_Crew,0,MIS_ShipIsFree,6);
	B_CloseTopic_Now(Topic_Crew,0,MIS_ReadyforChapter6,6);
	B_CloseTopic_Now(TOPIC_Addon_RatHunt,MIS_KrokoJagd,0,6);
	B_CloseTopic_Now(TOPIC_Addon_BringMeat,MIS_AlligatorJack_BringMeat,GregIsBack,6);
	B_CloseTopic_Now(TOPIC_Addon_BanditsTower,MIS_Henry_FreeBDTTower,TowerBanditsDead,6);
	B_CloseTopic_Now(TOPIC_Addon_HolOwen,MIS_Henry_HolOwen,0,6);
	B_CloseTopic_Now(TOPIC_Addon_Kompass,MIS_ADDON_GARett_BringKompass,0,6);
	B_CloseTopic_Now(TOPIC_Addon_RoastGrog,0,PIR_1364_Grog,6);
	B_CloseTopic_Now(TOPIC_Addon_BrandonBooze,MIS_Brandon_BringHering,0,6);
	B_CloseTopic_Now(TOPIC_Addon_MorganBeach,MIS_Addon_MorganLurker,0,6);
	B_CloseTopic_Now(TOPIC_Addon_SkipsGrog,MIS_ADDON_SkipsGrog,0,6);
	B_CloseTopic_Now(TOPIC_Addon_KillJuan,MIS_Addon_Bill_SearchAngusMurder,0,6);
	B_CloseTopic_Now(TOPIC_Addon_ClearCanyon,MIS_Addon_Greg_ClearCanyon,0,6);
	B_CloseTopic_Now(TOPIC_Addon_ScoutBandits,MIS_Greg_ScoutBandits,0,6);
	B_CloseTopic_Now(TOPIC_Addon_MalcomsStunt,MIS_Owen_FindMalcom,0,6);
	B_CloseTopic_Now(TOPIC_GOLDDRAGONPORTAL,MIS_GOLDDRAGONPORTAL,0,6);
	B_CloseTopic_Now(Topic_Addon_Fortuno,0,SC_KnowsFortunoInfos,6);
	B_CloseTopic_Now(Topic_Addon_Hammer,MIS_SnafHammer,0,6);
	B_CloseTopic_Now(Topic_Addon_Buddler,MIS_Send_Buddler,0,4);
	B_CloseTopic_Now(Topic_Addon_Logan,MIS_HlpLogan,0,4);
	B_CloseTopic_Now(Topic_Addon_Stoneplate,MIS_HlpEdgor,0,4);
	B_CloseTopic_Now(Topic_Addon_Esteban,MIS_Judas,0,4);
	B_CloseTopic_Now(Topic_Addon_Huno,MIS_Huno_Stahl,0,6);
	B_CloseTopic_Now(Topic_Addon_Fisk,MIS_Lennar_Lockpick,0,6);
	B_CloseTopic_Now(Topic_Addon_Tempel,MIS_BloodwynRaus,0,4);
	B_CloseTopic_Now(Topic_Addon_Franco,0,Player_HasTalkedToBanditCamp,4);
	B_CloseTopic_Now(Topic_Addon_Senyan,Senyan_Erpressung,0,4);
	B_CloseTopic_Now(Topic_Bandits,MIS_Steckbriefe,0,4);
	B_CloseTopic_Now(TOPIC_Kleidung,0,Lobart_Kleidung_Verkauft,2);
	B_CloseTopic_Now(TOPIC_Rueben,MIS_Lobart_Rueben,0,3);
	B_CloseTopic_Now(TOPIC_Ruebenbringen,MIS_Lobart_RuebenToHilda,0,3);
	B_CloseTopic_Now(TOPIC_Vino,MIS_Vino_Wein,0,3);
	B_CloseTopic_Now(TOPIC_Hilda,MIS_Hilda_PfanneKaufen,0,3);
	B_CloseTopic_Now(TOPIC_Maleth,MIS_Maleth_Bandits,0,3);
	B_CloseTopic_Now(TOPIC_City,0,Mil_310_schonmalreingelassen,2);
	B_CloseTopic_Now(TOPIC_Lehrling,MIS_Apprentice,0,6);
	B_CloseTopic_Now(TOPIC_OV,0,Mil_305_schonmalreingelassen,2);
	B_CloseTopic_Now(TOPIC_Thorben,MIS_Thorben_GetBlessings,0,6);
	B_CloseTopic_Now(TOPIC_Thorben,MIS_Apprentice,0,6);
	B_CloseTopic_Now(TOPIC_BosperWolf,MIS_Bosper_WolfFurs,0,6);
	B_CloseTopic_Now(TOPIC_BosperBogen,MIS_Bosper_Bogen,0,6);
	B_CloseTopic_Now(TOPIC_ConstantinoPlants,MIS_Constantino_BringHerbs,0,6);
	B_CloseTopic_Now(TOPIC_HaradOrk,MIS_Harad_Orc,0,6);
	B_CloseTopic_Now(TOPIC_Canthar,MIS_Canthars_KomproBrief,0,3);
	B_CloseTopic_Now(TOPIC_HakonBanditen,MIS_HakonBandits,0,6);
	B_CloseTopic_Now(TOPIC_BalthasarsSchafe,MIS_Balthasar_BengarsWeide,0,6);
	B_CloseTopic_Now(TOPIC_Jora,Jora_Gold,0,6);
	B_CloseTopic_Now(TOPIC_JoraDieb,Jora_Dieb,0,6);
	B_CloseTopic_Now(TOPIC_Matteo,MIS_Matteo_Gold,0,6);
	B_CloseTopic_Now(TOPIC_Nagur,MIS_Nagur_Bote,0,6);
	B_CloseTopic_Now(TOPIC_Baltram,MIS_Baltram_ScoutAkil,0,6);
	B_CloseTopic_Now(Topic_CassiaRing,MIS_CassiaRing,0,6);
	B_CloseTopic_Now(Topic_CassiaKelche,MIS_CassiaKelche,0,6);
	B_CloseTopic_Now(TOPIC_CASSIAGOLDCUP,MIS_CASSIAGOLDCUP,0,6);
	B_CloseTopic_Now(Topic_RamirezSextant,0,Ramirez_Sextant,6);
	B_CloseTopic_Now(TOPIC_Ignaz,MIS_Ignaz_Charm,0,6);
	B_CloseTopic_Now(TOPIC_AlrikSchwert,MIS_Alrik_Sword,0,6);
	B_CloseTopic_Now(TOPIC_Alwin,MIS_AttackFellan,0,6);
	B_CloseTopic_Now(TOPIC_Garvell,MIS_Garvell_Infos,0,3);
	B_CloseTopic_Now(TOPIC_BecomeMIL,MIL_Aufnahme,0,2);
	B_CloseTopic_Now(TOPIC_BecomeSLD,SLD_Aufnahme,0,2);
	B_CloseTopic_Now(TOPIC_BecomeKdF,KDF_Aufnahme,0,2);
	B_CloseTopic_Now(TOPIC_PSICAMPJOIN,MIS_PSICAMPJOIN,0,2);
	B_CloseTopic_Now(TOPIC_BECOMEKDW,MIS_BECOMEKDW,0,2);
	B_CloseTopic_Now(TOPIC_BECOMEKDM,MIS_BECOMEKDM,0,2);
	B_CloseTopic_Now(TOPIC_Peck,MIS_Andre_Peck,0,6);
	B_CloseTopic_Now(TOPIC_Warehouse,MIS_Andre_WAREHOUSE,0,6);
	B_CloseTopic_Now(TOPIC_Redlight,MIS_Andre_REDLIGHT,0,6);
	B_CloseTopic_Now(TOPIC_Feldraeuber,MIS_AndreHelpLobart,0,6);
	B_CloseTopic_Now(Topic_Kloster,0,NOV_Aufnahme,2);
	B_CloseTopic_Now(Topic_Gemeinschaft,MIS_KlosterArbeit,0,2);
	B_CloseTopic_Now(Topic_Neorasrezept,MIS_NeorasRezept,0,2);
	B_CloseTopic_Now(Topic_NeorasPflanzen,MIS_NeorasPflanzen,0,2);
	B_CloseTopic_Now(Topic_IsgarothWolf,MIS_IsgarothWolf,0,2);
	B_CloseTopic_Now(Topic_ParlanFegen,MIS_ParlanFegen,0,2);
	B_CloseTopic_Now(Topic_GoraxEssen,MIS_GoraxEssen,0,2);
	B_CloseTopic_Now(Topic_GoraxWein,MIS_GoraxWein,0,2);
	B_CloseTopic_Now(Topic_OpolosRezept,Opolos_Rezept,0,2);
	B_CloseTopic_Now(Topic_MardukBeten,MIS_MardukBeten,0,2);
	B_CloseTopic_Now(Topic_BaboTrain,0,Babo_Training,2);
	B_CloseTopic_Now(Topic_KarrasCharm,MIS_KarrasVergessen,0,2);
	B_CloseTopic_Now(TOPIC_FireContest,0,Fire_Contest,2);
	B_CloseTopic_Now(TOPIC_Golem,MIS_GOLEM,0,2);
	B_CloseTopic_Now(TOPIC_Rune,MIS_RUNE,0,2);
	B_CloseTopic_Now(TOPIC_Schnitzeljagd,MIS_SCHNITZELJAGD,0,2);
	B_CloseTopic_Now(Topic_BaboGaertner,MIS_HelpBabo,0,2);
	B_CloseTopic_Now(Topic_DyrianDrin,MIS_HelpDyrian,0,2);
	B_CloseTopic_Now(Topic_OpolosStudy,MIS_HelpOpolos,0,2);
	B_CloseTopic_Now(TOPIC_BecomeSLD,SLD_Aufnahme,0,2);
	B_CloseTopic_Now(TOPIC_SLDRespekt,MIS_SLDRESPEKT,0,2);
	B_CloseTopic_Now(TOPIC_TorlofPacht,MIS_Torlof_HolPachtVonSekob,0,3);
	B_CloseTopic_Now(TOPIC_TorlofMiliz,MIS_Torlof_BengarMilizKlatschen,0,3);
	B_CloseTopic_Now(TOPIC_JarvisSLDKo,MIS_Jarvis_SldKO,0,2);
	B_CloseTopic_Now(TOPIC_CordProve,0,Cord_Approved,2);
	B_CloseTopic_Now(Topic_CipherHerb,MIS_Cipher_BringWeed,0,2);
	B_CloseTopic_Now(Topic_CipherPaket,MIS_Cipher_Paket,0,6);
	B_CloseTopic_Now(Topic_RodWette,0,Rod_WetteGewonnen,2);
	B_CloseTopic_Now(TOPIC_FesterRauber,MIS_Fester_KillBugs,0,6);
	B_CloseTopic_Now(TOPIC_TheklaEintopf,MIS_Thekla_Paket,0,6);
	B_CloseTopic_Now(TOPIC_SagittaHerb,MIS_Sagitta_Herb,0,6);
	B_CloseTopic_Now(TOPIC_PepeWolves,MIS_Pepe_KillWolves,0,6);
	B_CloseTopic_Now(TOPIC_KickBullco,MIS_Pepe_KickBullco,0,4);
	B_CloseTopic_Now(TOPIC_Frieden,MIS_Lee_Friedensangebot,0,6);
	B_CloseTopic_Now(Topic_MISOLDWORLD,MIS_OLDWORLD,0,3);
	B_CloseTopic_Now(TOPIC_ScoutMine,MIS_ScoutMine,0,3);
	B_CloseTopic_Now(TOPIC_RescueGorn,MIS_RescueGorn,0,3);
	B_CloseTopic_Now(TOPIC_FajethKillSnapper,MIS_Fajeth_Kill_Snapper,0,3);
	B_CloseTopic_Now(Topic_OricBruder,0,OricBruder,3);
	B_CloseTopic_Now(TopicBrutusKasse,0,Brutus_TeachSTR,6);
	B_CloseTopic_Now(Topic_TengronRing,0,TengronRing,6);
	B_CloseTopic_Now(TOPIC_BringMeat,MIS_Engor_BringMeat,0,6);
	B_CloseTopic_Now(TOPIC_BilgotEscort,MIS_RescueBilgot,TschuessBilgot,6);
	B_CloseTopic_Now(Topic_MarcosJungs,MIS_Marcos_Jungs,0,3);
	B_CloseTopic_Now(TOPIC_Botschaft,MIS_Vatras_Message,0,6);
	B_CloseTopic_Now(TOPIC_Lutero,Lutero_Krallen,0,6);
	B_CloseTopic_Now(TOPIC_Fernando,MIS_SalandrilOre,0,6);
	B_CloseTopic_Now(TOPIC_PyrokarClearDemonTower,MIS_PyrokarClearDemonTower,0,6);
	B_CloseTopic_Now(TOPIC_HyglasBringBook,MIS_HyglasBringBook,0,6);
	B_CloseTopic_Now(Topic_BabosDocs,MIS_BabosDocs,0,6);
	B_CloseTopic_Now(TOPIC_Wolf_BringCrawlerPlates,MIS_Wolf_BringCrawlerPlates,0,6);
	B_CloseTopic_Now(TOPIC_HelpDiegoNW,MIS_HelpDiegoNW,0,6);
	B_CloseTopic_Now(TOPIC_DiegosResidence,MIS_DiegosResidence,0,6);
	B_CloseTopic_Now(TOPIC_NOVICECANJOIN,MIS_NOVICECANJOIN,0,2);
	B_CloseTopic_Now(TOPIC_HARLOKJOINPSI,HARLOK_BRINGJOINTS,0,2);
	B_CloseTopic_Now(TOPIC_VIRANBRINGSTEEL,VIRAN_BRINGSTEEL,0,2);
	B_CloseTopic_Now(TOPIC_PLANTSFORBAALCADAR,MIS_PLANTSFORBAALCADAR,0,2);
	B_CloseTopic_Now(TOPIC_CAINSENTTOCADAR,MIS_CAINSENTTOCADAR,0,2);
	B_CloseTopic_Now(TOPIC_NAMIBWORK,MIS_NAMIBWORK,0,2);
	B_CloseTopic_Now(TOPIC_RECEPTFORTYON,MIS_RECEPTFORTYON,0,2);
	B_CloseTopic_Now(TOPIC_ORUNPACKET,MIS_ORUNPACKET,0,2);
	B_CloseTopic_Now(TOPIC_Addon_PickForConstantino,MIS_Addon_Lester_PickForConstantino,Mil_310_schonmalreingelassen,3);
	B_CloseTopic_Now(TOPIC_Addon_Greg_NW,MIS_Addon_Greg_RakeCave,ENTERED_ADDONWORLD,3);
	B_CloseTopic_Now(TOPIC_Addon_Ornament,0,ENTERED_ADDONWORLD,3);
	B_CloseTopic_Now(TOPIC_Addon_RingOfWater,RangerMeetingRunning,0,3);
	B_CloseTopic_Now(TOPIC_Addon_HolRiordian,MIS_Addon_Saturas_BringRiordian2Me,0,3);
	B_CloseTopic_Now(TOPIC_Addon_CavalornTheHut,0,TOPIC_End_CavalornTheHut,6);
	B_CloseTopic_Now(TOPIC_Addon_KillBrago,MIS_Addon_Cavalorn_KillBrago,0,3);
	B_CloseTopic_Now(TOPIC_Addon_Bandittrader,MIS_Vatras_FindTheBanditTrader,0,6);
	B_CloseTopic_Now(TOPIC_Addon_MissingPeople,0,Sklaven_Flucht,6);
	B_CloseTopic_Now(TOPIC_Addon_WhoStolePeople,MIS_Addon_Vatras_WhereAreMissingPeople,0,6);
	B_CloseTopic_Now(TOPIC_Addon_BringRangerToLares,MIS_Lares_BringRangerToMe,0,4);
	B_CloseTopic_Now(TOPIC_Addon_KDW,0,ENTERED_ADDONWORLD,4);
	B_CloseTopic_Now(TOPIC_Addon_TeleportsNW,0,SCUsed_AllNWTeleporststones,6);
	B_CloseTopic_Now(TOPIC_Addon_RangerHelpKDF,MIS_Addon_Daron_GetStatue,TOPIC_End_RangerHelpKDF,2);
	B_CloseTopic_Now(TOPIC_Addon_RangerHelpSLD,SLD_Aufnahme,TOPIC_End_RangerHelpSLD,2);
	B_CloseTopic_Now(TOPIC_Addon_RangerHelpMIL,MIL_Aufnahme,0,2);
	B_CloseTopic_Now(TOPIC_Addon_Stoneplates,0,PLAYER_TALENT_FOREIGNLANGUAGE,4);
	B_CloseTopic_Now(TOPIC_Addon_FarimsFish,MIS_Addon_Farim_PaladinFisch,0,6);
	B_CloseTopic_Now(TOPIC_Addon_Lucia,0,TOPIC_END_Lucia,6);
	B_CloseTopic_Now(TOPIC_Addon_Erol,MIS_Addon_Erol_BanditStuff,0,4);
	B_CloseTopic_Now(TOPIC_Addon_Joe,0,TOPIC_END_Joe,4);
	B_CloseTopic_Now(TOPIC_Addon_BromorsGold,MIS_Bromor_LuciaStoleGold,0,6);
	B_CloseTopic_Now(TOPIC_Addon_BaltramSkipTrade,0,TOPIC_END_BaltramSkipTrade,6);
	B_CloseTopic_Now(TOPIC_Addon_TeleportsADW,0,SC_ADW_ActivatedAllTelePortStones,6);
	B_CloseTopic_Now(TOPIC_Addon_Sklaven,0,Sklaven_Flucht,6);
	B_CloseTopic_Now(TOPIC_Addon_RavenKDW,0,RavenIsDead,4);
	B_CloseTopic_Now(TOPIC_Addon_Relicts,0,Saturas_SCBroughtAllToken,4);
	B_CloseTopic_Now(TOPIC_Addon_Lance,0,TOPIC_End_Lance,6);
	B_CloseTopic_Now(TOPIC_Addon_HousesOfRulers,MIS_Riordian_HousesOfRulers,RavenIsDead,6);
	B_CloseTopic_Now(TOPIC_Addon_CanyonOrcs,0,TOPIC_END_CanyonOrcs,6);
	B_CloseTopic_Now(TOPIC_Addon_BDTRuestung,PlayerGetBDTArmor,0,6);
	B_CloseTopic_Now(TOPIC_Addon_Quarhodron,0,Saturas_KnowsHow2GetInTempel,4);
	B_CloseTopic_Now(TOPIC_Addon_Kammern,RavenAwayDone,0,4);
	B_CloseTopic_Now(TOPIC_Addon_Klaue,0,BeliarsWeaponUpgrated,999);
	B_CloseTopic_Now(TOPIC_Addon_Klaue,0,TOPIC_END_Klaue,6);
	B_CloseTopic_Now(TOPIC_Addon_Flut,0,TOPIC_END_Flut,4);
	B_CloseTopic_Now(TOPIC_Addon_VatrasAbloesung,0,VatrasCanLeaveTown_Kap3,4);
	B_CloseTopic_Now(TOPIC_Bronkoeingeschuechtert,MIS_Sekob_Bronko_eingeschuechtert,0,6);
	B_CloseTopic_Now(TOPIC_AkilsSLDStillthere,0,TOPIC_END_AkilsSLDStillthere,6);
	B_CloseTopic_Now(TOPIC_Wettsaufen,MIS_Rukhar_Wettkampf,0,6);
	B_CloseTopic_Now(TOPIC_GaanSchnaubi,MIS_Gaan_Snapper,0,6);
	B_CloseTopic_Now(TOPIC_GromAskTeacher,0,Grom_TeachAnimalTrophy,6);
	B_CloseTopic_Now(TOPIC_DragomirsArmbrust,MIS_DragomirsArmbrust,0,6);
	B_CloseTopic_Now(TOPIC_KillLighthouseBandits,MIS_Jack_KillLighthouseBandits,0,6);
	B_CloseTopic_Now(TOPIC_Torlof_Dmt,MIS_Torlof_Dmt,0,6);
	B_CloseTopic_Now(TOPIC_HannaRetrieveLetter,MIS_HannaRetrieveLetter,0,6);
	B_CloseTopic_Now(Topic_MarcosJungs,MIS_Marcos_Jungs,0,6);
	B_CloseTopic_Now(TOPIC_Buster_KillShadowbeasts,MIS_Buster_KillShadowbeasts_DJG,0,6);
	B_CloseTopic_Now(TOPIC_Ulthar_HeileSchreine_PAL,MIS_Ulthar_HeileSchreine_PAL,0,6);
	B_CloseTopic_Now(TOPIC_DEMENTOREN,0,TOPIC_END_DEMENTOREN,999);
	B_CloseTopic_Now(TOPIC_INNOSEYE,0,TOPIC_END_INNOSEYE,4);
	B_CloseTopic_Now(TOPIC_TraitorPedro,MIS_TraitorPedro,SCFoundPedro,999);
	B_CloseTopic_Now(TOPIC_SekobDMT,0,TOPIC_END_SekobDMT,6);
	B_CloseTopic_Now(TOPIC_AkilSchafDiebe,MIS_Akil_SchafDiebe,0,6);
	B_CloseTopic_Now(TOPIC_HealHilda,MIS_HealHilda,0,6);
	B_CloseTopic_Now(TOPIC_MalethsGehstock,0,TOPIC_END_MalethsGehstock,6);
	B_CloseTopic_Now(TOPIC_BengarALLEIN,MIS_GetMalakBack,0,6);
	B_CloseTopic_Now(TOPIC_BengarALLEIN,MIS_BengarsHelpingSLD,0,6);
	B_CloseTopic_Now(TOPIC_MinenAnteile,0,TOPIC_END_MinenAnteile,6);
	B_CloseTopic_Now(TOPIC_RichterLakai,MIS_Lee_JudgeRichter,0,6);
	B_CloseTopic_Now(TOPIC_KillHoshPak,MIS_KillHoshPak,0,6);
	B_CloseTopic_Now(TOPIC_Urshak,MIS_UrshakShaman,0,6);
	B_CloseTopic_Now(TOPIC_DRACHENJAGD,0,MIS_AllDragonsDead,5);
	B_CloseTopic_Now(TOPIC_LobartsOrKProblem,0,TOPIC_END_LobartsOrKProblem,6);
	B_CloseTopic_Now(TOPIC_SylvioKillIceGolem,MIS_DJG_Sylvio_KillIceGolem,TOPIC_END_SylvioKillIceGolem,6);
	B_CloseTopic_Now(TOPIC_Dragonhunter,0,MIS_AllDragonsDead,5);
	B_CloseTopic_Now(TOPIC_AngarsAmulett,0,DJG_AngarGotAmulett,5);
	B_CloseTopic_Now(TOPIC_JanBecomesSmith,MIS_JanBecomesSmith,0,6);
	B_CloseTopic_Now(TOPIC_FerrosSword,MIS_FErrosSword,0,6);
	B_CloseTopic_Now(TOPIC_DRACHENEIER,0,TOPIC_END_DRACHENEIER,6);
	B_CloseTopic_Now(TOPIC_DRACHENEIERNeoras,MIS_Neoras_DragonEgg,0,6);
	B_CloseTopic_Now(TOPIC_OrcElite,0,TOPIC_END_OrcElite,6);
	B_CloseTopic_Now(TOPIC_KillTrollBlack,MIS_Raoul_KillTrollBlack,0,6);
	B_CloseTopic_Now(TOPIC_Dar_BringOrcEliteRing,MIS_Dar_BringOrcEliteRing,0,6);
	B_CloseTopic_Now(TOPIC_FoundVinosKellerei,0,FoundVinosKellerei,6);
	B_CloseTopic_Now(TOPIC_BrutusMeatbugs,0,TOPIC_END_BrutusMeatbugs,6);
	B_CloseTopic_Now(TOPIC_GeroldGiveFood,MIS_GeroldGiveFood,0,6);
	B_CloseTopic_Now(TOPIC_Sengrath_Missing,0,TOPIC_END_Sengrath_Missing,6);
	B_CloseTopic_Now(TOPIC_Talbin_Runs,0,TOPIC_END_Talbin_Runs,6);
	B_CloseTopic_Now(TOPIC_KerolothsGeldbeutel,0,TOPIC_END_KerolothsGeldbeutel,6);
	B_CloseTopic_Now(TOPIC_BuchHallenVonIrdorath,0,MIS_SCKnowsWayToIrdorath,6);
	B_CloseTopic_Now(TOPIC_bringRosiBackToSekob,MIS_bringRosiBackToSekob,0,6);
	B_CloseTopic_Now(TOPIC_RosisFlucht,MIS_RosisFlucht,0,6);
	B_CloseTopic_Now(TOPIC_HealRandolph,MIS_HealRandolph,0,6);
	B_CloseTopic_Now(TOPIC_HallenVonIrdorath,0,UndeadDragonIsDead,999);
	B_CloseTopic_Now(TOPIC_MyCrew,0,UndeadDragonIsDead,999);
	B_CloseTopic_Now(TOPIC_SCATTYCHEST,SCATTYCHESTDONE,0,6);
	B_CloseTopic_Now(TOPIC_ADW_NEWSVATRAS,NEWSFORVATRAS,0,6);
	B_CloseTopic_Now(TOPIC_ADW_ORCINVASION,AWORCINVASIONSTOP,0,999);
	B_CloseTopic_Now(TOPIC_HUMANINVALLEY,MIS_SAVEHUMANEND,0,6);
	B_CloseTopic_Now(TOPIC_URNAZULRAGE,AZGOLORCOMPLETE,0,999);
	B_CloseTopic_Now(TOPIC_ULUMULUFIND,FINDULUMULU,0,6);
	B_CloseTopic_Now(TOPIC_TARROKWOUND,TARROKHEALTHY,0,6);
	B_CloseTopic_Now(TOPIC_HUNTERSWORK,MIS_HUNTERSWORK,0,6);
	B_CloseTopic_Now(TOPIC_WOLFFURFALK,MIS_WOLFFURFALK,0,6);
	B_CloseTopic_Now(TOPIC_LURKERCLAW,MIS_LURKERCLAW,0,6);
	B_CloseTopic_Now(TOPIC_DRGSNPHORN,MIS_DRGSNPHORN,0,6);
	B_CloseTopic_Now(TOPIC_RAFFABOW,MIS_RAFFABOW,0,6);
	B_CloseTopic_Now(TOPIC_BLACKTROLLPARI,MIS_BLACKTROLLPARI,0,6);
	B_CloseTopic_Now(TOPIC_THORUSGUARD,THORUSACCEPTMEGUARD,0,6);
	B_CloseTopic_Now(TOPIC_MAGICINNOSARMOR,EQUIPBLESSEDARMOR,0,999);
	B_CloseTopic_Now(TOPIC_KORANGARMEET,MIS_KORANGAR,0,6);
	B_CloseTopic_Now(TOPIC_TARACOTHAMMER,MIS_TARACOTHAMMER,0,6);
	B_CloseTopic_Now(TOPIC_VIPERNUGGETS,MIS_VIPERNUGGETS,0,6);
	B_CloseTopic_Now(TOPIC_WATERMAGELETTER,MIS_WATERMAGELETTER,0,6);
	B_CloseTopic_Now(TOPIC_PALADINWATCH,MIS_PALADINWATCH,0,6);
	B_CloseTopic_Now(TOPIC_SEKTEHEILEN,MIS_SEKTEHEILEN,0,6);
	B_CloseTopic_Now(TOPIC_GUARDIANS,MIS_GUARDIANS,0,999);
	B_CloseTopic_Now(TOPIC_TALIASANHELP,MIS_TALIASANHELP,0,6);
	B_CloseTopic_Now(TOPIC_LUTEROHELP,MIS_LUTEROHELP,0,6);
	B_CloseTopic_Now(TOPIC_FERNANDOHELP,MIS_FERNANDOHELP,0,6);
	B_CloseTopic_Now(TOPIC_IGNAZHELP,MIS_IGNAZHELP,0,6);
	B_CloseTopic_Now(TOPIC_GERBRANDTHELP,MIS_GERBRANDTHELP,0,6);
	B_CloseTopic_Now(TOPIC_SALANDRILHELP,MIS_SALANDRILHELP,0,6);
	B_CloseTopic_Now(TOPIC_VALENTINOHELP,MIS_VALENTINOHELP,0,6);
	B_CloseTopic_Now(TOPIC_HROMANINQUEST,MIS_HROMANINQUEST,0,6);
	B_CloseTopic_Now(TOPIC_GUILDKILL,MIS_GUILDKILL,0,6);
	B_CloseTopic_Now(TOPIC_KILLWAY,MIS_KILLWAY,0,6);
	B_CloseTopic_Now(TOPIC_KILLWAMBO,MIS_KILLWAMBO,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGET1,MIS_KILLTARGET1,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGET2,MIS_KILLTARGET2,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGET3,MIS_KILLTARGET3,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGET4,MIS_KILLTARGET4,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGET5,MIS_KILLTARGET5,0,6);
	B_CloseTopic_Now(TOPIC_KILLTARGETFINAL,KILLTARGETFINAL,0,6);
	B_CloseTopic_Now(TOPIC_NIGELMATTER,MIS_NIGELMATTER,0,6);
	B_CloseTopic_Now(TOPIC_TRADEGUILD,MIS_TRADEGUILD,0,5);
	B_CloseTopic_Now(TOPIC_BENGARORDER,MIS_BENGARORDER,0,6);
	B_CloseTopic_Now(TOPIC_JORAHELP,MIS_JORAHELP,0,6);
	B_CloseTopic_Now(TOPIC_CHURCHDEAL,MIS_CHURCHDEAL,0,6);
	B_CloseTopic_Now(TOPIC_RARETHINGS,MIS_RARETHINGS,0,6);
	B_CloseTopic_Now(TOPIC_BLACKBRENDI,MIS_BLACKBRENDI,0,6);
	B_CloseTopic_Now(TOPIC_PALADINFOOD,MIS_PALADINFOOD,0,6);
	B_CloseTopic_Now(TOPIC_SARAHTOGUILD,MIS_SARAHTOGUILD,0,6);
	B_CloseTopic_Now(TOPIC_ONARBUSINESS,MIS_ONARBUSINESS,0,6);
	B_CloseTopic_Now(TOPIC_RESCUEGOMEZ,MIS_RESCUEGOMEZ,0,6);
	B_CloseTopic_Now(TOPIC_SARAHELPSTHREE,MIS_SARAHELPSTHREE,0,6);
	B_CloseTopic_Now(TOPIC_SARAHELPSTWO,MIS_SARAHELPSTWO,0,6);
	B_CloseTopic_Now(TOPIC_SARAHELPSONE,MIS_SARAHELPSONE,0,6);
	B_CloseTopic_Now(TOPIC_ORTOHUNT,MIS_ORTOHUNT,0,6);
	B_CloseTopic_Now(TOPIC_LANZRING,MIS_LANZRING,0,6);
	B_CloseTopic_Now(TOPIC_FERDSPECWINE,MIS_FERDSPECWINE,0,6);
	B_CloseTopic_Now(TOPIC_FERDSILVERCUP,MIS_FERDSILVERCUP,0,6);
	B_CloseTopic_Now(TOPIC_RAYNEHELP,MIS_RAYNEHELP,0,6);
	B_CloseTopic_Now(TOPIC_ABIGEILMISSWEAPON,MIS_ABIGEILMISSWEAPON,0,6);
	B_CloseTopic_Now(TOPIC_ABIGEILHELPHANNA,MIS_ABIGEILHELPHANNA,0,6);
	B_CloseTopic_Now(TOPIC_MISSGRITTA,MIS_MISSGRITTA,0,6);
	B_CloseTopic_Now(TOPIC_FINDLOSTHUSB,MIS_FINDLOSTHUSB,0,6);
	B_CloseTopic_Now(TOPIC_ELVRIHMARRYGRITTA,MIS_ELVRIHMARRYGRITTA,0,6);
	B_CloseTopic_Now(TOPIC_REZEPTFORBAALCADAR,MIS_REZEPTFORBAALCADAR,0,6);
	B_CloseTopic_Now(TOPIC_GOBLINAWAY,MIS_GOBLINAWAY,0,6);
	B_CloseTopic_Now(TOPIC_MADERZ,MIS_MADERZ,0,6);
	B_CloseTopic_Now(TOPIC_XARDASNDMTASKSONE,MIS_XARDASNDMTASKSONE,0,6);
	B_CloseTopic_Now(TOPIC_XARDASNDMTASKSTWO,MIS_XARDASNDMTASKSTWO,0,6);
	B_CloseTopic_Now(TOPIC_INSORCWARRIOR,MIS_INSORCWARRIOR,0,6);
	B_CloseTopic_Now(TOPIC_INSWOLFHIDE,MIS_INSWOLFHIDE,0,6);
	B_CloseTopic_Now(TOPIC_INSBLACKSANPPER,MIS_INSBLACKSANPPER,0,6);
	B_CloseTopic_Now(TOPIC_INSSHADOWBEAST,MIS_INSSHADOWBEAST,0,6);
	B_CloseTopic_Now(TOPIC_INSLUKER,MIS_INSLUKER,0,6);
	B_CloseTopic_Now(TOPIC_INSVEPR,MIS_INSVEPR,0,6);
	B_CloseTopic_Now(TOPIC_LESTERGETSMOKE,MIS_LESTERGETSMOKE,0,6);
	B_CloseTopic_Now(TOPIC_RAFFATELLSPECIAL,MIS_RAFFATELLSPECIAL,0,6);
	B_CloseTopic_Now(TOPIC_BAREMCRAWLERARMOR,MIS_BAREMCRAWLERARMOR,0,6);
	B_CloseTopic_Now(TOPIC_LETTERFALK,MIS_LETTERFALK,0,6);
	B_CloseTopic_Now(TOPIC_SHADOWFURNIX,MIS_SHADOWFURNIX,0,6);
	B_CloseTopic_Now(TOPIC_GROMTROLLS,MIS_GROMTROLLS,0,6);
	B_CloseTopic_Now(TOPIC_RECOVERDOG,MIS_RECOVERDOG,0,6);
	B_CloseTopic_Now(TOPIC_FALKGRANDFATHERSEEK,MIS_FALKGRANDFATHERSEEK,0,6);
	B_CloseTopic_Now(TOPIC_HUNTERCHALLANGE,MIS_HUNTERCHALLANGE,0,6);
	B_CloseTopic_Now(TOPIC_XARDASTASKSTHREE,MIS_XARDASTASKSTHREE,0,6);
	B_CloseTopic_Now(TOPIC_LOSTISLAND,MIS_LOSTISLAND,0,999);
	B_CloseTopic_Now(TOPIC_REPAIRSHIP,MIS_REPAIRSHIP,0,999);
	B_CloseTopic_Now(TOPIC_MISSMYGOLD,MIS_MISSMYGOLD,0,999);
	B_CloseTopic_Now(TOPIC_FINDMAGICORECAVE,MIS_FINDMAGICORECAVE,0,999);
	B_CloseTopic_Now(TOPIC_GATHERCREW,MIS_GATHERCREW,0,999);
	B_CloseTopic_Now(TOPIC_BRINGFOOD,MIS_BRINGFOOD,0,999);
	B_CloseTopic_Now(TOPIC_DRAKARBROKE,MIS_DRAKARBROKE,0,6);
	B_CloseTopic_Now(TOPIC_ORCORDER,MIS_ORCORDER,0,6);
	B_CloseTopic_Now(TOPIC_CHANGECOURSE,MIS_CHANGECOURSE,0,999);
	B_CloseTopic_Now(TOPIC_HELPPEDRO,MIS_HELPPEDRO,0,999);
	B_CloseTopic_Now(TOPIC_DIEGOILL,MIS_DIEGOILL,0,999);
	B_CloseTopic_Now(TOPIC_MILTENANCIENT,MIS_MILTENANCIENT,0,999);
	B_CloseTopic_Now(TOPIC_REDJOINT,MIS_REDJOINT,0,999);
	B_CloseTopic_Now(TOPIC_XARDASTASKSFOUR,MIS_XARDASTASKSFOUR,0,6);
	B_CloseTopic_Now(TOPIC_GUARDIANSTEST,MIS_GUARDIANSTEST,0,999);
	B_CloseTopic_Now(TOPIC_STONNOSTEST,MIS_STONNOSTEST,0,999);
	B_CloseTopic_Now(TOPIC_WAKONTEST,MIS_WAKONTEST,0,999);
	B_CloseTopic_Now(TOPIC_NARUSTEST,MIS_NARUSTEST,0,999);
	B_CloseTopic_Now(TOPIC_GADERTEST,MIS_GADERTEST,0,999);
	B_CloseTopic_Now(TOPIC_FARIONTEST,MIS_FARIONTEST,0,999);
	B_CloseTopic_Now(TOPIC_DEMOSTEST,MIS_DEMOSTEST,0,999);
	B_CloseTopic_Now(TOPIC_KELIOSTEST,MIS_KELIOSTEST,0,999);
	B_CloseTopic_Now(TOPIC_TEGONTEST,MIS_TEGONTEST,0,999);
	B_CloseTopic_Now(TOPIC_MORIUSTEST,MIS_MORIUSTEST,0,999);
	B_CloseTopic_Now(TOPIC_DAGOTTEST,MIS_DAGOTTEST,0,999);
	B_CloseTopic_Now(TOPIC_TROKARMISS,MIS_TROKARMISS,0,6);
	B_CloseTopic_Now(TOPIC_ORCGREATWAR,MIS_ORCGREATWAR,0,999);
	B_CloseTopic_Now(TOPIC_HELPCREW,MIS_HELPCREW,0,999);
	B_CloseTopic_Now(TOPIC_RESCUEGAROND,MIS_RESCUEGAROND,0,999);
	B_CloseTopic_Now(TOPIC_NATANDOLG,MIS_NATANDOLG,0,999);
	B_CloseTopic_Now(TOPIC_NEWSSURVIVERS,MIS_NEWSSURVIVERS,0,999);
	B_CloseTopic_Now(TOPIC_STURMCASTLE,MIS_STURMCASTLE,0,999);
	B_CloseTopic_Now(TOPIC_CHALLANGEORC,MIS_CHALLANGEORC,0,999);
	B_CloseTopic_Now(TOPIC_KILLURTRALL,MIS_KILLURTRALL,0,999);
	B_CloseTopic_Now(TOPIC_KILLDRAGONHUNTER,MIS_KILLDRAGONHUNTER,0,999);
	B_CloseTopic_Now(TOPIC_POISONNEED,MIS_POISONNEED,0,6);
	B_CloseTopic_Now(TOPIC_KILLIGNAZ,MIS_KILLIGNAZ,0,6);
	B_CloseTopic_Now(TOPIC_GORNAKOSHSPEEDPOTION,MIS_GORNAKOSHSPEEDPOTION,0,999);
	B_CloseTopic_Now(TOPIC_RESTOREHRAM,MIS_RESTOREHRAM,0,999);
	B_CloseTopic_Now(TOPIC_RAVENTHREAT,MIS_RAVENTHREAT,0,6);
	B_CloseTopic_Now(TOPIC_PIRATENEEDSHIP,MIS_PIRATENEEDSHIP,0,999);
	B_CloseTopic_Now(TOPIC_HUNTERSARMOR,MIS_HUNTERSARMOR,0,999);
	B_CloseTopic_Now(TOPIC_OREWEAPONSLD,MIS_OREWEAPONSLD,0,999);
	B_CloseTopic_Now(TOPIC_OLDGUARDGOWAR,MIS_OLDGUARDGOWAR,0,999);
	B_CloseTopic_Now(TOPIC_DIEGOOLDFRIENS,MIS_DIEGOOLDFRIENS,0,999);
	B_CloseTopic_Now(TOPIC_STRANGETHINGS,MIS_STRANGETHINGS,0,999);
	B_CloseTopic_Now(TOPIC_ORUNHELPSHIP,MIS_ORUNHELPSHIP,0,6);
	B_CloseTopic_Now(TOPIC_KILLTHEMALL,MIS_KILLTHEMALL,0,999);
	B_CloseTopic_Now(TOPIC_RUNEMAGICNOTWORK,MIS_RUNEMAGICNOTWORK,0,999);
	B_CloseTopic_Now(TOPIC_BEWAREWATERMAGE,MIS_BEWAREWATERMAGE,0,999);
	B_CloseTopic_Now(TOPIC_MONASTERYSIEDGE,MIS_MONASTERYSIEDGE,0,999);
	B_CloseTopic_Now(TOPIC_HORINISFREE,MIS_HORINISFREE,0,999);
	B_CloseTopic_Now(TOPIC_SALETOBIGLAND,MIS_SALETOBIGLAND,0,999);
	B_CloseTopic_Now(TOPIC_BELIARHELPME,MIS_BELIARHELPME,0,6);
	B_CloseTopic_Now(TOPIC_Lobart_Psicamp,MIS_Lobart_Psicamp,0,6);
	B_CloseTopic_Now(TOPIC_SnafsRecipe,MIS_SnafsRecipe,0,6);
	B_CloseTopic_Now(Topic_Orcwayhero,MIS_Orcwayhero,0,6);
	B_CloseTopic_Now(Topic_HeroOrcJoin,MIS_HeroOrcJoin,0,6);
	B_CloseTopic_Now(TOPIC_HeroOrcJoin_T1,MIS_HeroOrcJoin_T1,0,6);
	B_CloseTopic_Now(TOPIC_HeroOrcJoin_T2,MIS_HeroOrcJoin_T2,0,6);
	B_CloseTopic_Now(TOPIC_OldOrcKey,MIS_OldOrcKey,0,999);
	B_CloseTopic_Now(TOPIC_NagDumgar,MIS_NagDumgar,0,6);
	B_CloseTopic_Now(TOPIC_TagNorRespect,MIS_TagNorRespect,0,6);
	B_CloseTopic_Now(TOPIC_TagNorGrHunWeap,MIS_TagNorGrHunWeap,0,6);
	B_CloseTopic_Now(TOPIC_PaladinGoods,MIS_PaladinGoods,0,6);
	B_CloseTopic_Now(TOPIC_PaladinCamp,MIS_PaladinCamp,0,6);
	B_CloseTopic_Now(TOPIC_JobInCamp,MIS_JobInCamp,0,6);
	B_CloseTopic_Now(TOPIC_PW_GOLDSHAHT,MIS_PW_GOLDSHAHT,0,6);
	B_CloseTopic_Now(TOPIC_PW_FollowGoldOre,MIS_PW_FollowGoldOre,0,6);
	B_CloseTopic_Now(TOPIC_PW_PoisonNrozas,MIS_PW_PoisonNrozas,0,6);
	B_CloseTopic_Now(TOPIC_TrueBattle,MIS_TrueBattle,0,6);
	B_CloseTopic_Now(TOPIC_NrozasPoisonGift,MIS_NrozasPoisonGift,0,6);
	B_CloseTopic_Now(TOPIC_BeliarTribe,MIS_BeliarTribe,0,6);
	B_CloseTopic_Now(TOPIC_OsairTrait,MIS_OsairTrait,0,6);
	B_CloseTopic_Now(TOPIC_Skip_NW_Sable,MIS_Skip_NW_Sable,0,6);
	B_CloseTopic_Now(TOPIC_MoonBlades,MIS_MoonBlades,0,6);
	B_CloseTopic_Now(TOPIC_CareOsair,MIS_CareOsair,0,6);
	B_CloseTopic_Now(TOPIC_HaniarSecret,MIS_HaniarSecret,0,6);
	B_CloseTopic_Now(TOPIC_AdanosCrone,MIS_AdanosCrone,0,6);
	B_CloseTopic_Now(TOPIC_DobarCoal,MIS_DobarCoal,0,4);
	B_CloseTopic_Now(TOPIC_EngromGoblins,MIS_EngromGoblins,0,4);
	B_CloseTopic_Now(TOPIC_WulfgarBandits,MIS_WulfgarBandits,0,6);
	B_CloseTopic_Now(TOPIC_OricStatue,MIS_OricStatue,0,6);
	B_CloseTopic_Now(TOPIC_LanceChange,MIS_LanceChange,0,6);
	B_CloseTopic_Now(TOPIC_HaradOrcWar,MIS_HaradOrcWar,0,6);
	B_CloseTopic_Now(TOPIC_JessArmor,MIS_JessArmor,0,6);
	B_CloseTopic_Now(TOPIC_NewHunters,MIS_NewHunters,0,6);
	B_CloseTopic_Now(TOPIC_KillPaladinCastle,MIS_KillPaladinCastle,0,6);
	B_CloseTopic_Now(TOPIC_XardasWay,MIS_XardasWay,0,6);
	B_CloseTopic_Now(TOPIC_Alligator,MIS_Alligator,0,6);
	B_CloseTopic_Now(TOPIC_PirateRing,MIS_PirateRing,0,5);
	B_CloseTopic_Now(TOPIC_PiratePray,MIS_PiratePray,0,4);
	B_CloseTopic_Now(TOPIC_OrcBiter,MIS_OrcBiter,0,6);
	B_CloseTopic_Now(TOPIC_NeedSteel,MIS_NeedSteel,0,6);
	B_CloseTopic_Now(TOPIC_MyBrew,MIS_MyBrew,0,6);
	B_CloseTopic_Now(TOPIC_LostPaladins,MIS_LostPaladins,0,6);
	B_CloseTopic_Now(TOPIC_RollanFood,MIS_RollanFood,0,999);
	B_CloseTopic_Now(TOPIC_LowLevel,MIS_LowLevel,0,999);
	B_CloseTopic_Now(TOPIC_EscapeMine,MIS_EscapeMine,0,999);
	B_CloseTopic_Now(TOPIC_TrustMe,MIS_TrustMe,0,999);
	B_CloseTopic_Now(TOPIC_NeedRest,MIS_NeedRest,0,999);
	B_CloseTopic_Now(TOPIC_HildurCoal,MIS_HildurCoal,0,999);
	B_CloseTopic_Now(TOPIC_FerdPotions,MIS_FerdPotions,0,999);
	B_CloseTopic_Now(TOPIC_FerdRing,MIS_FerdRing,0,999);
	B_CloseTopic_Now(TOPIC_GrokBringPotion,MIS_GrokBringPotion,0,999);
	B_CloseTopic_Now(TOPIC_SleeperBack,MIS_SleeperBack,0,999);
	B_CloseTopic_Now(TOPIC_KrowBook,MIS_KrowBook,0,999);
	B_CloseTopic_Now(TOPIC_RemoveOrc,MIS_RemoveOrc,0,999);
	B_CloseTopic_Now(TOPIC_ElkKirka,MIS_ElkKirka,0,999);
	B_CloseTopic_Now(TOPIC_OrcArena,MIS_OrcArena,0,999);
	B_CloseTopic_Now(TOPIC_HartSword,MIS_HartSword,0,999);
	B_CloseTopic_Now(TOPIC_ArDagarKey,MIS_ArDagarKey,0,999);
	B_CloseTopic_Now(TOPIC_FatherNews,MIS_FatherNews,0,999);
	B_CloseTopic_Now(TOPIC_KlovisOre,MIS_KlovisOre,0,999);
	B_CloseTopic_Now(TOPIC_Astronomy,MIS_Astronomy,0,999);
	B_CloseTopic_Now(TOPIC_MineTeleport,MIS_MineTeleport,0,999);
	B_CloseTopic_Now(TOPIC_UrTakWannaFight,MIS_UrTakWannaFight,0,999);
	B_CloseTopic_Now(TOPIC_UrTakTeach,MIS_UrTakTeach,0,999);
	B_CloseTopic_Now(TOPIC_GarsArmor,MIS_GarsArmor,0,999);
	B_CloseTopic_Now(TOPIC_GarsFood,MIS_GarsFood,0,999);
	B_CloseTopic_Now(TOPIC_GarsWeapons,MIS_GarsWeapons,0,999);
	B_CloseTopic_Now(TOPIC_RagnarFood,MIS_RagnarFood,0,2);
	B_CloseTopic_Now(TOPIC_RagnarNeoras,MIS_RagnarNeoras,0,6);
	B_CloseTopic_Now(TOPIC_RagnarRune,MIS_RagnarRune,0,6);
	B_CloseTopic_Now(TOPIC_RagnarBandits,MIS_RagnarBandits,0,6);
	B_CloseTopic_Now(TOPIC_JewerlyForm,MIS_JewerlyForm,0,6);
	B_CloseTopic_Now(TOPIC_DarkOrden,MIS_DarkOrden,0,6);
	B_CloseTopic_Now(TOPIC_MonasterySecret,MIS_MonasterySecret,0,6);
	B_CloseTopic_Now(TOPIC_HoshNarBooks,MIS_HoshNarBooks,0,999);
	B_CloseTopic_Now(TOPIC_TrueDragonMasters,MIS_TrueDragonMasters,0,4);
	B_CloseTopic_Now(TOPIC_GroshBottle,MIS_GroshBottle,0,999);
	B_CloseTopic_Now(TOPIC_DeadHead,MIS_DeadHead,0,999);
	B_CloseTopic_Now(TOPIC_OrcHolyPlaces,MIS_OrcHolyPlaces,0,999);
	B_CloseTopic_Now(TOPIC_PsicampDemon,MIS_PsicampDemon,0,999);
	B_CloseTopic_Now(TOPIC_Constantino_LostKey,MIS_Constantino_LostKey,0,6);
	B_CloseTopic_Now(TOPIC_HashTorRule,MIS_HashTorRule,0,999);
	B_CloseTopic_Now(TOPIC_HashTorOre,MIS_HashTorOre,0,999);
	B_CloseTopic_Now(TOPIC_JarCurse,MIS_JarCurse,0,999);
	B_CloseTopic_Now(TOPIC_StrangeUpSound,MIS_StrangeUpSound,0,6);
	B_CloseTopic_Now(TOPIC_FreeTeleport,MIS_FreeTeleport,0,999);
	B_CloseTopic_Now(TOPIC_CurseAncient,MIS_CurseAncient,0,999);
	B_CloseTopic_Now(TOPIC_Qvardemon,MIS_Qvardemon,0,999);
	B_CloseTopic_Now(TOPIC_LobartMeal,MIS_LobartMeal,0,6);
	B_CloseTopic_Now(TOPIC_VatrasPotion,MIS_VatrasPotion,0,6);
	B_CloseTopic_Now(TOPIC_VatrasBeast,MIS_VatrasBeast,0,6);
	B_CloseTopic_Now(TOPIC_VatrasMagicBook,MIS_VatrasMagicBook,0,6);
	B_CloseTopic_Now(TOPIC_LeeLetter,MIS_LeeLetter,0,3);
	B_CloseTopic_Now(TOPIC_WaterMageDocuments,MIS_WaterMageDocuments,0,6);
	B_CloseTopic_Now(TOPIC_SendNorolas,MIS_SendNorolas,0,6);
	B_CloseTopic_Now(TOPIC_NeedFood,MIS_NeedFood,0,6);
	B_CloseTopic_Now(TOPIC_PirateDeal,MIS_PirateDeal,0,6);
	B_CloseTopic_Now(TOPIC_AncientRune,MIS_AncientRune,0,6);
	B_CloseTopic_Now(TOPIC_MyxirAncientBook,MIS_MyxirAncientBook,0,6);
	B_CloseTopic_Now(TOPIC_MerdarionPortal,MIS_MerdarionPortal,0,6);
	B_CloseTopic_Now(TOPIC_EscortToPirate,MIS_EscortToPirate,0,6);
	B_CloseTopic_Now(TOPIC_ORCSECRET,MIS_ORCSECRET,0,999);
	B_CloseTopic_Now(TOPIC_BELIARWILL,MIS_BELIARWILL,0,999);
	B_CloseTopic_Now(TOPIC_INNOSWILL,MIS_INNOSWILL,0,999);
	B_CloseTopic_Now(TOPIC_SagittaGuard,MIS_SagittaGuard,0,4);
	B_CloseTopic_Now(TOPIC_FindKillPlace,MIS_FindKillPlace,0,6);
	B_CloseTopic_Now(TOPIC_RichStones,MIS_RichStones,0,6);
	B_CloseTopic_Now(TOPIC_DragonTreasure,MIS_DragonTreasure,0,6);
	B_CloseTopic_Now(TOPIC_PathFromDown,MIS_PathFromDown,0,6);
	B_CloseTopic_Now(TOPIC_EddaStatue,MIS_EddaStatue,0,6);
	B_CloseTopic_Now(TOPIC_CarlCoal,MIS_CarlCoal,0,6);
	B_CloseTopic_Now(TOPIC_GarvellTools,MIS_GarvellTools,0,6);
	B_CloseTopic_Now(TOPIC_BrahimWax,MIS_BrahimWax,0,6);
	B_CloseTopic_Now(TOPIC_HalvorShells,MIS_HalvorShells,0,6);
	B_CloseTopic_Now(TOPIC_LehmarDebt,MIS_LehmarDebt,0,6);
	B_CloseTopic_Now(TOPIC_DiegoTogether,MIS_DiegoTogether,0,6);
	B_CloseTopic_Now(TOPIC_Kervo_KillLurker,MIS_Kervo_KillLurker,0,6);
	B_CloseTopic_Now(TOPIC_TaliasanFineFood,MIS_TaliasanFineFood,0,6);
	B_CloseTopic_Now(TOPIC_CoragonFixBeer,MIS_CoragonFixBeer,0,6);
	B_CloseTopic_Now(TOPIC_GoraxWineberrys,MIS_GoraxWineberrys,0,6);
	B_CloseTopic_Now(TOPIC_LemarTheft,MIS_LemarTheft,0,6);
	B_CloseTopic_Now(TOPIC_SylvioCrew,MIS_SylvioCrew,0,6);
	B_CloseTopic_Now(TOPIC_SylvioDrakar,MIS_SylvioDrakar,0,6);
	B_CloseTopic_Now(TOPIC_SylvioOrcs,MIS_SylvioOrcs,0,6);
	B_CloseTopic_Now(Topic_SylvioDebts,MIS_SylvioDebts,0,999);
	B_CloseTopic_Now(Topic_GaertnerHive,MIS_GaertnerHive,0,6);
	B_CloseTopic_Now(TOPIC_WhereFingers,MIS_WhereFingers,0,999);
	B_CloseTopic_Now(Topic_FingersOpenDoor,MIS_FingersOpenDoor,0,999);
	B_CloseTopic_Now(Topic_ScoutNewMine,MIS_ScoutNewMine,0,6);
	B_CloseTopic_Now(Topic_WolfAndMan,MIS_WolfAndMan,0,6);
	B_CloseTopic_Now(Topic_SchiffswacheRats,MIS_SchiffswacheRats,0,6);
	B_CloseTopic_Now(Topic_MoreDrugs,MIS_MoreDrugs,0,999);
	B_CloseTopic_Now(TOPIC_RoscoeMage,MIS_RoscoeMage,0,6);
	B_CloseTopic_Now(TOPIC_KharimCup,MIS_KharimCup,0,999);
	B_CloseTopic_Now(TOPIC_HanisPlants,MIS_HanisPlants,0,3);
	B_CloseTopic_Now(TOPIC_WomanForSkip,MIS_WomanForSkip,0,6);
	B_CloseTopic_Now(TOPIC_SeekerSoul,MIS_SeekerSoul,0,5);
	B_CloseTopic_Now(TOPIC_MasiafStory,MIS_MasiafStory,0,999);
	B_CloseTopic_Now(TOPIC_OCCOOKFLEE,MIS_OCCOOKFLEE,0,6);
	B_CloseTopic_Now(TOPIC_RATFORDFISK,MIS_RATFORDFISK,0,6);
	B_CloseTopic_Now(TOPIC_FINDEDOCGROUP,MIS_FINDEDOCGROUP,0,6);
	B_CloseTopic_Now(TOPIC_KILLOCELITE,MIS_KILLOCELITE,0,6);
	B_CloseTopic_Now(TOPIC_ORCTEMPLE,MIS_ORCTEMPLE,0,6);
	B_CloseTopic_Now(TOPIC_ULFRING,MIS_ULFRING,0,6);
	B_CloseTopic_Now(TOPIC_DARON_RING_TEST,MIS_DARON_RING_TEST,0,6);
	B_CloseTopic_Now(TOPIC_DARON_GIVEGOLD,MIS_DARON_GIVEGOLD,0,6);
	B_CloseTopic_Now(TOPIC_GORAX_FIND_PAPERS,MIS_GORAX_FIND_PAPERS,0,6);
	B_CloseTopic_Now(TOPIC_VINO_KILL_ORK,MIS_KILL_VINO_ORK,0,6);
	B_CloseTopic_Now(TOPIC_ROBAMATERIAL,MIS_ROBAMATERIAL,0,6);
	B_CloseTopic_Now(TOPIC_HELPKARRASBOOKS,MIS_KARRAS_BOOKS,0,6);
	B_CloseTopic_Now(TOPIC_XARDAS_ROBA,MIS_ROBA_XARDAS,0,6);
	B_CloseTopic_Now(TOPIC_KASSIAMUSIC,MIS_KASSIAMUSIC,0,6);
	B_CloseTopic_Now(TOPIC_JESPERMUSIC,MIS_JESPERMUSIC,0,2);
	B_CloseTopic_Now(TOPIC_CASSIA_STATUETTE,MISS_KASSIA_IN_GUILD,0,6);
	B_CloseTopic_Now(TOPIC_IGARANZ_NEW,MIS_Igaraz_OneMoreChance,0,6);
	B_CloseTopic_Now(TOPIC_ADDON_FARIMFISH,MIS_FARIM_QUEST,0,6);
	B_CloseTopic_Now(TOPIC_ELITE_GROUP_ORKS,MISS_ELITE_GROUP_ORKS,0,6);
	B_CloseTopic_Now(TOPIC_XARDAS_DEMON,MIS_Xardas_LastStand_Done,0,6);
	B_CloseTopic_Now(TOPIC_KILL_PALS,MIS_KILL_PALS,0,6);
	B_CloseTopic_Now(TOPIC_NrozasToOsair,MIS_NrozasToOsair,0,6);
	B_CloseTopic_Now(TOPIC_NrozasFl,MIS_NrozasFl,0,6);
	B_CloseTopic_Now(TOPIC_OsairSnappers,MIS_OsairSnappers,0,6);
	B_CloseTopic_Now(TOPIC_RebelsWeapon,MIS_RebelsWeapon,0,6);
	B_CloseTopic_Now(TOPIC_EscapeWay,MIS_EscapeWay,0,6);
	B_CloseTopic_Now(TOPIC_TiamantMuritan,MIS_TiamantMuritan,0,6);
	B_CloseTopic_Now(TOPIC_AssasinGold,MIS_AssasinGold,0,6);
	B_CloseTopic_Now(TOPIC_NrozasPacket,MIS_NrozasPacket,0,6);
	B_CloseTopic_Now(TOPIC_Orc_Pw,MIS_Orc_Pw,0,6);
	B_CloseTopic_Now(TOPIC_Orc_Pw,MIS_Orc_Pw,0,6);
	B_CloseTopic_Now(TOPIC_HasimKill,MIS_HasimKill,0,6);
	B_CloseTopic_Now(TOPIC_OreBugs,MIS_OreBugs,0,6);
	B_CloseTopic_Now(TOPIC_PW_GOLDSHAHT,MIS_PW_GOLDSHAHT,0,6);
	B_CloseTopic_Now(TOPIC_PrioratStart,MIS_PrioratStart,0,999);
	B_CloseTopic_Now(TOPIC_TrainInCamp,MIS_TrainInCamp,0,6);
	B_CloseTopic_Now(TOPIC_StrangeCave,MIS_StrangeCave,0,6);
	B_CloseTopic_Now(TOPIC_TiraksRelax,MIS_TiraksRelax,0,6);
	B_CloseTopic_Now(TOPIC_BalamProviant,MIS_BalamProviant,0,6);
	B_CloseTopic_Now(TOPIC_TiraksFur,MIS_TiraksFur,0,6);
	B_CloseTopic_Now(TOPIC_FollowMasiafLair,MIS_FollowMasiafLair,0,6);
	B_CloseTopic_Now(TOPIC_RABOGLAV,MIS_RABOGLAV,0,6);
	B_CloseTopic_Now(TOPIC_GRIMGASH,MIS_GRIMGASH,0,6);
	B_CloseTopic_Now(TOPIC_RUKVAIA,MIS_RUKVAIA,0,6);
	B_CloseTopic_Now(TOPIC_LECHENIEPEPE,MIS_LECHENIEPEPE,0,6);
	B_CloseTopic_Now(TOPIC_RavenRing,MIS_RavenRing,0,999);
	B_CloseTopic_Now(TOPIC_RodRing,MIS_RodRing,0,4);
	B_CloseTopic_Now(TOPIC_EvilTroll,MIS_EvilTroll,0,999);
	B_CloseTopic_Now(TOPIC_OldTeleports,MIS_OldTeleports,0,5);
	B_CloseTopic_Now(TOPIC_CanDoTempler,MIS_CanDoTempler,0,2);
	B_CloseTopic_Now(TOPIC_MissOldFriend,MIS_MissOldFriend,0,999);
	B_CloseTopic_Now(TOPIC_MeetNashShield,MIS_MeetNashShield,0,999);
	B_CloseTopic_Now(TOPIC_MagicPowder,MIS_MagicPowder,0,6);
	B_CloseTopic_Now(TOPIC_JackSmokePipe,MIS_JackSmokePipe,0,5);
	B_CloseTopic_Now(TOPIC_BaltramTradeAgain,MIS_BaltramTradeAgain,0,6);
	B_CloseTopic_Now(TOPIC_XRANFREG,MIS_XRANFREG,0,999);
	B_CloseTopic_Now(TOPIC_OddlerlTools,MIS_OddlerlTools,0,999);
	B_CloseTopic_Now(TOPIC_GrumLockProve,MIS_GrumLockProve,0,999);
	B_CloseTopic_Now(TOPIC_FreePrice,MIS_FreePrice,0,999);
	B_CloseTopic_Now(TOPIC_ClansWar,MIS_ClansWar,0,999);
	B_CloseTopic_Now(TOPIC_BetterArmor,MIS_BetterArmor,0,999);
	B_CloseTopic_Now(TOPIC_AppleTest,MIS_AppleTest,0,2);
	B_CloseTopic_Now(TOPIC_LoaRomance,MIS_LoaRomance,0,999);
	B_CloseTopic_Now(TOPIC_MeetWithDark,MIS_MeetWithDark,0,999);
	B_CloseTopic_Now(TOPIC_Coragon_Silber,MIS_Coragon_Silber,0,6);
	B_CloseTopic_Now(TOPIC_HAGENKILLDMT,MIS_HAGENKILLDMT,0,6);
	B_CloseTopic_Now(TOPIC_MYNEWMANSION,MIS_MYNEWMANSION,0,999);
	B_CloseTopic_Now(TOPIC_PPL_FOR_TOWER,MIS_PPL_FOR_TOWER,0,999);
	B_CloseTopic_Now(TOPIC_DTOLDNEWMINE,MIS_DTOLDNEWMINE,0,6);
	B_CloseTopic_Now(TOPIC_GoblinTotem,MIS_GoblinTotem,0,999);
	B_CloseTopic_Now(TOPIC_Hilda_SharpKnife,MIS_Hilda_SharpKnife,0,6);
	B_CloseTopic_Now(TOPIC_Miss_Brother,MIS_Miss_Brother,0,999);
	B_CloseTopic_Now(TOPIC_DeadOrAlive,MIS_DeadOrAlive,0,6);
	B_CloseTopic_Now(TOPIC_Gorax_KillPedro,MIS_Gorax_KillPedro,0,999);
	B_CloseTopic_Now(TOPIC_TRADEHELPER,MIS_TRADEHELPER,0,6);
	B_CloseTopic_Now(TOPIC_TyonMandibuls,MIS_TyonMandibuls,0,6);
	B_CloseTopic_Now(TOPIC_SwampSecret,MIS_SwampSecret,0,999);
	B_CloseTopic_Now(TOPIC_DarkWeb,MIS_DarkWeb,0,6);
	B_CloseTopic_Now(TOPIC_NEFARIUS_POTIONADW,MIS_NEFARIUS_POTIONADW,0,999);
	B_CloseTopic_Now(TOPIC_ADW_ORCINVASION,MIS_ADW_ORCINVASION,0,6);
	B_CloseTopic_Now(TOPIC_SCATTYCHEST,SCATTYCHESTDONE,0,6);
	B_CloseTopic_Now(TOPIC_DobarOut,MIS_DobarOut,0,999);
	B_CloseTopic_Now(TOPIC_LostPower,MIS_LostPower,0,6);
	B_CloseTopic_Now(TOPIC_BrutusBaby,MIS_BrutusBaby,0,3);
	B_CloseTopic_Now(TOPIC_LoaSecret,MIS_LoaSecret,0,6);
	B_CloseTopic_Now(TOPIC_TellAboutFingers,MIS_TellAboutFingers,0,999);
	B_CloseTopic_Now(TOPIC_HauntedLighthouse,MIS_HauntedLighthouse,0,6);
	B_CloseTopic_Now(TOPIC_MOEBORED,MIS_MOEBORED,0,6);
	B_CloseTopic_Now(TOPIC_SpeedPotion,MIS_SpeedPotion,0,6);
	B_CloseTopic_Now(TOPIC_OldElza,MIS_OldElza,0,6);
	B_CloseTopic_Now(TOPIC_OldRumors,MIS_OldRumors,0,6);
};

func void B_LogEntry(var string topic,var string entry)
{
	var string concatText;

	concatText = "Úkol '";
	concatText = ConcatStrings(concatText,topic);
	concatText = ConcatStrings(concatText,"'");
	// AI_Print(concatText);
	//PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_XP,3);
	concatText = ConcatStrings(concatText," - nový záznam v deníku...");
	AI_Print(concatText);
	Log_AddEntry(topic,entry);
	Snd_Play("LogEntry");
};

func void B_LogEntry_Quiet(var string topic,var string entry)
{
	var string concatText;

	concatText = "Úkol '";
	concatText = ConcatStrings(concatText,topic);
	concatText = ConcatStrings(concatText,"' - nový záznam v deníku...");
	AI_Print(concatText);
	Log_AddEntry(topic,entry);
};

func void B_LogEntry_Failed(var string topic)
{
	var string concatText;

	concatText = "Úkol '";
	concatText = ConcatStrings(concatText,topic);
	concatText = ConcatStrings(concatText,"' nesplněn!");
	AI_PrintClr(concatText,177,58,17);
	//PrintScreen(concatText,-1,45,FONT_NEWLEVEL,3);
	//PrintScreen(PRINT_FailTask,-1,YPOS_LOGENTRY,FONT_XP,3);
	Log_SetTopicStatus(topic,LOG_OBSOLETE);
	Snd_Play("QUEST_FAILED");
};
