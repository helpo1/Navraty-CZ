
var int GaanTeachFinish;

func void B_WasMachtJagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Как охота?
};


instance DIA_Gaan_EXIT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 999;
	condition = DIA_Gaan_EXIT_Condition;
	information = DIA_Gaan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int DIA_Gaan_EXIT_oneTime;

func int DIA_Gaan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if(DIA_Gaan_EXIT_oneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

instance DIA_Gaan_WASMACHSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 4;
	condition = DIA_Gaan_WASMACHSTDU_Condition;
	information = DIA_Gaan_WASMACHSTDU_Info;
	description = "Кто ты?";
};


func int DIA_Gaan_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_Gaan_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Меня зовут Гаан. Я охотник и работаю на Бенгара - фермера, владеющего этими высокогорными пастбищами.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Я провожу большую часть времени на природе, греясь на солнце.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_01_00");	//А мне казалось, что все парни из лагеря - вольные охотники?!
		AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_01_01");	//Конечно!...(смеется) Но от лишних золотых монет я тоже не собираюсь отказываться.
		AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_01_02");	//Да и работа у меня не особо пыльная.
		AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_01_03");	//Понятно.
	};
};


instance DIA_Gaan_HALLO(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 3;
	condition = DIA_Gaan_HALLO_Condition;
	information = DIA_Gaan_HALLO_Info;
	description = "У тебя здесь просторно.";
};


func int DIA_Gaan_HALLO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//У тебя здесь просторно.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//Да, мне здесь нравится. Но если ты пойдешь вон по тому Проходу, ты можешь переменить свое мнение.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Если этот клочок земли произвел впечатление на тебя, значит, ты еще не видел Долины Рудников!
};


instance DIA_Gaan_WALD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 5;
	condition = DIA_Gaan_WALD_Condition;
	information = DIA_Gaan_WALD_Info;
	description = "Что мне нужно знать о Долине Рудников?";
};


func int DIA_Gaan_WALD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WALD_Info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Что мне нужно знать о Долине Рудников?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Понятия не имею. Я видел эту долину только мельком. По мне, там слишком опасно!
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Лучше всего, если ты пойдешь туда по Проходу. Держись протоптанной дороги!
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Ты можешь пойти либо через большое ущелье, либо по дороге через каменный мост. Первый путь корче и безопасней...
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Теперь, когда орки роются повсюду, нужно быть очень осторожным.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Мне совсем не хочется тащить тебя к ведьме-целительнице.
};


instance DIA_Gaan_SAGITTA(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 7;
	condition = DIA_Gaan_SAGITTA_Condition;
	information = DIA_Gaan_SAGITTA_Info;
	description = "Ведьме-целительнице?";
};


func int DIA_Gaan_SAGITTA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WALD))
	{
		return TRUE;
	};
};

func void DIA_Gaan_SAGITTA_Info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Ведьме-целительнице?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Ее зовут Сагитта. Она лечит фермеров и других людей, живущих вне города.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Очень загадочная женщина...
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Никому не нравится ходить к ней, и все обожают распускать о ней сплетни.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Но, если ты заболеешь, ты нигде не найдешь лучшей помощи, чем у Сагитты. На ее кухне, полной целебных трав...
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Ты найдешь ее в лесу, за фермой Секоба.
};


instance DIA_Gaan_JAGD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 80;
	condition = DIA_Gaan_JAGD_Condition;
	information = DIA_Gaan_JAGD_Info;
	permanent = FALSE;
	description = "Как охота?";
};


func int DIA_Gaan_JAGD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_JAGD_Info()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Как охота?
	AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Последнее животное, которое мне удалось убить, была - большая крыса. Дела идут совсем плохо.

	if(Npc_IsDead(Gaans_Snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Вот уже несколько дней какой-то фыркающий зверь бродит здесь.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Он не только убивает все, кто движется - он мешает моей работе!
		MIS_Gaan_Snapper = LOG_Running;
		Log_CreateTopic(TOPIC_GaanSchnaubi,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_Running);
		B_LogEntry(TOPIC_GaanSchnaubi,"Сопящее создание бродит в охотничих угодьях Гаана и мешает ему охотиться. Если я убью эту тварь, то Гаан вернется к охоте.");
	};
};


instance DIA_Gaan_MONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 8;
	condition = DIA_Gaan_MONSTER_Condition;
	information = DIA_Gaan_MONSTER_Info;
	description = "А как выглядит этот 'опасный зверь'?";
};


func int DIA_Gaan_MONSTER_Condition()
{
	if((MIS_Gaan_Snapper == LOG_Running) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//А как выглядит этот 'опасный зверь'?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Я...(растерянно) Точно не знаю! Я только слышал фырканье и скрежет его когтей. Но видел, что он может сделать!
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Даже волки боятся его! Этот зверь как-то оторвал одному волку голову...
};


instance DIA_Gaan_WOHERMONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_WOHERMONSTER_Condition;
	information = DIA_Gaan_WOHERMONSTER_Info;
	description = "Откуда пришел этот коварный зверь?";
};


func int DIA_Gaan_WOHERMONSTER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_MONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WOHERMONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Откуда пришел этот коварный зверь?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Откуда-то издалека! Может быть, из Долины Рудников. Но я не знаю этого точно.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Я никогда не был в Долине Рудников.
};


instance DIA_Gaan_WASZAHLSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 9;
	condition = DIA_Gaan_WASZAHLSTDU_Condition;
	information = DIA_Gaan_WASZAHLSTDU_Info;
	description = "Сколько ты заплатишь, если я убью этого зверя для тебя?";
};


func int DIA_Gaan_WASZAHLSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WOHERMONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASZAHLSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Сколько ты заплатишь, если я убью этого зверя для тебя?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Я бы отдал тому, кто убьет этого зверя все, что у меня есть.
	B_Say_Gold(self,other,30);
	MIS_Gaan_Deal = LOG_Running;
};


instance DIA_Gaan_MONSTERTOT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_MONSTERTOT_Condition;
	information = DIA_Gaan_MONSTERTOT_Info;
	important = TRUE;
};


func int DIA_Gaan_MONSTERTOT_Condition()
{
	if((Npc_IsDead(Gaans_Snapper) == TRUE) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTERTOT_Info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//Этот ужасный зверь мертв, я полагаю?
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Теперь я опять могу охотиться спокойно.
	if(MIS_Gaan_Deal == LOG_Running)
	{
		B_GivePlayerXP(XP_Gaan_WaldSnapper);
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Вот деньги, что я обещал.
		CreateInvItems(self,ItMi_Gold,30);
		B_GiveInvItems(self,other,ItMi_Gold,30);
	};
	MIS_Gaan_Snapper = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_SUCCESS);
};


instance DIA_GAAN_WHATSNEW(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = dia_gaan_whatsnew_condition;
	information = dia_gaan_whatsnew_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_gaan_whatsnew_condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_JAGD) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gaan_whatsnew_info()
{
	AI_Output(other,self,"DIA_Gaan_WhatsNew_01_00");	//Как дела?

	if(MIS_Gaan_Snapper == LOG_Running)
	{
		if(Kapitel >= 3)
		{
			AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Дела идут все хуже и хуже. А тем временем, через проход толпами валят эти фыркающие твари.
		};

		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Охотится становиться все сложнее и сложнее...
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Мне не на что жаловаться.
	};
};


instance DIA_Addon_Gaan_Ranger(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_Ranger_Condition;
	information = DIA_Addon_Gaan_Ranger_Info;
	description = "Почему у тебя такой подозрительный взгляд?";
};


func int DIA_Addon_Gaan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU) && (SCIsWearingRangerRing == TRUE) && (RangerMeetingRunning == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Почему у тебя такой подозрительный взгляд?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Ты носишь наше аквамариновое кольцо.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Ты принадлежишь к "Кольцу воды"?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Именно так! Приятно видеть в наших рядах нового человека.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Gaan_MeetingIsRunning(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information = DIA_Addon_Gaan_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Gaan_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Gaan_MeetingIsRunning_One_time;

func void DIA_Addon_Gaan_MeetingIsRunning_Info()
{
	if(DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Приятно видеть среди нас новое лицо. Добро пожаловать в "Кольцо воды"!
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Тебя хочет видеть Ватрас, отправляйся к нему!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Gaan_AufgabeBeimRing(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information = DIA_Addon_Gaan_AufgabeBeimRing_Info;
	description = "В чем заключаются твои обязанности в этом обществе?";
};


func int DIA_Addon_Gaan_AufgabeBeimRing_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Gaan_Ranger) || (RangerMeetingRunning != 0)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//В чем заключаются твои обязанности в этом обществе?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Я наблюдаю за проходом. И сообщаю, кто приходит и кто уходит.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Впрочем, с тех пор как паладины приказали закрыть ворота прохода, людей здесь немного.
};


instance DIA_Addon_Gaan_MissingPeople(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_MissingPeople_Condition;
	information = DIA_Addon_Gaan_MissingPeople_Info;
	description = "Ты слышал о пропавших людях?";
};


func int DIA_Addon_Gaan_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Gaan_AufgabeBeimRing) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Ты слышал о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Конечно, слышал. Именно поэтому нам всегда надо быть осторожнее.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Но я не знаю ничего такого, что могло бы тебе помочь.
};


instance DIA_Gaan_AskTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_AskTeacher_Condition;
	information = DIA_Gaan_AskTeacher_Info;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Gaan_AskTeacher_Condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Ты можешь научить меня охотиться?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Я не могу научить тебя ничему, что ты еще не знаешь. Извини!
		GaanTeachFinish = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Нет проблем! За сто золотых монет я могу показать тебе, как выпотрошить животных, которых ты убьешь.
		AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Шкуры и другие трофеи можно выгодно продать на рынке.
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Гаан может научить меня разделывать добычу.");
	};
};

instance DIA_Gaan_PayTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_PayTeacher_Condition;
	information = DIA_Gaan_PayTeacher_Info;
	permanent = TRUE;
	description = "Вот! Сто золотых за твой опыт по разделыванию животных.";
};

var int DIA_Gaan_PayTeacher_noPerm;

func int DIA_Gaan_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_AskTeacher) && (DIA_Gaan_PayTeacher_noPerm == FALSE))
	{
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Вот! Сто золотых за твой опыт по разделыванию животных.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//Спасибо. Теперь говори, что ты хочешь.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Обратись ко мне позже, когда у тебя будут деньги.
	};
};


instance DIA_Gaan_TEACHHUNTING(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 12;
	condition = DIA_Gaan_TEACHHUNTING_Condition;
	information = DIA_Gaan_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};

func int DIA_Gaan_TEACHHUNTING_Condition()
{
	if((Gaan_TeachPlayer == TRUE) && (GaanTeachFinish == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Чему ты можешь обучить меня?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//Это зависит от того, что ты уже знаешь.
		Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Gaan_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Gaan_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Gaan_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать жало кровяного шершня",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Gaan_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отрезать крылья кровяного шершня",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Gaan_TEACHHUNTING_BFWing);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Я не могу научить тебя ничему, что ты еще не знаешь. Извини!
		GaanTeachFinish = TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
};

func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Звери не любят расставаться со своими когтями. Ножом нужно работать очень точно.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Твои руки должны быть слегка скрещены. Затем нужно отрубить когти сильным ударом.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Торговцы всегда готовы выложить кругленькую сумму за когти.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Легче всего вырезать зубы животного. Просто проведи своим ножом вокруг зубов во рту животного.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Затем нужно отделить их от черепа точным ударом.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Лучше снимать шкуру, сделав глубокий разрез в районе задних ног.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//После этого ты легко можешь снять шкуру, стягивая ее с животного.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//У этих мух есть мягкое место на спине.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Если нажать там, жало выдвинется очень далеко. И ты сможешь вырезать его при помощи ножа.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Лучше всего отделить крылья кровавой мухи, отрубив их ударом острого ножа как можно ближе к телу.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Нужно быть очень аккуратным, чтобы не повредить нежную ткань крыльев. Они не будут ничего стоить, если ты повредишь их.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

instance DIA_Gaan_PICKPOCKET(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 900;
	condition = DIA_Gaan_PICKPOCKET_Condition;
	information = DIA_Gaan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaan_PICKPOCKET_Condition()
{
	return C_Beklauen(23,35);
};

func void DIA_Gaan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,Dialog_Back,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};


instance DIA_GAAN_RESPECT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = dia_gaan_respect_condition;
	information = dia_gaan_respect_info;
	permanent = TRUE;
	description = "Я хочу бросить Фальку вызов.";
};


func int dia_gaan_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GAAN_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void dia_gaan_respect_info()
{
	AI_Output(other,self,"DIA_Gaan_Respect_01_00");	//Я хочу бросить Фальку вызов.
	AI_Output(self,other,"DIA_Gaan_Respect_01_01");	//А что ты хочешь от меня?
	AI_Output(other,self,"DIA_Gaan_Respect_01_02");	//Мне нужно заручиться поддержкой большинства охотников, поэтому я и обратился к тебе.
	AI_Output(other,self,"DIA_Gaan_Respect_01_03");	//Что ты скажешь насчет моей просьбы?
	AI_Output(self,other,"DIA_Gaan_Respect_01_04");	//Ты хочешь получить мой голос?

	if(MIS_Gaan_Snapper == LOG_SUCCESS)
	{
		Info_ClearChoices(dia_gaan_respect);
		Info_AddChoice(dia_gaan_respect,"Да!",dia_gaan_respect_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_Respect_01_05");	//Ты мне еще ничем не помог. Не вижу причин помогать тебе.
		AI_Output(other,self,"DIA_Gaan_Respect_01_06");	//Хорошо!
	};
};

func void dia_gaan_respect_yes()
{
	AI_Output(other,self,"DIA_Gaan_Respect_Yes_01_00");	//Да!
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_01");	//Хм...(задумчиво) Ну что же! Ты убил фыркающую тварь.
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_02");	//Ты, действительно, хороший охотник.
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_03");	//Если Фальк спросит меня, то я проголосую за тебя.
	Info_ClearChoices(dia_gaan_respect);
	AI_StopProcessInfos(self);
	GAAN_RESPECT = TRUE;
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	B_LogEntry(TOPIC_HUNTERSWORK,"Охотник Гаан проголосует за меня если я захочу вызвать Фалька на охотничий поединок");
};

instance DIA_Addon_Gaan_WhatHappen(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = DIA_Addon_Gaan_WhatHappen_Condition;
	information = DIA_Addon_Gaan_WhatHappen_Info;
	description = "Что здесь произошло?";
};

func int DIA_Addon_Gaan_WhatHappen_Condition()
{
	if((Kapitel >= 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_WhatHappen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_00");	//Что здесь произошло?
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_01");	//Жуткие вещи, приятель...(нервно) Я до сих не могу придти в себя.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_02");	//Лучше возьми себя в руки и расскажи мне обо всем.
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_03");	//В общем...(вздыхая) На паладинов, что охраняли проход в Долину Рудников, напали какие то маги в черных одеждах.
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_04");	//Паладины храбро сражались, но этих магов было слишком много! 
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_05");	//А после того, как паладины пали замертво, все они направились по направлению в город.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_06");	//Сколько их было?!
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_07");	//Около десятка! Но точно сказать не могу.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_08");	//Ясно.
};