
var int trd_diegoli;

instance DIA_PC_THIEF_LI_EXIT(C_Info)
{
	npc = pc_thief_li;
	nr = 999;
	condition = dia_pc_thief_li_exit_condition;
	information = dia_pc_thief_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pc_thief_li_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_LI_HELLOS(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_hellos_condition;
	information = dia_thief_li_hellos_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thief_li_hellos_condition()
{
	return TRUE;
};

func void dia_thief_li_hellos_info()
{
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_01");	//Итак, мы все снова вместе...(улыбается) Как в старые добрые времена!
	AI_Output(other,self,"DIA_Thief_LI_HelloS_01_02");	//Похоже на то. И что теперь будем делать?
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_03");	//Ну, думаю, поначалу не стоит предпринимать каких-то поспешных действий.
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_04");	//Ведь никто не знает, какие тайны скрывает этот остров.
	AI_Output(other,self,"DIA_Thief_LI_HelloS_01_05");	//А почему вы тогда сошли с корабля?
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_06");	//После этого шторма мне и большинству парней стало там не по себе. Да и тут все-таки куда поспокойнее.
};


instance DIA_THIEF_LI_ILL(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_ill_condition;
	information = dia_thief_li_ill_info;
	permanent = FALSE;
	description = "Ты выглядишь не слишком счастливым.";
};


func int dia_thief_li_ill_condition()
{
	return TRUE;
};

func void dia_thief_li_ill_info()
{
	AI_Output(other,self,"DIA_Thief_LI_Ill_01_01");	//Ты выглядишь не слишком счастливым.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_04");	//Это все проклятая качка, приятель! Я уже лет десять не поднимался на борт какого-либо корабля.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_05");	//А тут еще этот шторм! В итоге мой желудок всего этого не выдержал.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_08");	//Если у меня под рукой было бы несколько целебных трав, то они, возможно, смогли бы немного привести меня в чувство.
	AI_Output(other,self,"DIA_Thief_LI_Ill_01_09");	//Сколько тебе нужно?
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_10");	//Ну, точно не знаю... Но, думаю, что пяти растений будет вполне достаточно.
	MIS_DIEGOILL = LOG_Running;
	Log_CreateTopic(TOPIC_DIEGOILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_Running);
	B_LogEntry(TOPIC_DIEGOILL,"Во время шторма Диего сильно укачало, и теперь он неважно себя чувствует. Он попросил меня принести ему несколько целебных растений, которые приведут его в чувство. Пяти должно хватить.");
};


instance DIA_THIEF_LI_ILLDONE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdone_condition;
	information = dia_thief_li_illdone_info;
	permanent = FALSE;
	description = "Я принес тебе целебные травы.";
};


func int dia_thief_li_illdone_condition()
{
	if((MIS_DIEGOILL == LOG_Running) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 5))
	{
		return TRUE;
	};
};

func void dia_thief_li_illdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Thief_LI_IllDone_01_01");	//Я принес тебе целебные травы.
	AI_Output(self,other,"DIA_Thief_LI_IllDone_01_02");	//Отлично! Давай их сюда.
	AI_Output(other,self,"DIA_Thief_LI_IllDone_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItPl_Health_Herb_01,5);
	B_UseItem(self,ItPl_Health_Herb_01);
	AI_Output(self,other,"DIA_Thief_LI_IllDone_01_04");	//Ух... так-то намного лучше. Спасибо, приятель!
	MIS_DIEGOILL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_SUCCESS);
	B_LogEntry(TOPIC_DIEGOILL,"Я принес травы для Диего. Кажется, ему стало полегче.");
};


instance DIA_THIEF_LI_ILLDONES(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdones_condition;
	information = dia_thief_li_illdones_info;
	permanent = TRUE;
	description = "Как себя чувствуешь?";
};


func int dia_thief_li_illdones_condition()
{
	if(MIS_DIEGOILL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_thief_li_illdones_info()
{
	AI_Output(other,self,"DIA_Thief_LI_IllDones_01_01");	//Как себя чувствуешь?
	AI_Output(self,other,"DIA_Thief_LI_IllDones_01_02");	//Теперь уже куда лучше! Эти целебные травы оказались именно тем, что мне было нужно.
};


instance DIA_DIEGO_LI_TRADE(C_Info)
{
	npc = pc_thief_li;
	nr = 12;
	condition = dia_diego_li_trade_condition;
	information = dia_diego_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужно снаряжение.";
};


func int dia_diego_li_trade_condition()
{
	return TRUE;
};

func void dia_diego_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Мне нужна амуниция.
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Возможно, я смогу тебя выручить.

	if(TRD_DIEGOLI != TRUE)
	{
		CreateInvItems(self,ItRw_Arrow,160);
		CreateInvItems(self,ItRw_Bolt,120);
		CreateInvItems(self,ItKE_lockpick,20);
		CreateInvItems(self,ItRw_Bow_H_04,1);
		TRD_DIEGOLI = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_PC_THIEF_LI_TRAINING_TALENTE(C_Info)
{
	npc = pc_thief_li;
	nr = 10;
	condition = dia_pc_thief_li_training_talente_condition;
	information = dia_pc_thief_li_training_talente_info;
	permanent = TRUE;
	description = "Потренируй меня.";
};


func int dia_pc_thief_li_training_talente_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Потренируй меня.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//Что тебе нужно?
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_li_training_talente);
};

func void dia_pc_thief_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Тебе будет значительно легче, если ты будешь держаться подальше от линии огня.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Когда ты двигаешься, всегда помни о том, как легко передвигаются коты. Остальное придет само собой.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Для достижения лучшего результата побольше тренируйся.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//Чтобы твоя рука не дрожала, во время прицеливания старайся дышать пореже.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};


instance DIA_THIEF_LI_PICKPOCKET(C_Info)
{
	npc = pc_thief_li;
	nr = 900;
	condition = dia_thief_li_pickpocket_condition;
	information = dia_thief_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thief_li_pickpocket_condition()
{
	return C_Beklauen(120,600);
};

func void dia_thief_li_pickpocket_info()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
	Info_AddChoice(dia_thief_li_pickpocket,Dialog_Back,dia_thief_li_pickpocket_back);
	Info_AddChoice(dia_thief_li_pickpocket,DIALOG_PICKPOCKET,dia_thief_li_pickpocket_doit);
};

func void dia_thief_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_thief_li_pickpocket);
};

func void dia_thief_li_pickpocket_back()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
};


instance DIA_THIEF_LI_MISSMYGOLD(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_missmygold_condition;
	information = dia_thief_li_missmygold_info;
	permanent = FALSE;
	description = "Хочу спросить тебя про мое золото.";
};


func int dia_thief_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thief_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_01");	//Хочу спросить тебя про мое золото.
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_02");	//А с ним что-то не так?
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_03");	//Нет, с ним все в порядке, если не считать того факта - что его больше нет!
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_04");	//(удивленно) То есть как нет?
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_05");	//Трюм нашего корабля абсолютно пуст!
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_06");	//(растерянно) Вот так новость!
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_09");	//Я и понятия не имел, что оно куда-то подевалось.
	B_LogEntry(TOPIC_MISSMYGOLD,"Диего также не знает, каким образом мое золото пропало из трюма корабля.");
};


instance DIA_THIEF_LI_AWAY(C_Info)
{
	npc = pc_thief_li;
	nr = 3;
	condition = dia_thief_li_away_condition;
	information = dia_thief_li_away_info;
	permanent = FALSE;
	description = "Наш корабль готов к отплытию...";
};


func int dia_thief_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (DIEGOLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Thief_LI_Away_01_03");	//Наш корабль готов к отплытию и с первым же приливом мы поднимем паруса.
	AI_Output(self,other,"DIA_Thief_LI_Away_01_04");	//Хммм...(ехидно) Тогда, я полагаю, что стоит поспешить с возвращением на корабль.
	AI_Output(self,other,"DIA_Thief_LI_Away_01_05");	//А то мне как-то совсем не хочется застрять тут на всю оставшуюся жизнь.
	B_LogEntry(TOPIC_GATHERCREW,"Диего был рад возможности убраться с острова.");
	DIEGOLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_findmagicorecave_condition;
	information = dia_thief_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_thief_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Thief_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Thief_LI_FindMagicOreCave_01_02");	//(удивленно) Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Thief_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_THIEF_LI_CHANGECOURSE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_changecourse_condition;
	information = dia_thief_li_changecourse_info;
	permanent = FALSE;
	description = "Нам стоит вернуться обратно в Хоринис.";
};


func int dia_thief_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_thief_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_01_00");	//Нам стоит вернуться обратно в Хоринис.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_01_01");	//С чего это вдруг нам понадобилось это делать?
	Info_ClearChoices(dia_thief_li_changecourse);
	Info_AddChoice(dia_thief_li_changecourse,"Мы должны помочь паладинам!",dia_thief_li_changecourse_ore);
	Info_AddChoice(dia_thief_li_changecourse,"Речь идет о золоте.",dia_thief_li_changecourse_gold);
};

func void dia_thief_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_01");	//Мы должны помочь паладинам!
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_02");	//Интересно... И каким образом ты собираешься это сделать?
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_03");	//Необходимо сообщить им о магической руде, что мы нашли на этом острове.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_05");	//Мне кажется, что мы лезем не в свое дело.
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_08");	//Но это, возможно, наша последняя надежда в войне с орками!
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_09");	//Так что это и в наших интересах тоже.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_10");	//Эх, ладно...(ворчливо) Похоже, что ты действительно всерьез вознамерился это сделать.
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_11");	//Так ты со мной?
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_12");	//Хорошо! Но не думай, что я это делаю ради паладинов.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_13");	//Я поплыву с тобой лишь только потому, что ты - мой друг и мы многое пережили вместе.
	B_LogEntry(TOPIC_CHANGECOURSE,"После долгих споров, Диего все-таки согласился плыть со мной обратно в Хоринис.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

func void dia_thief_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Gold_01_01");	//Дело касается золота.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_02");	//(с интересом) О золоте?..
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Gold_01_03");	//Думаю, что лорд Хаген выложит приличную кучу золота за информацию о руде, которую мы нашли на этом острове.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_06");	//Ладно...(ехидно) Тогда можешь считать, что я с тобой!
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_07");	//Думаю, мне бы тоже не помешало потуже набить золотом свои карманы.
	B_LogEntry(TOPIC_CHANGECOURSE,"Диего согласился плыть со мной обратно в Хоринис.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

