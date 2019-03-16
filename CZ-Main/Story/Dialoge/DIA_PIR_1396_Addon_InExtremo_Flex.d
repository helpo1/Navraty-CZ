
instance DIA_ADDON_INEXTREMO_FLEX_EXIT(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 999;
	condition = dia_addon_inextremo_flex_exit_condition;
	information = dia_addon_inextremo_flex_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_flex_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_flex_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_FLEX_PICKPOCKET(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 900;
	condition = dia_addon_inextremo_flex_pickpocket_condition;
	information = dia_addon_inextremo_flex_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_flex_pickpocket_condition()
{
	return C_Beklauen(65,100);
};

func void dia_addon_inextremo_flex_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
	Info_AddChoice(dia_addon_inextremo_flex_pickpocket,Dialog_Back,dia_addon_inextremo_flex_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_flex_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_flex_pickpocket_doit);
};

func void dia_addon_inextremo_flex_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
};

func void dia_addon_inextremo_flex_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
};


instance DIA_ADDON_INEXTREMO_FLEX_HI(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 1;
	condition = dia_addon_inextremo_flex_hi_condition;
	information = dia_addon_inextremo_flex_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_flex_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_flex_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER4 == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_00");	//(překvapeně) Hej, chlape, jak se ti povedlo nakopat zadek Asmalovi?
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_01");	//Dosud si to nedokážu představit... (smích) Je dobře, že ti lidé jako Asmal nedělají žádný problém.
			AI_Output(other,self,"DIA_Addon_InExtremo_Flex_Hi_01_02");	//Chceš si to ověřit?
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_03");	//Ne, ne! Co blázníš? (vystrašeně) Já jen... zapomeň na to!
			KILLMEMBER4 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_77");	//Na všechno se ptej Charlotte, šéfe.
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_78");	//Jmenoval jsi ji jako svého zástupce.
			AI_Output(other,self,"DIA_Addon_InExtremo_Flex_Hi_01_79");	//Samozřejmě.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_04");	//Co se děje, šéfe?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_05");	//Nerozptyluj mě!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_06");	//Zmiz! Nech mě odpočívat...
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

instance DIA_Addon_InExtremo_Flex_DudelBlau(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 1;
	condition = DIA_Addon_InExtremo_Flex_DudelBlau_condition;
	information = DIA_Addon_InExtremo_Flex_DudelBlau_info;
	permanent = FALSE;
	description = "Vzpomínám si, že máš dudy.";
};

func int DIA_Addon_InExtremo_Flex_DudelBlau_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_Flex_DudelBlau_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_01");	//Vzpomínám si, že máš dudy.
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_02");	//No, to opravdu mám. (pobaveně) Proč tě to zajímá?
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_03");	//Chci se na ně naučit hrát.
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_04");	//Mohl bys mi je dát?
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_05");	//Ano, proč ne. Stejně jsou mi teď k ničemu.
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_06");	//Tady je máš. Jen do nich neduj příliš silně, nejsou už nejnovější.
	B_GiveInvItems(self,other,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(self,ItMi_IEDudelBlau,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_07");	//Díky!
	B_LogEntry(TOPIC_KASSIAMUSIC,"Flex mi dal dudy.");
};