
var int nugget_all;
var int parcivalday;

instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о старателях?";
};


func int DIA_Parcival_Schurfer_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Что ты можешь рассказать мне о старателях?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Я отправил все три отряда.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Их возглавили Маркос, Фаджет и Сильвестро!
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Группа Маркоса пошла по направлению к Старой шахте. Ее ведет старый рудокоп Гримес.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Другие две группы вышли вместе.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Джерган, один из наших разведчиков, доложил, что они разбили лагерь неподалеку от большой башни.
	B_LogEntry(TOPIC_ScoutMine,"Группы рудокопов возглавляли паладины Маркос, Фаджет и Сильвестро. Группа Маркоса обнаружена в направлении бывшей Старой шахты. Рудокоп Гримес хорошо знает это место. Две других группы обнаружены вместе. Они соорудили свои лагеря поблизости большой башни.");
};

instance DIA_Parcival_Diego(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = "А с какой группой старателей пошел Диего?";
};


func int DIA_Parcival_Diego_Condition()
{
	if((SearchForDiego == LOG_Running) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//А с какой группой старателей пошел Диего?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Этот каторжник - Диего? Он с группой паладина Сильвестро.
	B_LogEntry(TOPIC_ScoutMine,"Диего пошел со старателями, возглавляемыми паладином Сильвестро.");
};


instance DIA_Parcival_Weg(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = "Ты знаешь, как добраться до этих шахт?";
};


func int DIA_Parcival_Weg_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Ты знаешь, как добраться до этих шахт?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Через долину вообще нет безопасного пути. Но мне все же кажется, что будет лучше избегать прямой дороги.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Держись подальше от орков и лесов - и да хранит тебя Иннос.
	B_LogEntry(TOPIC_ScoutMine,"Похоже, прямой путь к старателям может оказаться не лучшим выбором. Мне лучше обходить стороной леса и лагеря орков.");
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = "Как обстановка?";
};


func int DIA_Parcival_DRAGON_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Мы окружены орками. Похоже, они здесь надолго.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Но значительно больше меня тревожат нападения драконов. Они уже уничтожили весь внешний круг.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Еще одно нападение драконов, и мы понесем большие потери.
};


instance DIA_Parcival_DRAGONS(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = "Сколько всего драконов?";
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Сколько всего драконов?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Мы не знаем, сколько их всего, но больше одного, это точно.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Но и это еще не все. Вся Долина Рудников кишит дьявольскими созданиями, поддерживающими драконов.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Не стоит обманывать себя - без подкрепления извне наши шансы выбраться отсюда живыми ничтожны.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,DIA_Parcival_DRAGONS) && (Kapitel < 3) && (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	var int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Пока все спокойно. Но все может быстро перемениться.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Мы будем держаться, сколько сможем.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Иннос поможет нам. Его свет озаряет наши сердца!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Эй! Тебе что, нечего больше делать, как болтать со мной? Проваливай!
		B_GivePlayerXP(XP_Ambient);
	};
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


instance DIA_Parcival_KAP3_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP3_EXIT_Condition;
	information = DIA_Parcival_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_ALLESKLAR(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if((Kapitel == 3) && (DIA_Parcival_ALLESKLAR_NervCounter < 3) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Все в порядке?
	if(DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Пока да!
	}
	else if(DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Да, черт тебя побери.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(смеется) Теперь я понимаю, что ты задумал! Нет, дружок, не на этот раз.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Не отвлекай меня!
	};
	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
};


instance DIA_Parcival_KAP4_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP4_EXIT_Condition;
	information = DIA_Parcival_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = "Ничего важного не произошло?";
};


func int DIA_Parcival_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Ничего важного не произошло?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ты один из этих отбросов общества, что называют себя охотниками на драконов?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Вообще-то, я полагал, что у тебя хватит ума не связываться с этими недоумками.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Я обеспокоен. Очень сильно обеспокоен.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Чем?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Недавно здесь появились эти люди. Они называют себя охотниками на драконов.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//С моей точки зрения все они бездельники и преступники.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Если бы это было в моей власти, я бы выгнал их всех из замка. Пусть орки позаботятся о них.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews,"Но в отличие от лорда Хагена, они все же здесь.",DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews,"Ты должен дать им шанс.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews,"Тебе не кажется, что ты преувеличиваешь?",DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Но в отличие от лорда Хагена, они все же здесь.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//Да, к сожалению, они все, что у нас есть.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Воистину Иннос подвергает нас суровому испытанию.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Ты должен дать им шанс.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//И они его получат. К сожалению.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Гаронд убежден, что они могут помочь нам.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Но я глаз с них не спущу. У нас и так хватает проблем с орками. И дополнительные неприятности нам совсем ни к чему.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Тебе не кажется, что ты преувеличиваешь?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Абсолютно нет. В нашей ситуации нам нужны люди, являющие собой пример героизма.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Воины, которые пробудят огонь Инноса в сердцах наших бойцов.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//А вместо этого эти проходимцы разлагают боевой дух моих солдат.
};


instance DIA_Parcival_Jan(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = "Мне нужно поговорить с тобой о Яне.";
};


func int DIA_Parcival_Jan_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Мне нужно поговорить с тобой о Яне.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Яне? Кто это?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Охотник на драконов. Он кузнец.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Ох, да. Я помню. Что насчет него?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Он хочет работать в кузнице.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Это даже не обсуждается. Он не наш человек и я не доверяю ему.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = "Ты не мог бы пересмотреть свое мнение насчет Яна?";
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Ты не мог бы пересмотреть свое мнение насчет Яна?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Нет, мое решение окончательно.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = "Гаронд хочет, чтобы Ян работал в кузнице.";
};

func int DIA_Parcival_TalkedGarond_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Гаронд хочет, чтобы Ян работал в кузнице.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Ммм. Если это действительно так, то я не имею ничего против этого.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Хотя я и считаю ошибкой доверять этому Яну.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = "А кроме этого?";
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//А кроме этого?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ах, оставь меня в покое!
};


instance DIA_Parcival_KAP5_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP5_EXIT_Condition;
	information = DIA_Parcival_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_VERRAETER(C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGateOpen == TRUE) && (other.guild == GIL_DJG) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Предатель! Я точно знаю, что это ТЫ открыл ворота.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Ты заплатишь за это.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Parcival_KAP6_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP6_EXIT_Condition;
	information = DIA_Parcival_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Parcival_PICKPOCKET(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 900;
	condition = DIA_Parcival_PICKPOCKET_Condition;
	information = DIA_Parcival_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_Parcival_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,Dialog_Back,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};

		B_GiveInvItems(self,other,ITKE_TWOSTORE,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};


instance DIA_PARCIVAL_CAPTURED(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = dia_parcival_captured_condition;
	information = dia_parcival_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parcival_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_parcival_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Kill_Arbaleters(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_condition;
	information = DIA_Parcival_Kill_Arbaleters_info;
	permanent = FALSE;
	description = "У тебя для меня есть какие-нибудь поручения?";
};

func int DIA_Parcival_Kill_Arbaleters_condition()
{
	if((Kapitel >= 2) && (MIS_ScoutMine == LOG_SUCCESS) && (Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_info()
{
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_00");	//У тебя есть для меня какие-нибудь поручения?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_01");	//(оценивающе) Ты смог добраться до замка живым. А значит, ты действительно чего-то стоишь.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_02");	//Но хочу сразу предупредить, что это очень сложное и опасное дело!
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_03");	//А я уж думал, все сложные дела закончились.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_04");	//Так уж вышло, что тебе по плечу такие вещи, которые не под силу многим моим людям.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_05");	//Ближе к делу. Что на этот раз?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_06");	//На высоком холме с западной стороны замка находится наблюдательный пост орков.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_07");	//Недавно они прислали туда новый отряд бойцов.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_08");	//Однако мы не можем допустить, чтобы орки основательно закрепились на столь выгодных для них позициях.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_09");	//Поэтому этот отряд надо уничтожить.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_10");	//А в чем проблема?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_11");	//Вся сложность в том, что орки приняли все меры предосторожности.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_12");	//Арбалетчики, находящиеся в этом отряде, - настоящая головная боль для любого, кто туда сунется!
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_13");	//А я не могу рисковать своими людьми, занятыми на обороне замка.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_14");	//Понимаю. Поэтому рисковать буду я.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_15");	//Ну... Больше некому! Ты же прекрасно понимаешь это.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_16");	//Только будь осторожен - там могут быть не только стрелки, но и элитные бойцы.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_17");	//Ладно, сделаю что смогу.
	MISS_ELITE_GROUP_ORKS = LOG_Running;
	Log_CreateTopic(TOPIC_ELITE_GROUP_ORKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_Running);
	B_LogEntry(TOPIC_ELITE_GROUP_ORKS,"Парсиваль сообщил мне, что на наблюдательном посте орков появился новый, чрезвычайно сильный отряд орков. Парсиваль будет благодарен, если я решу эту проблему. Он также предупредил меня, что перед походом стоит как следует подготовиться.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrkElite_Warrior_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Warrior_Persival_02,"OW_PATH_015");
	Wld_InsertNpc(OrkElite_Warrior_Persival_03,"LOCATION_16_OUT");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_02,"OW_PATH_028");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_03,"OW_PATH_027");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_04,"OW_PATH_025");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_05,"OW_PATH_024");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_06,"OW_PATH_023");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_07,"OW_PATH_022");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_08,"OW_PATH_021");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_09,"OW_PATH_020");
	Wld_InsertNpc(OrkElite_Elder_Persival_01,"LOCATION_16_IN");
};

instance DIA_Parcival_Kill_Arbaleters_Done(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_Done_condition;
	information = DIA_Parcival_Kill_Arbaleters_Done_info;
	permanent = FALSE;
	description = "Отряд орков уничтожен.";
};

func int DIA_Parcival_Kill_Arbaleters_Done_condition()
{
	if((MISS_ELITE_GROUP_ORKS == LOG_Running) && Npc_IsDead(OrkElite_Warrior_Persival_01) && Npc_IsDead(OrkElite_Warrior_Persival_02) && Npc_IsDead(OrkElite_Warrior_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_01) && Npc_IsDead(OrkElite_Arbaletchik_Persival_02) && Npc_IsDead(OrkElite_Arbaletchik_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_04) && Npc_IsDead(OrkElite_Arbaletchik_Persival_05) && Npc_IsDead(OrkElite_Arbaletchik_Persival_06) && Npc_IsDead(OrkElite_Arbaletchik_Persival_07) && Npc_IsDead(OrkElite_Arbaletchik_Persival_08) && Npc_IsDead(OrkElite_Arbaletchik_Persival_09) && Npc_IsDead(OrkElite_Elder_Persival_01))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_01");	//Отряд орков уничтожен.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_02");	//Мои наблюдатели уже доложили мне, что орки понесли чудовищные потери в районе холма.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_03");	//Ты оказал нам огромную услугу! Это даст нам небольшое преимущество на некоторое время.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_04");	//А что насчет небольшой награды?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_05");	//Безусловно, ты ее честно заслужил!
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_06");	//Однако я теряюсь в догадках, чем именно тебя наградить.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_07");	//Что насчет золота, магических эликсиров или каких-то других ценных вещей?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_08");	//Да, я уже думал об этом.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_09");	//Но наши запасы в замке крайне скудны, и я не могу постоянно раздавать их направо и налево.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_10");	//Хотя постой. Я придумал, как тебя отблагодарить.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_12");	//Вот, возьми этот меч. Уверен, что подобного оружия ты еще не встречал!
	B_GiveInvItems(self,other,ITMW_2H_KATANA,1);
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_13");	//Ты прав. Я впервые вижу такое оружие.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_14");	//Оно и понятно. Ведь этот клинок из далекого Варанта.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_15");	//Он достался мне в качестве военного трофея от одного очень искусного воина-ассасина!
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_16");	//Я до сих пор помню эту схватку. И в память о тех временах до сего момента хранил этот меч.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_17");	//А теперь он твой.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_18");	//Спасибо! Это действительно ценная награда.
	MISS_ELITE_GROUP_ORKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_SUCCESS);
	B_LogEntry(TOPIC_ELITE_GROUP_ORKS,"Я справился с заданием.");
};