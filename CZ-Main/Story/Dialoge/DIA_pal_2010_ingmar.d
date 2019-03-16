
instance DIA_PAL_2010_INGMAR_EXIT(C_Info)
{
	npc = pal_2010_ingmar;
	nr = 999;
	condition = dia_pal_2010_ingmar_exit_condition;
	information = dia_pal_2010_ingmar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2010_ingmar_exit_condition()
{
	return TRUE;
};

func void dia_pal_2010_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_New_Teach(C_Info)
{
	npc = Pal_2010_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_New_Teach_Condition;
	information = DIA_Ingmar_New_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};


func int DIA_Ingmar_New_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_New_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chtěl bych se stát silnějším.
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void DIA_Ingmar_New_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Už jsi silný jako trol. Není nic, co bych tě mohl naučit.
	};
	Info_ClearChoices(DIA_Ingmar_New_Teach);
};

func void DIA_Ingmar_New_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void DIA_Ingmar_New_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void dia_ingmar_New_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void dia_ingmar_New_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void dia_ingmar_New_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};

func void dia_ingmar_New_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_New_Teach);
	Info_AddChoice(DIA_Ingmar_New_Teach,Dialog_Back,DIA_Ingmar_New_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_New_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_New_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_New_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_New_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_New_Teach_1);
	Info_AddChoice(DIA_Ingmar_New_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_New_Teach_5);
};