
instance DIA_Lares_DI_EXIT(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 999;
	condition = DIA_Lares_DI_EXIT_Condition;
	information = DIA_Lares_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_DI_Hallo(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 2;
	condition = DIA_Lares_DI_Hallo_Condition;
	information = DIA_Lares_DI_Hallo_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Lares_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Hallo_15_00");	//Jak se vede?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_01");	//Pospěš si. Ti skřeti se určitě vrátí.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_02");	//Dobře. Ale tahle jeskyně mě docela děsí.
	};
};


instance DIA_Lares_DI_Training(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 10;
	condition = DIA_Lares_DI_Training_Condition;
	information = DIA_Lares_DI_Training_Info;
	permanent = TRUE;
	description = "Nauč mě něco z tvých schopností.";
};


func int DIA_Lares_DI_Training_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//Nauč mě něco z tvých schopností.
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//Žádný problém.
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Musíš trochu ohnout přední nohu a narovnat záda. Tak získáš ten správný postoj.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Zůstaň pružný v kyčlích. To ti umožní se vyhnout protiútoku.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//Tvá horní polovina musí pracovat v souladu se zbytkem těla.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Vždycky by sis měl hlídat svůj postoj.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_SNEAK_09_00");	//Při plížení vždycky využívej celou plochu svých chodidel.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Plížení",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
};


instance DIA_Lares_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 5;
	condition = DIA_Lares_DI_UndeadDragonDead_Condition;
	information = DIA_Lares_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Zdá se, že tě to celé nijak zvlášť neznepokojuje.";
};

func int DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Lares_DI_UndeadDragonDead_OneTime;

func void DIA_Lares_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_00");	//Zdá se, že tě to celé nijak zvlášť neznepokojuje.
	AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_01");	//Víš jak, byl jsem ubezpečen, že to zvládneš.
	if(DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_02");	//Co budeš dělat dál?
		AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_03");	//Ještě nevím. Ale myslím, že zatím pobudu s tebou.
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};

