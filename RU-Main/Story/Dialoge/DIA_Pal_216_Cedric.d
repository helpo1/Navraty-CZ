
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
	AI_Output(self,other,"DIA_Cedric_Hallo_12_00");	//Я Седрик, мастер меча и паладин короля.
};


instance DIA_Cedric_CanTeach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeach_Condition;
	information = DIA_Cedric_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
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
	AI_Output(other,self,"DIA_Cedric_CanTeach_15_00");	//Ты можешь обучить меня?

	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_01");	//Я могу научить тебя сражаться одноручным оружием.
		Cedric_Teach1H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Паладин Седрик может обучить меня искусству сражения одноручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//Я тренирую только паладинов.
	};
};

instance DIA_Cedric_CanTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeachShield_Condition;
	information = DIA_Cedric_CanTeachShield_Info;
	permanent = FALSE;
	description = "Интересный у тебя щит!";
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
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_00");	//Интересный у тебя щит!
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_01");	//Нравится? (ехидно) Вижу, он тебя очень заинтересовал.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_02");	//Так оно и есть.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_03");	//Только мы, паладины короля, удостоены чести носить их!
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_04");	//Хотя многие и считают, что это не больше, чем обычный кусок железа.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_05");	//А что на самом деле?
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_06");	//Пусть говорят, что хотят. (серьезно) Но настоящий мастер всегда знает цену хорошего щита в умелых руках!
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_07");	//Я тоже паладин, и хотел бы носить такой щит.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_08");	//Тогда тебе стоит обратиться к Ингмару.
	AI_Output(self,other,"DIA_Cedric_CanTeachShield_01_09");	//Уверен, он подыщет для тебя что-нибудь стоящее.
	AI_Output(other,self,"DIA_Cedric_CanTeachShield_01_10");	//Я поговорю с ним.
	CedricSendIngmar = TRUE;
};

instance DIA_Cedric_DoTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_DoTeachShield_Condition;
	information = DIA_Cedric_DoTeachShield_Info;
	permanent = FALSE;
	description = "А ты можешь научить меня сражаться с щитом?";
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
	AI_Output(other,self,"DIA_Cedric_DoTeachShield_01_00");	//А ты можешь научить меня сражаться со щитом?
	AI_Output(self,other,"DIA_Cedric_DoTeachShield_01_01");	//Конечно. Я могу показать тебе пару приемов.
	AI_Output(other,self,"DIA_Cedric_DoTeachShield_01_02");	//И что для этого от меня потребуется?
	AI_Output(self,other,"DIA_Cedric_DoTeachShield_01_03");	//Немного опыта и терпения, ничего более.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Паладин Седрик может обучить меня искусству сражения с щитом.");
	CedricTeachShield = TRUE;
};

instance DIA_Cedric_Teach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = "Я хочу потренироваться.";
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
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//Я готов к тренировке.

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Тренировки с щитом закончены! Я научил тебя всему, что только знал сам.
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
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Тренировки с щитом закончены! Я научил тебя всему, что только знал сам.
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
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Тренировки с щитом закончены! Я научил тебя всему, что только знал сам.
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
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Тренировки с щитом закончены! Я научил тебя всему, что только знал сам.
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
		AI_Output(self,other,"DIA_Cedric_Teach_12_01");	//Ты выучил все о бое на мечах. Я не могу больше ничего показать тебе!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other,"DIA_Cedric_Teach_12_91");	//Тренировки с щитом закончены! Я научил тебя всему, что только знал сам.
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