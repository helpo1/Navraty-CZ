
instance DIA_STRF_8121_Addon_Krow_EXIT(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 999;
	condition = DIA_STRF_8121_Addon_Krow_exit_condition;
	information = DIA_STRF_8121_Addon_Krow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8121_Addon_Krow_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8121_Addon_Krow_PreHello(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_PreHello_condition;
	information = DIA_STRF_8121_Addon_Krow_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8121_Addon_Krow_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_00");	//(спокойно) А, новое лицо в шахте.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_01");	//Нечасто тут у нас бывают гости. Ты тут по своей воле или как, странник?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_02");	//Да, по своей.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_03");	//Тогда странно, что орки впустили тебя сюда.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_04");	//Обычно в шахту попадают только в цепях с ошейником для рабов.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_05");	//По всей видимости, ты ведешь с ними какие-то дела, не иначе.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_06");	//Скажем так, у меня с ними есть некоторые общие интересы.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_07");	//Ну, в конце концов, это не мое дело. Я тут просто обычный раб.
};

instance DIA_STRF_8121_Addon_Krow_HELLO(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_hello_condition;
	information = DIA_STRF_8121_Addon_Krow_hello_info;
	permanent = FALSE;
	description = "Как ты сюда попал?";
};

func int DIA_STRF_8121_Addon_Krow_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_00");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_01");	//Видимо, я чем-то прогневал Инноса, раз оказался здесь.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_02");	//А кем ты был раньше?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_03");	//Я был магом и служил под началом рудных баронов.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_04");	//Ты разбираешься в магии?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_05");	//Немного. Конечно, я не настолько хорош в искусстве магии, как, скажем... маги Огня.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_06");	//Но кое-что все-таки умею. Точнее, умел, пока не попал в лапы орков.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_07");	//К сожалению, за долгие годы, проведенные в шахте, я уже успел многое позабыть.
};

instance DIA_STRF_8121_Addon_Krow_Help(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Help_condition;
	information = DIA_STRF_8121_Addon_Krow_Help_info;
	permanent = FALSE;
	description = "У тебя все в порядке?";
};

func int DIA_STRF_8121_Addon_Krow_Help_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_00");	//У тебя все в порядке?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_01");	//Более или менее. Но я бы чувствовал себя лучше, если при мне был бы мой дневник.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_02");	//Дневник?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_03");	//Туда я записывал свои наблюдения, мысли и прочее.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_04");	//Но когда орки поймали меня, то вместе со всеми вещами они забрали и его.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_05");	//Эта вещь была очень дорога мне. Можно сказать, что это был труд всей моей жизни!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_06");	//И ты понятия не имеешь, где он сейчас?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_07");	//Скорее всего, он до сих пор у орков. Но, думаю, они не отдадут его просто так.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_08");	//А где ты видел свой дневник в последний раз?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_09");	//У того орка, что обыскивал меня. Кажется, его звали Кор Шак.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_10");	//Уже что-то. Ладно, если представится случай, я верну твой дневник.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_11");	//Благодарю тебя, странник.
	MIS_KrowBook = LOG_Running;
	Log_CreateTopic(TOPIC_KrowBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Running);
	B_LogEntry(TOPIC_KrowBook,"Орки отобрали у Кроу его дневник, которым он очень дорожил. В последний раз Кроу видел его в руках орка по имени Кор Шак.");
};

instance DIA_STRF_8121_Addon_Krow_Book(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Book_condition;
	information = DIA_STRF_8121_Addon_Krow_Book_info;
	permanent = FALSE;
	description = "Это твой дневник?";
};

func int DIA_STRF_8121_Addon_Krow_Book_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_HasItems(other,ItWr_KrowBook) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Book_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_00");	//Это твой дневник?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_01");	//Да, это он! Как тебе удалось его достать?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_02");	//Это не столь важно.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_03");	//Просто возьми и спрячь подальше, чтобы орки вновь не отняли его у тебя.
	B_GiveInvItems(other,self,ItWr_KrowBook,1);
	Npc_RemoveInvItems(self,ItWr_KrowBook,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_04");	//Я так и сделаю. Благодарю тебя!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_05");	//Не стоит.
	RT_Respect = RT_Respect + 1;
	MIS_KrowBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Success);
	B_LogEntry(TOPIC_KrowBook,"Я вернул Кроу его дневник. Тот был на седьмом небе от счастья.");
};

instance DIA_STRF_8121_Addon_Krow_Paladin(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Paladin_condition;
	information = DIA_STRF_8121_Addon_Krow_Paladin_info;
	permanent = FALSE;
	description = "У меня к тебе есть один вопрос.";
};

func int DIA_STRF_8121_Addon_Krow_Paladin_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (AskKrow == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Paladin_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_00");	//У меня к тебе есть один вопрос.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_01");	//Хорошо! Я отвечу на него, если смогу.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_02");	//Дело в том, что я ищу тут одного паладина.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_03");	//(шепотом) Тише, тише, друг мой. Не так громко. Нас могут услышать.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_04");	//Здесь крайне опасно обсуждать подобные темы. А орки ошибок не прощают.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_05");	//И все же. Ты что-нибудь знаешь об этом?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_06");	//Хммм...(пристально вглядываясь) На мой взгляд, ты действуешь слишком прямолинейно. 
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_07");	//Неужели ты полагаешь, что я стану обсуждать подобные вопросы с тем, кому пока не особо доверяю?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_08");	//Ведь ты якшаешься с орками! А это, друг мой, крайне отрицательно сказывается на твоей репутации среди рабов.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_09");	//А мы не можем так рисковать, ибо это может быть наша последняя надежда выбраться отсюда живыми.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_10");	//Так что давай лучше вернемся к этому разговору тогда, когда положение дел немного изменится.
	MIS_TrustMe = LOG_Running;
	Log_CreateTopic(TOPIC_TrustMe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrustMe,LOG_Running);
	B_LogEntry(TOPIC_TrustMe,"Мне нужно завоевать доверие рудокопов, если я хочу узнать больше о пропавшем паладине. Мне надо как-то попробовать помочь этим людям с их проблемами...");
};

instance DIA_STRF_8121_Addon_Krow_Respect(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Respect_condition;
	information = DIA_STRF_8121_Addon_Krow_Respect_info;
	permanent = TRUE;
	description = "Что здесь говорят про меня?";
};

func int DIA_STRF_8121_Addon_Krow_Respect_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_TrustMe != LOG_Success) && (Npc_KnowsInfo(hero,DIA_STRF_8121_Addon_Krow_Paladin) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Respect_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_00");	//Что здесь говорят про меня?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_01");	//Хммм...(задумчиво)

	if(RT_Respect >= 8)
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_02");	//Похоже, что ты смог тут завоевать всеобщее доверие, странник.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_03");	//А значит, пришло время встретиться тебе с тем, кого ты так искал.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_04");	//Однако у нас есть одна небольшая проблема.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_05");	//Что еще за проблема?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_06");	//Тут кругом полно охраны. Поэтому нам надо найти такое место, где орки нас точно не услышат.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_07");	//А есть мысли на этот счет?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_08");	//Хммм...(задумчиво) В той пещере, где работает Нутс, обычно находится всего лишь один охранник.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_09");	//Вот если бы ты как-нибудь смог отвлечь его, это дало бы нам время поговорить с паладином.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_10");	//Ладно, я попытаюсь увести его оттуда.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_11");	//Хорошо! Тогда я буду ждать твоего сигнала.
		MIS_TrustMe = LOG_Success;
		Log_SetTopicStatus(TOPIC_TrustMe,LOG_Success);
		B_LogEntry(TOPIC_TrustMe,"Я завоевал доверие рудокопов.");
		MIS_RemoveOrc = LOG_Running;
		Log_CreateTopic(TOPIC_RemoveOrc,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Running);
		B_LogEntry_Quiet(TOPIC_RemoveOrc,"Мне нужно отвлечь внимание охранника орков в пещере, где работает рудокоп Нутс. Тогда я смогу встретиться с паладином с глазу на глаз.");
	}
	else if(RT_Respect >= 6)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_12");	//Ты уже близок к своей цели!
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_13");	//Многие из нас уже прониклись доверием к тебе.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_14");	//Осталось лишь сделать пару шагов.
	}
	else if(RT_Respect >= 3)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_15");	//Люди начинают потихоньку доверять тебе.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_16");	//Однако тебе предстоит сделать еще больше.
	}
	else if(RT_Respect >= 0)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_17");	//Ты уже помог некоторым из нас.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_18");	//Но этого мало. Тебе нужно как-то больше проявиться себя.
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_19");	//Боюсь, мой друг, пока что ничего.
	};
};


instance DIA_STRF_8121_Addon_Krow_RemoveOrc(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_RemoveOrc_condition;
	information = DIA_STRF_8121_Addon_Krow_RemoveOrc_info;
	permanent = FALSE;
	description = "Я избавился от охранника.";
};

func int DIA_STRF_8121_Addon_Krow_RemoveOrc_condition()
{
	if((MIS_RemoveOrc == LOG_Running) && (RemoveOrcDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_RemoveOrc_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_00");	//Я избавился от охранника.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_01");	//(шепотом) Хорошо. Об остальном я позабочусь сам.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_02");	//А ты ступай обратно в пещеру и жди.
	MIS_RemoveOrc = LOG_Success;
	Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Success);
	B_LogEntry(TOPIC_RemoveOrc,"Я сообщил Кроу, что пещера сейчас пуста. Теперь он позаботится о том, чтобы наша встреча состоялась.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Meet");
	AI_Teleport(STRF_8120_Addon_Gars,"OM_LEVEL_02_BELIAR_04");
};

instance DIA_STRF_8121_Addon_Krow_Teleport(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_info;
	permanent = FALSE;
	description = "Я слышал, что ты интересовался старой табличкой Нутса.";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_condition()
{
	if((Npc_HasItems(other,ItWr_OldTextMine) >= 1) && (MIS_MineTeleport == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_00");	//Я слышал, что ты интересовался старой табличкой Нутса.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_01");	//Да, это так. Но, к сожалению, он никому ее не отдает.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_02");	//А мне вот отдал. Вот она!
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_03");	//На него это не похоже. Надеюсь, это произошло по доброй воле?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_04");	//Само собой. Лучше ответь, что тебя в ней так заинтересовало?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_05");	//Ну, как...(почесывая затылок) Тут довольно редко можно встретить подобные вещи.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_06");	//К тому же мне было просто интересно, что же в ней написано. 
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_07");	//Вот, можешь взглянуть на нее, если хочешь. Нутс так ее и не смог прочитать.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_08");	//Что же, давай посмотрим...
	B_GiveInvItems(other,self,ItWr_OldTextMine,1);
	Npc_RemoveInvItems(self,ItWr_OldTextMine,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_09");	//Хммм, по всей видимости, она написана на старомиртанском наречье.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_10");	//В здешних краях на нем уже давно никто не разговаривает.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_11");	//А ты его знаешь?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_12");	//Немного...(задумчиво) Однако мне понадобится мой старый дневник.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_13");	//В нем у меня были записи, объясняющие некоторые обороты и связки этого языка.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_14");	//Тогда загляни в него.

	if(MIS_KrowBook == LOG_Success)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_15");	//Конечно. Одну минутку...(читая) Так, посмотрим.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_16");	//Хммм...(задумчиво) Очень интересно!
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_17");	//Ну, выкладывай же, не тяни.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_18");	//Если верить этим записям, в этой шахте когда-то существовал некий магический портал!
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_19");	//Не очень понятно - кто именно им пользовался, но с его помощью можно было переместиться из одной части острова в другую.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_20");	//Действительно интересно. И где же он мог бы находится?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_21");	//Об этом здесь не написано. Но насколько я могу судить, на верхних уровнях шахты таких мест точно нет.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_22");	//Ты в этом уверен?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_23");	//Абсолютно. Нет ничего такого, чтобы как-то отдаленно напоминало портал.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_24");	//Да и орки им наверняка заинтересовались бы, если нашли.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_25");	//Тогда где же он?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_26");	//Возможно, глубоко внизу. А там, кто его знает!
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_27");	//Ладно, я тебя понял. Больше там ничего не написано?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_28");	//Нет, больше ничего.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_29");	//Тогда можешь пока оставить эту табличку себе. Вдруг выяснится что-нибудь еще.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_30");	//Благодарю.
		MIS_MineTeleport = LOG_Running;
		Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Кроу перевел табличку Нутса. Выяснилось, что где-то в шахте раньше находился магический портал, позволявший перемещаться из одной части острова в другую. Кроу считает, что искать его надо на нижнем уровне шахты.");
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_31");	//К сожалению, его отобрали у меня орки! В тот день, когда я попал сюда.

		if(MIS_KrowBook == LOG_Running)
		{
			AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_32");	//Но, помнится, что я тебе уже рассказывал об этом.
			AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_33");	//Да, рассказывал. Просто как-то вылетело из головы.
		};

		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_34");	//Но, как бы то ни было, без него я ничего не могу сделать.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_35");	//Понимаю.
	};
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Again(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Again_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Again_info;
	permanent = FALSE;
	description = "Теперь у тебя есть дневник.";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Again_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8121_Addon_Krow_Teleport) == TRUE) && (MIS_MineTeleport == FALSE) && (MIS_KrowBook == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Again_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_00");	//Теперь у тебя есть дневник. Можешь попробовать прочитать ту табличку?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_01");	//Конечно! Одну минутку...(читая) Так, посмотрим.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_02");	//Хммм...(задумчиво) Очень интересно!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_03");	//Ну, выкладывай же, не тяни.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_04");	//Если верить этим записям, в этой шахте когда-то существовал некий магический портал!
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_05");	//Не очень понятно - кто именно им пользовался, но с его помощью можно было переместиться из одной части острова в другую.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_06");	//Действительно интересно. И где же он мог бы находится?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_07");	//Об этом здесь не написано. Но насколько я могу судить, на верхних уровнях шахты таких мест точно нет.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_08");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_09");	//Абсолютно. Нет ничего такого, чтобы как-то отдаленно напоминало портал.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_10");	//Да и орки им наверняка заинтересовались бы, если нашли!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_11");	//Тогда где же он?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_12");	//Возможно, глубоко внизу. А там, кто его знает!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_13");	//Ладно, я тебя понял. Больше там ничего не написано?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_14");	//Нет, больше ничего.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_15");	//Тогда можешь пока оставить эту табличку себе. Вдруг выяснится что-нибудь еще.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_16");	//Благодарю.
	MIS_MineTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Кроу перевел табличку Нутса. Выяснилось, что где-то в шахте раньше находился магический портал, позволявший перемещаться из одной части острова в другую. Кроу считает, что искать его надо на нижнем уровне шахты.");
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Focus(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Focus_info;
	permanent = FALSE;
	description = "Можешь взглянуть на этот камень?";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (SendPortalKrow == TRUE) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Focus_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_00");	//Можешь взглянуть на этот камень?
	B_GiveInvItems(other,self,ItMi_PortalCrystal,1);
	Npc_RemoveInvItems(self,ItMi_PortalCrystal,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_01");	//Хммм...(с интересом) Да, давно я не держал в руках подобных вещей.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_02");	//Венцель сказал, что он немного напоминает магический юнитор.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_03");	//Так это он и есть! Только довольно необычного вида... Интересно, где ты его взял?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_04");	//Скажем так, я нашел его на нижнем уровне шахты.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_05");	//Выходит, что тебе удалось обнаружить и портал. Не так ли?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_06");	//Все верно.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_07");	//Об этом нетрудно было догадаться, поскольку только с помощью таких юниторов можно заставить портал работать.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_08");	//Однако, судя по всему, этот юнитор был изготовлен на материке. Скорее всего, в Венгарде...
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_09");	//С чего это ты взял?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_10");	//Видишь? На нем стоит клеймо королевского ордена магов Огня. Такие вещи трудно с чем-либо перепутать!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_11");	//Хочешь сказать, что портал ведет на материк?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_12");	//Вполне возможно. Меня смущает только одно - каким образом он попал в орочью шахту?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_13");	//Боюсь, что на этот вопрос не ответят даже сами орки.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_14");	//Ну, мы у них и не будем это спрашивать...(посмеиваясь) Не правда ли?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_15");	//Само собой. А ты сможешь с его помощью активировать тот портал?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_16");	//Конечно! Я же все-таки маг...(гордо) Но сейчас этого лучше не делать.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_17");	//Если орки пронюхают о том, что за штука - они либо его сломают, либо начнут тщательно охранять.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_18");	//В любом случае к нему уже не будет возможности подступиться.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_19");	//Поэтому пока лучше все это держать в тайне.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_20");	//Ведь для нас тот портал теперь реальный шанс наконец-то выбраться отсюда.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_21");	//Ступай поговори с Венцелем! Он подскажет, как нам следует поступить дальше.
	MIS_MineTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Success);
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Камень, который я обнаружил на нижнем уровне шахты, оказался магическим юнитором. Именно с его помощью можно активировать магический портал. По словам Кроу, сам юнитор был сделан мастерами Венгарда - столицы Миртаны, и есть вероятность, что портал ведет на материк.");
};