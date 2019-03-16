
instance DIA_LEE_LI_EXIT(C_Info)
{
	npc = sld_800_lee_li;
	nr = 999;
	condition = dia_lee_li_exit_condition;
	information = dia_lee_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lee_li_exit_condition()
{
	return TRUE;
};

func void dia_lee_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_LI_PERM6(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_perm6_condition;
	information = dia_lee_li_perm6_info;
	permanent = TRUE;
	description = "Как дела у моего корабля? ";
};


func int dia_lee_li_perm6_condition()
{
	return TRUE;
};

func void dia_lee_li_perm6_info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Как мой корабль?
	AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Не волнуйся. Я держу все под контролем.
};


instance DIA_LEE_LI_TEACH(C_Info)
{
	npc = sld_800_lee_li;
	nr = 10;
	condition = dia_lee_li_teach_condition;
	information = dia_lee_li_teach_info;
	permanent = TRUE;
	description = "Я нуждаюсь в тренировке.";
};


func int dia_lee_li_teach_condition()
{
	return TRUE;
};

func void dia_lee_li_teach_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//Что именно ты хочешь улучшить?
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_back()
{
	Info_ClearChoices(dia_lee_li_teach);
};

func void dia_lee_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Твоя защита ужасна, но мы что-нибудь сделаем с этим.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Твои кисти слишком напряжены. Ты должен держать оружие свободнее.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Всегда помни: боковой удар должен идти от бедра, а не от запястья.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Сильнейший удар бесполезен, если он приходится в никуда. Так что старайся точно рассчитывать удары.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};


instance DIA_LEE_LI_PICKPOCKET(C_Info)
{
	npc = sld_800_lee_li;
	nr = 900;
	condition = dia_lee_li_pickpocket_condition;
	information = dia_lee_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lee_li_pickpocket_condition()
{
	return C_Beklauen(110,570);
};

func void dia_lee_li_pickpocket_info()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
	Info_AddChoice(dia_lee_li_pickpocket,Dialog_Back,dia_lee_li_pickpocket_back);
	Info_AddChoice(dia_lee_li_pickpocket,DIALOG_PICKPOCKET,dia_lee_li_pickpocket_doit);
};

func void dia_lee_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_lee_li_pickpocket);
};

func void dia_lee_li_pickpocket_back()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
};


instance DIA_LEE_LI_MISSMYGOLD(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_missmygold_condition;
	information = dia_lee_li_missmygold_info;
	permanent = FALSE;
	description = "Ты не знаешь, куда подевалось мое золото?";
};


func int dia_lee_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lee_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Lee_LI_MissMyGold_01_01");	//Ты не знаешь, куда подевалось мое золото?
	AI_Output(self,other,"DIA_Lee_LI_MissMyGold_01_02");	//Нет, парень, не знаю. Да и некогда мне следить за ним.
	AI_Output(other,self,"DIA_Lee_LI_MissMyGold_01_03");	//Ясно.
	B_LogEntry(TOPIC_MISSMYGOLD,"Ли тоже мне не может помочь в этом вопросе.");
};


instance DIA_LEE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_findmagicorecave_condition;
	information = dia_lee_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_lee_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Lee_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Lee_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Lee_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LEE_LI_CHANGECOURSE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_changecourse_condition;
	information = dia_lee_li_changecourse_info;
	permanent = FALSE;
	description = "Нам необходимо вернуться обратно в Хоринис.";
};


func int dia_lee_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lee_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_01_00");	//Нам стоит вернуться обратно в Хоринис.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_01_01");	//И с какой стати нам это делать?
	Info_ClearChoices(dia_lee_li_changecourse);
	Info_AddChoice(dia_lee_li_changecourse,"Для того, чтобы сообщить паладинам о найденной нами руде.",dia_lee_li_changecourse_ore);
	Info_AddChoice(dia_lee_li_changecourse,"Ради огромной кучи золота!",dia_lee_li_changecourse_gold);
};

func void dia_lee_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_01");	//Мы должны помочь паладинам! Необходимо сообщить им о магической руде, что мы нашли на этом острове.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_02");	//Думаю, это даст им небольшое преимущество в войне с орками.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_03");	//И что с того? Нам-то какое дело до паладинов!
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_04");	//Меня интересует судьба только моих людей. Я не буду ничего делать для этих идиотов!
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_07");	//Лучше подумай о том, что, оказав подобную услугу паладинам, ты сможешь потребовать от них все, что захочешь.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_08");	//Хммм. Очень интересно. И что же, по-твоему, мне сможет предложить лорд Хаген?
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_09");	//Ты бы мог потребовать от него амнистию для всех своих людей.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_10");	//Ведь большинство из них остались в Хоринисе.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_14");	//(задумчиво) Да, ты прав. Возможно, это действительно шанс спасти моих людей!
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_15");	//Я должен попытаться сделать для них все, что в моих силах.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_16");	//Так ты со мной?
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_17");	//Хорошо! Я отправлюсь с тобой в Хоринис.
	B_LogEntry(TOPIC_CHANGECOURSE,"Я смог убедить Ли отправиться обратно в Хоринис, чтобы помочь паладинам.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

func void dia_lee_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Gold_01_01");	//Ради огромной кучи золота! Разве это не повод, чтобы вернуться?
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_02");	//Очень интересно. И где ты собираешься искать эту самую кучу?
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Gold_01_03");	//Ее нам дадут паладины, когда мы сообщим им о руде, найденной на этом острове.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_07");	//Я сомневаюсь, что у паладинов найдется такое количество золота, ради которого стоило бы возвращаться.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_08");	//К тому же в Хоринисе уже могут быть орки! А значит, мы просто проделаем наш путь впустую.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_10");	//(серьезно) Думаю, наше возвращение не имеет никакого смысла.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_11");	//Это мое мнение. Но решение принимать тебе.
	B_LogEntry(TOPIC_CHANGECOURSE,"Ли считает, что возвращаться в Хоринис не имеет смысла.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

