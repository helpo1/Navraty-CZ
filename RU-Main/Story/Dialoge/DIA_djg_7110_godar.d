
instance DIA_DJG_7110_GODAR_EXIT(C_Info)
{
	npc = djg_7110_godar;
	nr = 999;
	condition = dia_djg_7110_godar_exit_condition;
	information = dia_djg_7110_godar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_djg_7110_godar_exit_condition()
{
	return TRUE;
};

func void dia_djg_7110_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7110_GODAR_PERM(C_Info)
{
	npc = djg_7110_godar;
	condition = dia_djg_7110_godar_perm_condition;
	information = dia_djg_7110_godar_perm_info;
	permanent = TRUE;
	description = "Проголодался?";
};


func int dia_djg_7110_godar_perm_condition()
{
	if(DGJREVENGEME == FALSE)
	{
		return TRUE;
	};
};

func void dia_djg_7110_godar_perm_info()
{
	AI_Output(other,self,"DIA_DJG_7110_Godar_Perm_01_00");	//Проголодался?
	AI_Output(self,other,"DIA_DJG_7110_Godar_Perm_01_01");	//А сам не видишь? Там в Долине Рудников нормальная еда на вес золота. Не то что здесь.
	AI_Output(self,other,"DIA_DJG_7110_Godar_Perm_01_02");	//Поэтому, пока есть возможность, я хочу набить свое брюхо до отвала.
	AI_Output(self,other,"DIA_DJG_7110_Godar_Perm_01_03");	//Кто знает, что там будет потом!
	AI_Output(other,self,"DIA_DJG_7110_Godar_Perm_01_04");	//Ну ладно, тогда не буду мешать.
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7110_GODAR_PICKPOCKET(C_Info)
{
	npc = djg_7110_godar;
	nr = 900;
	condition = dia_djg_7110_godar_pickpocket_condition;
	information = dia_djg_7110_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_djg_7110_godar_pickpocket_condition()
{
	return C_Beklauen(100,350);
};

func void dia_djg_7110_godar_pickpocket_info()
{
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
	Info_AddChoice(dia_djg_7110_godar_pickpocket,Dialog_Back,dia_djg_7110_godar_pickpocket_back);
	Info_AddChoice(dia_djg_7110_godar_pickpocket,DIALOG_PICKPOCKET,dia_djg_7110_godar_pickpocket_doit);
};

func void dia_djg_7110_godar_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
};

func void dia_djg_7110_godar_pickpocket_back()
{
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
};


instance DIA_DJG_7110_GODAR_FUCKOFF(C_Info)
{
	npc = djg_7110_godar;
	nr = 2;
	condition = dia_djg_7110_godar_fuckoff_condition;
	information = dia_djg_7110_godar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_7110_godar_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREVENGEME == TRUE))
	{
		return TRUE;
	};
};

func void dia_djg_7110_godar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

