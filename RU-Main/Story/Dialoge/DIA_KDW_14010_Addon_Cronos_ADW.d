
var int crontr;

instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	if((MIS_PirateDeal == LOG_Success) && (MIS_EscortToPirate == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_00");	//Постой.
		AI_Output(other,self,"DIA_Addon_Cronos_EscortToPirate_01_01");	//Что еще?
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_02");	//Я тут подумал и уже решил, кого послать к пиратам.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_03");	//Но я сомневаюсь, что он сам отыщет дорогу в их лагерь.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_04");	//Поэтому я попрошу тебя самому отвести его к ним. Ведь ты уже бывал там.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_05");	//И надеюсь, что он доберется туда целым и невредимым.
		AI_Output(other,self,"DIA_Addon_Cronos_EscortToPirate_01_06");	//Ну, обещать ничего не могу. Эти места довольно опасные.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_07");	//Но ты все-таки постарайся. Это очень важно для всех нас.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_08");	//Моего человека зовут Норт.
		AI_Output(self,other,"DIA_Addon_Cronos_EscortToPirate_01_09");	//Ты найдешь его недалеко от большого храма, что на другом краю этого плато.
		MIS_EscortToPirate = LOG_Running;
		Log_CreateTopic(TOPIC_EscortToPirate,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_EscortToPirate,LOG_Running);
		B_LogEntry(TOPIC_EscortToPirate,"Кронос попросил меня отвести его человека в лагерь пиратов.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(NDW_8161_Nort,"ADW_ENTRANCE_PLATEAU_15");
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Cronos_ADW_PICKPOCKET(C_Info)
{
	npc =KDW_14010_Addon_Cronos_ADW;
	nr = 900;
	condition = DIA_Addon_Cronos_ADW_PICKPOCKET_Condition;
	information = DIA_Addon_Cronos_ADW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Cronos_ADW_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET,Dialog_Back,DIA_Addon_Cronos_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Рад тебя видеть. Мы уже начали бояться самого худшего.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//Ну, все прошло не так плохо. Как идут дела?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Местность здесь очень опасная.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Некоторых животных, которых мы здесь встретили, раньше никто не видел.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Совсем близко находится огромное болото, которое, по-видимому, разрасталось уже несколько сотен лет.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Не проходит ни дня, чтобы на нас не напал какой-нибудь зверь, пришедший с этого болота.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Так что будь осторожнее.
};

instance DIA_Addon_Cronos_NeedFood(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_NeedFood_Condition;
	information = DIA_Addon_Cronos_NeedFood_Info;
	description = "Тебя что-то беспокоит?";
};

func int DIA_Addon_Cronos_NeedFood_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_NeedFood_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_00");	//Тебя что-то беспокоит?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_01");	//(ворчливо) Еще бы. Конечно!
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_02");	//Пока все остальные маги занимаются исследованием культуры Зодчих, мне приходится беспокоиться о более насущных вещах.
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_03");	//О каких именно?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_04");	//Я отвечаю за снабжение этой экспедиции. Провиант, зелья, оружие, факелы - это все на мне.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_05");	//Сатурас планирует оставаться тут еще очень долгое время, а наших запасов едва ли хватит даже на пару недель.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_06");	//И теперь мне приходится ломать голову над тем, как же обеспечить нас тут всем необходимым.
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_07");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_08");	//(задумчиво) Для начала провиант. С этим дела обстоят совсем плохо.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_09");	//А в здешних краях даже падальщика днем с огнем не сыщешь. Кругом одни кровавые мухи да прочие несъедобные твари. 
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_10");	//Может быть, я смогу тебе в этом помочь? Я неплохо разбираюсь в охоте.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_11");	//Я надеялся, что ты это скажешь! Тогда, если сможешь, принеси мне хотя бы полсотни кусков мяса.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_12");	//На первое время этого хватит. Но лучше всего попробовать договориться с пиратами.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_13");	//Возможно, они согласятся торговать с нами. Ведь от золота они вряд ли откажутся. 
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_01_14");	//Хорошо. Я достану мяса и попробую договориться с пиратами.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_15");	//Хвала Аданосу! Надеюсь, теперь хотя бы одной проблемой меньше...(вздыхая) Только смотри не говори об этом Сатурасу!
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_16");	//Он считает, что якшаться с подобными людьми - не слишком достойное занятие для мага Воды.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_01_17");	//Однако его почему-то совершенно не волнует вопрос - где я здесь достану продовольствие и припасы!
	MIS_NeedFood = LOG_Running;
	Log_CreateTopic(TOPIC_NeedFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedFood,LOG_Running);
	B_LogEntry(TOPIC_NeedFood,"Кроносу нужно продовольствие, чтобы пополнить запасы магов Воды. Он попросил меня сходить на охоту и принести не меньше пятидесяти кусков свежего мяса.");
	MIS_PirateDeal = LOG_Running;
	Log_CreateTopic(TOPIC_PirateDeal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PirateDeal,LOG_Running);
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Кронос хочет, чтобы я договорился с пиратами о поставках припасов магам Воды, поскольку Сатурас планирует остаться в долине на довольно-таки долгое время.");
};

instance DIA_Addon_Cronos_NeedFood_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_NeedFood_Done_Condition;
	information = DIA_Addon_Cronos_NeedFood_Done_Info;
	description = "Держи свое мясо!";
};

func int DIA_Addon_Cronos_NeedFood_Done_Condition()
{
	if((MIS_NeedFood == LOG_Running) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 50))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_NeedFood_Done_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Cronos_NeedFood_Done_01_00");	//Держи свое мясо! Как ты и просил - полсотни кусков.
	B_GiveInvItems(other,self,ItFoMuttonRaw,50);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,50);
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_01");	//Отлично! По крайней мере, теперь мы не умрем с голоду.
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_02");	//Вот, возьми эти магические напитки в качестве своей награды. 
	B_GiveInvItems(self,other,ItPo_Mana_02,3);
	AI_Output(self,other,"DIA_Addon_Cronos_NeedFood_Done_01_03");	//Большего я тебе сейчас дать не могу.
	MIS_NeedFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_NeedFood,LOG_Success);
	B_LogEntry(TOPIC_NeedFood,"Я достал для Кроноса необходимое продовольствие.");
};

instance DIA_Addon_Cronos_PirateDeal_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 2;
	condition = DIA_Addon_Cronos_PirateDeal_Done_Condition;
	information = DIA_Addon_Cronos_PirateDeal_Done_Info;
	description = "Насчет поставок припасов...";
};

func int DIA_Addon_Cronos_PirateDeal_Done_Condition()
{
	if((MIS_PirateDeal == LOG_Running) && (PirateDealOk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_PirateDeal_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_00");	//Насчет поставок припасов...
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_01");	//Мне удалось договориться с пиратами.
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_02");	//Хорошие новости! Как раз вовремя. Наши запасы уже почти на исходе.
	AI_Output(other,self,"DIA_Addon_Cronos_PirateDeal_Done_01_03");	//Также их капитан, Грэг, просит тебя прислать человека в их лагерь, чтобы точнее обговорить график и объем поставок.
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_04");	//Ладно, я пошлю туда одного из наших людей. Но помни, Сатурасу об этом ни слова!
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_05");	//Вот, возьми эти свитки и зелья в качестве вознаграждения за свои труды.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Health_02,3);
	CreateInvItems(other,ItSc_Icebolt,2);
	CreateInvItems(other,ItSc_ThunderBall,1);
	AI_Output(self,other,"DIA_Addon_Cronos_PirateDeal_Done_01_06");	//Думаю, оно вполне должно окупить твои хлопоты.
	MIS_PirateDeal = LOG_Success;
	Log_SetTopicStatus(TOPIC_PirateDeal,LOG_Success);
	B_LogEntry(TOPIC_PirateDeal,"Кронос остался доволен тем, что мне удалось договориться с пиратами.");
};

instance DIA_Addon_Cronos_Escort_Done(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_Escort_Done_Condition;
	information = DIA_Addon_Cronos_Escort_Done_Info;
	description = "Я доставил Норта в лагерь пиратов.";
};

func int DIA_Addon_Cronos_Escort_Done_Condition()
{
	if(MIS_EscortToPirate == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Escort_Done_Info()
{
	KronosKnowEscort = TRUE;
	AI_Output(other,self,"DIA_Addon_Cronos_Escort_Done_01_00");	//Я доставил Норта в лагерь пиратов.
	AI_Output(self,other,"DIA_Addon_Cronos_Escort_Done_01_01");	//Хорошо! Теперь осталось только дождаться первых поставок.
};

instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "Есть какие-нибудь новые сведения о каменных стражах?";
};

func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Есть какие-нибудь новые сведения о каменных стражах?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Нам уже пришлось уничтожить несколько штук.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Они стоят как статуи и не шевелятся.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Но первое впечатление обманчиво. Если ты подойдешь слишком близко, они нападут на тебя!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Нет никакого сомнения, что источник их силы находится где-то здесь.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Давай займемся делом!";
};

func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};

var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};
	if((hero.guild == GIL_KDW) && (CRONTR == FALSE))
	{
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC1,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC2,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC3,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC4,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC5,1);
		CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC6,1);
		CRONTR = TRUE;
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


instance DIA_ADDON_CRONOS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = dia_addon_cronos_adw_prayforgomez_condition;
	information = dia_addon_cronos_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословление Аданоса.";
};

func int dia_addon_cronos_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_ADW_PrayForGomez_01_01");	//Мне нужно благословление Аданоса.
	AI_Output(self,other,"DIA_Addon_Cronos_ADW_PrayForGomez_01_02");	//Поговори об этом с Сатурасом. Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_CRONOS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = dia_addon_cronos_adw_duringritual_condition;
	information = dia_addon_cronos_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cronos_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

//---------------------------Норт--------------------------------------------------------

instance DIA_NDW_8161_Nort_EXIT(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 999;
	condition = DIA_NDW_8161_Nort_EXIT_Condition;
	information = DIA_NDW_8161_Nort_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NDW_8161_Nort_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NDW_8161_Nort_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NDW_8161_Nort_Hello(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_Hello_Condition;
	information = DIA_NDW_8161_Nort_Hello_Info;
	permanent = FALSE;
	description = "Привет! Меня прислал Кронос.";
};

func int DIA_NDW_8161_Nort_Hello_Condition()
{
	if(MIS_EscortToPirate == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_Hello_Info()
{
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_00");	//Привет! Меня прислал Кронос.
	AI_Output(self,other,"DIA_NDW_8161_Nort_Hello_01_01");	//Отлично...(зевая) Тогда ты именно тот, кто должен сопроводить меня до лагеря пиратов.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_02");	//Собственно, я здесь как раз за этим.
	AI_Output(self,other,"DIA_NDW_8161_Nort_Hello_01_03");	//Тогда не будем терять времени, приятель! Я следую за тобой.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_04");	//Ладно! Только держись ко мне поближе, чтобы тебя случайно не сожрали какие-нибудь твари.
	AI_Output(other,self,"DIA_NDW_8161_Nort_Hello_01_05");	//Кронос будет не в восторге, если это случится.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowPir");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_09");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc(Blattcrawler,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_2_CANYON_02");
	Wld_InsertNpc(Blattcrawler,"ADW_PIRATECAMP_WAY_09");
	Wld_InsertNpc(Spider,"ADW_ENTRANCE_2_PIRATECAMP_16");
	Wld_InsertNpc(Spider,"ADW_PIRATECAMP_WAY_SPAWN_01");
};

instance DIA_NDW_8161_Nort_InCamp(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_InCamp_Condition;
	information = DIA_NDW_8161_Nort_InCamp_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NDW_8161_Nort_InCamp_Condition()
{
	if((MIS_EscortToPirate == LOG_Running) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_04") <= 1000) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_InCamp_Info()
{
	B_GivePlayerXP(400);
	AI_Output(self,other,"DIA_NDW_8161_Nort_InCamp_01_01");	//Отлично! Я уже вижу их лагерь. Думаю, дальше я дойду сам.
	AI_Output(self,other,"DIA_NDW_8161_Nort_InCamp_01_02");	//Спасибо, что сопроводил меня.
	AI_Output(other,self,"DIA_NDW_8161_Nort_InCamp_01_03");	//Да не за что.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_EscortToPirate = LOG_Success;
	Log_SetTopicStatus(TOPIC_EscortToPirate,LOG_Success);
	B_LogEntry(TOPIC_EscortToPirate,"Я сопроводил Норта до лагеря пиратов.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PirateCamp");
};

instance DIA_NDW_8161_Nort_Perm(C_Info)
{
	npc = NDW_8161_Nort;
	nr = 1;
	condition = DIA_NDW_8161_Nort_Perm_Condition;
	information = DIA_NDW_8161_Nort_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_NDW_8161_Nort_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_EscortToPirate == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_NDW_8161_Nort_Perm_Info()
{
	if(KronosKnowEscort == FALSE)
	{
		AI_Output(self,other,"DIA_NDW_8161_Nort_Perm_01_00");	//На твоем месте я бы сообщил Кроносу о том, что мы успешно добрались сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_NDW_8161_Nort_Perm_01_01");	//Не сейчас!
	};

	AI_StopProcessInfos(self);
};