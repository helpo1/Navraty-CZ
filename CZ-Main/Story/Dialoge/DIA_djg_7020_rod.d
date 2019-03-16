
instance DIA_RODDJG_NW_EXIT(C_Info)
{
	npc = djg_7020_rod;
	nr = 999;
	condition = dia_roddjg_nw_exit_condition;
	information = dia_roddjg_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_roddjg_nw_exit_condition()
{
	return TRUE;
};

func void dia_roddjg_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_NW_FUCKOFF(C_Info)
{
	npc = djg_7020_rod;
	nr = 2;
	condition = dia_roddjg_nw_fuckoff_condition;
	information = dia_roddjg_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_roddjg_nw_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_roddjg_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

