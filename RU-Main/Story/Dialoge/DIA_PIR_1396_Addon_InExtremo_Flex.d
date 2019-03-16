
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
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_00");	//(удивленно) Эй, парень! Как это дебе удалось надрать задницу Асмалу?
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_01");	//До сих пор представить не могу...(смеется) А ты, видать, крутой, если такие люди, как Асмал, для тебя не проблема.
			AI_Output(other,self,"DIA_Addon_InExtremo_Flex_Hi_01_02");	//Есть немного. Хочешь проверить?
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_03");	//Нет, нет! Что ты! (испуганно) Это я так... в общем, забудь об этом.
			KILLMEMBER4 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_77");	//По всем вопросам к Шарлотте, босс.
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_78");	//Ты ведь сам назначил ее своей помощницей.
			AI_Output(other,self,"DIA_Addon_InExtremo_Flex_Hi_01_79");	//Ну да, конечно.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_04");	//Как дела, босс?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_05");	//Не отвлекай меня!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Flex_Hi_01_06");	//Отстань! Не мешай мне отдыхать...
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
	description = "Я помню, у тебя была волынка.";
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
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_01");	//Я помню, у тебя была волынка.
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_02");	//Ну, была...(смеется) А тебе-то она зачем?
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_03");	//Да так, просто хочу научиться играть на ней.
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_04");	//Можешь отдать ее мне? 
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_05");	//Да, почему бы и нет. Все равно от нее тут никакой пользы.
	AI_Output(self,other,"DIA_Addon_InExtremo_Flex_DudelBlau_01_06");	//Вот, забирай. Только сильно не дуй! А то у нее немного меха порваны.
	B_GiveInvItems(self,other,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(self,ItMi_IEDudelBlau,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_07");	//Спасибо!
	B_LogEntry(TOPIC_KASSIAMUSIC,"Флекс отдал мне свою волынку.");
};