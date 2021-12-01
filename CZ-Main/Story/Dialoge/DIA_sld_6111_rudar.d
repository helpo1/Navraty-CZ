
instance DIA_RUDAR_EXIT(C_Info)
{
	npc = sld_6111_rudar;
	nr = 999;
	condition = dia_rudar_exit_condition;
	information = dia_rudar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_rudar_exit_condition()
{
	return TRUE;
};

func void dia_rudar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUDAR_PICKPOCKET(C_Info)
{
	npc = sld_6111_rudar;
	nr = 900;
	condition = dia_rudar_pickpocket_condition;
	information = dia_rudar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_rudar_pickpocket_condition()
{
	return C_Beklauen(92,320);
};

func void dia_rudar_pickpocket_info()
{
	Info_ClearChoices(dia_rudar_pickpocket);
	Info_AddChoice(dia_rudar_pickpocket,Dialog_Back,dia_rudar_pickpocket_back);
	Info_AddChoice(dia_rudar_pickpocket,DIALOG_PICKPOCKET,dia_rudar_pickpocket_doit);
};

func void dia_rudar_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_rudar_pickpocket);
};

func void dia_rudar_pickpocket_back()
{
	Info_ClearChoices(dia_rudar_pickpocket);
};


instance DIA_RUDAR_HALLO(C_Info)
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hallo_condition;
	information = dia_rudar_hallo_info;
	permanent = FALSE;
	description = "Líbí se ti zde?";
};


func int dia_rudar_hallo_condition()
{
	if((MIS_KILLTARGET5 == LOG_Running) && Wld_IsTime(22,0,8,0))
	{
		return TRUE;
	};
};

func void dia_rudar_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Rudar_Hallo_01_00");	//Líbí se ti zde?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_01");	//Jak vidíš, tak ano. Dá se jen zřídka vybrat si kam nás cesty zavedou. A co tu děláš ty?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_02");	//Řekněme-li, že tu mám problém s jedním člověkem.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_03");	//A co je to za problém?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_04");	//Můj problém jsi ty!
	AI_Output(self,other,"DIA_Rudar_Hallo_01_05");	//(udiveně) CO?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_06");	//Skoro se neznáme, jaké problémy můžeme mít?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_07");	//Mezi námi nejsou, ale mezi tebou a někým jiným - to tu teď budu řešit.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_08");	//A kdo je ta osoba, se kterou mám problémy?
	AI_Output(other,self,"DIA_Rudar_Hallo_01_09");	//Asmal! Říká ti to něco?
	AI_Output(self,other,"DIA_Rudar_Hallo_01_10");	//Hmm... Teď je mi to jasné, pracuješ pro něj. To znamená jedinou věc.
	AI_Output(other,self,"DIA_Rudar_Hallo_01_11");	//Takže už to chápeš.
	AI_Output(self,other,"DIA_Rudar_Hallo_01_12");	//Proč nepřišel on? Bojí se, že ho zabiju?!
	AI_Output(other,self,"DIA_Rudar_Hallo_01_13");	//Má zajímavější věci na práci!
	AI_Output(self,other,"DIA_Rudar_Hallo_01_14");	//Pak neztrácejme čas! Dáme se do toho.
	AI_Output(other,self,"DIA_Rudar_Hallo_01_15");	//Braň se!
	AI_StopProcessInfos(self);
	AI_Standup(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};


instance DIA_RUDAR_HAI(C_Info)
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hai_condition;
	information = dia_rudar_hai_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rudar_hai_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_rudar_hai_info()
{
	AI_Output(self,other,"DIA_Rudar_Hai_01_00");	//Ne! Nemám čas!
	AI_Output(self,other,"DIA_Rudar_Hai_01_01");	//Promluvíme si jak dokončím práci.
	AI_StopProcessInfos(self);
};

