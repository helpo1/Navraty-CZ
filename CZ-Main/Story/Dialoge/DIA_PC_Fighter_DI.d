
instance DIA_Gorn_DI_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 999;
	condition = DIA_Gorn_DI_KAP5_EXIT_Condition;
	information = DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorn_DI_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_DI_Hallo(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_Hallo_Condition;
	information = DIA_Gorn_DI_Hallo_Info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int DIA_Gorn_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//Je všechno v pořádku?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//Zatím jo. Nezapomeň, že chci vidět nějakou akci.
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//Je tam více skřetů? Pošli mi je. Chci se trochu rozehřát.
	};
};


instance DIA_Gorn_DI_Teach(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 10;
	condition = DIA_Gorn_DI_Teach_Condition;
	information = DIA_Gorn_DI_Teach_Info;
	permanent = TRUE;
	description = "Potřebuji výcvik.";
};


func int DIA_Gorn_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Potřebuji trénink.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//To nemůže uškodit.
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//Skvěle, nyní jsi lepší než dříve.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Musíš držet zbraň výš. Přes tvoje krytí by se dostal i slepec svou holí.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};


instance DIA_Gorn_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_UndeadDragonDead_Condition;
	information = DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Zůstal jsi u lodi?";
};


func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Gorn_DI_UndeadDragonDead_OneTime;

func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//Zůstal jsi u lodi?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//Jasně, že jo. Jen si představ, co bychom dělali, kdyby tady už nebyla.
	if(DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//Co se stalo?
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//Nic nového. Chci jít domů.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//(směšně) Domov? To je co? Pokud vím, pro tebe žádný není.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//Mám návrh. Vlítnem na další hospodu a zpijem se do němoty.
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//Hhm. Možná.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//Hej nech toho. Je po všem.
		};
		DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Biff_DI_plunder))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//Někdo musí říct Biffovi nebo na tomto ostrově zhnije.
		if(Npc_IsDead(Biff_DI) == FALSE)
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//Bude tady zavčas.
		};
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//Nic už tady pro nás nezbylo. 5ekni kapitánovi, ať připraví loď.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Fighter_DI_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 900;
	condition = DIA_Fighter_DI_PICKPOCKET_Condition;
	information = DIA_Fighter_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(10,45);
};

func void DIA_Fighter_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,Dialog_Back,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

