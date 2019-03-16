
instance DIA_BIFF_LI_EXIT(C_Info)
{
	npc = djg_713_biff_li;
	nr = 999;
	condition = dia_biff_li_exit_condition;
	information = dia_biff_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_biff_li_exit_condition()
{
	return TRUE;
};

func void dia_biff_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PERM(C_Info)
{
	npc = djg_713_biff_li;
	nr = 5;
	condition = dia_biff_li_perm_condition;
	information = dia_biff_li_perm_info;
	permanent = TRUE;
	description = "На корабле все нормально?";
};


func int dia_biff_li_perm_condition()
{
	return TRUE;
};

func void dia_biff_li_perm_info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//На борту все спокойно?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(нервничает) Да, да. Все тихо.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PICKPOCKET(C_Info)
{
	npc = djg_713_biff_li;
	nr = 900;
	condition = dia_biff_li_pickpocket_condition;
	information = dia_biff_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_biff_li_pickpocket_condition()
{
	return C_Beklauen(92,450);
};

func void dia_biff_li_pickpocket_info()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
	Info_AddChoice(dia_biff_li_pickpocket,Dialog_Back,dia_biff_li_pickpocket_back);
	Info_AddChoice(dia_biff_li_pickpocket,DIALOG_PICKPOCKET,dia_biff_li_pickpocket_doit);
};

func void dia_biff_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_biff_li_pickpocket);
};

func void dia_biff_li_pickpocket_back()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
};


instance DIA_BIFF_LI_MISSMYGOLD(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_missmygold_condition;
	information = dia_biff_li_missmygold_info;
	permanent = FALSE;
	description = "Что-нибудь знаешь о моем золоте?";
};


func int dia_biff_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_biff_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Biff_LI_MissMyGold_01_01");	//Ты, случайно, не в курсе, куда подевалось мое золото?
	AI_Output(self,other,"DIA_Biff_LI_MissMyGold_01_02");	//Навряд ли! Я предпочитаю думать только о своем.
	B_LogEntry(TOPIC_MISSMYGOLD,"Бифф ничего толком и не смог сказать насчет пропажи моего золота.");
};


instance DIA_BIFF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_findmagicorecave_condition;
	information = dia_biff_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_biff_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Biff_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Biff_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Biff_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_BIFF_LI_CHANGECOURSE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_changecourse_condition;
	information = dia_biff_li_changecourse_info;
	permanent = FALSE;
	description = "Мы должны вернуться в Хоринис.";
};


func int dia_biff_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_biff_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_01_00");	//Мы должны снова вернуться в Хоринис.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_01_01");	//С чего бы это?
	Info_ClearChoices(dia_biff_li_changecourse);
	Info_AddChoice(dia_biff_li_changecourse,"Мне надо срочно поговорить с паладинами.",dia_biff_li_changecourse_ore);
	Info_AddChoice(dia_biff_li_changecourse,"Дело касается золота.",dia_biff_li_changecourse_gold);
};

func void dia_biff_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_01");	//Мне необходимо срочно поговорить с лордом Хагеном!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_02");	//Это еще зачем?
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_03");	//Необходимо сообщить паладинам о магической руде, которую мы нашли на этом острове.
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_04");	//Эта новость должна помочь им в войне против орков.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_05");	//Не думаю, что это должно нас так сильно волновать.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_07");	//Пускай паладины сами разбираются с этими мерзкими тварями, а нам лучше держаться в стороне от всего этого.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_09");	//У меня нет ни малейшего желания помогать паладинам!
	B_LogEntry(TOPIC_CHANGECOURSE,"Наемник Бифф против того, чтобы вернуться в Хоринис и помочь паладинам.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

func void dia_biff_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_01");	//Дело касается золота.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_02");	//В самом деле? И каким местом?
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_03");	//Необходимо сообщить паладинам о магической руде, которую мы нашли на этом острове.
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_04");	//Уверен, что было бы неплохо заработать на всем этом деле. Что скажешь?
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_05");	//Отличная идея, приятель!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_07");	//Я с тобой!
	B_LogEntry(TOPIC_CHANGECOURSE,"Наемник Бифф не против вернуться обратно в Хоринис.");
	CREWAGREEAWAYBACKSELL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

