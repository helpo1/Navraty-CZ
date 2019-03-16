
instance DIA_DRAGON_GOLD_EXIT(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 999;
	condition = dia_dragon_gold_exit_condition;
	information = dia_dragon_gold_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_gold_exit_condition()
{
	return TRUE;
};

func void dia_dragon_gold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGON_GOLD_HELLO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_hello_condition;
	information = dia_dragon_gold_hello_info;
	important = TRUE;
};


func int dia_dragon_gold_hello_condition()
{
	return TRUE;
};

func void dia_dragon_gold_hello_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_00");	//Человек?!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_01");	//Как давно я не видел людей...
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_02");	//Так вот что скрывали Зодчие за этим порталом! Еще один дракон - кто бы мог подумать.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_05");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_06");	//Я - Аш'Тар, золотой дракон. Немногие удостаивались этой чести.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_11");	//Чести? Быть съеденным драконом, по-твоему, это честь?
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_12");	//А ты смешной, человек! Давно меня так никто не веселил.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_14");	//А разве драконы не являются порождением тьмы, чей истинный смысл существования - это уничтожение всего живого?
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_18");	//В этом мире существует как добро, так и зло, представленные в одинаковом обличии, человек.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_20");	//Хочешь сказать, что ты не несешь зло в этот мир?
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_22");	//Только действия имеют значение - только они могут определять истинный смысл существования!	
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_21");	//Вижу смятение в твоих глазах...
	self.name[0] = "Аш'Тар";
	DRAGONGOLDMEET = TRUE;

	if(MIS_GOLDDRAGONPORTAL == LOG_Running)
	{
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"В древних руинах Зодчих я обнаружил портал. Я смог активировать его с помощью странного магического камня, который нашел в храме Аданоса. Портал привел меня в небольшую долину, где, как оказалось, меня ждала очень интересная встреча.");
	}
	else
	{
		Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"В древних руинах Зодчих я обнаружил портал. Я смог активировать его с помощью странного магического камня, который нашел в храме Аданоса. Портал привел меня в небольшую долину, где, как оказалось, меня ждала очень интересная встреча.");
		MIS_GOLDDRAGONPORTAL = LOG_Running;
	};
};


instance DIA_DRAGON_GOLD_WHOCREATE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whocreate_condition;
	information = dia_dragon_gold_whocreate_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};

func int dia_dragon_gold_whocreate_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whocreate_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_01");	//Я хотел задать тебе тот же вопрос. Как ТЫ смог оказаться здесь?
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_03");	//У меня был магический камень по типу фокусирующего, с помощью него я и активировал портал, ведущий сюда.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_04");	//Под этими словами ты, наверное, имел в виду Ключ Солнца, ибо только он смог бы открыть тебе дорогу сюда.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_06");	//Но как он попал к тебе? Лишь его Хранители - Стражи Солнца - владели этим тайным знанием и имели доступ в мою обитель.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_08");	//Там, где я обнаружил этот артефакт, не было никаких Хранителей или Стражей Солнца.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_09");	//Там вообще никого не было, кроме кучки бандитов.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_12");	//И, сдается мне, тех, кого ты называешь Стражами Солнца, мы называем - Зодчие. Так знай: их цивилизация давно угасла.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_13");	//Не понимаю! Но... как это могло случиться?
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_14");	//Судя по тому, что я знаю, - они нашли один мощный артефакт, с которым они не смогли совладать, но который смог совладать с ними.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_16");	//И их постигло проклятье Аданоса: была такая катастрофа - жуткое наводнение. Потом вода ушла.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_17");	//Сейчас вокруг только полуразрушенные храмы.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_18");	//Мою долину не коснулись эти ужасы. А что за люди, про которых ты говорил?
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_20");	//Бандиты, которые искали золото и артефакт - Коготь Белиара - который и был причиной падения Зодчих.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_27");	//Коготь?! Так я и думал...
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_28");	//Значит... если это так, значит... они не послушались меня. Они не уничтожили его... глупцы!
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_29");	//Теперь мне все стало ясно...
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_31");	//...зло уже вырвалось на свободу, и ничто не помешает ему осуществить великий план своего создателя.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар был поражен новостью о гибели Зодчих. Судя по всему, золотой дракон играл существенную роль в жизни этого некогда великого народа и являлся неотъемлемой частью культуры Зодчих. Но еще больше его огорчило то, что Коготь Белиара так и не был уничтожен Зодчими, на чем настаивал в свое время Аш'Тар.");
};

instance DIA_DRAGON_GOLD_ADANOSVALLEY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_ADANOSVALLEY_condition;
	information = dia_dragon_gold_ADANOSVALLEY_info;
	permanent = FALSE;
	description = "Эту каменную табличку я нашел в храме Зодчих.";
};

func int dia_dragon_gold_ADANOSVALLEY_condition()
{
	if((Npc_KnowsInfo(hero,dia_dragon_gold_whatdo)) && (Npc_HasItems(hero,ItWr_CroneAdanos) >= 1) && (MIS_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_ADANOSVALLEY_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_01");	//Эту каменную табличку я нашел в храме Зодчих. Ты знаешь, что это такое?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_02");	//Дай мне взглянуть на нее.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_03");	//Вот.
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_04");	//Каменную табличку? Человек сильно рассмешил меня.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_05");	//То, что ты называешь каменной табличкой, на самом деле является магическим свитком Древних!
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_06");	//Так это магический свиток Зодчих?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_07");	//Да. Но, судя по тому, на каком языке он написан, - время этого предмета уходит ко временам зарождения этого мира.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_08");	//Правда, сейчас я не ощущаю в этом предмете ни капли магии.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_09");	//Но ты хотя бы можешь перевести, что там написано?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_10");	//Конечно.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_11");	//Судя по тексту, этот свиток использовался для призыва...
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_12");	//...для призыва?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_13");	//Для призыва древних стражей самого Аданоса.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_14");	//Интересно. А что это за древние стражи?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_15");	//Как я понимаю, речь идет о созданиях, которые в свое время охраняли храм Аданоса.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_16");	//Однако, насколько мне известно, их время уже давно прошло.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_17");	//Это все, что там написано?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_18");	//Тут еще упоминается какой-то могущественный артефакт, который охраняли эти древние создания.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_19");	//Вот это уже интересней. И о каком именно артефакте идет речь?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_20");	//Тут об этом не сказано...
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_21");	//Так что, если кто-то еще и знает об этом предмете, то только его хранители.
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone,"Хвала Инносу! Золотой дракон помог мне перевести эти древние записи. Похоже, эта каменная табличка когда-то являлась магическим свитком призыва каких-то древних существ, которых Аш'Тар назвал Стражами. Кроме того, в ней упоминалось о каком-то могущественном артефакте, который эти древние создания охраняли.");
	KnowsTextAdanos = TRUE;
};


instance DIA_DRAGON_GOLD_AWAKEGUARDS(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_AWAKEGUARDS_condition;
	information = dia_dragon_gold_AWAKEGUARDS_info;
	permanent = FALSE;
	description = "Ты сказал, что это свиток призыва.";
};

func int dia_dragon_gold_AWAKEGUARDS_condition()
{
	if(KnowsTextAdanos == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_AWAKEGUARDS_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_00");	//Ты сказал, что это свиток призыва.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_01");	//Так оно и есть.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_02");	//Тогда почему бы нам не вызвать этих стражей и не спросить у них про артефакт?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_03");	//Это слишком опасно... Гнев этих созданий запросто может убить тебя.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_04");	//К тому же для использования этого свитка сперва его необходимо вновь наполнить магией...
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_05");	//И как это можно сделать?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_06");	//А ты, как я погляжу, настроен решительно, раз тебя даже не останавливает опасность собственной смерти...
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_08");	//Мне не привыкать смотреть смерти в глаза.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_09");	//Ну, если так... Тогда я знаю один способ, как можно вернуть этому предмету магическую силу.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_11");	//Насколько мне известно, в одном из храмов Древних когда-то хранился особый рунический алтарь.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_12");	//Зодчие использовали его для переноса магии из одного предмета в другой.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_13");	//С его помощью ты можешь попробовать перенести магию в этот древний свиток.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_14");	//Для этого сгодится любой другой магический предмет, который содержит в себе магию Зодчих.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_16");	//Кажется, ничего сложного. И, если у меня все получится, где мне использовать свиток, чтобы пробудить стражей?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_17");	//Это мне неизвестно... Но на твоем месте я бы попробовал использовать его в самом сердце храма.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_18");	//Там, где все пропитано древней магией... Возможно, это сработает.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_19");	//Ладно, попробую отыскать это место.
	KnowsMakeOldMgic = TRUE;
	B_LogEntry(TOPIC_AdanosCrone,"Я решил рискнуть и вызвать этих древних созданий. Но для начала необходимо вернуть магию самому предмету. Аш'Тар подсказал мне, что в одном из храмов Древних когда-то был особый рунический стол, с помощью которого Зодчие переносили магию из одного предмета в другой. Чтобы перенести магию в каменную табличку, мне понадобится предмет, содержащий хотя бы частицу магии Зодчих. И, если у меня все получится, мне нужно будет найти место, где можно использовать свиток призыва. Золотой дракон посоветовал мне сделать это в самом центре храма.");
};


instance DIA_DRAGON_GOLD_AboutAntientGuards(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AboutAntientGuards_condition;
	information = DIA_DRAGON_GOLD_AboutAntientGuards_info;
	permanent = FALSE;
	description = "Как можно одолеть древних стражей Аданоса?";
};

func int DIA_DRAGON_GOLD_AboutAntientGuards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_aboutantientguards_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DRAGON_GOLD_AboutAntientGuards_01_01");	//Как можно одолеть древних стражей Аданоса?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AboutAntientGuards_01_02");	//Для этого человеку нужен Бич Стражей. Только с его помощью ты сможешь сокрушить этих древних созданий.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AboutAntientGuards_01_04");	//И где мне его искать?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AboutAntientGuards_01_05");	//Люди хранили его в одном из своих храмов. Попробуй поискать там.
	B_LogEntry(TOPIC_AdanosCrone,"В храме у меня возникли проблемы с древним каменным хранителем, поскольку обычным оружием я не смог его одолеть. Аш'Тар поведал мне о существовании некоего оружия, с помощью которого древние усмиряли этих монстров. Возможно, оно поможет и мне. Искать его следует в одном из храмов в Долине.");
	TellAboutAdanosWeapon = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_AVGO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AVGO_condition;
	information = DIA_DRAGON_GOLD_AVGO_info;
	permanent = FALSE;
	description = "Тут у меня есть еще одна каменная табличка.";
};

func int DIA_DRAGON_GOLD_AVGO_condition()
{
	if((KnowAboutAdVal == TRUE) && (Npc_HasItems(hero,ItWr_StoneAdanosPortal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_AVGO_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_00");	//Тут у меня есть еще одна каменная табличка. Ты можешь ее перевести?
	B_GiveInvItems(other,self,ItWr_StoneAdanosPortal,1);
	Npc_RemoveInvItems(self,ItWr_StoneAdanosPortal,1);
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_04");	//Очень интересно...
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_06");	//Здесь описано, каким образом можно открыть портал, ведущий на великое Плато Древних.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_08");	//Эта земля - священная вотчина Аданоса, где он впервые прикоснулся к этому миру.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_09");	//Прекрасное, вечнозеленое место, где веками царили только покой и благоденствие.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_10");	//Значит, по всей видимости, артефакт находится именно там. И как же туда попасть?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_11");	//Для начала тебе необходимо рунное сердце Стража. Его надлежит использовать непосредственно перед магическим порталом.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_13");	//Отлично! Одно такое у меня уже есть.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_14");	//Откуда оно у тебя? Неужели тебе все-таки удалось призвать древних Стражей в этот мир?
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_15");	//Да, одного. Чтобы заполучить его сердце, сперва мне пришлось его убить.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_16");	//Меня до сих пор удивляет, как маленький человек вроде тебя может противостоять таким древним созданиям.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_17");	//Меня порой тоже.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_18");	//Похоже, сами боги благоволят тебе, раз после стольких испытаний ты до сих пор жив. Иного объяснения у меня просто нет.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_20");	//Это все, конечно, хорошо, но мы отвлеклись от главного. Где же находится сам портал?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_21");	//Тут сказано, что он расположен на севере этой долины. 
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_22");	//А можно поточней? 
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_23");	//Это все, что тут написано... Так что тебе придется самому отыскать это место.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_25");	//И еще: хочу тебя предостеречь... Плато Древних может оказаться крайне опасным местом для простого смертного вроде тебя.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_27");	//Так что хорошо подготовься, прежде чем отправиться туда...
	B_LogEntry(TOPIC_AdanosCrone,"Аш'Тар перевел свиток стража храма. Там упомянут магический портал на севере долины, который ведет на великое Плато Древних - место, где сам Аданос впервые вступил в этот мир! Загадочный артефакт, который мы ищем, должен находиться именно там. Для активации портала мне необходимо использовать рунное сердце Стража. Аш'Тар предупредил меня, что Плато может оказаться очень опасным местом. Мне нужно тщательно подготовиться к этому походу.");
	InsFireShadowGuards = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_WHATDO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatdo_condition;
	information = dia_dragon_gold_whatdo_info;
	permanent = FALSE;
	description = "А в чем смысл твоего существования, дракон?";
};

func int dia_dragon_gold_whatdo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatdo_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_00");	//А в чем смысл твоего существования, дракон?
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_01");	//Ты задаешь этот вопрос мне, человек, но разве ты можешь утверждать, что осознаешь то, что привело тебя в этот мир?
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_03");	//Конечно. Моя цель заключается в том, чтобы искоренить то зло, которое сеют по этой земле твои сородичи.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_05");	//Я понимаю, к чему ты ведешь, человек. Если ты так хочешь, ты можешь сразиться со мной.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_06");	//Но это не сделает мир лучше, как ты рассчитываешь. Ибо только в жизни может зародиться новая жизнь, но не в смерти.
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_09");	//Хммм... А ты и впрямь не похож на служителя Тьмы.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_10");	//(обиженно) Много ли ты видел драконов в своей жизни, человек, чтобы так рассуждать?
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_11");	//Да... Как сильно изменился этот мир.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар - золотой дракон, обитающий в этой долине, также был удивлен моему появлению. Невероятно, но его намерения относительно меня не носили враждебный характер, а можно даже сказать - наоборот. Возможно, стоит поговорить об этом с Сатурасом.");
};


instance DIA_DRAGON_GOLD_ABOUTCLAW(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_aboutclaw_condition;
	information = dia_dragon_gold_aboutclaw_info;
	permanent = FALSE;
	description = "Какое зло? Что ты имеешь в виду?";
};

func int dia_dragon_gold_aboutclaw_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whocreate))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_aboutclaw_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_00");	//Какое зло? Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_01");	//Найдя Коготь Белиара, Стражи Солнца рассчитывали, что это оружие поможет им в битве со злом.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_03");	//Они даже не догадывались, что именно этот меч и есть истинное зло!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_06");	//И я подсказал им единственное правильное решение - уничтожить этот меч, пока зло не вырвалось на свободу.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_07");	//Но, как я вижу, жажда могущества настолько ослепила Стражей, что они забыли об этом.
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_10");	//А что в этом мече такого плохого?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_11");	//Коготь Белиара и сам по себе достаточно мощный артефакт, но его истинное предназначение заключено в другом.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_13");	//Вся магическая сила Когтя сосредоточена в основании его клинка - в темном кристалле, что хранит душу могущественного архидемона С'эньяка!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_15");	//Темный Бог ковал это оружие специально для него, чтобы тот нес еще больше зла в наш мир...
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_17");	//В конечном счете, с огромными усилиями, архидемон был повержен. А его душа была помещена в заточение в его же собственное оружие... какая ирония...
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_20");	//После этого клинок был сокрыт на многие тысячелетия от посторонних глаз. Пока Стражи Солнца случайно не наткнулись на него.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_22");	//Это и стало началом их конца!
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_23");	//Почему демон не был уничтожен?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_24");	//Это мне неведомо. Одно могу сказать: если он вырвется на свободу - мир содрогнется под его поступью...
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_27");	//Ты уверен в том, что он вырвался на свободу?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_28");	//Нельзя быть ни в чем уверенным - к сожалению, только сам Коготь мог бы дать ответ на этот вопрос.
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_34");	//А что если я принесу тебе Коготь?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_37");	//О, Аданос. Неси его скорее, возможно, они не успели совершить непоправимое.
	TASKFINDCLAW = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар рассказал мне об угрозе, которую скрывает Коготь. Будучи когда-то оружием одного из архидемонов - С'эньяка, этот клинок хранит в себе бессмертную душу своего господина. Аш'Тар был очень обеспокоен, что С'эньяк смог освободиться. Чтобы точно ответить на этот вопрос, золотой дракон попросил меня принести ему Коготь. Вероятно, тогда станет ясно, насколько большие у нас проблемы.");
};

instance DIA_DRAGON_GOLD_WHATMAN(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatman_condition;
	information = dia_dragon_gold_whatman_info;
	permanent = FALSE;
	description = "Посмотри на Коготь.";
};

func int dia_dragon_gold_whatman_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_aboutclaw) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatman_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_00");	//Посмотри на Коготь.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_01");	//Хорошо. Дай мне взглянуть на него.

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_02");	//Хмм... Только я перенес силу Когтя в руну.
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_03");	//Это неважно, кристалл должен испускать энергию как в руне, так и в мече.
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_09");	//(внимательно вглядывается) Я так и знал!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_10");	//Символ на руне тускл, и я не ощущаю в нем энергии.
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_11");	//А это может означать только одно - С'эньяк освободился!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_13");	//Это ОЧЕНЬ плохо - ты даже не представляешь, насколько!
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_16");	//И что же теперь делать?
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Худшие опасения подтвердились. Символ руны Когтя тускл и безжизнен - а это значит, что древний архидемон С'эньяк вырвался на свободу. Чувствует мое сердце, что эта история c архидемоном не обойдет стороной и меня...");
	}
	else
	{
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
		};
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_06");	//Вот, смотри.
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_09");	//(внимательно вглядывается) Я так и знал!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_21");	//Темный кристалл душ тускл и я не ощущаю в нем магической энергии...
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_11");	//А это может означать только одно - С'эньяк освободился!
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_RemoveWeapon(other);
		};
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_13");	//Это ОЧЕНЬ плохо - ты даже не представляешь, насколько!
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_16");	//И что же теперь делать?
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Худшие опасения подтвердились. Символ руны Когтя тускл и безжизнен - а это значит, что древний архидемон С'эньяк вырвался на свободу. Чувствует мое сердце, что эта история c архидемоном не обойдет стороной и меня...");
	};
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_28");	//Необходимо уничтожить демона, пока еще есть время и пока он слаб.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_32");	//Проклятие Аданоса - лишь отеческое порицание в сравнении с тем, что сотворит этот демон!
	AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_33");	//Ого, ничего себе!
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_35");	//У нас мало времени, и еще меньше шансов.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_36");	//С'эньяк, конечно, не успел восстановить свои силы после пребывания в заточении, но он все равно очень опасен.
};


instance DIA_DRAGON_GOLD_DESTROYWAY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroyway_condition;
	information = dia_dragon_gold_destroyway_info;
	permanent = FALSE;
	description = "Как можно уничтожить С'эньяка?";
};

func int dia_dragon_gold_destroyway_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroyway_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_00");	//Как можно уничтожить С'эньяка?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_01");	//Поскольку обычным оружием его не победить, существуют только два способа, как это можно сделать.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_04");	//Способ первый - с помощью Стихий, истинных Творцов этого мира.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_05");	//Стихий?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_07");	//Да, а именно с помощью древнего могущественного заклинания, способного отнять жизнь у любого существа! Его называют Крест Стихий.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_10");	//И неважно, кто это будет - демон, человек или мясной жук. Это заклинание убьет всякого, на кого оно будет возложено.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_12");	//И где мне искать этот Крест Стихий?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_13");	//Подожди, я расскажу все по порядку.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_17");	//Смысл необходимого нам заклинания заключается в объединении всех стихий этого мира воедино.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_18");	//Огонь, Вода, Скала и Тьма - только вместе эти элементы смогут образовать Крест Стихий.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_22");	//А я уж думал, ты отправишь меня собирать какую-нибудь мерзость по всяким склепам, пещерам и подземельям.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_23");	//Только абсолютные сущности этих элементов способны придать этому заклинанию должный эффект...
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_24");	//Что это за сущности?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_25");	//У каждой стихии она своя, и содержит в себе первоисточник ее могущества. Эту сущность называют сферой.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_29");	//Поэтому тебе как можно скорее необходимо отыскать все четыре сферы каждой стихии...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_30");	//...и лишь только после этого из них можно будет сделать Крест Стихий.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_31");	//Где я смогу найти эти сферы?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_32");	//К сожалению, я не знаю места их расположения, но, боюсь, тебе придется полазить 'по всяким склепам, пещерам и подземельям'.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_33");	//А когда ты их найдешь - возвращайся ко мне. Я буду ждать тебя здесь.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_34");	//Хорошо, Аш'Тар! Я отправляюсь.
	TASKFINDSPHERE = TRUE;
	SENYAKSEEKSWORD = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Похоже, мне и тут придется потягаться с тем, что до меня не смогли сделать древние умники. На этот раз это архидемон С'эньяк. Аш'Тар подсказал мне один способ, с помощью которого можно будет уничтожить его. Для этого мне необходимо заполучить одно могущественное заклинание древности - Крест Стихий. Чтобы это сделать, необходимо отыскать все важные компоненты для создания этого заклинания. А именно некие источники сущности стихий - сферы огня, воды, скалы и тьмы. Вот только где их искать?");
};

instance DIA_DRAGON_GOLD_DESTROYWAYTWO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroywaytwo_condition;
	information = dia_dragon_gold_destroywaytwo_info;
	permanent = FALSE;
	description = "Ты сказал, что знаешь два способа.";
};

func int dia_dragon_gold_destroywaytwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_destroyway) && (DESTROYCLAW == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroywaytwo_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_00");	//Ты сказал, что знаешь два способа уничтожить С'эньяка.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_01");	//Да... Есть и еще один.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_03");	//Второй способ заключается в том, чтобы пленить его душу таким же образом, как это было сделано когда-то.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_06");	//Интересно. И как можно пленить душу С'эньяка?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_07");	//(с сожалением) Ты повторяешь ошибки Древних...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_09");	//Для того чтобы пленить демона, тебе понадобится одно очень древнее заклинание.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_11");	//Оно называется Мора Уларту.На языке Древних это означает 'Темница Душ'.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_12");	//Ты должен будешь наложить его на С'эньяка, а после этого лишить его физической оболочки.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_13");	//Проще говоря, убить... А заклинание, в свою очередь, не даст ускользнуть душе после смерти...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_16");	//Тебе также понадобится темный кристалл, чтобы поместить туда пойманную душу С'эньяка.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_17");	//А тот кристалл, что находится в Когте - его все еще можно использовать?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_18");	//Хммм... думаю, да. Но, как видишь, это не слишком надежное место.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_19");	//Хотя, безусловно, есть и плюсы: поместив его душу обратно в Коготь, ты вернешь ему былую мощь.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_21");	//Однако одно неловкое движение, одна ошибка - и С'эньяк снова обретет свободу.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_1W");	//Хорошо, я все понял. Но скажи, где мне искать это заклинание, о котором ты говорил?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_2W");	//Я ничего не знаю про это. Мора Уларту - дар темного бога. Возможно, тот, кто владеет магией Тьмы и знает что-то об этом...
	if(Kapitel >= 5)
	{
		if(!Npc_IsDead(none_102_kreol))
		{
			if(KREOL_MYTEACHER == TRUE)
			{
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_22");	//Хммм... Думаю, я знаю одного из тех, кто ей владеет.
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//А после того как я найду это заклинание, где мне искать С'эньяка?
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//Сначала найди Темницу Душ, а потом мы поговорим о твоей встрече с ним.
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Поспеши, дорога каждая минута!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар поведал мне еще один способ уничтожить С'эньяка. Точнее, не совсем уничтожить, а лишь пленить его душу тем же образом, каким когда-то это сделали Древние. Мне необходимо достать одно очень редкое заклинание - Мора Уларту. Дракон предположил, что тот, кто связан с темной магией, мог бы помочь мне в этом. Надо бы поговорить с Креолом.");
			}
			else
			{
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_28");	//Хммм... С этим могут возникнуть проблемы...
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//А после того как я найду это заклинание, где мне искать С'эньяка?
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//Сначала найди Темницу Душ, а потом мы поговорим о твоей встрече с ним.
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Поспеши, дорога каждая минута!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар поведал мне еще один способ уничтожить С'эньяка. Точнее, не совсем уничтожить, а лишь пленить его душу тем же образом, каким когда-то это сделали Древние. Мне необходимо достать одно очень редкое заклинание - Мора Уларту. Дракон предположил, что тот, кто связан с темной магией, мог бы помочь мне в этом. Вот только где найти такого?");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_34");	//Хммм... Боюсь, я не знаю того, кто мог бы мне помочь.
			AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_35");	//Тогда не теряй времени и отправляйся на поиски сфер.
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар поведал мне еще один способ уничтожить С'эньяка. Точнее не совсем уничтожить, а лишь пленить его душу тем же образом, каким когда-то это сделали Древние. Мне необходимо достать одно очень редкое заклинание - Мора Уларту. Дракон предположил, что тот, кто связан с темной магией, мог бы помочь мне в этом. Вот только где найти такого? Похоже, мне придется выкинуть эту затею из головы...");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_37");	//Хммм... Думаю, я знаю одного из тех, кто ей владеет.
		AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//А после того как я найду это заклинание - где мне искать С'эньяка?
		AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//Сначала найди Темницу Душ, а потом мы поговорим о твоей встрече с ним...
		AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Поспеши, дорога каждая минута!
		TASKFINDDARKSOUL = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар поведал мне еще один способ уничтожить С'эньяка. Точнее не совсем уничтожить, а лишь пленить его душу тем же образом, каким когда-то это сделали Древние. Для этого мне необходимо достать одно очень редкое заклинание - Мора Уларту, что на языке древних означает 'Темница душ'. Дракон предположил, что тот, кто связан с темной магией, мог бы помочь мне в этом. Надо бы поговорить с Ксардасом.");
	};
};


instance DIA_DRAGON_GOLD_CLAWCARE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawcare_condition;
	information = dia_dragon_gold_clawcare_info;
	permanent = FALSE;
	description = "А что насчет Когтя?";
};

func int dia_dragon_gold_clawcare_condition()
{
	if(TASKFINDSPHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawcare_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawCare_01_00");	//А что насчет Когтя?
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_01");	//Ты можешь оставить его себе. Хотя Коготь Белиара - артефакт Тьмы, он может послужить и добру.
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_02");	//Но не забывай: меч был выкован для самого С'эньяка, и если демон вернет себе меч, он станет практически непобедим!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_08");	//Если ты не уверен в том, что сможешь противостоять этому злу, то лучшее решение в данной ситуации...
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_09");	//...отдать этот меч мне. Я уничтожу этот источник зла раз и навсегда!
	AI_Output(other,self,"DIA_Dragon_Gold_ClawCare_01_11");	//Хорошо. Я обдумаю твое предложение.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Аш'Тар может уничтожить Коготь, если я решу, что эта ноша мне не по силам.");
};


instance DIA_DRAGON_GOLD_CLAWDESTROY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawdestroy_condition;
	information = dia_dragon_gold_clawdestroy_info;
	permanent = TRUE;
	description = "Уничтожь Коготь!";
};

func int dia_dragon_gold_clawdestroy_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_clawcare) && (DESTROYCLAW == FALSE) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawdestroy_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_01_00");	//Уничтожь Коготь!
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_01_03");	//Думаю, это будет самое лучшее решение.
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_01_04");	//Ты в этом уверен?..
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Нет, постой!",dia_dragon_gold_clawdestroy_no);
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Да!",dia_dragon_gold_clawdestroy_yes);
};

func void dia_dragon_gold_clawdestroy_yes()
{
	B_GivePlayerXP(2500);
	B_ClearBeliarsWeapon();
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_Yes_01_01");	//Вот и все... Когтя больше нет!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_Yes_01_02");	//Его зло никогда больше не потревожит этот мир.
	DESTROYCLAW = TRUE;
	TOPIC_END_Klaue = TRUE;
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Success);
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я отдал меч Аш'Тару и тот уничтожил его.");
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

func void dia_dragon_gold_clawdestroy_no()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_No_01_00");	//Нет, постой!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_No_01_01");	//Как скажешь.
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

instance DIA_DRAGON_GOLD_HAVEONEORALL(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_haveoneorall_condition;
	information = dia_dragon_gold_haveoneorall_info;
	permanent = TRUE;
	description = "Насчет нашего дела...";
};

func int dia_dragon_gold_haveoneorall_condition()
{
	if(((TASKFINDDARKSOUL == TRUE) && (DESTROYCLAW == FALSE)) || (TASKFINDSPHERE == TRUE))
	{
		if(MISSSOULFOREVER == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_dragon_gold_haveoneorall_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_01_00");	//Насчет нашего дела...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_01_01");	//Тебе есть что сказать, человек? Ты принес Сферы?
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"Пока нет.",dia_dragon_gold_haveoneorall_none);

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Я достал Мора Уларту!",dia_dragon_gold_haveoneorall_mora);
	};
	if((TASKFINDSPHERE == TRUE) && (Npc_HasItems(other,itmi_fireshpere) >= 1) && (Npc_HasItems(other,itmi_watershpere) >= 1) && (Npc_HasItems(other,itmi_stoneshpere) >= 1) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Я достал все Сферы!",dia_dragon_gold_haveoneorall_sphere);
	};
	if((MIS_STONNOSTEST == LOG_SUCCESS) && (MISSSHEPREFOREVER == TRUE) && (MISSSOULFOREVER == FALSE))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Я отдал их Хранителям.",dia_dragon_gold_haveoneorall_spheregone);
	};
};

func void dia_dragon_gold_haveoneorall_none()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_None_01_00");	//Пока нет.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_None_01_01");	//Тогда чего ты ждешь?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_None_01_02");	//Иди и принеси то, о чем я тебе говорил! И поспеши - у нас мало времени...
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_spheregone()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_00");	//Нет. Я отдал их Хранителям.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_01");	//(рычит) Зачем ты это сделал?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_02");	//Без них у тебя не будет и малейшего шанса одолеть С'эньяка!
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_03");	//У меня не было другого выбора.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_06");	//Тогда тебе придется сражаться с архидемоном без какой-либо помощи, и, скорее всего, ты проиграешь...

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_08");	//Но у меня еще есть Мора Уларту! Как насчет этого?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//(рычит) Значит, ты умудрился достать этот артефакт.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Да, но было бы неплохо понять, как эта штука работает.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Просто - перед тем как начать битву с С'эньяком, используй на нем это заклинание.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//А после того как архидемон будет повержен, забери из его плоти камень с заточенной душой.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Затем возьми этот камень и соедини его с Когтем Белиара на алтаре Темного бога - кристалл в основании клинка поглотит душу С'эньяка, и меч вновь обретет былую мощь!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если я намереваюсь использовать Мора Уларту, чтобы пленить душу С'эньяка, мне следует соединить камень с душой архидемона и Коготь Белиара, чтобы последний поглотил содержимое камня. Это вернет оружию его былую мощь.");
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22");	//А если мне удастся достать Мора Уларту?
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_25");	//Как я смогу его использовать?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Просто - перед тем как начать битву с С'эньяком, используй на нем это заклинание.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//А после того как архидемон будет повержен, забери из его плоти камень с заточенной душой.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Затем возьми этот камень и соедини его с Когтем Белиара на алтаре Темного бога - кристалл в основании клинка поглотит душу С'эньяка, и меч вновь обретет былую мощь!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если я намереваюсь использовать Мора Уларту, чтобы пленить душу С'эньяка, мне следует соединить камень с душой архидемона и 'Коготь Белиара', чтобы последний поглотил содержимое камня. Это вернет оружию его былую мощь.");
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Ну, это мы еще посмотрим.
	};

	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_34");	//Теперь ты мне скажешь, как добраться до С'эньяка?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36");	//Его обитель находится в самом центре Лэнга, в мире демонов. Ни одному смертному туда просто так никогда не попасть.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37");	//Поэтому единственный способ заставить С'эньяка сразиться с тобой - призвать его в этот мир!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39");	//Просто возьми эту вещь.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Что это?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41");	//Золотой рог Ахианти - магический артефакт, звук которого способен призвать любое существо к его владельцу. Но только один раз!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42");	//С'эньяк не сможет противостоять силе этого артефакта и явится на твой зов.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43");	//Место встречи с С'эньяком ты выберешь сам. Постарайся сделать это с умом.
	KNOWS_CRESTMAKE = TRUE;
	AshtarLastWarn = TRUE;
	MISSSOULFOREVER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_mora()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_00");	//Я достал Мора Уларту!	
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//Аргхх...(рычит) Значит, ты как-то умудрился достать этот артефакт.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Да, но было бы неплохо понять, как эта штука работает.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Просто - перед тем как начать битву с С'эньяком, используй на нем это заклинание.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//А после того как архидемон будет повержен, забери из его плоти камень с заточенной душой.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Затем возьми этот камень и соедини его с Когтем Белиара на алтаре Темного бога - кристалл в основании клинка поглотит душу С'эньяка, и меч вновь обретет былую мощь!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13");	//Но хочу тебя сразу предупредить: после того как используешь на С'эньяке магию Мора Уларту...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14");	//...Ты не сможешь воспользоваться Крестом Стихий!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16");	//Сила Мора Уларту не сможет противостоять ужасающей мощи этого заклинания, и камень души будет уничтожен.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17");	//Поэтому здесь тебе придется сражаться с С'эньяком в честном бою. И скажу прямо: у тебя мало шансов.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Ну, это мы еще посмотрим.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_1W");	//Теперь ты мне скажешь, как добраться до С'эньяка?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_20");	//Нет...
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_21");	//Но почему?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_23");	//Ты должен иметь при себе Крест Стихий, как запасной вариант.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_25");	//Если что-то пойдет не так, это заклинание - наш единственный шанс уничтожить С'эньяка!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_26");	//Поэтому принеси мне те сферы. Тогда мы поговорим о твоей встрече с архидемоном.
	TELLGDMU = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если я намереваюсь использовать Мора Уларту, чтобы пленить душу С'эньяка, мне не следует потом использовать Крест Стихий, ибо это заклинание уничтожит демона вместе с его душой. После того как с С'эньяком будет покончено, мне необходимо соединить камень с душой архидемона и 'Коготь Белиара', чтобы последний поглотил содержимое камня. Это вернет оружию его былую мощь. Но в любом случае мне необходимо иметь при себе Крест Стихий.");
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
};

func void dia_dragon_gold_haveoneorall_sphere()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_00");	//Я достал все сферы.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_01");	//Очень хорошо.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_02");	//Теперь у тебя есть почти все необходимое, чтобы сделать Крест Стихий и уничтожить С'эньяка!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_04");	//Да, не хватает последней детали...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_06");	//МОЕГО СЕРДЦА!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_08");	//Только с его помощью ты сможешь объединить сферы элементов и сотворить из них Крест Стихий!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_09");	//Однажды ты спросил меня, человек, - в чем смысл моего существования...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_11");	//Именно в этом он и заключается - дать шанс смертному, как ты, одолеть такое несокрушимое зло, как С'эньяк!
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_14");	//Ты принесешь себя в жертву?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_16");	//Не думай об этом. Ты сейчас должен думать только об одном - о своей предстоящей битве с С'эньяком!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_17");	//А теперь отойди...
	AshtarLastWarn = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Когда я показал Аш'Тару сферы элементов, он поведал мне, как создать Крест Стихий. К сожалению, ему пришлось заплатить мне за помощь своей жизнью, ибо для создания этого заклинания требуется магическая эссенция из его сердца - из сердца золотого дракона! Кроме того, Аш'Тар рассказал мне и некоторые другие детали, которые помогут мне при встрече с С'эньяком.");
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"(отойти)",dia_dragon_gold_haveoneorall_giveheart);
};

func void dia_dragon_gold_haveoneorall_giveheart()
{
	AI_Dodge(other);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	KNOWS_CRESTMAKE = TRUE;
	AI_Print("Обучен изготовлению руны - 'Крест Стихий'");
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	B_GiveInvItems(self,other,itat_golddragonheart,1);
	AI_Wait(self,5);
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_00");	//Вот, возьми его...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_03");	//Для того чтобы сделать Крест Стихий, окропи все сферы магической эссенцией, взятой из моего сердца, а потом просто соедини их вместе. Используй для этого рунический стол.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_04");	//После того как сделаешь это, настанет время встретиться с архидемоном.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_05");	//Как добраться до С'эньяка?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36");	//Его обитель находится в самом центре Лэнга, в мире демонов. Ни одному смертному туда просто так никогда не попасть.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37");	//Поэтому единственный способ заставить С'эньяка сразиться с тобой - это призвать его в этот мир!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39");	//Просто возьми эту вещь.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Что это?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41");	//Золотой рог Ахианти - магический артефакт, звук которого способен призвать любое существо к его владельцу. Но только лишь один раз.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42");	//С'эньяк не сможет противостоять силе этого артефакта и явится на твой зов.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43");	//Как ты уже наверняка понял, место встречи с С'эньяком ты выберешь сам. Поэтому постарайся использовать его с умом.

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_18");	//У меня также есть Мора Уларту!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//Аргхх...(рычит) Значит, ты как-то умудрился достать этот артефакт.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Да, но было бы неплохо понять, как эта штука работает.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Просто - перед тем как начать битву с С'эньяком, используй на нем это заклинание.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//А после того как архидемон будет повержен, забери из его плоти камень с заточенной душой.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Затем возьми этот камень и соедини его с Когтем Белиара на алтаре Темного бога - кристалл в основании клинка поглотит душу С'эньяка, и меч вновь обретет былую мощь!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13");	//Но хочу тебя сразу предупредить: после того как используешь на С'эньяке магию Мора Уларту...
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14");	//...Ты не сможешь воспользоваться Крестом Стихий!
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_15");	//Но почему?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16");	//Сила Мора Уларту не сможет противостоять ужасающей мощи этого заклинания и, камень души будет уничтожен!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17");	//И тогда тебе придется сражаться с С'эньяком в честном бою. И скажу прямо: у тебя мало шансов.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Ну, это мы еще посмотрим.
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если я намереваюсь использовать Мора Уларту, чтобы пленить душу С'эньяка, мне не следует потом использовать Крест Стихий, ибо это заклинание уничтожит демона вместе с его душой. После того как с С'эньяком будет покончено, мне необходимо соединить камень с душой архидемона и 'Коготь Белиара', чтобы последний поглотил содержимое камня. Это вернет оружию его былую мощь.");
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22");	//А если мне удастся достать Мора Уларту - как я смогу его использовать?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Просто - перед тем, как начать битву с С'эньяком, используй на нем это заклинание.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//А после того как архидемон будет повержен - забери из его плоти камень с заточенной душой.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Затем, возьми этот камень и соедини его с Когтем Белиара на алтаре Темного Бога - кристалл в основании клинка поглотит душу С'эньяка и меч вновь обретет былую мощь!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если я намереваюсь использовать Мора Уларту, чтобы пленить душу С'эньяка - мне не следует потом использовать Крест Стихий, ибо это заклинание уничтожит демона вместе с его душой. После того как с С'эньяком будет покончено - мне необходимо соединить камень с душой архидемона и 'Коготь Белиара', чтобы последний поглотил содержимое камня. Это вернет оружию его былую мощь!");
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Ну, это мы еще посмотрим.
	};

	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_57");	//Теперь это все, что тебе следует знать
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_58");	//И, кажется, мое время вышло...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_59");	//Я уже чувствую, как мои силы уходят - я слабею...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_61");	//...(рычит от боли)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_62");	//Ступай человек, и запомни все, что я тебе сказал.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Dead_01_00");	//(умирая) Не подведи меня...
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,Dialog_Ende,dia_dragon_gold_haveoneorall_dead);
};

func void dia_dragon_gold_haveoneorall_dead()
{
	AI_StopProcessInfos(self);
	DragonGoldIsDead = TRUE;
	HeroNotMobsi = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	Wld_StopEffect("DIALOGSCOPE_FX");
};


//---------------------Дракон Аданоса-------------------------------------------

instance DIA_Dragon_AV_EXIT(C_Info)
{
	npc = Dragon_AV;
	nr = 999;
	condition = dia_Dragon_AV_exit_condition;
	information = dia_Dragon_AV_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Dragon_AV_exit_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Dragon_AV_HELLO(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_hello_condition;
	information = dia_Dragon_AV_hello_info;
	important = TRUE;
};

func int dia_Dragon_AV_hello_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Hello_info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_00");	//Наконец-то ты здесь... Я так долго ждал тебя!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_01");	//Ты меня ждал? И как это понимать?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_02");	//Ты ведь тот, кого Аданос выбрал в качестве своего избранника.
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_03");	//С чего ты так решил?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_04");	//Ты носишь его символы власти, и к тому же смог добраться до этого места.
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_05");	//А это может означать только одно: Аданос выбрал тебя!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_06");	//Ну, допустим. И что теперь?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_07");	//Теперь пришло время выполнить возложенную им на тебя обязанность!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_08");	//Какую еще обязанность?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_09");	//Уничтожить то зло, что когда-то посмело вторгнуться в его священную вотчину.
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_10");	//Зло, которое я охраняю здесь уже много веков!
};

instance DIA_Dragon_AV_Evil(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_Evil_condition;
	information = dia_Dragon_AV_Evil_info;
	permanent = FALSE;
	description = "Что это за зло?";
};

func int dia_Dragon_AV_Evil_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Evil_info()
{
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_00");	//Что это за зло?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_01");	//Очень древнее и опасное... Зло, которое было порождено одним из братьев Аданоса.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_02");	//Ты имеешь ввиду Инноса или Белиара?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_03");	//Белиара! Только он способен сотворить такое.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_04");	//Хорошо. И как же выглядит это зло?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_05");	//За несколько тысячелетий своего существования оно принимало самые различные формы и очертания.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_06");	//Как оно выглядит сейчас, я не знаю. Но я чувствую его присутствие... чувствую, что оно до сих пор там.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_07");	//Там - это где?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_08");	//В храме, что позади меня.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_09");	//Хочешь сказать, что я должен буду отправиться в этот храм и уничтожить это ЗЛО?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_12");	//Именно так. Такова воля Аданоса!
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_13");	//Ну хорошо. И как мне победить его?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_14");	//Этого я не знаю. Я лишь только страж...
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_15");	//Ох, ну ладно, разберусь как-нибудь сам. А как мне попасть в храм?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_17");	//Я открою двери храма, как только ты скажешь, что готов к этому.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_18");	//Но хочу предупредить тебя... Кроме меня, храм еще охраняют бессмертные стражи.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_19");	//Время, проведенное ими внутри, под влиянием могущественного зла превратило их в чудовищных монстров.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_20");	//Раньше они не посмели бы напасть на избранника самого Аданоса. Но теперь...
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_21");	//Полагаешь, что теперь они захотят сделать мне больно?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_22");	//Теперь они служат этому злу, и наверняка будут до конца защищать своего господина.
};

var int HramDoorOpen;

instance DIA_Dragon_AV_OpenHram(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_OpenHram_condition;
	information = dia_Dragon_AV_OpenHram_info;
	permanent = TRUE;
	description = "Открой ворота храм, страж!";
};

func int dia_Dragon_AV_OpenHram_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dragon_AV_Evil) && (HramDoorOpen == FALSE))
	{
		return TRUE;
	};
};

func void dia_Dragon_AV_OpenHram_info()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_01_00");	//Открой ворота храма, страж!
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_01_01");	//Ты уверен, что готов к этой битве?
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_01_02");	//Если ты потерпишь неудачу, то зло вновь вырвется наружу, и я уже буду не в силах его остановить.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
	Info_AddChoice(DIA_Dragon_AV_OpenHram,"Нет, постой.",DIA_Dragon_AV_OpenHram_No);
	Info_AddChoice(DIA_Dragon_AV_OpenHram,"Открывай уже!",DIA_Dragon_AV_OpenHram_Yes);
};

func void DIA_Dragon_AV_OpenHram_No()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_No_01_00");	//Нет, постой.
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_No_01_01");	//Твоя неуверенность немного пугает меня...
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_No_01_02");	//Однако действительно лучше хорошо подготовиться, ибо предстоящий бой будет тяжелым.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
};

func void DIA_Dragon_AV_OpenHram_Yes()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_Yes_01_00");	//Открывай уже!
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_Yes_01_01");	//Ворота храма открыты... Удачи тебе в битве, избранник! И да пребудет с тобой Аданос.
	AI_StopProcessInfos(self);

	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_SCREENBLEND",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_01");
	HramDoorOpen = TRUE;

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_8");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_16");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_15");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_10");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_11");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_4");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_5");
	};
};