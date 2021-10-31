
instance DIA_Lee_DI_EXIT(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 999;
	condition = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Hallo(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_Hallo_Condition;
	information = DIA_Lee_DI_Hallo_Info;
	description = "Co tu budeš dělat?";
};


func int DIA_Lee_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_Hallo_15_00");	//Co tu budeš dělat?
	AI_Output(self,other,"DIA_Lee_DI_Hallo_04_01");	//Někdo musí hlídat loď než se vrátíš.
};


instance DIA_Lee_DI_PERM6(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_PERM6_Condition;
	information = DIA_Lee_DI_PERM6_Info;
	permanent = TRUE;
	description = "Jak je to s lodí?";
};


func int DIA_Lee_DI_PERM6_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_DI_Hallo) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_PERM6_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Jak je to s lodí?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Bez obav. Mám to pod kontrolou.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_02");	//Vše v klidu. Skřeti se drží daleko.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Teach(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 10;
	condition = DIA_Lee_DI_Teach_Condition;
	information = DIA_Lee_DI_Teach_Info;
	permanent = TRUE;
	description = "Pojď mě cvičit.";
};


func int DIA_Lee_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Pojď mě cvičit.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//V čem přesně?
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Tvá obrana je na nic, ale něco s tím provedem.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Nesvírej zbraň tak křečovitě. Musíš ji držet volně.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Vždy si pamatuj: sílu moudře.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Silnější úder je ti k ničemu když netrefíš cíl. Snaž se ho použit jen když si seš jistý, že uspěješ.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_DI_Teach);
};


instance DIA_Lee_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_UndeadDragonDead_Condition;
	information = DIA_Lee_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Můžeme jít, je po nepříteli.";
};


func int DIA_Lee_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Lee_DI_UndeadDragonDead_OneTime;

func void DIA_Lee_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_00");	//Můžeme jít, je po nepříteli.
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_01");	//Dobře. Pověz to kapitánovi.
	if((DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_02");	//Chceš na pevninu, že?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_03");	//Ano. Khorinis beze mne přežije.
		AI_Output(self,other,"DIA_Lee_Add_04_26");	//Pak se konečně pomstím králi.
		AI_Output(self,other,"DIA_Lee_Add_04_27");	//Čekal jsem na to celou věčnost...
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_05");	//Trpělivost by měla být odměněna, ne?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_06");	//Trpělivost a dobré argumenty.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_07");	//(směje se) Ano. Nic takového by se nestalo bez dobré party. Byla to velká čest s tebou bojovat bok po boku.
		DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_08");	//Možná se naše cesty setkají i potom...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Lee_DI_PICKPOCKET(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 900;
	condition = DIA_Lee_DI_PICKPOCKET_Condition;
	information = DIA_Lee_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lee_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(110,570);
};

func void DIA_Lee_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET,Dialog_Back,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

