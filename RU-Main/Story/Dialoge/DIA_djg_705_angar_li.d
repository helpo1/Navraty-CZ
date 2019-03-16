
instance DIA_ANGAR_LI_EXIT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 999;
	condition = dia_angar_li_exit_condition;
	information = dia_angar_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_angar_li_exit_condition()
{
	return TRUE;
};

func void dia_angar_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_PICKPOCKET(C_Info)
{
	npc = djg_705_angar_li;
	nr = 900;
	condition = dia_angar_li_pickpocket_condition;
	information = dia_angar_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_angar_li_pickpocket_condition()
{
	return C_Beklauen(47,45);
};

func void dia_angar_li_pickpocket_info()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
	Info_AddChoice(dia_angar_li_pickpocket,Dialog_Back,dia_angar_li_pickpocket_back);
	Info_AddChoice(dia_angar_li_pickpocket,DIALOG_PICKPOCKET,dia_angar_li_pickpocket_doit);
};

func void dia_angar_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_angar_li_pickpocket);
};

func void dia_angar_li_pickpocket_back()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
};


instance DIA_ANGAR_LI_FOUNDAMULETT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 7;
	condition = dia_angar_li_foundamulett_condition;
	information = dia_angar_li_foundamulett_info;
	description = "Я нашел твой амулет.";
};


func int dia_angar_li_foundamulett_condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_foundamulett_info()
{
	B_AngarsAmulettAbgeben();
};


instance DIA_ANGAR_LI_MISSMYGOLD(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_missmygold_condition;
	information = dia_angar_li_missmygold_info;
	permanent = FALSE;
	description = "Есть один вопрос.";
};


func int dia_angar_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_angar_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Angar_LI_MissMyGold_01_03");	//Ты, случайно, не в курсе, куда подевалось мое золото?
	AI_Output(self,other,"DIA_Angar_LI_MissMyGold_01_04");	//(удивленно) Золото? Нет, приятель, я не в курсе.
	AI_Output(self,other,"DIA_Angar_LI_MissMyGold_01_05");	//Ты же знаешь, меня мало интересуют подобные вещи.
	B_LogEntry(TOPIC_MISSMYGOLD,"Кор Ангар не в курсе того, куда подевалось мое золото.");
};


instance DIA_ANGAR_LI_HELLO(C_Info)
{
	npc = djg_705_angar_li;
	nr = 1;
	condition = dia_angar_li_hello_condition;
	information = dia_angar_li_hello_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_angar_li_hello_condition()
{
	return TRUE;
};

func void dia_angar_li_hello_info()
{
	AI_Output(other,self,"DIA_Angar_LI_Hello_01_01");	//Как обстановка?
	AI_Output(self,other,"DIA_Angar_LI_Hello_01_02");	//Пока все тихо. Но на твоем месте я бы все равно не заходил далеко в глубь этого острова.
	AI_Output(self,other,"DIA_Angar_LI_Hello_01_03");	//Еще не известно, что за твари там водятся.
};


instance DIA_ANGAR_LI_HEADPAIN(C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_headpain_condition;
	information = dia_angar_li_headpain_info;
	permanent = FALSE;
	description = "Тебя больше не мучают головные боли?";
};


func int dia_angar_li_headpain_condition()
{
	return TRUE;
};

func void dia_angar_li_headpain_info()
{
	AI_Output(other,self,"DIA_Angar_LI_HeadPain_01_01");	//Тебя больше не мучают головные боли?
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_02");	//Нет, все в порядке. Как только мы отплыли с Ирдората, они окончательно пропали.
	AI_Output(other,self,"DIA_Angar_LI_HeadPain_01_03");	//Как тебе на этом острове?
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_04");	//Здесь я себя чувствую даже намного лучше, чем в нашем болотном лагере.
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_05");	//Хотя, думаю, расслабляться еще рано - неизвестно, что нас ждет впереди.
};


instance DIA_ANGAR_LI_AWAY(C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_away_condition;
	information = dia_angar_li_away_info;
	permanent = FALSE;
	description = "Возвращайся на борт!";
};


func int dia_angar_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (ANGARLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_away_info()
{
	var int countpeople;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_LI_Away_01_01");	//Возвращайся на борт!
	AI_Output(self,other,"DIA_Angar_LI_Away_01_02");	//А что случилось?
	AI_Output(other,self,"DIA_Angar_LI_Away_01_03");	//Наш корабль готов к отплытию, и с первым же приливом мы снимемся с якоря.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_04");	//А я-то думал, что мы задержимся здесь подольше.
	AI_Output(other,self,"DIA_Angar_LI_Away_01_05");	//Что-то не так?
	AI_Output(self,other,"DIA_Angar_LI_Away_01_08");	//За последнее время это первое место, где я смог наконец-то обрести безмятежность и успокоение.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_09");	//Поэтому я был бы не прочь побыть здесь еще пару деньков.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_11");	//Ну ладно. Надеюсь, я еще вернусь сюда...
	B_LogEntry(TOPIC_GATHERCREW,"Я сообщил Ангару, что мы отплываем с острова. Он был слегка расстроен этим.");
	ANGARLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeople) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_findmagicorecave_condition;
	information = dia_angar_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_angar_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Angar_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Angar_LI_FindMagicOreCave_01_02");	//Правда? Думаю, тебе стоит рассказать об этом капитану.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ANGAR_LI_CHANGECOURSE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_changecourse_condition;
	information = dia_angar_li_changecourse_info;
	permanent = FALSE;
	description = "Мы должны снова вернуться в Хоринис.";
};


func int dia_angar_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_angar_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_01_00");	//Мы должны снова вернуться в Хоринис.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_01_01");	//В Хоринис? Но зачем?
	Info_ClearChoices(dia_angar_li_changecourse);
	Info_AddChoice(dia_angar_li_changecourse,"Мне необходимо срочно поговорить с лордом Хагеном!",dia_angar_li_changecourse_ore);
	Info_AddChoice(dia_angar_li_changecourse,"Все дело в золоте.",dia_angar_li_changecourse_gold);
};

func void dia_angar_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_01");	//Мне необходимо срочно поговорить с лордом Хагеном!
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_02");	//Необходимо сообщить паладинам о магической руде, которую мы нашли на этом острове.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_03");	//Эта новость должна помочь им в войне против орков.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_04");	//Похоже, что это действительно очень веская причина.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_05");	//И я полагаю, что ты прав, поступая именно так.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_06");	//К тому же в последнее время я и сам начал беспокоиться за судьбу своих братьев, оставшихся на том острове.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_07");	//Наверняка им также скоро придется сражаться с этими зеленокожими тварями, и что-то мне подcказывает, что я не должен оставаться безучастным к их судьбе.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_08");	//Значит, ты со мной?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_09");	//Да. Я не буду возражать, если мы вернемся в Хоринис.
	B_LogEntry(TOPIC_CHANGECOURSE,"Ангар согласен отправиться обратно в Хоринис, чтобы сообщить паладинам о магической руде.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

func void dia_angar_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_01");	//Все дело в золоте.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_02");	//Необходимо сообщить паладинам о магической руде, которую мы нашли на этом острове.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_03");	//Уверен, что было бы неплохо заработать на всем этом деле. Что скажешь?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_04");	//Не думаю, что это хорошая идея.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_05");	//По мне, так лучше не стоит лишний раз рисковать ради какой-то горстки золотых монет.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_07");	//Значит, ты против?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_08");	//Золото меня не интересует. И вряд ли я изменю свое мнение.
	B_LogEntry(TOPIC_CHANGECOURSE,"Ангара не интересует идея отправиться обратно в Хоринис ради небольшой кучки золота.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

