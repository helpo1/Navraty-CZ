
func int B_TeachPlayerTalentForeignLanguage(var C_Npc slf,var C_Npc oth,var int Language)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_FOREIGNLANGUAGE,Language);

	if(Language == LANGUAGE_4)
	{
		money = kosten * 200;
	}
	else
	{
		money = (kosten * 200) / TEMPSSBMODE;
	};

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_RemoveInvItems(oth,ItMi_Gold,money);
	Log_CreateTopic(TOPIC_Language,LOG_NOTE);

	if(Language == LANGUAGE_1)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		AI_Print("Naučeno: Jazyk rolníků");

		B_LogEntry(TOPIC_Language,LogText_Addon_Language_1);

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(Language == LANGUAGE_2)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		AI_Print("Naučeno: Jazyk válečníků");
		B_LogEntry(TOPIC_Language,LogText_Addon_Language_2);

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(Language == LANGUAGE_3)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		AI_Print("Naučeno: Jazyk kněží");
		B_LogEntry(TOPIC_Language,LogText_Addon_Language_3);

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(Language == LANGUAGE_4)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[3] = TRUE;
		AI_Print("Naučeno: Jazyk démonů");
		B_LogEntry(TOPIC_Language,LOGTEXT_ADDON_LANGUAGE_4);

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};

	Snd_Play("LevelUP");
	return TRUE;
};

