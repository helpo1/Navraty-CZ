
instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_NO_TALK(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = dia_ignaz_no_talk_condition;
	information = dia_ignaz_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ignaz_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_PICKPOCKET(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 900;
	condition = DIA_Ignaz_PICKPOCKET_Condition;
	information = DIA_Ignaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ignaz_PICKPOCKET_Condition()
{
	return C_Beklauen(38,50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,Dialog_Back,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};


instance DIA_Ignaz_Hallo(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Ах - ты заглянул как раз вовремя. Мне нужен ассистент для магического эксперимента.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Я уверен, что тебе не терпится оказать мне услугу во имя науки.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Полегче, друг мой. Сначала скажи, в чем он заключается.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Я разработал новое заклинание! Заклинание Забвения.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Я уже придумал, как можно использовать его, но у меня нет времени на проведение одного последнего теста.
};


instance DIA_Ignaz_Traenke(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = "И что я получу за то, что помогу тебе?";
};


func int DIA_Ignaz_Traenke_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//И что я получу за то, что помогу тебе?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Я мог бы обучить тебя искусству приготовления зелий.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Я знаю рецепты лечебной эссенции и эссенции маны, а также зелья ускорения.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее об этом эксперименте и самом заклинании.";
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Расскажи мне подробнее об этом эксперименте и самом заклинании.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//Это заклинание позволяет заставить кого-нибудь забыть некоторые события.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Пока, я выяснил только, что оно работает, когда объект этого заклинания находится в ярости - например, если он только что был сбит с ног или ограблен.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//И даже несмотря на то, что эта неприятность произошла с ним только что, он все забудет.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//То есть я должен сбить кого-нибудь с ног и наложить на него это заклинание?
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(себе под нос) Здесь, в портовом квартале люди привычны к дракам. Мне лучше поискать жертву где-нибудь в другом месте...
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Да, ты все правильно понимаешь. Но чтобы разозлить кого-нибудь, достаточно просто атаковать - вовсе нет необходимости сбивать его с ног.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Только ты должен проделать все это без свидетелей - если неподалеку будут находиться другие люди, у тебя обязательно возникнут проблемы с лордом Андрэ.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Также не имеет смысла налагать это заклинание на того, кто атакует тебя. Выжди подходящий момент.
};


instance DIA_Ignaz_teilnehmen(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent = FALSE;
	description = "Хорошо, я испытаю это заклинание.";
};


func int DIA_Ignaz_teilnehmen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Хорошо, я испытаю это заклинание.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Тогда возьми этот свиток и найди подходящего подопытного кролика.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//А когда закончишь, возвращайся и расскажи мне как все прошло.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
	B_LogEntry(TOPIC_Ignaz,"Я должен испытать новое заклинание Игнаца. Это заклинание называется Забвение. Иногда кто-нибудь выходит из себя в результате драки или по другой причине и больше не хочет говорить со мной. Это идеальный момент для использования этого заклинания.");
	B_LogEntry(TOPIC_Ignaz,"Это идеальная возможность испытать заклинание. Подопытный также забудет доложить о произошедшем властям. Я не думаю, что кто-либо в портовом квартале сильно обидится, если я вырублю его.");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = "Насчет эксперимента...";
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//Насчет эксперимента...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//У тебя получилось, да? Или ты просто попусту истратил мой свиток?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Если тебе нужны еще свитки с этим заклинанием, ты можешь купить их у меня.
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Danach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent = FALSE;
	description = "Я использовал свиток.";
};


func int DIA_Ignaz_Danach_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Я использовал свиток.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Отлично, отлично. У тебя все получилось?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Да, заклинание сработало.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Превосходно. Может, с точки зрения науки это и не очень большое достижение, но для меня оно очень много значит!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Теперь я могу уделить тебе время и обучить тебя искусству алхимии.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Я также могу продать тебе что-нибудь полезное, если ты, конечно, хочешь этого.
	MIS_Ignaz_Charm = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Success);
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher,"Игнац может показать мне рецепты приготовления зелий. Он живет в портовом квартале.");
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Ignaz_Trade_Condition()
{
	if(Wld_IsTime(5,0,23,0) && ((MIS_Ignaz_Charm == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Ignaz_Running)))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = "Обучи меня искусству алхимии.";
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if((DIA_Ignaz_Teach_permanent == FALSE) && (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Обучи меня искусству алхимии.
	Info_ClearChoices(DIA_Ignaz_Teach);
	Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = talente + 1;
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Двойной напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED_02)),dia_ignaz_teach_speed_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE) && (PLAYER_TALENT_ALCHEMY[15] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Ты уже знаешь все, чему я мог обучить тебя.
		DIA_Ignaz_Teach_permanent = TRUE;
	}
	else if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Также тебе понадобятся различные растения и другие ингредиенты.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Что ты хочешь узнать?
		};
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void dia_ignaz_teach_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};


instance DIA_IGNAZ_RECEPTFORTYON(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_receptfortyon_condition;
	information = dia_ignaz_receptfortyon_info;
	permanent = FALSE;
	description = "Еще одно дело...";
};


func int dia_ignaz_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_ignaz_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Ignaz_ReceptForTyon_01_00");	//Еще один вопрос...
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_01");	//Что тебе нужно?
	AI_Output(other,self,"DIA_Ignaz_ReceptForTyon_01_02");	//Ты слышал про какое-нибудь зелье, способное воздействовать на сознание человека?
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_03");	//Что? (удивленно) Никогда не слышал ни о чем подобном.
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_05");	//Поговори с другими алхимиками. Может, кто-нибудь знает больше меня.
};


instance DIA_IGNAZ_PLANTSFROMTALIASAN(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_plantsfromtaliasan_condition;
	information = dia_ignaz_plantsfromtaliasan_info;
	permanent = FALSE;
	description = "Мне кажется, ты чем-то огорчен?";
};


func int dia_ignaz_plantsfromtaliasan_condition()
{
	if((MIS_FERNANDOHELP == LOG_Running) && Npc_KnowsInfo(hero,dia_taliasan_needbook))
	{
		return TRUE;
	};
};

func void dia_ignaz_plantsfromtaliasan_info()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_01_00");	//Мне кажется, ты чем-то огорчен?
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_03");	//Галлахад должен был мне принести новую партию трав для моих экспериментов.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_04");	//Но он до сих пор этого не сделал... Видимо, как всегда, забыл про наш уговор.
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_01_07");	//А почему ты сам не заберешь нужные тебе травы?
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_08");	//Я сходил бы, если бы у меня было свободное время. Но все оно уходит на эксперименты.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"Я могу сходить к нему вместо тебя.",dia_ignaz_plantsfromtaliasan_go);
};

func void dia_ignaz_plantsfromtaliasan_go()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_Go_01_00");	//Я могу сходить к нему вместо тебя.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_01");	//Правда? Это было бы здорово!
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_02");	//Я даже заплачу тебе за твою помощь.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_04");	//Как насчет ста золотых монет?
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"Слишком мало.",dia_ignaz_plantsfromtaliasan_no);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"По рукам!",dia_ignaz_plantsfromtaliasan_yes);
};

func void dia_ignaz_plantsfromtaliasan_no()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_No_01_00");	//Слишком мало. Я не буду терять время на такие мелочи.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_No_01_01");	//Извини, но большего я дать не могу.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_No_01_02");	//Ладно! Поищу кого-нибудь другого.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	AI_StopProcessInfos(self);
};

func void dia_ignaz_plantsfromtaliasan_yes()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_00");	//По рукам!
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_01");	//Отлично! Вот, возьми этот кошелек. Здесь ровно сто монет.
	B_GiveInvItems(self,other,ItSe_GoldPocket100_Ignaz,1);
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_02");	//А теперь ступай к Галлахаду и напомни ему, что он должен принести мне травы.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Log_CreateTopic(TOPIC_IGNAZHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_Running);
	B_LogEntry(TOPIC_IGNAZHELP,"Игнац попросил меня сходить к Галлахаду и напомнить ему, что он должен принести Игнацу новую партию трав для его экспериментов.");
	MIS_IGNAZHELP = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_TEACH_FIREARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 100;
	condition = dia_ignaz_teach_firearrows_condition;
	information = dia_ignaz_teach_firearrows_info;
	permanent = TRUE;
	description = "Научи меня делать огненные стрелы. (Оч. обучения: 5, Золото: 1500)";
};


func int dia_ignaz_teach_firearrows_condition()
{
	if((MIS_WolfAndMan == LOG_Success) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEFIREARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_firearrows_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_FireArrows_15_00");	//Научи меня делать огненные стрелы.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_FireArrows_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучен рецепт изготовления - 'Огненные стрелы'");
		KNOWHOWTOMAKEFIREARROWS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Теперь я могу делать огненные стрелы. Для этого мне необходимо иметь: древко для стрелы, стальной наконечник и серу. На каждые пять огненных стрел расходуется один кусок серы.");
	};
};


instance DIA_IGNAZ_TEACH_MAGICARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 101;
	condition = dia_ignaz_teach_magicarrows_condition;
	information = dia_ignaz_teach_magicarrows_info;
	permanent = TRUE;
	description = "Научи меня делать магические стрелы. (Оч. обучения: 5, Золото: 1500)";
};

func int dia_ignaz_teach_magicarrows_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicarrows_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_MagicArrows_15_00");	//Научи меня делать магические стрелы.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_MagicArrows_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучен рецепт изготовления - 'Магические стрелы'");
		KNOWHOWTOMAKEMAGICARROWS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Теперь я могу делать магические стрелы. Для этого мне необходимо иметь: древко для стрелы, стальной наконечник и ледяной кварц. На каждые пять магических стрел расходуется один ледяной кварц.");
	};
};

instance DIA_IGNAZ_TEACH_MAGICBOLT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 102;
	condition = dia_ignaz_teach_magicbolt_condition;
	information = dia_ignaz_teach_magicbolt_info;
	permanent = TRUE;
	description = "Научи меня делать магические болты. (Оч. обучения: 5, Золото: 1500)";
};


func int dia_ignaz_teach_magicbolt_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICBOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicbolt_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_MagicBolt_15_00");	//Научи меня делать магические болты.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_MagicBolt_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучен рецепт изготовления - 'Магические болты'");
		KNOWHOWTOMAKEMAGICBOLT = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Теперь я могу делать магические болты. Для этого мне необходимо иметь: древко для болта, стальной наконечник и ледяной кварц. На каждые пять магических болтов расходуется один ледяной кварц.");
	};
};

instance DIA_Ignaz_LOKIPOTION(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_LOKIPOTION_Condition;
	information = DIA_Ignaz_LOKIPOTION_Info;
	description = "Ты хорошо разбираешься в растениях?";
};

func int DIA_Ignaz_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_LOKIPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_00");	//Ты хорошо разбираешься в растениях?
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_01");	//Ну, не скажу, что во всех, но определенные познания в этой области у меня имеются.
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_02");	//А почему ты интересуешься?
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_03");	//Я ищу одно редкое растение - цветок кактуса. 
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_04");	//Может, ты знаешь, где его можно достать? 
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_05");	//Боюсь, ничем помочь не могу, поскольку я даже не слышал раньше об этом растении.
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_06");	//Попробуй поспрашивать об этом других алхимиков, может быть кто-то и знает о нем.
};

instance DIA_Ignaz_Werewolf(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Werewolf_Condition;
	information = DIA_Ignaz_Werewolf_Info;
	permanent = FALSE;
	description = "У тебя есть еще работа для меня?";
};

func int DIA_Ignaz_Werewolf_Condition()
{
	if(MIS_Ignaz_Charm == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_00");	//У тебя есть еще работа для меня?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_01");	//Возможно...(задумчиво) Правда, она довольно опасная. 
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_02");	//Выкладывай, что нужно сделать?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_03");	//Кроме алхимии меня интересует предмет трансформации в различных животных.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_04");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_05");	//Говоря об этом, я подразумеваю особые магические свитки, превращающие человека в падальщика, волка и других зверей.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_06");	//Эффект этих заклинаний абсолютно безвреден для человека и проходит со временем.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_07");	//(замявшись) По крайней мере, я считал так до недавнего времени.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_08");	//Что случилось?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_09");	//В ходе моего последнего эксперимента произошло какое-то страшное недоразумение.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_10");	//Возможно, я ошибся в формуле. Или по какой-то другой причине.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_11");	//Мой помощник, использовав свиток превращения в мракориса, не смог вернуться в свой человеческий облик.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_12");	//Более того, мне показалось, что звериные инстинкты полностью поглотили его разум!
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_13");	//Он набросился на меня...(нервно) Но, слава Инносу, мы проводили эксперимент совсем недалеко от городских ворот.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_14");	//Мне удалось спастись! А мой помощник убежал куда-то в лес.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_15");	//Да уж! Интересные у тебя эксперименты.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_16");	//Понимаешь, такого раньше никогда не случалось...(вздыхая) Но это не самое печальное!
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_17");	//Недавно я узнал, что несколько людей подверглись нападению какого-то страшного монстра.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_18");	//Похоже, что он даже загрыз одного из них! Теперь я не знаю, что и думать по этому поводу.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_19");	//В любом случае я должен как-то исправить свою ошибку.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_20");	//Это значит, что тебе придется найти моего помощника и убить его!
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_21");	//И тебе его совсем не жалко?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_22");	//От всего этого у меня камень на душе... Но я не вижу иного способа исправить ситуацию.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_23");	//Хорошо, я займусь этим. Где произошло нападение?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_24");	//(задумчиво) Кажется, где-то недалеко от восточных городских ворот.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_25");	//Попробуй спросить об этом стражу.
	MIS_WolfAndMan = LOG_Running;
	Log_CreateTopic(TOPIC_WolfAndMan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Running);
	B_LogEntry(TOPIC_WolfAndMan,"Игнац рассказал мне о неудачном эксперименте, в ходе которого его помощник безвозвратно превратился в огромного и страшного зверя. Судя по всему, тот уже успел кого-то загрызть! Поэтому Игнац попросил меня найти его и убить. По его словам, нападение произошло где-то рядом с восточными воротами Хориниса. Мне лучше расспросить об этом стражу.");
};


instance DIA_Ignaz_Werewolf_Done(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = DIA_Ignaz_Werewolf_Done_Condition;
	information = DIA_Ignaz_Werewolf_Done_Info;
	permanent = FALSE;
	description = "С твоим помощником все в порядке.";
};

func int DIA_Ignaz_Werewolf_Done_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman == TRUE) && (Npc_KnowsInfo(hero,DIA_Sagitta_Werewolf_Safe_Done) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_00");	//С твоим помощником все в порядке.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_01");	//Правда?
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_02");	//Да, и теперь он живет у Сагитты, лесной ведуньи. 
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_03");	//К нему даже вернулась человеческая память.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_04");	//Я знаю ее. Она добрая женщина! Думаю, с ней ему будет хорошо.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_05");	//Спасибо, что помог мне в этом деле.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_06");	//Вот, возьми этот магический свиток в качестве награды. 
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_07");	//Он довольно редкий, и сейчас это самое ценное, что у меня есть.
	MIS_WolfAndMan = LOG_Success;
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Success);
	B_LogEntry(TOPIC_WolfAndMan,"Игнац был рад услышать о том, что его помощник живет у Сагитты, пусть и в обличье мракориса.");
};