
instance DIA_ADDON_ABIGEIL_BF_EXIT(C_Info)
{
	npc = pir_61360_abigeil;
	nr = 999;
	condition = dia_addon_abigeil_bf_exit_condition;
	information = dia_addon_abigeil_bf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_abigeil_bf_exit_condition()
{
	return TRUE;
};

func void dia_addon_abigeil_bf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ABIGEIL_BF_PICKPOCKET(C_Info)
{
	npc = pir_61360_abigeil;
	nr = 900;
	condition = dia_addon_abigeil_bf_pickpocket_condition;
	information = dia_addon_abigeil_bf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_abigeil_bf_pickpocket_condition()
{
	return C_Beklauen(111,666);
};

func void dia_addon_abigeil_bf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_abigeil_bf_pickpocket);
	Info_AddChoice(dia_addon_abigeil_bf_pickpocket,Dialog_Back,dia_addon_abigeil_bf_pickpocket_back);
	Info_AddChoice(dia_addon_abigeil_bf_pickpocket,DIALOG_PICKPOCKET,dia_addon_abigeil_bf_pickpocket_doit);
};

func void dia_addon_abigeil_bf_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_abigeil_bf_pickpocket);
};

func void dia_addon_abigeil_bf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_abigeil_bf_pickpocket);
};

