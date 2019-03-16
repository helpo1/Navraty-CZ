
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = FALSE;
	description = "Ты теперь останешься в городе?";
};

func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	if(MIS_JarCurse != LOG_Running)
	{
		return TRUE;
	};
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Ты останешься в городе?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//Кто-то из нас должен оставаться здесь, когда Ватраса в городе нет.
	VatrasAbloeseIstDa = TRUE;

	if((RavenAway == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//Я хотел тебе сказать еще одну вещь.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//В Яркендаре ты совершил поистине героический подвиг.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//К сожалению, у меня еще есть незавершенные дела в Хоринисе.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//Это так, но я уверен, что ты справишься с ними.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//Увидим.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};

instance DIA_Addon_Myxir_CITY_AncientBookDone(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 10;
	condition = DIA_Addon_Myxir_CITY_AncientBookDone_Condition;
	information = DIA_Addon_Myxir_CITY_AncientBookDone_Info;
	permanent = FALSE;
	description = "Взгляни на это.";
};

func int DIA_Addon_Myxir_CITY_AncientBookDone_Condition()
{
	if((MIS_MyxirAncientBook == LOG_Running) && (Npc_HasItems(hero,ItWr_AncientBook_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_AncientBookDone_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_00");	//Вот, смотри. 
	B_GiveInvItems(other,self,ItWr_AncientBook_01,1);
	Npc_RemoveInvItems(self,ItWr_AncientBook_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_01");	//О Аданос...(изумленно) Где ты нашел этот древний манускрипт?
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_02");	//Там, где ты и советовал мне поискать - в библиотеке Зодчих.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_03");	//Невероятно! Значит, я был прав, и они действительно хранили некоторые свои записи в таких вот книгах.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_04");	//Необходимо как можно скорее тщательнейшим образом изучить эти записи!
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_05");	//Возможно, именно здесь кроются ответы на интересующие нас вопросы.
	MIS_MyxirAncientBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Success);
	B_LogEntry(TOPIC_MyxirAncientBook,"Я отдал Миксиру книгу Зодчих, которую нашел в развалинах библиотеки.");
};

var int DIA_Addon_Myxir_CITY_Teach_NoPerm;
var int DIA_Addon_Myxir_CITY_Teach_OneTime;

instance DIA_Addon_Myxir_CITY_Teach(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 90;
	condition = DIA_Addon_Myxir_CITY_Teach_Condition;
	information = DIA_Addon_Myxir_CITY_Teach_Info;
	permanent = TRUE;
	description = "Научи меня этому языку.";
};

func int DIA_Addon_Myxir_CITY_Teach_Condition()
{
	if((DIA_Addon_Myxir_CITY_Teach_NoPerm == FALSE) && ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Научи меня этому языку.

	if(DIA_Addon_Myxir_CITY_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_CITY_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,Dialog_Back,DIA_Addon_Myxir_CITY_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Больше мне нечего тебе показать. Ты изучил язык зодчих.
		DIA_Addon_Myxir_CITY_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Ну, начнем с чего-нибудь простого. В первую очередь займемся языком крестьян.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Как правило, тексты, написанные на языке крестьян, связаны с нашим миром, с такими понятиями, как работа, любовь, добыча пищи.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Это - основной язык города. Ты сможешь прочесть большинство текстов, которые найдешь здесь, если его освоишь.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Ты уже знаком с языком крестьян. Язык воинов немного более сложен.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Тексты, написанные на языке воинов, в основном касаются войн и оружия. Ты узнаешь кое-что полезное.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Высокий штиль жрецов трудно понять. Но я с радостью обучу тебя ему.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//Помимо прочего, священные книги, описывающие историю и магию создателей, написаны на языке жрецов.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Каждый из этих текстов - настоящее сокровище, если, конечно, ты можешь его понять.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};


instance DIA_ADDON_MYXIR_CITY_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_prayforgomez_condition;
	information = dia_addon_myxir_city_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословление Аданоса.";
};

func int dia_addon_myxir_city_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_PrayForGomez_01_01");	//Мне нужно благословление Аданоса.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_PrayForGomez_01_04");	//Спасибо за совет.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_MYXIR_CITY_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_runemagicnotwork_condition;
	information = dia_addon_myxir_city_runemagicnotwork_info;
	permanent = FALSE;
	description = "Ты все еще можешь использовать свою рунную магию?";
};

func int dia_addon_myxir_city_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_00");	//Ты все еще можешь использовать свою рунную магию?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_01");	//Боюсь тебя огорчить. Все мои магические руны каким-то образом утратили свою силу.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_02");	//Причем не только у меня, но и других магов Воды тоже.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_03");	//Возможно, в этом мире произошло нечто страшное и непоправимое, если сейчас мы все вдруг утратили этот дар.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_04");	//Хммм. Все ясно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, маги Воды также потеряли свою способность использовать рунную магию.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Myxir_CITY_JarCurse(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_JarCurse_Condition;
	information = DIA_Addon_Myxir_CITY_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Myxir_CITY_JarCurse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_JarCurse_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_00");	//Хвала Аданосу! Ты вовремя подоспел к нам на помощь.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_01");	//Еще немного, и эти мертвецы убили бы нас.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_02");	//А что это были за твари?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_03");	//Я не знаю. Но подобного рода нежити я еще не встречал.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_04");	//Моя магия практически не причиняет им вреда. Все это так странно.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_05");	//Есть какие-нибудь соображения на этот счет?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_06");	//Я могу только предположить, что все это как-то связано с порталом.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_07");	//Когда мы пришли сюда, храмовый зал, где находился портал, просто кишел мертвыми воинами!
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_08");	//Мы с Митрасом спрятались здесь, надеясь, что они нас не найдут.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_09");	//Но только твое вмешательство спасло нам наши жизни!
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_10");	//Если ты прав, то маги Воды, оставшиеся в долине, сейчас могут находиться в смертельной опасности.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_11");	//Наверняка по ту сторону портала ситуация еще хуже.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_12");	//Тогда нам надо это проверить. И я прошу тебя заняться этим.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_13");	//Я же отправлюсь в город и сообщу обо всем Ватрасу.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_14");	//А Митрас останется тут и будет присматривать за самим порталом.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_15");	//Само собой. И, как всегда, мне досталась самая простая работа.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_16");	//Пойми, сейчас кроме тебя это просто некому сделать.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_17");	//Все братья Кольца Воды сейчас сражаются с нежитью, которая атаковала Хоринис.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_18");	//Да ладно, не переживай. Я все сделаю.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_19");	//Да благословит тебя Аданос...(вздыхая) Да, и кстати, пока ты не ушел, поговори с Митрасом.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_20");	//Кажется, у него тоже были кое-какие соображения на этот счет.
	MyxirSendSaturas = TRUE;
	B_LogEntry(TOPIC_JarCurse,"Я подоспел вовремя. Миксир и Митрас уже с трудом отбивались от группы мертвых воинов, которая напала на них. Их магия почему-то не причиняла особого вреда этим тварям. По словам Миксира, скорее всего, нежить пришла из портала, что ведет в Долину Древних. Он попросил меня отправиться в Яркендар и проверить там ситуацию.");	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

//-------------------------------------------------Митрас--------------------------------------------------

instance DIA_KDW_1406_Mitras_EXIT(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 999;
	condition = DIA_KDW_1406_Mitras_EXIT_Condition;
	information = DIA_KDW_1406_Mitras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1406_Mitras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1406_Mitras_Hello(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_Hello_condition;
	information = DIA_KDW_1406_Mitras_Hello_info;
	permanent = FALSE;
	description = "Привет! Ты тоже Маг Воды?";
};

func int DIA_KDW_1406_Mitras_Hello_condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_Hello_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_00");	//Привет! Ты тоже маг Воды?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_01");	//Да, как видишь. А что тебя смущает?
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_02");	//Просто я не припомню, чтобы ты был с ними в колонии.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_03");	//Так оно и есть. Я стал магом совсем недавно. Ватрас принял меня в Круг Воды.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_04");	//А до этого я помогал ему как один из братьев Кольца.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_05");	//Понятно.
};

instance DIA_KDW_1406_Mitras_What(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_What_condition;
	information = DIA_KDW_1406_Mitras_What_info;
	permanent = FALSE;
	description = "Что вы тут делаете с Миксиром?";
};

func int DIA_KDW_1406_Mitras_What_condition()
{
	if(Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_What_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_What_01_00");	//Что вы тут делаете с Миксиром?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_01");	//Ватрас послал нас сюда, чтобы мы присмотрели за порталом.

	if(MIS_JarCurse == LOG_Running)
	{
		AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_02");	//Но, как видишь, ситуация тут намного сложнее, чем мы предполагали.
		AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_03");	//Только благодаря Аданосу мы все еще живы!
		AI_Output(other,self,"DIA_KDW_1406_Mitras_What_01_04");	//Ну да. (про себя)...и моему мечу.
	};		
};

instance DIA_KDW_1406_Mitras_JarCurse(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurse_condition;
	information = DIA_KDW_1406_Mitras_JarCurse_info;
	permanent = FALSE;
	description = "Что ты думаешь об этой нежити?";
};

func int DIA_KDW_1406_Mitras_JarCurse_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) == TRUE) && (MIS_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurse_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_00");	//Что ты думаешь об этой нежити?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_01");	//Может быть, я ошибаюсь, но мне кажется, что все они повинуются чьей-то злой воле, не иначе.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_02");	//С чего ты это взял?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_03");	//Понимаешь, поначалу, когда мы только с Миксиром пришли сюда, все было нормально.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_04");	//Но потом нам постоянно стали слышаться какие-то странного рода звуки.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_05");	//Каждую ночь они разносились под сводами этого подземного храма! У меня до сих пор от них мурашки по коже.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_06");	//В конце концов, я не выдержал всего этого и решил подняться на поверхность, чтобы больше не слышать этого проклятого звука.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_07");	//Однако он никуда не исчез! По мне - так наоборот, стал еще сильней и громче!
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_08");	//Источник этого звука исходил откуда-то сверху. Скорее всего, из небольшого храма, что на вершине большой пирамиды.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_09");	//Он был похож на какую-то молитву, или как будто кто-то читал магическое заклинание.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_10");	//Только на каком-то очень странном языке. Я его никогда раньше не слышал.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_11");	//И ты, конечно, решил подняться туда?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_12");	//Нет...(боязно) По правде говоря, я немного испугался и спустился обратно к Миксиру.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_13");	//А потом через несколько дней весь храм наводнила нежить!
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_14");	//Так вот. Мне кажется, что все это как-то взаимосвязано. Нежить в храме и тот странный звук.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_15");	//Ладно, я сам проверю ту пирамиду.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_16");	//Хорошо. Только лучше это сделать ночью, поскольку днем там точно никого нет. Мы это уже проверяли.
	MIS_StrangeUpSound = LOG_Running;
	Log_CreateTopic(TOPIC_StrangeUpSound,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Running);
	B_LogEntry(TOPIC_StrangeUpSound,"Митрас рассказал мне о странном звуке, который предшествовал появлению нежити в храме у пирамид. По его словам, источник звука скорее всего находился где-то на вершине самой высокой пирамиды. Думаю, мне стоит проверить ее. Сделать это лучше всего ночью.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(DMT_1296_JARCURSEMAGE,"NW_TROLLAREA_RUINS_JARCURSE");
};

instance DIA_KDW_1406_Mitras_JarCurseDone(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurseDone_condition;
	information = DIA_KDW_1406_Mitras_JarCurseDone_info;
	permanent = FALSE;
	description = "Я разобрался с твоим кошмаром.";
};

func int DIA_KDW_1406_Mitras_JarCurseDone_condition()
{
	if((MIS_StrangeUpSound == LOG_Running) && (Npc_IsDead(DMT_1296_JARCURSEMAGE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurseDone_01_00");	//Я разобрался с твоим кошмаром.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurseDone_01_01");	//Правда? И что это было?
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurseDone_01_02");	//Какого-то странного вида нежить. В общем, ничего страшного.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurseDone_01_03");	//Ладно, ты меня успокоил.
	MIS_StrangeUpSound = LOG_Success;
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Success);
	B_LogEntry(TOPIC_StrangeUpSound,"Я успокоил Митраса, разобравшись с тем, кто вызывал его беспокойство.");	
};

//-------------------------------------------------Норолас--------------------------------------------------

instance DIA_KDW_1407_Norolas_EXIT(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 999;
	condition = DIA_KDW_1407_Norolas_EXIT_Condition;
	information = DIA_KDW_1407_Norolas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1407_Norolas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1407_Norolas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_Hello(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Hello_condition;
	information = DIA_KDW_1407_Norolas_Hello_info;
	permanent = FALSE;
	description = "Ты же маг Воды?";
};

func int DIA_KDW_1407_Norolas_Hello_condition()
{
	if(MIS_SendNorolas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_01");	//Ты же маг Воды?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_02");	//Ну, глядя на мою робу, трудно об этом не догадаться.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_03");	//Значит, ты и есть тот, кого Сатурас послал с поручением на болота?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_04");	//Да, ты прав. Хотя я и не очень понимаю, откуда тебе это стало известно.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_05");	//Старик прислал меня приглядеть за тобой. Все-таки место тут довольно опасное.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_06");	//А, ну тогда ясно. Что же, помощь мне действительно не помешает!
	B_LogEntry(TOPIC_SendNorolas,"За забором орков я повстречал мага Воды Нороласа, которого Сатурас послал в храм Братства Спящего на болотах.");
};

instance DIA_KDW_1407_Norolas_Progress(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Progress_condition;
	information = DIA_KDW_1407_Norolas_Progress_info;
	permanent = FALSE;
	description = "И как обстоят дела?";
};

func int DIA_KDW_1407_Norolas_Progress_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) == TRUE) && (MIS_SendNorolas == LOG_Running) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Progress_info()
{
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Progress_01_01");	//И как обстоят дела?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_02");	//Плохо. Все болота просто кишат разного рода нежитью.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_03");	//Я было попытался сунуться туда, но едва лишь смог унести свои ноги.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_04");	//Так что теперь целыми днями только и думаю, каким образом мне попасть в этот храм Братства.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Progress_01_05");	//Так тебе нужно попасть именно в сам храм?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_06");	//Ну да. Скорее всего, именно там находится то, что так нужно Сатурасу.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_07");	//Но в любом случае пока что стоит забыть про это.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_08");	//Судя по слухам, там обитает создание пострашней, чем просто обычная нежить.
	B_LogEntry(TOPIC_SendNorolas,"Норолас сказал, что болота кишат нежитью, и будет настоящим самоубийством отправиться туда. Кроме того, в самом храме обитает нечто похуже обычных мертвецов.");
};

instance DIA_KDW_1407_Norolas_Idea(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Idea_condition;
	information = DIA_KDW_1407_Norolas_Idea_info;
	permanent = FALSE;
	description = "И что, пока никаких идей?";
};

func int DIA_KDW_1407_Norolas_Idea_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Progress) == TRUE) && (MIS_SendNorolas == LOG_Running) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Idea_info()
{
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_01");	//И что, пока никаких идей?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_02");	//(задумчиво) Есть тут одна. Но для этого мне понадобится твоя помощь. Один я не справлюсь.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_03");	//Ну давай, выкладывай. Что ты там задумал?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_04");	//Я хочу изготовить особенное зелье, которое даст мне возможность беспрепятственно пройти сквозь толпу нежити.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_05");	//Эммм... это как?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_06");	//Когда я его выпью, они просто примут меня за такую же нежить, как и они сами.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_07");	//Интересная мысль. И ты знаешь, как сварить такой эликсир?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_08");	//К сожалению, нет. Но я знаю, что существует рецепт с подробным описанием приготовления этого эликсира.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_09");	//По крайней мере, так было написано в одной из книг, что когда-то мне удалось прочесть в библиотеке магов Огня.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_10");	//Интересно, и как же это они позволили тебе копаться в своих записях?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_11");	//Дело в том, что я не всегда был магом Воды. 
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_12");	//В свое время я жил в монастыре магов Огня и был одним из их послушников.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_13");	//Но потом покинул его, и решил посвятить свою оставшуюся жизнь служению Аданосу.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_14");	//Так что этот рецепт действительно существует! Осталось лишь только найти его и приготовить зелье.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_15");	//Ладно, попробую достать его для тебя. Но не обещаю, что это будет быстро.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_16");	//Ведь, насколько я понял, ты даже понятия не имеешь, где стоит искать этот рецепт.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_17");	//Я не спешу. Ибо пока это единственная возможность попробовать проникнуть в храм.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_18");	//Если, конечно, ты не хочешь сразиться с ордой нежити.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_19");	//Ну, кто знает.
	B_LogEntry(TOPIC_SendNorolas,"У Нороласа возникла идея, как можно проникнуть в храм. Он рассказал мне об одном зелье, которое способно изменить восприятие нежитью живых существ. Он не знает, как приготовить этот эликсир, но слышал, что существует его рецепт. Норолас уверен, что он находится где-то в Долине Рудников.");
};

instance DIA_KDW_1407_Norolas_Rezept(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_condition;
	information = DIA_KDW_1407_Norolas_Rezept_info;
	permanent = FALSE;
	description = "Вот, взгляни сюда.";
};

func int DIA_KDW_1407_Norolas_Rezept_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Idea) == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_RezeptMist) >= 1) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_01");	//Вот, взгляни сюда.
	B_GiveInvItems(other,self,ItWr_RezeptMist,1);
	Npc_RemoveInvItems(self,ItWr_RezeptMist,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_02");	//Да, похоже, это именно он.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_03");	//Однако рецепт этого зелья более сложен, чем я рассчитывал.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_04");	//Что ты хочешь сказать?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_05");	//Для его изготовления понадобятся довольно сложные ингредиенты.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_06");	//К тому же некоторые из них я даже не знаю, где искать.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_07");	//Например?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_08");	//Например, растение, именуемое в этом списке, как 'Черный клевер'.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_09");	//Но это только лишь малая часть того, что необходимо будет найти.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_10");	//И я так чувствую, что их поиски будет моим очередным поручением.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_11");	//(замялся) Ну... я бы и сам занялся всем этим, но тогда на изготовление эликсира уйдут целые годы.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_12");	//А как ты понимаешь, у нас сейчас нет столько времени.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_13");	//Ладно, можешь не продолжать. Я все понял.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_14");	//Тогда возьми этот список. Здесь записаны все те необходимые ингредиенты, которые мне понадобятся.
	B_GiveInvItems(self,other,ItWr_RezeptIngridients,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_15");	//А я пока займусь приготовлением уже имеющихся у меня.
	B_LogEntry(TOPIC_SendNorolas,"Теперь мне необходимо достать для Нороласа ингредиенты, указанные в рецепте зелья.");
};

instance DIA_KDW_1407_Norolas_Rezept_Ingr(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_Ingr_condition;
	information = DIA_KDW_1407_Norolas_Rezept_Ingr_info;
	permanent = FALSE;
	description = "Я собрал все, что тебе было нужно.";
};

func int DIA_KDW_1407_Norolas_Rezept_Ingr_condition()
{
	if((KnowRezIng == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItPl_DarkClover) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITMI_ZOMBIECORPSE) >= 1) && (Npc_HasItems(hero,ITAT_CRAWLERQUEEN) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1) && (Npc_HasItems(hero,ItMi_NecrUrn) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_Ingr_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_01");	//Я собрал все, что тебе было нужно.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItAt_SkeletonBone,1);
	Npc_RemoveInvItems(other,ItMi_DarkPearl,1);
	Npc_RemoveInvItems(other,ITMI_ZOMBIECORPSE,1);
	Npc_RemoveInvItems(other,ITAT_CRAWLERQUEEN,1);
	Npc_RemoveInvItems(other,ItAt_DemonHeart,1);
	Npc_RemoveInvItems(other,ItMi_NecrUrn,1);
	Npc_RemoveInvItems(other,ItPl_DarkClover,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_02");	//Отлично! Теперь я, наконец-то, смогу доделать тот эликсир.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_03");	//Подожди немного...(напряженно) У меня уже все подготовлено, и процесс его изготовления не займет и минуты.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_04");	//Вот и все, эликсир готов.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_05");	//И теперь, как я понимаю, его необходимо испробовать.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_06");	//Полагаю, что так. Но знаешь, я... я как-то совсем не готов к этому.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_07");	//Не то чтобы я сомневаюсь в правильности его приготовления, но...
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_08");	//Понимаю твои опасения. Тогда давай я это сделаю за тебя.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_09");	//(недоверчиво) А ты точно в этом уверен? Я не могу гарантировать, что он никаким образом не повлияет на твое сознание.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_10");	//Просто отдай мне его. А там будет видно.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_11");	//Ну ладно, если ты так в этом уверен... Вот, держи его.
	B_GiveInvItems(self,other,ItPo_UndeadShield,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_12");	//(взволнованно) Надеюсь, он не... не убьет тебя.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_13");	//И еще... Будет лучше, если ты выпьешь его только перед тем, как отправиться на болота.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_14");	//Время его действия довольно ограничено. Но его хватит на то, чтобы хорошенько обшарить тамошнюю местность, не опасаясь нежити.
	B_LogEntry(TOPIC_SendNorolas,"Я достал все, что требовалось Нороласу, и он приготовил зелье, которое, по его словам, оградит меня от внимания нежити на некоторое время. Я вызвался испробовать напиток. Однако Норолас предупредил меня, что действие напитка ограничено, а потому разумнее будет испробовать его только перед тем, когда я решу отправиться на болота.");
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_UberianBook(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_UberianBook_condition;
	information = DIA_KDW_1407_Norolas_UberianBook_info;
	permanent = FALSE;
	description = "Взгляни, что я нашел на болотах.";
};

func int DIA_KDW_1407_Norolas_UberianBook_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_UberionBook) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_UberianBook_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_01");	//Взгляни, что я нашел на болотах.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_02");	//(задумчиво) Хммм, да... Похоже, это то, что мы с тобой искали!
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_03");	//Но думаю, будет лучше, если ты отнесешь эти записи мастеру Сатурасу.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_04");	//Уверен, что он обрадуется этой находке, ибо в этой книге может быть сокрыто великое множество тайн о магии Спящего!
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_05");	//Ну хорошо. А что насчет тебя?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_06");	//Я пока что останусь тут. 
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_07");	//Это еще зачем?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_08");	//Я слышал, что недалеко от этого места находится лагерь бывших послушников Братства Спящего. 
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_09");	//Мне будет интересно пообщаться с ними.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_10");	//И особенно с их предводителем, который по слухам является настоящим друидом!
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_11");	//Друидом?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_12");	//Да, друидом. Или, как их еще называют, - маги природы.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_13");	//Правда, это единственное, что я о них знаю.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_14");	//А потому и не хочу упускать такую прекрасную возможность узнать о них чуть больше.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_15");	//Ну ладно, как знаешь.
	MIS_SendNorolas = LOG_Success;
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Success);
	B_LogEntry(TOPIC_SendNorolas,"Я показал Нороласу книгу, которую мне удалось отыскать в лагере на болотах. Он попросил меня передать ее Сатурасу, а сам отправился в лагерь бывших послушников Братства, что находится неподалеку.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NetbekLager");
};