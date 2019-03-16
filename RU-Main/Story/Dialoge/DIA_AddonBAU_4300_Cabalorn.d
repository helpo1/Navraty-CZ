
func int C_BragoBanditsDead()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Добро пожаловать в 'Кольцо', мой друг.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Ватрас даст тебе следующее задание.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Проблемы?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	if(Kapitel < 6)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Проблемы?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Черт. (раздраженно) Я не знаю, где они все прячутся! Убиваешь одного и вскоре они все возвращаются.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//Погоди минутку! Я тебя знаю. Ты тот парень, что постоянно клянчил у меня стрелы в Долине Рудников.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Тебя зовут Кавалорн, верно?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Что-то не припоминаю...",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Что-то не припоминаю...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Ну как же. Еще в моей хижине около Старого Лагеря я учил тебя, как стрелять из лука и незаметно передвигаться. Теперь вспоминаешь?
	CAVALORNBONUSGOTIKA = TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	if(CAVALORNBONUSGOTIKA == FALSE)
	{
		CAVALORNBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Тебя зовут Кавалорн, верно?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Ага! Я вижу, ты все-таки, не забыл меня после всего, через что мы прошли в этой клятой колонии.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Куда ты направляешься?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"У меня нет определенной цели.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Назад в Рудную Долину.",DIA_Addon_Cavalorn_HALLO_Bauern);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"В город.",DIA_Addon_Cavalorn_HALLO_Stadt);
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//В город.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//Ну-ну. (смеется) В город! Хммм...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//У тебя могут возникнуть сложности со стражей. Они уже не пускают каждого прохожего. Весь район кишит бандитами!

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Несколько дней назад один из бывших заключенных Долины Рудников проходил здесь. Он сказал, что постоянно покидает Хоринис и возвращается.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Он направился в долину под большой башней. Где-то у водопада должен быть туда проход.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Может быть, тебе стоит с ним поговорить.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Назад в Долину Рудников.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//Правда? Хммм...(пораженно) Я бы хотел пойти с тобой, но у меня здесь есть дела, которые я должен закончить.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Будешь в Долине Рудников, посмотри, пожалуйста, стоит ли еще моя старая хижина. Я бы хотел туда вернуться когда-нибудь.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Кавалорн хочет, чтобы я проверил, цела ли еще его старая хижина в Долине Рудников. Насколько я помню, она находится среди холмов на западе, там, где был Старый Лагерь. Думаю, он там что-то оставил.");
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//У меня нет определенной цели.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Не хочешь мне говорить, да? Ну ладно.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "Я был в твоей хижине в Долине Рудников.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Я был в твоей хижине в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Так значит, она еще стоит.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Да. И я знаю, зачем ты хотел туда вернуться.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Ты нашел его?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Если ты имеешь в виду мешочек с кусками руды... да, он у меня.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Ну ты, хитрый лис, знаешь об этом?

	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//А что еще тебе могло бы понадобиться в этой старой лачуге? Там нет больше ничего.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Он у тебя с собой? Я дам тебе сто золотых за него.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);

	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Конечно.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Нет, но у меня есть другой кусок руды.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Нет.",DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Я надеюсь, что он вернется ко мне.
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Нет, но у меня есть другой кусок руды.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Тоже неплохо.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"А почему ты вообще оттуда ушел?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Конечно.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"А почему ты вообще оттуда ушел?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Нет.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Тогда ПРИНЕСИ его мне! Я собирался сам идти в эту чертову Долину Рудников.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Я почти плачу.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Ужасно!
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"А почему ты вообще оттуда ушел?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//А почему ты вообще оттуда ушел?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Я и не думал, что в Хоринисе руда стоит так много.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//За такой жалкий кусочек руды в колонии ты бы и место, где поспать, себе не выбил.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//А в портовом городе тебе без лишних сомнений раскроят череп, если узнают, что при тебе есть руда.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Давай мне сто золотых и я отдам тебе твою руду.";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Давай мне сто золотых и я отдам тебе твою руду.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//По рукам! Вот деньги.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1) == FALSE)
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Ты настоящий друг! Спасибо огромное.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Сижу на месте! Если бы не эти чертовы бандиты, меня бы здесь не было.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "Что такое с бандитами?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Что такое с бандитами?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Ты что, с луны свалился?!
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Мммм...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Я говорю обо всем этом сброде из исправительной колонии, которые чувствуют себя здесь как дома, грабят и убивают всех, кого могут.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//Думаю, мне повезло, что они меня не убили. Я отвлекся буквально на секунду и меня уже оглушили ударом сзади дубинкой по голове.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Даже не знаю, как теперь получить свои вещи обратно.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "Тебя ограбили разбойники?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Тебя ограбили разбойники?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//Да...(в ярости) Они вырубили меня и бросили на завтрак гоблинам!
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Это были очень важные для меня вещи. Письмо и все деньги. Мне просто необходимо вернуть их.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Но без компаньона, который мог бы меня прикрыть, я не вернусь туда. Эти трусливые твари...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "Могу я помочь тебе с бандитами?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Могу я помочь тебе с бандитами?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(хитро) Возможно. Но ты выглядишь таким тощим, ты наверняка не держал меча несколько недель.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Ну... У меня нет выбора, так что я принимаю твое предложение. У меня мало времени.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Так, слушай. Вниз по этой дороге располагается одна из тех грязных дыр, где прячутся бандиты.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Именно те ребята, что там сидят, меня и ограбили.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Скажи, когда будешь готов, и мы поймаем преступников.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"Бандиты украли у Кавалорна что-то ценное. Он хочет, чтобы я помог ему расправиться с ними.");
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "Мне нужна экипировка получше.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != 0) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Мне нужна экипировка получше.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Эти свиньи не оставили мне почти ничего.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Я могу дать тебе волчий нож. Этого пока хватит?
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Ты называешь это ножом?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//А что по поводу лечения?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//У меня есть еще два лечебных зелья. Нужны?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Конечно! Давай сюда.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Пойдем, разберемся с этими ребятами!";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	var C_Npc bandit1;
	var C_Npc bandit2;
	var C_Npc bandit3;

	bandit1 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	bandit2 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	bandit3 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Пойдем, разберемся с этими ребятами!
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Конечно. Следи, чтобы ко мне не подходили сзади. Ладно?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//Теперь, их ждет неприятный сюрприз.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	CAVALORNGOBANDITS = TRUE;

	if(Bdt_1013_Away == FALSE)
	{
		bandit1.aivar[AIV_EnemyOverride] = FALSE;
		b_changeguild(Bdt_1013_Bandit_L,GIL_BDT);
	};

	bandit2.aivar[AIV_EnemyOverride] = FALSE;
	bandit3.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	var C_Item itm;

	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//И я, наконец, смогу выполнить свое задание. Я и так потерял уже слишком много времени.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Что это за задание?..
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//Ах, да. Ведь сначала мне еще нужно будет попасть в город, и потом...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//Не знаю, как мне удастся сделать это вовремя.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//А что насчет меня?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//Хммм...(оценивающе) А почему бы и нет! Ты можешь доставить письмо в город.
	};

	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//Тогда у меня будет слегка больше времени, чтобы позаботиться о своей экипировке.

	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Письмо должно быть у одного из бандитов в кармане.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Отнеси его к Ватрасу, магу воды, в город. Ты найдешь его на площади, возле небольшого храма. Он проповедует там весь день!
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Скажи ему, что мне не удалось.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//А если он спросит, где я, просто скажи ему, что я уже на пути к месту встречи, ладно?
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"В городе Хоринисе живет маг Воды Ватрас. Он читает проповеди на площади.");
	};

	itm = Npc_GetEquippedArmor(other);

	if((hero.guild == GIL_NONE) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//А, да, и еще одно. Для начала купи приличную одежду у какого-нибудь фермера.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Иначе тебя могут принять за бандита! Вот пара монет.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};

	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if(MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
	};

	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((C_BragoBanditsDead() == TRUE) && (Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Готово! Ха...им не следовало связываться со мной.
	CavSendVatras = TRUE;
	B_Addon_Cavalorn_VatrasBrief();
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "С бандитами покончено.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((CavSendVatras == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//С бандитами покончено.
	B_Addon_Cavalorn_VatrasBrief();
};

instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Интересные на тебе доспехи.";
};

func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Интересные на тебе доспехи. Ты больше не принадлежишь к Теням?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Тени? Они не существуют с тех пор, как пал Барьер.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//Когда мы могли, наконец, уйти из Долины Рудников, незачем было оставаться с ними.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Теперь я работаю на магов Воды. Я принадлежу к 'Кольцу Воды'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Кавалорн рассказал мне, что он принадлежит к сообществу, которое называется 'Кольцо Воды'.");
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "Расскажи мне о 'Кольце Воды'!";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Расскажи мне о 'Кольце Воды'!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Мне на самом деле нельзя говорить про него.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Все, что я могу сделать, - это отослать тебя к Ватрасу. Он - представитель магов воды в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Лучше тебе поговорить с ним. Скажи, что я тебя рекомендовал.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Может быть, он тебя примет в наши ряды. Нам срочно необходимы люди...
	B_LogEntry(TOPIC_Addon_RingOfWater,"О Кольце Воды мне может рассказать маг воды Ватрас.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "Разве ты и твои ребята раньше не были врагами магов воды?";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Разве ты и твои ребята раньше не были врагами магов воды?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Эти безумные дни закончились. Теперь нет 'Нового Лагеря' или 'Старого Лагеря'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//После того как колония прекратила свое существование, каждый остался сам за себя.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//За большинством из бывших заключенных все еще идет охота.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Маги воды сумели разобраться с моим приговором, и теперь я могу передвигаться свободно.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "А что, собственно, делают маги воды?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//А что, собственно, делают маги воды?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Они затеяли кое-что серьезное. Это касается неизвестной области на острове.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Неизвестной области? Где же она может быть?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Я не могу тебе сказать. Поговори с Ватрасом в Хоринисе.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "Я передал Ватрасу твое письмо.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Я передал Ватрасу твое письмо.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Я и не ожидал другого. Спасибо.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Ты что-то ищешь?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Ты что-то ищешь?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//А что, так заметно? Да, у меня есть поручение от магов воды, я ищу потерянный орнамент.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//Как удобно. У меня то же поручение от Нефариуса.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Так значит, ты принадлежишь к 'Кольцу Воды'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Да.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Пока нет, но я работаю над этим.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//Я рад. Значит, мне не придется заниматься этим в одиночку.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Ты уже нашел орнамент?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Я знаю место, где он должен быть.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Этот каменный круг похож на то, что описывал Нефариус.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Теперь нам надо просто найти механизм, который мы и должны найти.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "Я пробовал, но он не работает.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Я пробовал, но он не работает...ничего не делает.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Значит, фермеры Лобарта были правы.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Они сказали, что один из них уже крутился здесь, возле камней.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Каменный страж появился из ниоткуда и напал на него.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Фермеры позвали ополченцев, те оповестили паладинов, которые и уничтожили монстра.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Я уже обыскал здесь все. Если орнамент и был здесь, теперь он у паладинов.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Кому-то из нас придется подняться в верхнюю часть города.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Тогда я пойду и попрошу у них орнамент.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Сейчас я снова иду в город. Встретимся у Ватраса.
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Одна из частей орнамента находится у паладинов в верхнем квартале.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");

	if(Kapitel < 3)
	{
		if(!Npc_IsDead(Ambusher_1013))
		{
			B_StartOtherRoutine(Ambusher_1013,"AWAY");
			Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_01");
		}
		else
		{
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
		};
	};

	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Тогда я пойду и попрошу у них орнамент.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Отлично.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Кому-то из нас придется подняться в верхнюю часть города.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//У меня нет на это времени. Это придется сделать тебе.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "Я получил пропавший орнамент от паладинов.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Я получил пропавший орнамент от паладинов.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Видишь? Я так и думал, что он у них.
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Ты можешь научить меня кое-чему?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Конечно. Ты это прекрасно знаешь. Приятель, ты действительно много потерял.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Ты и правда ничего не помнишь, да?
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,"Кавалорн может показать мне, как обращаться с луком и одноручным оружием. А также, повысить мою выносливость и жизненную силу.");
};


var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу обучиться тому, что ты умеешь.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if(Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_addon_cavalorn_teach_stamina_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_addon_cavalorn_teach_stamina_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_cavalorn_teach_hp_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_cavalorn_teach_hp_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Я хочу обучиться тому, что ты умеешь.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Хорошо. Что именно тебя интересует?
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Уже лучше! Ты многое забыл с тех пор, но мы это исправим.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};


instance DIA_ADDON_CAVALORN_ESCAPEFROMTOWN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_escapefromtown_condition;
	information = dia_addon_cavalorn_escapefromtown_info;
	permanent = FALSE;
	description = "Рад тебя видеть, Кавалорн!";
};


func int dia_addon_cavalorn_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_escapefromtown_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_00");	//Рад тебя видеть, Кавалорн!
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_01");	//Выходит, что тебе также удалось выбраться из города живым.
	MEETCAVALORNAGAIN = TRUE;
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_02");	//Как видишь. (улыбаясь) И не только мне одному.

		if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_03");	//Если ты имеешь в виду Скатти и Торуса, то я уже повстречался с ними.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_04");	//Ну, раз так, тогда я не буду вдаваться в подробности. Наверняка они уже тебе обо всем рассказали.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_05");	//Само собой.
		}
		else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_06");	//Если ты имеешь в виду Торуса, то я уже повстречался с ним.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_07");	//Ну раз так, тогда я не буду вдаваться в подробности. Наверняка он уже тебе обо всем рассказал.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_08");	//Само собой.
		}
		else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_09");	//Если ты имеешь в виду Скатти, то я уже повстречался с ним.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_10");	//Ну раз так, тогда я не буду вдаваться в подробности. Наверняка он уже тебе обо всем рассказал.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_11");	//Само собой.
		};
	}
	else
	{
		if((THORUSINSERTED == TRUE) && !Npc_IsDead(vlk_6022_thorus))
		{
			THORUSHERE = TRUE;
		};
		if((SCATTYINSERTED == TRUE) && !Npc_IsDead(vlk_6024_scatty))
		{
			SCATTYHERE = TRUE;
		};
		if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_12");	//Как видишь. (улыбаясь) И не только мне одному.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_13");	//Кого ты имеешь в виду?
			if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_14");	//Со мной еще были Скатти и Торус! Полагаю, ты найдешь их вон в том доме.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_15");	//Так вы все вместе пробивались из осажденного Хориниса?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_16");	//Конечно! Ведь долгие годы, проведенные нами в колонии, не дали о себе позабыть.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_17");	//Мы привыкли, в случае опасности, всегда держаться вместе, и теперь это спасло нам жизнь.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_18");	//Понятно.
			}
			else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_19");	//Со мной еще был Торус! Ты найдешь его вон в том доме.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_20");	//Так ты вместе с ним пробивался из осажденного Хориниса?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_21");	//Конечно! Ведь долгие годы, проведенные нами в колонии, не дали о себе позабыть.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_22");	//Мы привыкли, в случае опасности, всегда держаться вместе и теперь это спасло нам жизнь.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_23");	//Понятно.
			}
			else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_24");	//Со мной еще был Скатти! Ты найдешь его вон в том доме.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_25");	//Так ты вместе с ним пробивался из осажденного Хориниса?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_26");	//Конечно! Ведь долгие годы, проведенные нами в колонии, не дали о себе позабыть.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_27");	//Мы привыкли, в случае опасности, всегда держаться вместе и теперь это спасло нам жизнь.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_28");	//Понятно.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_29");	//Как видишь. (печально) Все остальные, по всей видимости, погибли. Орки вряд ли кого-то пощадили.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_30");	//Возможно, есть и другие выжившие. Правда, скорее всего, их не так уж и много.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_31");	//Надеюсь, ты прав.
		};
	};
};


instance DIA_ADDON_CAVALORN_WHATNEXT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_whatnext_condition;
	information = dia_addon_cavalorn_whatnext_info;
	permanent = FALSE;
	description = "Каковы твои дальнейшие планы?";
};


func int dia_addon_cavalorn_whatnext_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_whatnext_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_00");	//Каковы твои дальнейшие планы?

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_01");	//Эх! Я бы и сам был не прочь понять, что нам делать дальше.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_02");	//Но одно я знаю точно: долго здесь оставаться нельзя. Это слишком опасно.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_03");	//Орки могут пожаловать сюда в любую минуту, поскольку им до нас почти рукой подать.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_05");	//Эх! Я бы и сам был не прочь понять, что мне делать дальше.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_06");	//Но одно я знаю точно: долго здесь оставаться нельзя. Это слишком опасно.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_07");	//Орки могут пожаловать сюда в любую минуту, поскольку им до фермы почти рукой подать.
	};

	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_09");	//Однако, насколько я смог заметить, они до сих пор не напали.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_10");	//Это меня и пугает. (нервно) Они явно что-то замышляют, или же чего-то ждут.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_11");	//Вот только что именно - этого мне пока не известно. Может быть, ты знаешь?
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_12");	//Боюсь, что нет.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_13");	//Так я и думал. Что же, очень жаль.
};


instance DIA_ADDON_CAVALORN_BIGFARMFREE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_bigfarmfree_condition;
	information = dia_addon_cavalorn_bigfarmfree_info;
	permanent = FALSE;
	description = "Я слышал, что ферма Онара еще свободна.";
};


func int dia_addon_cavalorn_bigfarmfree_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_whatnext))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bigfarmfree_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_00");	//Я слышал, что ферма Онара еще свободна.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_01");	//И что с того?
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_02");	//Возможно, вам стоит отправиться именно туда.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_03");	//Хммм. Мысль, конечно, хорошая. Но вот только как нам это сделать?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_04");	//Все дороги, которые ведут к этой ферме, сейчас перекрыты патрулями орков.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_05");	//Мы и шагу не сделаем, как нарвемся на какой-нибудь из их отрядов.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_06");	//Возможно, тебе стоит отправиться именно туда?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_07");	//Хммм. Мысль, конечно, хорошая. Но вот только как мне это сделать?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_08");	//Все дороги, которые ведут к этой ферме, сейчас перекрыты патрулями орков.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_09");	//Я и шагу не сделаю, как нарвусь на какой-нибудь из их отрядов.
	};
	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"Я помогу туда добраться!",dia_addon_cavalorn_bigfarmfree_go);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"Возможно, ты и прав.",dia_addon_cavalorn_bigfarmfree_notgo);
};

func void dia_addon_cavalorn_bigfarmfree_go()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_01");	//Я помогу вам туда добраться.
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_02");	//Ты хочешь сказать, что способен провести нас через все позиции орков?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_03");	//Почему бы и нет! Я достаточно неплохо знаю эту местность.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_04");	//Уверен, у нас есть шанс проскочить мимо них незаметно.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_05");	//Хммм. Ну, если ты так в этом уверен, то, возможно, нам действительно стоит рискнуть.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_06");	//В конце концов, нам, в любом случае когда-нибудь придется это сделать. Почему бы и не сейчас!
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_07");	//Значит, ты согласен?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_08");	//Конечно! Думаю, ты и сам это понял. (решительно) Так что давай больше не будем тратить время на лишние разговоры.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_09");	//Скажи, как будешь готов, и мы последуем за тобой. Надеюсь, удача улыбнется нам и в этот раз!
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"Я вызвался провести Кавалорна и других его парней к ферме Онара, минуя все позиции орков. Надеюсь, что из моей затеи выйдет что-нибудь путное.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_11");	//Ты хочешь сказать, что способен провести меня через все позиции орков?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_12");	//Почему бы и нет. Я достаточно неплохо знаю эту местность.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_13");	//Уверен, у нас есть шанс проскочить мимо них незаметно.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_14");	//Хммм. Ну, если ты так в этом уверен, - то, возможно, действительно стоит рискнуть.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_15");	//В конце концов, мне в любом случае когда-нибудь придется это сделать. Почему бы и не сейчас.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_16");	//Значит, ты согласен?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_17");	//Конечно. Думаю, ты и сам это понял. Так что давай больше не будем тратить время на лишние разговоры.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_18");	//Скажи, как будешь готов, и я последую за тобой. Надеюсь, удача улыбнется нам и в этот раз!
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"Я вызвался провести Кавалорна к ферме Онара, минуя все позиции орков. Надеюсь, что из этой затеи выйдет что-нибудь путное.");
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

func void dia_addon_cavalorn_bigfarmfree_notgo()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_00");	//Возможно, ты и прав.
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_01");	//Было бы действительно глупо полагаться на то, что орки нас не заметят.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_02");	//Вот именно, приятель. К сожалению, так оно и есть.
	REFUSEHELPCAVALORN = TRUE;

	if(MIS_DIEGOOLDFRIENS == LOG_Running)
	{
		MIS_DIEGOOLDFRIENS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_DIEGOOLDFRIENS);
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWAR(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowar_condition;
	information = dia_addon_cavalorn_oldguardgowar_info;
	permanent = TRUE;
	description = "Иди за мной!";
};

func int dia_addon_cavalorn_oldguardgowar_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_00");	//Иди за мной!

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_01");	//Хорошо. Только не забудь и про остальных парней!
		AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_02");	//Я о них помню.
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_03");	//Ну что же, тогда вперед.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_04");	//Хорошо. Вперед!
	};

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardone_condition;
	information = dia_addon_cavalorn_oldguardgowardone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardone_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_00");	//Отлично! Судя по всему, мы уже на месте.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_01");	//Вот видишь - как я и обещал.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_02");	//Уверен, что здесь вы будете в большей безопасности, чем на ферме Акила.
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_03");	//Что же, тогда спасибо за помощь! Без нее бы нам было куда сложнее прорваться через толпы орков.
	MIS_OLDGUARDGOWAR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_OLDGUARDGOWAR,"Я привел Кавалорна на ферму Онара. Опасность позади.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	ORCAKILINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONEPOTION(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardonepotion_condition;
	information = dia_addon_cavalorn_oldguardgowardonepotion_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardonepotion_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardonepotion_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_01");	//Постой! Вот, возьми этот эликсир в качестве моей благодарности.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_02");	//Уверен, что он тебе пригодится.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_03");	//Спасибо.
	AI_StopProcessInfos(self);
	if(SCATTYINSAFE == TRUE)
	{
		B_StartOtherRoutine(scatty_nw,"FarmRest");
	};
	if(THORUSINSAFE == TRUE)
	{
		B_StartOtherRoutine(thorus_nw,"FarmRest");
	};
};

instance DIA_ADDON_CAVALORN_WHEREPEASANT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_wherepeasant_condition;
	information = dia_addon_cavalorn_wherepeasant_info;
	permanent = FALSE;
	description = "А где все крестьяне со двора?";
};


func int dia_addon_cavalorn_wherepeasant_condition()
{
	if(Npc_KnowsInfo(other,dia_thorus_nw_escapefromtown) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WherePeasant_01_00");	//А где все крестьяне со двора?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_01");	//Понятия не имею. Разбежались, наверное, кто куда.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_02");	//Ведь здесь сейчас оставаться слишком опасно. Эта ферма - слишком заметное место, чтобы орки ее оставили без внимания.
	KNOWWHEREAKIL = TRUE;
};

