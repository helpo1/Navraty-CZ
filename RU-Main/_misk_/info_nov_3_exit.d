
instance INFO_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_3_exit_condition;
	information = info_nov_3_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_3_exit_condition()
{
	return TRUE;
};

func void info_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_3_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_3_einervoneuchwerden_condition;
	information = info_nov_3_einervoneuchwerden_info;
	permanent = 1;
	description = "Как мне присоединиться к этому Лагерю?";
};


func int info_nov_3_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_3_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Как мне присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Это очень просто. Иди, друг.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Поговори с Гуру - они наставят тебя на путь истинный.
};


instance INFO_NOV_3_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_3_wichtigepersonen_condition;
	information = info_nov_3_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int info_nov_3_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Идол Оран - старший среди Гуру! Он привел нас в это славное место.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Все это было создано по его воле.
};


instance INFO_NOV_3_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_3_daslager_condition;
	information = info_nov_3_daslager_info;
	permanent = 1;
	description = "На что здесь стоит обратить внимание? ";
};


func int info_nov_3_daslager_condition()
{
	return TRUE;
};

func void info_nov_3_daslager_info()
{
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Расскажи мне что-нибудь об этом месте.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Здесь есть такой Таллас. Он бесплатно дает болотник всем последователям секты.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Ты найдешь его на площадке над кузней.
};


instance INFO_NOV_3_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_3_dielage_condition;
	information = info_nov_3_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_nov_3_dielage_condition()
{
	return TRUE;
};

func void info_nov_3_dielage_info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Я на небесах, приятель!
};


instance INFO_NOV_3_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_3_sekteheilen_condition;
	information = info_nov_3_sekteheilen_info;
	permanent = TRUE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int info_nov_3_sekteheilen_condition()
{
	if((self.aivar[AIV_MM_SleepEnd] == FALSE) && (Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void info_nov_3_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"Info_Nov_3_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_3_SekteHeilen_01_01");	//Моя голова - он больше не болит!!!
	AI_Output(self,other,"Info_Nov_3_SekteHeilen_01_02");	//Огромное спасибо тебе!
};

func void b_assignambientinfos_sek_3(var C_Npc slf)
{
	info_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_3_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_3_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_3_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_3_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_3_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

