
instance DIA_WOLF_LI_EXIT(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 999;
	condition = dia_wolf_li_exit_condition;
	information = dia_wolf_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_wolf_li_exit_condition()
{
	return TRUE;
};

func void dia_wolf_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_LI_TRAINING(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 10;
	condition = dia_wolf_li_training_condition;
	information = dia_wolf_li_training_info;
	permanent = TRUE;
	description = "Тренируй меня в стрельбе.";
};


func int dia_wolf_li_training_condition()
{
	return TRUE;
};

func void dia_wolf_li_training_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Обучи меня стрельбе.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//Из чего?
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_back()
{
	Info_ClearChoices(dia_wolf_li_training);
};

func void dia_wolf_li_training_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//В отличии от арбалета, лук - громоздкий и требует много места. Смотри, что в во время боя его у тебя хватало.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Пускай тетиву с легкостью, когда пускаешь стрелу. Неповоротливый палец задает стреле неправильную траекторию.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Пытайся при стрельбе не расшатывать арбалет. Для этого осторожно спускай курок.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Смышленый стрелок всегда обращает внимание на ветер и не стреляет против него.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};


instance DIA_WOLF_LI_PICKPOCKET(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 900;
	condition = dia_wolf_li_pickpocket_condition;
	information = dia_wolf_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_wolf_li_pickpocket_condition()
{
	return C_Beklauen(32,45);
};

func void dia_wolf_li_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
	Info_AddChoice(dia_wolf_li_pickpocket,Dialog_Back,dia_wolf_li_pickpocket_back);
	Info_AddChoice(dia_wolf_li_pickpocket,DIALOG_PICKPOCKET,dia_wolf_li_pickpocket_doit);
};

func void dia_wolf_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_wolf_li_pickpocket);
};

func void dia_wolf_li_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
};


instance DIA_WOLF_LI_MISSMYGOLD(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_missmygold_condition;
	information = dia_wolf_li_missmygold_info;
	permanent = FALSE;
	description = "У меня есть вопрос.";
};


func int dia_wolf_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_wolf_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_MissMyGold_01_01");	//У меня есть вопрос.
	AI_Output(other,self,"DIA_Wolf_LI_MissMyGold_01_03");	//Куда подевалось мое золото?
	AI_Output(self,other,"DIA_Wolf_LI_MissMyGold_01_04");	//Не имею ни малейшего понятия. Спроси лучше об этом у других парней.
	B_LogEntry(TOPIC_MISSMYGOLD,"Наемник Вольф ничего не знает о пропаже золота.");
};


instance DIA_WOLF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_findmagicorecave_condition;
	information = dia_wolf_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_wolf_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Wolf_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Wolf_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_WOLF_LI_CHANGECOURSE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_changecourse_condition;
	information = dia_wolf_li_changecourse_info;
	permanent = FALSE;
	description = "Ты не прочь отправиться обратно в Хоринис?";
};


func int dia_wolf_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_wolf_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_01_00");	//Ты не хотел бы вернуться обратно в Хоринис?
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_01_01");	//Хммм...(задумчиво) А почему ты спрашиваешь?
	Info_ClearChoices(dia_wolf_li_changecourse);
	Info_AddChoice(dia_wolf_li_changecourse,"Нужно вернуться на остров и помочь паладинам.",dia_wolf_li_changecourse_ore);
	Info_AddChoice(dia_wolf_li_changecourse,"Есть возможность неплохо заработать.",dia_wolf_li_changecourse_gold);
};

func void dia_wolf_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_01");	//Нужно вернуться на остров и помочь паладинам!
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_02");	//(удивленно) Паладинам? И ты полагаешь, что ради этого нам стоит вернуться обратно?
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_03");	//Надо сообщить им о руде, которую мы обнаружили на этом острове.
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_04");	//Это даст им небольшое преимущество в войне против орков.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_05");	//Извини, приятель, но я против этой идеи!
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_06");	//Я не имею никакого желания рисковать собственной шкурой ради того, что меня интересует меньше всего.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_07");	//К тому же мне и так хватило по горло тех лет, которые я провел в Долине Рудников, добывая руду для этих болванов.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_08");	//Пусть паладины сами заботятся о своей судьбе. И на мою помощь пусть не рассчитывают.
	B_LogEntry(TOPIC_CHANGECOURSE,"Наемник Вольф категорически отказался от идеи плыть обратно в Хоринис, чтобы помочь паладинам.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

func void dia_wolf_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_01");	//Есть возможность неплохо заработать.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_02");	//Правда? И как же?
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_03");	//Нужно вернуться на остров и сообщить паладинам о руде, которую мы обнаружили на этом острове.
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_04");	//Думаю, им придется хорошенько раскошелиться, чтобы узнать где находится этот остров.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_05");	//(ехидно) Отличная идея, приятель! Мне она очень нравится.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_08");	//Раз такое дело - плывем обратно в Хоринис!
	B_LogEntry(TOPIC_CHANGECOURSE,"Наемник Вольф поддержал идею отплыть обратно в Хоринис, чтобы стребовать с паладинов золото за найденную нами магическую руду.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

