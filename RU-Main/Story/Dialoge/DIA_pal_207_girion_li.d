
instance DIA_GIRION_LI_XIT(C_Info)
{
	npc = pal_207_girion_li;
	nr = 999;
	condition = dia_girion_li_exit_condition;
	information = dia_girion_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_girion_li_exit_condition()
{
	return TRUE;
};

func void dia_girion_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_LI_TEACH(C_Info)
{
	npc = pal_207_girion_li;
	nr = 5;
	condition = dia_girion_li_teach_condition;
	information = dia_girion_li_teach_info;
	permanent = TRUE;
	description = "Может быть поупражняемся с мечом?";
};


func int dia_girion_li_teach_condition()
{
	return TRUE;
};

func void dia_girion_li_teach_info()
{
	AI_Output(other,self,"DIA_Girion_LI_Teach_15_00");	//Может, поупражняемся с мечом?
	AI_Output(self,other,"DIA_Girion_LI_Teach_08_01");	//Ну, давай. Хоть как-то скоротаем время.
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_back()
{
	Info_ClearChoices(dia_girion_li_teach);
};

func void dia_girion_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Твое лезвие должно скользить по воздуху, как камыш на побережье.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Силу нужно применять расчетливо. Если ты слепо будешь бросаться на противника, это не приведет тебя к успеху.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Не сжимай судорожно руку, тогда твой удар встретит свою цель.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Не забывай защищаться. Но лучшая защита все же - уклоняться от удара противника.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};


instance DIA_GIRION_LI_PICKPOCKET(C_Info)
{
	npc = pal_207_girion_li;
	nr = 900;
	condition = dia_girion_li_pickpocket_condition;
	information = dia_girion_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_girion_li_pickpocket_condition()
{
	return C_Beklauen(71,260);
};

func void dia_girion_li_pickpocket_info()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
	Info_AddChoice(dia_girion_li_pickpocket,Dialog_Back,dia_girion_li_pickpocket_back);
	Info_AddChoice(dia_girion_li_pickpocket,DIALOG_PICKPOCKET,dia_girion_li_pickpocket_doit);
};

func void dia_girion_li_pickpocket_doit()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(dia_girion_li_pickpocket);
};

func void dia_girion_li_pickpocket_back()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
};


instance DIA_GIRION_LI_MISSMYGOLD(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_missmygold_condition;
	information = dia_girion_li_missmygold_info;
	permanent = FALSE;
	description = "У меня пропало мое золото.";
};


func int dia_girion_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_girion_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Girion_LI_MissMyGold_01_01");	//У меня пропало мое золото.
	AI_Output(self,other,"DIA_Girion_LI_MissMyGold_01_02");	//Погоди-ка. Уж не думаешь ли ты, что паладин короля способен на кражу?
	AI_Output(self,other,"DIA_Girion_LI_MissMyGold_01_04");	//Мне ничего об этом не известно.
	B_LogEntry(TOPIC_MISSMYGOLD,"Гирион ничего не знает о моем золоте.");
};


instance DIA_GIRION_LI_CHANGECOURSE(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_changecourse_condition;
	information = dia_girion_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_girion_li_changecourse_info()
{
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_00");	//Я слышал, что тебе удалось найти на этом острове большие залежи магической руды.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_02");	//Полагаю, теперь мы просто обязаны вернуться в Хоринис и сообщить об этом лорду Хагену.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_03");	//Паладины должны узнать об этой руде!
	Info_ClearChoices(dia_girion_li_changecourse);
	Info_AddChoice(dia_girion_li_changecourse,"Я полностью с тобой согласен.",dia_girion_li_changecourse_ore);
	Info_AddChoice(dia_girion_li_changecourse,"Только если паладины заплатят за эту информацию.",dia_girion_li_changecourse_gold);
};

func void dia_girion_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Girion_LI_ChangeCourse_Ore_01_00");	//Я полностью с тобой согласен. Мы отправимся туда, как только починим наш корабль.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_01");	//(с уважением) Других слов я от тебя и не ожидал.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_02");	//Найденная тобой руда повысит наши шансы на успех в войне против орков.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_03");	//Возможно, это даже наша последняя надежда...
	B_LogEntry(TOPIC_CHANGECOURSE,"Гирион рад был услышать о том, что мы возвращаемся в Хоринис, чтобы сообщить лорду Хагену о магической руде на острове.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

func void dia_girion_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Girion_LI_ChangeCourse_Gold_01_00");	//Только если паладины заплатят за эту информацию.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_02");	//Что?! Ты же паладин! Как ты можешь так поступать?
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_03");	//Неужели в тебе нет ни капли чести и благородства?
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_04");	//Что?! Очень странно слышать подобные слова от достопочтенного мага Огня!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_05");	//Неужели слуга Инноса ценит золото дороже, чем свой священный долг?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_06");	//Что?! Очень странно слышать подобные слова от достопочтенного мага Воды!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_07");	//Неужели слуга Аданоса ценит золото дороже, чем честь и благородство?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_08");	//(надменно) Ничего другого я от тебя услышать не ожидал.
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_09");	//Вас, темных магов, всегда интересует только собственные дела, и вам наплевать на судьбу других!
	}
	else if((other.guild == GIL_DJG) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_10");	//Ну, конечно. Других слов я от тебя и не ожидал!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_11");	//Вас, наемников, всегда интересует только золото.
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_12");	//Что?! Неужели в тебе нет ни капли чести и благородства?
	};
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_15");	//Я все же надеюсь, что ты изменишь свое решение.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_16");	//Ведь от этого зависит жизнь многих людей!
	B_LogEntry(TOPIC_CHANGECOURSE,"Гирион был возмущен моей идеей нажиться на нужде паладинов.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

