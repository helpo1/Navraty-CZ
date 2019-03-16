
instance DIA_GORNAVID_EXIT(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 999;
	condition = dia_gornavid_exit_condition;
	information = dia_gornavid_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornavid_exit_condition()
{
	return TRUE;
};

func void dia_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornavid_PICKPOCKET(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 900;
	condition = dia_gornavid_PICKPOCKET_Condition;
	information = dia_gornavid_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornavid_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornavid_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
	Info_AddChoice(dia_gornavid_PICKPOCKET,Dialog_Back,dia_gornavid_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornavid_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornavid_PICKPOCKET_DoIt);
};

func void dia_gornavid_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

func void dia_gornavid_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

instance DIA_GORNAVID_WHOYOU(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_whoyou_condition;
	information = dia_gornavid_whoyou_info;
	permanent = FALSE;
	description = "Я здесь новенький. Кто ты?";
};


func int dia_gornavid_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornavid_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaVid_WhoYou_01_00");	//Я здесь новенький. Кто ты?
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_01");	//Меня зовут Гор На Вид.
	AI_Output(other,self,"DIA_GorNaVid_WhoYou_01_02");	//Скажи, а нужны ли вам верные люди?
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_03");	//Верные люди нужны всегда. Но тебе придется серьезно поработать над собой.
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_04");	//Только лучшие из лучших могут стать Стражами.
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_05");	//Это высочайшая честь для любого последователя нашего Братства.
};


instance DIA_GORNAVID_BECOMETPL(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_becometpl_condition;
	information = dia_gornavid_becometpl_info;
	permanent = TRUE;
	description = "Я тоже хочу стать Стражем, как и ты.";
};


func int dia_gornavid_becometpl_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornavid_becometpl_info()
{
	AI_Output(other,self,"DIA_GorNaVid_BecomeTPL_01_00");	//Я тоже хочу стать Стражем, как и ты.
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_01");	//А знаешь ли ты, от чего мне пришлось отказаться, прежде чем я смог встать на страже покоя избранных?
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_02");	//Не думай, что сможешь так вот запросто попасть на это место и получить подобающий почет и уважение.
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_03");	//Прежде чем говорить об этом, ты должен узнать немного о нашем учении.
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_04");	//Это займет некоторое время и, возможно, приведет тебя в чувство.
};


instance DIA_GORNAVID_ABWEISEND(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 2;
	condition = dia_gornavid_abweisend_condition;
	information = dia_gornavid_abweisend_info;
	permanent = TRUE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int dia_gornavid_abweisend_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && (GORNAVIDTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornavid_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaVid_Abweisend_01_00");	//Ты можешь чему-нибудь научить меня?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_01");	//Я обучаю только Стражей!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_02");	//Обучение Гуру не входит в мою компетенцию. Тебе лучше поговорить на эту тему с Идолами.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_03");	//Я обучаю только Стражей!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_04");	//Если ты хочешь присоединиться к нам - тебе следует поговорить об этом с Гор На Кошем. Он главный среди нас.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_05");	//Ты правильно сделал, что обратился ко мне.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_06");	//Тебе действительно есть чему у меня поучиться.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_07");	//Традиционно, основным оружием Стражей является двуручный меч. Однако при этом никак нельзя забывать и о технике ведения дальнего боя.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_08");	//Не скажу, что я хорошо разбираюсь в стрельбе из лука. Но вот в чем я действительно знаю толк - так это в технике стрельбы из арбалета.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_09");	//Если у тебя есть достаточно опыта и имеется желание потренировать этот навык - то я к твоим услугам.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_10");	//Только дай знать - и мы приступим к твоему обучению.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Гор На Вид может преподать мне несколько уроков с оружием дальнего боя.");
		GORNAVIDTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_11");	//Я обучаю только Стражей, а ты даже не принадлежишь к нашему лагерю!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_12");	//Извини, но я ничем не могу тебе помочь.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_13");	//Проваливай!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_14");	//Чужаку здесь не место!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNAVID_TEACH(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 3;
	condition = dia_gornavid_teach_condition;
	information = dia_gornavid_teach_info;
	permanent = TRUE;
	description = "Я хочу учиться у тебя.";
};


func int dia_gornavid_teach_condition()
{
	if((GORNAVIDTEACH == TRUE) && ((other.HitChance[NPC_TALENT_CROSSBOW] < 100) || (other.HitChance[NPC_TALENT_BOW] < 60)))
	{
		return TRUE;
	};
};

func void dia_gornavid_teach_info()
{
	AI_Output(other,self,"DIA_GorNaVid_Teach_15_00");	//Я хочу учиться у тебя.
	AI_Output(self,other,"DIA_GorNaVid_Teach_09_01");	//Хорошо! Давай начнем тренировку.
	Info_ClearChoices(dia_gornavid_teach);
	Info_AddChoice(dia_gornavid_teach,Dialog_Back,dia_gornavid_teach_back);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
};

func void dia_gornavid_teach_back()
{
	Info_ClearChoices(dia_gornavid_teach);
};

func void b_gornavid_teachnomore1()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore1_09_00");	//Ты уже знаешь все, что только можно было узнать.
};

func void b_gornavid_teachnomore2()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore2_09_00");	//Мне больше нечему учить тебя.
};

func void b_gornavid_teachnomore3()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore3_09_00");	//Ты уже знаешь основы, для большего нет времени.
};

func void b_gornavid_teachnomore4()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore4_09_00");	//Чтобы усовершенствовать обращение с луком, ты должен найти настоящего учителя.
};

func void dia_gornavid_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	};
};

func void dia_gornavid_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
	};
};