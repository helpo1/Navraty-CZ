
instance DIA_PAL_2160_CEDRIC_EXIT(C_Info)
{
	npc = pal_2160_cedric;
	nr = 999;
	condition = dia_pal_2160_cedric_exit_condition;
	information = dia_pal_2160_cedric_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2160_cedric_exit_condition()
{
	return TRUE;
};

func void dia_pal_2160_cedric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2160_CEDRIC_TEACH(C_Info)
{
	npc = pal_2160_cedric;
	nr = 100;
	condition = dia_pal_2160_cedric_teach_condition;
	information = dia_pal_2160_cedric_teach_info;
	permanent = TRUE;
	description = "Я готов к тренировке.";
};


func int dia_pal_2160_cedric_teach_condition()
{
	if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2160_cedric_teach_info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//Я готов к тренировке.
	if(other.HitChance[NPC_TALENT_1H] >= 90)
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе.
		DIA_Cedric_Teach_permanent = TRUE;
	}
	else
	{
		Info_ClearChoices(dia_pal_2160_cedric_teach);
		Info_AddChoice(dia_pal_2160_cedric_teach,Dialog_Back,dia_pal_2160_cedric_teach_back);
		Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_pal_2160_cedric_teach_2h_1);
		Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_pal_2160_cedric_teach_2h_5);
	};
};

func void dia_pal_2160_cedric_teach_back()
{
	Info_ClearChoices(dia_pal_2160_cedric_teach);
};

func void dia_pal_2160_cedric_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_pal_2160_cedric_teach);
	Info_AddChoice(dia_pal_2160_cedric_teach,Dialog_Back,dia_pal_2160_cedric_teach_back);
	Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_pal_2160_cedric_teach_2h_1);
	Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_pal_2160_cedric_teach_2h_5);
};

func void dia_pal_2160_cedric_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_pal_2160_cedric_teach);
	Info_AddChoice(dia_pal_2160_cedric_teach,Dialog_Back,dia_pal_2160_cedric_teach_back);
	Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_pal_2160_cedric_teach_2h_1);
	Info_AddChoice(dia_pal_2160_cedric_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_pal_2160_cedric_teach_2h_5);
};

