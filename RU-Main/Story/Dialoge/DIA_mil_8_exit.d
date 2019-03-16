
instance DIA_MIL_8_EXIT(C_Info)
{
	nr = 999;
	condition = dia_mil_8_exit_condition;
	information = dia_mil_8_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_mil_8_exit_condition()
{
	return TRUE;
};

func void dia_mil_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_8_JOIN(C_Info)
{
	nr = 4;
	condition = dia_mil_8_join_condition;
	information = dia_mil_8_join_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_8_join_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_mil_8_join_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_mil_8(var C_Npc slf)
{
	dia_mil_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_8_join.npc = Hlp_GetInstanceID(slf);
};

