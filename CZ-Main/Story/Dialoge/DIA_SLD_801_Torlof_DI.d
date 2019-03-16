
instance DIA_Torlof_DI_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 999;
	condition = DIA_Torlof_DI_KAP3_EXIT_Condition;
	information = DIA_Torlof_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Torlof_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Hallo(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_Hallo_Condition;
	information = DIA_Torlof_DI_Hallo_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int DIA_Torlof_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Hallo_15_00");	//Vše v pořádku?

	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_01");	//Zatím ano, ale může se to změnit. Dávej si pozor.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_02");	//Pokud skřeti zůstanou tam kde jsou, vše bude v pořádku.
		B_StartOtherRoutine(Torlof_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Teach(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 150;
	condition = DIA_Torlof_DI_Teach_Condition;
	information = DIA_Torlof_DI_Teach_Info;
	permanent = TRUE;
	description = "Chci zdokonalit své schopnosti!";
};

func int DIA_Torlof_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//Chci zdokonalit své schopnosti!
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
};

func void DIA_Torlof_DI_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

instance DIA_Torlof_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_UndeadDragonDead_Condition;
	information = DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Zničil jsem nepřítele.";
};

func int DIA_Torlof_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_15_00");	//Zničil jsem nepřítele.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_01_01");	//Nic jinýho sem ani nečekal. Jak to šlo? Takže odplouváme?
	Info_ClearChoices(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"Za chvíli.",DIA_Torlof_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"Jasně, můžeme.",DIA_Torlof_DI_UndeadDragonDead_over);
};

func void DIA_Torlof_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_moment_15_00");	//Za chvíli.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//Tak pohni!
	AI_StopProcessInfos(self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_over_15_00");	//Jasně, můžeme!
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_over_01_01");	//Jestli jsi rozhodnutý, jdi se vyspat do kajuty!
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_over_01_02");	//Odplouváme!
	AI_StopProcessInfos(self);
};

instance DIA_Torlof_DI_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 900;
	condition = DIA_Torlof_DI_PICKPOCKET_Condition;
	information = DIA_Torlof_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Torlof_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(76,120);
};

func void DIA_Torlof_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET,Dialog_Back,DIA_Torlof_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_DI_PICKPOCKET_DoIt);
};

func void DIA_Torlof_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};

func void DIA_Torlof_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};