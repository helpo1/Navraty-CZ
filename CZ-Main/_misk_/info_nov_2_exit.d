
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
	description = "Chci se k vám přidat.";
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
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//Chci se k vám přidat.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//Rozhodl ses přidat k Bratrstvu? Cesta úspěchu je ti otevřena!
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//Promluv si s Baalem Orunem. Ten to bude řešit.
};


instance INFO_NOV_2_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_2_wichtigepersonen_condition;
	information = info_nov_2_wichtigepersonen_info;
	permanent = 1;
	description = "Kdo tu velí?";
};


func int info_nov_2_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_2_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//Kdo tu velí?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//Guru. Oni nás vedou stezkou dobrých mravů a poznání.
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//Oni nás vyučují a poskytují božské znalosti.
};


instance INFO_NOV_2_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_2_daslager_condition;
	information = info_nov_2_daslager_info;
	permanent = 1;
	description = "Řekni mi o tomto místě.";
};


func int info_nov_2_daslager_condition()
{
	return TRUE;
};

func void info_nov_2_daslager_info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//Řekni mi o tomto místě.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//Toto je místo víry, bratře. 
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//Promluv si s jedním z Guru.
};


instance INFO_NOV_2_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_2_dielage_condition;
	information = info_nov_2_dielage_info;
	permanent = 1;
	description = "Co se děje?";
};


func int info_nov_2_dielage_condition()
{
	return TRUE;
};

func void info_nov_2_dielage_info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//Co se děje?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//Nic strašného. Pokaždé se něco najde.
};


instance INFO_NOV_2_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_2_sekteheilen_condition;
	information = info_nov_2_sekteheilen_info;
	permanent = TRUE;
	description = "Vypij ten lektvar! Pomůže ti od bolesti hlavy.";
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
	AI_Output(other,self,"Info_Nov_2_SekteHeilen_01_00");	//Vypij ten lektvar! Pomůže ti od bolesti hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_2_SekteHeilen_01_01");	//Moje hlava! Už nebolí!
	AI_Output(self,other,"Info_Nov_2_SekteHeilen_01_02");	//Moc ti děkuji.
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

