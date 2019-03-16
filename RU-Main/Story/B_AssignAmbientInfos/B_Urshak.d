
instance DIA_Urshak_EXIT(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 999;
	condition = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Urshak_HALLO(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 5;
	condition = DIA_Urshak_HALLO_Condition;
	information = DIA_Urshak_HALLO_Info;
	important = TRUE;
};


func int DIA_Urshak_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == FALSE) && (MEETURSHAKALREADY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HALLO_Info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(агрессивно) КРОТОК ДЖАБАРТ!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Стой! Моя знать тебя. Ты друг человек с мягким голосом.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Друг убивать злого демона КРУШАКА.
	B_GivePlayerXP(XP_UrshakFound);
	Log_CreateTopic(TOPIC_Urshak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak,LOG_Running);
	B_LogEntry(TOPIC_Urshak,"Я нашел своего старого друга-орка - Ур-Шака.");
	Info_ClearChoices(DIA_Urshak_HALLO);
	Info_AddChoice(DIA_Urshak_HALLO,"Что ты делаешь здесь?",DIA_Urshak_HALLO_freund);
	Info_AddChoice(DIA_Urshak_HALLO,"Говорящий орк?",DIA_Urshak_HALLO_wer);
};

func void DIA_Urshak_HALLO_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Говорящий орк?!
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Ты забывать Ур-Шак?!...(печально) Ты расстраивать меня.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ур-Шак помогать другу много дней раньше получить УЛУ-МУЛУ! Для ходить в моя деревня. Орки уважать друг друга и друг не умирать от руки орков!
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Друг потом ходить в храм орков и изгонять злого демона. Много дней раньше! Твоя не помнить?
	URSHAKBONUSGOTIKA = TRUE;
};

func void DIA_Urshak_HALLO_freund()
{
	if(URSHAKBONUSGOTIKA == FALSE)
	{
		URSHAKBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//Ты выбрал не лучшее время, чтобы встать у меня на пути. Я чуть не убил тебя! Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ур-Шак смотреть на землю и  видеть, что стало с землей и мой народ.
	Info_ClearChoices(DIA_Urshak_HALLO);
};

instance DIA_URSHAK_TARROKWOUND(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_tarrokwound_condition;
	information = dia_urshak_tarrokwound_info;
	description = "Мне нужна твоя помощь.";
};

func int dia_urshak_tarrokwound_condition()
{
	if((MEETTARROK == TRUE) && (TARROKHEALTHY == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_tarrokwound_info()
{
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_01");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_02");	//Друг приходить всегда. Ур-Шак помогать друг.
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_03");	//Я встретил твоего друга, Таррока. К несчастью, на него напало несколько скелетов и он был сильно ранен.
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_04");	//Теперь, чтобы он не умер ему нужно лечебное орочье зелье. Ты можешь мне саказать, где его достать?
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_05");	//Друг Ур-Шака ранен!!! Плохо... Друг правильно делать, что приходить к Ур-Шак.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_06");	//Другу не надо искать зелье. Ур-Шак даст его. Друг отнесет его Тарроку и он быть здоровый.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_07");	//Вот...Друг получать зелье. Теперь спешить.
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	B_LogEntry(TOPIC_TARROKWOUND,"Ур-Шак дал мне орочье зелье...Теперь я должен отдать его Тарроку. Надеюсь, это ему поможет.");
};


instance DIA_URSHAK_HASULUMULU(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_hasulumulu_condition;
	information = dia_urshak_hasulumulu_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_urshak_hasulumulu_condition()
{
	if((FINDULUMULU == TRUE) && (URSHAKKNOWULUMULU == FALSE) && (URSHAK_SUCKED == FALSE) && (Npc_HasItems(other,itmw_2h_orcprestige) >= 1))
	{
		return TRUE;
	};
};

func void dia_urshak_hasulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Urshak_HasUlumulu_18_01");	//Друг найти Улу-Мулу!!!(восхищенно)...Какой хороший!
	URSHAKKNOWULUMULU = TRUE;
};


instance DIA_Urshak_WASMACHENORKS(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = DIA_Urshak_WASMACHENORKS_Condition;
	information = DIA_Urshak_WASMACHENORKS_Info;
	description = "Почему орки нападают на людей?";
};


func int DIA_Urshak_WASMACHENORKS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASMACHENORKS_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Почему орки нападают на людей?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ур-Шак всегда говорить народ орков, что люди не зло и с ними надо дружить.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Но шаман не слушать Ур-Шак. Ур-Шак в немилость у свой народ.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Поэтому Ур-Шак не знать точно о большой план войны против людей.
	B_LogEntry(TOPIC_Urshak,"Он все еще никак не может заставить свой народ выслушать его. Он все еще изгнанник.");
};


instance DIA_Urshak_SOVIELE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 7;
	condition = DIA_Urshak_SOVIELE_Condition;
	information = DIA_Urshak_SOVIELE_Info;
	description = "Почему вас здесь так много?";
};


func int DIA_Urshak_SOVIELE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_SOVIELE_Info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Почему вас здесь так много?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Орки приходить с гор, но другие приплывать на кораблях и делать большой забор.
};


instance DIA_Urshak_ZAUN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 8;
	condition = DIA_Urshak_ZAUN_Condition;
	information = DIA_Urshak_ZAUN_Info;
	description = "Что скрывается за этим частоколом орков на востоке?";
};


func int DIA_Urshak_ZAUN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_ZAUN_Info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Что скрывается за этим частоколом орков на востоке?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Орки всегда делать большой забор и готовить лагерь к война.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Забор хорошо для война. Скрывать сила армия и защищать орков.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_03");	//Но Ур-Шак слышать странные новости, однако.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_04");	//Орки говорить - чужая магия придти за ограда. Непонятная магия!
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_05");	//Орки испугаться! Шаманы испугаться! Орки больше не ходить за ограда.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_06");	//Ур-Шак не видеть такого раньше.
};


instance DIA_Urshak_WASHASTDUVOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_WASHASTDUVOR_Condition;
	information = DIA_Urshak_WASHASTDUVOR_Info;
	description = "Что ты планируешь делать дальше?";
};


func int DIA_Urshak_WASHASTDUVOR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHASTDUVOR_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Что вы планируете делать дальше?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ур-Шак ждать, пока разведчики орков приводить Ур-Шак к Хош-Пак.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Кто такой Хош-Пак?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Очень большой шаман. Иметь большое влияние на воинов и делать большие планы для орков.
	B_LogEntry(TOPIC_Urshak,"Ур-Шак хочет встретиться с шаманом орков Хош-Паком и убедить его принять Ур-Шака назад в совет шаманов.");
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,Dialog_Back,DIA_Urshak_WASHASTDUVOR_weiter);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Где я могу найти этого Хош-Пака?",DIA_Urshak_WASHASTDUVOR_);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Почему ты тогда не пойдешь к нему?",DIA_Urshak_WASHASTDUVOR_hoshpak);
};

func void DIA_Urshak_WASHASTDUVOR_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Почему ты тогда не пойдешь к нему?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ур-Шак пытаться и пытаться получить опять честь и старое место в совет шаманов.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Но пока Хош-Пак не слушать Ур-Шак. Орки убивать Ур-Шак если видеть его без разведчиков. Ур-Шак должен говорить с Хош-Пак.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Может быть, это удаваться сегодня.
};

func void DIA_Urshak_WASHASTDUVOR_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Где я могу найти этого Хош-Пака?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Он там где может наблюдать за воины орков у крепости у большой вулкан, чтобы Хош-Пак мочь контролировать воины.
};

func void DIA_Urshak_WASHASTDUVOR_weiter()
{
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
};


instance DIA_URSHAK_TEMPLEDOOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = dia_urshak_templedoor_condition;
	information = dia_urshak_templedoor_info;
	description = "Что случилось в подземном Храме?";
};


func int dia_urshak_templedoor_condition()
{
	if((ORCTEMPLEGATEINFO == TRUE) && (ORCTEMPLEGATEOPENED == FALSE) && (BUMSHAKINSERTED == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_templedoor_info()
{
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_00");	//Ты знаешь, что случилось в Храме Спящего?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_01");	//Сначала орки откапать Храм после ухода злой Крушак.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_02");	//Орки плясать и радоваться, что Храм цел. Шаманы заклинать Храм духом орков.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_03");	//Но потом приходить снова злой демон. Стал убивать и заколдовывать братьев. Орки испугаться и уйти из Храм.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_04");	//Братья закрыть вход и наложить сильное заклятие. Друг не подходить близко, а то друг умереть быстро.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_03");	//Как же тогда туда попасть?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_06");	//Друг хочет ходить в Храм?! Друг не боится зло?!!!
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_05");	//Мне нужно попасть в подземный храм! Ты можешь провести меня туда?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_08");	//Братья Ур-Шак закрыть Храм в земле очень хорошо. Братья уносить ключ в свой город и прятать его там.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_06");	//Город? Ты хочешь сказать город, где живут орки?!
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_10");	//Подземный город, где жить браты Ур-Шак. Они очень много!
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_11");	//Ур-Шак помнить, у друг быть Улу-Мулу. Друг одеть Улу-Мулу и не умереть.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_12");	//Боюсь, я его потерял. Ты знаешь, где мне достать еще одно Улу-Мулу?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_13");	//Только воины делать Улу-Мулу. Ур-Шак не быть воином. Быть шаманом. Но Ур-Шак может говорить, где найти Улу-Мулу.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_14");	//Чужак опять ходить к друг Ур-Шак. Его звать Таррок. Друг должен помнить его.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_15");	//Где искать твоего друга?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_16");	//Друг идти на север, к болоту, и искать там рядом с башней. Ур-Шак думать, друг найдет его там.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_17");	//А где мне искать город?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_18");	//Дом Ур-Шак быть недалеко от бывшая шахта людей.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_19");	//Друг не забыть нести Улу-Мулу в руке, когда идти.

	if(ORCPROMISEMAKE == FALSE)
	{
		AI_Output(self,other,"DIA_Urshak_TempleDoor_01_20");	//Еще Ур-Шак хотеть попросить друг - если друг приходить в город братьев, может друг просить их разрешить Ур-Шаку вернуться?
		AI_Output(other,self,"DIA_Urshak_TempleDoor_01_21");	//Постараюсь! Если конечно они вообще станут со мной говорить.
	};

	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_22");	//Спасибо за помощь, Ур-Шак.
	B_LogEntry(TOPIC_ORCTEMPLE,"Ур-Шак рассказал мне, что единственный способ попасть в Храм Спящего - это достать ключ орков, с помощью которого они наложили заклятье на решетку у входа. Для этого, мне придется отправиться в город орков и попробывать их уговорить, отдать мне этот артефакт.");
	B_LogEntry_Quiet(TOPIC_ORCTEMPLE,"Чтобы моя прогулка среди толп орков была более-менее приятной, мне надо иметь с собой Улу-Мулу - знак дружбы и силы орков. С ним, орки не тронут меня. Ур-Шак не может сделать мне этот орочий талисман, но он сказал, кто бы мог мне помочь. Он назвал имя Таррок. Возможно этот орк согласится сделать для меня этот Улу-Мулу. По словам Ур-Шака, его я смогу найти рядом с болотом, около небольшой башни.");

	if(ORCPROMISEMAKE == FALSE)
	{
		B_LogEntry_Quiet(TOPIC_Urshak,"Ур-Шак попросил меня замолвить за него словечко перед своими братьями, если конечно предоставится такой случай. Что не сделаешь ради старого доброго друга.");
	};

	BUMSHAKINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(orc_8524_bumshak,"OW_PATH_50");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_01");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_02");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_03");
};

instance DIA_Urshak_HOSHPAKDEAD(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_HOSHPAKDEAD_Condition;
	information = DIA_Urshak_HOSHPAKDEAD_Info;
	description = "Хош-Пак мертв.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_WASHASTDUVOR) && Npc_IsDead(Hosh_Pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKDEAD_Info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Хош-Пак мертв.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Хош-Пак мертв?! РУШТАСОК!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Мое сердце большая печаль. Ур-Шак никогда не забывать великий орк делать Ур-Шак шаман.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Я понимаю. Хош-Пак был твоим учителем.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ур-Шак теперь должен носить ношу горя, должен дать Хош-Пак последний обряд. Ур-Шак надо идти.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Друг лучше уходить проход. Слишком опасно здесь.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ур-Шак печалиться если человек тоже умирать.
	B_LogEntry(TOPIC_Urshak,"Хош-Пак мертв. Мой друг орк направляется в палатку Хош-Пака. Он скорбит по своему наставнику. Я должен отпустить его.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");
};

instance DIA_Urshak_HOSHPAKRACHE(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_HOSHPAKRACHE_Condition;
	information = DIA_Urshak_HOSHPAKRACHE_Info;
	important = TRUE;
};


func int DIA_Urshak_HOSHPAKRACHE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKDEAD) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKRACHE_Info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//Хоток! Я узнавать, что ты быть здесь, когда Хош-Пак убивать. Твоя делать большая ошибка, чужак.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ур-Шак видеть большая ошибка доверять злой человек. Ур-Шак сожалеть звать человек другом и помогать ему не быть убит.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Чужак теперь покидать долина и идти в Проход. Ур-Шак не будет убивать чужак сейчас. Честь шаман говорит Ур-Шак не убивать.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//В следующий раз мы встречаться - мы враги! Твои лучше уходить сейчас.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry(TOPIC_Urshak,"Теперь Ур-Шак на враждебной стороне и немного раздражен из-за того, что я прикончил его учителя. Может, что-нибудь заставит его забыть об этом инциденте.");
	Npc_ExchangeRoutine(self,"PreStart");
};


instance DIA_Urshak_KEINEWAHL(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_KEINEWAHL_Condition;
	information = DIA_Urshak_KEINEWAHL_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Urshak_KEINEWAHL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKRACHE) && Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == TRUE) && (URSHAKNOMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_KEINEWAHL_Info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Твоя уходить. Моя больше не говорить с чужак.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};


instance DIA_URSHAK_FORGIVEME(C_Info)
{
	npc = NONE_110_Urshak;
	condition = dia_urshak_forgiveme_condition;
	information = dia_urshak_forgiveme_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_urshak_forgiveme_condition()
{
	if((URSHAKNOMAGIC == TRUE) && (URSHAKENDANGRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_forgiveme_info()
{
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_00");	//Что человек делать? Зачем пытаться колдовать Ур-Шак?...
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_01");	//Ты снова заговорил со мной!...
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_02");	//Человек говорить странные слова...Ур-Шак не понимать.
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_03");	//Ур-Шак помнить человек быть друг. Почему Ур-Шак не мочь разговаривать с человек?!...(непонимающе)
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_04");	//А разве ты на меня больше не злишься?
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_05");	//Почему Ур-Шак должен злиться на человек!...(непонимающе)
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_06");	//Все понятно...Хмм...Да, что-то я несу просто полный бред. Сам не знаю, что со мной. Забудь об этом!
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_07");	//Ур-Шак думать, друг быть очень странный сегодня. Может друг колдовать злой демон или друг болеть?
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_08");	//Да нет, все в порядке, дружище. Просто - забудь об этом.
	B_LogEntry(TOPIC_Urshak,"По видимому, моя идея попробывать наложить на Ур-Шака магическое заклинание забывания сработала! Ур-Шак забыл про тот неприятный случай с его учителем. Теперь мы снова друзья.");
	B_GivePlayerXP(500);
	URSHAKENDANGRY = TRUE;
};

instance DIA_URSHAK_ORCTEMPLEFIXED(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orctemplefixed_condition;
	information = dia_urshak_orctemplefixed_info;
	permanent = FALSE;
	description = "Я покончил со злом в Храме Спящего.";
};


func int dia_urshak_orctemplefixed_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && ((URSHAK_SUCKED == FALSE) || (URSHAKENDANGRY == TRUE)))
	{
		return TRUE;
	};
};

func void dia_urshak_orctemplefixed_info()
{
	AI_Output(other,self,"DIA_Urshak_OrctempleFixed_15_00");	//Я покончил со злом в Храме Спящего.
	AI_Output(self,other,"DIA_Urshak_OrctempleFixed_18_01");	//(пораженно) ХРОТОК ЯБАРТ!!! Как друг-человек сумел это?
	AI_Output(other,self,"DIA_Urshak_OrctempleFixed_15_02");	//Это было непросто.
	AI_Output(self,other,"DIA_Urshak_OrctempleFixed_18_03");	//Ур-Шак очень уважать друг-человек. Очень, очень уважать.
	B_GivePlayerXP(300);
};


instance DIA_URSHAK_BECOMESHAMAN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_becomeshaman_condition;
	information = dia_urshak_becomeshaman_info;
	permanent = FALSE;
	description = "По поводу твоей просьбы.";
};

func int dia_urshak_becomeshaman_condition()
{
	if((ORCPROMISEMAKE == TRUE) && (URSHAKBECOMESHAMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_becomeshaman_info()
{
	B_GivePlayerXP(XP_UrshakBecomesShaman);
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_00");	//По поводу твоей просьбы.
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_01");	//Я замолвил за тебя словечко перед вождем орков.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_02");	//И что сказать вождь?
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_03");	//Теперь ты можешь вернуться к братьям!
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_04");	//ХРОТОК ЯБАРТ!!!...(пораженно) Как друг-человек сумел это?
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_05");	//Я оказал вождю одну неоцинимую услугу - взамен вождь согласился выполнить и мою просьбу.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_06");	//Ур-Шак очень сильно радоваться! Ур-Шак говорить друг-человек большое спасибо!
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_07");	//Да, ладно. Это было не так уж сложно.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_08");	//Ур-Шак никогда не забыть друг-человек и что сделать он для Ур-Шак!
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_09");	//Теперь мне пора.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_10");	//Хорошо, друг идти. Ур-Шак готовиться к возвращению домой - к братьям.
	URSHAKBECOMESHAMAN = TRUE;
	MIS_UrshakShaman = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Urshak,LOG_SUCCESS);
	B_LogEntry(TOPIC_Urshak,"Теперь Ур-Шак снова принадлежит к кругу шаманов.");
};


instance DIA_URSHAK_ORCORDER(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcorder_condition;
	information = dia_urshak_orcorder_info;
	permanent = FALSE;
	description = "Ты можешь мне помочь в одном деле?";
};


func int dia_urshak_orcorder_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (Npc_HasItems(hero,itwr_orcsorder) >= 1) && (PlayerKnowsOrcLanguage == FALSE) && (KNOWSTARANBUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_orcorder_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_00");	//Ты можешь мне помочь в одном деле?
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_01");	//Ур-Шак всегда готов помочь человек. Что Ур-Шак может сделать для друг?!
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_02");	//У меня есть вот это письмо - оно написано на языке орков.
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_03");	//Ты мог бы мне его прочитать?!
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_04");	//Хорошо! Друг давать письмо Ур-Шак - он читать и человек слушать.
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_05");	//Вот, держи.
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_06");	//...(смотрит на письмо) Здесь писать о большие планы орков на войну с человек.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_07");	//ХРОТОК ЯБАРТ!!! Откуда у человек это письмо?!...(удивленно)
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_08");	//Случайно нашел! Лучше не останавливайся - читай все, что там написано.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_09");	//Хммм...(смотрит на письмо)
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_10");	//Орки писать, что скоро прибывать сюда много сильных воинов и сражаться против людей.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_11");	//Но братья сначала должны захватить большая крепость людей.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_12");	//Без крепость орки не пойдут дальше воевать - нельзя идти сражаться, если сзади враги!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_13");	//Нужен большой таран, чтобы сломать стену и ворота!
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_14");	//Поэтому братья прислать отряд рабов, чтобы делать таран. Они идти скоро в большой лагерь орков.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_15");	//Это все, что здесь писать...
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_16");	//Понятно. Так значит, орки хотят построить новый таран, чтобы штурмовать замок?!
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_17");	//Ур-Шак думать так.
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_18");	//Ладно! Спасибо за помощь.
	B_LogEntry(TOPIC_ORCORDER,"Ур-Шак помог мне прочитать письмо. В нем говорится, что орки прислали отряд рабов, чтобы сделать новый таран для штурма замка. Судя по всему, этот отряд должен скоро прибыть в их лагерь у крепости. Теперь надо как можно скорее сообщить об этом Альберту.");
	KNOWSTARANBUILD = TRUE;
};


instance DIA_URSHAK_WAKONTEST(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_wakontest_condition;
	information = dia_urshak_wakontest_info;
	permanent = FALSE;
	description = "Мне нужен твой совет, Ур-Шак.";
};


func int dia_urshak_wakontest_condition()
{
	if(MIS_WAKONTEST == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_urshak_wakontest_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_00");	//Мне нужен твой совет, Ур-Шак.
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_01");	//Ур-Шак слушайть друга. Что друг хочет спросить?
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_02");	//Расскажи мне, что ты знаешь о Духе Воды?
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_03");	//Духе Воды?! Хммм...(задумчиво) Боюсь, что Ур-шак мало знать об этом. Мало слышать о нем!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_04");	//Однако Ур-Шак думать, что знать - кто из братьев возможно сможет помочь человек.
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_05");	//И кто же это?!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_06");	//Друг надо идти в горы к оркам! Там искать клан Большого Камня - быть большой лагерь и жить много орков.
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_07");	//Человек должен спрашивать там. Может кто-то поможет друг!
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_08");	//Но как мне туда добраться?!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_09");	//Человек искать дорога в горы рядом со старым городом братьев, где раньше быть храм Крушак!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_10");	//Друг идти высоко в горы, искать и находить большой лагерь.
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_11");	//Ладно, спасибо за помощь!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_12");	//Ур-Шак всегда рад помочь друг человек.
	URSHAKTELLWATERSOUL = TRUE;
	B_LogEntry(TOPIC_WAKONTEST,"К большому моему сожалению, Ур-Шак ничего не знает о Духе Воды. Но он посоветовал мне отравиться высоко в горы за Храм Спящего, где находится большой лагерь клана Большого Камня. Возможно там я смогу узнать больше по интересующей меня теме.");
};


instance DIA_URSHAK_MEETINCASTLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 1;
	condition = dia_urshak_meetincastle_condition;
	information = dia_urshak_meetincastle_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_urshak_meetincastle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORсGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (PALADINATTACK == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_meetincastle_info()
{
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_00");	//Ур-Шак видеть друг-человек прийти в замок! Зачем он это делать?!
	AI_Output(other,self,"DIA_Urshak_MeetInCastle_01_01");	//Значит, ты тоже здесь. Не ожидал тебя тут встретить!
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_02");	//Почему человек так удивляться?!...(непонимающе)
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_03");	//Ур-Шак быть теперь шаман, вернуться к братьям и идти воевать вместе с ними.
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_04");	//Однако друг знать, что Ур-Шак никогда не хотеть этого. Всегда говорить братьям не убивать человек!
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_05");	//Но орки опять не слушать Ур-Шак! Поэтому Ур-Шак бояться, что снова заставить братья гневаться.
	AI_Output(other,self,"DIA_Urshak_MeetInCastle_01_06");	//Ладно! Я тебя не виню.
	MEETURSHAKALREADY = TRUE;
};


instance DIA_URSHAK_ORCSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcsavepeople_condition;
	information = dia_urshak_orcsavepeople_info;
	permanent = FALSE;
	description = "Почему орки не убили паладинов?";
};


func int dia_urshak_orcsavepeople_condition()
{
	if(Npc_KnowsInfo(hero,dia_urshak_meetincastle) && (MIS_ORсGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (KNOWABOUTGAROND == TRUE))
	{
		return TRUE;
	};
};

func void dia_urshak_orcsavepeople_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_01");	//Почему орки не убили всех паладинов?
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_02");	//Это друг говорить Ур-Шак спасибо. Ур-Шак спасать люди!
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_03");	//Он говорить братьям не трогать человек - говорить, что они могут быть полезный.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_04");	//Потому что быть не простой люди, быть паладин! Быть сильный воин.
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_05");	//Но почему они в этот раз тебя послушали?
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_06");	//Ур-Шак быть шаман и говорить с духами. Духи говорить Ур-Шак, что нельзя убивать эти люди.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_07");	//Он говорить об этом вождь. Тот слушать и решать, что Ур-Шак быть прав!
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_08");	//Мда...интересно! Не думал, что такое возможно.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_09");	//Друг не верить мне?...(удивленно) Почему?!
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_10");	//Нет, я тебе верю. И хочу сказать тебе огромное спасибо за твою помощь!
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_11");	//ХАТ ТАР!!!...(довольно) Ур-Шак говорить друг - пожалуйста.
	URSHAKTELLPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Теперь все ясно! Паладины обязаны жизнью моему другу Ур-Шаку. Будучи в статусе шамана, он смог повлиять на решение военачальников орков, чтобы те не стали убивать пленников. Иногда я крайне рад тому обстоятельству, что когда-то сам спас жизнь этому орку!");
	};
};


instance DIA_URSHAK_HELPSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_helpsavepeople_condition;
	information = dia_urshak_helpsavepeople_info;
	permanent = FALSE;
	description = "Ты можешь мне помочь освободить паладинов?";
};


func int dia_urshak_helpsavepeople_condition()
{
	if(Npc_KnowsInfo(hero,dia_urshak_meetincastle) && (MIS_ORсGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (KNOWABOUTGAROND == TRUE) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (BOGNARTALK == FALSE) && (MIS_STURMCASTLE == FALSE) && (ORCLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_helpsavepeople_info()
{
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_01");	//Ты можешь мне помочь освободить паладинов?
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_02");	//Хммм...(задумчиво) Ур-Шак бояться, что не знать - как он может это сделать.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_03");	//Если Ур-Шак говорить братьям отпускать люди, то они убивать Ур-Шак! Ур-Шак становиться мертвый.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_04");	//Ур-Шак не хотеть гневить братья, не хотеть становиться мертвый.
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_05");	//Я тебя понимаю! Ладно, значит придется самому об этом подумать.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_06");	//Однако друг не спешить...(задумчиво) Может быть Ур-Шак все-таки знать, как человек может освободить люди.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_07");	//Но человек должен делать все сам. Ур-Шак не помогать человек!
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_08");	//Так у тебя появилась идея? И какая же?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_09");	//Человек должен идти и говорить с Хаг-Тар! Думать, он может отпускать люди.
	if(Npc_KnowsInfo(other,dia_orc_8566_urhan_hello))
	{
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_10");	//Ах да! Я уже встречался с ним. И что мне ему сказать?!
	}
	else
	{
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_11");	//Кто такой Хаг-Тар?!
		AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_12");	//Быть главный воин здесь! Говорить всем братьям, что делать.
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_13");	//И что мне ему сказать?!
	};
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_14");	//То, что хотеть услышать Хаг-Тар! Ур-Шак думать, что знать это.
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_15");	//Может быть тогда мне расскажешь об этом?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_16");	//Хорошо! Ур-Шак когда-то слышать, как Хаг-Тар говорить о том - что всегда хотеть быть вождь братьев.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_17");	//Однако у братьев уже быть вождь - звать Ур-Тралл, быть великий воин!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_18");	//Поэтому Хаг-Тар злиться и хотеть его смерть. Если Ур-Тралл умереть - Хаг-Тар сам становиться вождь!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_19");	//Но Хаг-Тар всегда бояться сражаться с Ур-Тралл, поскольку он быть самый сильный воин - сильнее всех братьев, сильнее Хаг-Тар!
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_20");	//Так ты хочешь, чтобы я предложил Хаг-Тару убить вашего вождя?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_21");	//Быть так! Ур-Шак думать, что за это Хаг-Тар может освободить люди.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_22");	//Но человек решать сам! Ур-Шак только говорить друг, а друг думать.
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_23");	//Понятно. Ладно, я подумаю над этим!
	URSHAKTELLSSECRET = TRUE;

	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Ур-Шак рассказал мне одну очень интересную вещь. Хаг-Тар - главный военачальник в крепости, всегда хотел стать вождем орков. Но у тех уже есть вождь - Ур-Тралл и пока он жив, Хаг-Тару никогда не осуществить им задуманное. Думаю, что возможно Хаг-Тара заинтересует моя помощь в этом деле и впоследствии он согласиться отпустить пленных паладинов.");
	};
};

instance DIA_Urshak_OrcLanguage(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguage_condition;
	information = DIA_Urshak_OrcLanguage_info;
	permanent = FALSE;
	description = "Ты можешь научить меня языку орков?";
};

func int DIA_Urshak_OrcLanguage_condition()
{
	if((PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguage_info()
{
	AI_Output(other,self,"DIA_Urshak_OrcLanguage_01_01");	//Ты можешь научить меня языку орков?
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_02");	//Хммм...(с интересом) А зачем человек хотеть знать наш язык?
	AI_Output(other,self,"DIA_Urshak_OrcLanguage_01_03");	//Мне надо поговорить с одним орком, но я не понимаю, что он мне говорит!
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_04");	//Ур-Шак понимать человек...(одобрительно) Быть так! Он научить человека языку братов.
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_05");	//Если конечно у того хватить опыта.
};

instance DIA_Urshak_OrcLanguageTeach(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguageTeach_condition;
	information = DIA_Urshak_OrcLanguageTeach_info;
	permanent = TRUE;
	description = "Научи меня языку орков. (Очки обучения: 10)";
};

func int DIA_Urshak_OrcLanguageTeach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_OrcLanguage) && (PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguageTeach_info()
{
	AI_Output(other,self,"DIA_Urshak_OrcLanguageTeach_01_01");	//Научи меня языку орков.

	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_02");	//Хорошо...(серьезно) Тогда человек слушать и запоминать, что сказать ему Ур-Шак.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_07");	//Язык орков быть не похожий на язык друг человек. 
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_08");	//Он быть намного древней и красивее.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_09");	//В нем быть много короткий слово, мало длинный слово.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_10");	//Каждый слово означать что-то свое! Когда говорить много слово, то братам становиться понятна общая картина сказаного.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_04");	//Это все, что тебе следует знать о языке орков!
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_05");	//Теперь, ты сможешь читать наши письмена и понимать нашу речь.
		AI_Output(other,self,"DIA_Urshak_OrcLanguageTeach_01_06");	//Отлично!
		PlayerKnowsOrcLanguage = TRUE;
		AI_Print("Изучен язык орков...");
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language,"Теперь я знаю язык орков.");
	}
	else
	{
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_07");	//Для этого у тебя не хватать опыта, человек!
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_08");	//Приходи позже, когда его наберешься.
	};
};