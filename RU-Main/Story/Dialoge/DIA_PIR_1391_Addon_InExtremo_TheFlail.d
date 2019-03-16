
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
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_00");	//Лихо ты разобрался с Асмалом!
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_01");	//Скажу честно - мы считали, что ты не на многое способен, но теперь...
			AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Hai_01_02");	//Теперь все будет по-другому.
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_03");	//Конечно, босс! Как скажешь.
			KILLMEMBER2 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_77");	//Если тебе что-то нужно, поговори с Шарлоттой.
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_78");	//Она ведь твоя помощница.
			AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Hi_01_79");	//Ну да, конечно.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hi_01_04");	//Что скажешь?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_05");	//Не отвлекай меня!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Hai_01_06");	//Оставь меня в покое!
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
	description = "Та лютня, на которой ты играл. Она еще при тебе?";
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
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_01");	//Та лютня, на которой ты играл. Она еще при тебе?
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_02");	//А где же ей быть...(смеется) Здесь она, родимая!
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_03");	//Тут просто такое дело, в общем, мне позарез нужен этот инструмент. 
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_04");	//Можешь отдать ее мне?
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_05");	//Для тебя, босс, все, что захочешь! Вот, держи.
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_06");	//Но погоди. А ты хоть играть на ней умеешь?
	AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Lute_01_07");	//Это сейчас неважно.
	B_GiveInvItems(self,other,ItMi_IELaute,1);
	Npc_RemoveInvItems(self,ItMi_IELaute,1);
	AI_Output(self,other,"DIA_Addon_InExtremo_TheFlail_Lute_01_08");	//Ну ладно. Как знаешь.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Флейл отдал мне свою лютню.");
};