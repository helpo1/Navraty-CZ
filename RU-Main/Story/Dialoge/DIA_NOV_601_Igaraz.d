
instance DIA_Igaranz_Kap1_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Hello(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaraz_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Что я могу сделать для тебя, брат?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Что я могу сделать для тебя?
	};
};


instance DIA_Igaraz_Wurst(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Wurst_Condition;
	information = DIA_Igaraz_Wurst_Info;
	permanent = FALSE;
	description = "Я занимаюсь распределением колбасы.";
};


func int DIA_Igaraz_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Я раздаю колбасу.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Ты работаешь на Горакса, да? Хорошо, тогда давай сюда эту колбасу.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Igaranz_NotWork(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 3;
	condition = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent = FALSE;
	description = "Почему ты не работаешь?";
};


func int DIA_Igaraz_NotWork_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Мне позволено изучать учения Инноса. Я постигаю его мудрость.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Однажды он выберет меня - и тогда я пройду испытание магией и войду в Круг Огня.
};


instance DIA_Igaranz_Choosen(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent = TRUE;
	description = "Кто такие Избранные?";
};


func int DIA_Igaraz_Choosen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Кто такие Избранные?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Это послушники, которым Иннос предписал пройти испытание магией.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Тот, кто проходит его, принимается в ряды Магов Огня.
	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen,"Что такое Испытание Магией?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen,"Как я могу стать Избранным?",DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Что такое Испытание Магией?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Это испытание, которому Высший Совет подвергает всех избранных послушников.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Это задание, при выполнении которого проверяются вера и сообразительность послушника.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Все избранные послушники принимают в нем участие - но только один из них может успешно выполнить его.
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Как я могу стать Избранным?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Ты не можешь влиять на это. Иннос самолично выбирает своих послушников, а Высший Совет объявляет его волю.
};


instance DIA_Igaranz_StudyInnos(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent = FALSE;
	description = "Как я могу начать изучать писания?";
};


func int DIA_Igaraz_StudyInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Parlan_Erlaubnis == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Как я могу начать изучать писания?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Ты должен получить доступ в библиотеку.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Однако мастер Парлан даст тебе ключ, только когда ты выполнишь все его задания.
};


instance DIA_Igaraz_IMTHEMAN(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_IMTHEMAN_Condition;
	information = DIA_Igaraz_IMTHEMAN_Info;
	important = TRUE;
};


func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//Это свершилось!...(гордо) Иннос выбрал меня я приму участие в испытании магией.
};


instance DIA_Igaraz_METOO(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 19;
	condition = DIA_Igaraz_METOO_Condition;
	information = DIA_Igaraz_METOO_Info;
	permanent = FALSE;
	description = "Я тоже!";
};


var int DIA_Igaraz_METOO_NOPERM;

func int DIA_Igaraz_METOO_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//Я тоже! Я потребовал прохождения Испытания Огнем.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//ЧТО ты потребовал? Ты либо любимчик Инноса, либо сумасшедший.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Мне уже удалось много безумных вещей, и, возможно, удастся и это тоже...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Иннос поддерживает меня - и я пройду это испытание!
	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO,Dialog_Back,DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO,"Может, нам лучше действовать вместе...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO,"И как, еще ничего не нашел?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO,"Ты не видел Агона или Ульфа?",DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//И как, еще ничего не нашел?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Так как у тебя все равно никаких шансов, я, пожалуй, скажу тебе:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Даже не пытайся искать около ферм - ты там ничего не найдешь.
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Может, нам лучше действовать вместе...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Забудь об этом. Я выполню это задание один. Ты мне будешь только обузой.
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Ты не видел Агона или Ульфа?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Мы разделились у таверны. Я пошел к фермам, а эти двое пошли вместе - но куда, я не знаю.
};


instance DIA_Igaraz_ADD(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 23;
	condition = DIA_Igaraz_ADD_Condition;
	information = DIA_Igaraz_ADD_Info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о 'живой скале'?";
};


func int DIA_Igaraz_ADD_Condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE) && (Npc_KnowsInfo(other,DIA_Igaraz_Stein) == FALSE) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Ты знаешь что-нибудь о 'живой скале'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//Нет!...(хихикает) Тебе дал задание Серпентес?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Да, а что?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Я, кажется, догадываюсь, что он имел в виду...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Ты будешь не первым, кто провалил это испытание...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Где мне найти эту живую скалу?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Просто иди по этой тропинке. Спустя некоторое время ты увидишь реку.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Продолжай идти по тропинке в горы. Она должна быть где-то там.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Если ты дойдешь до моста - значит, ты зашел слишком далеко.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//Хотя я сомневаюсь, что тебе вообще удастся уйти далеко.
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//Это все что я могу сказать тебе... (с сарказмом) Это ведь все же должно быть твое ИСПЫТАНИЕ!
};

instance DIA_Igaraz_Pruefung(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 22;
	condition = DIA_Igaraz_Pruefung_Condition;
	information = DIA_Igaraz_Pruefung_Info;
	description = "Выяснил что-нибудь новое?";
};

func int DIA_Igaraz_Pruefung_Condition()
{
	if((other.guild == GIL_NOV) && (MageFireChestOpen == FALSE) && (Npc_KnowsInfo(other,DIA_Igaraz_METOO) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Pruefung_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Выяснил что-нибудь новое?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Пока нет, но я продолжаю поиски.
	AI_StopProcessInfos(self);

	if(Igaraz_Wait == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};


instance DIA_Igaraz_Stein(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = DIA_Igaraz_Stein_Condition;
	information = DIA_Igaraz_Stein_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Igaraz_Stein_Condition()
{
	if((other.guild == GIL_NOV) && (Kapitel == 1) && (MageFireChestOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Эй, подожди! Нам нужно поговорить.
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Я так не думаю.
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Я ждал этого испытания много лет. Иннос поддерживает меня и я ДОЛЖЕН пройти его.

	if(Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//Где-то я уже это слышал.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Ты не первый, кто говорит это.
	};

	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Хватит болтать. Мне нужно то, что ты нашел. А тебе пришло время умереть!
	AI_TurnToNPC(self,other);
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_01");	//Эй, остынь, приятель! Не делай глупостей!
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_02");	//У меня нет выбора...(обезумев) Я должен пройти это испытание!
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_03");	//Послушай, убив меня, ты только навлечешь на себя гнев Инноса. Или ты думаешь, что твои 'подвиги' останутся безнаказанными?
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_05");	//Но я... я как-то об этом не подумал.
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_06");	//Пойми: Иннос сам выбирает того, кто достоин стать его избранным! И не тебе это решать...
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_07");	//Опусти оружие и отправляйся обратно в монастырь.
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_08");	//Да, ты прав...(растерянно) Я и сам не могу понять, что на меня нашло.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_09");	//И что же мне теперь делать?
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_10");	//Проводи как можно больше времени в молитвах! Только так ты сможешь заслужить благосклонность Инноса.
	AI_Output(other,self,"DIA_Igaraz_OneMoreChance_01_11");	//А если я стану магом Огня, то попробую тебе помочь.
	AI_Output(self,other,"DIA_Igaraz_OneMoreChance_01_12");	//(с надеждой) О, ты правда поможешь мне? Хорошо...(неуверенно) Я возвращаюсь в монастырь. Увидимся...
	MIS_Igaraz_OneMoreChance = LOG_Running;
	Log_CreateTopic(TOPIC_IGARANZ_NEW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_Running);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Послушник Игарац хотел убить меня, присвоив себе победу в испытании огнем. Я образумил его, пообещав позже похлопотать за него перед советом магов.");
	AI_StopProcessInfos(self);
};

instance DIA_Igaranz_TalkAboutBabo(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent = FALSE;
	description = "Нам нужно поговорить о Бабо.";
};

func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Нам нужно поговорить о Бабо.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//Да, в чем дело?
};


instance DIA_Igaranz_BabosBelongings(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent = FALSE;
	description = "У тебя есть кое-что принадлежащее Бабо.";
};

func int DIA_Igaraz_BabosBelongings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//У тебя есть кое-что принадлежащее Бабо.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//И что бы это могло быть?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Несколько листков бумаги. Бабо хотел бы получить их назад.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//Да? Надо же! Могу представить. Вынужден огорчить, я предпочел бы оставить их у себя. Похоже, тут налицо противоречие интересов.
};

instance DIA_Igaranz_WhereDocs(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent = FALSE;
	description = "Где эти бумаги?";
};


func int DIA_Igaraz_WhereDocs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Где эти бумаги?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//Ну, конечно же, я не держу их при себе. Боюсь, ничем не могу помочь.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Где они?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Я запер их в сундуке. А ключ от него тебе никогда не получить.
};


instance DIA_Igaranz_BabosJob(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent = FALSE;
	description = "Что Бабо должен делать для тебя?";
};


func int DIA_Igaraz_BabosJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Что Бабо должен делать для тебя?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Если бы я знал, что этот слизняк наложит в штаны из-за нескольких кустов болотной травы, я бы давно позаботился, чтобы кто-нибудь другой занял его место в монастырском саду.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//Он должен выращивать болотную траву?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Конечно. Так как она больше не поступает из-за Барьера, цена на травку в городе выросла втрое.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//Мы могли бы хорошо заработать на этом. Но Бабо отказывается сотрудничать.
};

var int IgaranzLowPrice;

instance DIA_Igaranz_Price(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent = FALSE;
	description = "Сколько ты хочешь за эти бумаги?";
};

func int DIA_Igaraz_Price_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Сколько ты хочешь за эти бумаги?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//Вообще-то говоря, они практически бесценны. Очень редко можно встретить что-нибудь подобное.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Но у меня нет желания рисковать своим будущим из-за нескольких золотых.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//Триста монет, и ты можешь делать с этими бумагами все, что захочешь.

	if(RhetorikSkillValue[1] >= 35)
	{
		AI_Output(other,self,"DIA_Igaranz_Price_13_04");	//Слишком большая цена за простые бумажки, тебе не кажется?!
		AI_Output(self,other,"DIA_Igaranz_Price_13_05");	//Ну, хорошо...(задумчиво) Я сбавлю цену до двухсот! Но это мое последнее предложение.
		IgaranzLowPrice = TRUE;
	};
};

instance DIA_Igaranz_BuyIt(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent = FALSE;
	description = "Я хочу купить эти бумаги.";
};

func int DIA_Igaraz_BuyIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_Price) && (MIS_BabosDocs != LOG_SUCCESS))
	{
		if((IgaranzLowPrice == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 200))
		{
			return TRUE;
		}
		else if(Npc_HasItems(other,ItMi_Gold) >= 300)
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Я хочу купить эти бумаги.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Послушай, я сейчас не могу отлучиться. Я дам тебе ключ от моего сундука. В нем все равно больше ничего нет.

	if(IgaranzLowPrice == TRUE)
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Gold,200);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,300);
	};
	
	B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
};


instance DIA_Igaranz_Perm(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь интересное для меня?";
};


func int DIA_Igaraz_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF) && (MIS_BabosDocs != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//У тебя есть что-нибудь интересное для меня?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Хмм... нет.
	AI_StopProcessInfos(self);
};


var int is_igaranz_condition;

instance DIA_Igaranz_OneMoreChance_News(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaranz_OneMoreChance_News_condition;
	information = DIA_Igaranz_OneMoreChance_News_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaranz_OneMoreChance_News_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Igaraz_OneMoreChance == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaranz_OneMoreChance_News_info()
{
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_01_01");	//Мое почтение! Вижу, что ты уже стал магом Огня.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_01_02");	//Да, как видишь. А ты хотел поинтересоваться насчет своей участи послушника? 
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_01_03");	//Да, уважаемый маг...(робко) Вы правы.
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News,"Пока не могу ничем порадовать.",DIA_Igaranz_OneMoreChance_News_yes);
	Info_AddChoice(DIA_Igaranz_OneMoreChance_News,"Я передумал помогать тебе.",DIA_Igaranz_OneMoreChance_News_no);
};

func void DIA_Igaranz_OneMoreChance_News_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_01");	//Пока не могу ничем порадовать.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_02");	//А между тем проводи больше времени в молитвах, практикуйся в магии...
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_yes_01_03");	//В общем, работай над собой - и все будет хорошо.
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_yes_01_04");	//Хорошо, мастер, я все понял.
	B_LogEntry(TOPIC_IGARANZ_NEW,"Игарац поинтересовался насчет своей участи послушника. Пусть пока ждет, до поры до времени...");
	Info_ClearChoices(DIA_Igaranz_OneMoreChance_News);
};

func void DIA_Igaranz_OneMoreChance_News_no()
{
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_01");	//Я передумал помогать тебе.
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_02");	//Неужели ты думаешь, что я стану просить за того, кто совсем недавно хотел лишить меня жизни?
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_no_01_03");	//ТЫ! ТЫ - ГРЯЗНАЯ СКОТИНА! Ты поплатишься за это, клянусь Инносом!
	AI_Output(other,self,"DIA_Igaranz_OneMoreChance_News_no_01_04");	//Не смей поднимать руку на мага Огня, послушник!
	AI_Output(self,other,"DIA_Igaranz_OneMoreChance_News_no_01_05");	//Не сметь поднимать руку?! (в бешенстве) Да я убью тебя!
	MIS_Igaraz_OneMoreChance = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_IGARANZ_NEW);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


var int igoranz_task;

instance DIA_Igaraz_New_OfferHelp(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_OfferHelp_condition;
	information = DIA_Igaraz_New_OfferHelp_info;
	permanent = FALSE;
	description = "Я поговорил с магами Огня насчет тебя.";
};


func int DIA_Igaraz_New_OfferHelp_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IS_TALAMON_IGORANZCONDITION == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_OfferHelp_info()
{
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_01");	//Я поговорил с магами Огня насчет тебя.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_02");	//Таламон приказал тебе найти и убить демона. А в качестве доказательства ты должен будешь принести его сердце.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_03");	//О, всемогущий Иннос! (в панике) Неужели мастер Таламон и вправду отправляет меня на бой с таким жутким чудищем?!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_01_04");	//Это единственный шанс для тебя, Игарац.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_05");	//Но мне никогда не убить это ужасное порождение Белиара! Я даже не знаю, где их искать, этих демонов!
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_01_06");	//Прошу тебя - помоги мне! Я готов сделать для тебя все что угодно!
	Info_ClearChoices(DIA_Igaraz_New_OfferHelp);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Извини, но я не могу тебе помочь.",DIA_Igaraz_New_OfferHelp_peace);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"За свою помощь я хочу очень много золота!",DIA_Igaraz_New_OfferHelp_gold);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Меня интересуют только магические предметы или рецепты.",DIA_Igaraz_New_OfferHelp_magic);
	Info_AddChoice(DIA_Igaraz_New_OfferHelp,"Разбирайся с этим сам.",DIA_Igaraz_New_OfferHelp_no);
};

func void DIA_Igaraz_New_OfferHelp_peace()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_peace_01_01");	//Извини, но я не могу тебе помочь.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_peace_01_02");	//Тебе придется делать все самому и, тем самым, доказать, что ты достоин стать истинным слугой Инноса.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_peace_01_03");	//Да, мастер...(смиренно) Хотя, скорее всего, на это у меня уйдет целая вечность, да и встреча с демоном может стать последним мгновением моей жизни.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_peace_01_04");	//Но я постараюсь справиться и не упущу свой шанс!
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я отказал в помощи Игарацу с его испытанием. Пусть докажет сам, что достоин стать магом Огня.");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_01");	//За свою помощь я хочу очень много золота!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_02");	//Охота на демонов - дело не из легких, и мне потребуется много золота, чтобы как следует экипироваться перед боем.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_03");	//Хорошо. Тогда я, пожалуй, пройдусь по своим должникам. Благо, в монастыре мне должна чуть ли не каждая мышь и даже сам мастер Горакс.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_04");	//Думаю, тысячи три-четыре я собрать в состоянии. Надеюсь, такое количество золота - это оправдывающая твой риск награда?
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_gold_01_05");	//Вполне. Я постараюсь достать для тебя сердце демона.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_gold_01_06");	//Буду ждать... и трясти с задолжавших мне обывателей золото, разумеется.
	IgaranzMakeHappyGold = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я пообещал Игарацу помочь с испытанием и достать для него сердце демона. За это он готов выложить кругленькую сумму! Ну и отлично, ведь деньги не пахнут...");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_magic()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_01");	//Меня интересуют только магические предметы или редкие алхимические рецепты. 
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_02");	//Пока ты будешь выполнять столь опасное задание, я подыщу для тебя нечто особенное.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_03");	//Стены этого монастыря хранят множество тайн, и я непременно что-то да найду здесь! По крайней мере, поиски в священном месте уж точно не потребуют от меня умертвить демона.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_04");	//Надеюсь, это будет действительно стоящая вещь, а не дешевый свиток с заклинанием.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_05");	//Будь уверен - ты не разочаруешься!
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_magic_01_06");	//Ладно, договорились. Я достану для тебя сердце демона.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_magic_01_07");	//Буду ждать... и искать, разумеется.
	IgaranzMakeHappyMagic = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я пообещал Игарацу помочь с испытанием и достать для него сердце демона. В награду, Игарац обещал достать для меня какой-нибудь редкий магический предмет или рецепт.");
	AI_StopProcessInfos(self);
};

func void DIA_Igaraz_New_OfferHelp_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_no_01_01");	//Разбирайся с этим сам.
	AI_Output(other,self,"DIA_Igaraz_New_OfferHelp_no_01_02");	//В конце концов, слово я сдержал - теперь сам выкручивайся.
	AI_Output(self,other,"DIA_Igaraz_New_OfferHelp_no_01_03");	//О, Иннос, что же мне делать?! Я никогда не пройду это испытание!
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я отказал в помощи Игарацу с его испытанием.");
	AI_StopProcessInfos(self);
};


instance DIA_Igaraz_New_MakeMage(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_New_MakeMage_condition;
	information = DIA_Igaraz_New_MakeMage_info;
	permanent = FALSE;
	description = "С этого момента можешь считать себя магом Огня!";
};

func int DIA_Igaraz_New_MakeMage_condition()
{
	if((MIS_Igaraz_OneMoreChance == LOG_Running) && (IgaranzMakeHappyOk == TRUE) && Npc_HasItems(hero,itar_kdf_m_new))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_New_MakeMage_info()
{
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_01");	//С этого момента можешь считать себя магом Огня!
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_02");	//Вот, возьми эту робу в качестве доказательств своих заслуг.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_03");	//Все остальные детали ты узнаешь у Парлана.
	Snd_Play("LEVELUP");
	B_GiveInvItems(other,self,itar_kdf_m_new,1);
	AI_EquipArmor(NOV_601_Igaraz,itar_kdf_m_new);
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_04");	//О, Иннос милостивый...(радостно) Наконец-то! Как долго я ждал этого момента!

	if(IgaranzMakeHappyGold == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_05");	//Отпразднуешь потом! Как насчет нашего уговора?
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_06");	//Конечно! Вот, возьми это золото. Я выжал все из должников.
		B_GiveInvItems(self,other,ItMi_Gold,5000);
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_07");	//Хммм... неплохо.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry(TOPIC_IGARANZ_NEW,"Я помог Игарацу, а он вручил мне пять тысяч золотых. Отлично! Я рассчитывал на куда меньший гонорар.");
	}
	else if(IgaranzMakeHappyMagic == TRUE)
	{
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_05");	//Отпразднуешь потом! Как насчет нашего уговора?
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_08");	//Конечно! Я много чего нашел и могу даже предоставить тебе выбор: магическая руна, свиток с рецептом или магический эликсир.
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_09");	//Что ты предпочитаешь?
		Info_ClearChoices(DIA_Igaraz_New_MakeMage);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Я возьму магическую руну.",DIA_Igaraz_New_MakeMage_Rune);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Я возьму алхимический рецепт.",DIA_Igaraz_New_MakeMage_Rezept);
		Info_AddChoice(DIA_Igaraz_New_MakeMage,"Я возьму магический эликсир.",DIA_Igaraz_New_MakeMage_UnknownBook);
	}
	else
	{
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_10");	//Да, и еще. У меня есть на продажу некоторые товары. 
		AI_Output(self,other,"DIA_Igaraz_New_MakeMage_01_11");	//Взгляни как-нибудь, если будет интересно.
		AI_Output(other,self,"DIA_Igaraz_New_MakeMage_01_12");	//Если не забуду.
		MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
		B_LogEntry(TOPIC_IGARANZ_NEW,"Я помог Игарацу. За это он сможет продать мне свои товары.");
		IG_TRADE_COND = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Trade");
	};
};

func void DIA_Igaraz_New_MakeMage_Rune()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_01");	//Я возьму магическую руну.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_02");	//Хорошо! Вот твоя руна.
	B_GiveInvItems(self,other,ItRu_Sleep,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_03");	//Ну что же, награда действительно стоила того, чтобы тебе помочь.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_04");	//Я рад, что смог угодить тебе! 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_05");	//Да, и еще. У меня есть на продажу некоторые товары.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rune_01_06");	//Взгляни как-нибудь, если будет интересно.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rune_01_07");	//Если не забуду.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я помог Игарацу, и за это он дал мне в качестве награды магическую руну.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_Rezept()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_01");	//Я возьму алхимический рецепт.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_02");	//Хорошо! Вот, возьми этот свиток.
	B_GiveInvItems(self,other,ITWR_MAGICDEFENCE_02,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_03");	//Ну что же, награда действительно стоила того, чтобы тебе помочь.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_04");	//Я рад, что смог угодить тебе!
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_05");	//Да, и еще. У меня есть на продажу некоторые товары. 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_Rezept_01_06");	//Взгляни как-нибудь, если будет интересно.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_Rezept_01_07");	//Если не забуду.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я помог Игарацу, и за это он дал мне в качестве награды алхимический рецепт.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

func void DIA_Igaraz_New_MakeMage_UnknownBook()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_01");	//Я возьму магический эликсир.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_02");	//Хорошо! Вот, держи его.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_03");	//Ну что же, неплохо.
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_04");	//Удачи! Да, и еще. У меня есть на продажу некоторые товары. 
	AI_Output(self,other,"DIA_Igaraz_New_MakeMage_UnknownBook_01_05");	//Взгляни как-нибудь, если будет интересно.
	AI_Output(other,self,"DIA_Igaraz_New_MakeMage_UnknownBook_01_06");	//Если не забуду.
	MIS_Igaraz_OneMoreChance = LOG_SUCCESS;
	IG_TRADE_COND = TRUE;
	Log_SetTopicStatus(TOPIC_IGARANZ_NEW,LOG_SUCCESS);
	B_LogEntry(TOPIC_IGARANZ_NEW,"Я помог Игарацу, и за это он дал мне в качестве награды магический эликсир.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Trade");
};

instance DIA_IGARAZ_TRADE(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = dia_igaraz_trade_condition;
	information = dia_igaraz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои товары.";
};

func int dia_igaraz_trade_condition()
{
	if(IG_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_igaraz_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Igaraz_TRADE_01_01");	//Покажи свои товары.

	if(Npc_HasItems(self,ItKe_IgarazChest_Mis) > 0)
	{
		Npc_RemoveInvItems(self,ItKe_IgarazChest_Mis,Npc_HasItems(self,ItKe_IgarazChest_Mis));
	};

	B_GiveTradeInv(self);
};