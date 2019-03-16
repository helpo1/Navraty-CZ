
instance DIA_PAL_13_EXIT(C_Info)
{
	nr = 999;
	condition = dia_pal_13_exit_condition;
	information = dia_pal_13_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_13_exit_condition()
{
	return TRUE;
};

func void dia_pal_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_13_STANDARD(C_Info)
{
	nr = 1;
	condition = dia_pal_13_standard_condition;
	information = dia_pal_13_standard_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_pal_13_standard_condition()
{
	return TRUE;
};

func void dia_pal_13_standard_info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak se vede?
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_pal_13(var C_Npc slf)
{
	dia_pal_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_13_standard.npc = Hlp_GetInstanceID(slf);
};

