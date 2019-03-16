
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
	description = "Как обстоят дела?";
};


func int dia_pal_2170_marcos_perm_condition()
{
	return TRUE;
};

func void dia_pal_2170_marcos_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_00");	//Как обстоят дела?
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_01");	//Ты и сам все видишь. Честно говоря, я и представить себе не мог, что орки так быстро доберутся сюда.
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_02");	//Да уж. Здесь сейчас даже опаснее, чем в Долине Рудников.
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_03");	//Как раз это меня не сильно пугает. Я уже привык смотреть смерти в лицо. Иннос тому свидетель!
	AI_Output(self,other,"DIA_PAL_2170_Marcos_Perm_01_04");	//(воинственно) Ну, ничего! Мы еще покажем этим мерзким тварям. В конце концов, победа будет за нами!
	AI_Output(other,self,"DIA_PAL_2170_Marcos_Perm_01_05");	//Ну да, конечно.
};

