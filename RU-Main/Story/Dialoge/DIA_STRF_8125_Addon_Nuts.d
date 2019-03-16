
instance DIA_STRF_8125_Addon_Nuts_EXIT(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 999;
	condition = DIA_STRF_8125_Addon_Nuts_EXIT_Condition;
	information = DIA_STRF_8125_Addon_Nuts_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8125_Addon_Nuts_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8125_Addon_Nuts_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_PreHello(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 2;
	condition = DIA_STRF_8125_Addon_Nuts_PreHello_condition;
	information = DIA_STRF_8125_Addon_Nuts_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8125_Addon_Nuts_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NutsRest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_PreHello_01_00");	//Эй, не мешай мне работать! Поговорим позже.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_NotWork(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_NotWork_Condition;
	information = DIA_STRF_8125_Addon_Nuts_NotWork_Info;
	permanent = FALSE;
	description = "Да я смотрю, ты тут особо и не работаешь.";
};

func int DIA_STRF_8125_Addon_Nuts_NotWork_Condition()
{
	if(NutsRest == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_NotWork_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_00");	//Да я смотрю, ты тут особо и не работаешь.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_01");	//Ну...(лукаво) Только когда этот орк охранник спит.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_02");	//А спит он, по всей видимости, очень долго.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_03");	//Даже если так...(растерянно) Кто об этом узнает?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_04");	//Я мог бы рассказать про тебя оркам.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_05");	//Но ты ведь этого не сделаешь? Правда?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_06");	//Не сделаю. Если только поможешь мне в одном деле.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_07");	//Что тебе от меня нужно?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_NotWork_01_08");	//Да ладно, расслабься! Я просто пошутил.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_NotWork_01_09");	//Ну и шутки у тебя, приятель...(нервно) Так можно и последние нервы потерять!
};

instance DIA_STRF_8125_Addon_Nuts_YouHereLongTime(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition;
	information = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info;
	permanent = FALSE;
	description = "Ты здесь давно?";
};

func int DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_00");	//Ты здесь давно?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_01");	//По правде говоря, я уже потерял счет времени. 
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_02");	//Но если орки и дальше будут заставлять меня столько работать, долго я тут не протяну.
};

instance DIA_STRF_8125_Addon_Nuts_Teleport(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Teleport_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Teleport_Info;
	permanent = FALSE;
	description = "Чем ты тут занимаешься, когда... работаешь?";
};

func int DIA_STRF_8125_Addon_Nuts_Teleport_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Teleport_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_00");	//Чем ты тут занимаешься, когда... работаешь?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_01");	//Ты будешь удивлен, но я читаю.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_02");	//Читаешь? Что тут можно читать?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_03");	//В этой пещере я нашел одну старую каменную табличку.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_04");	//Язык в ней немного похож на человеческий. Хотя точно не уверен.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_05");	//Дашь взглянуть?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_06");	//Эй, руки прочь! Считай, это единственная вещь, которая наполняет хоть каким-то смыслом всю мою жизнь.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_07");	//Даже так?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_08");	//Конечно! Ведь кроме орков и этой проклятой жилы я больше уже тут ничего не увижу.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Teleport_01_09");	//А так хоть какое то разнообразие!
};

instance DIA_STRF_8125_Addon_Nuts_Want(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Want_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Want_Info;
	permanent = FALSE;
	description = "Что ты хочешь за свою табличку?";
};

func int DIA_STRF_8125_Addon_Nuts_Want_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_Teleport) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Want_Info()
{
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_00");	//Что ты хочешь за свою табличку?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_01");	//Хммм...(лукаво) Вообще-то она для меня бесценна!
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_02");	//Но раз уж ты спросил... Полагаю, что хорошая книга будет достойной заменой для нее.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_03");	//И желательно про звезды.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_04");	//Про звезды?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_05");	//Я всегда любил наблюдать за звездами. Даже еще когда был мальчишкой!
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_06");	//Но судьба распорядилась иначе...(обреченно) И теперь я их вряд ли когда-либо увижу.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_Want_01_07");	//Но зато хотя бы почитаю про них.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_08");	//Понимаю.
	MIS_Astronomy = LOG_Running;
	Log_CreateTopic(TOPIC_Astronomy,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Running);
	B_LogEntry(TOPIC_Astronomy,"В обмен на свою табличку Нутс хочет заполучить какую-нибудь книгу - и желательно про звезды.");
};

instance DIA_STRF_8125_Addon_Nuts_WantDone(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_WantDone_Condition;
	information = DIA_STRF_8125_Addon_Nuts_WantDone_Info;
	permanent = FALSE;
	description = "Вот нужная тебе книга.";
};

func int DIA_STRF_8125_Addon_Nuts_WantDone_Condition()
{
	if((MIS_Astronomy == LOG_Running) && (Npc_HasItems(other,ASTRONOMIE) >= 1) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_WantDone_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_00");	//Вот нужная тебе книга.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_01");	//Хммм...(недоверчиво) А она хоть интересная?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_02");	//Ну, все как ты и просил. Про звезды там...
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_03");	//Лучше дай я посмотрю.
	B_GiveInvItems(other,self,ASTRONOMIE,1);
	Npc_RemoveInvItems(self,ASTRONOMIE,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_04");	//Отлично, приятель! Похоже, что именно это мне и надо!
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_05");	//А как насчет нашего уговора?
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_06");	//Все в силе! Вот - держи ту табличку.
	B_GiveInvItems(self,other,ItWr_OldTextMine,1);
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_07");	//А книгу, значит, я оставлю себе, да?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_08");	//Конечно.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_09");	//Кстати, этой табличкой интересовался в свое время Кроу.
	AI_Output(self,other,"DIA_STRF_8125_Addon_Nuts_WantDone_01_10");	//Ну, это я так, к слову...
	RT_Respect = RT_Respect + 1;
	MIS_Astronomy = LOG_Success;
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Success);
	B_LogEntry(TOPIC_Astronomy,"Я принес книгу Нутсу.");
};