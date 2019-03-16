
instance INFO_NOV_2_EXIT(C_Info)
{
	nr = 999;
	condition = info_nov_2_exit_condition;
	information = info_nov_2_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_nov_2_exit_condition()
{
	return TRUE;
};

func void info_nov_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NOV_2_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_2_einervoneuchwerden_condition;
	information = info_nov_2_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу присоединиться к вам.";
};


func int info_nov_2_einervoneuchwerden_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void info_nov_2_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//Ты решил послужить Братству? Перед тобой открыт путь к удаче и процветанию!
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//Поговори с Идолом Ораном. Он решит, чем тебе лучше заниматься.
};


instance INFO_NOV_2_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_2_wichtigepersonen_condition;
	information = info_nov_2_wichtigepersonen_info;
	permanent = 1;
	description = "Кто возглавляет вас?";
};


func int info_nov_2_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//Кто возглавляет вас?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//Наши наставники - Гуру. Они очень могущественные и мудрые люди!
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//Они наставляют нас на путь истины и даруют нам божественное просвещение.
};


instance INFO_NOV_2_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_2_daslager_condition;
	information = info_nov_2_daslager_info;
	permanent = 1;
	description = "Расскажи мне об этом месте.";
};


func int info_nov_2_daslager_condition()
{
	return TRUE;
};

func void info_nov_2_daslager_info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//Расскажи мне об этом месте.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//Это место веры, брат. Все, что у нас есть, мы готовы разделить с каждым, кто верит в учение Идолов.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//Поговори с одним из Гуру, обогати свою душу.
};


instance INFO_NOV_2_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_2_dielage_condition;
	information = info_nov_2_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_nov_2_dielage_condition()
{
	return TRUE;
};

func void info_nov_2_dielage_info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//У меня не так много времени. Всегда есть дела.
};


instance INFO_NOV_2_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_2_sekteheilen_condition;
	information = info_nov_2_sekteheilen_info;
	permanent = TRUE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int info_nov_2_sekteheilen_condition()
{
	if((self.aivar[AIV_MM_SleepEnd] == FALSE) && (Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void info_nov_2_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"Info_Nov_2_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_2_SekteHeilen_01_01");	//Моя голова - он больше не болит!!!
	AI_Output(self,other,"Info_Nov_2_SekteHeilen_01_02");	//Огромное спасибо тебе!
};

func void b_assignambientinfos_sek_2(var C_Npc slf)
{
	info_nov_2_exit.npc = Hlp_GetInstanceID(slf);
	info_nov_2_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_nov_2_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_nov_2_daslager.npc = Hlp_GetInstanceID(slf);
	info_nov_2_dielage.npc = Hlp_GetInstanceID(slf);
	info_nov_2_sekteheilen.npc = Hlp_GetInstanceID(slf);
};

