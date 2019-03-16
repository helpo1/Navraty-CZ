
instance DIA_XOR_12206_WARRIORNATURE_EXIT(C_Info)
{
	npc = xor_12206_warriornature;
	nr = 999;
	condition = dia_xor_12206_warriornature_exit_condition;
	information = dia_xor_12206_warriornature_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_xor_12206_warriornature_exit_condition()
{
	return TRUE;
};

func void dia_xor_12206_warriornature_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XOR_12206_WARRIORNATURE_STANDARD(C_Info)
{
	npc = xor_12206_warriornature;
	nr = 2;
	condition = dia_xor_12206_warriornature_standard_condition;
	information = dia_xor_12206_warriornature_standard_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_xor_12206_warriornature_standard_condition()
{
	return TRUE;
};

func void dia_xor_12206_warriornature_standard_info()
{
	AI_Output(self,other,"DIA_XOR_12206_WarriorNature_STANDARD_01_00");	//Значит, это ты, кто осмелился бросить вызов!
	AI_Output(self,other,"DIA_XOR_12206_WarriorNature_STANDARD_01_01");	//Ну что же, - посмотрим, на что ты способен. К бою!
	Info_ClearChoices(dia_xor_12206_warriornature_standard);
	Info_AddChoice(dia_xor_12206_warriornature_standard,"(закончить разговор)",dia_xor_12206_warriornature_standard_ok);
};

func void dia_xor_12206_warriornature_standard_ok()
{
	AI_StopProcessInfos(self);
	self.flags = NPC_FLAG_NONE;
	B_Attack(self,other,AR_NONE,1);
};