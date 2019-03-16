
instance DIA_CAMPER01_EXIT(C_Info)
{
	npc = xbs_7501_camper;
	nr = 999;
	condition = dia_camper01_exit_condition;
	information = dia_camper01_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_camper01_exit_condition()
{
	return TRUE;
};

func void dia_camper01_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CAMPER01_PICKPOCKET(C_Info)
{
	npc = xbs_7501_camper;
	nr = 900;
	condition = dia_camper01_pickpocket_condition;
	information = dia_camper01_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_camper01_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_camper01_pickpocket_info()
{
	Info_ClearChoices(dia_camper01_pickpocket);
	Info_AddChoice(dia_camper01_pickpocket,Dialog_Back,dia_camper01_pickpocket_back);
	Info_AddChoice(dia_camper01_pickpocket,DIALOG_PICKPOCKET,dia_camper01_pickpocket_doit);
};

func void dia_camper01_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_camper01_pickpocket);
};

func void dia_camper01_pickpocket_back()
{
	Info_ClearChoices(dia_camper01_pickpocket);
};


instance DIA_CAMPER01_HALLO(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo_condition;
	information = dia_camper01_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_camper01_hallo_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_WAY05") < 1000) && (Npc_RefuseTalk(self) == FALSE) && (CAMPER_7501_TALK == FALSE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo_info()
{
	AI_Output(self,other,"DIA_Camper01_Hallo_01_00");	//Эй, парень! Ты, случайно, не на болота ли собрался?!
	AI_Output(other,self,"DIA_Camper01_Hallo_01_01");	//Возможно. А что?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_02");	//А то, что теперь туда лучше не ходить. Там стало слишком опасно!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_04");	//Там обосновались какие-то странные люди в черных рясах. И скажу тебе честно: лучше держаться от них подальше - они пахнут смертью!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_05");	//Сами же болота кишат разными опасными тварями и вдобавок ко всему еще странного рода существами, похожими на ящеров.
	AI_Output(other,self,"DIA_Camper01_Hallo_01_07");	//А что стало с прежними обитателями лагеря?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_08");	//Эх... большинство из них либо погибло, либо сошло с ума...
	AI_Output(self,other,"DIA_Camper01_Hallo_01_09");	//Правда, как я слышал, некоторым все-таки удалось выбраться живыми из этой долины.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_10");	//Ну а те, кто не успел этого сделать, - например, как я, - ушли в другое место.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_12");	//Теперь наше новое пристанище находится в развалинах старого монастыря на севере от этого места.
	AI_Output(other,self,"DIA_Camper01_Hallo_01_14");	//Кто вами руководит?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_15");	//Его имя - Нетбек! Он быший Гуру Братства Спящего.
	AI_Output(other,self,"DIA_Camper01_Hallo_01_16");	//Постой, это не тот ли парень, что постоянно разговаривал с деревьями?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_17");	//Да, именно он. А ты его знаешь?
	AI_Output(other,self,"DIA_Camper01_Hallo_01_18");	//Встречал раньше. Кажется, он был всегда немного не в себе.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_19");	//(серьезно) Я бы на твоем месте не стал так говорить.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_21");	//Если бы не он - нам всем бы пришлось очень туго.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_22");	//С помощью своей магии он прогнал отсюда всех этих мерзких орков, и теперь здесь растет только этот прекрасный лес!
	AI_Output(other,self,"DIA_Camper01_Hallo_01_23");	//Как?! Неужели тут больше нет ни одной из этих зеленокожих тварей?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_24");	//Ну... почти. Конечно, на побережье их много, но в лес они заходить боятся.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_25");	//Так что здесь вполне безопасно, как и у нас в лагере.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_26");	//Кстати, если хочешь, могу показать отвести тебя туда, а то мне уже надоело торчать тут.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Часть Братства Спящего обосновалась в лагере на месте старого монастыря.");
	Info_ClearChoices(dia_camper01_hallo);
	Info_AddChoice(dia_camper01_hallo,"Конечно! Идем.",dia_camper01_hallo_gobase);
	Info_AddChoice(dia_camper01_hallo,"Не стоит! Я как-нибудь сам.",dia_camper01_hallo_nobase);
};

func void dia_camper01_hallo_nobase()
{
	AI_Output(other,self,"DIA_Camper01_Hallo_NoBase_15_01");	//Не стоит! Я как-нибудь сам.
	AI_Output(self,other,"DIA_Camper01_Hallo_NoBase_01_01");	//Ладно! Как скажешь.
	AI_StopProcessInfos(self);
	CAMPER_7501_TALK = TRUE;
};

func void dia_camper01_hallo_gobase()
{
	AI_Output(other,self,"DIA_Camper01_Hallo_GoBase_15_01");	//Конечно! Идем.
	AI_Output(self,other,"DIA_Camper01_Hallo_GoBase_01_01");	//Тогда держись за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDETOCAMP");
	CAMPER_7501_TALK = FALSE;
};


instance DIA_CAMPER01_ARRIVEDBASE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 1;
	condition = dia_camper01_arrivedbase_condition;
	information = dia_camper01_arrivedbase_info;
	important = TRUE;
};


func int dia_camper01_arrivedbase_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_BASE_04") && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_arrivedbase_info()
{
	AI_Output(self,other,"DIA_Camper01_ArrivedBase_01_00");	//Вот мы и пришли!
	AI_Output(self,other,"DIA_Camper01_ArrivedBase_01_01");	//Здесь можно чувствовать себя в полной безопасности.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags = 0;
	Npc_ExchangeRoutine(self,"STAYINCAMP");
	b_heroknowforestbase();
	Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_106");
};


instance DIA_CAMPER01_HALLO2(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo2_condition;
	information = dia_camper01_hallo2_info;
	permanent = TRUE;
	description = "Я бы не прочь отправиться в лагерь.";
};


func int dia_camper01_hallo2_condition()
{
	if((Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_WAY05") == TRUE) && (CAMPER_7501_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo2_info()
{
	AI_Output(other,self,"DIA_Camper01_Hallo2_01_00");	//Я бы не прочь отправиться в лагерь.
	AI_Output(self,other,"DIA_Camper01_Hallo2_01_01");	//Ты уверен?
	Info_ClearChoices(dia_camper01_hallo2);
	Info_AddChoice(dia_camper01_hallo2,"Пока нет.",dia_camper01_hallo_nobase);
	Info_AddChoice(dia_camper01_hallo2,"Да! Пошли.",dia_camper01_hallo_gobase);
};


var int camper01aboutcook;

instance DIA_CAMPER01_BASERUMORS_RUMORS(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_baserumors_rumors_condition;
	information = dia_camper01_baserumors_rumors_info;
	permanent = TRUE;
	description = "Что слышно в лагере?";
};


func int dia_camper01_baserumors_rumors_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_baserumors_rumors_info()
{
	b_heroknowforestbase();
	AI_Output(other,self,"DIA_Camper01_BaseRumors_Rumors_01_00");	//Что слышно в лагере?

	if((MIS_OCCOOKFLEE == LOG_SUCCESS) && (CAMPER01ABOUTCOOK == FALSE))
	{
		CAMPER01ABOUTCOOK = TRUE;
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_01");	//Главная новость - новый человек в лагере!
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_02");	//А в остальном - как обычно.
	};
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_03");	//Сейчас мы наблюдаем, как драконы совершают налеты на замок.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_04");	//Ребята уже делают ставки - что обрушится в следующий раз.
		COAST_WASINKAPITEL1 = TRUE;
	}
	else if(Kapitel == 2)
	{
		if(COAST_WASINKAPITEL1 == TRUE)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_05");	//Продолжаем наблюдать за драконами.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_06");	//Один из них даже пытался подпалить наш лес, но потом удрал.
		}
		else
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_07");	//С интересом наблюдаем, как драконы совершают налеты на замок.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_08");	//Ребята уже делают ставки - что обрушится в следующий раз.
		};
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_09");	//На берегу у водопада видели странных парней в черном.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_10");	//Они долго стояли и смотрели. Туда, где когда-то был лагерь нашего Братства.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_11");	//Почему-то у меня волосы на голове шевелятся.
	}
	else if(Kapitel == 4)
	{
		if(MIS_AllDragonsDead == TRUE)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_12");	//Большинство разговоров только о драконах!
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_13");	//Кажется, все парни очень рады, что их больше тут нет.
		}
		else if(MIS_KilledDragons > 0)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_14");	//Говорят, что ты убил уже несколько драконов!
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_15");	//Если бы все были такие неугомонные, как ты, - все могло было быть иначе.
		}
		else
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_16");	//Говорят, что новый отряд орков высадился на побережье и двинулся прямиком к замку.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_17");	//Чувствую, скоро орки пойдут на очередной штурм!
		};
	}
	else if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_18");	//Орки штурмовали замок. Какой-то ублюдок открыл им ворота.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_19");	//Не то чтобы мы все тут очень любили паладинов, но мне просто очень жаль тех ребят!
	}
	else
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_20");	//Осада продолжается, но это уже не так интересно, как раньше.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_21");	//Когда тут летали эти драконы - было куда веселее.
	};
};


instance DIA_CAMPER01_ABOUTTRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_abouttrade_condition;
	information = dia_camper01_abouttrade_info;
	permanent = FALSE;
	description = "Ты тут, в лагере чем-то приторговываешь?";
};

func int dia_camper01_abouttrade_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_abouttrade_info()
{
	AI_Output(other,self,"DIA_Camper01_AboutTRADE_15_00");	//Ты что-нибудь продаешь?
	AI_Output(self,other,"DIA_Camper01_AboutTRADE_01_01");	//Угадал! То, что делаю сам или собираю, бродя по лесу.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Исидро продает товары в лагере Нетбека.");
};


instance DIA_CAMPER01_TRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_trade_condition;
	information = dia_camper01_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары.";
};

func int dia_camper01_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_camper01_abouttrade) && Wld_IsTime(6,50,22,0))
	{
		return TRUE;
	};
};

func void dia_camper01_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Camper01_TRADE_15_00");	//Покажи свои товары.
	AI_Output(self,other,"DIA_Camper01_TRADE_01_01");	//Выбирай.
	B_GiveTradeInv(self);
};


instance DIA_CAMPER01_DRAKAR(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakar_condition;
	information = dia_camper01_drakar_info;
	permanent = FALSE;
	description = "А что это за корабль там внизу?";
};


func int dia_camper01_drakar_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_drakar_info()
{
	AI_Output(other,self,"DIA_Camper01_Drakar_01_00");	//А что это за корабль там внизу?
	AI_Output(self,other,"DIA_Camper01_Drakar_01_01");	//Парень, это же боевой дракар орков!
	AI_Output(self,other,"DIA_Camper01_Drakar_01_07");	//Этот корабль обычно доставляет новые подкрепления для осады замка.
	AI_Output(other,self,"DIA_Camper01_Drakar_01_10");	//И как часто сюда прибывают новые отряды?
	AI_Output(self,other,"DIA_Camper01_Drakar_01_11");	//Точно не знаю... Но как раз пару дней назад этот дракар привез сюда очередную партию этих тварей.
	AI_Output(self,other,"DIA_Camper01_Drakar_01_12");	//Эх... и будем надеяться, что они не решат наведаться к нам в лагерь.
};


instance DIA_CAMPER01_DRAKAREXT(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakarext_condition;
	information = dia_camper01_drakarext_info;
	permanent = FALSE;
	description = "А других кораблей тут нет?";
};


func int dia_camper01_drakarext_condition()
{
	if(Npc_KnowsInfo(hero,dia_camper01_drakar))
	{
		return TRUE;
	};
};

func void dia_camper01_drakarext_info()
{
	AI_Output(other,self,"DIA_Camper01_DrakarExt_01_00");	//А других кораблей тут нет?
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_01");	//(печально) К сожалению, нет. Эта махина - единственный корабль в здешних местах.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_02");	//Иначе мы с ребятами уже давно бы попробовали уплыть отсюда.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_03");	//Честно говоря, уже порядком надоело тут торчать!
	AI_Output(other,self,"DIA_Camper01_DrakarExt_01_04");	//Почему бы тогда не отобрать корабль у орков?
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_05");	//Ты что, совсем сбреднил?! К нему я даже и близко не подойду!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_06");	//Там же полно орков, приятель!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_08");	//Даже отсюда по ночам слышен их рык с палубы.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_09");	//К тому же я понятия не имею, как управляться с этой штуковиной.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_16");	//По сравнению с ним, галеры паладинов - это лодки. С ним даже сотня человек не управится!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_18");	//Так что выбрось свою идею из головы - из этого ничего путного не выйдет.
};

