
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
	description = "Jak se přidám k táboru?";
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
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Jak se přidám k táboru?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Není nic jednoduššího. Promluv si s mladšími Guru a oni ti pomůžou.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Bude se ti tady líbit, věř mi.
};


instance INFO_NOV_5_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_nov_5_wichtigepersonen_condition;
	information = info_nov_5_wichtigepersonen_info;
	permanent = 1;
	description = "Kdo to tu vede?";
};


func int info_nov_5_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_nov_5_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Kdo to tu vede?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Guru mají hlavní slovo. Ale pokud se ničím neproviníš, nebudou se o tebe vůbec zajímat.
};


instance INFO_NOV_5_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_nov_5_daslager_condition;
	information = info_nov_5_daslager_info;
	permanent = 1;
	description = "Řekni mi něco o táboře.";
};


func int info_nov_5_daslager_condition()
{
	return TRUE;
};

func void info_nov_5_daslager_info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Řekni mi něco o táboře.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Toto je nejlepší místo, kde jsme mohli postavit nový tábor.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//Dokonce i když nejsi jedním z nás, můžeš zde dostat jídlo a trávu. Stačí si promluvit s Talasem.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Kde ho najdu?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//Většinou je na plošině nad kovárnou.
};


instance INFO_NOV_5_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_nov_5_dielage_condition;
	information = info_nov_5_dielage_info;
	permanent = 1;
	description = "Co se děje?";
};


func int info_nov_5_dielage_condition()
{
	return TRUE;
};

func void info_nov_5_dielage_info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Co se děje?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Nic neobvyklého. Jsi tady nový?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Právě jsem přišel.
};


instance INFO_NOV_5_SEKTEHEILEN(C_Info)
{
	nr = 1;
	condition = info_nov_5_sekteheilen_condition;
	information = info_nov_5_sekteheilen_info;
	permanent = TRUE;
	description = "Vypij to, pomůže ti od bolesti.";
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
	AI_Output(other,self,"Info_Nov_5_SekteHeilen_01_00");	//Vypij to, pomůže ti od bolesti.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	self.aivar[AIV_MM_SleepEnd] = TRUE;
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Wait(self,0);
	AI_Output(self,other,"Info_Nov_5_SekteHeilen_01_01");	//Moje hlava! Nebolí!
	AI_Output(self,other,"Info_Nov_5_SekteHeilen_01_02");	//Moc ti děkuji!
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

