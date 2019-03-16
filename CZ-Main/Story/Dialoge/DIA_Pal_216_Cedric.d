
instance DIA_Cedric_EXIT(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 999;
	condition = DIA_Cedric_EXIT_Condition;
	information = DIA_Cedric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cedric_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cedric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cedric_Hallo(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 2;
	condition = DIA_Cedric_Hallo_Condition;
	information = DIA_Cedric_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cedric_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cedric_Hallo_12_00");	//Jsem Cedric, mistr meče, královský paladin.
};


instance DIA_Cedric_CanTeach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeach_Condition;
	information = DIA_Cedric_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě učit?";
};


func int DIA_Cedric_CanTeach_Condition()
{
	if(Cedric_Teach1H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Cedric_CanTeach_15_00");	//Můžeš mě učit?

	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_01");	//Můžu tě trénovat v boji s jednoručními zbraněmi.
		Cedric_Teach1H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Cedric mě naučit zacházet s jednoručními zbraněmi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//Učím pouze paladiny.
	};
};

instance DIA_Cedric_CanTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeachShield_Condition;
	information = DIA_Cedric_CanTeachShield_Info;
	permanent = FALSE;
	description = "Máš zajmavý štít!";
};

func int DIA_Cedric_CanTeachShield_Condition()
{
	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeachShield_Info()
{
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_00");	//Máš zajmavý štít!
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_01");	//Líbí se ti? (Sarkasticky) Vidím, že tě velmi zaujal.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_02");	//Tak to je.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_03");	//Pouze my, paladinové krále, máme tu čest je nosit!
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_04");	//I když mnozí věří, že to není nic víc než jen obyčejný kus železa.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_05");	//A to opravdu?
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_06");	//Ať si říkají, co chtějí. (Vážně) Ale skutečný mistr vždy pozná hodnotu dobrého štítu ve správných rukou!
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_07");	//I já jsem válečník, a rád bych nosit štít.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_08");	//Pak by ses měl obrátit na Ingmara.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_09");	//Jsem si jistý, žepro tebe bude mít něco užitečného.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_10");	//Promluvím s ním.
	CedricSendIngmar = TRUE;
};

instance DIA_Cedric_DoTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_DoTeachShield_Condition;
	information = DIA_Cedric_DoTeachShield_Info;
	permanent = FALSE;
	description = "A ty mě můžeš naučit bojovat se štítem?";
};

func int DIA_Cedric_DoTeachShield_Condition()
{
	if((CedricSendIngmar == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cedric_DoTeachShield_Info()
{
	AI_Output(other,self,"DIA_Cedric_DoTeachShield_01_00");	//A ty mě můžeš naučit bojovat se štítem?
	AI_Output(self,other,"DIA_Cedric_DoTeachShield_01_01");	//Samozřejmě. Mohu ti ukázat pár triků.
	AI_Output(other,self,"DIA_Cedric_DoTeachShield_01_02");	//A co proto musím udělat?
	AI_Output(self,other,"DIA_Cedric_DoTeachShield_01_03");	//Trochu zkušeností a trpělivosti, nic víc.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Paladin Cedric mě může učit umění boje s štítem.");
	CedricTeachShield = TRUE;
};

instance DIA_Cedric_Teach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = "Chci trénovat.";
};

func int DIA_Cedric_Teach_Condition()
{
	if((Cedric_Teach1H == TRUE) && ((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE)))
	{
		return TRUE;
	};
	if((CedricTeachShield == TRUE) && ((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Teach_Info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//Jsem připravenej trénovat.

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Už ses naučil vše o boji s mečem. Víc ti ukázat nemohu!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Trénink se štítem je u konce! Naučil jsem tě vše co jsem znal.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_Back()
{
	Info_ClearChoices(DIA_Cedric_Teach);
};

func void DIA_Cedric_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Naučil ses všechno o boji s mečem. Už tě nemůžu nic naučit!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Trénink se štítem je u konce! Naučil jsem tě vše co jsem znal.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Naučil ses všechno o boji s mečem. Už tě nemůžu nic naučit!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Trénink se štítem je u konce! Naučil jsem tě vše co jsem znal.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_ShieldNoMoney_1()
{
	B_TeachShieldNoMoney(self,other,1,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Naučil ses všechno o boji s mečem. Už tě nemůžu nic naučit!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Trénink se štítem je u konce! Naučil jsem tě vše co jsem znal.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_ShieldNoMoney_5()
{
	B_TeachShieldNoMoney(self,other,5,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Naučil ses všechno o boji s mečem. Už tě nemůžu nic naučit!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Trénink se štítem je u konce! Naučil jsem tě vše co jsem znal.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

instance DIA_Cedric_PICKPOCKET(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 900;
	condition = DIA_Cedric_PICKPOCKET_Condition;
	information = DIA_Cedric_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Cedric_PICKPOCKET_Condition()
{
	return C_Beklauen(37,55);
};

func void DIA_Cedric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,Dialog_Back,DIA_Cedric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cedric_PICKPOCKET_DoIt);
};

func void DIA_Cedric_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

func void DIA_Cedric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};