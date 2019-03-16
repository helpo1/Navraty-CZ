var int LokiAnsewrOne;
var int LokiAnsewrTwo;
var int LokiAnsewrThree;

instance DIA_SEK_8049_LOKI_EXIT(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 999;
	condition = dia_SEK_8049_LOKI_exit_condition;
	information = dia_SEK_8049_LOKI_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_8049_LOKI_exit_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SEK_8049_LOKI_GREET(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_greet_condition;
	information = dia_SEK_8049_LOKI_greet_info;
	permanent = FALSE;
	description = "Я хотел бы поговорить с тобой, послушник.";
};

func int dia_SEK_8049_LOKI_greet_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_greet_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_00");	//Я хотел бы поговорить с тобой, послушник.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_01");	//О чем именно?
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_02");	//Меня интересуют подробности недавнего нападения.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_03");	//Ах, это...(нервно) Я стараюсь как можно скорее забыть о случившемся. Но, по всей видимости, мне этого не удастся сделать.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_04");	//Я понимаю, что ты пережил не самые приятные минуты в своей жизни.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_05");	//Но ты должен осознавать, что твое чудесное спасение еще не гарантирует спокойной жизни.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_06");	//И всем остальным членам Братства до сих пор грозит огромная опасность!
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_07");	//Поэтому ты должен помочь мне.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_08");	//Хммм...(обреченно) Ну ладно, полагаю ты прав. Спрашивай, что хочешь.
};


instance DIA_SEK_8049_LOKI_Survive(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Survive_condition;
	information = dia_SEK_8049_LOKI_Survive_info;
	permanent = FALSE;
	description = "Как тебе удалось выжить?";
};

func int dia_SEK_8049_LOKI_Survive_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Survive_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Survive_01_00");	//Как тебе удалось выжить?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_01");	//Думаю, что мне просто повезло...(растерянно) Иначе не скажешь!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_02");	//Я нашел огромную поляну с болотной травой и так увлекся ее сбором, что не заметил, как отошел от нашего лагеря.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_03");	//Услышав звуки боя, я спрятался в ближайших зарослях и сидел там, пока нападавшие не ушли.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_04");	//Вот, собственно, и все.
	LokiAnsewrOne = TRUE;
};


instance DIA_SEK_8049_LOKI_Attackers(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Attackers_condition;
	information = dia_SEK_8049_LOKI_Attackers_info;
	permanent = FALSE;
	description = "Как выглядели нападавшие?";
};

func int dia_SEK_8049_LOKI_Attackers_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Attackers_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Attackers_01_00");	//Как выглядели нападавшие?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_01");	//Мне это неизвестно...(растерянно) К тому же все их лица скрывали маски.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_02");	//Единственное, что мне запомнилось, так это странного рода рисунки, покрывавшие их тела.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_03");	//Они немного схожи с теми, что делаем мы здесь, в лагере Братства.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Attackers_01_04");	//А они о чем-нибудь разговаривали?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_05");	//Нет. За все то время, сколько я их видел, они не произнесли ни слова. 
	LokiAnsewrTwo = TRUE;
};

instance DIA_SEK_8049_LOKI_Other(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Other_condition;
	information = dia_SEK_8049_LOKI_Other_info;
	permanent = FALSE;
	description = "Что случилось с остальными?";
};

func int dia_SEK_8049_LOKI_Other_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Other_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Other_01_00");	//Что случилось с остальными?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Other_01_01");	//Они забрали всех послушников с собой. А тех же, кто сопротивлялся - просто убили на месте.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Other_01_02");	//Больше мне ничего не известно.
	LokiAnsewrThree = TRUE;
};

instance DIA_SEK_8049_LOKI_Sign(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Sign_condition;
	information = dia_SEK_8049_LOKI_Sign_info;
	permanent = FALSE;
	description = "Насчет того амулета, что тебе показывал Идол Намиб.";
};

func int dia_SEK_8049_LOKI_Sign_condition()
{
	if((LokiAnsewrOne == TRUE) && (LokiAnsewrTwo == TRUE) && (LokiAnsewrThree == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Sign_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_00");	//Насчет того амулета, что тебе показывал Идол Намиб.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_01");	//Ты что-нибудь о нем знаешь?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_02");	//Нет, мне о нем ничего не известно.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_03");	//Правда... мне показалось, что изображенный на нем в центре символ я где-то уже видел.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_04");	//Вот только не могу вспомнить, где именно.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_05");	//Ты уверен в этом?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_06");	//Да, иначе бы я не придал этому рисунку большого значения.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_07");	//Но почему же ты не сказал об этом самому Идолу Намибу?!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_08");	//Понимаешь... Я был тогда слишком напуган и побоялся ошибиться в своих догадках.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_09");	//Что ж, тогда надо помочь тебе обо всем вспомнить. Это может быть очень важно!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_10");	//Вот только как это сделать?...(растерянно) Боюсь, что пока я больше ничем тебе помочь не смогу.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_11");	//Я что-нибудь придумаю.
	B_LogEntry(TOPIC_PrioratStart,"Мне удалось выяснить, что Локи уже видел символ, который показывал ему Идол Намиб на амулете. Однако, Локи не может вспомнить - где и когда это было. Ему надо помочь освежить память. Возможно, один из Гуру знает способ, как это сделать.");
	LokiNeedMemory = TRUE;
};



instance DIA_SEK_8049_LOKI_SPECIALPOTION(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_SPECIALPOTION_condition;
	information = dia_SEK_8049_LOKI_SPECIALPOTION_info;
	permanent = FALSE;
	description = "Вот, выпей этот напиток.";
};


func int dia_SEK_8049_LOKI_SPECIALPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiMemoriesAlive == FALSE) && (Npc_HasItems(other,ItPo_Memories) >= 1))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_SPECIALPOTION_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_00");	//Вот, выпей этот напиток.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_01");	//А что это?
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_02");	//Не волнуйся. Он поможет тебе немного освежить твою память.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_03");	//Ну, хорошо...(боязно) Давай его сюда.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItPo_Memories,1);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,ItPo_Memories);
	LokiMemoriesAlive = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_SEK_8049_LOKI_SPECIALPOTION_OK(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition;
	information = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition()
{
	if(LokiMemoriesAlive == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_00");	//Ох...(приходя в себя) Черт, что это было?!
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_01");	//Ну и как твои ощущения?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_02");	//Не могу сказать, что они слишком приятные...(пошатываясь) Этот твой напиток прилично бьет по мозгам!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_03");	//Похоже, что я был без сознания несколько минут.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_04");	//Так оно и было. Но давай сразу к делу.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_05");	//Теперь ты вспомнил, где видел тот знак на амулете?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_06");	//Да, я все вспомнил. И даже больше, чем стоило бы.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_07");	//И ты сможешь отвести меня туда?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_08");	//Думаю, да. Как ни странно, но это место находится совсем недалеко от нашего лагеря.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_09");	//Тогда не будем терять времени - веди меня.
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_10");	//Хорошо! Следуй за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	LokiGuide = TRUE;
	Loki_GuideDay = Wld_GetDay();
};


instance DIA_SEK_8049_LOKI_GUIDE(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_GUIDE_Condition;
	information = DIA_SEK_8049_LOKI_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SEK_8049_LOKI_GUIDE_Condition()
{
	if((LokiGuide == TRUE) && (Npc_GetDistToWP(self,"NW_TO_NEWCAMPPSI_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_GUIDE_Info()
{
	B_GivePlayerXP(500);

	if(Loki_GuideDay > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_00");	//Вот мы и пришли.
	}
	else
	{
		AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_01");	//Вот ты где! А я уж начал думать, что тебя загрызли волки.
	};

	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_02");	//И что у нас тут?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_03");	//...(оглядываясь) Позади меня странного рода камень, на нем-то я и видел интересующий тебя символ.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_04");	//Хорошо, я посмотрю.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_05");	//Давай...(нервно) А я, пожалуй, лучше вернусь в лагерь. Мне как-то немного не по себе от этого места.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_06");	//Еще увидимся, приятель.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_07");	//Само собой.
	Assasins_Door_Found = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PsiCamp");
};