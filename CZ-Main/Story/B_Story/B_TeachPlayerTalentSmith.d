/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(3x) WEAPON_ITAR_OREARMOR - opraven zápis do deníku

*/




func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (kosten * 75) / TEMPSSBMODE;

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);


		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"K vykování zbraně je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Ten pak kout na kovadlině, dokud nedosáhne požadovaný tvar. U některých zbraní je také zapotřebí použít další materiály, které jim propůjčí jedinečné vlastnosti.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"K překování zbroje je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Bez ní ani nemá smysl jít ke kovadlině.");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Meč vlastní výroby'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování MEČE VLASTNÍ VÝROBY: žádné.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO DLOUHÉHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO OBOURUČNÍHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný meč bastard'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO MEČE BASTARD: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžký rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉHO RUDNÉHO OBOURUČNÍHO MEČE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉ RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Velký rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování VELKÉHO RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO DLOUHÉHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rubínová čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUBÍNOVÉ ČEPELE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Naučeno: Kovářství - 'El Bastardo'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování meče EL BASTARDO: žádné.");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DOMOBRÁNCE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DOMOBRÁNCE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj rytíře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE RYTÍŘE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj paladina'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE PALADINA: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE ŽOLDÁKA: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE ŽOLDÁKA: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE ŽOLDÁKA: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE DRAKOBIJCE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DRAKOBIJCE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DRAKOBIJCE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STÍNA: rozžhavená ocel a zlatý ingot.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kroužková zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování KROUŽKOVÉ ZBROJE STÍNA: 5x rozžhavená ocel.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE STRÁŽE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STRÁŽE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE STRÁŽE: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Bederní rouška Bratrstva'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vyztužení BEDERNÍ ROUŠKY BRATRSTVA: kůže plaza.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE TEMPLÁŘE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE TEMPLÁŘE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE TEMPLÁŘE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj 'Kruhu Vody''");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE 'KRUHU VODY': 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Světla'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE SVĚTLA: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x křemen, akvamarín a adamant.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Temnoty'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE TEMNOTY: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x uhlí, černá perla a adamant.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_SLD(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (kosten * 250) / TEMPSSBMODE;

	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};

	RankPoints = RankPoints + kosten;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"K vykování zbraně je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Ten pak kout na kovadlině, dokud nedosáhne požadovaný tvar. U některých zbraní je také zapotřebí použít další materiály, které jim propůjčí jedinečné vlastnosti.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"K překování zbroje je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Bez ní ani nemá smysl jít ke kovadlině.");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Meč vlastní výroby'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování MEČE VLASTNÍ VÝROBY: žádné.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO DLOUHÉHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO OBOURUČNÍHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný meč bastard'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO MEČE BASTARD: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžký rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉHO RUDNÉHO OBOURUČNÍHO MEČE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉ RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Velký rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování VELKÉHO RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO DLOUHÉHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rubínová čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUBÍNOVÉ ČEPELE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Naučeno: Kovářství - 'El Bastardo'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování meče EL BASTARDO: žádné.");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DOMOBRÁNCE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DOMOBRÁNCE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj rytíře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE RYTÍŘE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj paladina'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE PALADINA: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE ŽOLDÁKA: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE ŽOLDÁKA: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE ŽOLDÁKA: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE DRAKOBIJCE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DRAKOBIJCE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DRAKOBIJCE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STÍNA: rozžhavená ocel a zlatý ingot.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kroužková zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování KROUŽKOVÉ ZBROJE STÍNA: 5x rozžhavená ocel.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE STRÁŽE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STRÁŽE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE STRÁŽE: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Bederní rouška Bratrstva'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vyztužení BEDERNÍ ROUŠKY BRATRSTVA: kůže plaza.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE TEMPLÁŘE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE TEMPLÁŘE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE TEMPLÁŘE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj 'Kruhu Vody''");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE 'KRUHU VODY': 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Světla'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE SVĚTLA: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x křemen, akvamarín a adamant.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Temnoty'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE TEMNOTY: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x uhlí, černá perla a adamant.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_RemakeArmor_NoLP(var C_Npc slf,var C_Npc oth,var int waffe)
{
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"K vykování zbraně je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Ten pak kout na kovadlině, dokud nedosáhne požadovaný tvar. U některých zbraní je také zapotřebí použít další materiály, které jim propůjčí jedinečné vlastnosti.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"K překování zbroje je nejprve třeba doruda rozžhavit prut surové oceli v kovářské výhni. Bez ní ani nemá smysl jít ke kovadlině.");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Meč vlastní výroby'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování MEČE VLASTNÍ VÝROBY: žádné.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO DLOUHÉHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO OBOURUČNÍHO MEČE: ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný meč bastard'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO MEČE BASTARD: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžký rudný obouruční meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉHO RUDNÉHO OBOURUČNÍHO MEČE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká rudná válečná čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TĚŽKÉ RUDNÉ VÁLEČNÉ ČEPELE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Velký rudný zabiják draků'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování VELKÉHO RUDNÉHO ZABIJÁKA DRAKŮ: 4x ingot magické rudy a 5x dračí krev.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kvalitní dlouhý meč'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KVALITNÍHO DLOUHÉHO MEČE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rubínová čepel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RUBÍNOVÉ ČEPELE: žádné.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Naučeno: Kovářství - 'El Bastardo'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování meče EL BASTARDO: žádné.");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DOMOBRÁNCE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj domobránce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DOMOBRÁNCE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj rytíře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE RYTÍŘE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj paladina'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE PALADINA: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE ŽOLDÁKA: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE ŽOLDÁKA: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj žoldáka'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE ŽOLDÁKA: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE DRAKOBIJCE: ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE DRAKOBIJCE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj drakobijce'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE DRAKOBIJCE: 3x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STÍNA: rozžhavená ocel a zlatý ingot.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Kroužková zbroj Stína'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování KROUŽKOVÉ ZBROJE STÍNA: 5x rozžhavená ocel.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE STRÁŽE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE STRÁŽE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj stráže'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE STRÁŽE: 3x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Bederní rouška Bratrstva'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vyztužení BEDERNÍ ROUŠKY BRATRSTVA: kůže plaza.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Lehká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování LEHKÉ ZBROJE TEMPLÁŘE: železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE TEMPLÁŘE: 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Těžká zbroj templáře'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování TĚŽKÉ ZBROJE TEMPLÁŘE: 2x ingot magické rudy.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Zbroj 'Kruhu Vody''");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro překování ZBROJE 'KRUHU VODY': 2x železný ingot.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Světla'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE SVĚTLA: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x křemen, akvamarín a adamant.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná zbroj Temnoty'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Materiály pro vykování RUDNÉ ZBROJE TEMNOTY: 10x rudný ingot, 2x černá ruda, 10x síra, 5x pryskyřice, 5x uhlí, černá perla a adamant.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};
