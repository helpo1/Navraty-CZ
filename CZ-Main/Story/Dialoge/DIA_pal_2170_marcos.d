
instance DIA_PAL_2170_MARCOS_EXIT(C_Info)
{
	npc = pal_2170_marcos;
	nr = 999;
	condition = dia_pal_2170_marcos_exit_condition;
	information = dia_pal_2170_marcos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2170_marcos_exit_condition()
{
	return TRUE;
};

func void dia_pal_2170_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2170_MARCOS_PERM(C_Info)
{
	npc = pal_2170_marcos;
	nr = 9;
	condition = dia_pal_2170_marcos_perm_condition;
	information = dia_pal_2170_marcos_perm_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_pal_2170_marcos_perm_condition()
{
	return TRUE;
};

func void dia_pal_2170_marcos_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_01");	//To můžeš vidět na vlastní oči. Upřímně, nečekal jsem že se sem skřeti dostanou tak rychle.
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_02");	//Jo. Nikde to nejde hůř než v Hornickém údolí.
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_03");	//Alespoň jsme v dobře chráněné pevnosti s veterány mnoha bitev kteří jsou zvyklý dívat se smrti do tváře. Innos je toho svědkem!
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_04");	//(bojovně) No, nic! Ještě těm skřetům ukážeme. Nakonec bude vítěztví naše!
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_05");	//No ano, samozřejmě.
};

