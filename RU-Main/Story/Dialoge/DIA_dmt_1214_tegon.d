
instance DMT_1214_TEGON_EXIT(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 999;
	condition = dmt_1214_tegon_exit_condition;
	information = dmt_1214_tegon_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1214_tegon_exit_condition()
{
	return TRUE;
};

func void dmt_1214_tegon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1214_TEGON_HELLO(C_Info)
{
	npc = dmt_1214_tegon;
	condition = dmt_1214_tegon_hello_condition;
	information = dmt_1214_tegon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1214_tegon_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MORIUS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_hello_info()
{
	AI_Output(self,other,"DMT_1214_Tegon_Hello_00");	//Вижу, ты прошел испытание Мориуса. Ты делаешь большие успехи на выбранном тобой пути!
	AI_Output(self,other,"DMT_1214_Tegon_Hello_01");	//Не удивлюсь, если ты скоро добьешься того, на что у остальных ушла бы целая вечность.
	AI_Output(other,self,"DMT_1214_Tegon_Hello_02");	//Ты тоже Хранитель?
	AI_Output(self,other,"DMT_1214_Tegon_Hello_03");	//Думаю, ты уже сам догадался, кто я. И лишние вопросы тут ни к чему.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_04");	//Лучше давай сразу перейдем к делу. Итак, что привело тебя ко мне?
	AI_Output(other,self,"DMT_1214_Tegon_Hello_05");	//Я пришел испросить у тебя твое согласие на посвящение меня в адепты Круга Хранителей, мастер.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_06");	//Тогда ты, наверно, знаешь, что, прежде чем получить его, ты должен выполнить мое задание.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_08");	//Ты готов принять мое испытание?
	Info_ClearChoices(dmt_1214_tegon_hello);
	Info_AddChoice(dmt_1214_tegon_hello,"Да, я готов.",dmt_1214_tegon_hello_test);
};

func void dmt_1214_tegon_hello_test()
{
	AI_Output(other,self,"DMT_1214_Tegon_Hello_09");	//Да, я готов.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1214_Tegon_Hello_10");	//Хорошо. Я - Тегон, третий страж бога Белиара и девятый Хранитель священных Чертогов Вакхана, - даю тебе твое следующее испытание...
	AI_Output(self,other,"DMT_1214_Tegon_Hello_11");	//Слушай внимательно и запоминай.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_12");	//На этот раз тебе не придется ни с кем сражаться или рисковать своей жизнью. Но это не означает, что мое задание будет легкой прогулкой для тебя.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_13");	//Ты, наверно, уже бывал в библиотеке Ксардаса, что располагается на верхнем этаже его башни. Если еще нет, то тогда тебе стоит там побывать.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_14");	//Там ты найдешь некоторые древние манускрипты, хранящие в себе мудрость нашего пути и много другой полезной информации.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_15");	//Для простого человека эти записи не представляют никакого интереса, поскольку он даже и прочесть их не сможет.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_16");	//Эти фолианты написаны на древнем языке демонов Лэнга, и могу тебе сказать - только избранные из многих знают этот язык и способны прочесть эти книги.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_17");	//Тебе же необходимо будет постигнуть знание этого языка и внимательно изучить эти фолианты древности.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_18");	//После того как ты все это сделаешь, возвращайся ко мне. Я скажу тебе, что необходимо будет сделать дальше.
	AI_Output(other,self,"DMT_1214_Tegon_Hello_19");	//Но мастер, кто обучит меня этому языку?
	AI_Output(self,other,"DMT_1214_Tegon_Hello_20");	//Поговори об этом с Ксардасом. Думаю, он сможет помочь тебе в решении этого вопроса.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_21");	//Теперь ступай. Сделай все, что я тебе сказал, а после - возвращайся ко мне.
	AI_StopProcessInfos(self);
	MIS_TEGONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_TEGONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_Running);
	B_LogEntry(TOPIC_TEGONTEST,"Хранитель Тегон - третий страж Белиара и девятый Хранитель священных Чертогов Вакхана - поручил мне изучить древний язык демонов. После того как я прочитаю фолианты на верхнем этаже башни Ксардаса, мне надлежит вернуться к Тегону для дальнейших указаний.");
};


instance DMT_1214_TEGON_TEST(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 1;
	condition = dmt_1214_tegon_test_condition;
	information = dmt_1214_tegon_test_info;
	permanent = FALSE;
	description = "Я выполнил все, что ты хотел.";
};


func int dmt_1214_tegon_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_TEGONTEST == LOG_Running) && (KNOWDEMENTORLANGUAGE == TRUE) && (READDEMENTORBOOK_01 == TRUE) && (READDEMENTORBOOK_02 == TRUE) && (READDEMENTORBOOK_03 == TRUE) && (READDEMENTORBOOK_04 == TRUE) && (READDEMENTORBOOK_05 == TRUE) && (READDEMENTORBOOK_06 == TRUE) && (READDEMENTORBOOK_07 == TRUE) && (TEGON_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1214_Tegon_Test_00");	//Я выполнил все, что ты хотел.
	AI_Output(self,other,"DMT_1214_Tegon_Test_01");	//(властно) Мне уже известно об этом - ты бы мог даже и не говорить.
	AI_Output(self,other,"DMT_1214_Tegon_Test_02");	//Ты делаешь успехи, и уже доказал, что способен на многое!
	AI_Output(self,other,"DMT_1214_Tegon_Test_03");	//Теперь самая главная часть твоего испытания, успех которого будет зависеть от того, насколько тщательно ты запомнил все то, что было описано в тех книгах.
	AI_Output(self,other,"DMT_1214_Tegon_Test_04");	//Думаю, это не должно составить для тебя больших проблем.
	AI_Output(self,other,"DMT_1214_Tegon_Test_05");	//Я буду задавать тебе вопросы, на которые ты должен будешь правильно ответить.
	AI_Output(self,other,"DMT_1214_Tegon_Test_06");	//В случае того, если все твои ответы будут верны, - я дам тебе мое согласие на посвящение в адепты.
	AI_Output(self,other,"DMT_1214_Tegon_Test_09");	//Скажи, когда будешь готов отвечать на мои вопросы.
	B_LogEntry(TOPIC_TEGONTEST,"Теперь я должен применить полученные знания, чтобы пройти испытание Тегона. Хранитель будет задавать мне вопросы, на которые я должен буду ответить.");
	TEGON_TEST = TRUE;
};


instance DIA_TEGON_TEST_FRAGEN(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 5;
	condition = dia_tegon_test_fragen_condition;
	information = dia_tegon_test_fragen_info;
	permanent = TRUE;
	description = "Я готов ответить на твои вопросы.";
};


func int dia_tegon_test_fragen_condition()
{
	if((MIS_TEGONTEST == LOG_Running) && (TEGON_TEST == TRUE) && (TEGON_AGREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_tegon_test_fragen_failed()
{
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_00");	//Ты неправильно ответил на мои вопросы.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_01");	//Пока ты не ответишь на все вопросы правильно, я не дам тебе своего согласия.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_02");	//Иди и изучи фолианты еще раз! А когда будешь готов ответить, приходи снова.
	Info_ClearChoices(dia_tegon_test_fragen);
	AI_StopProcessInfos(self);
};

func void dia_tegon_test_fragen_testok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_00");	//Ты правильно ответил на все мои вопросы...
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_01");	//...и доказал, что можешь мудро выбирать из предложенного тебе.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_02");	//Я считаю, ты достоин того, чтобы носить робу адепта нашего Круга.
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_TestOk_01_04");	//Это означает, что вы дали свое согласие, мастер?
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_05");	//Да, я даю свое согласие на принятие тебя в Священный Круг адептов Круга Хранителей.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_06");	//Теперь настало тебе время искать встречи со следующим из нас. Иди же, и пусть твой путь хранят Стихии!
	MIS_TEGONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_SUCCESS);
	Log_AddEntry(TOPIC_TEGONTEST,"Я ответил на все вопросы Тегона правильно и прошел его испытание.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Хранитель Тегон дал свое согласие на возведение меня в роль адепта их священного Круга.");
	TEGON_AGREE = TRUE;
	Info_ClearChoices(dia_tegon_test_fragen);
	Info_AddChoice(dia_tegon_test_fragen,"(закончить разговор)",dia_tegon_test_fragen_end);
};

func void dia_tegon_test_fragen_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

func void b_tegon_fragen_choices()
{
	if(TEGON_TESTEND == TRUE)
	{
		if(TEGON_RICHTIGEANTWORTEN < 8)
		{
			dia_tegon_test_fragen_failed();
		}
		else
		{
			dia_tegon_test_fragen_testok();
		};
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос восьмой: 'Что явилось истинной причиной того, что ты избрал этот путь?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_04");	//Хорошо! Теперь последний вопрос... самый сложный из всех.
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_05");	//Он звучит очень просто, но хорошенько подумай, прежде чем ответить на него.
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_06");	//Что явилось истинной причиной того, что ты избрал этот путь?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Такова воля богов.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Это мое решение.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Я был избран Судьбой!",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Могущество Хранителей купило меня.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Это просто случайность.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос седьмой: 'Кто возжелал безграничной власти и положил начало божественному противостоянию?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_07");	//Кто возжелал безграничной власти и положил начало божественному противостоянию?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Иннос.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Аданос.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Белиар.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Стоннос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос шестой: 'Кто является самой главной угрозой уничтожения этого мира?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_08");	//Кто является самой главной угрозой уничтожения этого мира?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Драконы.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Белиар.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Иннос.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Орки.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос пятый: 'Что превыше всего ценят Хранители и что есть истинное сокровище?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_09");	//Что превыше всего ценят Хранители и что есть истинное сокровище?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Сила.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Знания.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Мудрость.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Золото.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Власть.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос четвертый: 'Что противоестественно учению Хранителей?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_10");	//Что противоестественно учению Хранителей?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Чувства.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Добродетель.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Зло.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Слабость.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Все это вместе.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос третий: 'Какова истинная цель пути Хранителя и что являет этот путь существующему миру?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_11");	//Какова истинная цель пути Хранителя и что являет этот путь существующему миру?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Добродетель.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Равенство.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Зло.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Баланс.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос второй: 'Кто являет собой Божественных Стражей?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_12");	//Кто являет собой Божественных Стражей?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Боги.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Стихии.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Паладины.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Хранители.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Элементы стихий.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 0)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Вопрос первый: 'Кто есть Создатели?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_13");	//Кто есть Создатели?
		Info_AddChoice(dia_tegon_test_fragen,"Хранители.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Боги.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Стихии.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Люди.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Хаос.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Я не знаю ответа.",dia_tegon_test_fragen_answer_6);
	};
};

func void dia_tegon_test_fragen_info()
{
	TEGON_NEXTQUESTION = 0;
	TEGON_RICHTIGEANTWORTEN = 0;
	TEGON_TESTEND = FALSE;
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_01_00");	//Я готов ответить на твои вопросы.
	if(dia_tegon_test_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_01");	//Тогда не будем терять времени и начнем твое испытание!
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_02");	//Слушай внимательно и постарайся отвечать правильно...
		B_LogEntry(TOPIC_TEGONTEST," --- Вопросы Хранителя Тегона --- ");
		dia_tegon_test_fragen_info_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_03");	//Хорошо, слушай их внимательно и постарайся отвечать правильно...
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_1()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_00");	//Хранители.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_01");	//Боги.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_02");	//Добродетель.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_03");	//Чувства.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_04");	//Сила.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_05");	//Хаос.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_06");	//Иннос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_07");	//Такова воля богов.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_2()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_00");	//Боги.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_01");	//Стихии.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_02");	//Равенство.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_03");	//Добродетель.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_04");	//Знания.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_05");	//Драконы.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_06");	//Аданос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_07");	//Это мое решение.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_3()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_00");	//Стихии.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_01");	//Паладины.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_02");	//Зло.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_03");	//Зло.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_04");	//Мудрость.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_05");	//Белиар.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_06");	//Белиар.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_07");	//Я был избран Судьбой!
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_4()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_00");	//Люди.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_01");	//Хранители.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_02");	//Баланс.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_03");	//Слабость.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_04");	//Золото.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_05");	//Иннос.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_06");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_07");	//Могущество Хранителей купило меня.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_5()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_00");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_01");	//Элементы стихий.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_02");	//Хаос.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_03");	//Все это вместе.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_04");	//Власть.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_05");	//Орки.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_06");	//Стоннос.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_07");	//Это просто случайность.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_6()
{
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_6_01_00");	//Я не знаю ответа.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Answer_6_01_01");	//Тогда не трать понапрасну моего времени.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Answer_6_01_02");	//Иди и изучи фолианты еще раз! А когда будешь готов ответить, приходи снова.
	AI_StopProcessInfos(self);
};

