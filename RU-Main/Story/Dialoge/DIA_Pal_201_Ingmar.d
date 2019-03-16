
instance DIA_Ingmar_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hallo_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4) && (CITYHALLACCESSGRANTED == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if((EnterOW_Kapitel2 == FALSE) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Согласно полученным мной сообщениям, Долина Рудников - опасное место.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Позаботься о своем снаряжении, прежде чем отправляться туда.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Обстановка в Долине Рудников очень тревожит меня. Но мы разработаем план, чтобы преодолеть все опасности и вытащить наших парней оттуда вместе с рудой.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Я думал, ты пришел поговорить с лордом Хагеном. Так иди же к нему.
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "Как дела на материке?";
};


func int DIA_Ingmar_Krieg_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Как дела на материке?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Война еще не выиграна, хотя королевские войска уже теснят орков.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Но мелкие отряды орков появляются то здесь, то там, пытаясь рассредоточить нашу армию.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Они сражаются без мужества и без веры, и поэтому в конце концов мы обязательно победим.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Я могу научить тебя как стать сильнее, чтобы ты мог эффективнее действовать своим оружием.
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Паладин Ингмар может помочь мне стать сильнее.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Я обучаю только последователей нашего ордена.
	};
};


instance DIA_Ingmar_Teach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Ты и так силен как тролль! Мне нечему учить тебя.
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_RegenStam()
{
	var int kosten;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Научи меня ускоренному восстановлению выносливости.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Обучение: Ускоренная регенерация выносливости");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Регенерация выносливости (Очки обучения: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};


instance DIA_Ingmar_KAP3_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP3_EXIT_Condition;
	information = DIA_Ingmar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP4_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP4_EXIT_Condition;
	information = DIA_Ingmar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_ORKELITE(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = "Орки готовят массированное наступление.";
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (Hagen_SawOrcRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Орки готовят массированное наступление.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Да ну? Что ж, это очень интересно. А откуда тебе это известно?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Я говорил с ними.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Их лидеры появились в этой местности.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Ммм. Это не похоже на типичную стратегию орков.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Тебе нужно найти способ избавить нас от них.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Что нам делать теперь?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Что это значит?",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Ингмар был очень заинтересован историей об элитных воинах орков.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Тебе нужно найти способ избавить нас от них.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Было бы неплохо, если бы у нас была более подробная информация. Я пошлю кого-нибудь разведать окрестности.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Что это значит?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Если то, что ты говоришь, правда, это означает, что они надеются ослабить нас изнутри, нанеся удар своими лучшими воинами.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Обычно каждую орду орков возглавляет один предводитель. Крайне редко можно встретить двоих или больше вместе.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//На это есть причина. Их лидеры - ядро их атакующей стратегии, и обычно окружены простыми воинами-орками.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Поэтому очень трудно подобраться к кому-нибудь из них, не пробившись через орду не менее чем из 30 воинов.
	B_LogEntry(TOPIC_OrcElite,"Ингмар сказал, что-то о главе предводителей орков.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Что нам делать теперь?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Когда они встречаются в таком количестве, это обычно диверсионная группа, возглавляемая старшим по званию.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Этот высокопоставленный предводитель устраивает себе штаб-квартиру в одной из пещер, откуда направляет свои войска в бой.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Если бы мы смогли добраться до этого военачальника орков, мы получили бы решающее преимущество.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Военачальник орков обычно предпочитает находиться в непосредственной близости от своих врагов. Я бы посоветовал поискать его пещеру где-нибудь неподалеку от города.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Несколько орков было замечено у фермы Лобарта. Может быть, тебе попробовать начать поиски именно оттуда?
	B_LogEntry(TOPIC_OrcElite,"Согласно Ингмару, я должен найти полковника орков в пещере где-то неподалеку от фермы Лобарта. Ингмар хочет, чтобы я нашел и убил его.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "Я смог найти штаб-квартиру орков.";
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst) && Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Я смог найти штаб-квартиру орков. Их военачальник пал.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//Это отличные новости. Теперь орки некоторое время будут пребывать в растерянности.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Это неплохо. Если бы у нас было побольше рыцарей вроде тебя, за исход грядущей битвы можно было бы не волноваться.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Вот. Возьми это золото. Надеюсь, оно поможет тебе купить хорошее снаряжение.
	B_GivePlayerXP(XP_KilledOrkOberst);
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
};


instance DIA_Ingmar_KAP5_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP5_EXIT_Condition;
	information = DIA_Ingmar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP6_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP6_EXIT_Condition;
	information = DIA_Ingmar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ingmar_PICKPOCKET(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 900;
	condition = DIA_Ingmar_PICKPOCKET_Condition;
	information = DIA_Ingmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его свиток)";
};

func int DIA_Ingmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,Dialog_Back,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItSc_PalLight,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
};


instance DIA_INGMAR_ABOUTORKS(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 1;
	condition = dia_ingmar_aboutorks_condition;
	information = dia_ingmar_aboutorks_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь об орках?";
};


func int dia_ingmar_aboutorks_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void dia_ingmar_aboutorks_info()
{
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_00");	//Ты что-нибудь знаешь об орках?
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_01");	//Знаю ли я что-нибудь об орках? Парень, я наилучший знаток этих монстров во всем королевстве!
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_04");	//Тогда ты наверняка сможешь рассказать мне о них очень много интересного.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_07");	//Хорошо, слушай. Многие люди считают орков довольно примитивными созданиями.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_08");	//Но на самом у этих тварей есть своя строгая военная иерархия, довольно эффективная в плане организации.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_09");	//И, как видишь, это принесло им довольно неплохие плоды в войне с нами.
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_10");	//Что это за иерархия?
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_11");	//Первую ступень в ней занимают орки-воины - это основная боевая единица их армии. На орочьем языке этих воинов называют ГРАШ-РАМТОР!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_12");	//Они носят легкие кольчужные доспехи и не являются особо опасными противниками даже для простого охотника.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_13");	//Искусством сражения такие орки обычно не владеют, и стараются задавить своего врага лишь простым численным превосходством.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_14");	//Сразить такого монстра будет не особо тяжело.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_16");	//Следующие по рангу идут черные орки-воины или ЭРЗМРАКС-КОРРГРОН! Они очень сильны и хорошо владеют оружием ближнего боя.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_17");	//Схватка с таким противником будет серьезным испытанием для любого опытного воина. Поэтому старайся избегать встречи с ними, если у тебя нет прочных доспехов.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_18");	//Еще большую опасность представляют собой элитные черные орки-воины! Их называют ТАРШМОР-ГРОНСРОК, и этот противник - уже очень серьезное испытание даже для опытного рыцаря.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_19");	//Тяжелые доспехи надежно защищают их от мечей и топоров. И ко всему прочему, они также вооружены тяжелыми арбалетами, которые запросто пробьют саму прочную броню.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_21");	//Далее, вслед за ними по рангу следуют ГРАКС-НАРЗУЛГ - элитные черные орки-старейшины.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_22");	//Они на порядок сильнее обычных воинов, и в их компетенцию входит командование небольшими отрядами орков.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_23");	//Их нельзя встретить в больших количествах, но сражаться с ними так же тяжело, как и с нами - паладинами Инноса.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_24");	//Поэтому элитные черные орки-старейшины - наши самые серьезные противники на поле боя!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_25");	//Следующие в военной иерархии орков идут РОР-ГНОРК - элитные орочьи военачальники, которые командуют Гракс-Нарзулгами, направляя и координируя их действия.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_28");	//Эти элитные орки прекрасно владеют мечом и отлично разбираются в тактике ведения боя.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_29");	//Стоит тебе лишь на секунду потерять концентрацию - и их огромный меч разрубит тебя пополам!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_32");	//И последние в этом списке - это ВРУШМОР-КОГРОН, элитные орочьи предводители. Именно они управляют целыми армиями орков и ведут их в атаку.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_33");	//Убить такого противника - огромная честь для любого воина - и для паладина в том числе.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_34");	//Правда, на поле боя они показываются в довольно редких случаях и, как правило, в сопровождении многочисленной охраны.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_35");	//Так что, чтобы пробиться к ним, тебе сперва придется для начала уложить несколько дюжин вооруженных до зубов охранников, и только после этого у тебя появится шанс убить такого противника.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_37");	//Выше них по рангу стоят только могущественные вожди Орды. Но я никогда их не видел.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_39");	//И я даже понятия не имею, как они выглядят и насколько сильны.
};

instance DIA_Ingmar_CanTeachShield(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Condition;
	information = DIA_Ingmar_CanTeachShield_Info;
	permanent = FALSE;
	description = "У меня к тебе вопрос.";
};

func int DIA_Ingmar_CanTeachShield_Condition()
{
	if(CedricSendIngmar == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_00");	//У меня к тебе вопрос.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_01");	//Что тебя интересует?
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_02");	//Седрик сказал, что ты можешь достать для меня щит паладина.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_03");	//Ах, это...(ворчливо) Похоже, этот упрямец успокоится только тогда, когда мы все будем ходить с ними за спиной.
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_04");	//Ты с ним не согласен?
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_05");	//Я приверженец старого доброго двуручного меча. И лучше него ничего быть не может!
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_06");	//Так что насчет щита?
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_07");	//Ну, если ты так настаиваешь... Хорошо, я дам тебе щит паладина.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_08");	//Но чтобы носить его, ты должен хорошо владеть одноручным оружием.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_09");	//Я достаточно хорошо владею им.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_10");	//(вздыхая) Ну, хорошо. Вот, держи.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_11");	//Надеюсь, он хорошо послужит тебе в бою.
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_13");	//А насколько я могу судить, ты еще недостаточно опытен.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_14");	//Приходи, когда научишься лучше обращаться с одноручным мечом.
		NeedProofShield = TRUE;
	};
};

instance DIA_Ingmar_CanTeachShield_Perm(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Perm_Condition;
	information = DIA_Ingmar_CanTeachShield_Perm_Info;
	permanent = TRUE;
	description = "Дай мне щит паладина.";
};

func int DIA_Ingmar_CanTeachShield_Perm_Condition()
{
	if((NeedProofShield == TRUE) && (GetPalShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Perm_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_Perm_01_00");	//Дай мне щит паладина.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_01");	//А что насчет твоего умения сражаться одноручным оружием?
		AI_Output(other,self,"DIA_Ingmar_CanTeachShield_Perm_01_02");	//Я достаточно хорошо владею им.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_03");	//(вздыхая) Ну, хорошо. Вот, держи.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_04");	//Надеюсь, он хорошо послужит тебе в бою.
		GetPalShield = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_06");	//Я же сказал, что дам тебе его только в том случае, если ты будешь достаточно хорош в обращении с одноручным мечом.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_07");	//Что тут непонятного?
		Print("Владение одноручным оружием более 50...");
	};
};