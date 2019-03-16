
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
	description = "Есть новости?";
};


func int dia_pal_2510_oric_perm_condition()
{
	return TRUE;
};

func void dia_pal_2510_oric_perm_info()
{
	if(ORICNEWSNW == FALSE)
	{
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_00");	//Есть новости?
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_01");	//Эх, парень...(улыбается) Пока единственная хорошая новость - это то, что мы все еще живы!
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_02");	//Честно говоря, я и не предполагал, что нам удастся выбраться из той долины.
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_03");	//Но как видишь, это случилось.
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_04");	//Ну да, пока нам везет! Будем надеяться, что удача не покинет нас и в дальнейшем.
		AI_Output(other,self,"DIA_PAL_2510_Oric_Perm_01_05");	//Само собой.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2510_Oric_Perm_01_06");	//Пока нет.
	};
};

