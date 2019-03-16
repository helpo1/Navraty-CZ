
instance DIA_BAALNAMIB_EXIT(C_Info)
{
	npc = gur_8036_namib;
	nr = 999;
	condition = dia_baalnamib_exit_condition;
	information = dia_baalnamib_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalnamib_exit_condition()
{
	return TRUE;
};

func void dia_baalnamib_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_PICKPOCKET(C_Info)
{
	npc = gur_8036_namib;
	nr = 900;
	condition = DIA_BAALNAMIB_PICKPOCKET_Condition;
	information = DIA_BAALNAMIB_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_BAALNAMIB_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_BAALNAMIB_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,Dialog_Back,DIA_BAALNAMIB_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BAALNAMIB_PICKPOCKET_DoIt);
};

func void DIA_BAALNAMIB_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};

func void DIA_BAALNAMIB_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};


instance DIA_BAALNAMIB_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_sleeper_condition;
	information = dia_baalnamib_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Да пребудет с тобой Спящий!";
};


func int dia_baalnamib_notalk_sleeper_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_01_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_NOTALK_IMP(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_imp_condition;
	information = dia_baalnamib_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Все в порядке, приятель?";
};


func int dia_baalnamib_notalk_imp_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_01_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_SLEEPSPELL(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_sleepspell_condition;
	information = dia_baalnamib_sleepspell_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_sleepspell_condition()
{
	var C_Npc sek8022;
	var C_Npc sek8023;
	var C_Npc sek8024;

	sek8022 = Hlp_GetNpc(sek_8022_novize);
	sek8023 = Hlp_GetNpc(sek_8023_novize);
	sek8024 = Hlp_GetNpc(sek_8024_novize);

	if((Npc_IsInState(sek8022,ZS_MagicSleep) || Npc_IsInState(sek8023,ZS_MagicSleep) || Npc_IsInState(sek8024,ZS_MagicSleep)) && (IDOLNAMIB_YES == FALSE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (CANBEGURU == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_sleepspell_info()
{
	B_GivePlayerXP(200);
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_00"); //Не отвлекай меня от размышлений, коим предался я и подопечные мои.
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_01"); //Магия Спящего! Откуда ведомо тебе это искусство?!
	 AI_Output(other,self,"DIA_BaalNamib_SleepSpell_01_02"); //Разве в нем есть что-то сложное?
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_03"); //Да это дар и ничто иное. Я готов помочь тебе развить его.
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_04"); //Стань одним из нас, и тебе откроются новые вершины знания!
	IDOLNAMIB_YES = TRUE;
};


instance DIA_BAALNAMIB_AUFGABE(C_Info)
{
	npc = gur_8036_namib;
	nr = 800;
	condition = dia_baalnamib_aufgabe_condition;
	information = dia_baalnamib_aufgabe_info;
	permanent = FALSE;
	important = FALSE;
	description = "Я хочу стать одним из Гуру.";
};


func int dia_baalnamib_aufgabe_condition()
{
	if((IDOLNAMIB_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalnamib_aufgabe_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Aufgabe_01_00");	//Я хочу стать одним из Гуру.
	AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_01");	//Ты хочешь стать одним из нас?

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_02");	//Дай посмотреть на тебя... мммм...(внимательно разглядывает)
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_03");	//Ты не похож на человека, который слаб духом...
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_04");	//Я ощущаю в тебе великую духовную силу!
		AI_Output(other,self,"DIA_BaalNamib_Aufgabe_01_05");	//Значит ли это, господин, что вы даете свое согласие на мое принятие в Круг Гуру?
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_06");	//Ты все верно понял. Ступай к Идолу Орану.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry(TOPIC_NAMIBWORK,"По мнению Идола Намиба, мой дух достаточно силен. Он дал согласие на мое принятие в Круг Гуру.");
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_07");	//Дай посмотреть на тебя... мммм...(внимательно разглядывает)
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_08");	//Ты еще не готов принять нашу веру. Твой дух еще слишком слаб для этого!
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_09");	//Возвращайся ко мне, когда твоя духовная сила возрастет и окрепнет.
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_10");	//Только тогда мы поговорим о твоем вступлении в Братство.
		Log_CreateTopic(TOPIC_NAMIBWORK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_Running);
		B_LogEntry(TOPIC_NAMIBWORK,"Идол Намиб считает, что я еще не достаточно крепок духом, чтобы быть готовым обрести веру Братства.");
		B_LogEntry(TOPIC_NAMIBWORK,"Он сказал, чтобы я возвращался, когда моя духовная сила возрастет и окрепнет (требуется не менее 60 единиц магической энергии).");
		MIS_NAMIBWORK = LOG_Running;
	};
};


instance DIA_BAALNAMIB_ZUSTIMMUNG(C_Info)
{
	npc = gur_8036_namib;
	nr = 2;
	condition = dia_baalnamib_zustimmung_condition;
	information = dia_baalnamib_zustimmung_info;
	permanent = TRUE;
	description = "Достаточно ли силен мой дух, господин?";
};


func int dia_baalnamib_zustimmung_condition()
{
	if((MIS_NAMIBWORK == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_zustimmung_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Zustimmung_01_00");	//Достаточно ли силен мой дух, господин?
	AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_01");	//Дай посмотреть на тебя... мммм...(внимательно разглядывает)

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_04");	//Я ощущаю в тебе великую духовную силу!
		AI_Output(other,self,"DIA_BaalNamib_Zustimmung_01_03");	//Значит ли это, господин, что вы даете свое согласие на мое принятие в Круг Гуру?
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_04");	//Ты все верно понял. Ступай к Идолу Орану.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry(TOPIC_NAMIBWORK,"По мнению Идола Намиба, мой дух достаточно силен. Он дал согласие на мое принятие в Круг Гуру.");
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_05");	//Нет - ты все так же слаб!
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_06");	//Не трать мое время. Возвращайся ко мне только тогда, когда твоя духовная сила еще больше возрастет и окрепнет.
	};
};


instance DIA_BAALNAMIB_PRETEACH(C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_preteach_condition;
	information = dia_baalnamib_preteach_info;
	description = "Идол Оран сказал, что ты можешь обучить меня созданию рун.";
};


func int dia_baalnamib_preteach_condition()
{
	if((hero.guild == GIL_GUR) && (BAALNAMIB_TEACHRUNES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_preteach_info()
{
	AI_Output(other,self,"DIA_BaalNamib_PreTeach_15_00");	//Идол Оран сказал, что ты можешь обучить меня созданию рун магии Спящего.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_01");	//Конечно, я могу помочь тебе освоить это искусство!
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_02");	//С постижением каждого нового магического Круга тебе будут становиться доступны все более и более могущественные заклинания.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_03");	//Кроме этого, для создания некоторых рун тебе понадобятся магические свитки с заклинаниями. Идол Тион сможет продать тебе их.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_04");	//Также у него всегда с есть собой книги рун на тот случай, если ты захочешь узнать больше о магии Спящего.
	Log_CreateTopic(TOPIC_ADDON_GURTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Идол Намиб может научить меня создавать руны магии Спящего.");
};


instance DIA_BAALNAMIB_RUNEN(C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_runen_condition;
	information = dia_baalnamib_runen_info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};


func int dia_baalnamib_runen_condition()
{
	if((hero.guild == GIL_GUR) && (BAALNAMIB_TEACHRUNES == TRUE) && Npc_KnowsInfo(other,dia_baalnamib_preteach))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_baalnamib_runen,"6 Круг магии",dia_baalnamib_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_baalnamib_runen,"5 Круг магии",dia_baalnamib_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_baalnamib_runen,"4 Круг магии",dia_baalnamib_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_baalnamib_runen,"3 Круг магии",dia_baalnamib_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_baalnamib_runen,"2 Круг магии",dia_baalnamib_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_baalnamib_runen,"1 Круг магии",dia_baalnamib_runen_1);
	};
};

func void dia_baalnamib_runen_back()
{
	Info_ClearChoices(dia_baalnamib_runen);
};

func void dia_baalnamib_runen_1()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_baalnamib_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_BERZERK] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_baalnamib_runen_circle_3_spl_berzerk);
	};
};

func void dia_baalnamib_runen_2()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_baalnamib_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_baalnamib_runen_circle_2_spl_windfist);
	};
};

func void dia_baalnamib_runen_3()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_baalnamib_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_baalnamib_runen_circle_1_spl_charm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_baalnamib_runen_circle_3_spl_Extricate);
	};
};

func void dia_baalnamib_runen_4()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SUMMONSWAMPGOLEM] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_baalnamib_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_baalnamib_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_baalnamib_runen_circle_4_spl_Elevate);
	};
};

func void dia_baalnamib_runen_5()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SEVEREFETIDITY] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_baalnamib_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_baalnamib_runen_circle_4_spl_whirlwind);
	};
};

func void dia_baalnamib_runen_6()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GuruWrath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GuruWrath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_baalnamib_runen_circle_6_spl_GuruWrath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_baalnamib_runen_circle_6_spl_Quake);
	};
};

func void dia_baalnamib_runen_circle_1_spl_sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void dia_baalnamib_runen_circle_1_spl_charm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Charm);
};

func void dia_baalnamib_runen_circle_2_spl_greententacle()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GreenTentacle);
};

func void dia_baalnamib_runen_circle_2_spl_windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void dia_baalnamib_runen_circle_3_spl_fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void dia_baalnamib_runen_circle_3_spl_berzerk()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BERZERK);
};

func void dia_baalnamib_runen_circle_3_spl_Extricate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Extricate);
};

func void dia_baalnamib_runen_circle_4_spl_Elevate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Elevate);
};

func void dia_baalnamib_runen_circle_5_spl_Acid()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Acid);
};

func void dia_baalnamib_runen_circle_6_spl_Quake()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Quake);
};

func void dia_baalnamib_runen_circle_4_spl_severefetidity()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SEVEREFETIDITY);
};

func void dia_baalnamib_runen_circle_4_spl_whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void dia_baalnamib_runen_circle_5_spl_summonswampgolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_baalnamib_runen_circle_6_spl_GuruWrath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GuruWrath);
};

instance DIA_BAALNAMIB_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_runemagicnotwork_condition;
	information = dia_baalnamib_runemagicnotwork_info;
	permanent = FALSE;
	description = "Как обстоят дела с вашей магией?";
};


func int dia_baalnamib_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalNamib_RuneMagicNotWork_01_00");	//Как обстоят дела с вашей магией?
	AI_Output(self,other,"DIA_BaalNamib_RuneMagicNotWork_01_01");	//Наши магические руны ослабли и не способны больше творить заклинания!
	AI_Output(self,other,"DIA_BaalNamib_RuneMagicNotWork_01_03");	//Все это очень странно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Гуру Братства также лишились власти над магией рун!");
	GURUMAGERUNESNOT = TRUE;
};

//-----------------PRIORAT---------------------

instance DIA_BAALNAMIB_PrioratStart(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratStart_condition;
	information = dia_baalnamib_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_PrioratStart_condition()
{
	if(PrioratPreStart == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_01");	//Хорошо, что ты пришел, послушник.
		}
		else if(hero.guild == GIL_GUR)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_02");	//Хорошо, что ты пришел.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_03");	//Хорошо, что ты пришел, страж.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_04");	//Хорошо, что ты пришел, незнакомец.
	};


	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_05");	//Ты хотел меня видеть?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_06");	//Да, все верно. У меня есть к тебе дело, которое не терпит отлагательств.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_07");	//В последнее время из лагеря стали пропадать послушники Братства.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_08");	//Причем никто не знает, сами ли они решили уйти, или с ними что-то случилось.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_09");	//Мы никого не держим в лагере насильно. Однако такая тенденция может привести к печальным последствиям для нашей общины.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_10");	//А что ты хочешь от меня?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_11");	//Мне нужно, чтобы ты выяснил причину, которая заставила этих послушников покинуть ряды нашего Братства.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_12");	//Или же узнать, что с ними случилось.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_13");	//Все это очень интересно, но почему именно я?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_14");	//Понимаешь, этот вопрос довольно щекотлив.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_15");	//Если я доверю это кому-нибудь другому, могут пойти разные слухи, что крайне нежелательно для нас в нынешней ситуации.

	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_16");	//А ты здесь человек новый и к тому же хорошо зарекомендовавший себя в глазах наших братьев.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_17");	//А ты, как я слышал, надежный человек, хоть и не являешься членом нашего Братства.
	};

	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_18");	//Этим и объясняется мой выбор. Так я могу рассчитывать на твою помощь? 
	Info_ClearChoices(DIA_BaalNamib_PrioratStart);
	Info_AddChoice(DIA_BaalNamib_PrioratStart,"Хорошо. С чего я должен начать?",DIA_BaalNamib_PrioratStart_yes);
	Info_AddChoice(DIA_BaalNamib_PrioratStart,"У меня нет на это времени.",DIA_BaalNamib_PrioratStart_no);
};

func void DIA_BaalNamib_PrioratStart_no()
{
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_no_01_01");	//К сожалению, у меня нет времени на это.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_02");	//Что ж, ты очень сильно разочаровал меня своим ответом.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_03");	//Надеюсь, что у тебя действительно есть более важные дела, нежели помощь нашему Братству.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_no_01_04");	//Мне очень жаль.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_05");	//(вздох)
	AI_StopProcessInfos(self);
};

func void DIA_BaalNamib_PrioratStart_yes()
{
	Wld_SendTrigger("NW_ASS_BLOOD_01");
	B_StartOtherRoutine(SEK_8039_NOVIZE,"TOT");
	B_StartOtherRoutine(SEK_8040_NOVIZE,"TOT");
	B_StartOtherRoutine(tpl_8045_hanis,"Death");
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_yes_01_01");	//Хорошо. С чего я должен начать свои поиски?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_02");	//Думаю, сперва тебе стоит проверить лагеря наших сборщиков болотника.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_03");	//Мы уже давно не получали от них никаких известий.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_04");	//Я очень волнуюсь за их судьбу. Здешняя местность не слишком дружелюбна.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_05");	//Заодно и выяснишь, что они знают о пропавших послушниках. Нам будет полезна любая информация.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_06");	//После того как побываешь у сборщиков, отправляйся в город к Идолу Парвезу.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_07");	//Узнай, есть ли у него какие-нибудь новости относительно этого дела. Пока это все.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_yes_01_08");	//Ладно, я все понял.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_09");	//Жду от тебя новостей. И, надеюсь, хороших.
	Log_CreateTopic(TOPIC_PrioratStart,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PrioratStart,LOG_Running);
	B_LogEntry(TOPIC_PrioratStart,"Идол Намиб сильно обеспокоен тем, что из лагеря таинственным образом стали пропадать послушники Братства. Он попросил меня помочь ему в этом запутанном деле. Для начала мне стоит наведаться в лагеря сборщиков болотника и расспросить их на предмет этих странных исчезновений, а после - заглянуть к Идолу Парвезу в Хоринисе.");
	MIS_PrioratStart = LOG_Running;
	AI_StopProcessInfos(self);
};

var int MissKillerHanis;

instance DIA_BAALNAMIB_PrioratNews(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_condition;
	information = dia_baalnamib_PrioratNews_info;
	permanent = TRUE;
	description = "У меня есть для тебя новости.";
};


func int dia_baalnamib_PrioratNews_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeekInProgress == FALSE) && ((PsiCamp_01_Ok == TRUE) || (PsiCamp_02_Ok == TRUE) || (PsiCamp_03_Ok == TRUE) || (PsiCamp_04_Ok == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_info()
{
	var int ExpAll;

	ExpAll = FALSE;

	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_01");	//У меня есть для тебя новости.
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_02");	//Я тебя внимательно слушаю.

	if((PsiCamp_01_Ok == TRUE) && (PsiCamp_01_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_03");	//В лагере сборщиков Балама все спокойно - новая партия болотника будет доставлена в срок. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_04");	//А что насчет пропавших послушников?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_05");	//Они ничего не слышали об этом. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_06");	//Хорошо. Что-нибудь еще? 
		PsiCamp_01_Done = TRUE;
	};

	if((PsiCamp_02_Ok == TRUE) && (PsiCamp_02_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_07");	//У Шрэта и его сборщиков болотника все в полном порядке.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_08");	//Это радует. А известно им что-нибудь о пропавших братьях?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_09");	//Нет.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_10");	//Что же, - нет так нет. Есть еще какие-нибудь новости?
		PsiCamp_02_Done = TRUE;
	};

	if((PsiCamp_04_Ok == TRUE) && (PsiCamp_04_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_11");	//Я поговорил с Идолом Парвезом. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_12");	//И что он сказал?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_13");	//По его словам, в городе никто не видел послушников из лагеря. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_14");	//Он в это уверен?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_15");	//Абсолютно. Городская стража не оставила бы это без внимания.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_16");	//Хорошо. Есть еще новости?
		PsiCamp_04_Done = TRUE;
	};
	if((PsiCamp_03_Ok == TRUE) && (PsiCamp_03_Done == FALSE))
	{
		if(MissKillerHanis == FALSE)
		{
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_17");	//Полагаю, что они тебе не очень понравятся. На лагерь стража Ханиса было совершено нападение.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_18");	//Что?! Но кто мог это сделать и, главное, зачем?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_19");	//Этого я не знаю.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_20");	//О, боги... А что же сам Ханис?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_21");	//Он храбро сражался и даже сумел ранить одного из нападавших, но был смертельно ранен. Я ничем не мог ему помочь.
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_23");	//Правда, перед тем как умереть, он сообщил мне, что нападавшие забрали с собой всех сборщиков болотника.
		}
		else
		{
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_53");	//По поводу нападения на лагерь Ханиса...
		};

		if(FirstAssas == TRUE)
		{
			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				ExpAll = ExpAll + 500;
			};

			if(MissKillerHanis == FALSE)
			{
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_24");	//И что ты предпринял?
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_25");	//По словам Ханиса, один из убийц сильно истекал кровью. Это помогло мне выследить его и убить.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_26");	//Однако кто он и откуда, выяснить не удалось. При нем был только странного вида клинок.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_27");	//Дай мне взглянуть на него.
			}
			else
			{
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_54");	//Я тебя слушаю.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_55");	//Мне удалось выследить и убить одного из нападавших.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_56");	//Однако кто он и откуда, выяснить не удалось. При нем был только странного вида клинок.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_57");	//Дай мне взглянуть на него.
			};

			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				AI_UnequipWeapons(self);
				CreateInvItems(other,ItMw_1H_AssBlade_View,1);
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_28");	//Вот, возьми.
				B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
				AI_EquipBestMeleeWeapon(self);
				AI_ReadyMeleeWeapon(self);
				AI_PlayAni(self,"T_1HSINSPECT");
				AI_RemoveWeapon(self);
				AI_UnequipWeapons(self);
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_29");	//Да, очень странный клинок. Никогда не видел подобного оружия.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_30");	//Возьми его обратно и попытайся о нем что-нибудь выяснить.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_31");	//Узнай, кому мог бы принадлежать такой клинок.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_32");	//Это будет непросто. У тебя есть какие-нибудь мысли на этот счет?
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_33");	//Попробуй поговорить с опытными кузнецами. Кто, как не они, лучше всего разбираются в оружии.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_34");	//Возможно, нам повезет, и кто-нибудь из них знает, откуда оно могло взяться.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_35");	//Больше новостей у тебя нет?
				BladePrioratSeek = TRUE;
				B_LogEntry(TOPIC_PrioratStart,"Я рассказал Идолу Намибу о нападении на лагерь сборщиков и показал ему загадочный клинок, который я обнаружил у одного из нападавших. Гуру попросил меня разузнать о нем поподробнее. Для начала стоит поспрашивать о нем местных кузнецов.");
			}
			else
			{
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_36");	//К сожалению, у меня нет его с собой.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_37");	//Тогда принеси мне его, чтобы я мог взглянуть на него.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_39");	//Еще какие-нибудь новости есть?
				B_LogEntry(TOPIC_PrioratStart,"Я рассказал Идолу Намибу о нападении на лагерь сборщиков и о загадочном клинке, который я обнаружил у одного из нападавших. Гуру попросил меня показать меч ему, а затем разузнать о нем поподробнее. Для начала стоит поспрашивать о нем местных кузнецов.");
				MissAssBlade = TRUE;
			};

			PsiCamp_03_Done = TRUE;
		}
		else
		{
			if(ExpAll > 0)
			{
				B_GivePlayerXP(ExpAll);
			};

			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_40");	//И что ты предпринял?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_41");	//По словам Ханиса, один из убийц сильно истекал кровью.
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_42");	//Но я пока его не нашел.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_43");	//Тогда выследи его! Нам нужно знать, что это за люди.
			MissKillerHanis = TRUE;
			AI_StopProcessInfos(self);
		};
	};

	if(ExpAll > 0)
	{
		B_GivePlayerXP(ExpAll);
	};

	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_45");	//Полагаю, это все новости, которые я мог узнать о пропавших послушниках.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_46");	//Ты хорошо поработал! Теперь нам надо решить, как быть дальше.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_47");	//И пока я думаю над этим, постарайся узнать что-нибудь насчет клинка.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_48");	//Возможно, это единственная ниточка, которая сможет привести нас к истине.
		BladePrioratSeekInProgress = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_50");	//Пока это все новости.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_51");	//Хорошо, но этого мало! Постарайся узнать еще что-нибудь.
	};
};


instance DIA_BAALNAMIB_PrioratNews_Blade(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_Blade_condition;
	information = dia_baalnamib_PrioratNews_Blade_info;
	permanent = FALSE;
	description = "У меня есть с собой тот клинок.";
};


func int dia_baalnamib_PrioratNews_Blade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == FALSE) && (MissAssBlade == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_Blade_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_01");	//У меня есть с собой тот клинок.
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_02");	//Хорошо. Дай мне взглянуть на него.
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_03");	//Вот, держи.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_04");	//Да, очень странный клинок. Никогда не видел подобного оружия!
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_05");	//Возьми его обратно и попытайся выяснить о нем что-нибудь.
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_06");	//Узнай, кому мог бы принадлежать такой клинок.
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_07");	//Это будет непросто. У тебя есть какие-нибудь мысли на этот счет?
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_08");	//Попробуй поговорить с опытными кузнецами. Кто, как не они, лучше всего разбираются в оружии!
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_09");	//Возможно, нам повезет, и кто-нибудь из них знает, откуда оно могло взяться.
	BladePrioratSeek = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Я принес Идолу Намибу загадочный клинок, найденный мною у одного из нападавших. Гуру очень заинтересовался им и попросил меня разузнать о нем более подробно. Для начала стоит поспрашивать местных кузнецов.");


	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_10");	//Возможно, это единственная ниточка, которая сможет привести нас к истине.
		BladePrioratSeekInProgress = TRUE;
	};
};

instance DIA_BAALNAMIB_ShadowKnown(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_ShadowKnown_condition;
	information = dia_baalnamib_ShadowKnown_info;
	permanent = FALSE;
	description = "Мне удалось выяснить, кто напал на лагерь сборщиков болотника.";
};


func int dia_baalnamib_ShadowKnown_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_ShadowKnown_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_01");	//Мне удалось выяснить, кто напал на лагерь сборщиков болотника.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_02");	//В самом деле?
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_03");	//Это были бойцы древнего ордена убийц, именующие себя Тенями Масиафа!
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_04");	//Хммм... Кажется, я догадываюсь, о ком ты говоришь. 
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_05");	//Но, насколько я знаю, их Братство всегда располагалось в землях ассасинов в Варанте.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_06");	//Ты прав - так и было до недавнего времени.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_07");	//Но клинок, который я нашел у одного из убийц, говорит об обратном. 
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_08");	//Если это так, то мы все в большой опасности!
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_09");	//И особенно те братья, которые сейчас находятся за пределами нашего лагеря.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_10");	//И что мы будем делать?
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_11");	//Для начала отправляйся к Гор На Тофу и скажи, что я распорядился обеспечить безопасность сборщиков.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_12");	//Пусть он отправит к ним несколько своих Стражей.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_13");	//Хорошо. А что делать мне?
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_14");	//Полагаю, что сейчас у меня нет для тебя никаких поручений.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_15");	//Но если ты все-таки хочешь помочь, отправляйся вместе со стражами в один из лагерей.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_16");	//Уверен, что лишний человек им там не помешает.
	NamibSendTempler = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Я рассказал Идолу Намибу все, что смог узнать о нападавших. Намиб послал меня к наставнику стражей Гор на Тофу, чтобы тот распорядился обеспечить безопасность оставшихся лагерей сборщиков болотника. Я тоже могу помочь стражам в этом деле.");
};


instance DIA_BAALNAMIB_WhereToGo(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_WhereToGo_condition;
	information = dia_baalnamib_WhereToGo_info;
	permanent = FALSE;
	description = "В какой лагерь сборщиков мне лучше отправиться?";
};


func int dia_baalnamib_WhereToGo_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_WhereToGo_info()
{
	AI_Output(other,self,"DIA_BaalNamib_WhereToGo_01_01");	//В какой лагерь сборщиков мне лучше отправиться?
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_02");	//Полагаю, в тот, что располагается на севере, недалеко от пирамид. Уверен, там ты будешь нужнее.
	AI_Output(other,self,"DIA_BaalNamib_WhereToGo_01_03");	//А откуда такая уверенность?
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_04");	//Вряд ли Масиаф осмелится напасть на лагерь вблизи города. Для них это слишком рискованно.
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_05");	//Ведь они и так раскрыли свое присутствие на этом острове.
	B_LogEntry(TOPIC_PrioratStart,"Идол Намиб посоветовал мне отправиться в лагерь, что располагается на севере Хориниса, вблизи пирамид.");
};

instance DIA_BAALNAMIB_AssStopAttack(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_AssStopAttack_condition;
	information = dia_baalnamib_AssStopAttack_info;
	permanent = FALSE;
	description = "Лагерь сборщиков подвергся нападению!";
};

func int dia_baalnamib_AssStopAttack_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_AssStopAttack_info()
{
	AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_01");	//Лагерь сборщиков на севере Хориниса подвергся нападению!
	AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_02");	//(серьезно) Как я и предвидел. Полагаю, за этим стояли Тени?
	AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_03");	//Да, именно они.

	if(TPLBalamDead == TRUE)
	{
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_04");	//И вам удалось отбить нападение?
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_05");	//Конечно, хотя и не без потерь.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_06");	//Увы, но с таким опасным врагом без этого не обойтись.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_07");	//Уверен, стражи Гор На Тофа прекрасно осознавали, на что шли.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_08");	//Все они сражались до последнего! Гор На Тоф мог бы ими гордиться.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_09");	//Не сомневаюсь. Но давай лучше вернемся к самому нападению.
	};

	AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_10");	//Тебе удалось узнать что-нибудь еще об этих людях?

	if(Npc_HasItems(other,ItAm_MasiafKey) >= 1)
	{
		NamibAmuletResearch = TRUE;
		NamibAmuletResearchDayEnd = Wld_GetDay();

		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_11");	//У одного из нападавших я обнаружил этот странный амулет.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_12");	//Дай мне взглянуть на него.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_13");	//Вот, держи.
		B_GiveInvItems(other,self,ItAm_MasiafKey,1);
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_14");	//Да...(задумчиво) Странная вещица. 
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_15");	//Надеюсь, ты не будешь возражать, если я пока оставлю ее у себя. 
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_16");	//Возможно, мне удастся выяснить более детально, что она из себя представляет.

		if(PlayerKnowsMasiafKey == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_17");	//Я тебе и так могу сказать, что это. У тебя в руках своего рода ключ.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_18");	//Откуда тебе это стало известно?
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_19");	//Один человек в Хоринисе узнал этот амулет.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_20");	//А ты в этом уверен?
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_21");	//Можешь в этом не сомневаться. Я ему доверяю.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_22");	//Хорошо. Тогда нам остается только найти то, что он открывает.
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_23");	//К сожалению, этого он мне не сказал. Так что нам самим придется это выяснить.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_24");	//Я даже не представляю, с чего стоит начать поиски.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_25");	//Мне надо подумать... Возможно, это займет у меня пару дней.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_26");	//Приходи позже и мы решим, как нам быть дальше.
			B_LogEntry(TOPIC_PrioratStart,"Идола Намиба заинтересовал ключ-амулет, который я обнаружил на теле одного из нападавших. Осталось выяснить, что именно он открывает.");
		}
		else
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_28");	//Думаю, если ты заглянешь ко мне через пару дней, я смогу сказать больше об этом предмете.
			B_LogEntry(TOPIC_PrioratStart,"Идола Намиба заинтересовал амулет, который я обнаружил на теле одного из нападавших. Возможно, эта вещица приоткроет нам тайну Масиафа. Гуру необходимо некоторое время, чтобы понять, с чем мы имеем дело.");
		};
	}
	else
	{
		B_GivePlayerXP(250);
		NamibAmuletSearch = TRUE;
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_30");	//Пока ничего.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_31");	//Это очень плохо. Нам нужно больше информации об этих нападениях.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_32");	//Ладно, ты пока свободен. Но если что-то найдешь, незамедлительно сообщи мне об этом!
	};
};

instance DIA_BAALNAMIB_MasiafAmulet(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_condition;
	information = dia_baalnamib_MasiafAmulet_info;
	permanent = FALSE;
	description = "У меня кое-что есть для тебя.";
};

func int dia_baalnamib_MasiafAmulet_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibAmuletSearch == TRUE) && (Npc_HasItems(other,ItAm_MasiafKey) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_info()
{
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_01");	//У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_02");	//Что именно?
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_03");	//Странного вида амулет, который я обнаружил у одного из нападавших.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_04");	//Хммм... Дай мне взглянуть на него.
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_05");	//Вот, держи.
	B_GiveInvItems(other,self,ItAm_MasiafKey,1);
	Npc_RemoveInvItems(self,ItAm_MasiafKey,Npc_HasItems(self,ItAm_MasiafKey));
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_06");	//Да...(задумчиво) Странная вещица. 
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_07");	//Надеюсь, ты не будешь возражать, если я пока оставлю ее у себя. 
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_08");	//Возможно, мне удастся выяснить более детально, что она из себя представляет.

	if(PlayerKnowsMasiafKey == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_09");	//Я тебе и так могу сказать, что это. У тебя в руках своего рода ключ.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_10");	//Откуда тебе это стало известно?
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_11");	//Один человек в Хоринисе узнал этот амулет.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_12");	//А ты в этом уверен?
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_13");	//Можешь в этом не сомневаться. Я ему доверяю.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_14");	//Хорошо. Тогда нам остается только найти то, что он открывает.
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_15");	//К сожалению, этого он мне не сказал. Так что нам самим придется это выяснить.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_16");	//Я даже не представляю, с чего стоит начать поиски.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_17");	//Мне надо подумать... Возможно, это займет у меня пару дней.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_18");	//Приходи позже и мы решим, как нам быть дальше.
		B_LogEntry(TOPIC_PrioratStart,"Идола Намиба заинтересовал ключ-амулет, который я обнаружил на теле одного из нападавших. Осталось выяснить, что именно он открывает.");
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_20");	//Думаю, если ты заглянешь ко мне через пару дней, я смогу сказать больше об этом предмете.
		B_LogEntry(TOPIC_PrioratStart,"Идола Намиба заинтересовал амулет, который я обнаружил на теле одного из нападавших. Возможно, эта вещица приоткроет нам тайну Масиафа. Гуру необходимо некоторое время, чтобы понять, с чем мы имеем дело.");
	};

	NamibAmuletResearch = TRUE;
	NamibAmuletResearchDayEnd = Wld_GetDay();
};


instance DIA_BAALNAMIB_MasiafAmulet_News(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_News_condition;
	information = dia_baalnamib_MasiafAmulet_News_info;
	permanent = FALSE;
	description = "Есть какие-нибудь новости?";
};

func int dia_baalnamib_MasiafAmulet_News_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (NamibAmuletResearch == TRUE) && (NamibAmuletResearchDayEnd <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_News_info()
{
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_News_01_01");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_02");	//Хорошо, что ты зашел. Мне действительно удалось кое-что выяснить.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_03");	//Это касается того символа, что изображен в центре амулета.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_04");	//Дело в том, что недавно на наших послушников было совершено новое нападение.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_05");	//Однако на этот раз одному из них все-таки удалось выжить и скрыться от нападавших.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_06");	//Когда он вернулся в лагерь и рассказал о случившемся, то я сразу же решил расспросить его подробнее.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_07");	//Правда, он был сильно напуган и еле подбирал слова, пытаясь рассказать мне, как все происходило.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_08");	//Потом я показал ему этот амулет. Он долго на него смотрел, но так толком ничего и не сказал. 
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_09");	//Но по его взгляду я понял, что он ему все-таки знаком.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_10");	//Думаю, тебе стоит поговорить с ним об этом.
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_News_01_11");	//Как зовут этого послушника?
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_12");	//Его имя Локи. Сейчас он в городе, вместе с идолом Парвезом.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_13");	//Духовная медитация и покой - это именно то, что необходимо человеку, побывавшему в подобной переделке. 
	B_LogEntry(TOPIC_PrioratStart,"Идол Намиб сообщил мне, что на послушников недавно было совершено еще одно нападение. В этот раз одному из них удалось скрыться от нападавших. Выжившего послушника зовут Локи и, по словам гуру, он что-то знает об амулете.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(SEK_8049_LOKI,"NW_CITY_LOKI");
};


instance DIA_BAALNAMIB_Assasins_Door_Found(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_condition;
	information = dia_baalnamib_Assasins_Door_Found_info;
	permanent = FALSE;
	description = "Мне нужен тот амулет.";
};

func int dia_baalnamib_Assasins_Door_Found_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (Assasins_Door_Found_OneTime == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_00");	//Мне нужен тот амулет.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_01");	//Значит, тебе удалось что-то узнать?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_02");	//Послушник Локи отвел меня к тому месту, где он видел символ, изображенный на амулете.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_03");	//Там я обнаружил странную каменную плиту и пьедестал с рельефным разъемом с тем же изображением.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_04");	//(задумчиво) Кажется, я понимаю, о чем ты сейчас думаешь.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_05");	//Хорошо, держи амулет. Надеюсь, у тебя все получится.
	B_GiveInvItems(self,other,ItKe_Masiaf_Open,1);
	NamibSendToMasiaf = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_Assasins_Door_Found_Ok(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_Ok_condition;
	information = dia_baalnamib_Assasins_Door_Found_Ok_info;
	permanent = FALSE;
	description = "Я обнаружил тайный проход, скрытый в горе.";
};

func int dia_baalnamib_Assasins_Door_Found_Ok_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_Ok_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_00");	//Я обнаружил тайный проход, скрытый в горе.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_01");	//Как интересно! И что ты теперь собираешься предпринять?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_02");	//Надо обыскать эту пещеру. Там определенно кроются ответы на интересующие нас вопросы.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_03");	//Хорошо, - я рассчитываю на тебя. Но будь осторожен, ведь точно неизвестно, что тебя там ждет.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_04");	//Вот, возьми этот эликсир. Он поможет тебе в твоих поисках.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
};

instance DIA_BAALNAMIB_Assasins_DoneAll(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneAll_condition;
	information = dia_baalnamib_Assasins_DoneAll_info;
	permanent = FALSE;
	description = "Братство теперь в безопасности.";
};

func int dia_baalnamib_Assasins_DoneAll_condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneAll_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_00");	//Братство теперь в безопасности.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_01");	//Ты в этом уверен?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_02");	//Абсолютно. Угрозы больше нет.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_03");	//Хорошо, я тебе верю. И кто же стоял за всем этим?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_04");	//Это был Кор-Галом! Только в виде могущественного демона.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_05");	//Кор-Галом? Тогда это многое объясняет.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_06");	//Но в любом случае мы все благодарны тебе за помощь. Без тебя бы мы не справились!
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_08");	//Вот, возьми эти эликсиры. Уверен, они придутся тебе очень кстати.
	B_GiveInvItems(self,other,ItPo_Perm_Health,2);
};

instance DIA_BAALNAMIB_Assasins_DoneHram(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneHram_condition;
	information = dia_baalnamib_Assasins_DoneHram_info;
	permanent = FALSE;
	description = "Это еще не все.";
};

func int dia_baalnamib_Assasins_DoneHram_condition()
{
	if(Npc_KnowsInfo(other,DIA_BaalNamib_Assasins_DoneAll) == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneHram_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_00");	//Это еще не все. Помнишь, я рассказывал тебе про тайный проход, скрытый в горе?
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_01");	//Само собой. Я помню об этом.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_02");	//Так вот, по другую сторону этого прохода находится небольшая долина. Именно там располагался храм Кор-Галома и Братства Масиаф.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_03");	//И там же они держали похищенных ими людей. В том числе и ваших послушников.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_04");	//Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_05");	//Сейчас проход завален камнями, и многие из тех, кто попал к ним в плен, до сих пор остались в той долине.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_06");	//Без вашей помощи они не смогут выбраться оттуда.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_07");	//Я тебя понял...(серьезно) Я немедленно пошлю туда стражей, чтобы они расчистили завалы.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_08");	//Мы поможем нашим братьям и не оставим на произвол судьбы!
};