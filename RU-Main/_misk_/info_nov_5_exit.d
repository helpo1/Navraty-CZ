
instance INFO_NOV_5_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_5_exit_condition;
	information = info_nov_5_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_5_exit_condition()
{
	return TRUE;
};

func void info_nov_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_5_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_5_einervoneuchwerden_condition;
	information = info_nov_5_einervoneuchwerden_info;
	permanent = 1;
	description = "Как мне присоединиться к этому Лагерю?";
};


func int info_nov_5_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_5_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Как можно присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Нет ничего проще. Поговори с младшими Гуру, они помогут тебе.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Тебе здесь понравится, вот увидишь.
};


instance INFO_NOV_5_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_5_wichtigepersonen_condition;
	information = info_nov_5_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_nov_5_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Здесь все под властью Гуру. Но если ты не будешь привлекать к себе внимания, они тебя не тронут.
};


instance INFO_NOV_5_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_5_daslager_condition;
	information = info_nov_5_daslager_info;
	permanent = 1;
	description = "Расскажи мне об этом Лагере.";
};


func int info_nov_5_daslager_condition()
{
	return TRUE;
};

func void info_nov_5_daslager_info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Это лучшее место, где можно было организовать наш новый лагерь.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//Даже если ты не являешься одним из нас, ты все равно получишь здесь еду и болотник. Все что тебе нужно, это поговорить с Талласом.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Где мне его найти?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//Он на площадке над кузней.
};


instance INFO_NOV_5_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_5_dielage_condition;
	information = info_nov_5_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_nov_5_dielage_condition()
{
	return TRUE;
};

func void info_nov_5_dielage_info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Пожаловаться не на что. Скажи, ты новенький?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Я только что прибыл.
};


instance INFO_NOV_5_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_5_sekteheilen_condition;
	information = info_nov_5_sekteheilen_info;
	permanent = TRUE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int info_nov_5_sekteheilen_condition()
{
	if((self.aivar[AIV_MM_SleepEnd] == FALSE) && (Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void info_nov_5_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"Info_Nov_5_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_5_SekteHeilen_01_01");	//Моя голова - он больше не болит!!!
	AI_Output(self,other,"Info_Nov_5_SekteHeilen_01_02");	//Огромное спасибо тебе!
};

func void b_assignambientinfos_sek_5(var C_Npc slf)
{
	info_nov_5_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_5_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_5_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_5_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_5_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_5_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

