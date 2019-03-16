
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
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_00");	//Значит, теперь ты - глава гильдии!
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_01");	//М-да... Асмал недооценил тебя, хотя и был крутым парнем.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_02");	//Выходит, с тобой лучше не связываться. Себе будет дороже!
			AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Hi_01_03");	//Выходит, что так.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_04");	//Ладно. Теперь говори, что тебе от меня нужно?
			KILLMEMBER3 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_77");	//По всем вопросам к Шарлотте, босс.
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_78");	//Ты ведь сам сделал ее своей помощницей!
			AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Hi_01_79");	//Ну да, конечно.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_05");	//Что на этот раз?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_06");	//Не мешай мне!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_07");	//Если тебе что-то нужно - иди к Асмалу.
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
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_08");	//Отстань! Не мешай мне отдыхать...
			AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_09");	//Если тебе что-то нужно - поговори c Гиллианом. Он у нас главный!
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
	description = "Помнится, у тебя был такой странный музыкальный инструмент.";
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
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_01");	//Помнится, у тебя был такой странный музыкальный инструмент.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_02");	//(небрежно) Если что, его называют - китаррон...
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_03");	//Отдашь его мне?
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_04");	//Тебе? А ты играть-то хоть на нем умеешь?
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_05");	//Ну, никогда не поздно научиться.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_06");	//А, ладно. Бери, если тебе он так нужен. Мне-то он тут без надобности.
	B_GiveInvItems(self,other,ItMi_IEDrumScheit,1);
	Npc_RemoveInvItems(self,ItMi_IEDrumScheit,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_Lutter_Lute_01_07");	//Благодарю.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_08");	//Да не за что.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Лютер отдал мне свой музыкальный инструмент.");
};