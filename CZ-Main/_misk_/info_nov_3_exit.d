
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
	description = "Mohu se připojit k táboru?";
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
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Mohu se připojit k táboru?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Je to velmi jednoduché.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Promluv si s Guru.
};


instance INFO_NOV_3_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_3_wichtigepersonen_condition;
	information = info_nov_3_wichtigepersonen_info;
	permanent = 1;
	description = "Kdo tu má hlavní slovo?";
};


func int info_nov_3_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_3_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Kdo tu má hlavní slovo?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Baal Orun, nejstarší Guru! On nás sem přivedl.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Vše se řídí dle jeho vůle.
};


instance INFO_NOV_3_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_3_daslager_condition;
	information = info_nov_3_daslager_info;
	permanent = 1;
	description = "Je tu něco, co by mě mělo zajímat?";
};


func int info_nov_3_daslager_condition()
{
	return TRUE;
};

func void info_nov_3_daslager_info()
{
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Je tu něco, co by mě mělo zajímat?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Jistě, Talas, každý den ti dá příděl trávy.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Najdeš ho na dřevěné plošině.
};


instance INFO_NOV_3_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_3_dielage_condition;
	information = info_nov_3_dielage_info;
	permanent = 1;
	description = "Co se děje?";
};


func int info_nov_3_dielage_condition()
{
	return TRUE;
};

func void info_nov_3_dielage_info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Co se děje?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Nic důležitého, příteli.
};


instance INFO_NOV_3_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_3_sekteheilen_condition;
	information = info_nov_3_sekteheilen_info;
	permanent = TRUE;
	description = "Vypij ten lektvar! Pomůže ti od bolesti hlavy.";
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
	AI_Output(other,self,"Info_Nov_3_SekteHeilen_01_00");	//Vypij ten lektvar! Pomůže ti od bolesti hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_3_SekteHeilen_01_01");	//Moje hlava! Už nebolí!
	AI_Output(self,other,"Info_Nov_3_SekteHeilen_01_02");	//Moc ti děkuji.
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

