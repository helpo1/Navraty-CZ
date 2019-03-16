
instance DIA_NONE_108_DRAGO_EXIT(C_Info)
{
	npc = none_108_drago;
	nr = 999;
	condition = dia_none_108_drago_exit_condition;
	information = dia_none_108_drago_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_108_drago_exit_condition()
{
	return TRUE;
};

func void dia_none_108_drago_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_108_DRAGO_HALLO(C_Info)
{
	npc = none_108_drago;
	nr = 1;
	condition = dia_none_108_drago_hallo_condition;
	information = dia_none_108_drago_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_none_108_drago_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_108_drago_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self,"DIA_NONE_108_Drago_HALLO_01_00");	//Zdravím tě, mágu!
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_01");	//Innos s tebou... (mrtvolně) Co ode mne potřebuješ?
	AI_Output(other,self,"DIA_NONE_108_Drago_HALLO_01_02");	//Potřebuji tvoji pomoc.
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_03");	//(mrtvolně) Obávám se, že já ti nijak nemohu pomoci...
	AI_Output(self,other,"DIA_NONE_108_Drago_HALLO_01_04");	//Promluv si raději s mistrem Corristem! Možná vyslyší tvoji žádost.
	AI_StopProcessInfos(self);
};

