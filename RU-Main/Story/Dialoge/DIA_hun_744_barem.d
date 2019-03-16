
instance DIA_HUN_744_BAREM_EXIT(C_Info)
{
	npc = hun_744_barem;
	nr = 999;
	condition = dia_hun_744_barem_exit_condition;
	information = dia_hun_744_barem_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_744_barem_exit_condition()
{
	return TRUE;
};

func void dia_hun_744_barem_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_WELCOME(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcome_condition;
	information = dia_hun_744_barem_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_welcome_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_01");	//Эй, парень! Похоже, ты тоже охотник.
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_04");	//Тут располагается лагерь охотников.
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_06");	//Дам тебе совет: для начала поговори с Фальком, он тут старший охотник!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_09");	//Стой! Остановись.
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_13");	//Тут располагается лагерь охотников. Тебе ясно?
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_744_BAREM_WELCOMEDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcomedone_condition;
	information = dia_hun_744_barem_welcomedone_info;
	permanent = FALSE;
	description = "Теперь я с вами.";
};


func int dia_hun_744_barem_welcomedone_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcomedone_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_WelcomeDone_01_00");	//Теперь я с вами.
	AI_Output(self,other,"DIA_HUN_744_Barem_WelcomeDone_01_01");	//Отлично, парень! Я знал, что тебе понравится у нас в лагере.
};


instance DIA_HUN_744_BAREM_HELLO(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_hello_condition;
	information = dia_hun_744_barem_hello_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_hun_744_barem_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_hello_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_Hello_01_00");	//Как дела?
	if((Kapitel >= 2) && (MIS_INSVEPR == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_01");	//Все в порядке. Кстати, слышал новость?
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_03");	//Недалеко от круга камней в западном лесу объявился настоящий вепрь! Встречал когда-нибудь подобного монстра?
		AI_Output(other,self,"DIA_HUN_744_Barem_Hello_01_04");	//Нет, не приходилось.
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_06");	//Вепрь - это чертовски опасное животное. И ты даже себе не представляешь, насколько!
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_07");	//Он запросто разорвет тебя в клочья, если ты попробуешь встать у него на пути.
		MIS_INSVEPR = LOG_Running;
		Log_CreateTopic(TOPIC_INSVEPR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSVEPR,LOG_Running);
		B_LogEntry(TOPIC_INSVEPR,"Барем говорит, что недалеко от круга камней в западном лесу объявился самый настоящий вепрь. По его словам, эти звери чрезвычайно опасны. Интересно, что скажет Барем, если я смогу убить эту тварь?");
		Wld_InsertNpc(keiler_vepr,"FP_ROAM_NW_HUNTVEPR_01");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_11");	//От этих парней в черных рясах у меня прямо мурашки по коже.
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_12");	//Ходят постоянно тут, что-то вынюхивают...(нервно) Не нравится мне все это!
	}
	else if(Kapitel == 6)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_13");	//Как, как. А сам разве не видишь? Кругом полно орков!
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_14");	//И откуда их столько?
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_15");	//Как обычно. Тишина и спокойствие.
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_16");	//А что еще нужно усталому охотнику, чтобы расслабится после долгой дороги?
	};
};


instance DIA_HUN_744_BAREM_INSVEPR(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_insvepr_condition;
	information = dia_hun_744_barem_insvepr_info;
	permanent = FALSE;
	description = "Я убил того вепря!";
};


func int dia_hun_744_barem_insvepr_condition()
{
	if((MIS_INSVEPR == LOG_Running) && Npc_IsDead(keiler_vepr) && (Npc_HasItems(other,itat_veprfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_insvepr_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_HUN_744_Barem_InsVepr_01_00");	//Я убил того вепря!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_01");	//Ты серьезно? Тебе это действительно удалось?
	AI_Output(other,self,"DIA_HUN_744_Barem_InsVepr_01_02");	//Вот его шкура, смотри.
	B_GiveInvItems(other,self,itat_veprfur,1);
	Npc_RemoveInvItems(self,itat_veprfur,1);
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_03");	//А ты умеешь удивлять!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_04");	//Ведь в нашем лагере еще никто ни разу не убивал эту тварь.
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_05");	//Да уж, этот момент я запомню на всю оставшуюся жизнь!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_06");	//А чтобы ты тоже не забыл об этом - вот, возьми это кольцо на память. А шкура останется у меня!
	B_GiveInvItems(self,other,itri_vepr,1);
	MIS_INSVEPR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSVEPR,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSVEPR,"Мой рассказ произвел на Барема неизгладимое впечатление. Он просто не мог поверить, что я покончил с ужасным вепрем. В обмен на шкуру вепря он дал мне кольцо, которое будет напоминать мне об этом случае.");
};


instance DIA_HUN_744_BAREM_RESPECT(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respect_condition;
	information = dia_hun_744_barem_respect_info;
	permanent = FALSE;
	description = "Мне нужен твой голос.";
};


func int dia_hun_744_barem_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (BAREM_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respect_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_Respect_01_00");	//Мне нужен твой голос.
	AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_01");	//Это еще зачем?
	AI_Output(other,self,"DIA_HUN_744_Barem_Respect_01_02");	//Я хочу поспорить с Фальком за звание лучшего охотника в лагере.
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_03");	//Нет проблем, парень!
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_04");	//Охотник, который смог справиться в одиночку с диким вепрем, достоин уважения.
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_05");	//Так что можешь положиться на меня. Я отдам за тебя свой голос.
		B_LogEntry(TOPIC_HUNTERSWORK,"Барем не против моей идеи бросить вызов Фальку.");
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_07");	//Парень, но ты же еще ничего не сделал для того, чтобы заслужить это право!
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_09");	//Сначала покажи себя хорошим охотником, а потом уже я отдам за тебя свой голос.
	};
};


instance DIA_HUN_744_BAREM_RESPECTDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respectdone_condition;
	information = dia_hun_744_barem_respectdone_info;
	permanent = TRUE;
	description = "Ты отдашь за меня свой голос?";
};


func int dia_hun_744_barem_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_744_barem_respect) && (CANHUNTERCHALLANGE == TRUE) && (BAREM_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_RespectDone_01_00");	//Ты отдашь за меня свой голос?
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_01");	//Да нет проблем, парень!
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_02");	//Охотник, который смог справиться в одиночку с диким вепрем, достоин уважения.
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_03");	//Так что можешь полностью положиться на меня. Я отдам за тебя свой голос.
		B_LogEntry(TOPIC_HUNTERSWORK,"Барем не против моей идеи бросить вызов Фальку.");
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_05");	//А что, ты уже доказал, что ты хороший охотник?
		AI_Output(other,self,"DIA_HUN_744_Barem_RespectDone_01_06");	//Пока нет.
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_07");	//Тогда ты знаешь мой ответ.
	};
};


instance DIA_HUN_744_BAREM_LURKERCLAW(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclaw_condition;
	information = dia_hun_744_barem_lurkerclaw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_lurkerclaw_condition()
{
	if((Kapitel >= 1) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclaw_info()
{
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_00");	//Эй, приятель! Подожди минутку.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_01");	//У меня к тебе есть одно очень интересное предложение.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_03");	//Понимаешь, один торговец сделал мне заказ на пять когтей шныгов.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_04");	//Но у меня совсем нет времени, чтобы сходить и поохотиться на этих зверей.
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_05");	//И ты хочешь, чтобы я принес тебе эти когти?
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_07");	//А что я получу с этого?
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_08");	//Ну... к сожалению, я не смогу заплатить тебе за эту работу. Мне просто самому позарез нужно золото.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_09");	//Но я могу дать тебе за эти когти несколько панцирей ползунов.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_10");	//Кстати, я слышал, что на ферме Онара один из наемников может сделать из них доспехи.
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_13");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_14");	//Вот и отлично! Тогда, если что, - ты знаешь, где меня найти.
	MIS_LURKERCLAW = LOG_Running;
	Log_CreateTopic(TOPIC_LURKERCLAW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_Running);
	B_LogEntry(TOPIC_LURKERCLAW,"Охотник Барем просил меня принести ему пять когтей шныгов. Он даст мне за них три панциря ползунов.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_LURKERCLAWDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclawdone_condition;
	information = dia_hun_744_barem_lurkerclawdone_info;
	permanent = FALSE;
	description = "Я принес тебе когти шныгов.";
};


func int dia_hun_744_barem_lurkerclawdone_condition()
{
	if((MIS_LURKERCLAW == LOG_Running) && (Npc_HasItems(other,ItAt_LurkerClaw) >= 5))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClawDone_01_00");	//Я принес тебе когти шныгов.
	B_GiveInvItems(other,self,ItAt_LurkerClaw,5);
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_03");	//Отличная работа, малыш!
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_04");	//А вот твои панцири ползунов - как и договаривались.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,3);
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_05");	//И кстати, я вспомнил имя того наемника, кто делает из них доспехи.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_07");	//Его зовут Вольф. Поговори с ним - может быть, он и для тебя сделает такие.
	MIS_LURKERCLAW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_SUCCESS);
	B_LogEntry(TOPIC_LURKERCLAW,"Я принес Барему когти шныгов. Он также сказал мне, что наемник Вольф может сделать доспехи из панцирей ползунов.");
	Wolf_ProduceCrawlerArmor = TRUE;
	HOKURN_ARMOR = TRUE;
};


instance DIA_HUN_744_BAREM_CRAWLERARMOR(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmor_condition;
	information = dia_hun_744_barem_crawlerarmor_info;
	permanent = FALSE;
	description = "Почему ты себе не сделаешь такие доспехи?";
};


func int dia_hun_744_barem_crawlerarmor_condition()
{
	if(MIS_LURKERCLAW == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmor_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmor_01_00");	//Почему ты не сделаешь такие доспехи себе?
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_01");	//У меня слишком мало панцирей этих тварей.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_03");	//И я не могу сейчас покинуть лагерь для охоты на них!
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmor_01_06");	//Может, я тебе смогу помочь?
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_07");	//Парень, это было бы просто здорово!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_08");	//Если у тебя действительно получится достать для меня эти доспехи, я в долгу не останусь!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_10");	//Вот, держи - здесь все панцири ползунов, что у меня остались.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,4);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_13");	//Кстати, я еще слышал о том, что, если подобные доспехи сделаны из тех панцирей, которые ты добыл сам, то они намного лучше обычных.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_14");	//Я не знаю, правда это или нет. Но всякое может быть.
	MIS_BAREMCRAWLERARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_BAREMCRAWLERARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_Running);
	B_LogEntry(TOPIC_BAREMCRAWLERARMOR,"Я решил помочь Барему достать для него доспехи из пластин ползунов. Также я услышал от него необычный слух: если делать подобные доспехи из панцирей, которые добыл сам, то они получатся прочнее обычных. Надо бы расспросить об этом наемника Вольфа или кого-нибудь еще.");
};


instance DIA_HUN_744_BAREM_CRAWLERARMORDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmordone_condition;
	information = dia_hun_744_barem_crawlerarmordone_info;
	permanent = FALSE;
	description = "У меня есть для тебя доспехи из панцирей ползунов.";
};

func int dia_hun_744_barem_crawlerarmordone_condition()
{
	if((MIS_BAREMCRAWLERARMOR == LOG_Running) && (Npc_HasItems(other,ITAR_DJG_Crawler) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmordone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmorDone_01_00");	//У меня есть для тебя доспехи из панцирей ползунов.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_01");	//(восторженно) Правда?
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_03");	//Ого! Да это просто отличные доспехи, приятель. Спасибо тебе!
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_04");	//Вот, возьми в качестве моей благодарности за твою помощь эту теплую овечью шкуру.
	B_GiveInvItems(self,other,itmi_sleepsack,1);
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmorDone_01_05");	//М-да. И что мне с ней делать?
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_06");	//Я знаю, о чем ты подумал...(ехидно) Но эта вещица не так проста, как кажется на первый взгляд.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_07");	//А для охотника это вообще незаменимая вещь!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_09");	//Возможно, ты уже заметил, что она имеет не совсем обычную выделку.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_10");	//Эта шкура сшита в спальный мешок, и с ее помощью ты сможешь заночевать там, где тебе вздумается.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_11");	//Поверь мне, она согреет тебя ночью не хуже теплой кровати.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_13");	//Она очень редкая! Такой ты уже точно нигде не достанешь.
	MIS_BAREMCRAWLERARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_BAREMCRAWLERARMOR,"Я принес Барему доспехи из панцирей ползунов. За мою помощь он дал мне теплую овечью шкуру, сшитую в спальный мешок.");
};

instance DIA_HUN_744_BAREM_PICKPOCKET(C_Info)
{
	npc = hun_744_barem;
	nr = 900;
	condition = dia_hun_744_barem_pickpocket_condition;
	information = dia_hun_744_barem_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_hun_744_barem_pickpocket_condition()
{
	return C_Beklauen(70,120);
};

func void dia_hun_744_barem_pickpocket_info()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
	Info_AddChoice(dia_hun_744_barem_pickpocket,Dialog_Back,dia_hun_744_barem_pickpocket_back);
	Info_AddChoice(dia_hun_744_barem_pickpocket,DIALOG_PICKPOCKET,dia_hun_744_barem_pickpocket_doit);
};

func void dia_hun_744_barem_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};

func void dia_hun_744_barem_pickpocket_back()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};


instance DIA_HUN_744_BAREM_F(C_Info)
{
	npc = hun_744_barem;
	nr = 2;
	condition = dia_hun_744_barem_f_condition;
	information = dia_hun_744_barem_f_info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь научить?";
};


func int dia_hun_744_barem_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_f_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_F_01_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_HUN_744_Barem_F_01_01");	//Да, но не ради развлечения!
	AI_Output(self,other,"DIA_HUN_744_Barem_F_01_02");	//Если ты хочешь, чтобы я учил тебя, - тебе придется заплатить.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Охотник Барем может научить меня сражаться одноручным оружием.");
};


instance DIA_HUN_744_BAREM_1H(C_Info)
{
	npc = hun_744_barem;
	nr = 3;
	condition = dia_hun_744_barem_1h_condition;
	information = dia_hun_744_barem_1h_info;
	permanent = TRUE;
	description = "Я хотел бы потренироваться с одноручным оружием.";
};


func int dia_hun_744_barem_1h_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_744_barem_f))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_1h_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_1H_01_00");	//Я хотел бы потренироваться с одноручным оружием.
	Info_ClearChoices(dia_hun_744_barem_1h);
	Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
};

func void dia_hun_744_barem_1h_back()
{
	Info_ClearChoices(dia_hun_744_barem_1h);
};

func void dia_hun_744_barem_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_01");	//Хорошая мысль! Но прежде чем заниматься техникой, тебе нужно научиться правильно держать оружие.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_02");	//Новички часто держатся за рукоять двумя руками. Это неправильно, к этому лучше не привыкать.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_03");	//Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_04");	//Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_05");	//Если запомнишь все, о чем я тебе говорил, твои удары станут более изящными и быстрыми.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_06");	//Да, и вот еще что: некоторые удары куда эффективнее остальных. У новичка не так много шансов выполнить их.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_07");	//Но чем больше ты будешь тренироваться, тем лучше они у тебя будут получаться.
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_744_Barem_1H_1_01_08");	//Расскажи мне еще что-нибудь про одноручное оружие.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_09");	//Ладно, ты уже знаешь главное. Если держать клинок немного ниже, первый удар получится более сильным.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_10");	//Рубящий удар, помнишь? Ладно, теперь о том, как нужно двигаться. Нанеси два удара и разворачивайся - враг наверняка растеряется, а ты окажешься в выгодном положении.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_11");	//Еще один взмах клинком справа налево...
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_12");	//...и возвращаешься в исходную стойку. Главное, не забывай тренироваться. Иди, отрабатывай технику.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

func void dia_hun_744_barem_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_01");	//Хорошая мысль! Но прежде чем заниматься техникой, тебе нужно научиться правильно держать оружие.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_02");	//Новички часто держатся за рукоять двумя руками. Это неправильно, к этому лучше не привыкать.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_03");	//Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_04");	//Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_05");	//Если запомнишь все, о чем я тебе говорил, твои удары станут более изящными и быстрыми.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_06");	//Да, и вот еще что: некоторые удары куда эффективнее остальных. У новичка не так много шансов выполнить их.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_07");	//Но чем больше ты будешь тренироваться, тем лучше они у тебя будут получаться.
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_744_Barem_1H_5_01_08");	//Расскажи мне еще что-нибудь про одноручное оружие.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_09");	//Ладно, ты уже знаешь главное. Если держать клинок немного ниже, первый удар получится более сильным.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_10");	//Рубящий удар, помнишь? Ладно, теперь о том, как нужно двигаться. Нанеси два удара и разворачивайся - враг наверняка растеряется, а ты окажешься в выгодном положении.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_11");	//Еще один взмах клинком справа налево...
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_12");	//...и возвращаешься в исходную стойку. Главное, не забывай тренироваться. Иди, отрабатывай технику.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

