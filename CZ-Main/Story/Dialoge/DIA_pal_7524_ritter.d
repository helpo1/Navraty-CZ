
instance DIA_PAL_7524_EXIT(C_Info)
{
	npc = pal_7524_ritter;
	nr = 999;
	condition = dia_pal_7524_exit_condition;
	information = dia_pal_7524_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7524_exit_condition()
{
	return TRUE;
};

func void dia_pal_7524_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7524_PASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_pass_condition;
	information = dia_pal_7524_pass_info;
	permanent = FALSE;
	description = "Co je tady?";
};


func int dia_pal_7524_pass_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7524_pass_info()
{
	AI_Output(other,self,"DIA_PAL_7524_Pass_01_00");	//Co je tady?
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_01");	//Tábor paladinů.
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_02");	//Po skřetím útoku jsme se sem stáhli a bráníme to tady.
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_03");	//Ale krátce nato zde vyrostl tento les a skřeti ustoupili.
};


instance DIA_PAL_7524_TRESPASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_trespass_condition;
	information = dia_pal_7524_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7524_trespass_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7524_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_00");	//STÁT! Ve jménu Innose, KDO JSI?!
	AI_Output(other,self,"DIA_PAL_7524_TRESPASS_01_01");	//Bez obav, přicházím z hradu.
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_02");	//Ano? (pochybovačně) Dobře, pojď dál.
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_03");	//Jen nedělej potíže - máme jich dost.
};


instance DIA_PAL_7524_PERM2(C_Info)
{
	npc = pal_7524_ritter;
	nr = 3;
	condition = dia_pal_7524_perm2_condition;
	information = dia_pal_7524_perm2_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_pal_7524_perm2_condition()
{
	return TRUE;
};

func void dia_pal_7524_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_7524_Perm2_01_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_PAL_7524_Perm2_01_01");	//Zatím v pohodě.
	AI_StopProcessInfos(self);
};

