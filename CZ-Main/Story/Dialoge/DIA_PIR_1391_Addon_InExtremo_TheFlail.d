
instance DIA_ADDON_INEXTREMO_THEFLAIL_EXIT(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 999;
	condition = dia_addon_inextremo_theflail_exit_condition;
	information = dia_addon_inextremo_theflail_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_theflail_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_theflail_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_THEFLAIL_PICKPOCKET(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 900;
	condition = dia_addon_inextremo_theflail_pickpocket_condition;
	information = dia_addon_inextremo_theflail_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_theflail_pickpocket_condition()
{
	return C_Beklauen(80,100);
};

func void dia_addon_inextremo_theflail_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
	Info_AddChoice(dia_addon_inextremo_theflail_pickpocket,Dialog_Back,dia_addon_inextremo_theflail_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_theflail_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_theflail_pickpocket_doit);
};

func void dia_addon_inextremo_theflail_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
};

func void dia_addon_inextremo_theflail_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
};


instance DIA_ADDON_INEXTREMO_THEFLAIL_HAI(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 2;
	condition = dia_addon_inextremo_theflail_hai_condition;
	information = dia_addon_inextremo_theflail_hai_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_theflail_hai_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_theflail_hai_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER2 == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_00");	//Statečně jsi bojoval s Asmalem!
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_01");	//Upřímně řečeno, předtím jsme si všichni mysleli, že na hodně věcí nemáš, ale teď... (s úctou)
			AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Hai_01_02");	//Nyní je vše jiné, ne jako dřív.
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_03");	//Zajisté, šéfe! Jak nařídíte.
			KILLMEMBER2 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_77");	//Na všechny otázky se ptej Charlotte.
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_78");	//Jmenoval jsi ji jako svého zástupce.
			AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Hi_01_79");	//Samozřejmě.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_04");	//Co říkáš?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_05");	//Nevyrušuj mě!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_06");	//Nech mě na pokoji!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

instance DIA_Addon_InExtremo_TheFlail_Lute(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 1;
	condition = DIA_Addon_InExtremo_TheFlail_Lute_condition;
	information = DIA_Addon_InExtremo_TheFlail_Lute_info;
	permanent = FALSE;
	description = "Ta loutna, na kterou jsi hrál. Máš ji ještě u sebe?";
};

func int DIA_Addon_InExtremo_TheFlail_Lute_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_TheFlail_Lute_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_01");	//Ta loutna, na kterou jsi hrál. Máš ji ještě u sebe?
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_02");	//A kde jinde by měla být... (směje se) Tady je, drahoušek můj!
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_03");	//Je tu taková záležitost, jednoduše teď zoufale potřebuji tento nástroj.
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_04");	//Můžeš mi ji dát?
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_05");	//Pro tebe, šéfe, co jen chceš! Tady máš.
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_06");	//Počkej, víš alespoň, jak na ni hrát?
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_07");	//Na tom teď nezáleží.
	B_GiveInvItems(self,other,ItMi_IELaute,1);
	Npc_RemoveInvItems(self,ItMi_IELaute,1);
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_08");	//Dobře. Jak myslíš.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Flail mi dal svou loutnu.");
};