var int SagittaMakeOnce;

instance DIA_Sagitta_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_NO_TALK(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = dia_sagitta_no_talk_condition;
	information = dia_sagitta_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_sagitta_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sagitta_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 4;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HALLO_Info;
	description = "Ты здесь совсем одна?";
};


func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Ты здесь совсем одна?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Говори, что тебе нужно от меня, и уходи. Я занята.
	Info_ClearChoices(DIA_Sagitta_HALLO);
	Info_AddChoice(DIA_Sagitta_HALLO,Dialog_Back,DIA_Sagitta_HALLO_ende);
	Info_AddChoice(DIA_Sagitta_HALLO,"Ты можешь вылечить меня?",DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO,"Что ты делаешь здесь?",DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HALLO,"Кто ты?",DIA_Sagitta_HALLO_wer);
};

func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Ты что, никогда не слышал обо мне?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Меня называют ведьмой-целительницей. А еще шаманкой.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Но когда им плохо, все они неожиданно вспоминают старую добрую Сагитту и ее целебные травы.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Я живу здесь столько, сколько себя помню! И занимаюсь травами.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Лес - мой друг. Он дает мне то, что мне нужно.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Ты можешь вылечить меня?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//Ты за этим пришел, да? Дай мне знать, если с тобой будет что-то не в порядке.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"У Сагитты, живущей за фермой Секоба, можно купить различные товары.");
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};


instance DIA_Sagitta_TeachAlchemyRequest(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня готовить зелья?";
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (MIS_Sagitta_Herb == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;

func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Ты можешь научить меня готовить зелья?
	if(DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Как интересно. Меня нечасто о таком просят.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Так ты хочешь быть моим учеником? Тогда тебе сначала нужно доказать, что твои намерения серьезны.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Я сейчас работаю над очень редким зельем, которое готовится из весьма специфических трав и растений.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Если бы ты принес мне один ингредиент - очень редкое растение, которого у меня нет - я обучу тебя.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Я уже сказала тебе: да, после того, как ты принесешь мне этот редкий ингредиент, что я просила.
	};
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Извини, но мне это не интересно.",DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Где можно найти этот ингредиент?",DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Что это за ингредиент?",DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//Что это за ингредиент?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//Это очень редкое растение - трава, называемая солнечное алоэ. Ты узнаешь его по сильному миндальному аромату.
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//Где можно найти этот ингредиент?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Трава, необходимая мне, произрастает только в местах, где есть все питательные вещества, необходимые для ее роста.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Обычно она встречается на экскрементах черного тролля.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//Вот почему мне так сложно достать эту траву, понимаешь?
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Посмотрим, может, мне удастся найти ее где-нибудь.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Посмотрим, может, мне удастся найти ее где-нибудь.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Удачи тебе в твоих поисках.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb,"Сагитте нужно очень редкое растение! Это солнечное алоэ, которое растет только на экскрементах черных троллей.");
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Извини, но мне это не интересно.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Тогда хватит тратить мое время на всякую чепуху.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Sagitta_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = "Я нашел солнечное алоэ.";
};


func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if(Npc_HasItems(other,ItPl_Xagitta_Herb_MIS) && (MIS_Sagitta_Herb == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Я нашел солнечное алоэ.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Спасибо. Теперь ты можешь спрашивать меня обо всем, что хочешь узнать о приготовлении зелий.
	B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
	Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};


instance DIA_Sagitta_Teach(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent = TRUE;
	description = "Какие зелья можешь ты научить меня варить?";
};


var int DIA_Sagitta_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Какие зелья можешь ты научить меня варить?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Эликсир ловкости",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Напиток выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_STAMINA)),dia_sagitta_teach_stamina);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Эликсир выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),dia_sagitta_teach_perm_stamina);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Прежде чем приступить к обучению тебя алхимии, я сначала расскажу, что необходимо иметь для приготовления зелий.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Все зелья готовятся на алхимическом столе. Тебе также понадобится пустая мензурка, в которой будет храниться приготовленное зелье.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Тебе нужно смешать необходимые ингредиенты и все - зелье готово.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Ну а дополнительные подробности ты всегда можешь узнать у меня, если захочешь.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//Так какое зелье тебя интересует?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Ты уже знаешь все, чему я могла научить тебя.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void dia_sagitta_teach_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void dia_sagitta_teach_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Sagitta_Teach);
};


instance DIA_SAGITTA_ALOE(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloe_condition;
	information = dia_sagitta_aloe_info;
	permanent = FALSE;
	description = "А что это за напиток из солнечного алоэ?";
};


func int dia_sagitta_aloe_condition()
{
	if(Sagitta_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void dia_sagitta_aloe_info()
{
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_00");	//А что это за напиток из солнечного алоэ, который ты собираешься приготовить?
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_01");	//О, это совершенно особенный напиток. Он делает твою шкуру такой же крепкой, как у тролля.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_02");	//Но его рецепт я тебе не скажу.
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_03");	//А сварить его ты мне сможешь?
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_04");	//Из этого растения? Боюсь, что нет. Напиток из него мне уже заказали.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_05");	//Если ты найдешь еще где-нибудь это растение, тогда приноси - и я сделаю тебе этот напиток.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_06");	//Не бесплатно, разумеется.
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_07");	//Понятно.
};


instance DIA_SAGITTA_ALOEREADY(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloeready_condition;
	information = dia_sagitta_aloeready_info;
	permanent = TRUE;
	description = "У меня с собой есть еще одно солнечное алое!";
};

func int dia_sagitta_aloeready_condition()
{
	if((Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,dia_sagitta_aloe) && (Npc_HasItems(other,ItPl_Xagitta_Herb_MIS) >= 1) && (SAGITTAONWORK == FALSE) && (SagittaMakeOnce == FALSE))
	{
		return TRUE;
	};
};

func void dia_sagitta_aloeready_info()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_01_00");	//У меня с собой есть еще одно солнечное алое!
	if(SAGITTA_SECONDAALOE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_01");	//Удивительно! Как тебе удалось его достать?
		AI_Output(other,self,"DIA_Sagitta_AloeReady_01_02");	//Пришлось немного потрудиться.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_03");	//Ну что же, ладно. Тогда всего тысяча золотых монет - и напиток из него будет твоим.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_04");	//Что скажешь?
		SAGITTA_SECONDAALOE = TRUE;
		B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_05");	//Хорошо. Если у тебя есть деньги, то я приготовлю для тебя еще один такой напиток.
	};
	Info_ClearChoices(dia_sagitta_aloeready);
	Info_AddChoice(dia_sagitta_aloeready,"Мне это не по карману.",dia_sagitta_aloeready_no);
	Info_AddChoice(dia_sagitta_aloeready,"Хорошо, по рукам!",dia_sagitta_aloeready_ok);
};

func void dia_sagitta_aloeready_no()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_No_01_01");	//Извини, но такое удовольствие мне сейчас не по карману.
	AI_Output(self,other,"DIA_Sagitta_AloeReady_No_01_02");	//Что же, очень жаль. Тогда приходи ко мне, когда у тебя будут деньги.
	AI_StopProcessInfos(self);
};

func void dia_sagitta_aloeready_ok()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_Ok_01_00");	//По рукам!

	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_01");	//Отлично. Тогда приходи завтра после обеда.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_02");	//К тому времени твой напиток будет уже готов.
		B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
		Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
		SAGITTASECONDALOEDAY = Wld_GetDay();
		SAGITTAONWORK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_03");	//Ну? И где же мои деньги?
		AI_Output(other,self,"DIA_Sagitta_AloeReady_Ok_01_04");	//Кажется, у меня их нет.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_05");	//Только не пытайся меня обмануть! Поверь, у тебя ничего не выйдет.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_06");	//Достань сначала деньги, а потом уже только приходи ко мне.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_ALOEGET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloeget_condition;
	information = dia_sagitta_aloeget_info;
	permanent = TRUE;
	description = "Как там поживает мой напиток?";
};

func int dia_sagitta_aloeget_condition()
{
	if((SAGITTASECONDALOEDAY > 0) && (SAGITTAONWORK == TRUE))
	{
		return TRUE;
	};
};

func void dia_sagitta_aloeget_info()
{
	var int daynow;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Sagitta_AloeGet_01_00");	//Как там мой напиток?

	if(SAGITTASECONDALOEDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (SAGITTASECONDALOEDAY < (daynow - 1)))
		{
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_01");	//Вот, он готов! Можешь пить его смело.
			B_GiveInvItems(self,other,itpo_perm_def,1);
			AI_Output(other,self,"DIA_Sagitta_AloeGet_01_02");	//Спасибо.
			SAGITTASECONDALOEDAY = FALSE;
			SAGITTAONWORK = FALSE;
			SagittaMakeOnce = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_03");	//А разве полдень следующего дня уже наступил?
			AI_Output(other,self,"DIA_Sagitta_AloeGet_01_04");	//Эммм...
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_05");	//Вот-вот. Только дергаешь меня понапрасну.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeGet_01_06");	//Я же сказала - приходи завтра после полудня!
		AI_StopProcessInfos(self);
	};
};


var int praydaysagg;

instance DIA_Sagitta_HEAL(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_HEAL_Condition;
	information = DIA_Sagitta_HEAL_Info;
	permanent = TRUE;
	description = "Вылечи меня.";
};

func int DIA_Sagitta_HEAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Вылечи меня.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if(PRAYDAYSAGG != Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Давай посмотрим, что там у тебя. Ммм. Моя мазь в момент заживит все твои раны.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAYSAGG = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else if(PRAYDAYSAGG == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Sagitta_HEAL_17_03");	//Сегодня я уже лечила тебя. Моя мазь может помочь только один раз в день.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//В настоящий момент тебе не нужно лечение.
	};
};


instance DIA_Sagitta_TRADE(C_Info)
{
	npc = BAU_980_Sagitta;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Какие товары ты можешь предложить мне?";
};


func int DIA_Sagitta_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Какие товары ты можешь предложить мне?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Выбирай.
	B_GiveTradeInv(self);
};


instance DIA_Sagitta_KAP3_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP3_EXIT_Condition;
	information = DIA_Sagitta_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_OBSESSION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = "Я ощущаю внутреннюю тревогу.";
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Я ощущаю какую-то сильную внутреннюю тревогу. Мне нужна помощь.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Я вижу, сна тебе не достаточно, чтобы восстановиться. Ты попал под воздействие черного взгляда Ищущих.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Иди к Пирокару, высшему магу монастыря. Моих скромных знаний здесь недостаточно.
};


instance DIA_Sagitta_Thekla(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Sagitta_Thekla_Info;
	description = "Текла послала меня к тебе за травами.";
};


func int DIA_Sagitta_Thekla_Condition()
{
	if((MIS_Thekla_Paket == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Текла послала меня к тебе за травами.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ах, да. Вообще-то я ожидала ее еще несколько дней назад.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Вот, держи пакет. И поосторожнее с ним!
	B_GivePlayerXP(XP_AmbientKap3);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
};


instance DIA_Sagitta_KAP4_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP4_EXIT_Condition;
	information = DIA_Sagitta_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HEALRANDOLPH(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = "У Рендольфа похмельный синдром.";
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (Npc_HasItems(other,ItPo_HealRandolph_MIS) == 0) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//У Рендольфа похмельный синдром.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//И когда этот парень образумится?!
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Я уже давала ему лекарство. Не связывался бы ты с ним.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Я дам тебе лекарство для него. Оно поставит его на ноги за пару дней.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Но это обойдется тебе в триста золотых.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Что?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Единственное, что ты можешь получить здесь бесплатно - это смерть, малыш.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Нет! Столько золота за такую ерунду?!",DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Вот твои деньги.",DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Вот твои деньги.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Очень хорошо. Ты всегда можешь потребовать от него компенсировать тебе расходы.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph,"Сагитта дала мне лекарство для Рендольфа.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Пока у тебя не будет всей суммы, я даже разговаривать об этом не буду.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Нет. Столько золота за такую ерунду?!
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(смеется) Он не дал тебе денег? Это на него похоже!
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};


instance DIA_Sagitta_KAP5_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP5_EXIT_Condition;
	information = DIA_Sagitta_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_KAP6_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP6_EXIT_Condition;
	information = DIA_Sagitta_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_PICKPOCKET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 900;
	condition = DIA_Sagitta_PICKPOCKET_Condition;
	information = DIA_Sagitta_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попробовать украсть ее ключ)";
};


func int DIA_Sagitta_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,Dialog_Back,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	if(hero.attribute[ATR_DEXTERITY] >= 100)
	{
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
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
		B_GiveInvItems(self,other,ItKe_SagittaChest,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	}
	else
	{
		Print("Необходимая ловкость: 100");

		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
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

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};


instance DIA_SAGITTA_RECEPTFORTYON(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_receptfortyon_condition;
	information = dia_sagitta_receptfortyon_info;
	permanent = FALSE;
	description = "У меня есть вопрос.";
};


func int dia_sagitta_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_sagitta_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_00");	//У меня есть вопрос.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_01");	//Что ты хочешь узнать?
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_02");	//Я слышал, что существует зелье, способное воздействовать некоторым образом на сознание человека.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_03");	//Ты ничего не знаешь про это?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_04");	//Боюсь, что ничем не смогу тебе помочь. Я даже не могу представить, что бы это мог быть бы за эликсир.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_05");	//Но я могу дать тебе совет.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_06");	//Что за совет?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_07");	//Судя по тому, что оно из себя представляет, - это очень, ОЧЕНЬ редкая вещь! Можно даже сказать - мифическая!
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_08");	//А все такие предметы, так или иначе, имеют склонность очень хорошо охраняться и прятаться от посторонних глаз.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_09");	//К чему ты ведешь?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_10");	//Я веду к тому, что, возможно, ответ на твой вопрос ты найдешь там, куда обычным людям не попасть.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_11");	//И если уж есть такое место, то я бы советовала тебе поискать именно там. Уверена, у магов Огня волне бы могла оказаться подобная вещица.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_12");	//Спасибо за совет.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_13");	//Всегда рада помочь.
};


instance DIA_SAGITTA_CLAW(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = dia_sagitta_claw_condition;
	information = dia_sagitta_claw_info;
	permanent = FALSE;
	description = "Ты знаешь охотника по имени Никс?";
};


func int dia_sagitta_claw_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void dia_sagitta_claw_info()
{
	AI_Output(other,self,"DIA_Sagitta_Claw_01_00");	//Ты знаешь охотника по имени Никс?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_01");	//Да, знаю. Он частенько ко мне заходит, когда охотится в здешних местах.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_02");	//Зачем?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_03");	//Обычно его интересуют различные настойки, приготовленные мной из лекарственных трав. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Sagitta_Claw_01_04");	//У него случилось несчастье.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_05");	//Что произошло?
	AI_Output(other,self,"DIA_Sagitta_Claw_01_06");	//Во время последней охоты его волка по имени Клык сильно ранили, и теперь он находится в очень тяжелом состоянии.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_07");	//Никс попытался сам как-то ему помочь, но из этого ничего не вышло.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_08");	//Поэтому он попросил меня обратиться к тебе за помощью. Ты бы могла вылечить Клыка?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_09");	//Ему стоило сразу же обратиться ко мне, а не заниматься тем, в чем он мало понимает.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_10");	//Так ты поможешь?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_11");	//Конечно! Я знаю, насколько Никс дорожит Клыком, и готова помочь тем, чем смогу.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_12");	//Правда, если ты говоришь, что рана у него слишком серьезная... то, видимо, тут понадобится очень сильное лечебное зелье.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_13");	//И я, к сожалению, не могу обещать того, что оно поможет.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_14");	//А ты можешь дать мне это зелье?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_15");	//Боюсь, что нет. Но я могу его сделать для тебя.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_16");	//Правда, для этого, мне понадобятся некоторые редкие ингредиенты.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_17");	//Какие именно?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_18");	//Мне нужна пара стеблей болотной травы, лечебный корень, лесная ягода и вдобавок ко всему этому - царский щавель.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_19");	//Принеси мне эти травы, и я незамедлительно сварю тебе зелье для Клыка.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_20");	//Хорошо. Я постараюсь достать тебе все то, о чем ты просишь.
	B_LogEntry(TOPIC_RECOVERDOG,"Сагитта согласилась помочь Клыку. Однако, чтобы приготовить для него лечебное зелье, ей нужно несколько редких ингредиентов. А именно: пара стеблей болотной травы, лечебный корень, лесная ягода и царский щавель.");
};


instance DIA_SAGITTA_CLAWDONE(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = dia_sagitta_clawdone_condition;
	information = dia_sagitta_clawdone_info;
	permanent = FALSE;
	description = "Я достал тебе травы.";
};


func int dia_sagitta_clawdone_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (SAGITTAHELPSCLAW == FALSE) && Npc_KnowsInfo(other,dia_sagitta_claw) && (Npc_HasItems(other,ItPl_SwampHerb) >= 2) && (Npc_HasItems(other,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(other,ItPl_Forestberry) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1))
	{
		return TRUE;
	};
};

func void dia_sagitta_clawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_00");	//Я достал тебе травы.
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_01");	//Молодец! Давай их сюда, и я сварю из них лечебное зелье для Клыка.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_02");	//Вот, держи.
	B_GiveInvItemsManyThings(self,other);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,2);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Forestberry,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_03");	//Хорошо! Теперь подожди минутку...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_SAGITTA_CAVE_IN_03");
	AI_AlignToWP(self);
	AI_LookAtNpc(other,self);
	AI_UseMob(self,"LAB",1);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_04");	//...(что-то бормочет про себя)
	AI_UseMob(self,"LAB",-1);
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_05");	//Вот и все - зелье готово! Возьми его.
	B_GiveInvItems(self,other,itpo_sagittaclawpotion,1);
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_06");	//И что дальше?
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_07");	//Теперь слушай внимательно и запоминай...
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_08");	//Для начала необходимо тщательно промыть рану Клыка, а потом обработать ее этим зельем.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_09");	//И это все?
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_10");	//Да, все. Но, как я уже говорила, - не стоит сильно надеяться на то, что это поможет.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_11");	//Все ясно. Спасибо тебе.
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_12");	//Всегда пожалуйста.
	SAGITTAHELPSCLAW = TRUE;
	B_LogEntry(TOPIC_RECOVERDOG,"Сагитта изготовила лекарство для Клыка. Теперь необходимо как можно скорее вернуться в лагерь охотников к Никсу.");
};

instance DIA_Sagitta_LOKIPOTION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_LOKIPOTION_Condition;
	information = DIA_Sagitta_LOKIPOTION_Info;
	description = "Я ищу одно редкое растение.";
};


func int DIA_Sagitta_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_LOKIPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_00");	//Я ищу одно редкое растение - цветок кактуса.
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_01");	//Ты что-нибудь знаешь о нем?
	AI_Output(self,other,"DIA_Sagitta_LOKIPOTION_01_02");	//Боюсь, что нет. 
	AI_Output(self,other,"DIA_Sagitta_LOKIPOTION_01_03");	//По правде говоря, я даже не знаю, что это за растение и как оно выглядит.
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_04");	//Понятно.
};

instance DIA_SAGITTA_PLACEBO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = dia_sagitta_placebo_condition;
	information = dia_sagitta_placebo_info;
	permanent = FALSE;
	description = "У пастуха Пепе серьезная травма.";
};

func int dia_sagitta_placebo_condition()
{
	if((MIS_LECHENIEPEPE == LOG_Running) && Npc_KnowsInfo(hero,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void dia_sagitta_placebo_info()
{
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_01");	//У пастуха Пепе серьезная травма.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_02");	//Что случилось?
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_03");	//Один гоблин сильно ударил его по ноге.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_04");	//Нога вся посинела, и теперь паренек даже стоять нормально не может.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_05");	//И еще он говорит, что обычные целебные зелья ему не помогают.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_06");	//Интересный случай...(задмучиво) Обычно при серьезном ушибе достаточно просто обработать это место обыкновенной настойкой серафиса.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_07");	//А уж целебное зелье его точно поставило бы на ноги.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_08");	//И что же нам делать?
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_09");	//Мне кажется, тут проблема в другом.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_10");	//И для подобного случая есть один очень действенный метод лечения.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_11");	//И в чем он заключается?
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_12");	//Если больному дать обычное лекарство, но при этом убедить его в том, что это, скажем, 'эликсир жизни'...
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_13");	//...то больной сможет излечиться так, как будто на самом деле принял этот эликсир.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_14");	//И можешь мне поверить: это действительно работает.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_15");	//Я уже несколько раз проворачивала подобный трюк, и результат был всегда просто потрясающим!
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_16");	//Интересный способ лечения. Думаю, стоит попробовать.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_17");	//Значит так. Скажи Пепе, что я приготовила для него особенное сильное зелье.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_18");	//Но на самом деле дай ему обычную лечебную эссенцию.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_19");	//Только не вздумай признаться, что ты напоил его обычным лекарством, когда он поправится. 
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_20");	//Это может... В общем, помалкивай.
	B_LogEntry(TOPIC_LECHENIEPEPE,"Сагитта рассказала мне, как вылечить Пепе. Нужно дать ему обычное зелье и внушить, что это эликсир, сваренный специально для него.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Troll,"FP_ROAM_CASTLEMILL_TROLL_01");
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
	Wld_InsertNpc(DragonSnapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_01");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_02");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_03");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_04");
};

instance DIA_Sagitta_Seekers(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Condition;
	information = DIA_Sagitta_Seekers_Info;
	description = "На тебе лица нет!";
};

func int DIA_Sagitta_Seekers_Condition()
{
	if((Kapitel == 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Seekers_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_00");	//На тебе лица нет. Что-то случилось?
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_01");	//(встревоженно) Нет, все в полном порядке...
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_02");	//Просто меня немного пугают эти люди в черных рясах, что недавно тут появились.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_03");	//Ты имеешь в виду ищущих?
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_04");	//Да, наверно... По правде говоря, я не знаю, как их зовут.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_05");	//Но мне становится не по себе, когда я их вижу. И у меня начинаются сильные головные боли.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_06");	//Странно, но со мной такого раньше никогда не случалось.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_07");	//А вчера один из них что-то искал недалеко от моей пещеры.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_08");	//Надеюсь, он не заметил, что я следила за ним.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_09");	//Тебе лучше держаться подальше от этих людей.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_10");	//И вообще, будет лучше, если ты отправишься на ферму Онара. Подальше от этого места.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_11");	//Что?!
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_12");	//По крайней мере, там ты будешь в полной безопасности.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_13");	//(решительно) Извини. Но я не могу уйти отсюда! Это мой дом.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_14");	//К тому же я привыкла к жизни отшельника. А порядки Онара мне совсем не по душе.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_15");	//Но ты сильно рискуешь, оставаясь здесь одна.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_16");	//Что поделать. Но оставить пещеру без присмотра я тоже не могу.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_17");	//Ладно, я что-нибудь придумаю.
	MIS_SagittaGuard = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaGuard,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Running);
	B_LogEntry(TOPIC_SagittaGuard,"Сагитту беспокоит присутствие ищущих рядом с ее пещерой. Я предложил ей отправиться на ферму Онара, но она отказалась, сославшись на то, что не может бросить свою пещеру.");
};

instance DIA_Sagitta_Seekers_Done(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Done_Condition;
	information = DIA_Sagitta_Seekers_Done_Info;
	description = "Теперь у тебя есть охрана.";
};

func int DIA_Sagitta_Seekers_Done_Condition()
{
	if((MIS_SagittaGuard == LOG_Running) && (LeeSendGuard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Seekers_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sagitta_Seekers_Done_01_00");	//Теперь у тебя есть охрана.
	AI_Output(other,self,"DIA_Sagitta_Seekers_Done_01_01");	//Так что можешь больше не беспокоиться насчет тех людей в черном.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_02");	//(улыбаясь) Благодарю тебя. Хотя, честно говоря, я не очень доверяю этим наемникам.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_03");	//Но лучше уж так, чем постоянно трястись тут одной со страха.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_04");	//Вот, возьми эти зелья в качестве моей благодарности.
	B_GiveInvItems(self,other,ItPo_Health_02,2);
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_05");	//Они помогут тебе залечить свои раны.
	MIS_SagittaGuard = LOG_Success;
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Success);
	B_LogEntry(TOPIC_SagittaGuard,"Сагитта была рада узнать о том, что ее пещера теперь под усиленной охраной.");
};

instance DIA_Sagitta_Werewolf(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Condition;
	information = DIA_Sagitta_Werewolf_Info;
	permanent = FALSE;
	description = "Говорят, в этих местах объявился огромный мракорис.";
};

func int DIA_Sagitta_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orlan_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_00");	//Говорят, в этих местах объявился огромный мракорис.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_01");	//Правда? И кто это сказал?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_02");	//Ну, знаешь, обычно слухи быстро расползаются.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_03");	//А тебе-то какое дело до него?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_04");	//Это долгая история. Но если вкратце, тот мракорис... Он не совсем обычный.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_05");	//(серьезно) Да, я знаю.
	Info_ClearChoices(DIA_Sagitta_Werewolf);
	Info_AddChoice(DIA_Sagitta_Werewolf,"Откуда?!",DIA_Sagitta_Werewolf_Know);
};

func void DIA_Sagitta_Werewolf_Know()
{
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_00");	//Откуда?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_01");	//Он сейчас как раз позади тебя.
	AI_TurnToNPC(other,Werewolf);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_02");	//И как это понимать?!
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_03");	//Опусти оружие! Он тебя не тронет.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_04");	//А он точно не кусается?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_05");	//Нет. Этот бедолага слишком напуган, чтобы на кого-то напасть.
	AI_RemoveWeapon(self);
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_06");	//Ты в этом уверена?! Ведь это он напал на одного из крестьян Акила.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_07");	//Нет... То был другой зверь. А этот и мухи не обидит.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_08");	//Как я понимаю, раньше он был человеком. Но, похоже, чья-то злая шутка превратила его в зверя.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_09");	//Ты права. Алхимик Игнац что-то перепутал в магической формуле свитка превращения.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_10");	//А этот мракорис - его помощник, которому посчастливилось использовать то заклинание.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_11");	//(серьезно) Теперь мне все ясно. Ну, по крайней мере, магия свитка не убила его. И то хорошо...
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_12");	//И что ты теперь будешь с ним делать?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_13");	//(задумчиво) Пока что он останется жить у меня.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_14");	//Для друзей это ничего не изменит, а вот нежеланных гостей надолго отвадит от моей пещеры.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_15");	//Но нам все равно стоит подумать, как вернуть ему человеческий облик.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_16");	//И у тебя есть идеи на этот счет?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_17");	//К сожалению, моих сил и знаний здесь недостаточно. Но, вероятно, нам смогут помочь маги.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_18");	//Попробуй поговорить с Ватрасом. Уверена, что он подскажет нам решение этой проблемы.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_19");	//Хорошо. Я поговорю с ним.
	SagittaWereWolf = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Мракорис, которого я искал, неожиданно оказался в пещере Сагитты. По ее словам, он не представляет никакой угрозы для окружающих. Однако нам все равно стоит поискать способ вернуть ему человеческий облик. Сагитта посоветовала мне поговорить с Ватрасом.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Werewolf,"NW_SAGITTA_CAVE_IN_WEREWOLF");
};

instance DIA_Sagitta_Werewolf_Killed(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Killed_Condition;
	information = DIA_Sagitta_Werewolf_Killed_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sagitta_Werewolf_Killed_condition()
{
	if(WerewolfIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Killed_Info()
{
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_00");	//Зачем ты убил его?! Что он тебе сделал?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_01");	//Не думала, что ты такой мерзкий ублюдок!
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_02");	//А теперь пошел вон из моей пещеры!
	SagittaPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_PissOff(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_PissOff_Condition;
	information = DIA_Sagitta_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Sagitta_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SagittaPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PissOff_Info()
{
	AI_Output(self,other,"DIA_Sagitta_PissOff_01_00");	//Убирайся, грязный ублюдок!
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Safe_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Info;
	permanent = FALSE;
	description = "Я поговорил с Ватрасом.";
};

func int DIA_Sagitta_Werewolf_Safe_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (VatrasGiveSpell == TRUE) && (WereWolfIsHuman == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_00");	//Я поговорил с Ватрасом.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_01");	//И что он сказал?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_02");	//Он может вернуть мракорису только человеческое сознание. Остальное не под силу даже ему.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_03");	//(печально) Хорошо. Это хотя бы немного облегчит его страдания.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_04");	//Ватрас сказал, как нам это сделать?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_05");	//Конечно. Он дал мне магический свиток. С его помощью я верну бедолаге память.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_06");	//Тогда просто сделай это. Надеюсь, у тебя все получится.
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe_Done(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Werewolf_Safe_Done_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Done_Info;
	permanent = FALSE;
	description = "Я использовал свиток.";
};

func int DIA_Sagitta_Werewolf_Safe_Done_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman == TRUE) && (Npc_KnowsInfo(hero,DIA_Werewolf_Hallo) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_00");	//Я использовал свиток.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_01");	//Хорошо. Я уже вижу результат.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_02");	//Думаю, что тебе стоит рассказать об этом и Игнацу.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_03");	//Наверняка он до сих пор переживает о случившемся.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_04");	//А мракорис останется тут?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_05");	//Ну а где же еще. В лесу ему точно не место, да и среди людей тоже.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_06");	//А мне хоть будет с кем поболтать долгими вечерами.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_07");	//Просто я не очень люблю людей. Но этот - совсем другое дело.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_08");	//Понимаю.
	SaggitaCanSave = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Сагитта посоветовала мне рассказать обо всем Игнацу. Эти новости хоть как-то успокоят его.");
};

instance DIA_Sagitta_ASKFORDT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_askfordt_condition;
	information = DIA_Sagitta_askfordt_info;
	permanent = FALSE;
	description = "Мне нужен целитель в моем лагере.";
};

func int DIA_Sagitta_askfordt_condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (HURRAYICANHIRE == TRUE) && (SagittaNeed == TRUE) && (MIS_SagittaGuard == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_00");	//Мне нужен целитель в моем лагере.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_01");	//И ты решил поискать его здесь?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_02");	//Я сразу же подумал о тебе! Ты ведь целительница и неплохо разбираешься в алхимии.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_03");	//При этом прекрасно зная, что я не очень люблю общество людей и терпеть не могу покидать свою пещеру.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_04");	//Да, но времена сейчас неспокойные. Ты и сама могла в этом убедится.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_05");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_06");	//Появление того темного странника рядом с твоей пещерой - крайне дурной знак.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_07");	//В следующий раз он может появиться тут уже не один, а со своими дружками.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_08");	//Уверена, что моя охрана, о которой ты так мило позаботился в свое время, в случае чего справится с непрошенными гостями.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_09");	//Я бы на это не рассчитывал.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_10");	//Парни Ли лишь простые наемники, и никто не гарантирует того, что они попросту не разбегутся при первой же нависшей опасности.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_11");	//Особенно, когда дело касается магии. Причем, заметь, - темной магии!
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_12");	//А ты в случае чего сможешь меня защитить?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_13");	//Само собой. Мой лагерь - почти неприступная крепость, и он куда лучше охраняется.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_14");	//Хммм... И где находится этот твой лагерь?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_15");	//Недалеко от фермы Онара, на месте старой сторожевой башни.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_16");	//Он надежно прикрыт с флангов самой фермой и охраняемым проходом в форт паладинов, что делает его еще более безопасным местом.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_17");	//Ладно, ты меня почти убедил! Как бы я не дорожила своим одиночеством, но ставить под угрозу свою жизнь я пока что не собираюсь.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_18");	//Много человек в лагере?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_19");	//Не волнуйся, работы для тебя хватит. И, естественно, она будет хорошо оплачена.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_20");	//Деньги меня мало интересуют. Едиственное, что мне потребуется, это некоторые алхимические ингридиенты, которые, по всей видимости, теперь придется покупать. 
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_21");	//Сколько они стоят?
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_22");	//Хммм... Думаю, сорока золотых в день мне вполне хватит для того, чтобы полностью обеспечить себя всем необходимым.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_23");	//Хорошо, договорились. Кстати, твоя охрана останется тут?
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_24");	//Да, пусть стерегут мою пещеру до моего возвращения. А мне же пора собираться в путь.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_25");	//Тогда увидимся в лагере. Кстати, паролем для входа туда является фраза 'Драконовы сокровища'.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_26");	//Просто скажи его охранникам на входе.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_27");	//Я поняла. До встречи.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Сагитта согласилась переехать в мой лагерь. Она будет готовить алхимические снадобья и лечить моих людей в случае необходимости.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	SagittaRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Sagitta_INTOWER(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 22;
	condition = DIA_Sagitta_intower_condition;
	information = DIA_Sagitta_intower_info;
	permanent = TRUE;
	description = "Как тебе новое место?";
};

func int DIA_Sagitta_intower_condition()
{
	if((SagittaRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_intower_info()
{
	AI_Output(other,self,"DIA_Sagitta_InTower_OrcKap_15_00");	//Как тебе новое место?
	AI_Output(self,other,"DIA_Sagitta_InTower_OrcKap_01_01");	//Я рада, что согласилась на твое предложение! Здесь действительно более безопасное место, чем моя пещера.
};