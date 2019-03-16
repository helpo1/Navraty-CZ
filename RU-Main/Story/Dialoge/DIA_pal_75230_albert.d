
instance DIA_PAL_75230_ALBERT_EXIT(C_Info)
{
	npc = pal_75230_albert;
	nr = 999;
	condition = dia_pal_75230_albert_exit_condition;
	information = dia_pal_75230_albert_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_75230_albert_exit_condition()
{
	return TRUE;
};

func void dia_pal_75230_albert_exit_info()
{
	AI_StopProcessInfos(self);
};

