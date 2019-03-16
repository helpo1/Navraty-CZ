
instance DIA_ADDON_INEXTREMO_DRPYMONTE_EXIT(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 999;
	condition = dia_addon_inextremo_drpymonte_exit_condition;
	information = dia_addon_inextremo_drpymonte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_drpymonte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_drpymonte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_PICKPOCKET(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 900;
	condition = dia_addon_inextremo_drpymonte_pickpocket_condition;
	information = dia_addon_inextremo_drpymonte_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_drpymonte_pickpocket_condition()
{
	return C_Beklauen(80,100);
};

func void dia_addon_inextremo_drpymonte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,Dialog_Back,dia_addon_inextremo_drpymonte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_drpymonte_pickpocket_doit);
};

func void dia_addon_inextremo_drpymonte_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};

func void dia_addon_inextremo_drpymonte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_HI(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 2;
	condition = dia_addon_inextremo_drpymonte_hi_condition;
	information = dia_addon_inextremo_drpymonte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_drpymonte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_drpymonte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER1 == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_00");	//Тебе удалось прикончить Асмала? Я потрясен!
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_01");	//Уж думал, это никому не удастся.
			AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Hi_01_02");	//Выходит, что ты ошибался.
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_03");	//Выходит, что так. Ну что ж, теперь ты тут за главного.
			KILLMEMBER1 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_77");	//По всем вопросам к Шарлотте, босс.
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_78");	//Ты ведь сам сделал ее своей помощницей!
			AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Hi_01_79");	//Ну да, конечно.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_04");	//Что скажешь?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_05");	//Не мешай мне!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_06");	//Если тебе что-то нужно - поговори с Асмалом.
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
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_07");	//Не приставай ко мне!
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_08");	//Если тебе что-то нужно - поговори с Гиллианом. Он тут за главного.
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	};
};

instance DIA_Addon_InExtremo_DrPymonte_Harfe(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 1;
	condition = DIA_Addon_InExtremo_DrPymonte_Harfe_condition;
	information = DIA_Addon_InExtremo_DrPymonte_Harfe_info;
	permanent = FALSE;
	description = "Помнится, у тебя была арфа.";
};

func int DIA_Addon_InExtremo_DrPymonte_Harfe_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_DrPymonte_Harfe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_01");	//Помнится, у тебя была арфа. Не так ли?
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_02");	//Да, было дело.
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_03");	//А она тебе еще нужна?
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_04");	//(задумчиво) Да к чему она мне тут? Только место занимает...
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_05");	//Если хочешь, можешь забрать ее. Мне не жалко.
	B_GiveInvItems(self,other,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(self,ItMi_IEHarfe,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_06");	//Благодарю.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Паймон отдал мне свою арфу.");
};