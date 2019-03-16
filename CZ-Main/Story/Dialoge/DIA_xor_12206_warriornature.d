
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
	AI_Output(self,other,"DIA_XOR_12206_WarriorNature_STANDARD_01_00");	//Tak to jsi ty, jak si se opovážil!
	AI_Output(self,other,"DIA_XOR_12206_WarriorNature_STANDARD_01_01");	//No - pojďme se podívat, co můžu udělat. Do boje!
	Info_ClearChoices(dia_xor_12206_warriornature_standard);
	Info_AddChoice(dia_xor_12206_warriornature_standard,"... (KONEC)",dia_xor_12206_warriornature_standard_ok);
};

func void dia_xor_12206_warriornature_standard_ok()
{
	AI_StopProcessInfos(self);
	self.flags = NPC_FLAG_NONE;
	B_Attack(self,other,AR_NONE,1);
};