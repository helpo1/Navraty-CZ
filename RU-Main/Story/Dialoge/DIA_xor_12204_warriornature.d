
instance DIA_XOR_12204_WARRIORNATURE_EXIT(C_Info)
{
	npc = xor_12204_warriornature;
	nr = 999;
	condition = dia_xor_12204_warriornature_exit_condition;
	information = dia_xor_12204_warriornature_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xor_12204_warriornature_exit_condition()
{
	return TRUE;
};

func void dia_xor_12204_warriornature_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XOR_12204_WARRIORNATURE_STANDARD(C_Info)
{
	npc = xor_12204_warriornature;
	nr = 2;
	condition = dia_xor_12204_warriornature_standard_condition;
	information = dia_xor_12204_warriornature_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_xor_12204_warriornature_standard_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xor_12204_warriornature_standard_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

