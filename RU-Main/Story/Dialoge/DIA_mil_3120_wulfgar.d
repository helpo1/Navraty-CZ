
instance DIA_MIL_3120_WULFGAR_EXIT(C_Info)
{
	npc = mil_3120_wulfgar;
	nr = 999;
	condition = dia_mil_3120_wulfgar_exit_condition;
	information = dia_mil_3120_wulfgar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_mil_3120_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_mil_3120_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3120_WULFGAR_STANDARD(C_Info)
{
	npc = mil_3120_wulfgar;
	nr = 2;
	condition = dia_mil_3120_wulfgar_standard_condition;
	information = dia_mil_3120_wulfgar_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3120_wulfgar_standard_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_mil_3120_wulfgar_standard_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

