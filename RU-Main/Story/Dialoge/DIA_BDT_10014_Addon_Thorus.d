
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 999;
	condition = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10014_Thorus_Hi(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 2;
	condition = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Hi_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Ты знаешь правила. Никто не может попасть в шахту, если у него нет красной каменной плитки.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Дело не в шахте - мне нужно увидеть Ворона.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//Это ничего не меняет. Правила есть правила, они относятся ко всем. И даже к тебе.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Возвращайся. Если ты попытаешься пробраться на верхний этаж без разрешения, стража убьет тебя. Таковы правила.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Если тебе это не нравится, можешь поговорить с Эстебаном. Он ответственный за лагерь.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BDT_10014_Thorus_Raven(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 3;
	condition = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent = FALSE;
	description = "Это очень важно, мне нужно попасть к Ворону...";
};


func int DIA_Addon_Thorus_Raven_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Это очень важно, мне нужно попасть к Ворону...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Правда? Ты действительно думаешь, что сможешь пройти к нему?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Его охранники твердо выполняют приказ не пускать НИКОГО. Ты умрешь даже раньше, чем сможешь его увидеть.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Так что лучше выкинь эту идею из своей головы.
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Ворон - предводитель бандитов. Чтобы добраться до него, мне придется убить тех, кто встанет у меня на пути.");
};


instance DIA_Addon_BDT_10014_Thorus_Zeit(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent = FALSE;
	description = "Ты не помнишь меня? Я из Старого Лагеря...";
};


func int DIA_Addon_Thorus_Zeit_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Ты не помнишь меня? Я из Старого Лагеря...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Ты был одним из заключенных?! Возможно, ты был одним из моих стражников. И... это делает нас теперь друзьями?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Нет, не делает.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Может быть, ты тот, кто уничтожил Барьер, а может - тот, кто убил моих приятелей.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//И что?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Эти времена прошли.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Ты хочешь войти? Тогда достань себе красный камень и больше не трать мое время.
	};
};


var int Thorus_GoodOldPerm;

instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent = TRUE;
	description = "Ну ладно тебе, впусти меня. Во имя старых добрых времен.";
};


func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if((MIS_Send_Buddler != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_BDT_10014_Thorus_Zeit) && (RavenAway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//Ну ладно тебе, впусти меня. Во имя старых добрых времен.
	if(Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Давай-ка я объясню тебе кое-что. Ты знаешь, почему я до сих пор жив?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Потому что я всегда был верен своим людям.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Я согласен не со всем, что делает Ворон. Но я всегда выполняю правила.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//И ты тоже будешь это делать!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(твердо) Нет!
	};
};

func int C_PlayerHasWrongToken()
{
	if((C_ScHasMagicStonePlate() == TRUE) || (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_02) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_03) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_04) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_05) >= 1))
	{
		return TRUE;
	};
};


instance DIA_Addon_BDT_10014_Thorus_Stein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent = TRUE;
	description = "Вот, у меня есть каменная плитка...";
};


func int DIA_Addon_Thorus_Stein_Condition()
{
	if((C_PlayerHasWrongToken() == TRUE) && (RavenAway == FALSE) && (MIS_Send_Buddler != LOG_Running) && (MIS_Send_Buddler != LOG_SUCCESS) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Вот, у меня есть каменная плитка...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Это неправильный камень. Только красные камни являются пропуском.
};


instance DIA_Addon_BDT_10014_Thorus_Rein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent = FALSE;
	description = "Вот, у меня есть красная каменная табличка...";
};


func int DIA_Addon_Thorus_Rein_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Вот, у меня есть красная каменная табличка...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Хорошо.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Ты убил Эстебана - так что ТЫ теперь будешь делать его работу.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//У них возникли проблемы с ползунами в шахте.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Три работника уже погибли. Твоя задача - найти им замену.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//И когда я, наконец, смогу попасть в эту чертову шахту?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Делай свою работу - а после можешь заниматься, чем хочешь.
	MIS_Send_Buddler = LOG_Running;
	Log_CreateTopic(Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler,LOG_Running);
	B_LogEntry(Topic_Addon_Buddler,"Я занял место Эстебана, и теперь мне нужно послать в шахту трех шахтеров.");
};


instance DIA_Addon_BDT_10014_Thorus_Sent(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent = FALSE;
	description = "Я послал трех новых ребят.";
};


func int DIA_Addon_Thorus_Sent_Condition()
{
	if((Player_SentBuddler >= 3) && (RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Я послал трех новых ребят.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Хорошо. Тогда у меня нет повода тебя не пускать.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_BDT_10014_Thorus_Armor(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent = FALSE;
	description = "Эй, а что на тебе за доспехи? Где я могу достать такие же?";
};


func int DIA_Addon_Thorus_Armor_Condition()
{
	if((RavenAway == FALSE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Эй, а что на тебе за доспехи? Где я могу достать такие же?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Нигде. Эти доспехи сделаны специально для охранников Ворона.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Полагаю, что нет никакого вступительного экзамена для новых людей. Но окончательное решение принимаю не я, а Ворон.
	THORUSACCEPTMEGUARD = LOG_Running;
	Log_CreateTopic(TOPIC_THORUSGUARD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_Running);
	B_LogEntry(TOPIC_THORUSGUARD,"Торус сказал, что я должен стать гвардейцем Ворона, чтобы заполучить такие же доспехи, как и у него. Вот только Ворон вряд ли будет рад моей кандидатуре на это место.");
};


instance DIA_Addon_Thorus_Gefangene(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 88;
	condition = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent = FALSE;
	description = "Как там заключенные?";
};


func int DIA_Addon_Thorus_Gefangene_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Gefangene_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//Как там заключенные?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Они сделали свою работу! Насколько мне известно, они должны сейчас искать золото.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//А что, если они убегут?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//Бладвин пошлет стражников за ними. Но я сильно сомневаюсь, что они настолько глупы, чтобы бежать.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Если только...(задумчиво)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Если только - что?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//...кто-нибудь не подобьет их на это! Но я не знаю никого, кто был бы достаточно глуп для этого. По крайней мере, пока Бладвин здесь!
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Thorus_Speech(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Speech_Condition()
{
	if(Npc_IsDead(Bloodwyn) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Что ты затеваешь?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Что???
	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Теперь ты убрал с дороги и Бладвина. Я уже задаюсь вопросом, кто будет следующим. Ворон? Или, может быть, я?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Ты боишься?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Драки я не боюсь. Но я боюсь того, к чему могут привести твои действия.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Этот лагерь - все, что у нас осталось.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Может быть, он не всегда работал идеально, но он работает.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//Но с каждым человеком, которого ты убиваешь, исчезает кусочек нашего общества.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Мы - бандиты. Головорезы, преступники, изгнанники.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Куда бы мы ни пошли, нас выследят, поймают и убьют.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Для нас нет лучшего места, чем это, и нет лучшего времени, чем сейчас.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Куда ты клонишь?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Этим людям нужен лидер. Кто способен им стать? Может быть, ты? Ты, человек, который никогда долго не остается на одном месте?
};


instance DIA_Addon_Thorus_Answer(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent = FALSE;
	description = "Тогда почему бы тебе не стать старшим в лагере?";
};


func int DIA_Addon_Thorus_Answer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Speech) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Тогда почему бы тебе не стать старшим в лагере?
	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Допустим, а что с Вороном?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//У Ворона скоро будут другие заботы. Я позабочусь об этом.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//Ах, да... И позаботься о том, чтобы заключенные покинули лагерь спокойно.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Хорошо, я разберусь с охраной.
	B_LogEntry(TOPIC_Addon_Sklaven,"Бладвин мертв и Торус позаботится о том, чтобы рабы смогли покинуть лагерь.");

	if(!Npc_IsDead(PrisonGuard))
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Теперь надо еще раз поговорить с охранником рабов. После чего Патрик и его ребята смогут бесприпятственно покинуть это место.");
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Sklaven,"Рабов больше никто не охраняет! Теперь Патрик и его ребята смогут бесприпятственно покинуть это место.");
	};
};


instance DIA_Addon_Thorus_Raventot(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent = FALSE;
	description = "Ворон исчез!";
};


func int DIA_Addon_Thorus_Raventot_Condition()
{
	if((RavenAway == TRUE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_98");	//Ворон исчез!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_99");	//(удивленно) Что ты хочешь этим сказать? Хотя Белиар с ним! Без него всем нам будет лучше.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Теперь ты пойдешь дальше?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_97");	//Ты ведь меня знаешь.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(смеется) Да, ты постоянно куда-то движешься. Счастливого тебе пути!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Кто знает, может наши пути еще пересекутся.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Кто знает! У тебя на пути будет много ворот и много переходов. И на одном из них ты можешь встретить меня.
	THORUSACCEPTME = TRUE;
};

instance DIA_ADDON_THORUS_PICKPOCKET(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 900;
	condition = dia_addon_thorus_pickpocket_condition;
	information = dia_addon_thorus_pickpocket_info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int dia_addon_thorus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Addon_Thorus) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_pickpocket_info()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
	Info_AddChoice(dia_addon_thorus_pickpocket,Dialog_Back,dia_addon_thorus_pickpocket_back);
	Info_AddChoice(dia_addon_thorus_pickpocket,DIALOG_PICKPOCKET,dia_addon_thorus_pickpocket_doit);
};

func void dia_addon_thorus_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		B_GiveInvItems(self,other,ITKE_Addon_Thorus,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(dia_addon_thorus_pickpocket);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void dia_addon_thorus_pickpocket_back()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
};


instance DIA_ADDON_THORUS_ORCINVASION(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_orcinvasion_condition;
	information = dia_addon_thorus_orcinvasion_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_orcinvasion_condition()
{
	if((RavenAway == TRUE) && (THORUS_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_thorus_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_orcinvasion_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_00");	//(удивленно) Опять ты! Иногда мне кажется, нет такого места, где тебя нельзя было бы встретить.
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_02");	//Торус, что ты здесь делаешь?! Я думал, орки всех перебили в лагере.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_03");	//Мне и еще нескольким парням из лагеря все-таки удалось выбраться живыми из той переделки.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_05");	//Торус, что ты здесь делаешь?!
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_06");	//А ты что, не знаешь? Наш лагерь атаковали орки.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_07");	//Эти зеленокожие твари напали на нас так неожиданно, что у нас даже не было времени подготовиться к обороне!
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_08");	//Но мне и еще нескольким парням из лагеря все-таки удалось выбраться живыми из той переделки.
	};
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_10");	//Если бы не один парнишка по имени Том, нам бы всем настал конец. Но он знал тайную тропу, ведущую из лагеря - ей то мы и ушли оттуда.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_11");	//До сих пор не понимаю, как нам это удалось!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_13");	//А где все остальные?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_14");	//Там в пещере, что позади меня. Там все, что осталось от нашего лагеря...(с грустью)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_15");	//Понятно. И что теперь собираетесь делать?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_16");	//Теперь уж даже не знаю. Одно точно могу сказать: все парни, так же как и я, думаем побыстрее свалить отсюда.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_17");	//Рано или поздно орки доберутся и сюда. И тогда точно нас уже никто не спасет.
	if(AWORCINVASIONSTOP == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_18");	//Орки уже не опасны! Их лидеры мертвы, и, скорее всего, они скоро покинут долину.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_19");	//Это хорошая новость. Но в лагерь все равно уже бессмысленно возвращаться. Нас слишком мало, да и не факт, что вторжение не повторится вновь.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_21");	//Все возможно.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_22");	//И что теперь собираетесь делать?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_23");	//Не знаю. Думаю поговорить с пиратами. Я слышал, иногда они плавают на другую часть острова.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_24");	//А насколько я помню, золото они все еще любят. Может, они и согласятся отвезти нас туда.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORUS_RAVENGUARD(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_ravenguard_condition;
	information = dia_addon_thorus_ravenguard_info;
	permanent = FALSE;
	description = "Еще одно дело...";
};


func int dia_addon_thorus_ravenguard_condition()
{
	if((RavenAway == TRUE) && (THORUSACCEPTME == TRUE) && (THORUS_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_ravenguard_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_02");	//Теперь, когда Ворон исчез, как насчет того, чтобы принять меня в СВОЮ гвардию. Теперь ты принимаешь решение по этому вопросу. Не так ли?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_05");	//Ох, парень. Ты ведь не отстанешь, да?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_06");	//Ладно. Считай, что ты прошел свой вступительный экзамен. (смеется)
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_RavenGuard_01_07");	//Вот, держи свои доспехи. В общем, ты их честно заслужил.
	AI_Print("Получены Тяжелые доспехи стражника");
	CreateInvItems(other,ITAR_Thorus_Addon,1);
	THORUSACCEPTMEGUARD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_SUCCESS);
	B_LogEntry(TOPIC_THORUSGUARD,"В знак признательности за освобождение от Ворона Торус приравнял меня к своим помощникам и выдал мне тяжелые доспехи стражника.");
};