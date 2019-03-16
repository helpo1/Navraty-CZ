
instance DIA_PAL_2510_ORIC_EXIT(C_Info)
{
	npc = pal_2510_oric;
	nr = 999;
	condition = dia_pal_2510_oric_exit_condition;
	information = dia_pal_2510_oric_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2510_oric_exit_condition()
{
	return TRUE;
};

func void dia_pal_2510_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


var int oricnewsnw;

instance DIA_PAL_2510_ORIC_PERM(C_Info)
{
	npc = pal_2510_oric;
	nr = 9;
	condition = dia_pal_2510_oric_perm_condition;
	information = dia_pal_2510_oric_perm_info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int dia_pal_2510_oric_perm_condition()
{
	return TRUE;
};

func void dia_pal_2510_oric_perm_info()
{
	if(ORICNEWSNW == FALSE)
	{
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_00");	//Nějaké novinky?
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_01");	//Jo chlape...(směje se) A dobré. Jsme ještě všichni naživu!
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_02");	//Abych řekl pravdu, nečekal jsem, že přežijeme takto dlouho.
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_03");	//A jak vidíš stalo se!
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_04");	//No dokud budeme mít štěstí! Doufám že nás v budoucnu neopustí.
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_05");	//Samozřejmě.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_06");	//Zatím.
	};
};

