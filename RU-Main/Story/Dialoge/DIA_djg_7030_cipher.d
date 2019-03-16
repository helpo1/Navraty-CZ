
instance DIA_CIPHERDJG_NW_EXIT(C_Info)
{
	npc = djg_7030_cipher;
	nr = 999;
	condition = dia_cipherdjg_nw_exit_condition;
	information = dia_cipherdjg_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_cipherdjg_nw_exit_condition()
{
	return TRUE;
};

func void dia_cipherdjg_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHERDJG_NW_FUCKOFF(C_Info)
{
	npc = djg_7030_cipher;
	nr = 2;
	condition = dia_cipherdjg_nw_fuckoff_condition;
	information = dia_cipherdjg_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cipherdjg_nw_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

