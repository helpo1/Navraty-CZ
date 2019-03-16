
instance DIA_ADDON_INEXTREMO_LUTTER_EXIT(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 999;
	condition = dia_addon_inextremo_lutter_exit_condition;
	information = dia_addon_inextremo_lutter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_lutter_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_lutter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_LUTTER_PICKPOCKET(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 900;
	condition = dia_addon_inextremo_lutter_pickpocket_condition;
	information = dia_addon_inextremo_lutter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_lutter_pickpocket_condition()
{
	return C_Beklauen(66,66);
};

func void dia_addon_inextremo_lutter_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
	Info_AddChoice(dia_addon_inextremo_lutter_pickpocket,Dialog_Back,dia_addon_inextremo_lutter_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_lutter_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_lutter_pickpocket_doit);
};

func void dia_addon_inextremo_lutter_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
};

func void dia_addon_inextremo_lutter_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
};


instance DIA_ADDON_INEXTREMO_LUTTER_HI(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 2;
	condition = dia_addon_inextremo_lutter_hi_condition;
	information = dia_addon_inextremo_lutter_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_lutter_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_lutter_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER3 == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_00");	//Vypadá to, že máme nového vůdce cechu!
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_01");	//Hmm... Asmal tě podcenil, i přesto, že on sám byl velmi silný.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_02");	//S tebou je lepší si nezahrávat. Sám si dám na tebe pozor.
			AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Hi_01_03");	//To doufám.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_04");	//Dobře, teď mi řekni, co ode mě potřebuješ?
			KILLMEMBER3 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_77");	//Na všechno se ptej Charlotte.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_78");	//Jmenoval jsi ji jako svého zástupce.
			AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Hi_01_79");	//Samozřejmě.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_05");	//Co tentokrát?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_06");	//Neruš mě!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_07");	//Jestli něco potřebuješ, jdi za Asmalem.
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_08");	//Nemám na tebe čas. Nech mě být!
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_09");	//Jestli něco potřebuješ, promluv si s Gillianem. On je náš šéf!
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	};
};

instance DIA_Addon_InExtremo_Lutter_Lute(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 1;
	condition = DIA_Addon_InExtremo_Lutter_Lute_condition;
	information = DIA_Addon_InExtremo_Lutter_Lute_info;
	permanent = FALSE;
	description = "Vzpomínám si, že jsi měl jeden zvláštní hudební nástroj.";
};

func int DIA_Addon_InExtremo_Lutter_Lute_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_Lutter_Lute_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_01");	//Vzpomínám si, že jsi měl jeden zvláštní hudební nástroj.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_02");	//(zaujatě) Ano, říká se mu trumšajt.
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_03");	//Dáš mi ho?
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_04");	//Dát ti ho? Víš alespoň, jak se na něj hraje?
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_05");	//Nikdy není pozdě se to naučit.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_06");	//To je pravda. Tady, vezmi si ho, už ho nejspíš nebudu potřebovat.
	B_GiveInvItems(self,other,ItMi_IEDrumScheit,1);
	Npc_RemoveInvItems(self,ItMi_IEDrumScheit,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_07");	//Díky!
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_08");	//Není zač.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Lutter mi dal trumšajt.");
};