
instance DIA_Fed_EXIT(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 999;
	condition = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fed_HALLO(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 2;
	condition = DIA_Fed_HALLO_Condition;
	information = DIA_Fed_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fed_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fed_HALLO_Info()
{
	AI_Output(self,other,"DIA_Fed_HALLO_08_00");	//Co ode mě chceš? Nikam nejdu!
	AI_Output(other,self,"DIA_Fed_HALLO_15_01");	//Klídek, v pohodě - nikdo po tobě nechce, abys někam chodil.
	AI_Output(self,other,"DIA_Fed_HALLO_08_02");	//Díky Innosovi. Však víš, během několika posledních dní opustilo pár chlapů tábor - a nikdo z nich se nevrátil.
	AI_Output(self,other,"DIA_Fed_HALLO_08_03");	//Všechny je sežrali chňapavci. Ale mě ne. Prostě tady zůstanu do tý doby, než to skončí.
};


instance DIA_Fed_Snapper(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 3;
	condition = DIA_Fed_Snapper_Condition;
	information = DIA_Fed_Snapper_Info;
	permanent = FALSE;
	description = "Co víš o chňapavcích?";
};


func int DIA_Fed_Snapper_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fed_Snapper_Info()
{
	AI_Output(other,self,"DIA_Fed_Snapper_15_00");	//Co víš o chňapavcích?
	AI_Output(self,other,"DIA_Fed_Snapper_08_01");	//Bilgot je v noci vídá. Několik z nich je dole u jezírka pod tmavou věží.
	AI_Output(self,other,"DIA_Fed_Snapper_08_02");	//Ostatní jsou přímo nad náma - nahoře na skále. Jen čekají, až se úplně vyčerpáme.
	AI_Output(self,other,"DIA_Fed_Snapper_08_03");	//Jsme tady v pasti. Brzo napadnou tábor - a udělají si krvavé hody...
	AI_Output(other,self,"DIA_Fed_Snapper_15_04");	//Aha.
};


instance DIA_Fed_Perm(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 5;
	condition = DIA_Fed_Perm_Condition;
	information = DIA_Fed_Perm_Info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};


func int DIA_Fed_Perm_Condition()
{
	return TRUE;
};

func void DIA_Fed_Perm_Info()
{
	AI_Output(other,self,"DIA_Fed_Perm_15_00");	//Jsi v pořádku?
	if(MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_01");	//Venku jsou chňapavci. Cítíš je...? Já je cítím...
	}
	else
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_02");	//Vypadá to, že se chňapavci stáhli. Ale to ještě nic neznamená. Oni se vrátí - nebo vlci nebo ještěrani nebo skřeti.
		AI_Output(self,other,"DIA_Fed_Perm_08_03");	//A dříve či později nás dostanou a pošmáknou si na našich mrtvolách...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fed_PICKPOCKET(C_Info)
{
	npc = STRF_1106_Fed;
	nr = 900;
	condition = DIA_Fed_PICKPOCKET_Condition;
	information = DIA_Fed_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fed_PICKPOCKET_Condition()
{
	return C_Beklauen(32,8);
};

func void DIA_Fed_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
	Info_AddChoice(DIA_Fed_PICKPOCKET,Dialog_Back,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fed_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

