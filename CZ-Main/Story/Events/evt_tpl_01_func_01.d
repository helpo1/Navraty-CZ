/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

CZ_Settings_Diff_XPMult - falešná konstanta nahrazena upravitelnou proměnnou (na žádost hráčů)
(6x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)
TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)


v1.00:

func void EVT_AV_TO_LOSTVALLEY_FUNC - upraveny podmínky vstupu (ItRu_BeliarSuperRune)

*/



var int Stone_LV_01;
var int Stone_LV_02;
var int Stone_LV_03;
var int Stone_LV_04;
var int Stone_LV_05;
var int Stone_LV_06;
var int Stone_LV_07;
var int Stone_LV_08;
var int LVCountTurnBlocks;

func void EVT_NW_MAGESPEECH_FUNC()
{
};

func void evt_tpl_01_func_01()
{
	Wld_InsertNpc(Skeleton,"EVT_TPL_01_SPAWN_01");
	Wld_InsertNpc(Skeleton,"EVT_TPL_01_SPAWN_02");
};

func void evt_tpl_07_func_01()
{
	Wld_InsertNpc(DemonLord,"TPL_096");
	Wld_SendTrigger("EVT_TPL_07_DOOR");
};

func void evt_tpl_07_func_02()
{
	Wld_InsertNpc(DemonLord,"TPL_096");
	Wld_SendTrigger("EVT_TPL_07_DOOR");
};

var int KratukVideo;

func void EVT_ENERTOGKD_FUNC()
{
	if(KratukVideo == FALSE)
	{
		Wld_SendTrigger("CAM_KRATUK_01");
		KratukVideo = TRUE;
	};
};

func void evt_tpl_07_func_03()
{
	Wld_InsertNpc(undeadorcshaman_4,"FP_ROAM_PRIEST_04");
	Wld_SendTrigger("EVT_TPL_07_DOOR");
	Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_PRIESTGUARD_07");
	Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_PRIESTGUARD_08");
};

func void evt_tpl_08_func_01()
{
	Wld_InsertNpc(undeadorcshaman_2,"FP_ROAM_PRIEST_02");
	Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_PRIESTGUARD_03");
	Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_PRIESTGUARD_04");
};

func void evt_ringstone_01_func()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	Npc_RemoveInvItems(her,itmi_rockcrystal_ot1,1);
};

func void evt_ringstone_02_func()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	Npc_RemoveInvItems(her,itmi_rockcrystal_ot2,1);
};

func void evt_ringstone_03_func()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	Npc_RemoveInvItems(her,itmi_rockcrystal_ot3,1);
};

func void evt_ringstone_04_func()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	Npc_RemoveInvItems(her,itmi_rockcrystal_ot4,1);
};

func void evt_tpl_13_func_01()
{
	Wld_InsertNpc(Minecrawler,"EVT_TPL_13_SPAWN_RIGHT_03");
	Wld_InsertNpc(MinecrawlerWarrior,"EVT_TPL_13_SPAWN_RIGHT_04");
	Wld_InsertNpc(Minecrawler,"EVT_TPL_13_SPAWN_LEFT_03");
	Wld_InsertNpc(MinecrawlerWarrior,"EVT_TPL_13_SPAWN_LEFT_04");
};

func void evt_tpl_13_func_02()
{
};

func void evt_tpl_13_func_03()
{
};

func void evt_tpl_16_func_01()
{
	COUNTDEMONARIVE = COUNTDEMONARIVE + 1;

	if(COUNTDEMONARIVE < 4)
	{
		Wld_InsertNpc(DemonLord,"EVT_TPL_16_SPAWN_01");
	};
};


var int sleeperdemoncount;

func void evt_tpl_sleeperdemon_01()
{
	if(SLEEPERDEMONCOUNT < 4)
	{
		Wld_InsertNpc(DemonLord,"TPL_410");
		SLEEPERDEMONCOUNT += 1;
		Wld_PlayEffect("MFX_SPAWN_CAST",DemonLord,DemonLord,0,0,0,FALSE);
	};
};

func void evt_tpl_sleeperdemon_02()
{
	if(SLEEPERDEMONCOUNT < 4)
	{
		Wld_InsertNpc(DemonLord,"TPL_389");
		SLEEPERDEMONCOUNT += 1;
		Wld_PlayEffect("MFX_SPAWN_CAST",DemonLord,DemonLord,0,0,0,FALSE);
	};
};

func void evt_tpl_sleeperdemon_03()
{
	if(SLEEPERDEMONCOUNT < 4)
	{
		Wld_InsertNpc(DemonLord,"TPL_391");
		SLEEPERDEMONCOUNT += 1;
		Wld_PlayEffect("MFX_SPAWN_CAST",DemonLord,DemonLord,0,0,0,FALSE);
	};
};

func void evt_tpl_sleeperdemon_04()
{
	if(SLEEPERDEMONCOUNT < 4)
	{
		Wld_InsertNpc(DemonLord,"TPL_409");
		SLEEPERDEMONCOUNT += 1;
		Wld_PlayEffect("MFX_SPAWN_CAST",DemonLord,DemonLord,0,0,0,FALSE);
	};
};

func void evt_tpl_sleeperdemon_05()
{
	if(SLEEPERDEMONCOUNT < 4)
	{
		Wld_InsertNpc(DemonLord,"TPL_390");
		SLEEPERDEMONCOUNT += 1;
		Wld_PlayEffect("MFX_SPAWN_CAST",DemonLord,DemonLord,0,0,0,FALSE);
	};
};

func void evt_tpl_xardasspawn_func_01()
{
	Wld_InsertNpc(demonlord_hr,"FP_ROAM_HRAMGUARD_09");
};

func void evt_ow_orctempel_gate_func()
{
};

func void event_demoncave_entrance_func()
{
	if((DEMONCAVEGATEOPENED == FALSE) && (CORRISTOSENDKILLDEMON == TRUE))
	{
		Wld_SendTrigger("EVT_OW_DEMONCAVE_GATE");
		DEMONCAVEGATEOPENED = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Jak řekl Corristo, průchod do krypty se otevřel. Teď už jen zbývá tam jít a vyčistit ji od všech zlých duchů, na které tam narazím.");
	};
};

func void event_orctempel_deadfire_func()
{
	AI_PlayAni(hero,"S_FIRE_VICTIM");
	Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
	B_Say(hero,hero,"$Dead");
	AI_StopFX(hero,"VOB_MAGICBURN");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 10000;
	Npc_StopAni(hero,"S_FIRE_VICTIM");
	MELEEWEAPONINDEX = 0;
};

func void event_orctempel_entrance_func()
{
	if(Npc_HasItems(hero,itmi_idol_01) >= 1)
	{
		if(ORCTEMPLEGATEOPENED == FALSE)
		{
			Wld_SendTrigger("EVT_OW_ORCTEMPEL_GATE");
			ORCTEMPLEGATEOPENED = TRUE;
			B_LogEntry(TOPIC_ORCTEMPLE,"Průchod je otevřený! Nyní je cesta do Spáčova chrámu volná.");
		};
	}
	else if(ORCTEMPLEONETIME == FALSE)
	{
		if(Kapitel >= 5)
		{
			if(URSHAK_SUCKED == FALSE)
			{
				B_LogEntry(TOPIC_ORCTEMPLE,"Na místě bývalého Spáčova chrámu jsem našel podivné věci. Duchové skřetů a ohněm zablokovaný vstup hluboko v hoře. Zajímalo by mě, co o tom vědí skřeti?");
				MIS_ORCTEMPLE = LOG_Running;
				ORCTEMPLEONETIME = TRUE;
				ORCTEMPLEGATEINFO = TRUE;
			}
			else
			{
				B_LogEntry(TOPIC_ORCTEMPLE,"Na místě bývalého Spáčova chrámu jsem našel podivné věci. Duchové skřetů a ohněm zablokovaný vstup hluboko v hoře. Obávám se, že to nemám s kým probrat. Xardas záhadně zmizel a jediný skřet, s nímž jsem se mohl na toto téma bavit je Ur-Shak, který je na mě naštvaný, že jsem zabil jeho učitele Hosh-Paka... Co mám teď dělat?");
				MIS_ORCTEMPLE = LOG_Running;
				ORCTEMPLEONETIME = TRUE;
				ORCTEMPLEGATEINFO = TRUE;
			};
		}
		else
		{
			B_LogEntry(TOPIC_ORCTEMPLE,"Na místě bývalého Spáčova chrámu jsem našel podivné věci. Duchové skřetů a ohněm zablokovaný vstup hluboko v hoře. Měl bych se poradit s Xardasem.");
			MIS_ORCTEMPLE = LOG_Running;
			ORCTEMPLEONETIME = TRUE;
			ORCTEMPLEGATEINFO = FALSE;
		};
	};
};

func void EVT_FIGHT_REACT_FUNC()
{
	if((Fight_Valgard_Now == TRUE) || (Fight_Graden_Now == TRUE) || (Fight_Olaf_Now == TRUE) || (Fight_Bram_Now == TRUE))
	{
		if((FightCurrentWin == FALSE) && (FightCurrentLost == FALSE))
		{
			FightCurrentLost = TRUE;
			Fight_Valgard_Now = FALSE;
			Fight_Graden_Now = FALSE;
			Fight_Olaf_Now = FALSE;
			Fight_Bram_Now = FALSE;
			Snd_Play3d(hero,"YOULOST");
		}
		else
		{
			Fight_Valgard_Now = FALSE;
			Fight_Graden_Now = FALSE;
			Fight_Olaf_Now = FALSE;
			Fight_Bram_Now = FALSE;
		};

		B_StartOtherRoutine(VLK_663_Valgard,"Start");
		B_StartOtherRoutine(VLK_660_Olaf,"Start");
		B_StartOtherRoutine(VLK_662_Bram,"Start");
		B_StartOtherRoutine(VLK_661_Graden,"Start");
	};
};

var int KreolOpenHromaninSagaFT;

func void EVENT_HROMANIN_ENTRANCE_FUNC()
{
	if((KreolOpenHromaninSaga == TRUE) && (KreolOpenHromaninSagaFT == FALSE))
	{
		Wld_SendTrigger("HROMANIN_GATE");
		KreolOpenHromaninSagaFT = TRUE;
	};
};

var int dmt_1298_ready;

func void dia_extro_avi()
{
	if(DMT_1298_READY == FALSE)
	{
		Wld_InsertNpc(dmt_1298_darkmage,"TPL_395");
		DMT_1298_READY = TRUE;
	};
};

func void event_alef_found_func()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (ALEF_FOUND_DONE == FALSE))
	{
		if(Npc_HasItems(hero,itat_skeletonbonealef) >= 1)
		{
			if(Kapitel >= 5)
			{
				B_LogEntry(TOPIC_VIPERNUGGETS,"Obávám se, že nikdo nebude vědět, kde Aleph zakopal rudu, protože je mrtvý. Vzal si sebou toto tajemství do hrobu a já nemám tušení, jak bych ho mohl přivést zpět do tohoto světa.");
				MIS_VIPERNUGGETS = LOG_FAILED;
			}
			else
			{
				B_LogEntry(TOPIC_VIPERNUGGETS,"Obávám se, že nikdo nebude vědět, kde Aleph zakopal rudu, protože je mrtvý. Vzal si sebou toto tajemství do hrobu a já nemám tušení, jak bych ho mohl přivést zpět do tohoto světa! Ačkoli... možná by to mohlo povést někomu, kdo vládne uměním nekromancie?");
			};
			ALEF_FOUND_DONE = TRUE;
		};
	};
};

func void event_alef_treasure_01_func()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (TALKTOALEF == TRUE) && (TREASUREDONE == FALSE))
	{
		Wld_SendTrigger("EVT_ALEFTREASUREAPPERS");
		TREASUREDONE = TRUE;
	};
};

func void event_alef_treasure_02_func()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (TALKTOALEF == TRUE) && (TREASUREDONE == FALSE))
	{
		Wld_SendTrigger("EVT_ALEFTREASUREAPPERS");
		TREASUREDONE = TRUE;
	};
};

func void event_stopextremomusik_func()
{
};

func void event_taliasanbookstolen_func()
{
};

func void evt_meetkillersfight_func()
{
};

func void evt_meetkillersfightok_func()
{
};

func void event_killerawaits_func()
{
};

func void event_killerawaits_01_func()
{
};

func void event_killerawaits_02_func()
{
};

func void evt_meetkillersandre_func()
{
};

func void evt_meetkillarmor_func()
{
};

func void evt_firedragondoor_func()
{
	if((REDDRAGNISDEAD == TRUE) && (FIREDRAGONDOOROPENED == FALSE))
	{
		Wld_SendTrigger("EVT_TEMPLEDOORMOVELEFT");
		Wld_SendTrigger("EVT_TEMPLEDOORMOVERIGHT");
		FIREDRAGONDOOROPENED = TRUE;
	};
};

func void evt_firemages_teleport_func()
{
	if((GOMEZISFREE == TRUE) && (FIREMAGESAWAY == FALSE))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		AI_Teleport(none_105_corristo,"TOT");
		AI_Teleport(none_106_rodriguez,"TOT");
		AI_Teleport(none_107_damarok,"TOT");
		AI_Teleport(none_108_drago,"TOT");
		AI_Teleport(none_109_torrez,"TOT");
		FIREMAGESAWAY = TRUE;
	};
};

func void evt_gomez_teleport_func()
{
	if((GOMEZISFREENOW == TRUE) && (GOMEZAWAY == FALSE))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		AI_Teleport(none_104_gomez,"TOT");
		GOMEZAWAY = TRUE;
	};
};

func void evt_benchelvsbandits_func()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == FALSE))
	{
		b_changeguild(bdt_9000_bandit,GIL_BDT);
		b_changeguild(bdt_9001_bandit,GIL_BDT);
		b_changeguild(bdt_9002_bandit,GIL_BDT);
		b_changeguild(bdt_9003_bandit,GIL_BDT);
		b_changeguild(bdt_9004_bandit,GIL_BDT);
		B_LogEntry(TOPIC_BLACKBRENDI,"Našel jsem Benchela - vypadá to, že má potíže! Musím mu pomoct.");
		BENCHELSEE = TRUE;
	};
};

func void evt_passtopaladinfort_func()
{
};

func void evt_missgrittakillfound_func()
{
	if((GRITTAMUSTISDEAD == TRUE) && (GRITTAFOUNDISDEAD == FALSE))
	{
		B_GivePlayerXP(50);
		GRITTAFOUNDISDEAD = TRUE;
	};
};

func void evt_kapitelorcattack_02_func()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE) && (KAPITELORCATCISSTARTNW == FALSE))
	{
		Wld_SendTrigger("NW_ORC_ATC_TRIGGER_MASTER_01");
		Wld_SendTrigger("NW_ORC_ATC_TRIGGER_MASTER_02");
		Wld_SendTrigger("EVT_TRIGGER_MUSICCHK_K6");
		Wld_SendTrigger("EVT_INNOSFIRE");
		Wld_SendTrigger("EVT_TRIGGER_ORCMARCH");
		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_01");
		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_02");
		Wld_SendTrigger("EVT_TRIGGER_ORCGUARD_TOTEM_03");
		Wld_SendTrigger("EVT_BURNFIELD_TRIGGER");

		if(GATEPRISONISOPEN_01 == TRUE)
		{
			Wld_SendTrigger("EVT_TRIGGER_PRISONGATE_01");
			GATEPRISONISOPEN_01 = FALSE;
		};
		if(GATEPRISONISOPEN_02 == TRUE)
		{
			Wld_SendTrigger("EVT_TRIGGER_PRISONGATE_02");
			GATEPRISONISOPEN_02 = FALSE;
		};
		if(GATEPRISONISOPEN_03 == TRUE)
		{
			Wld_SendTrigger("EVT_TRIGGER_PRISONGATE_03");
			GATEPRISONISOPEN_03 = FALSE;
		};

		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_02");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_03");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_04");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_05");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_06");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_07");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_08");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_09");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_10");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_11");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_12");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_13");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_14");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_15");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_16");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_17");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_18");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_19");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_20");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_21");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_22");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_23");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_24");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_25");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_26");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_27");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_28");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_29");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_30");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_32");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_33");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_34");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_35");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_36");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_37");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_38");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_39");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_40");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_41");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_42");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_43");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_44");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_45");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_46");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_47");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_48");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_49");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_50");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_51");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_52");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_NW_ATC_BOWMEN_53");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_01");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_02");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_03");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_04");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_05");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_06");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_07");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_08");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_09");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_10");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_11");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_12");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_13");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_14");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_15");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_16");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_17");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_18");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_19");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_20");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_21");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_22");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_23");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_24");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_25");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_26");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_27");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_28");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_29");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_30");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_31");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_32");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_33");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_34");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_35");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_36");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_37");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_38");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_39");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_40");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_41");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_42");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_43");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_44");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_45");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_46");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_47");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_48");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_49");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_50");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_51");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_52");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_53");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_54");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_55");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_56");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_57");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_58");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_59");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_60");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_61");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_62");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_63");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_64");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_65");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_66");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_67");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_68");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_69");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_70");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_71");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_72");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_73");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_74");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_75");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_76");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_77");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_78");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_79");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_80");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_81");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_82");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_83");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_84");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_85");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_86");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_87");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_88");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_89");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_90");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_91");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_92");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_93");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_94");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_95");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_96");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_97");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_98");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_99");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_100");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_101");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_102");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_103");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_104");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_105");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_106");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_107");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_108");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_109");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_110");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_111");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_112");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_113");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_114");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_115");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_116");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_117");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_118");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_119");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_120");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_121");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_122");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_123");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_124");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_125");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_126");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_127");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_128");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_129");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_130");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_131");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_132");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_133");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_134");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_135");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_136");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_137");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_138");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_139");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_140");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_141");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_142");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_143");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_144");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_145");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_146");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_147");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_148");
		Wld_InsertNpc(orkelite_addon1s,"FP_CAMPFIRE_NW_ATC_ORC_149");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_150");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_151");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_152");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_153");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_154");
		Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_NW_ATC_ORC_155");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_156");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_157");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_158");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_159");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_160");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_161");
		Wld_InsertNpc(orkelite_addon2s,"FP_CAMPFIRE_NW_ATC_ORC_162");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_163");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_164");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_165");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_NW_ATC_ORC_166");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_04");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_05");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_08");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_10");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_11");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_12");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_13");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_14");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_15");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_16");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_17");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_18");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_19");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_20");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_21");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_22");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_23");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_24");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_25");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_26");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_27");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_28");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_29");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_30");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_31");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_32");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_33");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_34");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_35");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_36");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_37");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_38");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_39");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_40");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_41");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_42");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_43");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_44");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_45");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_46");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_47");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_48");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_49");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_50");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_51");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_52");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_53");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_54");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_55");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_56");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_57");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_58");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_59");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_60");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_61");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_62");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_63");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_64");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_65");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_66");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_67");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_68");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_69");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_70");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_71");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_72");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_73");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_74");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_75");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_76");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_77");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_78");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_79");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_80");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_81");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_82");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_83");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_84");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_85");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_86");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_87");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_88");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_89");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_90");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_91");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_92");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_93");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_94");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_95");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_96");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_97");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_98");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_99");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_100");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_101");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_102");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_103");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_104");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_105");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_106");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_107");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_108");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_109");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_110");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_111");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_112");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_113");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_114");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_115");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_116");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_117");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_118");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_119");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_120");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_121");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_122");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_123");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_124");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_125");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_126");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_127");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_128");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_129");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_130");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_131");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_132");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_133");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_134");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_135");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_136");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_137");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_138");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_139");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_140");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_141");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_142");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_143");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_144");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_145");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_146");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_147");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_148");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_149");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_150");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_151");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_152");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_153");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_154");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_155");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_156");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_157");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_158");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_159");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_160");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_161");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_162");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_163");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_164");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_165");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_166");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_167");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_168");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_169");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_170");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_171");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_172");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_173");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_174");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_175");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_176");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_177");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_178");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_179");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_180");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_181");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_182");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_183");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_184");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_185");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_186");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_187");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_188");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_189");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_190");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_191");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_192");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_193");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_194");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_195");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_196");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_197");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_198");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_199");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_200");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_201");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_202");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_203");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_204");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_205");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_206");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_207");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_208");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_209");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_210");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_211");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_212");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_213");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_214");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_215");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_216");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_217");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_218");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_219");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_220");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_221");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_222");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_223");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_224");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_225");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_226");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_227");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_228");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_229");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_230");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_231");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_232");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_233");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_234");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_235");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_236");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_237");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_238");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_239");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_240");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_241");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_242");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_243");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_244");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_245");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_246");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_247");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_248");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_249");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_250");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_251");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_252");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_253");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_254");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_255");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_256");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_257");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_258");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_259");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_260");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_261");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_262");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_263");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_264");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_265");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_266");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_267");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_268");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_269");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_270");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_271");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_272");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_273");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_274");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_275");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_276");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_277");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_278");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_279");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_280");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_281");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_282");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_283");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_284");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_285");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_286");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_287");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_288");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_289");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_290");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_291");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_292");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_293");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_294");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_295");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_296");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_297");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_298");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_299");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_300");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_301");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_302");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_303");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_304");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_305");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_306");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_307");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_308");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_309");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_310");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_311");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_312");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_313");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_314");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_315");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_316");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_317");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_318");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_319");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_320");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_321");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_322");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_323");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_324");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_325");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_326");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_327");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_328");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_329");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_330");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_331");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_332");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_333");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_334");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_335");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_336");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_337");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_338");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_339");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_340");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_341");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_342");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_343");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_344");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_345");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_346");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_347");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_348");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_349");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_350");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_351");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_352");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_353");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_354");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_355");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_356");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_357");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_358");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_359");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_360");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_361");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_362");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_363");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_364");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_365");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_366");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_367");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_368");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_369");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_370");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_371");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_372");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_373");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_374");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_375");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_376");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_377");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_378");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_379");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_380");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_381");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_382");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_383");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_384");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_385");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_386");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_387");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_388");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_389");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_390");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_391");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_392");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_393");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_394");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_395");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_396");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_397");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_398");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_ATC_ORC_399");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_400");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_401");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_402");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_ATC_ORC_403");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM4_SHEEP_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM4_SHEEP_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_FARM4_SHEEP_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_FARM_ORC_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_FARM_ORC_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_FARM_ORC_04");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_FARM_ORC_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_FARM_ORC_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_NW_LIGHTHOUSE_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_NW_LIGHTHOUSE_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_39");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_CITY_TO_FOREST_40");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_CITY_TO_FOREST_42");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_CITY_TO_FOREST_44");
		Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_CITY_TO_FOREST_46");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_CITY_TO_FOREST_43");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_DEMENTOR_11");
		Wld_InsertNpc(orkelite_addon2,"FP_STAND_DEMENTOR_KDF_03");
		Wld_InsertNpc(orkelite_addon2,"FP_STAND_DEMENTOR_KDF_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_TROLLAREA_RUINS_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_RUINS_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_RUINS_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_RUINS_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_TROLLAREA_RUINS_05");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_RUINS_06");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_RUINS_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_RUINS_08");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_NW_TROLLAREA_RUINS_09");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_GUARDING_PASS_01");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_GUARDING_PASS_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_BRIGDE_01_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_BRIGDE_01_02");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_NW_TROLLAREA_BRIGDE_01_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_TROLLAREA_BRIGDE_01_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_TAVERNE_05");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_TAVERNE_04");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_TAVERNE_03");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_TAVERNE_02");
		Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_ATC_ORC_TAVERNE_01");
		if(Npc_IsDead(orkelite_addon3_chkflg_26))
		{
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_02");
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_13");
			Wld_InsertNpc(OrcShaman_Sit,"NW_PASS_ORKS_04_B");
			Wld_InsertNpc(orcwarrior4,"NW_PASS_13");
			Wld_InsertNpc(orcwarrior4,"NW_PASS_14");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_07");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_06");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_01");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_04");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_08");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_03");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_03");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_09");
			Wld_InsertNpc(orkelite_addon1,"NW_PASS_ORKS_10");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PASS_ORKS_12");
			Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_PASS_ORK_WATCHER");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_PASS_ORCS_05");
			Wld_InsertNpc(orkelite_addon3_chkflg_26,"NW_PASS_ORKS_03");
		};
		Wld_InsertNpc(orkelite_addon3_nwchkflg_01,"FP_ROAM_NW_ATC_ELITEORC_01");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_02,"FP_ROAM_NW_ATC_ELITEORC_02");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_03,"FP_ROAM_NW_ATC_ELITEORC_03");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_04,"FP_ROAM_NW_ATC_ELITEORC_04");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_05,"FP_ROAM_NW_ATC_ELITEORC_05");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_06,"FP_ROAM_NW_ATC_ELITEORC_06");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_07,"FP_ROAM_NW_ATC_ELITEORC_07");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_08,"FP_ROAM_NW_ATC_ELITEORC_08");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_09,"FP_ROAM_NW_ATC_ELITEORC_09");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_10,"FP_ROAM_NW_ATC_ELITEORC_10");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_11,"FP_ROAM_NW_ATC_ELITEORC_11");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_12,"FP_ROAM_NW_ATC_ELITEORC_12");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_13,"FP_ROAM_NW_ATC_ELITEORC_13");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_14,"FP_ROAM_NW_ATC_ELITEORC_14");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_15,"FP_ROAM_NW_ATC_ELITEORC_15");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_16,"FP_ROAM_NW_ATC_ELITEORC_16");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_17,"FP_ROAM_NW_ATC_ELITEORC_17");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_18,"FP_ROAM_NW_ATC_ELITEORC_18");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_19,"FP_ROAM_NW_ATC_ELITEORC_19");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_20,"FP_ROAM_NW_ATC_ELITEORC_20");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_21,"FP_ROAM_NW_ATC_ELITEORC_21");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_22,"FP_ROAM_NW_ATC_ELITEORC_22");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_23,"FP_ROAM_NW_ATC_ELITEORC_23");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_24,"FP_ROAM_NW_ATC_ELITEORC_24");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_25,"FP_ROAM_NW_ATC_ELITEORC_25");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_27,"FP_ROAM_NW_ATC_ELITEORC_27");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_28,"FP_ROAM_NW_ATC_ELITEORC_28");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_29,"FP_ROAM_NW_ATC_ELITEORC_29");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_30,"FP_ROAM_NW_ATC_ELITEORC_30");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_33,"FP_ROAM_NW_ATC_ELITEORC_33");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_34,"FP_ROAM_NW_ATC_ELITEORC_34");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_35,"FP_ROAM_NW_ATC_ELITEORC_35");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_36,"FP_ROAM_NW_ATC_ELITEORC_36");
		Wld_InsertNpc(orkelite_addon4_nwchkflg_01,"FP_ROAM_NW_ATC_ELITEORCCOLONEL_01");
		Wld_InsertNpc(orkelite_addon4_nwchkflg_02,"FP_ROAM_NW_ATC_ELITEORCCOLONEL_02");
		Wld_InsertNpc(orkelite_addon4_nwchkflg_03,"FP_ROAM_NW_ATC_ELITEORCCOLONEL_03");
		Wld_InsertNpc(orkelite_general_nw,"FP_ROAM_NW_ATC_ELITEORCGENERAL_01");
		Wld_InsertNpc(orkelite_addon3_nwchkflg_26,"FP_ROAM_NW_ATC_ELITEORC_26");
		KAPITELORCATCISSTARTNW = TRUE;
		Wld_SetTime(23,0);
	};
};

func void evt_kaporcatc_opengate_01_func()
{
	if((KAPITELORCATC == TRUE) && (KAPITELORCATCISSTARTOW == FALSE))
	{
		KAPITELORCATCISSTARTOW = TRUE;
		Wld_SendTrigger("EVT_OC_MAINGATE_TRIGGER");
		Wld_SendTrigger("EVT_TRIGGER_KILLEDPALADINS");
		if(MIS_OCGateOpen == TRUE)
		{
			Wld_SendUntrigger("EVT_OC_MAINGATE_P2_TRIGGER");
		};
	};
};

func void evt_kaporcatc_opengate_02_func()
{
	if((KAPITELORCATC == TRUE) && (KAPITELORCATCISSTARTOW == FALSE))
	{
		Wld_SendTrigger("EVT_OC_MAINGATE_TRIGGER");
		KAPITELORCATCISSTARTOW = TRUE;
	};
};

func void evt_changeleveltrggerscript_01_func()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERDIAWAYISSTART == FALSE))
	{
		Wld_SendTrigger("EVT_CHANGELEVEL_DI_TRIGGER_MASTER");
		CAPITANORDERDIAWAYISSTART = TRUE;
	};
};

func void evt_observecapturetown_01_func()
{
	if((KAPITELORCATC == TRUE) && (SHOWCAPRUTETOWN == FALSE))
	{
		Wld_SendTrigger("EVT_OBSERVECAPTURETOWN_TRIGGER_01");
		SHOWCAPRUTETOWN = TRUE;
	};
};

func void evt_clawrecovermake_func()
{
	var int daynow;
	var C_Npc dog;
	daynow = Wld_GetDay();
	if((CLAWTIMERRECOVER < (daynow - 2)) && (CLAWHEALTHOK == FALSE) && (CLAWBEGINRECOVER == TRUE))
	{
		dog = Hlp_GetNpc(nixdog);
		dog.level = 25;
		dog.attribute[ATR_STRENGTH] = 100;
		dog.attribute[ATR_DEXTERITY] = 150;
		dog.attribute[ATR_HITPOINTS_MAX] = 300;
		dog.attribute[ATR_HITPOINTS] = 300;
		dog.attribute[ATR_MANA_MAX] = 0;
		dog.attribute[ATR_MANA] = 0;
		dog.protection[PROT_BLUNT] = 80;
		dog.protection[PROT_EDGE] = 80;
		dog.protection[PROT_POINT] = 0;
		dog.protection[PROT_FIRE] = 0;
		dog.protection[PROT_FLY] = 100;
		dog.protection[PROT_MAGIC] = 0;
		dog.aivar[AIV_MM_SleepStart] = 0;
		dog.aivar[AIV_MM_SleepEnd] = 0;
		dog.aivar[AIV_MM_RoamStart] = OnlyRoutine;
		CLAWHEALTHOK = TRUE;
	};
	if((CLAWTIMER < (daynow - 3)) && (MIS_RECOVERDOG == LOG_Running) && (CLAWISDEAD == FALSE) && (CLAWBEGINRECOVER == FALSE))
	{
		b_killnpc_now(nixdog);
		CLAWISDEAD = TRUE;
	};
};

func void evt_trgger_di_treasure_func()
{
	if((UndeadDragonIsDead == TRUE) && (DI_TREASURESHOWN == FALSE))
	{
		Wld_SendTrigger("EVT_DI_TRIGGER_MASTER_TREASURE");
		DI_TREASURESHOWN = TRUE;
	};
};

func void li_missmygold_func()
{
	if(MISSMYGOLD == FALSE)
	{
		MISSMYGOLD = TRUE;
		MIS_MISSMYGOLD = LOG_Running;
		Log_CreateTopic(TOPIC_MISSMYGOLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_Running);
		B_LogEntry(TOPIC_MISSMYGOLD,"Když jsem sestoupil do nákladního prostoru naší lodi, tak jsem zjistil, že zlato, které jsem vzal na ostrově Irdorath, nějakým zahádným způsobem zmizelo! Měl bych o tom informovat chlapi.");
	};
};

func void li_trigger_findbigore_01_func()
{
	if(FINDLIORE_CAVE_01 == FALSE)
	{
		FINDLIORE_CAVE_01 = TRUE;
		if(MIS_FINDMAGICORECAVE == FALSE)
		{
			MIS_FINDMAGICORECAVE = LOG_Running;
			Log_CreateTopic(TOPIC_FINDMAGICORECAVE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_Running);
			B_LogEntry(TOPIC_FINDMAGICORECAVE,"V jedné z jeskyní na ostrově jsem objevil obrovské náleziště magické rudy. Myslím, že bych o tom měl říct ostatním chlapům.");
		}
		else
		{
			B_LogEntry(TOPIC_FINDMAGICORECAVE,"Našel jsem další jeskyni s ohromnou zásobou magické rudy! Nyní není pochyb o tom, že se na tomto ostrově skrývají bohaté náleziště této cenné rudy.");
		};
	};
};

func void li_trigger_findbigore_02_func()
{
	if(FINDLIORE_CAVE_02 == FALSE)
	{
		FINDLIORE_CAVE_02 = TRUE;
		if(MIS_FINDMAGICORECAVE == FALSE)
		{
			MIS_FINDMAGICORECAVE = LOG_Running;
			Log_CreateTopic(TOPIC_FINDMAGICORECAVE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_Running);
			B_LogEntry(TOPIC_FINDMAGICORECAVE,"V jedné z jeskyní na ostrově jsem objevil obrovské náleziště magické rudy. Myslím, že bych o tom měl říct ostatním chlapům.");
		}
		else
		{
			B_LogEntry(TOPIC_FINDMAGICORECAVE,"Našel jsem další jeskyni s ohromnou zásobou magické rudy! Nyní není pochyb o tom, že se na tomto ostrově skrývají bohaté náleziště této cenné rudy.");
		};
	};
};

func void evt_changeleveltrggerscript_02_func()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE) && (CAPITANORDERLIAWAYISSTART == FALSE))
	{
		Wld_SendTrigger("EVT_CHANGELEVEL_LI_TRIGGER_MASTER");
		CAPITANORDERLIAWAYISSTART = TRUE;
	};
};

func void b_drakarlevercomplete()
{
	if((LEVERCOUNT == 4) && (DRAKARISBROKEN == FALSE))
	{
		if((DRAKARLEVER01 == 3) && (DRAKARLEVER02 == 1) && (DRAKARLEVER03 == 4) && (DRAKARLEVER04 == 2))
		{
			B_GivePlayerXP(200);
			LEVERCOUNT = 0;
			DRAKARLEVER01 = FALSE;
			DRAKARLEVER02 = FALSE;
			DRAKARLEVER03 = FALSE;
			DRAKARLEVER04 = FALSE;
			DRAKARISBROKEN = TRUE;
			Snd_Play("MESH_BROKE");
			ULUMULUISEQUIP = FALSE;
			AI_Print(PRINT_DRAKARREPORT02);
			B_LogEntry(TOPIC_DRAKARBROKE,"Podařilo se mi zničit řídící mechanismus na skřetí válečné lodi. Myslím, že je čas se vrátit do Albertova tábora a povědět mu o tom.");
		}
		else
		{
			DRAKARLEVER01 = FALSE;
			DRAKARLEVER02 = FALSE;
			DRAKARLEVER03 = FALSE;
			DRAKARLEVER04 = FALSE;
			DRAKARLEVER01_FLG = FALSE;
			DRAKARLEVER02_FLG = FALSE;
			DRAKARLEVER03_FLG = FALSE;
			DRAKARLEVER04_FLG = FALSE;
			Wld_SendUntrigger("DRAKAR_TRIGGER_LEVER_01");
			Wld_SendUntrigger("DRAKAR_TRIGGER_LEVER_02");
			Wld_SendUntrigger("DRAKAR_TRIGGER_LEVER_03");
			Wld_SendUntrigger("DRAKAR_TRIGGER_LEVER_04");
			AI_Print(PRINT_DRAKARREPORT01);
		};
		LEVERCOUNT = 0;
	};
};

func void darkar_lever_maker_func_01_s1()
{
	if(DRAKARLEVER01_FLG == FALSE)
	{
		LEVERCOUNT = LEVERCOUNT + 1;
		Wld_SendTrigger("DRAKAR_TRIGGER_LEVER_01");
		Wld_SendTrigger("EVT_TRIGERR_MESHCAM");
		DRAKARLEVER01 = LEVERCOUNT;
		DRAKARLEVER01_FLG = TRUE;
		ULUMULUISEQUIP = FALSE;
		b_drakarlevercomplete();
	};
};

func void darkar_lever_maker_func_02_s1()
{
	if(DRAKARLEVER02_FLG == FALSE)
	{
		LEVERCOUNT = LEVERCOUNT + 1;
		Wld_SendTrigger("DRAKAR_TRIGGER_LEVER_02");
		Wld_SendTrigger("EVT_TRIGERR_MESHCAM");
		DRAKARLEVER02 = LEVERCOUNT;
		DRAKARLEVER02_FLG = TRUE;
		ULUMULUISEQUIP = FALSE;
		b_drakarlevercomplete();
	};
};

func void darkar_lever_maker_func_03_s1()
{
	if(DRAKARLEVER03_FLG == FALSE)
	{
		LEVERCOUNT = LEVERCOUNT + 1;
		Wld_SendTrigger("DRAKAR_TRIGGER_LEVER_03");
		Wld_SendTrigger("EVT_TRIGERR_MESHCAM");
		DRAKARLEVER03 = LEVERCOUNT;
		DRAKARLEVER03_FLG = TRUE;
		ULUMULUISEQUIP = FALSE;
		b_drakarlevercomplete();
	};
};

func void darkar_lever_maker_func_04_s1()
{
	if(DRAKARLEVER04_FLG == FALSE)
	{
		LEVERCOUNT = LEVERCOUNT + 1;
		Wld_SendTrigger("DRAKAR_TRIGGER_LEVER_04");
		Wld_SendTrigger("EVT_TRIGERR_MESHCAM");
		DRAKARLEVER04 = LEVERCOUNT;
		DRAKARLEVER04_FLG = TRUE;
		ULUMULUISEQUIP = FALSE;
		b_drakarlevercomplete();
	};
};

func void evt_taracothammer_gate_func_s1()
{
	Wld_SendTrigger("EVT_TRIGERR_TARACOTHAMMER_GATE");
};

func void evt_gatein_01_open_func_s1()
{
	Wld_SendTrigger("EVT_TRIGGER_GATEIN_01_OPEN");
};

func void evt_li_teleport_dc_func()
{
	var C_Npc outter;
	if((MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == FALSE))
	{
		outter = Hlp_GetNpc(pc_mage_li);
		Npc_ExchangeRoutine(pc_mage_li,"Cave");
		AI_Teleport(outter,"DEM_CAVE_01");
		AI_Teleport(hero,"DEM_CAVE_02");
		MEANDMILTENTELEPORTDCDONE = TRUE;
		PlayVideo("RET2_DemonWakeUp.BIK");
	};
};

func void evt_li_teleport_frdc_func()
{
	var C_Npc outter;
	var C_Npc outter1;
	var int permvaluexp;

	if(LIDEMONISDEAD == TRUE)
	{
		outter = Hlp_GetNpc(pc_mage_li);
		outter.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(outter,"Start");
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(hero);
		AI_Teleport(hero,"DEM_CAVE_EXIT");
		AI_Teleport(outter,"LI_MAN_03");
		LIDEMCAVEAWAY = TRUE;
		B_LogEntry(TOPIC_MILTENANCIENT,"Prošli jsme portálem a vrátili jsme se na povrch tohoto tajemného ostrova.");
	}
	else if(Npc_IsDead(sleeper))
	{
		outter1 = Hlp_GetNpc(sleeper);

		if(outter1.aivar[AIV_VictoryXPGiven] != TRUE)
		{
			// permvaluexp = outter1.level * XP_PER_VICTORY;
			permvaluexp = outter1.level * CZ_Settings_Diff_XPMult;
			outter1.aivar[AIV_VictoryXPGiven] = TRUE;
			outter1.aivar[95] = TRUE;
			b_giveplayerxpsemiquietwithbonus(permvaluexp,50);
			hero.attribute[ATR_HITPOINTS_MAX] += 50;
			hero.attribute[ATR_HITPOINTS] += 50;
		};

		LIDEMONISDEAD = TRUE;
		outter = Hlp_GetNpc(pc_mage_li);
		outter.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(outter,"Start");
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(hero);
		AI_Teleport(hero,"DEM_CAVE_EXIT");
		AI_Teleport(outter,"LI_MAN_03");
		LIDEMCAVEAWAY = TRUE;
		B_LogEntry(TOPIC_MILTENANCIENT,"Prošli jsme portálem a vrátili jsme se na povrch tohoto tajemného ostrova.");
	}
	else
	{
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		AI_Print("Magická síla tohoto místa nám nedovolí odejít...");
	};
};

func void evt_darktower_opengate_func()
{
	if(OSTAISDEAD == TRUE)
	{
		Wld_SendTrigger("EVT_TRIGGER_DARKTOWER_OPENGATE");
		if((MIS_XARDASTASKSFOUR == LOG_Running) && (ENTERASHERON == FALSE))
		{
			ENTERASHERON = TRUE;
			B_LogEntry(TOPIC_XARDASTASKSFOUR,"Mříž už neblokuje mou cestu. Teď musíme najít Nekronomicon!");
		};
	};
};

func void evt_nergaltower_func()
{
	if(KreolGiveKey == FALSE)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_MASSDEATH_CAST");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - hero.attribute[ATR_HITPOINTS];
	};
};

func void evt_gader_01_func_s1()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltář v chrámu Strážců smrti.");
		GADERSTONE_ONE = TRUE;
		RemoveStoneGader = TRUE;		
	};
	if((PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_TWO == TRUE) && (GADERSTONE_THREE == TRUE) && (GADERSTONE_FOUR == TRUE) && (GADERSTONE_FIVE == TRUE))
	{
		PLACEGADERSTONNES = TRUE;
		Log_AddEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltář v chrámu Stavitelů. Je čas se vrátit!");
	};
};

func int EVT_ILARAH_01_COND_FUNC()
{
	if((DemonHaosIsDead == TRUE) && (PLACEKRATUKHEART == FALSE) && (Npc_HasItems(hero,ItAt_KratukHeart) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func void EVT_ILARAH_01_FUNC_s1()
{
	if((DemonHaosIsDead == TRUE) && (PLACEKRATUKHEART == FALSE) && (Npc_HasItems(hero,ItAt_KratukHeart) >= 1))
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItAt_KratukHeart,1);
		Wld_InsertNpc(ILARAH,"KRATUK");
		PLACEKRATUKHEART = TRUE;
	};
};

func int evt_gader_01_cond_func()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_gader_02_func_s1()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_TWO == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltář v chrámu kněží.");
		GADERSTONE_TWO = TRUE;
		RemoveStoneGader = TRUE;		
	};
	if((PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_TWO == TRUE) && (GADERSTONE_THREE == TRUE) && (GADERSTONE_FOUR == TRUE) && (GADERSTONE_FIVE == TRUE))
	{
		PLACEGADERSTONNES = TRUE;
		Log_AddEntry(TOPIC_GADERTEST,"Položil jsem všechny magické kameny v chrámech Stavitelů. Je čas vrátit se zpět!");
	};
};

func int evt_gader_02_cond_func()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_TWO == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_gader_03_func_s1()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_THREE == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltáři v knihovně učenců.");
		GADERSTONE_THREE = TRUE;
		RemoveStoneGader = TRUE;		
	};
	if((PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_TWO == TRUE) && (GADERSTONE_THREE == TRUE) && (GADERSTONE_FOUR == TRUE) && (GADERSTONE_FIVE == TRUE))
	{
		PLACEGADERSTONNES = TRUE;
		Log_AddEntry(TOPIC_GADERTEST,"Položil jsem všechny magické kameny v chrámech Stavitelů. Je čas vrátit se zpět!");
	};
};

func int evt_gader_03_cond_func()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_THREE == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_gader_04_func_s1()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_FOUR == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltář v Adanově chrámu.");
		GADERSTONE_FOUR = TRUE;
		RemoveStoneGader = TRUE;		
	};
	if((PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_TWO == TRUE) && (GADERSTONE_THREE == TRUE) && (GADERSTONE_FOUR == TRUE) && (GADERSTONE_FIVE == TRUE))
	{
		PLACEGADERSTONNES = TRUE;
		Log_AddEntry(TOPIC_GADERTEST,"Položil jsem všechny magické kameny v chrámech Stavitelů. Je čas vrátit se zpět!");
	};
};

func int evt_gader_04_cond_func()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_FOUR == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_gader_05_func_s1()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_FIVE == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_GADERTEST,"Položil jsem magický kámen na oltář v chrámu léčitelů.");
		GADERSTONE_FIVE = TRUE;
		RemoveStoneGader = TRUE;		
	};
	if((PLACEGADERSTONNES == FALSE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_ONE == TRUE) && (GADERSTONE_TWO == TRUE) && (GADERSTONE_THREE == TRUE) && (GADERSTONE_FOUR == TRUE) && (GADERSTONE_FIVE == TRUE))
	{
		PLACEGADERSTONNES = TRUE;
		Log_AddEntry(TOPIC_GADERTEST,"Položil jsem všechny magické kameny v chrámech Stavitelů. Je čas vrátit se zpět!");
	};
};

func int evt_gader_05_cond_func()
{
	if((MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == FALSE) && (GADERSTONE_FIVE == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_dagot_appear_func()
{
	var C_Npc outterg1;
	if((MIS_GUARDIANS == LOG_Running) && (XARDAS_SPEAKDAGOT == TRUE) && (DAGOTREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE))
	{
		outterg1 = Hlp_GetNpc(dmt_1212_dagot);
		Npc_ExchangeRoutine(outterg1,"WaitInMageCircle");
		AI_Teleport(outterg1,"NW_DMT_1212_DAGOT");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",outterg1,outterg1,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg1,outterg1,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg1,outterg1,0,0,0,FALSE);
		DAGOTREADYTESTME = TRUE;
	};
};

func void evt_morius_appear_func()
{
	var C_Npc outterg2;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (DAGOT_AGREE == TRUE) && (MORIUSREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE))
	{
		outterg2 = Hlp_GetNpc(dmt_1213_morius);
		Npc_ExchangeRoutine(outterg2,"Start");
		AI_Teleport(outterg2,"NW_DMT_1213_MORIUS");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",outterg2,outterg2,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg2,outterg2,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg2,outterg2,0,0,0,FALSE);
		MORIUSREADYTESTME = TRUE;
	};
};

func void evt_tegon_appear_func()
{
	var C_Npc outterg3;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (MORIUS_AGREE == TRUE) && (TEGONREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE))
	{
		outterg3 = Hlp_GetNpc(dmt_1214_tegon);
		Npc_ExchangeRoutine(outterg3,"Start");
		AI_Teleport(outterg3,"NW_DMT_1214_TEGON");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",outterg3,outterg3,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg3,outterg3,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg3,outterg3,0,0,0,FALSE);
		TEGONREADYTESTME = TRUE;
	};
};

func void evt_kelios_appear_func()
{
	var C_Npc outterg4;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (TEGON_AGREE == TRUE) && (KELIOSREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 3))
	{
		outterg4 = Hlp_GetNpc(dmt_1215_kelios);
		Npc_ExchangeRoutine(outterg4,"Start");
		AI_Teleport(outterg4,"NW_DMT_1215_KELIOS");
		Wld_PlayEffect("spellFX_INCOVATION_RED",outterg4,outterg4,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg4,outterg4,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg4,outterg4,0,0,0,FALSE);
		KELIOSREADYTESTME = TRUE;
	};
};

func void evt_demos_appear_func()
{
	var C_Npc outterg5;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (KELIOS_AGREE == TRUE) && (DEMOSREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 3))
	{
		outterg5 = Hlp_GetNpc(dmt_1216_demos);
		Npc_ExchangeRoutine(outterg5,"Start");
		AI_Teleport(outterg5,"NW_DMT_1216_DEMOS");
		Wld_PlayEffect("spellFX_INCOVATION_RED",outterg5,outterg5,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg5,outterg5,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg5,outterg5,0,0,0,FALSE);
		DEMOSREADYTESTME = TRUE;
	};
};

func void evt_farion_appear_func()
{
	var C_Npc outterg6;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (DEMOS_AGREE == TRUE) && (FARIONREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 3))
	{
		outterg6 = Hlp_GetNpc(dmt_1217_farion);
		Npc_ExchangeRoutine(outterg6,"Start");
		AI_Teleport(outterg6,"NW_DMT_1217_FARION");
		Wld_PlayEffect("spellFX_INCOVATION_RED",outterg6,outterg6,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg6,outterg6,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg6,outterg6,0,0,0,FALSE);
		FARIONREADYTESTME = TRUE;
	};
};

func void evt_gader_appear_func()
{
	var C_Npc outterg7;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (FARION_AGREE == TRUE) && (GADERREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 4))
	{
		outterg7 = Hlp_GetNpc(dmt_1218_gader);
		Npc_ExchangeRoutine(outterg7,"Start");
		AI_Teleport(outterg7,"NW_DMT_1218_GADER");
		Wld_PlayEffect("spellFX_INCOVATION_BLUE",outterg7,outterg7,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg7,outterg7,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg7,outterg7,0,0,0,FALSE);
		GADERREADYTESTME = TRUE;
	};
};

func void evt_narus_appear_func()
{
	var C_Npc outterg8;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (GADER_AGREE == TRUE) && (NARUSREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 4))
	{
		outterg8 = Hlp_GetNpc(dmt_1219_narus);
		Npc_ExchangeRoutine(outterg8,"Start");
		AI_Teleport(outterg8,"NW_DMT_1219_NARUS");
		Wld_PlayEffect("spellFX_INCOVATION_BLUE",outterg8,outterg8,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg8,outterg8,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg8,outterg8,0,0,0,FALSE);
		NARUSREADYTESTME = TRUE;
	};
};

func void evt_wakon_appear_func()
{
	var C_Npc outterg9;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (NARUS_AGREE == TRUE) && (WAKONREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE) && (Kapitel >= 4))
	{
		outterg9 = Hlp_GetNpc(dmt_1220_wakon);
		Npc_ExchangeRoutine(outterg9,"Start");
		AI_Teleport(outterg9,"NW_DMT_1220_WAKON");
		Wld_PlayEffect("spellFX_INCOVATION_BLUE",outterg9,outterg9,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg9,outterg9,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg9,outterg9,0,0,0,FALSE);
		WAKONREADYTESTME = TRUE;
	};
};

func void evt_stonnos_appear_func()
{
	var C_Npc outterg10;
	if((MIS_GUARDIANS == LOG_Running) && (MIS_GUARDIANSTEST == LOG_Running) && (WAKON_AGREE == TRUE) && (STONNOSREADYTESTME == FALSE) && (DAGOTTELLALL == FALSE))
	{
		outterg10 = Hlp_GetNpc(dmt_1297_stonnos);
		Npc_ExchangeRoutine(outterg10,"Start");
		AI_Teleport(outterg10,"NW_DMT_1297_STONNOS");
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",outterg10,outterg10,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg10,outterg10,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg10,outterg10,0,0,0,FALSE);
		STONNOSREADYTESTME = TRUE;
	};
};

func void evt_teleport_to_nw_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE) && (OPENFIRECAVE == FALSE))
	{
		Wld_SendTrigger("EVT_CHANGELEVEL_FIRECAVE_TRIGGER");
		OPENFIRECAVE = TRUE;
	};
};

func int evt_firetest_01_cond_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_01 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_firetest_02_cond_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_02 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_firetest_03_cond_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_03 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_firetest_04_cond_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_04 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_firetest_05_cond_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_05 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_firetest_01_func_s1()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_01 == FALSE))
	{
		if(FIRECAVEMONSTERCOUNT <= 0)
		{
			Wld_InsertNpc(firetestmonster_01,"FIRECAVE_MONSTER_01");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 1)
		{
			Wld_InsertNpc(firetestmonster_02,"FIRECAVE_MONSTER_01");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 2)
		{
			Wld_InsertNpc(firetestmonster_03,"FIRECAVE_MONSTER_01");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 3)
		{
			Wld_InsertNpc(firetestmonster_04,"FIRECAVE_MONSTER_01");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 4)
		{
			Wld_InsertNpc(firetestmonster_05,"FIRECAVE_MONSTER_01");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		};
		Wld_SetTime(12,0);
		B_GivePlayerXP(100);
		KELIOSFIREMONSTER_01 = TRUE;
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	};
};

func void evt_firetest_02_func_s1()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_02 == FALSE))
	{
		if(FIRECAVEMONSTERCOUNT <= 0)
		{
			Wld_InsertNpc(firetestmonster_01,"FIRECAVE_MONSTER_02");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 1)
		{
			Wld_InsertNpc(firetestmonster_02,"FIRECAVE_MONSTER_02");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 2)
		{
			Wld_InsertNpc(firetestmonster_03,"FIRECAVE_MONSTER_02");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 3)
		{
			Wld_InsertNpc(firetestmonster_04,"FIRECAVE_MONSTER_02");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 4)
		{
			Wld_InsertNpc(firetestmonster_05,"FIRECAVE_MONSTER_02");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		};
		Wld_SetTime(12,0);
		B_GivePlayerXP(100);
		KELIOSFIREMONSTER_02 = TRUE;
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	};
};

func void evt_firetest_03_func_s1()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_03 == FALSE))
	{
		if(FIRECAVEMONSTERCOUNT <= 0)
		{
			Wld_InsertNpc(firetestmonster_01,"FIRECAVE_MONSTER_03");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 1)
		{
			Wld_InsertNpc(firetestmonster_02,"FIRECAVE_MONSTER_03");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 2)
		{
			Wld_InsertNpc(firetestmonster_03,"FIRECAVE_MONSTER_03");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 3)
		{
			Wld_InsertNpc(firetestmonster_04,"FIRECAVE_MONSTER_03");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 4)
		{
			Wld_InsertNpc(firetestmonster_05,"FIRECAVE_MONSTER_03");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		};
		Wld_SetTime(12,0);
		B_GivePlayerXP(100);
		KELIOSFIREMONSTER_03 = TRUE;
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	};
};

func void evt_firetest_04_func_s1()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_04 == FALSE))
	{
		if(FIRECAVEMONSTERCOUNT <= 0)
		{
			Wld_InsertNpc(firetestmonster_01,"FIRECAVE_MONSTER_04");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 1)
		{
			Wld_InsertNpc(firetestmonster_02,"FIRECAVE_MONSTER_04");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 2)
		{
			Wld_InsertNpc(firetestmonster_03,"FIRECAVE_MONSTER_04");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 3)
		{
			Wld_InsertNpc(firetestmonster_04,"FIRECAVE_MONSTER_04");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 4)
		{
			Wld_InsertNpc(firetestmonster_05,"FIRECAVE_MONSTER_04");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		};
		Wld_SetTime(12,0);
		B_GivePlayerXP(100);
		KELIOSFIREMONSTER_04 = TRUE;
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	};
};

func void evt_firetest_05_func_s1()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIREMONSTER_05 == FALSE))
	{
		if(FIRECAVEMONSTERCOUNT <= 0)
		{
			Wld_InsertNpc(firetestmonster_01,"FIRECAVE_MONSTER_05");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 1)
		{
			Wld_InsertNpc(firetestmonster_02,"FIRECAVE_MONSTER_05");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 2)
		{
			Wld_InsertNpc(firetestmonster_03,"FIRECAVE_MONSTER_05");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 3)
		{
			Wld_InsertNpc(firetestmonster_04,"FIRECAVE_MONSTER_05");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		}
		else if(FIRECAVEMONSTERCOUNT == 4)
		{
			Wld_InsertNpc(firetestmonster_05,"FIRECAVE_MONSTER_05");
			FIRECAVEMONSTERCOUNT = FIRECAVEMONSTERCOUNT + 1;
		};
		Wld_SetTime(12,0);
		B_GivePlayerXP(100);
		KELIOSFIREMONSTER_05 = TRUE;
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	};
};

func void evt_teleport_to_firecave_from_nw_func()
{
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (KELIOSFIRETESTFROMNW == FALSE))
	{
		KELIOSFIRETESTFROMNW = TRUE;
		Wld_SendTrigger("EVT_FIRECAVEMOVE_TRG");
	};
	if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE) && (KELIOSFIRETESTONETIME == FALSE))
	{
		Wld_SendTrigger("EVT_FIRECAVEMOVE_TRG");
		KELIOSFIRETESTONETIME = TRUE;
	};
};

func void evt_teleport_to_paladinfort_gate_func()
{
	if((GRANTTOFORT == TRUE) && (PALADINFORTGATEOPENED == FALSE))
	{
		PALADINFORTGATEOPENED = TRUE;
		Wld_SendTrigger("EVT_TRIGGER_FORTGATE_OPEN");
	};
};

func int evt_wt_cond_freez()
{
	if((MIS_WAKONTEST == LOG_Running) && (FREEWATERSOUL == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_wt_freez_s1()
{
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_WAKONTEST,"Dokázal jsem to - osvobodil jsem Ducha Vody z jeho vězení! Teď se můžu vrátit za Strážcem Wakonem a informovat ho o tom.");
	Log_AddEntry(TOPIC_WAKONTEST,"Také jako na důkaž vděčnosti jsem dostal vodní perlu - nikdy jsem se nesetkal s takovou věcí!");
	FREEWATERSOUL = TRUE;
	Wld_InsertItem(itmi_watercrystal,"FP_ITEM_WATERSOULREMAINS");
};

func void evt_watersoul_scr_main_func()
{
	if((MIS_WAKONTEST == LOG_Running) && (ORCAMULETWATERSOUL == TRUE) && (ORCAMULETWATERSOULONETIME == FALSE))
	{
		B_LogEntry(TOPIC_WAKONTEST,"Jak se dalo čekat, kamenná past, ve které byl Duch Vody uvězněn, se uvolnila, když jsem se k ní přiblížil.");
		Wld_SendTrigger("EVT_WATERSOUL_FREE_MASTERTRIGGER");
		ORCAMULETWATERSOULONETIME = TRUE;
	};
};

func int evt_swt_blackcrystal_cond_01()
{
	if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_swt_blackcrystal_cond_02()
{
	if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_02 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_swt_blackcrystal_cond_03()
{
	if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_03 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_swt_blackcrystal_cond_04()
{
	if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_04 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func int evt_swt_blackcrystal_cond_05()
{
	if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_05 == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_swt_blackcrystal_01_s1()
{
	if(GUARDIAN_RING_NARUS == TRUE)
	{
		B_GivePlayerXP(150);
		PLACEBLKCRST_01 = TRUE;
		Snd_Play("MFX_DESTROYUNDEAD_CAST");
		RemoveOrcBlackCrystals = TRUE;

		if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == TRUE) && (PLACEBLKCRST_02 == TRUE) && (PLACEBLKCRST_03 == TRUE) && (PLACEBLKCRST_04 == TRUE) && (PLACEBLKCRST_05 == TRUE) && (ORCAMULETWATERSOUL == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_LogEntry(TOPIC_WAKONTEST,"Zdá se, že černý křišťál, který je na obětním kameni skřetů opět získal magickou sílu. Myslím, že kamenná past, ve které je držen Duch Vody, by se teď měla uvolnit!");
			Wld_SendTrigger("EVT_TRIGGER_ACTIVATEBLACKROCK");
			ORCAMULETWATERSOUL = TRUE;
		};
	}
	else
	{
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void evt_swt_blackcrystal_02_s1()
{
	if(GUARDIAN_RING_NARUS == TRUE)
	{
		B_GivePlayerXP(150);
		PLACEBLKCRST_02 = TRUE;
		Snd_Play("MFX_DESTROYUNDEAD_CAST");
		RemoveOrcBlackCrystals = TRUE;

		if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == TRUE) && (PLACEBLKCRST_02 == TRUE) && (PLACEBLKCRST_03 == TRUE) && (PLACEBLKCRST_04 == TRUE) && (PLACEBLKCRST_05 == TRUE) && (ORCAMULETWATERSOUL == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_LogEntry(TOPIC_WAKONTEST,"Zdá se, že černý křišťál, který je na obětním kameni skřetů opět získal magickou sílu. Myslím, že kamenná past, ve které je držen Duch Vody, by se teď měla uvolnit!");
			Wld_SendTrigger("EVT_TRIGGER_ACTIVATEBLACKROCK");
			ORCAMULETWATERSOUL = TRUE;
		};
	}
	else
	{
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void evt_swt_blackcrystal_03_s1()
{
	if(GUARDIAN_RING_NARUS == TRUE)
	{
		B_GivePlayerXP(150);
		PLACEBLKCRST_03 = TRUE;
		Snd_Play("MFX_DESTROYUNDEAD_CAST");
		RemoveOrcBlackCrystals = TRUE;

		if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == TRUE) && (PLACEBLKCRST_02 == TRUE) && (PLACEBLKCRST_03 == TRUE) && (PLACEBLKCRST_04 == TRUE) && (PLACEBLKCRST_05 == TRUE) && (ORCAMULETWATERSOUL == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_LogEntry(TOPIC_WAKONTEST,"Zdá se, že černý křišťál, který je na obětním kameni skřetů opět získal magickou sílu. Myslím, že kamenná past, ve které je držen Duch Vody, by se teď měla uvolnit!");
			Wld_SendTrigger("EVT_TRIGGER_ACTIVATEBLACKROCK");
			ORCAMULETWATERSOUL = TRUE;
		};
	}
	else
	{
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void evt_swt_blackcrystal_04_s1()
{
	if(GUARDIAN_RING_NARUS == TRUE)
	{
		B_GivePlayerXP(150);
		PLACEBLKCRST_04 = TRUE;
		Snd_Play("MFX_DESTROYUNDEAD_CAST");
		RemoveOrcBlackCrystals = TRUE;

		if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == TRUE) && (PLACEBLKCRST_02 == TRUE) && (PLACEBLKCRST_03 == TRUE) && (PLACEBLKCRST_04 == TRUE) && (PLACEBLKCRST_05 == TRUE) && (ORCAMULETWATERSOUL == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_LogEntry(TOPIC_WAKONTEST,"Zdá se, že černý křišťál, který je na obětním kameni skřetů opět získal magickou sílu. Myslím, že kamenná past, ve které je držen Duch Vody, by se teď měla uvolnit!");
			Wld_SendTrigger("EVT_TRIGGER_ACTIVATEBLACKROCK");
			ORCAMULETWATERSOUL = TRUE;
		};
	}
	else
	{
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void evt_swt_blackcrystal_05_s1()
{
	if(GUARDIAN_RING_NARUS == TRUE)
	{
		B_GivePlayerXP(150);
		PLACEBLKCRST_05 = TRUE;
		Snd_Play("MFX_DESTROYUNDEAD_CAST");
		RemoveOrcBlackCrystals = TRUE;

		if((MIS_WAKONTEST == LOG_Running) && (PLACEBLKCRST_01 == TRUE) && (PLACEBLKCRST_02 == TRUE) && (PLACEBLKCRST_03 == TRUE) && (PLACEBLKCRST_04 == TRUE) && (PLACEBLKCRST_05 == TRUE) && (ORCAMULETWATERSOUL == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_LogEntry(TOPIC_WAKONTEST,"Zdá se, že černý křišťál, který je na obětním kameni skřetů opět získal magickou sílu. Myslím, že kamenná past, ve které je držen Duch Vody, by se teď měla uvolnit!");
			Wld_SendTrigger("EVT_TRIGGER_ACTIVATEBLACKROCK");
			ORCAMULETWATERSOUL = TRUE;
		};
	}
	else
	{
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void evt_xardasritual_deadarea_func()
{
	var C_Npc outter1;
	var C_Npc outter2;
	var C_Npc outter3;
	var C_Npc outter4;
	var C_Npc outter5;
	outter1 = Hlp_GetNpc(none_117_nergal);
	outter2 = Hlp_GetNpc(xardas_slave_01);
	outter3 = Hlp_GetNpc(xardas_slave_02);
	outter4 = Hlp_GetNpc(xardas_slave_03);
	outter5 = Hlp_GetNpc(NONE_100_Xardas);

	if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASMADEMOVE00 == TRUE) && (XARDASFINISHRITUALOK == FALSE) && (XARDASRITUALFAIL == FALSE) && (NERGALSOULAWAY == FALSE))
	{
		Npc_ExchangeRoutine(NONE_100_Xardas,"XardasRitualDrained");
		Npc_ExchangeRoutine(none_117_nergal,"FailRitual");
		Npc_PercEnable(none_117_nergal,PERC_ASSESSTALK,B_AssessTalk);
		Npc_PercEnable(NONE_100_Xardas,PERC_ASSESSTALK,B_AssessTalk);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",outter1,outter1,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outter1,outter1,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outter1,outter1,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",outter2,outter2,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",outter3,outter3,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",outter4,outter4,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",outter5,outter4,0,0,0,FALSE);
		AI_PlayAni(outter1,"T_PRACTICEMAGIC5");
		AI_StartState(outter5,zs_drained_yberion,0,"");
		B_KillNpc(xardas_slave_01);
		B_KillNpc(xardas_slave_02);
		B_KillNpc(xardas_slave_03);
		B_LogEntry(TOPIC_XARDASTASKSFOUR,"Nehleděl jsem na Xardasovu radu a během rituálu jsem vstoupil do pentagramu. Sám nevím - proč jsem to udělal?");
		XARDASRITUALFAIL = TRUE;
	};
};

func void evt_view_nergalpet_func()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (KNOWWHERENERCONOMICON == TRUE) && (NERGALPETVIEW == FALSE))
	{
		B_LogEntry(TOPIC_XARDASTASKSFOUR,"Nesmrtelné stvoření, o němž Nergal mluvil, je jak se ukázalo stínový golem. Musím přijít na to, jak zničit toto stvoření. Kdysi jsem čelil podobnému problému - tehdy jsem se musel vypořádat s magickými golemy, kteří chránili Xardasovu věž. Že by tohle byla odpověď na řešení tohoto problému?");
		NERGALPETVIEW = TRUE;
	};
};

func void evt_script_stonnoschamberenter_func()
{
	if((CHOOSESTONE == TRUE) && (ONCEOPENSTONNOSCHAMBER == FALSE))
	{
		Wld_SendTrigger("EVT_ENTER_STONNOSCHAMBER");
		ONCEOPENSTONNOSCHAMBER = TRUE;
	};
	if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (ONCEOPENSTONNOSCHAMBER == FALSE))
	{
		Wld_SendTrigger("EVT_ENTER_STONNOSCHAMBER");
		ONCEOPENSTONNOSCHAMBER = TRUE;
	};
	if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (CANREOPENGATEAFTERDEATH == TRUE) && (TWOOPENSTONNOSCHAMBER == FALSE))
	{
		Wld_SendTrigger("EVT_ENTER_STONNOSCHAMBER");
		TWOOPENSTONNOSCHAMBER = TRUE;
	};
};

func void evt_garondarrivesext_func()
{
	if((ALLAWAYFROMCASTLE == TRUE) && (PALADINAWAYORC == TRUE) && (GARONDARRIVESEXIT == FALSE))
	{
		GARONDARRIVESEXIT = TRUE;
	};
};

func void evt_paladinnomoresafe_func()
{
	if((PALADINAWAYORC == FALSE) && (ALLAWAYFROMCASTLE == TRUE))
	{
		PALADINAWAYORC = TRUE;
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_GivePlayerXP(100);
			B_LogEntry(TOPIC_RESCUEGAROND,"Vyvedl jsem Garonda a jeho muže ze skřetího zajetí.");
		};
	};
};

func void evt_castelisdown_ok_func()
{
	if((EnterOW_Kapitel6 == TRUE) && (MIS_ORCGREATWAR == LOG_Running) && (CASTLEISDOWN == FALSE))
	{
		CASTLEISDOWN = TRUE;
		if(MIS_ORCGREATWAR == LOG_Running)
		{
			B_LogEntry(TOPIC_ORCGREATWAR,"Špatné zprávy - hrad v Hornickém údolí padl! Skřeti ho vzali útokem a dobyli. Myslím, že tato zpráva moc lorda Hagena nepotěší.");
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Hrad v Hornickém údolí padl! Skřeti ho vzali útokem a dobyli. Myslím, že tato zpráva moc lorda Hagena nepotěší.");
		};
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			B_LogEntry(TOPIC_NEWSSURVIVERS,"Hrad v Hornickém údolí padl! Skřeti ho vzali útokem a dobyli. Myslím, že tato zpráva paladiny velice nepotěší!");
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, bude hrad v Hornickém údolí dobře střežen. Dá se čekat velká bitva.");
		};
	};
	if((EnterOW_Kapitel6 == TRUE) && (MIS_ORCGREATWAR == LOG_Running) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == TRUE) && (PERMZAMOK == FALSE))
	{
		PERMZAMOK = TRUE;
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Nyní mají skřeti plnou nadvládu nad hradem! Myslím, že tato zpráva moc lorda Hagena nepotěší.");
		};
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			B_LogEntry(TOPIC_NEWSSURVIVERS,"Jak říkal Nathan, hrad v Hornickém údolí padl! Skřeti ho vzali útokem a dobyli. Je třeba zjistit, co se stalo s Garondem a ostatními.");
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			B_LogEntry(TOPIC_STURMCASTLE,"Vypadá to, že hrad v Hornickém údolí bude dobře střežen. Dá se čekat velká bitva.");
		};
	};
	if((MIS_CHALLANGEORC == LOG_SUCCESS) && (CASTLEFLAGBACK_06 == FALSE) && (URHANBEATEN == TRUE) && (HAGTARISINSERTEDBACK == FALSE) && (REFUSEURHAN == FALSE))
	{
		B_StartOtherRoutine(urhan,"UrHanGoBack");
		AI_Teleport(urhan,"OC_EBR_STAND_THRONE_HAGTAR");
		urhan.aivar[AIV_EnemyOverride] = FALSE;
		AI_AlignToWP(urhan);
		HAGTARISINSERTEDBACK = TRUE;
	};
};

func void evt_orcchallange_done_func()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (CASTLEFLAGBACK_06 == FALSE) && (HAGTARISINSERTED == FALSE))
	{
		B_StartOtherRoutine(urhan,"UrHanGoBattle");
		AI_Teleport(urhan,"URHAN_CHALANGE");
		urhan.aivar[AIV_EnemyOverride] = TRUE;
		AI_AlignToWP(urhan);
		HAGTARISINSERTED = TRUE;
	};
};

func int evt_paladincaptured1_cond_func()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		if(OLDCAMDGATEOPEN_01 == TRUE)
		{
			return FALSE;
		};
		if(PALADINCASTELFREE == TRUE)
		{
			return TRUE;
		};
	}
	else
	{
		return FALSE;
	};
	return FALSE;
};

func int evt_paladincaptured2_cond_func()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		if(OLDCAMDGATEOPEN_02 == TRUE)
		{
			return FALSE;
		};
		if(PALADINCASTELFREE == TRUE)
		{
			return TRUE;
		};
	}
	else
	{
		return FALSE;
	};
	return FALSE;
};

func int evt_paladincaptured3_cond_func()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		if(OLDCAMDGATEOPEN_03 == TRUE)
		{
			return FALSE;
		};
		if(PALADINCASTELFREE == TRUE)
		{
			return TRUE;
		};
	}
	else
	{
		return FALSE;
	};
	return FALSE;
};

func void evt_paladincaptured1_func_s1()
{
	if((PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_01 == FALSE))
	{
		B_GivePlayerXP(50);
		OLDCAMDGATEOPEN_01 = TRUE;
		Npc_ExchangeRoutine(PAL_252_Parcival,"CageFree");
	};
};

func void evt_paladincaptured2_func_s1()
{
	if((PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_02 == FALSE))
	{
		B_GivePlayerXP(50);
		OLDCAMDGATEOPEN_02 = TRUE;
		Npc_ExchangeRoutine(PAL_250_Garond,"CageFree");
	};
};

func void evt_paladincaptured3_func_s1()
{
	if((PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_03 == FALSE))
	{
		B_GivePlayerXP(50);
		OLDCAMDGATEOPEN_03 = TRUE;
		Npc_ExchangeRoutine(PAL_251_Oric,"CageFree");
		Npc_ExchangeRoutine(PAL_268_Udar,"CageFree");
	};
};

func void evt_orccity_pass_func()
{
	if(PASSORKCHAMBER == FALSE)
	{
		ORCPASSNOTRALL = TRUE;
	}
	else
	{
		ORCPASSNOTRALL = FALSE;
	};
};

func void evt_azgan_palteleport_func()
{
	if((PALADINTELEPORTTOAZGAN == FALSE) && (GARONDGOFORT == TRUE))
	{
		PALADINTELEPORTTOAZGAN = TRUE;
		if(!Npc_IsDead(pal_2500_garond))
		{
			Npc_ExchangeRoutine(pal_2500_garond,"TOT");
			AI_Teleport(pal_2500_garond,"TOT");
		};
		if(!Npc_IsDead(pal_2510_oric))
		{
			Npc_ExchangeRoutine(pal_2510_oric,"TOT");
			AI_Teleport(pal_2510_oric,"TOT");
		};
		if(!Npc_IsDead(pal_2520_parcival))
		{
			Npc_ExchangeRoutine(pal_2520_parcival,"TOT");
			AI_Teleport(pal_2520_parcival,"TOT");
		};
		if(!Npc_IsDead(pal_2170_marcos))
		{
			Npc_ExchangeRoutine(pal_2170_marcos,"TOT");
			AI_Teleport(pal_2170_marcos,"TOT");
		};
		if(!Npc_IsDead(pal_75230_albert))
		{
			Npc_ExchangeRoutine(pal_75230_albert,"TOT");
			AI_Teleport(pal_75230_albert,"TOT");
		};
		if(!Npc_IsDead(pal_75180_ritter))
		{
			Npc_ExchangeRoutine(pal_75180_ritter,"TOT");
			AI_Teleport(pal_75180_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_75190_ritter))
		{
			Npc_ExchangeRoutine(pal_75190_ritter,"TOT");
			AI_Teleport(pal_75190_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_75200_ritter))
		{
			Npc_ExchangeRoutine(pal_75200_ritter,"TOT");
			AI_Teleport(pal_75200_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_75210_ritter))
		{
			Npc_ExchangeRoutine(pal_75210_ritter,"TOT");
			AI_Teleport(pal_75210_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_75220_ritter))
		{
			Npc_ExchangeRoutine(pal_75220_ritter,"TOT");
			AI_Teleport(pal_75220_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_75240_ritter))
		{
			Npc_ExchangeRoutine(pal_75240_ritter,"TOT");
			AI_Teleport(pal_75240_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_2530_wache))
		{
			Npc_ExchangeRoutine(pal_2530_wache,"TOT");
			AI_Teleport(pal_2530_wache,"TOT");
		};
		if(!Npc_IsDead(pal_2570_ritter))
		{
			Npc_ExchangeRoutine(pal_2570_ritter,"TOT");
			AI_Teleport(pal_2570_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_91650_ritter))
		{
			Npc_ExchangeRoutine(pal_91650_ritter,"TOT");
			AI_Teleport(pal_91650_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_91660_ritter))
		{
			Npc_ExchangeRoutine(pal_91660_ritter,"TOT");
			AI_Teleport(pal_91660_ritter,"TOT");
		};
		if(!Npc_IsDead(pal_91670_ritter))
		{
			Npc_ExchangeRoutine(pal_91670_ritter,"TOT");
			AI_Teleport(pal_91670_ritter,"TOT");
		};
	};
	if((MIS_NATANDOLG == FALSE) || (MIS_NATANDOLG == LOG_FAILED))
	{
		if(!Npc_IsDead(pal_2680_udar))
		{
			Npc_ExchangeRoutine(pal_2680_udar,"TOT");
			AI_Teleport(pal_2680_udar,"TOT");
		};
		if(!Npc_IsDead(pal_91680_natan))
		{
			Npc_ExchangeRoutine(pal_91680_natan,"TOT");
			AI_Teleport(pal_91680_natan,"TOT");
		};
	}
	else if((MIS_NATANDOLG == LOG_SUCCESS) && (UDARNATANTELEPORT == FALSE))
	{
		UDARNATANTELEPORT = TRUE;
		if(!Npc_IsDead(pal_2680_udar))
		{
			Npc_ExchangeRoutine(pal_2680_udar,"TOT");
			AI_Teleport(pal_2680_udar,"TOT");
		};
		if(!Npc_IsDead(pal_91680_natan))
		{
			Npc_ExchangeRoutine(pal_91680_natan,"TOT");
			AI_Teleport(pal_91680_natan,"TOT");
		};
	};
};

func void evt_trgger_di_guardianappears_func()
{
	var C_Npc outterg1;
	if((UndeadDragonIsDead == TRUE) && (DAGOTDI == FALSE))
	{
		Wld_SendTrigger("EVT_TRIGER_DI_GUARDINBLOCK_01");
		Wld_SendTrigger("EVT_TRIGER_DI_GUARDINBLOCK_02");
		outterg1 = Hlp_GetNpc(dmt_121200_dagot);
		Npc_ExchangeRoutine(outterg1,"WaitMe");
		AI_Teleport(outterg1,"UNDEAD_ENDTELEPORT");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",outterg1,outterg1,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",outterg1,outterg1,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",outterg1,outterg1,0,0,0,FALSE);
		Wld_InsertNpc(demondagot_01,"FP_STAND_DI_GUARDIANDEMON_01");
		Wld_InsertNpc(demondagot_02,"FP_STAND_DI_GUARDIANDEMON_02");
		Wld_InsertNpc(demondagot_03,"FP_STAND_DI_GUARDIANDEMON_03");
		Wld_InsertNpc(demondagot_04,"FP_STAND_DI_GUARDIANDEMON_04");
		DAGOTDI = TRUE;
	};
};

func void evt_noenter_guardians_func()
{
};

func void EVT_NOPASS_GUARDIANS_FUNC()
{
};

func void EVT_NOGUARDIANSHERE_FUNC()
{
	if((DAGOTTELLALL == TRUE) && (SleeperStone == TRUE) && (NETBEKLEADME_STEP1DONE == TRUE) && (HaosCome == FALSE))
	{
		B_LogEntry(TOPIC_GUARDIANS,"Strážci jsou pryč! Ztrácím se v domněnkách, kam se mohli podít a co se to tady vlastně děje. Přede mnou se nachází obrovský magický portál, jež je ozářen jasným plamenem a ze kterého jde neuvěřitelný strach a hrůza. Jak se tak zdá, moje další počínání je přesně tady. Ale nejdřív se musím vypořádat s těmi, kdo ho chrání.");
		HaosCome = TRUE;
	};
};

func void evt_vieworcsiege_func()
{
	if((KAPITELORCATC == TRUE) && (NOTALKNOBODYWANT == FALSE))
	{
		NOTALKNOBODYWANT = TRUE;
	};
};

func void evt_failedwaterritual_func()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (WATERMAGESTART == TRUE) && (WATERMAGESTOP == FALSE))
	{
		b_killnpccannodead(KDW_14000_Addon_Saturas_ADW);
		b_killnpccannodead(KDW_14010_Addon_Cronos_ADW);
		b_killnpccannodead(KDW_14020_Addon_Nefarius_ADW);
		b_killnpccannodead(KDW_14050_Addon_Merdarion_ADW);
		WATERMAGESTOP = TRUE;
		MIS_RESTOREHRAM = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RESTOREHRAM);
		ALLFRACTIONS = ALLFRACTIONS - 1;
		if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
		{
			PREGATHERALLONBIGFARM = TRUE;
		};
	};
};

func void evt_firstlookontotem_func()
{
	Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	if(FIRSTLOOKONTOTEM == FALSE)
	{
		B_GivePlayerXP(100);
		FIRSTLOOKONTOTEM = TRUE;
		if(MIS_STRANGETHINGS == LOG_Running)
		{
			B_LogEntry(TOPIC_STRANGETHINGS,"Podařilo se mi narazit na velmi neobvyklou sochu. Zdá se, že vyzařuje nějakou podivnou magickou energii, z čehož je mi trochu nepříjemné. Co by to tak mohlo znamenat?");
		}
		else if(MIS_STRANGETHINGS == FALSE)
		{
			MIS_STRANGETHINGS = LOG_Running;
			Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
			B_LogEntry(TOPIC_STRANGETHINGS,"Podařilo se mi narazit na velmi neobvyklou sochu. Zdá se, že vyzařuje nějakou podivnou magickou energii, z čehož je mi trochu nepříjemné. Co by to tak mohlo znamenat?");
		};
	};
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
};

func void evt_beginbigbattle_func()
{
	if((LEESENTTOTROOPS == TRUE) && (HEROPLACEISWAR == TRUE) && (PRESTARTBIGBATTLE == FALSE))
	{
		b_changename(pal_91220_ritter," ");
		b_changename(pal_91230_ritter," ");
		b_changename(pal_91210_ritter," ");
		PlayVideo("RET2_BlackScreen.bik");
		GUARDIANSISDEFEATED = TRUE;
		PRESTARTBIGBATTLE = TRUE;
		Wld_SendTrigger("EVT_TRIGGER_BIGBATTLECAMERA");
	};
};

func void evt_beginbigbattle_mage_func()
{
	if((LEESENTTOTROOPS == TRUE) && (HEROPLACEISMAGE == TRUE) && (PRESTARTBIGBATTLE == FALSE))
	{
		PlayVideo("RET2_BlackScreen.bik");
		GUARDIANSISDEFEATED = TRUE;
		PRESTARTBIGBATTLE = TRUE;
		Wld_SendTrigger("EVT_TRIGGER_BIGBATTLECAMERA");
	};
};

func void evt_adanosgivepower_func()
{
};

func void EVT_HIDEPIRATECAMP_FUNC()
{
	if((HenryBonus == FALSE) && (HenryTalk == FALSE))
	{
		HenryBonus = TRUE;
	};
};

func void evt_unitor_find_func()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKERUNE == TRUE) && (FINDUNITORALREADY == FALSE))
	{
		FINDUNITORALREADY = TRUE;
	};
};

func void evt_box_battle_func()
{
	if((PRESTARTBIGBATTLE == TRUE) && (STOPBIGBATTLE == FALSE) && ((BIGBATTLEBACKPOSITION == FALSE) || (ORCSWINSBB == FALSE)))
	{
		AI_Teleport(hero,"NW_BIGFIGHT_HUM_01");
	};
	if((ORCSWINSBB == TRUE) && (STOPBIGBATTLE == TRUE) && (TELEPORTFRIENDSLOST == FALSE))
	{
		B_StartOtherRoutine(PC_Thief_NW,"Lost");
		AI_Teleport(PC_Thief_NW,"NW_BIGFARM_FOREST_05");
		B_StartOtherRoutine(PC_Psionic,"Lost");
		AI_Teleport(PC_Psionic,"NW_XARDAS_TOWER_LESTER");
		B_StartOtherRoutine(PC_Mage_NW,"Lost");
		AI_Teleport(PC_Mage_NW,"NW_TROLLAREA_PATH_04");
		B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Lost");
		AI_Teleport(PC_Fighter_NW_nach_DJG,"NW_TROLLAREA_RITUAL_04");
		TELEPORTFRIENDSLOST = TRUE;
		Onar.attribute[ATR_HITPOINTS] = 3000;
		Onar.attribute[ATR_HITPOINTS_MAX] = 3000;
		Wld_SendTrigger("EVT_TRIGGER_ORCSATTACKFARM");
	};
};

func int evt_prisoncaptured_cond_01_func()
{
	if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == FALSE))
	{
		return FALSE;
	}
	else if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == TRUE))
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	};
	return TRUE;
};

func int evt_prisoncaptured_cond_02_func()
{
	if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == FALSE))
	{
		return FALSE;
	}
	else if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == TRUE))
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	};
	return TRUE;
};

func int evt_prisoncaptured_cond_03_func()
{
	if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == FALSE))
	{
		return FALSE;
	}
	else if((KAPITELORCATC == TRUE) && (CAPTUREDMANSISFREE == FALSE) && (HORINISISFREE == TRUE))
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	};
	return TRUE;
};

func void evt_prisoncaptured_01_func_s1()
{
	if(GATEPRISONISOPEN_01 == FALSE)
	{
		GATEPRISONISOPEN_01 = TRUE;
	}
	else
	{
		GATEPRISONISOPEN_01 = FALSE;
	};
	if((HORINISISFREE == TRUE) && (GATEPRISONISOPEN_01 == TRUE) && (CAPTUREDMANSISFREE == TRUE))
	{
		if((WOLFCAPTURED == TRUE) && (WOLFISFREE == FALSE) && (WOLFRECRUITEDDT == FALSE))
		{
			B_StartOtherRoutine(SLD_811_Wolf,"Start");
			WOLFISFREE = TRUE;
		};
		if((LARESCAPTURED == TRUE) && (LARESISFREE == FALSE))
		{
			B_StartOtherRoutine(VLK_449_Lares,"OrcAtcNW");
			LARESISFREE = TRUE;
		};
	};
	if(KAPITELORCATC == FALSE)
	{
		if((hero.guild != GIL_PAL) || (hero.guild != GIL_MIL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDF))
		{
			ALARMONPRISON = TRUE;
		};
	};
};

func void evt_prisoncaptured_02_func_s1()
{
	if(GATEPRISONISOPEN_02 == FALSE)
	{
		GATEPRISONISOPEN_02 = TRUE;
	}
	else
	{
		GATEPRISONISOPEN_02 = FALSE;
	};
	if((HORINISISFREE == TRUE) && (GATEPRISONISOPEN_02 == TRUE) && (CAPTUREDMANSISFREE == TRUE))
	{
		if((TORLOFCAPTURED == TRUE) && (TORLOFISFREE == FALSE))
		{
			B_StartOtherRoutine(SLD_801_Torlof,"Start");
			TORLOFISFREE = TRUE;
		};
		if((ANGARCAPTURED == TRUE) && (ANGARISFREE == FALSE))
		{
			B_StartOtherRoutine(DJG_705_Angar_NW,"PsiCamp");
			ANGARISFREE = TRUE;
		};
	};
	if(KAPITELORCATC == FALSE)
	{
		if((hero.guild != GIL_PAL) || (hero.guild != GIL_MIL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDF))
		{
			ALARMONPRISON = TRUE;
		};
	};
};

func void evt_prisoncaptured_03_func_s1()
{
	if(GATEPRISONISOPEN_03 == FALSE)
	{
		GATEPRISONISOPEN_03 = TRUE;
	}
	else
	{
		GATEPRISONISOPEN_03 = FALSE;
	};
	if((HORINISISFREE == TRUE) && (GATEPRISONISOPEN_03 == TRUE) && (CAPTUREDMANSISFREE == TRUE))
	{
		if((GIRIONCAPTURED == TRUE) && (GIRIONISFREE == FALSE))
		{
			B_StartOtherRoutine(Pal_207_Girion,"Farm");
			GIRIONISFREE = TRUE;
		};
		if((BENNETCAPTURED == TRUE) && (BENNETISFREE == FALSE))
		{
			B_StartOtherRoutine(SLD_809_Bennet,"Start");
			BENNETISFREE = TRUE;
		};
	};
	if(KAPITELORCATC == FALSE)
	{
		if((hero.guild != GIL_PAL) || (hero.guild != GIL_MIL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDF))
		{
			ALARMONPRISON = TRUE;
		};
	};
};

func void evt_endallgame_func()
{
	if((ALLSAYGOODBUY == TRUE) && (ALLSAYGOODBUYDONE == FALSE))
	{
		Wld_SendTrigger("EVT_TRIGGER_CAMERA_ENDGAME");
		ALLSAYGOODBUYDONE = TRUE;
		if(TORLOFISAGAINCAPITAN == TRUE)
		{
			B_StartOtherRoutine(SLD_801_Torlof,"EndGame");
		}
		else if(GREGISCAPITAN == TRUE)
		{
			B_StartOtherRoutine(pir_13200_addon_greg,"EndGame");
		};
	};
};

func void evt_xardas_resettime_func()
{
	if(BlockLegend == FALSE)
	{
		BlockLegend = TRUE;
	};

};

func void evt_transferisover_func()
{
	if((PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(hero);
	};
};

func void evt_transferisoverinhouse_func()
{
	if(PALADINCANTTRUST == FALSE)
	{
		PALADINCANTTRUST = TRUE;
	};
};

func void evt_transferisoverinhousetwo_func()
{
	if(PALADINCANTTRUST == TRUE)
	{
		PALADINCANTTRUST = FALSE;
	};
};

func int evt_boatjorney_cond_func()
{
	if(BOATJORNEY == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void evt_cityhall_react_func()
{
	if((CITYHALLACCESSGRANTED == FALSE) && (GUR_EliteDo == FALSE))
	{
		TOARMSCITYHALL = TRUE;
	};
};

func void evt_kasern_react_func()
{
	if((hero.guild == GIL_NONE) && (GUR_EliteDo == FALSE))
	{
		TOARMSKASERN = TRUE;
	};
};

func void EVT_BAKER_REACT_FUNC()
{
	if(BakerSee == FALSE)
	{
		BakerSee = TRUE;
	};
};

func void evt_citygate_react_01_func()
{
	if((CITYGATEACCESSGRANTED == FALSE) && (INTOWNSNEAK == FALSE) && (GUR_EliteDo == FALSE))
	{
		TOARMSCITYGATE = TRUE;
	};
	if(INTOWNSNEAK == TRUE)
	{
		INTOWNSNEAK = FALSE;
	};
};

func void OC_ENTRANCE_01_FUNC()
{
};

func void evt_citygate_react_02_func()
{
	if((CITYGATEACCESSGRANTED == FALSE) && (INTOWNSNEAK == FALSE) && (GUR_EliteDo == FALSE))
	{
		TOARMSCITYGATE = TRUE;
	};
	if(INTOWNSNEAK == TRUE)
	{
		INTOWNSNEAK = FALSE;
	};
};

func void evt_citygate_react_03_func()
{
	if((HIGHCITYGATEACCESSGRANTED == FALSE) && (GUR_EliteDo == FALSE))
	{
		TOARMSHIGHCITYGATE = TRUE;
	};
};

func void evt_citygate_intown_func()
{
	if(CITYGATEACCESSGRANTED == FALSE)
	{
		INTOWNSNEAK = TRUE;
	};
};

func void evt_skladmil_react_func()
{
	var C_Npc guardsklad;
	guardsklad = Hlp_GetNpc(Mil_325_Miliz);
	if(!C_BodyStateContains(hero,BS_SNEAK) && (SKLADACCESSGRANTED == FALSE) && !Npc_IsInState(guardsklad,ZS_MagicSleep))
	{
		Npc_ExchangeRoutine(guardsklad,"SkladAlarm");
		AI_SetWalkMode(guardsklad,NPC_RUN);
		AI_GotoWP(guardsklad,"NW_CITY_MERCHANT_PATH_03");
		SKLADALARM = TRUE;
	};
};

func void EVT_StrangeCave_func()
{
	if((MIS_StrangeCave == LOG_Running) && (EVT_StrangeCave_OneTime == FALSE) && (hero.guild == GIL_MEATBUG) && (Wld_IsTime(21,59,4,59)))
	{
		Snd_Play("SKE_AMBIENT");
		B_LogEntry(TOPIC_StrangeCave,"Zdá se, že se vepředu něco hýbe...");
		Wld_InsertNpc(SKELETONMAGE_STRANGECAVE,"EVT_STRANGECAVE_SPAWN_01");
		EVT_StrangeCave_OneTime = TRUE;
	};
};

func void evt_assasins_door_found_func()
{
	if((MIS_PrioratStart == LOG_Running) && (Assasins_Door_Found == TRUE) && (Assasins_Door_Found_OneTime == FALSE))
	{
		B_GivePlayerXP(300);
		B_LogEntry(TOPIC_PrioratStart ,"Na místě, kam mě zavedl Lokiův novic, jsem našel kamennou desku, na které byl opravdu vyobrazen symbol s amuletem. Vedle něj byl ještě malý kamenný podstavec, kde se obrys tvaru stejného symbolu výrazně lišil. Myslím, že bych si o tom měl promluvit troubou Namibem.");
		Assasins_Door_Found_OneTime = TRUE;
	};
};

func void EVT_PW_ENTRANCE_MAIN_FUNC()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendToMasiaf == TRUE) && (ReadyGoForMasiafLair == FALSE))
	{
		B_GivePlayerXP(1000);
		Wld_SendTrigger("EVT_AMULET_INPLACE_DO_1");
		Wld_SendTrigger("EVT_AMULET_INPLACE_DO_2");
		Snd_Play("MFX_MASSDEATH_CAST");
		Npc_RemoveInvItems(hero,ItKe_Masiaf_Open,1);
		B_LogEntry(TOPIC_PrioratStart ,"Vložil jsem amulet do otvoru v podstavci a poté se otevřel tajný průchod ve skále. Myslím, že o tom bude Gonzalez rád vědět.");
		ReadyGoForMasiafLair = TRUE;
	};
};

func void EVT_PW_TELEPORT_CORGALOM_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_Teleport(hero,"PW_OUT_TO_IN_CHAMBERS");
	Wld_SetTime(05,00);
};

func void EVT_PW_GALOM_TELEPORT_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_Teleport(hero,"PW_BOSSNEAR");
};

func void EVT_PW_ENTRANCE_PRIORAT_FUNC()
{
};

func void PW_PRIORAT_ALERT_FUNC()
{
	if(CageSlaveOpen == FALSE)
	{
		CageSlaveOpen = TRUE;
	}
	else
	{
		CageSlaveOpen = FALSE;
	};
};

func void EVT_CAGESLAVE_FUNC()
{
	if(CageSlaveOpen == TRUE)
	{
		CageSlaveOpen = FALSE;
		Wld_SendTrigger("EVT_PW_PRISION_GATE");
	};
};

func void EVT_PW_GOLDSHAHT_FUNC()
{
	if(PW_GOLDSHAHT == FALSE)
	{
		PW_GOLDSHAHT = TRUE;
	};
};

func void EVT_PW_CONVOY_FUNC()
{
	if((PW_BeginFakeDone == FALSE) && (PW_BeginFake == TRUE))
	{
		if(!Wld_IsTime(7,0,8,0))
		{
			Npc_ExchangeRoutine(Ass_167_Adept_Convoy,"NoFake");
			Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"NoFake");
			PW_BeginFakeDone = TRUE;
			PlayerIsPrioratFake = TRUE;
		}
		else
		{
			if(ConvoyDetect == FALSE)
			{
				AI_Teleport(Ass_167_Adept_Convoy,"PW_CONVOY_START_01");
				AI_Teleport(SEK_168_SLAVEOBSSEK,"PW_CONVOY_START_02");
			};

			PW_BeginFakeDone = TRUE;
		};
	};
};

func void EVT_PW_EARTHQUAKE_FUNC()
{
	if(PW_Blocked == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("Ravens_Earthquake4");
		Snd_Play("Ravens_Earthquake2");
		Wld_SendTrigger("EVT_PW_BLOCKED_PASSAGE");
		PW_Blocked = TRUE;

		if(GonsalesPW_Up == TRUE)
		{
			B_LogEntry(TOPIC_PrioratStart,"Prošel jsem přes jeskyni v horách a zdá se, že jsem se dostal do doposud neznámé části ostrova. No, prvně musím zjistit jak to tady je. Co je ale špatné - jeskynní průchod byl zavalen kameny. Zpáteční cesta tudy je vyloučena! Pokud se Gonzalesovi podařilo projít ještě přede mnou, první věc o kterou bych se měl pokusit, je ho najít a poptat se ho na toto místo. Do doby než ho najdu, bude lepší nepodnikat žádné další kroky...");
		}
		else
		{
			B_LogEntry(TOPIC_PrioratStart,"Prošel jsem přes jeskyni v horách a zdá se, že jsem se dostal do doposud neznámé části ostrova. No, prvně musím zjistit jak to tady je. Co je ale špatné - jeskynní průchod byl zavalen kameny. Zpáteční cesta tudy je vyloučena!");
			PlayerIsPrioratFake = TRUE;
			PlayerChooseFight_PW = TRUE;
			Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
			Wld_InsertItem(ItWr_HaniarDemonScroll,"FP_ITEMSPAWN_DEMONSCROLL");
			Wld_SendTrigger("EVT_DOOMHALL");
		};
	};
};

func void EVT_ASS_DEMON_ENTER_FUNC()
{
	var C_Npc NrozasDemon;

	if(DemonTrap_Blocked == FALSE)
	{
		NrozasDemon = Hlp_GetNpc(Ass_129_DeadNrozas);
		Wld_SendTrigger("EVT_CAM_01");
		//Wld_SendTrigger("EVT_ASS_DEMON_FIRSTLOCK_HIDE");
		NrozasDemon.aivar[AIV_EnemyOverride] = FALSE;
		DemonTrap_Blocked = TRUE;
	};
};

func void EVT_MASIAFRITUAL_FUNC()
{
	var C_Npc Tiamant_Prior;
	var C_Npc Haniar_Prior;
	var C_Npc Osair_Prior;
	var C_Npc Nrozas_Prior;

	Tiamant_Prior = Hlp_GetNpc(Ass_125_Tiamant);
	Haniar_Prior = Hlp_GetNpc(Ass_126_Haniar);
	Osair_Prior = Hlp_GetNpc(Ass_127_Osair);
	Nrozas_Prior = Hlp_GetNpc(Ass_128_Nrozas);

	if((PlayerIsAssNow == FALSE) && (ReadyForMasiafRitual == FALSE) && (PriorDipost == TRUE) && (Npc_GetDistToWP(Tiamant_Prior,"PW_TIAMANT_RITUAL") < 250) && (Npc_GetDistToWP(Haniar_Prior,"PW_HANIAR_RITUAL") < 250) && (Npc_GetDistToWP(Osair_Prior,"PW_OSAIR_RITUAL") < 250) && (Npc_GetDistToWP(Nrozas_Prior,"PW_NROZAS_RITUAL") < 250))
	{
		ReadyForMasiafRitual = TRUE;
	};
};

func void EVT_CAMERA_ORC_CITY_FUNC()
{
	if(Orc_City_Cam == FALSE)
	{
		Orc_City_Cam = TRUE;
		Wld_SendTrigger("EVT_CAM_01");
	};
};

func void EVT_ARRIVEGOLDSHAHT_FUNC()
{
	var int XP_Count;

	XP_Count = FALSE;

	if((MIS_PW_FollowGoldOre == LOG_Running) && (OsairWarriorWait == FALSE) && (HoakinIsDead == TRUE) && (OsairInRage == FALSE) && (PW_FollowGoldOre_OneTime == FALSE))
	{
		if(GoldSlave_01_IsDead == FALSE)
		{
			XP_Count = XP_Count + 1;
			SlaveArrived_01 = TRUE;
			B_StartOtherRoutine(SEK_186_SLAVEOBSSEK,"GoldOre");
		};
		if(GoldSlave_02_IsDead == FALSE)
		{
			XP_Count = XP_Count + 1;
			SlaveArrived_02 = TRUE;
			B_StartOtherRoutine(SEK_387_SLAVEOBSSEK,"GoldOre");
		};
		if((SlaveArrived_01 == TRUE) || (SlaveArrived_02 == TRUE))
		{
			B_LogEntry(TOPIC_PW_FollowGoldOre,"Přivedl jsem otroky do dolu. Teď musím počkat na Osairovi lidi, a pak mu to jít oznámit sám. Myslím, že by nebylo dobré tady otroky nechat samotné. Kdyby zemřeli před tím než dorazí obránci dolu, byla by to jen a jen moje chyba. To by pro mě vůbec nebylo dobré...");
			XP_Count = 500 + (XP_Count * 500);
			B_GivePlayerXP(XP_Count);
		};

		PW_FollowGoldOre_OneTime = TRUE;
	};
};

func void EVT_PW_DEATHMATCH_FUNC()
{
	var C_Npc Tiamant_Prior;

	Tiamant_Prior = Hlp_GetNpc(Ass_125_Tiamant);

	if((PW_DeathMatch_OneTime == FALSE) && (MIS_PW_FollowGoldOre == LOG_Success))
	{
		Tiamant_Prior.attribute[ATR_HITPOINTS_MAX] = 2000;
		Tiamant_Prior.attribute[ATR_HITPOINTS] = Tiamant_Prior.attribute[ATR_HITPOINTS_MAX];
		Wld_SendTrigger("EVT_CAM_DEATHMATCH");
		Npc_ExchangeRoutine(Ass_125_Tiamant,"Battle");
		Npc_ExchangeRoutine(Ass_126_Haniar,"Battle");
		PW_DeathMatch_OneTime = TRUE;
	};
};

func void EVT_ARRIVEGOLDSHAHT_GONE_FUNC()
{
	if((OsairWarriorWait == TRUE) && (PW_FollowGoldOre_OneTime == TRUE) && (OsairInRage == FALSE) && (ConvoyGoldShahtDone == FALSE))
	{
		Wld_InsertNpc(MinecrawlerWarrior,"PW_GOLD_CAVEORE_GUARD_01");
		B_KillNpc(SEK_387_SLAVEOBSSEK);
		B_KillNpc(SEK_186_SLAVEOBSSEK);
		B_LogEntry(TOPIC_PW_FollowGoldOre,"Vzadu jsem zaslechl výkřiky a nějaký rozruch...");
		OsairInRage = TRUE;
	};
};

func void EVT_WAITCAVE_ENDSCR_FUNC()
{
	if(ConvoyGoldShahtDone == FALSE)
	{
		Wld_InsertNpc(Ass_388_Adept,"PW_CAVEGOLDORE_01");
		Wld_InsertNpc(Ass_389_Adept,"PW_GOLD_CAVEORE_TEMP_19");
		Wld_InsertNpc(Ass_390_Adept,"PW_GOLD_CAVEORE_TEMP_18");
		ConvoyGoldShahtDone = TRUE;
	};
};

func void EVT_TROLL_GOTOEAT_FUNC()
{
	if((TrollEatMeat == FALSE) && ((PoisonDoneFull == TRUE) || (PoisonDoneHalf == TRUE) || (PoisonDoneOneTear == TRUE)))
	{
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Zdá se, že to stvoření sezoblo návnadu jak nic. Teď se podíváme, co jed od Nrozase dokáže!");
		TrollEatMeat = TRUE;
	};
};

func void EVT_PW_ENTRANCE_PRIORAT_ALARM_FUNC()
{
	if((PW_WelcomeToHram == FALSE) && (PlayerIsAssNow == FALSE) && (PlayerIsPrioratFake == FALSE))
	{
		PlayerIsPrioratFake = TRUE;
		AI_Print("Zdá se, že si mě všimli...");
	};
};

func void EVT_TRUBATTLE_FUNC()
{
	if((MIS_TrueBattle == LOG_Running) && (NrozasStartTrueBattle == TRUE) && (NrozasIsDead == FALSE) && (PlayerIsPrioratFake == FALSE))
	{
		PlayerIsPrioratFake = TRUE;
	};
};

func void EVT_OSAIRFIGHT_FUNC()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((OsairGoKill == TRUE) && (OsairGetKill == FALSE) && (OsairAttackMe == FALSE))
	{
		if(Wld_IsTime(13,0,23,59) && (OsairGotoHramDay == (daynow - 1)))
		{
			Npc_ExchangeRoutine(Ass_127_Osair,"Start");
			Npc_ExchangeRoutine(Ass_133_Adept,"Start");			
			Npc_ExchangeRoutine(Ass_134_Adept,"Start");	
			OsairGetKill = TRUE;	
		}
		else if(OsairGotoHramDay < (daynow - 1))
		{
			Npc_ExchangeRoutine(Ass_127_Osair,"Start");
			Npc_ExchangeRoutine(Ass_133_Adept,"Start");			
			Npc_ExchangeRoutine(Ass_134_Adept,"Start");	
			OsairGetKill = TRUE;	
		};
	};
};

func void EVT_HIDEMEET_FUNC()
{
	var C_Npc Haniar_Demon;

	if((HideMeetCamera == FALSE) && (RespPWMeet == TRUE))
	{
		Haniar_Demon = Hlp_GetNpc(Ass_126_Haniar);

		Wld_SendTrigger("EVT_CAM_HIDEMEET");
		Haniar_Demon.flags = NPC_FLAG_IMMORTAL;
		Haniar_Demon.aivar[AIV_EnemyOverride] = TRUE;
		Haniar_Demon.aivar[AIV_IgnoresArmor] = TRUE;
		Haniar_Demon.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(Haniar_Demon,4);
		AI_PlayAni(Haniar_Demon,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",Haniar_Demon,Haniar_Demon,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",Haniar_Demon,Haniar_Demon,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",Haniar_Demon,Haniar_Demon,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",Haniar_Demon,Haniar_Demon,0,0,0,FALSE);
		AI_Wait(Haniar_Demon,5);
		Wld_InsertNpc(Haniar_Demon_01,"PW_HANIARDEMON_01");
		Wld_InsertNpc(Haniar_Demon_02,"PW_HANIARDEMON_02");
		Wld_InsertNpc(Haniar_Demon_03,"PW_HANIARDEMON_03");
		AI_PlayAni(Haniar_Demon,"T_HEASHOOT_2_STAND");
		HaniarDemonRitualEnd = TRUE;
		HideMeetCamera = TRUE;
	};
};

func void EVT_PASSMEET_FUNC()
{
	if((KnowPlaceMeeting == TRUE) && (PlayerIsPrioratFake == FALSE))
	{
		PlayerIsPrioratFake = TRUE;
	};
};

var int ResetHaniar;

func void EVT_PW_RESETHANIAR_FUNC()
{
	if((ResetHaniar == FALSE) && (DemonTrap_Blocked == TRUE))
	{
		Wld_SetTime(18,30);
		ResetHaniar = TRUE;
	};
};

func void RiseUndeadGuardian()
{
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_PIRATECAMP_INSEL_01");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_31");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_MINE1_02_999");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_SWAMP_HOHLWEG_02");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_TELEPORT_PATH_03");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_TELEPORT_PATH_04");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_MINE1_01");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_MINE2_04");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_40");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_03");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_55");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_06E");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_17");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_ORCS_09");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_37");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_MINE2_09");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_MINE2_06");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_26");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_24");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_66");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_BANDITS_22");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_ORCS_08");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(Stoneguardian_Undead,"ADW_CANYON_ORCS_01A");
};

FUNC VOID EVT_ADANOSPORATLOPEN_S1()
{
	if(AdanosPortalOpen == FALSE)
	{
		Snd_Play("MFX_THUNDERSTORM_THUNDER");
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_PortalRuneAdanos,1);
		Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_RINGRITUAL2",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_SendTrigger("EVT_ADANOSVALLEY_ENTRANCE");
		Wld_SendTrigger("EVT_ADANOSPALANTIR");
		Npc_RemoveInvItems(hero,ItMi_PortalRuneAdanos,1);
		AdanosPortalOpen = TRUE;
		RiseUndeadGuardian();
		Wld_SendTrigger("EVT_CAMERA_ADANOSPLATOWAY");
	};
};

var int InsMod_01;
var int InsMod_02;
var int InsMod_03;
var int InsMod_04;

FUNC VOID EVT_OPENSMALLPYROMID_01_S1()
{
	if((Npc_HasItems(hero,ItMi_XoD_01) >= 1) && (InsMod_01 == FALSE))
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_XoD_01,1);
		InsMod_01 = TRUE;

		if((InsMod_01 == TRUE) && (InsMod_02 == TRUE) && (InsMod_03 == TRUE) && (InsMod_04 == TRUE))
		{
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_ROAM_AV_SCIPGUARD_20");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_01");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_444");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_442");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_441");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_440");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_439");
			Wld_InsertNpc(Skeleton_Mage_AV,"TALL_DES_TODES_438");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_434");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_449");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_37");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_448");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_448");
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RINGRITUAL2",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_SendTrigger("EVT_SMALLPYRAMIDDOOR");
			Wld_SendTrigger("EVT_CAMOPENSMALLPYROMIDDOOR");
		};
	};
};

FUNC VOID EVT_OPENSMALLPYROMID_02_S1()
{
	if((Npc_HasItems(hero,ItMi_YoD_02) >= 1) && (InsMod_02 == FALSE))
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_YoD_02,1);
		InsMod_02 = TRUE;

		if((InsMod_01 == TRUE) && (InsMod_02 == TRUE) && (InsMod_03 == TRUE) && (InsMod_04 == TRUE))
		{
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_ROAM_AV_SCIPGUARD_20");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_01");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_444");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_442");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_441");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_440");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_439");
			Wld_InsertNpc(Skeleton_Mage_AV,"TALL_DES_TODES_438");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_434");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_449");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_37");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_448");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_448");
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RINGRITUAL2",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_SendTrigger("EVT_SMALLPYRAMIDDOOR");
			Wld_SendTrigger("EVT_CAMOPENSMALLPYROMIDDOOR");
		};
	};
};

FUNC VOID EVT_OPENSMALLPYROMID_03_S1()
{
	if((Npc_HasItems(hero,ItMi_ZoD_03) >= 1) && (InsMod_03 == FALSE))
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_ZoD_03,1);
		InsMod_03 = TRUE;

		if((InsMod_01 == TRUE) && (InsMod_02 == TRUE) && (InsMod_03 == TRUE) && (InsMod_04 == TRUE))
		{
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_ROAM_AV_SCIPGUARD_20");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_01");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_444");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_442");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_441");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_440");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_439");
			Wld_InsertNpc(Skeleton_Mage_AV,"TALL_DES_TODES_438");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_434");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_449");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_37");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_448");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_448");
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RINGRITUAL2",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_SendTrigger("EVT_SMALLPYRAMIDDOOR");
			Wld_SendTrigger("EVT_CAMOPENSMALLPYROMIDDOOR");
		};
	};
};

FUNC VOID EVT_OPENSMALLPYROMID_04_S1()
{
	if((Npc_HasItems(hero,ItMi_UoD_04) >= 1) && (InsMod_04 == FALSE))
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_UoD_04,1);
		InsMod_04 = TRUE;

		if((InsMod_01 == TRUE) && (InsMod_02 == TRUE) && (InsMod_03 == TRUE) && (InsMod_04 == TRUE))
		{
			Wld_InsertNpc(Skeleton_Mage_AV,"FP_ROAM_AV_SCIPGUARD_20");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_02");
			Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_AV_SCIPGUARD_01");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_444");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_442");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_441");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_440");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_439");
			Wld_InsertNpc(Skeleton_Mage_AV,"TALL_DES_TODES_438");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_434");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_449");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_37");
			Wld_InsertNpc(Mummy,"TALL_DES_TODES_448");
			Wld_InsertNpc(SKELETON_WARRIOR_AV,"TALL_DES_TODES_448");
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_RINGRITUAL2",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_SendTrigger("EVT_SMALLPYRAMIDDOOR");
			Wld_SendTrigger("EVT_CAMOPENSMALLPYROMIDDOOR");
		};
	};
};

func void EVT_CRYSTAL_DAM()
{
};

FUNC VOID EVT_AWAKEANCIENTHRAM_01_S1()
{
};

FUNC VOID EVT_KOLONA_DEEP_FUNC_S1()
{
	Snd_Play("Ravens_Earthquake4");
	Wld_SendTrigger("EVT_KOLONA_DEEP");
	Wld_SendTrigger("EVT_KOLONA_2");
};


func int EVT_CANACCESSALTAR_01()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTAR01IsAwake == FALSE) && (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSALTAR_02()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTAR02IsAwake == FALSE) && (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSALTAR_03()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTAR03IsAwake == FALSE) && (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSALTAR_04()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTAR04IsAwake == FALSE) && (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSALTAR_05()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTAR05IsAwake == FALSE) && (Npc_HasItems(hero,ItMi_MagicCrystal) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};


func int EVT_CANACCESSCHAN_01()
{
	if((TaskHram_01 == TRUE) && (HolyChan_01 == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSCHAN_02()
{
	if((TaskHram_01 == TRUE) && (HolyChan_02 == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSCHAN_03()
{
	if((TaskHram_01 == TRUE) && (HolyChan_03 == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSCHAN_04()
{
	if((TaskHram_01 == TRUE) && (HolyChan_04 == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSDRAGON()
{
	if((TaskHram_02 == TRUE) && (DragEggPray == FALSE) && (Npc_HasItems(hero,ItAt_DragonEgg_MIS) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSPASSTEXT()
{
	if(GetPasswordText == FALSE)
	{
		return TRUE;
	};

	return FALSE;
};

func int EVT_CANACCESSTREE()
{
	if((LastAdanosTask == TRUE) && (TreeIsUp == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

FUNC VOID EVT_AVSTART_FUNC()
{
	if((MIS_AdanosCrone == LOG_Running) && (AV_ENTER == FALSE))
	{
		B_LogEntry(TOPIC_AdanosCrone,"Prošel jsem magickým portálem a ocitl jsem se na místě, které Ash'Tar nazval velkou starověkou plošinou! Hmm... Myslím si, že tak trochu celé své vyprávění prikrášlil, kdy o místě mluvíl jako zelenajícím se ráji na zemi, avšak zatím jsem viděl jen sluncem vypálenou poušt a spoustu odporných tvorů, připravených mě zabít při první příležitosti. Doufám, že další pokračování na mé cestě bude více přívětivé.");
		AV_ENTER = TRUE;
	};
};

func void EVT_TELEPORT_RESTART_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_Teleport(hero,"AV_RESTART");
};

func void EVT_TELEPORT_UPHRAM_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_Teleport(hero,"AV_UPPYRAMIDE");
};

func void EVT_TELEPORT_UPHRAM_DOWN_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_Teleport(hero,"AV_PYRAMIDE_IN");
};

FUNC VOID EVT_KOLONA_DEEPCARACUST_FUNC_S1()
{
	var C_Npc MineKing;

	Wld_SendTrigger("EVT_CARACUSTDEATH");
	Wld_SendTrigger("EVT_CARACUSTDEATH_DONE");
	Snd_Play("Ravens_Earthquake4");

	MineKing = Hlp_GetNpc(Caracust);

	if(Npc_GetDistToWP(MineKing,"DAMAGE_KOLONA") <= 1000)
	{
		B_GivePlayerXP(2000);
		Npc_ChangeAttribute(MineKing,ATR_HITPOINTS,-50000);
		KillCaracust = TRUE;
	};
};

func int EVT_CANACCESSTELEPORT_UP()
{
	if((DragEggPray == TRUE) && (HolyChanDone == TRUE) && (ANCIENTALTARSIsAwake == TRUE) && (MagolemusIsDead == TRUE) && (LastAdanosTaskDone == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void EVT_TEARS_DEATH_01_S1()
{
	Wld_InsertNpc(Stoneguardian_Undead_NoExp,"FP_ROAM_GUARD_01");
	Wld_InsertNpc(Stoneguardian_Undead_NoExp,"FP_ROAM_GUARD_02");
	Wld_InsertNpc(Stoneguardian_Undead_NoExp,"FP_ROAM_GUARD_03");
};

func void EVT_TEARS_DEATH_02_S1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	B_Say(self,self,"$Dead");
	Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_StopFX(self,"VOB_MAGICBURN");
};

func void EVT_TEARS_DEATH_03_S1()
{
	B_Say(self,self,"$Dead");
	Wld_SendTrigger("TT_DEATHTGORN");
	Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
};

func void EVT_TEARS_DEATH_04_S1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	B_Say(self,self,"$Dead");
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
};

func void EVT_ACTIVATE_DEATHMATCH_ROOM_02_FUNC()
{
	if(DeathMatch_Room_02 == FALSE)
	{
		Wld_SendTrigger("TT_MAINGATE_ROOM_2");
		Wld_SendTrigger("TT_MAINGATE_ROOM_1");
		Wld_InsertNpc(Stoneguardian_Undead_TT,"FP_ROAM_GUARD_ROOM_02");
		DeathMatch_Room_02 = TRUE;
	};
};

func void EVT_TEARS_WAY_01_S1()
{
	if((TT_Way_01 == FALSE) && (TT_Way_02 == FALSE))
	{
		Wld_SendTrigger("TT_MAINGATE_WAY_01");
		TT_Way_01 = TRUE;
		Wld_InsertNpc(Skeleton_War_TT,"TT_WAY_01");
	};
};

func void EVT_TEARS_WAY_02_S1()
{
	if((TT_Way_01 == FALSE) && (TT_Way_02 == FALSE))
	{
		Wld_SendTrigger("TT_MAINGATE_WAY_02");
		TT_Way_02 = TRUE;
		Wld_InsertNpc(Skeleton_Mage_TT,"TT_WAY_02");
	};
};

func void EVT_ACTIVATE_DEATH_WAY_01_FUNC()
{
	if((TT_Way_02 == FALSE) && (TT_Way_01 == FALSE))
	{
		ADANOSRAGE = TRUE;
		AI_Print(PRINT_ADANOSRAGE);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		AI_Wait(hero,9999);
	};
	if((TT_Way_02 == TRUE) && (TT_Way_01 == FALSE))
	{
		ADANOSRAGE = TRUE;
		AI_Print(PRINT_ADANOSRAGE);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		AI_Wait(hero,9999);
	};
};

func void EVT_ACTIVATE_DEATH_WAY_02_FUNC()
{
	if((TT_Way_01 == FALSE) && (TT_Way_02 == FALSE))
	{
		ADANOSRAGE = TRUE;
		AI_Print(PRINT_ADANOSRAGE);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		AI_Wait(hero,9999);
	};
	if((TT_Way_01 == TRUE) && (TT_Way_02 == FALSE))
	{
		ADANOSRAGE = TRUE;
		AI_Print(PRINT_ADANOSRAGE);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		AI_Wait(hero,9999);
	};
};

func int CANACCESS_WAY_01()
{
	if((Npc_IsDead(Skeleton_War_TT) == TRUE) && (TT_WayClear == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func int CANACCESS_WAY_02()
{
	if((Npc_IsDead(Skeleton_Mage_TT) == TRUE) && (TT_WayClear == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void EVT_ACTIVATE_ANTIHERO_FUNC()
{
	if(AntiHeroIsUp == FALSE)
	{
		Wld_InsertNpc(Anti_Hero,"TT_WAY_HERO");
		AntiHeroIsUp = TRUE;
	};
};

func void EVT_ACTIVATE_DEATH_ROOM_02_FUNC()
{
	var C_Npc TT_HramGuard;

	TT_HramGuard = Hlp_GetNpc(Stoneguardian_Undead_TT);

	if((Npc_GetDistToWP(TT_HramGuard,"TT_SAFE") <= 2000) && (Npc_GetDistToWP(hero,"TT_SAFE") <= 1000))
	{
		Npc_ChangeAttribute(TT_HramGuard,ATR_HITPOINTS,-50000);
	};
};

func void EVT_PYRA_OPENLASTDOOR_FUNC()
{
	if((AdanosQuestPass == TRUE) && (AdanosQuestPassDone == FALSE))
	{
		Wld_SendTrigger("EVT_PYRAMIDE_SECRETPLACE");
		B_LogEntry(TOPIC_AdanosCrone,"Otevřel jsem skrytý průchod v podlaze pyramidy. Zajímalo by mě, co tam starý lid ukryl?");
		AdanosQuestPassDone = TRUE;
	};
};

func void EVT_ORCMINE_FIGHT_FUNC()
{
	if((OrcMineFightReady == TRUE) && (OrcMineFightBegin == FALSE))
	{
		OrcMineFightBegin = TRUE;

		if(ORCMINEKILL_01 == FALSE)
		{
			Npc_ExchangeRoutine(STRF_2153_Fighter,"FollowHero");
			Npc_ExchangeRoutine(STRF_2154_Fighter,"FollowHero");
			Npc_ExchangeRoutine(STRF_2155_Fighter,"FollowHero");
			Npc_ExchangeRoutine(STRF_2156_Fighter,"FollowHero");
			Npc_ExchangeRoutine(STRF_2157_Fighter,"FollowHero");
		};
		if((MIS_UrTakWannaFight == LOG_Success) && (UrTakIsDead == FALSE))
		{
			if(ORCMINEKILL_01 == FALSE)
			{
				B_StartOtherRoutine(STRF_8152_UrTak,"FollowHero");
			}
			else
			{
				B_StartOtherRoutine(STRF_8152_UrTak,"NearFight");
			};
		}
		else if((MIS_UrTakWannaFight == LOG_Running) && (UrTakIsDead == FALSE))
		{
			MIS_UrTakWannaFight = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_UrTakWannaFight);
		};
	};
};

var int KvarhodronArmyUp;

func void EVT_AV_QVARHODRON_UP_FUNC()
{
	if(Wld_IsTime(23,0,3,0) && (MIS_CurseAncient == LOG_Success) && (KvarhodronArmyUp == FALSE))
	{
		Wld_SendTrigger("EVT_KVARHADRON_PLACEFIRE");
		Wld_InsertNpc(NONE_ADDON_1158_Quarhodron,"AV_UNDEADTHRONE");
		Wld_InsertNpc(Ancient_Warrior_Q1,"FP_ROAM_SANDGOLEM_017");
		Wld_InsertNpc(Ancient_Warrior_Q2,"FP_STAND_KVARHADRON_ARMY_02");
		Wld_InsertNpc(Ancient_Warrior_Q3,"FP_STAND_KVARHADRON_ARMY_08");
		Wld_InsertNpc(Ancient_Warrior_Q4,"FP_STAND_KVARHADRON_ARMY_14");
		Wld_InsertNpc(Ancient_Warrior_Q5,"FP_STAND_KVARHADRON_ARMY_20");
		Wld_InsertNpc(Ancient_Warrior_Q6,"FP_STAND_KVARHADRON_ARMY_26");
		Wld_InsertNpc(Ancient_Warrior_Q7,"FP_STAND_KVARHADRON_ARMY_32");
		Wld_InsertNpc(Ancient_Warrior_Q8,"FP_STAND_KVARHADRON_ARMY_38");
		Wld_InsertNpc(Ancient_Warrior_Q9,"FP_STAND_KVARHADRON_ARMY_44");
		Wld_InsertNpc(Ancient_Warrior_QT1,"FP_ROAM_SANDGOLEM_018");
		Wld_InsertNpc(Ancient_Warrior_QT2,"FP_STAND_KVARHADRON_ARMY_05");
		Wld_InsertNpc(Ancient_Warrior_QT3,"FP_STAND_KVARHADRON_ARMY_11");
		Wld_InsertNpc(Ancient_Warrior_QT4,"FP_STAND_KVARHADRON_ARMY_17");
		Wld_InsertNpc(Ancient_Warrior_QT5,"FP_STAND_KVARHADRON_ARMY_23");
		Wld_InsertNpc(Ancient_Warrior_QT6,"FP_STAND_KVARHADRON_ARMY_29");
		Wld_InsertNpc(Ancient_Warrior_QT7,"FP_STAND_KVARHADRON_ARMY_35");
		Wld_InsertNpc(Ancient_Warrior_QT8,"FP_STAND_KVARHADRON_ARMY_41");
		Wld_InsertNpc(Ancient_Warrior_QT9,"FP_STAND_KVARHADRON_ARMY_47");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q1,"FP_STAND_KVARHADRON_ARMY_01");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q2,"FP_STAND_KVARHADRON_ARMY_07");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q3,"FP_STAND_KVARHADRON_ARMY_13");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q4,"FP_STAND_KVARHADRON_ARMY_19");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q5,"FP_STAND_KVARHADRON_ARMY_25");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q6,"FP_STAND_KVARHADRON_ARMY_31");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q7,"FP_STAND_KVARHADRON_ARMY_37");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE_Q8,"FP_STAND_KVARHADRON_ARMY_43");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q1,"FP_STAND_KVARHADRON_ARMY_04");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q2,"FP_STAND_KVARHADRON_ARMY_10");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q3,"FP_STAND_KVARHADRON_ARMY_16");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q4,"FP_STAND_KVARHADRON_ARMY_22");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q5,"FP_STAND_KVARHADRON_ARMY_28");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q6,"FP_STAND_KVARHADRON_ARMY_34");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q7,"FP_STAND_KVARHADRON_ARMY_40");
		Wld_InsertNpc(SKELETON_WARRIOR_AV_Q8,"FP_STAND_KVARHADRON_ARMY_46");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q1,"FP_STAND_KVARHADRON_ARMY_24");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q2,"FP_STAND_KVARHADRON_ARMY_18");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q3,"FP_STAND_KVARHADRON_ARMY_12");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q4,"FP_STAND_KVARHADRON_ARMY_06");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q5,"FP_STAND_KVARHADRON_ARMY_36");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q6,"FP_STAND_KVARHADRON_ARMY_30");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q7,"FP_STAND_KVARHADRON_ARMY_42");
		Wld_InsertNpc(Skeleton_Mage_AV_Elite_Q8,"FP_STAND_KVARHADRON_ARMY_48");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q1,"FP_STAND_KVARHADRON_ARMY_03");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q2,"FP_STAND_KVARHADRON_ARMY_09");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q3,"FP_STAND_KVARHADRON_ARMY_15");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q4,"FP_STAND_KVARHADRON_ARMY_21");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q5,"FP_STAND_KVARHADRON_ARMY_27");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q6,"FP_STAND_KVARHADRON_ARMY_33");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q7,"FP_STAND_KVARHADRON_ARMY_39");
		Wld_InsertNpc(Skeleton_Shadow_Priest_Q8,"FP_STAND_KVARHADRON_ARMY_45");
		KvarhodronArmyUp = TRUE;
	};
};

func void EVT_AV_HOT_DOWN_FUNC()
{
};

//------------teloporty--------------------------

func int EVT_TP_XARDAS_COND()
{
	if((XARDAS_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_XARDAS_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(XARDAS_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		XARDAS_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_TOWN_COND()
{
	if((TOWN_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_TOWN_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(TOWN_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		TOWN_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_TAVERNE_COND()
{
	if((TAVERNE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_TAVERNE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(TAVERNE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		TAVERNE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PSI_COND()
{
	if((PSI_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PSI_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PSI_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PSI_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PASSOW_COND()
{
	if((PASSOW_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PASSOW_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PASSOW_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PASSOW_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_BIGFARM_COND()
{
	if((BIGFARM_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_BIGFARM_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(BIGFARM_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		BIGFARM_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_KLOSTER_COND()
{
	if((KLOSTER_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_KLOSTER_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(KLOSTER_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		KLOSTER_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_SAGITTA_COND()
{
	if((SAGITTA_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_SAGITTA_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(SAGITTA_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		SAGITTA_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_HUNT_COND()
{
	if((HUNT_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_HUNT_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(HUNT_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		HUNT_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_VINOCAVE_COND()
{
	if((VINOCAVE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_VINOCAVE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(VINOCAVE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		VINOCAVE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_SUNCIRCLE_COND()
{
	if((SUNCIRCLE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_SUNCIRCLE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(SUNCIRCLE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		SUNCIRCLE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_ADWRUINS_COND()
{
	if((ADWRUINS_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_ADWRUINS_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(ADWRUINS_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		ADWRUINS_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_BLACKTROLL_COND()
{
	if((BLACKTROLL_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_BLACKTROLL_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(BLACKTROLL_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		BLACKTROLL_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_CASTLE_COND()
{
	if((CASTLE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_CASTLE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(CASTLE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		CASTLE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_ICE_COND()
{
	if((ICE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_ICE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(ICE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		ICE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_SKLEP_COND()
{
	if((SKLEP_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_SKLEP_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(SKLEP_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		SKLEP_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_DARKTOWER_COND()
{
	if((DARKTOWER_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_DARKTOWER_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(DARKTOWER_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		DARKTOWER_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_OLDFORT_COND()
{
	if((OLDFORT_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_OLDFORT_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(OLDFORT_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		OLDFORT_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_OLDPSI_COND()
{
	if((OLDPSI_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_OLDPSI_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(OLDPSI_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		OLDPSI_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_NETBEK_COND()
{
	if((NETBEK_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_NETBEK_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(NETBEK_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		NETBEK_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PASSNW_COND()
{
	if((PASSNW_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PASSNW_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PASSNW_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PASSNW_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_COMPLEX_COND()
{
	if((COMPLEX_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_COMPLEX_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(COMPLEX_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		COMPLEX_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_LIFECIRCLE_COND()
{
	if((LIFECIRCLE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_LIFECIRCLE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(LIFECIRCLE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		LIFECIRCLE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PASSAV_COND()
{
	if((PASSAV_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PASSAV_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PASSAV_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PASSAV_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PYRAMIDE_COND()
{
	if((PYRAMIDE_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PYRAMIDE_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PYRAMIDE_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PYRAMIDE_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_TEARHRAM_COND()
{
	if((TEARHRAM_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_TEARHRAM_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(TEARHRAM_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		TEARHRAM_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_ORCMOUNTAIN_COND()
{
	if((ORCMOUNTAIN_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_ORCMOUNTAIN_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(ORCMOUNTAIN_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		ORCMOUNTAIN_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_ENTEREGEZART_COND()
{
	if((PashalQuestEgezartStep == TRUE) && (EGEZARTDOOROPEN == FALSE) && (Npc_HasItems(hero,ItAt_UndeadDragonSoulStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_ENTEREGEZART_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	Wld_PlayEffect("spellFX_INCOVATION_RED",her,her,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",her,her,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",her,her,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",her,her,0,0,0,FALSE);
	Npc_RemoveInvItems(her,ItAt_UndeadDragonSoulStone,1);
	EGEZARTDOOROPEN = TRUE;
};

func int EVT_DEMONSKULLUP_COND()
{
	if((summonavabul_once == TRUE) && (Npc_HasItems(hero,ItAt_DemonSkull) >= 1) && (AvabulIsUp == FALSE))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_DEMONSKULLUP_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(AvabulIsUp == FALSE)
	{
		Wld_InsertNpc(VLK_4570_Avabul,"CP_AVABUL_01");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(her,ItAt_DemonSkull,1);
		AvabulIsUp = TRUE;
	};
};

func int BAKECOND()
{
	if(Thekla_Areed == TRUE)
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_PASHAL_CAM_01_FUNC()
{
	if(PASHAL_CAM_01 == FALSE)
	{
		Wld_SendTrigger("VIEW_TO_FIRST_ATTACK");
		PASHAL_CAM_01 = TRUE;
	};
};

func void EVT_PASHAL_CAM_02_FUNC()
{
	if(PASHAL_CAM_02 == FALSE)
	{
		Wld_SendTrigger("SHOW_TROLL");
		PASHAL_CAM_02 = TRUE;
	};
};

func int EVT_SUMMON_ITAR_COND()
{
	if((SUMMON_ITAR == FALSE) && (Npc_HasItems(hero,ItMi_BeliarPowerStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func int EVT_SUMMON_YELA_COND()
{
	if((SUMMON_YELA == FALSE) && (Npc_HasItems(hero,ItMi_BeliarPowerStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_SUMMON_YELA_FUNC_s1()
{
	if((SUMMON_YELA == FALSE) && (Npc_HasItems(hero,ItMi_BeliarPowerStone) >= 1))
	{
		Snd_Play("DEM_AMBIENT");
		Wld_InsertNpc(UndeadWolf,"FP_ROAM_BOSS");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_BeliarPowerStone,1);
		SUMMON_YELA = TRUE;
	}
	else
	{
		//Print(PRINT_NeedItemsMissing);
		AI_PrintClr(PRINT_NeedItemsMissing,177,58,17);
		AI_PlayAni(hero,"T_DONTKNOW");
		B_Say_Overlay(hero,hero,"$MISSINGITEM");
	};
};

func void EVT_SUMMON_ITAR_FUNC_s1()
{
	if((SUMMON_ITAR == FALSE) && (Npc_HasItems(hero,ItMi_BeliarPowerStone) >= 1))
	{
		Snd_Play("DEM_AMBIENT");
		Wld_InsertNpc(Draconian_Elite_Boss,"FP_ROAM_BOSS");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,ItMi_BeliarPowerStone,1);
		SUMMON_ITAR = TRUE;
	}
	else
	{
		AI_PrintClr(PRINT_NeedItemsMissing,177,58,17);
		AI_PlayAni(hero,"T_DONTKNOW");
		B_Say_Overlay(hero,hero,"$MISSINGITEM");
	};
};

func int EVT_SLEEPERHEART_01_COND()
{
	if((SleeperStep_01 == FALSE) && (SleeperHeart_01 == TRUE))
	{
		return TRUE;
	};

	return FALSE;	
};

func void  EVT_SLEEPERHEART_01_FUNC_s1()
{
	if((SleeperHeart_01 == TRUE) && (SleeperStep_01 == FALSE))
	{
		Snd_Play("DEM_AMBIENT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		SleeperBoss.flags = NPC_FLAG_NONE;
		SleeperStep_01 = TRUE;
	};
};

func int EVT_SLEEPERHEART_02_COND()
{
	if((SleeperStep_02 == FALSE) && (SleeperHeart_02 == TRUE))
	{
		return TRUE;
	};

	return FALSE;	
};

func void  EVT_SLEEPERHEART_02_FUNC_s1()
{
	if((SleeperHeart_02 == TRUE) && (SleeperStep_02 == FALSE))
	{
		Snd_Play("DEM_AMBIENT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		SleeperBoss.flags = NPC_FLAG_NONE;
		SleeperStep_02 = TRUE;
	};
};

func int EVT_SLEEPERHEART_03_COND()
{
	if((SleeperStep_03 == FALSE) && (SleeperHeart_03 == TRUE))
	{
		return TRUE;
	};

	return FALSE;	
};

func void  EVT_SLEEPERHEART_03_FUNC_s1()
{
	if((SleeperHeart_03 == TRUE) && (SleeperStep_03 == FALSE))
	{
		Snd_Play("DEM_AMBIENT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		SleeperBoss.flags = NPC_FLAG_NONE;
		SleeperStep_03 = TRUE;
	};
};

func void EVT_BIGFARM_AIM_01_FUNC()
{
	if((AIM01ISDONE == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_AIM_RANGE") >= 1000))
	{
		B_GivePlayerXP(50);
		AIM01ISDONE = TRUE;

		if((AIM01ISDONE == TRUE) && (AIM02ISDONE == TRUE) && (AIM03ISDONE == TRUE) && (AIMALLISDONE == FALSE))
		{
			AIMALLISDONE = TRUE;

			if(MIS_AppleTest == LOG_Running)
			{
				B_LogEntry(TOPIC_AppleTest,"Zasáhl jsem všechny tři cíle na střelnici.");
			};
		};
	};
};

func void EVT_BIGFARM_AIM_02_FUNC()
{
	if((AIM02ISDONE == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_AIM_RANGE") >= 1000))
	{
		B_GivePlayerXP(50);
		AIM02ISDONE = TRUE;

		if((AIM01ISDONE == TRUE) && (AIM02ISDONE == TRUE) && (AIM03ISDONE == TRUE) && (AIMALLISDONE == FALSE))
		{
			AIMALLISDONE = TRUE;

			if(MIS_AppleTest == LOG_Running)
			{
				B_LogEntry(TOPIC_AppleTest,"Zasáhl jsem všechny tři cíle na střelnici.");
			};
		};
	};
};

func void EVT_BIGFARM_AIM_03_FUNC()
{
	if((AIM03ISDONE == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_AIM_RANGE") >= 1000))
	{
		B_GivePlayerXP(50);
		AIM03ISDONE = TRUE;

		if((AIM01ISDONE == TRUE) && (AIM02ISDONE == TRUE) && (AIM03ISDONE == TRUE) && (AIMALLISDONE == FALSE))
		{
			AIMALLISDONE = TRUE;

			if(MIS_AppleTest == LOG_Running)
			{
				B_LogEntry(TOPIC_AppleTest,"Zasáhl jsem všechny tři cíle na střelnici.");
			};
		};
	};
};

func void EVT_LOALOVESC_FUNC()
{
	if((CanSayLoaStay == TRUE) && (LoaLoveScene == FALSE) && (LoaLoveSceneFailed == FALSE))
	{
		if((Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
		{
			LoaLoveScene = TRUE;
			PlayVideo("RET2_LoveSceneLoa.BIK");
			AI_Teleport(SLD_10920_Loa,"NW_LIGHTHOUSE_IN_LOA_LOVE_01");
			AI_Teleport(hero,"NW_LIGHTHOUSE_IN_LOA_LOVE_02");
			B_StartOtherRoutine(SLD_10920_Loa,"Start");
		}
		else
		{
			B_StartOtherRoutine(SLD_10920_Loa,"Start");
			LoaLoveSceneFailed = TRUE;
		};
	};
};

var int EVT_TREEFALING_01;
var int EVT_TREEFALING_02;
var int EVT_TREEFALING_03;
var int EVT_TREEFALING_04;
var int EVT_TREEFALING_05;
var int EVT_TREEFALING_06;
var int EVT_TREEFALING_07;
var int EVT_TREEFALING_08;
var int EVT_TREEFALING_09;
var int EVT_TREEFALING_10;
var int EVT_TREEFALING_11;
var int EVT_TREEFALING_12;
var int EVT_TREEFALING_13;
var int EVT_TREEFALING_14;
var int EVT_TREEFALING_15;
var int EVT_TREEFALING_16;
var int EVT_TREEFALING_17;
var int EVT_TREEFALING_18;
var int EVT_TREEFALING_19;
var int EVT_TREEFALING_20;
var int EVT_TREEFALING_21;
var int EVT_TREEFALING_22;
var int EVT_TREEFALING_23;
var int EVT_TREEFALING_24;
var int EVT_TREEFALING_25;
var int EVT_TREEFALING_26;
var int EVT_TREEFALING_27;
var int EVT_TREEFALING_28;
var int EVT_TREEFALING_29;
var int EVT_TREEFALING_30;
var int EVT_TREEFALING_31;
var int EVT_TREEFALING_32;
var int EVT_TREEFALING_33;
var int EVT_TREEFALING_34;
var int EVT_TREEFALING_35;
var int EVT_TREEFALING_36;
var int EVT_TREEFALING_37;
var int EVT_TREEFALING_38;
var int EVT_TREEFALING_39;
var int EVT_TREEFALING_40;
var int EVT_TREEFALING_41;
var int EVT_TREEFALING_42;
var int EVT_TREEFALING_43;
var int EVT_TREEFALING_44;
var int EVT_TREEFALING_45;
var int EVT_TREEFALING_46;
var int EVT_TREEFALING_47;
var int EVT_TREEFALING_48;
var int EVT_TREEFALING_49;
var int EVT_TREEFALING_50;
var int EVT_TREEFALING_51;
var int EVT_TREEFALING_52;
var int EVT_TREEFALING_53;
var int EVT_TREEFALING_54;
var int EVT_TREEFALING_55;
var int EVT_TREEFALING_56;
var int EVT_TREEFALING_57;
var int EVT_TREEFALING_58;
var int EVT_TREEFALING_59;
var int EVT_TREEFALING_60;


func int EVT_TREEFALING_01_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_02_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_03_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_04_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_05_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_06_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_07_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_08_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_09_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_10_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_11_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_12_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_13_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_14_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_15_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_16_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_17_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_18_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_19_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_20_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_21_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_22_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_23_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_24_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_25_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_26_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_27_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_28_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_29_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_30_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_31_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_32_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_33_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_34_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_35_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_36_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_37_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_38_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_39_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_40_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_41_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_42_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_43_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_44_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_45_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_46_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_47_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_48_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_49_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_50_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_51_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_52_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_53_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_54_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_55_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_56_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_57_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_58_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_59_COND()
{
	return TRUE;
};

func int EVT_TREEFALING_60_COND()
{
	return TRUE;
};

func void EVT_TREEFALING_01_FUNC_s1()
{
	if(EVT_TREEFALING_01 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_01 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_02_FUNC_s1()
{
	if(EVT_TREEFALING_02 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_02 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_03_FUNC_s1()
{
	if(EVT_TREEFALING_03 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_03 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_04_FUNC_s1()
{
	if(EVT_TREEFALING_04 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_04 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_05_FUNC_s1()
{
	if(EVT_TREEFALING_05 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_05 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_06_FUNC_s1()
{
	if(EVT_TREEFALING_06 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_06 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_07_FUNC_s1()
{
	if(EVT_TREEFALING_07 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_07 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_08_FUNC_s1()
{
	if(EVT_TREEFALING_08 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_08 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_09_FUNC_s1()
{
	if(EVT_TREEFALING_09 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_09 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_10_FUNC_s1()
{
	if(EVT_TREEFALING_10 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_10 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};
func void EVT_TREEFALING_11_FUNC_s1()
{
	if(EVT_TREEFALING_11 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_11 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_12_FUNC_s1()
{
	if(EVT_TREEFALING_12 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_12 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_13_FUNC_s1()
{
	if(EVT_TREEFALING_13 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_13 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_14_FUNC_s1()
{
	if(EVT_TREEFALING_14 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_14 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_15_FUNC_s1()
{
	if(EVT_TREEFALING_15 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_15 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_16_FUNC_s1()
{
	if(EVT_TREEFALING_16 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_16 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_17_FUNC_s1()
{
	if(EVT_TREEFALING_17 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_17 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_18_FUNC_s1()
{
	if(EVT_TREEFALING_18 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_18 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_19_FUNC_s1()
{
	if(EVT_TREEFALING_19 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_19 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_20_FUNC_s1()
{
	if(EVT_TREEFALING_20 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_20 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};
func void EVT_TREEFALING_21_FUNC_s1()
{
	if(EVT_TREEFALING_21 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_21 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_22_FUNC_s1()
{
	if(EVT_TREEFALING_22 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_22 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_23_FUNC_s1()
{
	if(EVT_TREEFALING_23 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_23 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_24_FUNC_s1()
{
	if(EVT_TREEFALING_24 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_24 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_25_FUNC_s1()
{
	if(EVT_TREEFALING_25 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_25 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_26_FUNC_s1()
{
	if(EVT_TREEFALING_26 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_26 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_27_FUNC_s1()
{
	if(EVT_TREEFALING_27 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_27 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_28_FUNC_s1()
{
	if(EVT_TREEFALING_28 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_28 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_29_FUNC_s1()
{
	if(EVT_TREEFALING_29 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_29 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_30_FUNC_s1()
{
	if(EVT_TREEFALING_30 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_30 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};
func void EVT_TREEFALING_31_FUNC_s1()
{
	if(EVT_TREEFALING_31 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_31 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_32_FUNC_s1()
{
	if(EVT_TREEFALING_32 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_32 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_33_FUNC_s1()
{
	if(EVT_TREEFALING_33 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_33 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_34_FUNC_s1()
{
	if(EVT_TREEFALING_34 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_34 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_35_FUNC_s1()
{
	if(EVT_TREEFALING_35 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_35 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_36_FUNC_s1()
{
	if(EVT_TREEFALING_36 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_36 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_37_FUNC_s1()
{
	if(EVT_TREEFALING_37 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_37 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_38_FUNC_s1()
{
	if(EVT_TREEFALING_38 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_38 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_39_FUNC_s1()
{
	if(EVT_TREEFALING_39 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_39 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_40_FUNC_s1()
{
	if(EVT_TREEFALING_40 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_40 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};
func void EVT_TREEFALING_41_FUNC_s1()
{
	if(EVT_TREEFALING_41 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_41 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_42_FUNC_s1()
{
	if(EVT_TREEFALING_42 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_42 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_43_FUNC_s1()
{
	if(EVT_TREEFALING_43 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_43 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_44_FUNC_s1()
{
	if(EVT_TREEFALING_44 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_44 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_45_FUNC_s1()
{
	if(EVT_TREEFALING_45 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_45 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_46_FUNC_s1()
{
	if(EVT_TREEFALING_46 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_46 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_47_FUNC_s1()
{
	if(EVT_TREEFALING_47 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_47 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_48_FUNC_s1()
{
	if(EVT_TREEFALING_48 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_48 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_49_FUNC_s1()
{
	if(EVT_TREEFALING_49 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_49 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_50_FUNC_s1()
{
	if(EVT_TREEFALING_50 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_50 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};
func void EVT_TREEFALING_51_FUNC_s1()
{
	if(EVT_TREEFALING_51 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_51 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_52_FUNC_s1()
{
	if(EVT_TREEFALING_52 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_52 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_53_FUNC_s1()
{
	if(EVT_TREEFALING_53 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_53 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_54_FUNC_s1()
{
	if(EVT_TREEFALING_54 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_JustTree,2);
		AI_Print("Vytěžil si dva kusy dřeva...");
		EVT_TREEFALING_54 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_55_FUNC_s1()
{
	if(EVT_TREEFALING_55 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_55 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_56_FUNC_s1()
{
	if(EVT_TREEFALING_56 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_56 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_57_FUNC_s1()
{
	if(EVT_TREEFALING_57 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_BokTree,2);
		AI_Print("Vytěžil si dva kusy bukového dřeva...");
		EVT_TREEFALING_57 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_58_FUNC_s1()
{
	if(EVT_TREEFALING_58 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_YsuoTree,2);
		AI_Print("Vytěžil si dva kusy jasanového dřeva...");
		EVT_TREEFALING_58 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_59_FUNC_s1()
{
	if(EVT_TREEFALING_59 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_VyzTree,2);
		AI_Print("Vytěžil si dva kusy jilmového dřeva...");
		EVT_TREEFALING_59 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func void EVT_TREEFALING_60_FUNC_s1()
{
	if(EVT_TREEFALING_60 < (Wld_GetDay() - 1))
	{
		CreateInvItems(hero,ItMi_EveTree,2);
		AI_Print("Vytěžil si dva kusy vrbového dřeva...");
		EVT_TREEFALING_60 = Wld_GetDay();
		CreateInvItems(hero,ItMi_Chopper,1);
	}
	else
	{
		AI_PrintClr("Nic tu není...",177,58,17);
		CreateInvItems(hero,ItMi_Chopper,1);
	};
};

func int EVT_TP_ADW_COND()
{
	if((ADW_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_ADW_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(ADW_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		ADW_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

func int EVT_TP_PIRATCAMP_COND()
{
	if((PIRATCAMP_TP == FALSE) && (Npc_HasItems(hero,ItMi_TeleportStone) >= 1))
	{
		return TRUE;
	};

	return FALSE;	
};

func void EVT_TP_PIRATCAMP_FUNC_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(PIRATCAMP_TP == FALSE)
	{
		B_GivePlayerXP(250);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Snd_Play("MFX_SLEEP_CAST");
		PIRATCAMP_TP = TRUE;
		AI_Wait(hero,3);
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
		Npc_RemoveInvItems(her,ItMi_TeleportStone,1);

		if((MIS_OldTeleports == LOG_Running) && (XarSeekDruidArt == TRUE) && (ActivateDruidStone == FALSE))
		{
			B_LogEntry(TOPIC_OldTeleports,"Našel jsem způsob, jak aktivovat runový kámen.");
			ActivateDruidStone = TRUE;
		};

		TP_Count += 1;
	};
};

//----------------------------------epik------------------------------------

var int Active3Boss;
var int Active4Boss;

func int EVT_LV_ACTIVATETHIRDBOSS_COND()
{
	if(ReadyForBoss3 == TRUE)
	{
		return TRUE;
	};
	
	return FALSE;
};

func int EVT_LV_ACTIVATEFORTHBOSS_COND()
{
	if((ReadyForBoss5 == TRUE) && (WaitForHero == TRUE) && ((FiarasHeartInPlace == FALSE) || (FiarasInserted == FALSE)))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LV_ACTIVATEFORTHBOSS_s1()
{
	if((Npc_HasItems(hero,ItMi_FiarasHeart) >= 1) && (WaitForHero == TRUE) && (FiarasIsDead == TRUE) && (FiarasHeartInPlace == FALSE))
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			B_LogEntry(TOPIC_Miss_Brother,"Položil jsem srdce mocného ohnivého golema Fiarase na oltář věčného plamene a tím jsem otevřel průchod v hoře. Musím pokračovat dál... Ile'Sil na mě už jistě čeká.");
			Wld_SendTrigger("EVT_FIREGOLEM");
			Wld_SendTrigger("EVT_FIRECAVEDOOR_TRIGGER");
			Wld_PlayEffect("spellFX_INCOVATION_FIRE",hero,hero,2,0,0,FALSE);
			Npc_RemoveInvItems(hero,ItMi_FiarasHeart,1);
			FiarasHeartInPlace = TRUE;
		};
	}
	else if((FiarasInserted == FALSE) && (FiarasIsDead == FALSE) && (WaitForHero == TRUE))
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			B_LogEntry(TOPIC_Miss_Brother,"Pokusil jsem se použít oltář věčného plamene, nic se ale nestalo. Jen vzadu, někde vysoko, byla slyšet ozvěna hořícího plamene.");
			Wld_InsertNpc(FireGolem_LV,"WDS_LAVA_DEADTREE_01");
			Wld_SendTrigger("EVT_FIRETREE");
			FiarasInserted = TRUE;
		};
	};
};

func int EVT_LV_DAMNDRUID_01_COND()
{
	if((SearchCircle == TRUE) && (RESPDAMNDRUID_01 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LV_DAMNDRUID_01_s1()
{
	if(RESPDAMNDRUID_01 == FALSE)
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			Wld_InsertNpc(Druid_Agony,"WDS_LAVA_STONEGE_07");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_01");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_02");
			RESPDAMNDRUID_01 = TRUE;
		};
	};
};

func int EVT_LV_DAMNDRUID_02_COND()
{
	if((SearchCircle == TRUE) && (RESPDAMNDRUID_02 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LV_DAMNDRUID_02_s1()
{
	if(RESPDAMNDRUID_02 == FALSE)
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			Wld_InsertNpc(Druid_Despair,"WDS_LAVA_STONEGE_05");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_04");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_03");
			RESPDAMNDRUID_02 = TRUE;
		};
	};
};

func int EVT_LV_DAMNDRUID_03_COND()
{
	if((SearchCircle == TRUE) && (RESPDAMNDRUID_03 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LV_DAMNDRUID_03_s1()
{
	if(RESPDAMNDRUID_03 == FALSE)
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			Wld_InsertNpc(Druid_Doom,"WDS_LAVA_STONEGE_06");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_06");
			Wld_InsertNpc(ShadowWolf,"FP_ROAM_LW_SHWOLF_05");
			RESPDAMNDRUID_03 = TRUE;
		};
	};
};

func int EVT_LV_ACTIVATETREEGOLEM_COND()
{
	if((DruidDoomIsDead == TRUE) && (DruidDespairIsDead == TRUE) && (DruidAgonyIsDead == TRUE) && (TreeGolemInserted == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LV_ACTIVATETREEGOLEM_s1()
{
	if((Npc_HasItems(hero,ItMi_Seed_Agony) >= 1) && (Npc_HasItems(hero,ItMi_Seed_Despair) >= 1) && (Npc_HasItems(hero,ItMi_Seed_Doom) >= 1) && (TreeGolemInserted == FALSE))
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			B_LogEntry(TOPIC_Miss_Brother,"Položil jsem semena na oltář uprostřed kamenného kruhu. Náhle vzpláli ohněm a ozvalo se strašlivé praskání dřeva. Zdá se, že na mě čeká zajímavé setkání...");
			Npc_RemoveInvItems(hero,ItMi_Seed_Agony,1);
			Npc_RemoveInvItems(hero,ItMi_Seed_Despair,1);
			Npc_RemoveInvItems(hero,ItMi_Seed_Doom,1);
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_InsertNpc(AncientTreeGolem,"WDS_LAVA_EKRON_01");
			Wld_SendTrigger("EVT_DAMNSEEDS_01");
			TreeGolemInserted = TRUE;
		};
	};
};

func void EVT_LV_ACTIVATETHIRDBOSS_s1()
{
	if(Active3Boss == FALSE)
	{
		if(ReadyForBoss3 == TRUE)
		{
			Wld_InsertNpc(ShadowGuardOne,"LOSTVALLEY_SHADOWGUARD_01");
			Wld_InsertNpc(ShadowGuardTwo,"LOSTVALLEY_SHADOWGUARD_02");
			Wld_PlayEffect("spellFX_Teleport_RING",ShadowGuardOne,ShadowGuardOne,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Teleport_RING",ShadowGuardTwo,ShadowGuardTwo,0,0,0,FALSE);
			Active3Boss = TRUE;
		};
	}
	else if((Active3Boss == TRUE) && (ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE) && (LookAtDemonAltar == FALSE))
	{
		if(MIS_Miss_Brother == LOG_Running)
		{
			B_LogEntry(TOPIC_Miss_Brother,"Tento magický oltář, který byl střežen přízračnými strážci, určitě musel být používán pro něco. Při bližším průzkumu, si není těžké povšimnout, že je na něm vyryto mnoho nápisů v jazycích, kterým nerozumím, a v jeho samém středu je kruhová prohlubeň, kde se nachází rituální nádoba. Myslím, že bych si měl promluvit s Ile'Silem. Možná mi pomůže najít nějaké řešení...");
		};

		LookAtDemonAltar = TRUE;
	};
	if((Npc_HasItems(hero,ItMi_ArahArEye) >= 1) && (LookAtDemonAltar == TRUE) && (ReadyForBoss4 == TRUE) && (Active4Boss == FALSE))
	{
		Wld_SendTrigger("EVT_LICHEYE");
		Npc_RemoveInvItems(hero,ItMi_ArahArEye,1);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
		Wld_InsertNpc(Ghost_SoulKeeper,"LOSTVALLEY_SOULKEEPER_01");
		Active4Boss = TRUE;

		if(MIS_Miss_Brother == LOG_Running)
		{
			B_LogEntry(TOPIC_Miss_Brother,"Vložil jsem tajemné lichovo oko do rituální nádobi v altáři a podle reakce oltáře se zdá, že oběť byla přijata. O kousek dál nalevo, na vyvýšenině, se rozzářilo jasné světlo. Myslím, že bych se na to místo měl jít podívat...");
		};
	};
};

func void EVT_AV_TO_LOSTVALLEY_FUNC()
{
	if(IlesilIsDead == FALSE)
	{
		if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ITMW_BELIARSUPERWEAPON_1H) || Npc_HasItems(hero,ITMW_BELIARSUPERWEAPON_2H) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || Npc_HasItems(hero,itru_beliarsrune01) || Npc_HasItems(hero,itru_beliarsrune02) || Npc_HasItems(hero,itru_beliarsrune03) || Npc_HasItems(hero,itru_beliarsrune04) || Npc_HasItems(hero,itru_beliarsrune05) || Npc_HasItems(hero,itru_beliarsrune06) || Npc_HasItems(hero,ItRu_BeliarSuperRune))
		{
			CheckLVAccess = TRUE;
			AI_ProcessInfos(self);
		};
	};
};

instance PC_CHECKLV_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_CHECKLV_end_condition;
	information = PC_CHECKLV_end_info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_CHECKLV_end_condition()
{
	if(CheckLVAccess == TRUE)
	{
		return TRUE;
	};
};

func void PC_CHECKLV_end_info()
{
	LVStatsCheck[4] = FALSE;
	LVStatsCheck[5] = FALSE;
	LVStatsCheck[6] = FALSE;
	LVStatsCheck[7] = FALSE;
	LVStatsCheck[8] = FALSE;
	CheckLVAccess = FALSE;
	AI_StopProcessInfos(self);
};

instance PC_CHECKLV_ON(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_CHECKLV_ON_condition;
	information = PC_CHECKLV_ON_info;
	permanent = TRUE;
	description = "Vstoupit do portálu...";
};

func int PC_CHECKLV_ON_condition()
{
	if(CheckLVAccess == TRUE)
	{
		return TRUE;
	};
};

func void PC_CHECKLV_ON_info()
{
	if((hero.attribute[ATR_HITPOINTS_MAX] >= 2000) && ((hero.attribute[ATR_STRENGTH] >= 350) || (hero.attribute[ATR_DEXTERITY] >= 350) || (hero.attribute[ATR_MANA_MAX] >= 800)))
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] <= 7500) && (hero.attribute[ATR_STRENGTH] <= 850) && (hero.attribute[ATR_DEXTERITY] <= 850) && (hero.attribute[ATR_MANA_MAX] <= 2500)
		{
			AI_Print("Síla portálu tě začíná přitahovat... Jsi připraven?");
			LVStatsCheck[4] = hero.attribute[ATR_STRENGTH];
			LVStatsCheck[5] = hero.attribute[ATR_DEXTERITY];
			LVStatsCheck[6] = hero.attribute[ATR_MANA_MAX];
			LVStatsCheck[7] = hero.attribute[ATR_HITPOINTS_MAX];
			Info_ClearChoices(PC_CHECKLV_ON);
			Info_AddChoice(PC_CHECKLV_ON,"Ano, vstoupit dovnitř.",PC_CHECKLV_ON_YES);
			Info_AddChoice(PC_CHECKLV_ON,"Ne, zůstat.",PC_CHECKLV_ON_NO);
		}
		else
		{
			AI_Print("Jsi příliš mocný na to, abys vstoupil do portálu!");
		};
	}
	else
	{
		AI_Print("Jsi příliš slabý na to, abys vstoupil do portálu...");
	};
};

func void PC_CHECKLV_ON_YES()
{
	LVStatsCheck[8] = TRUE;
	CheckLVAccess = FALSE;
	AI_StopProcessInfos(self);
};

func void PC_CHECKLV_ON_NO()
{
	LVStatsCheck[4] = FALSE;
	LVStatsCheck[5] = FALSE;
	LVStatsCheck[6] = FALSE;
	LVStatsCheck[7] = FALSE;
	LVStatsCheck[8] = FALSE;
	CheckLVAccess = FALSE;
	AI_StopProcessInfos(self);
};

func void EVT_Dobar_Find_Func()
{
	if((MIS_DobarOut == LOG_Running) && (DobarOnPlace == FALSE))
	{
		B_GivePlayerXP(150);
		B_LogEntry(TOPIC_DobarOut,"Našel jsem Dobara. Je mrtvý.");
		DobarOnPlace = TRUE;
	};
};

func void EVT_Parlaf_Find_Func()
{
	if((MIS_DobarOut == LOG_Running) && (ParlafIsDead == TRUE) && (ParlafOnPlaceDead == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_DobarOut,"Našel jsem Parlafa. Je mrtvý.");
		ParlafOnPlaceDead = TRUE;
	};
};

func void EVT_ENTER_LH_FUNC()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnLH == FALSE))
	{
		B_LogEntry(TOPIC_HauntedLighthouse,"Plavil jsem se na maják, ale na nic neobvyklého jsem tady nenarazil. Možná bych se tady měl ještě kolem porozhlédnout...");
		FindDamnLH = TRUE;
	};
};

func void EVT_FINDOLDSKELETON_LH_FUNC()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindOldSkeleton == FALSE))
	{
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_HauntedLighthouse,"Uvnitř majáku jsem objevil starou lidskou kostru. Je těžké říci, jak tento muž zemřel, ale jeho tělo ztuhlo ve velice nepřirozené poloze. Zajímalo by mě, co se stalo?... Musím se tady ještě porozhlédnout.");
		FindOldSkeleton = TRUE;
		Wld_InsertItem(ItMi_StafanRing,"FP_ITEM_CURSE_01");
	};
};

func int EVT_FINDDAMNSIGH_LH_COND()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_FINDDAMNSIGH_LH_FUNC_s1()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == FALSE))
	{
		B_GivePlayerXP(300);
		B_LogEntry(TOPIC_HauntedLighthouse,"Na jedné ze stěn majáku jsem objevil nějaký podivný a těžce postřehnutelný magický znak. Myslím, že bych měl zapamatovat jak vypadá, a pak se na něj zeptat jednoho z mágů.");
		FindDamnSigh = TRUE;
	};
};

func int EVT_STONE_LV_01_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_01 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_01_FUNC_s1()
{
	if(Stone_LV_01 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"1");
		Stone_LV_01 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_02_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_02 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_02_FUNC_s1()
{
	if(Stone_LV_02 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"2");
		Stone_LV_02 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_03_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_03 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_03_FUNC_s1()
{
	if(Stone_LV_03 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"3");
		Stone_LV_03 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_04_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_04 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_04_FUNC_s1()
{
	if(Stone_LV_04 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"4");
		Stone_LV_04 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_05_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_05 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_05_FUNC_s1()
{
	if(Stone_LV_05 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"5");
		Stone_LV_05 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_06_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_06 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_06_FUNC_s1()
{
	if(Stone_LV_06 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"6");
		Stone_LV_06 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");

				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_07_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_07 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_07_FUNC_s1()
{
	if(Stone_LV_07 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"7");
		Stone_LV_07 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func int EVT_STONE_LV_08_COND()
{
	if((StartLvStory == TRUE) && (SkelBrosFightWin == TRUE) && (Stone_LV_08 == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_STONE_LV_08_FUNC_s1()
{
	if(Stone_LV_08 == FALSE)
	{
		GlobalConcatText = ConcatStrings(GlobalConcatText,"8");
		Stone_LV_08 = TRUE;
		LVCountTurnBlocks += 1;
		Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");

		if(LVCountTurnBlocks >= 8)
		{
			if(Hlp_StrCmp(GlobalConcatText,sSequnceLV) == TRUE)
			{
				Wld_SendTrigger("EVT_OPENHRAM_TRIGGER");	
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,2,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				OpenHramDone = TRUE;
			}
			else
			{
				Stone_LV_01 = FALSE;
				Stone_LV_02 = FALSE;
				Stone_LV_03 = FALSE;
				Stone_LV_04 = FALSE;
				Stone_LV_05 = FALSE;
				Stone_LV_06 = FALSE;
				Stone_LV_07 = FALSE;
				Stone_LV_08 = FALSE;
				Wld_SendTrigger("EVT_SWITCHLIGHT_08_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_07_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_06_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_05_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_04_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_03_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_02_TRIGGER");
				Wld_SendTrigger("EVT_SWITCHLIGHT_01_TRIGGER");
				LVCountTurnBlocks = FALSE;
				GlobalConcatText = "";
				B_Say(hero,hero,"$DONTKNOW");
				AI_Print("Něco je špatně...");
			};
		};
	};
};

func void EVT_LV_FINALDIALOGE_FUNC()
{
	var C_Npc SkLv;

	SkLv = Hlp_GetNpc(Skeleton_Lord_LV);

	if(ReadyForBoss7 == FALSE)
	{
		Wld_SendTrigger("EVT_MAINBOSSFIGHT_TRIGGER");	
		Wld_SendTrigger("EVT_HIDDENPASS_TRIGGER");	
		SkLv.aivar[AIV_EnemyOverride] = FALSE;
		SkLv.noFocus = FALSE;
		SkLv.flags = 0;
		ReadyForBoss7 = TRUE;
	};
};

func void EVT_MAINBOSS_START_FUNC()
{
	if(FinalDialogeLv == FALSE)
	{
		Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
		Npc_ExchangeRoutine(NONE_1813_Ilesil,"TOT");
		AI_Teleport(NONE_1813_Ilesil,"TOT");
		Wld_InsertNpc(Ilesil_Evil,"WDS_LAVA_CASTLE_27");
		FinalDialogeLv = TRUE;
		IlesilCantExit = TRUE;
	};
};

func int EVT_LHFIREISON_COND()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == TRUE) && (StefanCanFight == FALSE) && (LHIsOn == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void EVT_LHFIREISON_FUNC_s1()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == TRUE) && (StefanCanFight == FALSE) && (LHIsOn == FALSE))
	{
		LHIsOn = TRUE;
	};
};

func void EVT_JACKISDEAD_FUNC()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == TRUE) && (LHIsOn == TRUE) && (JackMainIsDead == TRUE))
	{
		MIS_HauntedLighthouse = LOG_Success;
		Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);
		B_LogEntry(TOPIC_HauntedLighthouse,"Zatímco jsem rozsvěcoval maják, Stefanův duch zabil Jacka. Prokletí bylo z majáku sejmuto, ačkoli za poměrně vysokou cenu...");
	};
};

func void EVT_VIEWELZA_FUNC()
{
	if(ViewElza == FALSE)
	{
		B_GivePlayerXP(250);
		B_Say(hero,hero,"$HOWINTEREST");
		ViewElza = TRUE;
	};
};