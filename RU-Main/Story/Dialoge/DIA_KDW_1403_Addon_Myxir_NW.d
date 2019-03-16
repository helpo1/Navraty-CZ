
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = "Все в порядке?";
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Заявиться сюда было с твоей стороны очень смелым поступком.
};


instance DIA_Addon_Myxir_WasMachstDu(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = "Чем ты здесь занимаешься?";
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Я изучаю язык зодчих.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//Язык - это ключ к тому, чтобы понять этих людей.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Каждый из нас должен выучить этот язык, иначе экспедиция закончится, даже не начавшись.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Зодчие выбивали свои тексты на каменных табличках. К сожалению, многие из них давно разбиты или украдены.
};


instance DIA_Addon_Myxir_Steintafeln(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = "Что же можно узнать из этих табличек?";
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//Что же можно узнать из этих табличек?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//На них записаны знания древнего народа.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Некоторые из них волшебным образом увеличивают магические или боевые способности.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Для тех, кто способен их прочесть, они являются настоящим сокровищем.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,"На каменных табличках записаны древние знания зодчих. Некоторые из них могут волшебным образом увеличить познания в области сражений или магии. Однако их нужно еще суметь прочитать.");
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = "Ты можешь научить меня языку Зодчих?";
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Ты можешь научить меня языку Зодчих?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//Конечно, почему нет? Я с радостью поделюсь с тобой своими знаниями.
	Myxir_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Stoneplates,LogText_Addon_MyxirTeach);
};

var int DIA_Addon_Myxir_Teach_NoPerm;
var int DIA_Addon_Myxir_Teach_OneTime;

instance DIA_Addon_Myxir_Teach(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 90;
	condition = DIA_Addon_Myxir_Teach_Condition;
	information = DIA_Addon_Myxir_Teach_Info;
	permanent = TRUE;
	description = "Научи меня этому языку.";
};

func int DIA_Addon_Myxir_Teach_Condition()
{
	if((Myxir_Addon_TeachPlayer == TRUE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Научи меня этому языку.

	if(DIA_Addon_Myxir_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach,Dialog_Back,DIA_Addon_Myxir_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Больше мне нечего тебе показать. Ты изучил язык зодчих.
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Ну, начнем с чего-нибудь простого. В первую очередь займемся языком крестьян.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Как правило, тексты, написанные на языке крестьян, связаны с нашим миром, с такими понятиями, как работа, любовь, добыча пищи.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Это - основной язык города. Ты сможешь прочесть большинство текстов, которые найдешь здесь, если его освоишь.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Ты уже знаком с языком крестьян. Язык воинов немного более сложен.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Тексты, написанные на языке воинов, в основном касаются войн и оружия. Ты узнаешь кое-что полезное.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Высокий штиль жрецов трудно понять. Но я с радостью обучу тебя ему.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//Помимо прочего, священные книги, описывающие историю и магию создателей, написаны на языке жрецов.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Каждый из этих текстов - настоящее сокровище, если, конечно, ты можешь его понять.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};


instance DIA_ADDON_MYXIR_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 1;
	condition = dia_addon_myxir_prayforgomez_condition;
	information = dia_addon_myxir_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_myxir_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Myxir_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Myxir_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};

