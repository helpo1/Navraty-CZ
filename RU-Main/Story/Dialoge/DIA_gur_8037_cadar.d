
instance DIA_BAALCADAR_EXIT(C_Info)
{
	npc = gur_8037_cadar;
	nr = 999;
	condition = dia_baalcadar_exit_condition;
	information = dia_baalcadar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_baalcadar_exit_condition()
{
	return TRUE;
};

func void dia_baalcadar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalcadar_PICKPOCKET(C_Info)
{
	npc = gur_8037_cadar;
	nr = 900;
	condition = dia_baalcadar_PICKPOCKET_Condition;
	information = dia_baalcadar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalcadar_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_baalcadar_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
	Info_AddChoice(dia_baalcadar_PICKPOCKET,Dialog_Back,dia_baalcadar_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalcadar_PICKPOCKET,DIALOG_PICKPOCKET,dia_baalcadar_PICKPOCKET_DoIt);
};

func void dia_baalcadar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

func void dia_baalcadar_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalcadar_PICKPOCKET);
};

instance DIA_BAALCADAR_NO_TALK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_no_talk_condition;
	information = dia_baalcadar_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_baalcadar_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	B_Attack(self,other,AR_GuardCalledToKill,1);
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_notalk_sleeper_condition;
	information = dia_baalcadar_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Да пребудет с тобой Спящий!";
};


func int dia_baalcadar_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_01_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_NOTALK_IMP(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_notalk_imp_condition;
	information = dia_baalcadar_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Все в порядке, приятель?";
};


func int dia_baalcadar_notalk_imp_condition()
{
	if((IDOLCADAR_YES == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_01_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_AUFGABE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_aufgabe_condition;
	information = dia_baalcadar_aufgabe_info;
	permanent = FALSE;
	description = "(отдать болотник)";
};


func int dia_baalcadar_aufgabe_condition()
{
	if((MIS_CAINSENTTOCADAR == LOG_Running) && (IDOLCADAR_YES == FALSE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (Npc_HasItems(other,ItPl_SwampHerb) >= 50) && Wld_IsTime(8,0,21,0))
	{
		return TRUE;
	};
};

func void dia_baalcadar_aufgabe_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_BaalCadar_Aufgabe_01_00");	//Я принес дневной сбор болотника!
	B_GiveInvItems(other,self,ItPl_SwampHerb,50);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,50);
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_01_01");	//(вздох)
	IDOLCADAR_YES = TRUE;
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_CAINSENTTOCADAR,"Я отдал болотник Идолу Кадару.");
	MIS_CAINSENTTOCADAR = LOG_SUCCESS;
};


instance DIA_BAALCADAR_HELPME(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_helpme_condition;
	information = dia_baalcadar_helpme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_helpme_condition()
{
	if((MIS_CAINSENTTOCADAR == LOG_SUCCESS) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (IDOLCADAR_YES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_helpme_info()
{
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_00");	//Постой, послушник!
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_01");	//Ты оказал небольшую услугу нашим сборщикам.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_02");	//Что я могу сделать для тебя, господин?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_03");	//Как ты уже наверняка успел узнать, одно из основополагающих свойств нашей жизни - это воскурение болотной травы.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_04");	//К сожалению, это чудесное растение произрастает здесь не везде.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_05");	//А того болотника, что добывает Каин со своими послушниками здесь, недалеко от лагеря, не хватает.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_06");	//Поэтому помимо них существуют и другие группы сборщиков. Мне необходимо, чтобы ты доставил от них очередной сбор болотной травы.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_07");	//Где я могу найти этих сборщиков?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_08");	//Тебе их придется найти самому. От них давно не было вестей.
	AI_Output(other,self,"DIA_BaalCadar_HelpMe_01_09");	//А как сборщики узнают, что меня послал именно ты?
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_10");	//Идол Оран сказал, что у тебя есть набедренная повязка Братства.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_11");	//Думаю, если ты будешь выглядеть так же, как и наши послушники, - они поверят тебе.
	AI_Output(self,other,"DIA_BaalCadar_HelpMe_01_12");	//Теперь ступай, и приходи ко мне только тогда, когда у тебя будет весь сбор болотника целиком.
	Log_CreateTopic(TOPIC_PLANTSFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_Running);
	B_LogEntry(TOPIC_PLANTSFORBAALCADAR,"Идол Кадар просит меня принести ему болотник от других групп сборщиков. Искать их мне придется самому.");
	MIS_PLANTSFORBAALCADAR = LOG_Running;
};


instance DIA_BAALCADAR_ZUSTIMMUNG(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_zustimmung_condition;
	information = dia_baalcadar_zustimmung_info;
	permanent = TRUE;
	description = "Я принес болотник от сборщиков.";
};


func int dia_baalcadar_zustimmung_condition()
{
	if((other.guild == GIL_SEK) && (MIS_PLANTSFORBAALCADAR == LOG_Running) && ((FIRSTGROUPSEK == TRUE) || (SEKONGROUPSEK == TRUE) || (THIRDGROUPSEK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_zustimmung_info()
{
	AI_Output(other,self,"DIA_BaalCadar_Zustimmung_01_00");	//Я принес болотник от сборщиков.

	if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE) && (Npc_HasItems(other,ItPl_SwampHerb) >= 200))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_01");	//Отлично! Давай его сюда. Ну-ка, посмотрим...
		B_GiveInvItems(other,self,ItPl_SwampHerb,200);
		Npc_RemoveInvItems(self,ItPl_SwampHerb,200);
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_02");	//Да! Наши сборщики потрудились на славу.
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_04");	//А ты отлично справился с моим заданием!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_07");	//Твоя вера в Братство ни в коем случае не может поддаваться сомнению, ибо твои дела говорят сами за себя.
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_08");	//Иди к Идолу Орану и передай ему, что я считаю тебя истинно верующим!
		Log_SetTopicStatus(TOPIC_PLANTSFORBAALCADAR,LOG_SUCCESS);
		B_LogEntry(TOPIC_PLANTSFORBAALCADAR,"Я принес Идолу Кадару весь урожай болотника от сборщиков.");
		B_LogEntry_Quiet(TOPIC_PSICAMPJOIN,"Идол Кадар считает, что моя вера в Братство не может поддаваться сомнению.");
		MIS_PLANTSFORBAALCADAR = LOG_SUCCESS;
		CADARAGREED = TRUE;
	}
	else if((FIRSTGROUPSEK == TRUE) && (SEKONGROUPSEK == TRUE) && (THIRDGROUPSEK == TRUE))
	{
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_09");	//Но у тебя его нет! Мне кажется, ты пытаешься меня обмануть.
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_10");	//Наверняка ты забрал болотник у наших сборщиков и решил присвоить его себе!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_13");	//И ты думаешь, что это сойдет тебе с рук?!
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_14");	//(гневно) Ты глубоко заблуждаешься!
		AI_StopProcessInfos(self);
		B_LogEntry_Failed(TOPIC_PLANTSFORBAALCADAR);
		MIS_PLANTSFORBAALCADAR = LOG_FAILED;
		IDOLCADAR_YES = FALSE;
		IDOLCADAR_NOFOREVER = TRUE;
		B_Attack(self,other,AR_GuardCalledToKill,1);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalCadar_Zustimmung_01_15");	//Я не думаю, что это весь сбор болотника. Наверняка ты еще не побывал у остальных сборщиков.
	};
};


instance DIA_BAALCADAR_NOFOREVER(C_Info)
{
	npc = gur_8037_cadar;
	nr = 5;
	condition = dia_baalcadar_noforever_condition;
	information = dia_baalcadar_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalcadar_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IDOLCADAR_NOFOREVER == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_noforever_info()
{
	AI_Output(self,other,"DIA_BaalCadar_NoForever_01_00");	//Убирайся с глаз моих!
	IDOLCADAR_NOFOREVER = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_PERM(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_perm_condition;
	information = dia_baalcadar_perm_info;
	permanent = TRUE;
	description = "Как продвигается добыча болотника?";
};


func int dia_baalcadar_perm_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_SUCCESS) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_perm_info()
{
	AI_Output(other,self,"DIA_BaalCadar_Perm_01_00");	//Как продвигается сбор болотника?
	AI_Output(self,other,"DIA_BaalCadar_Perm_01_01");	//Каждый из нас трудится на пределе своих сил, и в результате у нас достаточно болотника не только для собственных нужд - мы даже пускаем его на продажу.
};


instance DIA_BAALCADAR_PRETEACH(C_Info)
{
	npc = gur_8037_cadar;
	nr = 23;
	condition = dia_baalcadar_preteach_condition;
	information = dia_baalcadar_preteach_info;
	permanent = FALSE;
	description = "Меня послал Идол Оран...";
};


func int dia_baalcadar_preteach_condition()
{
	if((BAALCADAR_TEACHMANA == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baalcadar_preteach_info()
{
	AI_Output(other,self,"DIA_BaalCadar_PreTeach_15_00");	//Идол Оран послал меня...
	AI_Output(other,self,"DIA_BaalCadar_PreTeach_05_01");	//Он сказал, что ты бы мог помочь мне увеличить мою магическую силу.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_02");	//Ты теперь один из нас, поэтому я с радостью научу тебя этому.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_03");	//Магическая энергия - основополагающий навык для любого мага.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_04");	//Мы используем ее для сотворения магических заклинаний, пользуясь силой рун.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_05");	//Но ты должен научиться расходовать магическую энергию разумно.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_06");	//Только тогда ты сможешь стать воистину великим магом!
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_07");	//Как ты уже заметил, многие из послушников сидят за кальяном.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_08");	//Для Гуру - это основной способ познания этого мира и пополнения магической энергии.
	AI_Output(self,other,"DIA_BaalCadar_PreTeach_05_09");	//Хорошая трава в кальяне, размеренные затяжки - что может быть лучше такого пути познания мира?
};


instance DIA_BAALCADAR_TEACH_MANA(C_Info)
{
	npc = gur_8037_cadar;
	nr = 10;
	condition = dia_baalcadar_teach_mana_condition;
	information = dia_baalcadar_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};


func int dia_baalcadar_teach_mana_condition()
{
	if((other.guild == GIL_GUR) && (BAALORUN_TEACHMANA == FALSE) && (BAALCADAR_TEACHMANA == TRUE) && Npc_KnowsInfo(other,dia_baalcadar_preteach))
	{
		return TRUE;
	};
};

func void dia_baalcadar_teach_mana_info()
{
	AI_Output(other,self,"DIA_BaalCadar_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_EVER)
	{
		AI_Output(self,other,"DIA_BaalCadar_TEACH_MANA_05_00");	//Твоя магическая сила выросла! Я больше не в силах помочь тебе в этом.
		AI_Output(self,other,"DIA_BaalCadar_TEACH_MANA_05_01");	//Если ты хочешь узнать больше, обратись к Идолу Орану. Он поможет тебе.
		BAALORUN_TEACHMANA = TRUE;
	};
	Info_ClearChoices(dia_baalcadar_teach_mana);
};

func void dia_baalcadar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};

func void dia_baalcadar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_EVER);
	Info_ClearChoices(dia_baalcadar_teach_mana);
	Info_AddChoice(dia_baalcadar_teach_mana,Dialog_Back,dia_baalcadar_teach_mana_back);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalcadar_teach_mana_1);
	Info_AddChoice(dia_baalcadar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalcadar_teach_mana_5);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceipte_condition;
	information = dia_baalcadar_bringcalomreceipte_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalcadar_bringcalomreceipte_condition()
{
	if((Kapitel >= 2) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceipte_info()
{
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_00");	//Постой, брат!
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_01");	//До меня дошли слухи, что ты отправляешься в Долину Рудников.
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_02");	//Да, это действительно так.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_03");	//Тогда я хотел бы попросить тебя об одной услуге. Это очень важно для Братства!
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_04");	//Необходимо, чтобы ты при случае наведался в наш старый лагерь на болотах и поискал там одну вещь.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_05");	//Мне нужен рецепт приготовления особенной курительной травы из болотника. Его тогда открыл один из наших бывших гуру - Кор Галом.
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_06");	//Кор Галом?
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_08");	//Да. И, насколько мне известно, - уходя из нашего лагеря на поиски Спящего, он оставил этот рецепт у себя в сундуке.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_09");	//И наверняка он все еще там.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipte_01_10");	//Я хочу, чтобы ты забрал оттуда этот рецепт и принес его мне.
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipte_01_11");	//Я попробую это сделать.
	MIS_REZEPTFORBAALCADAR = LOG_Running;
	Log_CreateTopic(TOPIC_REZEPTFORBAALCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_Running);
	B_LogEntry(TOPIC_REZEPTFORBAALCADAR,"Идол Кадар попросил меня принести рецепт, который позволит приготовить из болотника особенную курительную траву. Рецепт должен находиться в лаборатории Кор Галома, что в старом лагере на болотах.");
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_BRINGCALOMRECEIPTEDONE(C_Info)
{
	npc = gur_8037_cadar;
	nr = 2;
	condition = dia_baalcadar_bringcalomreceiptedone_condition;
	information = dia_baalcadar_bringcalomreceiptedone_info;
	permanent = FALSE;
	description = "Я принес рецепт Кор Галома.";
};


func int dia_baalcadar_bringcalomreceiptedone_condition()
{
	if((MIS_REZEPTFORBAALCADAR == LOG_Running) && (Npc_HasItems(other,itwr_kalomsrecipe) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalcadar_bringcalomreceiptedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalCadar_BringCalomReceipteDone_01_00");	//Я принес рецепт Кор Галома.
	B_GiveInvItems(other,self,itwr_kalomsrecipe,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_04");	//(радостно) Да, это он. Это именно тот рецепт, что я искал!
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_05");	//Спасибо тебе, брат! Ты хорошо потрудился на благо Братства.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_09");	//А теперь оставь меня. Мне нужно изучить тот метод приготовления болотника, что указан в рецепте Кор Галома.
	AI_Output(self,other,"DIA_BaalCadar_BringCalomReceipteDone_01_10");	//Думаю, на это уйдет приличное количество времени.
	MIS_REZEPTFORBAALCADAR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REZEPTFORBAALCADAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_REZEPTFORBAALCADAR,"Я принес Идолу Кадару рецепт Кор Галома.");
	AI_StopProcessInfos(self);
};


instance DIA_BAALCADAR_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8037_cadar;
	nr = 1;
	condition = dia_baalcadar_runemagicnotwork_condition;
	information = dia_baalcadar_runemagicnotwork_info;
	permanent = FALSE;
	description = "Как обстоят дела с вашей магией?";
};


func int dia_baalcadar_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalcadar_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalCadar_RuneMagicNotWork_01_00");	//Как обстоят дела с вашей магией?
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_01");	//Наши магические руны ослабли и более не способны творить заклинания!
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_02");	//Мы все удивлены этому, но ничего не можем сделать.
	AI_Output(self,other,"DIA_BaalCadar_RuneMagicNotWork_01_03");	//Все это довольно странно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Гуру Братства также лишились власти над магией рун!");
	GURUMAGERUNESNOT = TRUE;
};
