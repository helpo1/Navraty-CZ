
instance DIA_Jack_DI_EXIT(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 999;
	condition = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_DI_GREET(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_GREET_Condition;
	information = DIA_Jack_DI_GREET_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Jack_DI_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jack_DI_GREET_OneTime;

func void DIA_Jack_DI_GREET_Info()
{
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//Doufám, že víš, co děláš, chlapče.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//Už to nebude trvat dlouho.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//Zachovej si chladnou hlavu a vrať se v jednom kuse.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//Co tady dole děláš?
			B_GivePlayerXP(XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//I kdyby se mělo samo peklo zjevit, já tu loď odsud dostanu. S tebou, nebo bez tebe. Slyšíš?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//Nic takovýho. Jdu do toho.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//Tak to sebou hoď!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};

instance DIA_Jack_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_UndeadDragonDead_Condition;
	information = DIA_Jack_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Dokázal jsem to. Zničil jsem nepřítele!";
};

func int DIA_Jack_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//Dokázal jsem to. Zničil jsem nepřítele!
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//Doufal jsem, že všechno dobře dopadne. Ale musim přiznat, že posledních pár hodin jsem si tím nebyl vůbec jistej.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//Tak už můžem znovu vyplout?
	Info_ClearChoices(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"Ještě počkej.",DIA_Jack_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"Dobrá, můžeme vyrazit!",DIA_Jack_DI_UndeadDragonDead_over);
};

func void DIA_Jack_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//Ještě počkej. Je tu něco dalšího, co musím udělat.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//Hoď sebou, jasný? Nechci tu dostat kurděje.
	AI_StopProcessInfos(self);
};

func void DIA_Jack_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_over_15_00");	//Dobrá, můžeme vyrazit!
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_over_14_01");	//To jsem chtěl slyšet! Běž si dát do kapitánské kajuty dvacet, určitě je potřebuješ!
	AI_StopProcessInfos(self);
};
