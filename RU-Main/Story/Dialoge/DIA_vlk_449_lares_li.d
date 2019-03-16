
instance DIA_LARES_LI_EXIT(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 999;
	condition = dia_lares_li_exit_condition;
	information = dia_lares_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lares_li_exit_condition()
{
	return TRUE;
};

func void dia_lares_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_LI_TRAINING(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 10;
	condition = dia_lares_li_training_condition;
	information = dia_lares_li_training_info;
	permanent = TRUE;
	description = "Научи меня своим способностям. ";
};


func int dia_lares_li_training_condition()
{
	return TRUE;
};

func void dia_lares_li_training_info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//Научи меня твоим способностям.
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//Нет проблем.
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_back()
{
	Info_ClearChoices(dia_lares_li_training);
};

func void dia_lares_li_training_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Тебе нужно согнуть немного переднюю ногу и выпрямить спину. Так ты займешь правильную стойку.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Не напрягай бедра, это позволит тебе вовремя уклониться от контратаки.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//Верхняя часть твоего туловища должна действовать согласованно с нижней.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Всегда следи за своими ногами.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};


instance DIA_LARES_LI_MISSMYGOLD(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_missmygold_condition;
	information = dia_lares_li_missmygold_info;
	permanent = FALSE;
	description = "Ты случайно не знаешь, где мое золото?";
};


func int dia_lares_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lares_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Lares_LI_MissMyGold_01_01");	//Ты случайно не знаешь, где мое золото?
	AI_Output(self,other,"DIA_Lares_LI_MissMyGold_01_02");	//Нет, приятель...(улыбается) Я даже его в глаза не видел!
	B_LogEntry(TOPIC_MISSMYGOLD,"Ларес не знает о пропаже золота из трюма корабля.");
};


instance DIA_LARES_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_findmagicorecave_condition;
	information = dia_lares_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_lares_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Lares_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Lares_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Lares_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LARES_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_changecourse_condition;
	information = dia_lares_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lares_li_changecourse_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_00");	//Я слышал, что ты хочешь вернуться в Хоринис?
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_01");	//Да, это правда. Я как раз хотел поговорить с тобой на эту тему.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_02");	//Ну, если ты хочешь знать мое мнение, то я буду следовать твоим решениям.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_05");	//В своей жизни я редко встречал людей, похожих на тебя.
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_06");	//Правда? А разве я чем-то отличаюсь от остальных?
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_09");	//(смеется) Порой твои действия совершенно непредсказуемы и несут в себе потаенный смысл, недоступный для моего понимания.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_10");	//Иногда мне кажется, что сами боги определяют твой путь и ведут тебя по нему!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_12");	//Помнишь, когда мы с тобой встретились в первый раз?
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_13");	//Да, я помню. Это произошло в Новом лагере...
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_14");	//Да. Так вот... Уже тогда я подсознательно чувствовал, что в тебе есть нечто такое, что отличало тебя от других людей. И я оказался прав!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_15");	//Вначале ты низверг Спящего и разрушил магический барьер! Потом тебе как-то удалось уничтожить Ворона, не дав ему привести темное зло в этот мир.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_16");	//И, наконец, ты практически в одиночку совершил то, что оказалось не под силу даже всей армии паладинов - убить существо, в котором была сосредоточена вся сила Темного бога!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_17");	//Разве все это не говорит о многом?
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_18");	//И вот теперь ты решаешь вернуться в Хоринис. Честно говоря, я даже и представить себе не могу, чем все это может закончиться.
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_21");	//Думаю, по прибытию в Хоринис мы узнаем это.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_22");	//Ты прав. Все дело времени...
	B_LogEntry(TOPIC_CHANGECOURSE,"Ларесу все равно, вернемся ли мы обратно в Хоринис или поплывем на материк.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
};

