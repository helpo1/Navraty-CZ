
instance DIA_STRF_8123_Addon_Elk_EXIT(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 999;
	condition = DIA_STRF_8123_Addon_Elk_exit_condition;
	information = DIA_STRF_8123_Addon_Elk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8123_Addon_Elk_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8123_Addon_Elk_HELLO(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_hello_condition;
	information = DIA_STRF_8123_Addon_Elk_hello_info;
	permanent = FALSE;
	description = "Как ты?";
};

func int DIA_STRF_8123_Addon_Elk_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Hello_15_00");	//Как ты?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Hello_08_00");	//Бывало и лучше.
};

instance DIA_STRF_8123_Addon_Elk_Help(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_Help_condition;
	information = DIA_STRF_8123_Addon_Elk_Help_info;
	permanent = FALSE;
	description = "Помощь не нужна?";
};

func int DIA_STRF_8123_Addon_Elk_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8123_Addon_Elk_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_00");	//Помощь не нужна?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_01");	//Хочешь вместо меня подолбить эту жилу? Давай, я не против!
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_02");	//Нет, я имел в виду нечто иное.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_03");	//Если хочешь действительно помочь, лучше достань для меня нормальную кирку.
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_04");	//А с этой что не так?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_05");	//Эта уже настолько стара, что вот-вот сломается! А орки требуют все больше и больше руды.
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_06");	//Почему бы тебе самому не попросить ее у них?
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_07");	//Как же...(печально) Тут чуть рот откроешь, сразу получишь от них втык в ребра.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_08");	//Так что приходится самому хорошенько следить за своим инструментом.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_Help_01_09");	//Но всему же есть предел!
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Help_01_10");	//Ладно, поищу для тебя новую.
	MIS_ElkKirka = LOG_Running;
	Log_CreateTopic(TOPIC_ElkKirka,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Running);
	B_LogEntry(TOPIC_ElkKirka,"Элку нужна новая кирка. Его старая вот-вот сломается, а у орков новых инструментов не допросишься.");
};

instance DIA_STRF_8123_Addon_Elk_FakeKirka(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_FakeKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_FakeKirka_info;
	permanent = FALSE;
	description = "У меня есть для тебя кирка.";
};

func int DIA_STRF_8123_Addon_Elk_FakeKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (Npc_HasItems(hero,ItMw_2H_Axe_L_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_FakeKirka_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_00");	//У меня есть для тебя кирка.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_01");	//И что это? Такое же старье, как и у меня.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_02");	//Парень, достань мне нормальную кирку!
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_FakeKirka_01_03");	//Такую, чтобы она не разлетелась в щепки после первого же удара.
	ElkNeedNewKirka = TRUE;
};

instance DIA_STRF_8123_Addon_Elk_NewKirka(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_NewKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_NewKirka_info;
	permanent = FALSE;
	description = "А как тебе эта?";
};

func int DIA_STRF_8123_Addon_Elk_NewKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (Npc_HasItems(hero,ItMw_Kirka_New) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_NewKirka_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_NewKirka_01_00");	//А как тебе эта?
	B_GiveInvItems(other,self,ItMw_Kirka_New,1);
	Npc_RemoveInvItems(self,ItMw_Kirka_New,1);
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_01");	//Хммм. Вот это совсем другое дело!
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_02");	//С таким инструментом я наколочу дневную норму одним махом.
	AI_Output(self,other,"DIA_STRF_8123_Addon_Elk_NewKirka_01_03");	//Спасибо тебе, приятель!
	RT_Respect = RT_Respect + 1;
	MIS_ElkKirka = LOG_Success;
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Success);
	B_LogEntry(TOPIC_ElkKirka,"Я достал для Элка новую кирку.");
};