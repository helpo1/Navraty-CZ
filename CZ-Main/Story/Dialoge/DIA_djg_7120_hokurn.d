
instance DIA_DJG_7120_HOKURN_EXIT(C_Info)
{
	npc = djg_7120_hokurn;
	nr = 999;
	condition = dia_djg_7120_hokurn_exit_condition;
	information = dia_djg_7120_hokurn_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_djg_7120_hokurn_exit_condition()
{
	return TRUE;
};

func void dia_djg_7120_hokurn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7120_HOKURN_PERM(C_Info)
{
	npc = djg_7120_hokurn;
	condition = dia_djg_7120_hokurn_perm_condition;
	information = dia_djg_7120_hokurn_perm_info;
	permanent = TRUE;
	description = "Co budeš dělat ty?";
};


func int dia_djg_7120_hokurn_perm_condition()
{
	if(DGJREVENGEME == FALSE)
	{
		return TRUE;
	};
};

func void dia_djg_7120_hokurn_perm_info()
{
	AI_Output(other,self,"DIA_DJG_7120_Hokurn_Perm_01_00");	//Co budeš dělat ty?
	AI_Output(self,other,"DIA_DJG_7120_Hokurn_Perm_01_01");	//Sedět a čekat jak se situace vyvine bude to nejlepší... (povzdech) Nic jiného nepřipadá v úvahu!
	AI_Output(self,other,"DIA_DJG_7120_Hokurn_Perm_01_02");	//I když myslím že to nebude trvat dlouho. Věřím, že ty zelené kůže tu nebudou navěky!
	AI_Output(self,other,"DIA_DJG_7120_Hokurn_Perm_01_03");	//Prokletí skřeti! (vztekle) Jak já je nenávidím!
};


instance DIA_DJG_7120_HOKURN_PICKPOCKET(C_Info)
{
	npc = djg_7120_hokurn;
	nr = 900;
	condition = dia_djg_7120_hokurn_pickpocket_condition;
	information = dia_djg_7120_hokurn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_djg_7120_hokurn_pickpocket_condition()
{
	return C_Beklauen(100,350);
};

func void dia_djg_7120_hokurn_pickpocket_info()
{
	Info_ClearChoices(dia_djg_7120_hokurn_pickpocket);
	Info_AddChoice(dia_djg_7120_hokurn_pickpocket,Dialog_Back,dia_djg_7120_hokurn_pickpocket_back);
	Info_AddChoice(dia_djg_7120_hokurn_pickpocket,DIALOG_PICKPOCKET,dia_djg_7120_hokurn_pickpocket_doit);
};

func void dia_djg_7120_hokurn_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_djg_7120_hokurn_pickpocket);
};

func void dia_djg_7120_hokurn_pickpocket_back()
{
	Info_ClearChoices(dia_djg_7120_hokurn_pickpocket);
};


instance DIA_DJG_7120_HOKURN_FUCKOFF(C_Info)
{
	npc = djg_7120_hokurn;
	nr = 2;
	condition = dia_djg_7120_hokurn_fuckoff_condition;
	information = dia_djg_7120_hokurn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_7120_hokurn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREVENGEME == TRUE))
	{
		return TRUE;
	};
};

func void dia_djg_7120_hokurn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

