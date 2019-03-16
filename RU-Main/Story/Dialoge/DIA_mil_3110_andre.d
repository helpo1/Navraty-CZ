
instance DIA_MIL_3110_ANDRE_EXIT(C_Info)
{
	npc = mil_3110_andre;
	nr = 999;
	condition = dia_mil_3110_andre_exit_condition;
	information = dia_mil_3110_andre_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_mil_3110_andre_exit_condition()
{
	return TRUE;
};

func void dia_mil_3110_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3110_ANDRE_STANDARD(C_Info)
{
	npc = mil_3110_andre;
	nr = 2;
	condition = dia_mil_3110_andre_standard_condition;
	information = dia_mil_3110_andre_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3110_andre_standard_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_mil_3110_andre_standard_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

