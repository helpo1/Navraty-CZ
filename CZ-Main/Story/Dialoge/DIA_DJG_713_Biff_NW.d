
instance DIA_Biff_NW_EXIT(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 999;
	condition = DIA_Biff_NW_EXIT_Condition;
	information = DIA_Biff_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_HAfen(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 5;
	condition = DIA_Biff_NW_HAfen_Condition;
	information = DIA_Biff_NW_HAfen_Info;
	permanent = TRUE;
	description = "Fajn. Ale už brzy.";
};


func int DIA_Biff_NW_HAfen_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Biff_NW_HAfen_Info()
{
	AI_Output(other,self,"DIA_Biff_NW_HAfen_15_00");	//Fajn. Ale už brzy.
	AI_Output(self,other,"DIA_Biff_NW_HAfen_07_01");	//Nemůžu čekat.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Biff_NW_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 900;
	condition = DIA_Biff_NW_PICKPOCKET_Condition;
	information = DIA_Biff_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Biff_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(92,250);
};

func void DIA_Biff_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,Dialog_Back,DIA_Biff_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_NW_PICKPOCKET_DoIt);
};

func void DIA_Biff_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};

func void DIA_Biff_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_NW_PICKPOCKET);
};


instance DIA_BIFF_NW_KAPITELORCATTACK(C_Info)
{
	npc = DJG_713_Biff_NW;
	nr = 1;
	condition = dia_biff_nw_kapitelorcattack_condition;
	information = dia_biff_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Co máš v plánu?";
};


func int dia_biff_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BIFFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_00");	//Co máš v plánu?
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_01");	//To přesně nevím... Ale dost možná si cestu uvolním sekyrou!
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_02");	//Jsi si jistý, že se ti to povede?!
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_03");	//Kdybych si nebyl, nebyl bych lovcem draků.
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_04");	//Dobrá, potkáme se na farmě.
	AI_Output(other,self,"DIA_Biff_NW_KapitelOrcAttack_01_05");	//Ale doufám, že tě nevidím naposled.
	AI_Output(self,other,"DIA_Biff_NW_KapitelOrcAttack_01_06");	//To se ještě ukáže.
	B_LogEntry(TOPIC_HELPCREW,"Biff se chce probít městem - je to lovec draků, určitě se mu to povede!");
	BIFFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

