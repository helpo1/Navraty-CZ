var int ThorbenElzaDay;
var int ThorbenOnWork;

instance DIA_Thorben_EXIT(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 999;
	condition = DIA_Thorben_EXIT_Condition;
	information = DIA_Thorben_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_NO_TALK(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = dia_thorben_no_talk_condition;
	information = dia_thorben_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_thorben_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_PICKPOCKET(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 900;
	condition = DIA_Thorben_PICKPOCKET_Condition;
	information = DIA_Thorben_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thorben_PICKPOCKET_Condition()
{
	return C_Beklauen(30,28);
};

func void DIA_Thorben_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,Dialog_Back,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

instance DIA_Thorben_angepisst(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_angepisst_Condition;
	information = DIA_Thorben_angepisst_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_angepisst_Condition()
{
	if(Npc_IsDead(Gritta) && Npc_IsInState(self,ZS_Talk) && (GRITTAMUSTISDEAD == FALSE) && (GRITTAMEDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_angepisst_Info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Ты убил мою Гритту. Я никогда не прощу тебя. Прочь с глаз моих, убийца!
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_NoTalkAtAll(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_NoTalkAtAll_Condition;
	information = DIA_Thorben_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thorben_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_NoTalkAtAll_Info()
{
	AI_Output(self,other,"DIA_Thorben_NoTalkAtAll_12_00");	//Ты чего здесь забыл?! Вон отсюда.
	AI_StopProcessInfos(self);
};

instance DIA_Thorben_Hallo(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hallo_Condition;
	information = DIA_Thorben_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thorben_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ах! Новое лицо. Ты ведь не из Хориниса, да?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Сейчас не лучшее время для путешествий. Бандиты повсюду, работы нет, а теперь еще и фермеры восстали.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Каким ветром тебя сюда занесло?
};

instance DIA_Thorben_Arbeit(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Arbeit_Condition;
	information = DIA_Thorben_Arbeit_Info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int DIA_Thorben_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Я ищу работу.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Ты что-нибудь знаешь о плотницком деле?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Единственное, что я могу получить из дерева, - это огонь.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//А что насчет замков?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Нуууу...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Извини, но я не могу взять тебя, если ты ничего не понимаешь в моем ремесле.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//И у меня нет денег, чтобы платить ученику.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Торбен не примет меня в ученики.");
};


instance DIA_Thorben_OtherMasters(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_OtherMasters_Condition;
	information = DIA_Thorben_OtherMasters_Info;
	permanent = FALSE;
	description = "А что если я поступлю в ученики к одному из других здешних мастеров?";
};


func int DIA_Thorben_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//А что если я поступлю в ученики к одному из других здешних мастеров?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Хорошо, я дам свое одобрение.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Но тебе нужно сначала получить благословение богов.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Скажи, ты верующий человек?
	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL) && (other.guild != GIL_KDW) && (other.guild != GIL_NDW) && (other.guild != GIL_KDM) && (other.guild != GIL_NDM))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters,"Ну, если ты это имеешь в виду, я регулярно молюсь...",DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice(DIA_Thorben_OtherMasters,"Да. Я образцовый верующий, мастер Торбен.",DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Тогда иди к Ватрасу, жрецу Аданоса, пусть он даст тебе благословение.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//Он также подскажет тебе, где найти жреца Инноса. Ты должен получить и его благословение.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//А когда ты получишь благословение богов, Я проголосую за тебя.
	MIS_Thorben_GetBlessings = LOG_Running;
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_Running);
	B_LogEntry(TOPIC_Thorben,"Торбен даст мне свое одобрение, если жрец Аданоса и жрец Инноса дадут мне свое благословение.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Да. Я образцовый верующий, мастер Торбен.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//Ну, если ты это имеешь в виду, я регулярно молюсь...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Понимаю!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Человек, который занимается ремеслом без благословения богов, никогда не получит моего одобрения.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Проси богов о прощении твоих прегрешений.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};


instance DIA_Thorben_ZUSTIMMUNG(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_ZUSTIMMUNG_Condition;
	information = DIA_Thorben_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Как насчет одобрения, мастер?";
};


func int DIA_Thorben_ZUSTIMMUNG_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (MIS_Thorben_GetBlessings == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thorben_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Как насчет одобрения, мастер?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Ватрас дал тебе благословение?
	if(Vatras_Segen == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Да.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//А благословение жреца Инноса ты получил?

		if((Daron_Segen == TRUE) || (Isgaroth_Segen == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Да, получил.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Тогда ты получишь и мое благословение. Не важно, какому пути ты решил следовать, гордись своим ремеслом, мой мальчик!
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Zustimmung);
			Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
			B_LogEntry(TOPIC_Lehrling,"Торбен даст мне свое одобрение, если я захочу стать учеником.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Нет. Еще нет...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Ты знаешь мои условия. Ты можешь заниматься ремеслом только с благословения богов.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Еще нет...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Тогда я не понимаю, зачем ты опять пришел ко мне. Ты знаешь мои условия.
	};
};


instance DIA_Thorben_Locksmith(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Locksmith_Condition;
	information = DIA_Thorben_Locksmith_Info;
	permanent = FALSE;
	description = "Так ты разбираешься в замках?";
};


func int DIA_Thorben_Locksmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Так ты разбираешься в замках?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Какой смысл в хорошем сундуке без хорошего замка?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Я делаю свои собственные замки. Так, по крайней мере, я могу быть уверен, что не делаю сундуки, которые ни от чего не защищают.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Плохо сделанный замок легко сломать. А в Хоринисе очень много воров. Особенно в последнее время!
};


instance DIA_Thorben_Schuldenbuch(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Schuldenbuch_Condition;
	information = DIA_Thorben_Schuldenbuch_Info;
	permanent = FALSE;
	description = "У меня есть гроссбух Лемара.";
};


func int DIA_Thorben_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Schuldenbuch_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//У меня есть гроссбух Лемара.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//Где ты взял его?..(подозрительно) 
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Тебя должно интересовать не где я взял его, а то, что в нем записано твое имя.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Дай его сюда!
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//А что ты готов дать за него?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//У меня нет денег. Но ты можешь рассчитывать на мою сердечную благодарность.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	THORBENCANTEACH = TRUE;
};

instance DIA_Thorben_PleaseTeach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_PleaseTeach_Condition;
	information = DIA_Thorben_PleaseTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня вскрывать замки отмычками?";
};

func int DIA_Thorben_PleaseTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith) && (Thorben_TeachPlayer == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	var int karmainnos;
	karmainnos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Можешь научить меня взламывать замки?

	if(THORBENCANTEACH == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Если бы не ты, я бы всю свою жизнь отдавал долги Лемару.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Я научу тебя всему, чему хочешь.
		Thorben_TeachPlayer = TRUE;
	}
	else if((Player_IsApprentice > APP_NONE) && (karmainnos >= 10))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_20");	//Ты стал учеником у одного из мастеров..
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_21");	//Ты почитаешь наших богов, и Иннос благоволит к тебе.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Я научу тебя всему, что захочешь.
		Thorben_TeachPlayer = TRUE;
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_21");	//Ты почитаешь наших богов, и Иннос благоволит к тебе.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Я научу тебя всему, что захочешь.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		if(THORBENFIRSTREFUSETALK == FALSE)
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Хмм... не знаю, могу ли тебе доверять.
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//В конце выясниться, что ты один из бродяг, которые приходят в город лишь для того, чтобы очистить сундуки честных горожан.
			THORBENFIRSTREFUSETALK = TRUE;
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Я ничему не буду учить тебя, пока не буду уверен, что ты честный человек.

		if((GRITTADEALOK == TRUE) && (THORBENFIRSTREFUSE == FALSE))
		{
			AI_Output(other,self,"DIA_Thorben_PleaseTeach_06_14");	//Но ведь я уже помог тебе один раз, отдав долг Гритты! Или это уже не в счет?
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_15");	//Извини, но, боюсь, этого мало. Мне нужно больше уверенности, чтобы начать доверять тебе.
			AI_Output(other,self,"DIA_Thorben_PleaseTeach_06_16");	//Хммм. Ну ладно.
			THORBENFIRSTREFUSE = TRUE;
		};
	};
};

instance DIA_Thorben_Teach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Teach_Condition;
	information = DIA_Thorben_Teach_Info;
	permanent = TRUE;
	description = "Научи меня взламывать замки.";
};

func int DIA_Thorben_Teach_Condition()
{
	if((Thorben_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Научи меня вскрывать замки.
	Info_ClearChoices(DIA_Thorben_Teach);
	Info_AddChoice(DIA_Thorben_Teach,Dialog_Back,DIA_Thorben_Teach_Back);
	Info_AddChoice(DIA_Thorben_Teach,b_buildlearnstringforthief("Взлом замков",B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1)),DIA_Thorben_Teach_PICKLOCK);
};

func void DIA_Thorben_Teach_Back()
{
	Info_ClearChoices(DIA_Thorben_Teach);
};

func void DIA_Thorben_Teach_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Все, что тебе нужно - это отмычка. Если ты будешь осторожно поворачивать ее влево и вправо в замке, ты сможешь вскрыть его.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Но если ты будешь вращать отмычку слишком сильно или слишком быстро в неправильном направлении, она сломается.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Чем более опытным ты будешь становиться, тем меньше отмычек тебе понадобится. Вот, пожалуй, и все, что тебе нужно знать.
	};

	Info_ClearChoices(DIA_Thorben_Teach);
};

instance DIA_Thorben_SellTree(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_SellTree_Condition;
	information = DIA_Thorben_SellTree_Info;
	permanent = FALSE;
	description = "У тебя есть древесные заготовки?";
};

func int DIA_Thorben_SellTree_Condition()
{
	if(TorbenSellWood == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thorben_SellTree_Info()
{
	AI_Output(other,self,"DIA_Thorben_SellTree_01_00");	//У тебя есть древесные заготовки?
	AI_Output(self,other,"DIA_Thorben_SellTree_01_01");	//Конечно! Иначе из чего я, по-твоему, мастерю мебель?
	AI_Output(other,self,"DIA_Thorben_SellTree_01_02");	//А ты не мог бы продать мне их?
	AI_Output(self,other,"DIA_Thorben_SellTree_01_03");	//Думаю, да. Лишнее золото мне сейчас не помешает.
	TorbenSellWoodDone = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Торбен сможет продать мне древесину различной породы.");	
};

var int ThorbenPicklockFT;
var int TorbenFirstTree;

instance DIA_Thorben_TRADE_TREE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_TREE_Condition;
	information = DIA_Thorben_TRADE_TREE_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Thorben_TRADE_TREE_Condition()
{
	if((TorbenSellWoodDone == TRUE) && Wld_IsTime(6,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_TREE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Покажи мне свои товары.

	if(Dietrichgeben_Trd == FALSE)
	{
		if(Npc_HasItems(self,ItKE_lockpick) == 0) 
		{
			CreateInvItems(self,ItKE_lockpick,10);
		};

		CreateInvItems(self,ItMi_JustTree,15);
		CreateInvItems(self,ItMi_EveTree,10);
		CreateInvItems(self,ItMi_VyzTree,5);
		CreateInvItems(self,ItMi_YsuoTree,5);
		CreateInvItems(self,ItMi_BokTree,5);
		CreateInvItems(self,ItMi_Pliers,1);
		CreateInvItems(self,ItMi_Pitch,10);
		Dietrichgeben_Trd = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Thorben_TRADE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_Condition;
	information = DIA_Thorben_TRADE_Info;
	permanent = TRUE;
	description = "Ты можешь продать мне отмычки?";
	trade = TRUE;
};

func int DIA_Thorben_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Thorben_Locksmith) == TRUE) && (TorbenSellWoodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Ты можешь продать мне отмычки?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Если еще остались...

		if(ThorbenPicklockFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"Плотник Торбен продает отмычки.");
			ThorbenPicklockFT = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//Хорошо! Но они ничем не помогут тебе, пока ты не научишься пользоваться ими.

		if(ThorbenPicklockFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"Плотник Торбен продает отмычки.");
			ThorbenPicklockFT = TRUE;
		};
	};
	if((Npc_HasItems(self,ItKE_lockpick) == 0) && (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self,ItKE_lockpick,25);
		Dietrichgeben = Dietrichgeben + 1;
	};
};

instance DIA_Addon_Thorben_MissingPeople(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Addon_Thorben_MissingPeople_Condition;
	information = DIA_Addon_Thorben_MissingPeople_Info;
	description = "У тебя раньше был ученик?";
};


func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (SC_HearedAboutMissingPeople == TRUE) && (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//У тебя раньше был ученик?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Да, и совсем недавно.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//И что случилось?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Его имя Элврих. Он мой племянник.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Я был им очень доволен, но однажды он просто взял и не пришел на работу.
	MIS_Thorben_BringElvrichBack = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Элврих, ученик плотника Торбена, пропал.");
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,Dialog_Back,DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Ты не обращался к ополчению?",DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Как давно его не было?",DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"И где же Элврих сейчас?",DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Как давно его не было?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Около двух недель.
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//И где же Элврих сейчас?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//Откуда мне знать? В последнее время он частенько появлялся у этого грязного борделя в порту.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Не удивлюсь, если он и сейчас развлекается в постели с какой-нибудь шлюхой.
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Ты не обращался к ополчению?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Обращался, конечно. Я попросил их поймать этого лентяя и проследить, чтобы он вернулся на работу. Но я уже об этом жалею.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//Пусть делает все, что хочет. Рано или поздно он поймет, что без достойной работы в Хоринисе делать нечего.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(цинично) Неужели?
};


instance DIA_Addon_Thorben_ElvrichIsBack(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information = DIA_Addon_Thorben_ElvrichIsBack_Info;
	description = "Элврих снова будет на тебя работать.";
};


func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && (Npc_IsDead(Elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Элврих снова будет на тебя работать.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Будем надеяться, что он больше не будет убегать, как только очередная девка покрутит задницей перед его носом.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Возьми это золото в качестве награды за возвращение ученика.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};


instance DIA_Thorben_Paladine(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Paladine_Condition;
	information = DIA_Thorben_Paladine_Info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int DIA_Thorben_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Немногое. Они прибыли на корабле с материка две недели назад.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//С тех пор, они заперлись в верхнем квартале города.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Никто толком не знает, зачем они прибыли.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Многие опасаются нападения орков.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//А я думаю, что они здесь, чтобы подавить восстание фермеров.
};


instance DIA_Thorben_Bauernaufstand(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Bauernaufstand_Condition;
	information = DIA_Thorben_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о восстании фермеров?";
};


func int DIA_Thorben_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Ты знаешь что-нибудь о восстании фермеров?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Ходят слухи, что Онар нанял наемников, чтобы стряхнуть со своей шеи королевские войска.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Он, вероятно, устал отдавать весь свой урожай паладинам и ополчению.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Ну а в городе после этого стали расти цены на продовольствие.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Ферма Онара находится далеко на восток отсюда. Мы не знаем, были там сражения или нет.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Если ты хочешь узнать больше, поспрашивай торговцев на рыночной пощади. Они лучше знают обстановку на острове чем я.
};


instance DIA_Thorben_Gritta(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_Gritta_Condition;
	information = DIA_Thorben_Gritta_Info;
	permanent = FALSE;
	description = "Я насчет Гритты...";
};


func int DIA_Thorben_Gritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Я насчет Гритты...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Моей племянницы? Какое тебе дело до нее? Это насчет долга, да?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Она должна сто золотых торговцу Маттео.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Скажи мне, что это не так! С тех пор, как она живет со мной, от нее одни проблемы!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Она задолжала почти всем торговцам города.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Мне пришлось занять двести золотых у ростовщика Лемара, чтобы расплатиться с ее долгами! И вот теперь опять!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Гритта должна быть в доме.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Иди, поговори с ней. Но я скажу тебе честно: у нее нет ни ОДНОЙ золотой монеты.
	if(Npc_HasItems(Gritta,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Посмотрим...
	};
};


instance DIA_Thorben_GrittaHatteGold(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_GrittaHatteGold_Condition;
	information = DIA_Thorben_GrittaHatteGold_Info;
	permanent = FALSE;
	description = "У твоей племянницы было сто золотых монет.";
};


func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Gritta) && (Npc_HasItems(Gritta,ItMi_Gold) < 100) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//У твоей племянницы было сто золотых монет.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//ЧТО? Ах она змея - это было МОЕ золото! Она взяла его из моего сундука.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Отдай мне его! Я должен сначала заплатить Лемару. Маттео может подождать!
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Я уже отдал деньги Маттео!",DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Нет! Маттео получит свои деньги назад.",DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Вот твое золото.",DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if(Gritta_GoldGiven == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//И, насколько я знаю эту гадюку, я уверен, что она побежит прямо к стражникам и обвинит тебя тоже!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Я должен уладить этот вопрос.
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Я уже отдал золото Маттео!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Черт! Ну ладно, долг есть долг. По крайней мере, ты не присвоил это золото. Думаю, мне нужно поблагодарить тебя за это.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Нет. Маттео получит свои деньги назад.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Ты просто убиваешь меня. Лемар не отличается великодушием, когда дело доходит до долгов.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Но, по крайней мере, ты расплатишься с долгами моей племянницы. Думаю, мне нужно поблагодарить тебя за это.
	B_Thorben_DeletePetzCrimeGritta();
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Спасибо! Теперь, у меня есть хотя бы часть денег, которые я должен Лемару.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Не могу поверить, что у нее хватило наглости взять мое золото!
	B_Thorben_DeletePetzCrimeGritta();
	Thorben_GotGold = TRUE;
	GRITTADEALOK = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};


instance DIA_THORBEN_HOWLIFE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_howlife_condition;
	information = dia_thorben_howlife_info;
	permanent = TRUE;
	description = "Как жизнь?";
};


func int dia_thorben_howlife_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_howlife_info()
{
	AI_Output(other,self,"DIA_Thorben_HowLife_01_00");	//Как жизнь?
	if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_01");	//(улыбается) Хорошо.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_02");	//С тех пор как вернулся Элврих, мои дела пошли в гору.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_04");	//Да и Гритту теперь не узнать!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_05");	//После того случая с бандитами она, кажется, стала серьезнее относиться к жизни.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_08");	//Неплохо.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_09");	//Конечно, с тех пор, как вернулся Элврих, мои дела стали немного лучше.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_10");	//Однако я очень переживаю за Гритту. (нервно) Бедная моя девочка!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_SUCCESS) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_13");	//Ужасно!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_14");	//Конечно, с тех пор, как вернулся Элврих , мои дела стали немного лучше.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_15");	//Но все это меркнет по сравнению со смертью Гритты. (убит горем) Бедная моя девочка!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_16");	//Никогда себе этого не прощу! Это я виноват - это все из-за меня...
		AI_StopProcessInfos(self);
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_17");	//(уныло) Могло быть и лучше.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_18");	//Дела мои идут не очень хорошо - мне сильно не достает помощи моего ученика Элвриха.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_19");	//Единственное, что меня радует, - это Гритта.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_20");	//После того случая с бандитами, кажется, она очень сильно изменилась, и стала серьезнее относиться к жизни.
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_24");	//Паршиво!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_25");	//Дела мои идут не очень хорошо - мне сильно не достает помощи моего ученика Элвриха.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_26");	//Но больше всего я переживаю за Гритту. Бедная моя девочка!
	}
	else if((MIS_Thorben_BringElvrichBack == LOG_Running) && (GRITTAISDEAD == TRUE))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_29");	//Ужасно!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_30");	//Дела мои идут не очень хорошо - мне сильно не достает помощи моего ученика Элвриха.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_31");	//Но все это меркнет по сравнению со смертью Гритты. (убит горем) Бедная моя девочка!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_32");	//Никогда себе этого не прощу! Это я виноват - это все из-за меня...
		AI_StopProcessInfos(self);
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_33");	//(уныло) Могло быть и лучше. 
		AI_Output(self,other,"DIA_Thorben_HowLife_01_34");	//Дела мои идут совсем плохо - даже и говорить об этом не хочется.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_35");	//Единственное, что меня радует, - это Гритта.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_36");	//После того случая с бандитами, кажется, она очень сильно изменилась, и стала серьезнее относиться к жизни.
	}
	else if((GRITTAISDEAD == FALSE) && (MIS_MISSGRITTA == LOG_Running))
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_40");	//(отчаянно) Хуже и быть не может. 
		AI_Output(self,other,"DIA_Thorben_HowLife_01_41");	//Дела мои идут совсем плохо - даже и говорить об этом не хочется.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_42");	//Но больше всего я переживаю за Гритту. Бедная моя девочка!
	}
	else if(GRITTAISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_45");	//Ужасно!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_46");	//Дела мои идут совсем плохо - даже и говорить об этом не хочется.
		AI_Output(self,other,"DIA_Thorben_HowLife_01_47");	//Но все это меркнет по сравнению со смертью Гритты. (убит горем) Бедная моя девочка!
		AI_Output(self,other,"DIA_Thorben_HowLife_01_48");	//Никогда себе этого не прощу! Это я виноват - это все из-за меня...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_HowLife_01_49");	//(печально) Эх. Лучше не спрашивай - одни расcтройства.
	};
};


instance DIA_THORBEN_MISSGRITTANEWS(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgrittanews_condition;
	information = dia_thorben_missgrittanews_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_missgrittanews_condition()
{
	if(!Npc_IsDead(Gritta) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void dia_thorben_missgrittanews_info()
{
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_00");	//Эй, постой!
	AI_Output(other,self,"DIA_Thorben_MissGrittaNews_01_01");	//В чем дело?
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_02");	//(смущенно) Прости, что побеспокоил тебя.
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_03");	//Скажи, пожалуйста, тебе в городе нигде не попадалась на глаза моя племянница Гритта?
	AI_Output(other,self,"DIA_Thorben_MissGrittaNews_01_04");	//Нет, я не встречал ее.
	AI_Output(self,other,"DIA_Thorben_MissGrittaNews_01_05");	//(печально) Понятно.
};


instance DIA_THORBEN_MISSGRITTA(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_missgritta_condition;
	information = dia_thorben_missgritta_info;
	permanent = FALSE;
	description = "У тебя все в порядке?";
};


func int dia_thorben_missgritta_condition()
{
	if(!Npc_IsDead(Gritta) && (Kapitel >= 2) && Npc_KnowsInfo(hero,dia_thorben_missgrittanews))
	{
		return TRUE;
	};
};

func void dia_thorben_missgritta_info()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_00");	//У тебя все в порядке?
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_01");	//Мне кажется, ты выглядишь немного обеспокоенным.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_02");	//(грустно) Да... моя племянница Гритта... она куда-то пропала!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_04");	//Стражники говорят, что вчера видели, как она вышла за ворота поговорить с каким-то торговцем.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_05");	//А потом пошла с ним в лес и больше не возвращалась.
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_09");	//Может, это был вовсе не торговец?
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_12");	//В округе все просто кишит бандитами, не говоря уже о волках и прочих опасных тварях. И я не думаю, что какой-то торговец стал бы покидать город.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_13");	//О Иннос! (в панике) Неужели ты думаешь, что это были бандиты? Ее похитили?!
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_14");	//Все возможно. Тем более что в последнее время в Хоринисе постоянно пропадают люди.
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_19");	//Что же теперь делать? Стражники даже пальцем не пошевелят, если им не заплатить!
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_21");	//А я всего лишь бедный плотник.
	AI_Output(other,self,"DIA_Thorben_MissGritta_01_22");	//Может, тогда я смогу помочь?
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_23");	//Ты? (удивленно) Ты дашь мне золото?
	AI_Output(self,other,"DIA_Thorben_MissGritta_01_25");	//(задумчиво) Думаю, стражники попросят за свою помощь не меньше пятиста монет.
	Info_ClearChoices(dia_thorben_missgritta);
	Info_AddChoice(dia_thorben_missgritta,"Лучше я сам займусь поиском Гритты.",dia_thorben_missgritta_help);
	Info_AddChoice(dia_thorben_missgritta,"Это слишком много.",dia_thorben_missgritta_no);
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_thorben_missgritta,"Хорошо! Я дам тебе пятьсот монет.",dia_thorben_missgritta_ok);
	};
};

func void dia_thorben_missgritta_help()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_Help_01_00");	//Лучше я сам займусь поиском Гритты.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_01");	//(удивленно) Ты? Хорошо, только поторопись!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_03");	//Если она действительно попала в руки бандитов, я даже и представить боюсь, что с ней может случиться!
	AI_Output(other,self,"DIA_Thorben_MissGritta_Help_01_05");	//Где, ты говоришь, Гритту видели в последний раз?
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_06");	//Около южных ворот, оттуда прямая дорога на ферму Лобарта.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Help_01_08");	//Сообщи мне все, что узнаешь.
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	MIS_MISSGRITTA = LOG_Running;
	GRITTACANFOUND = TRUE;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry(TOPIC_MISSGRITTA,"У плотника Торбена пропала племянница Гритта. Она встречалась с торговцем, который обещал ей продать ткань, а потом отправилась с ним лес. С тех пор прошло несколько дней, а Гритта до сих пор не вернулась домой. Я вызвался помочь Торбену найти его племянницу. Последний раз ее видели у южных ворот города.");
	Info_ClearChoices(dia_thorben_missgritta);
};

func void dia_thorben_missgritta_ok()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Thorben_MissGritta_Ok_01_00");	//Хорошо! Я дам тебе пятьсот монет.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_03");	//Благослови тебя Иннос! Я от всей души благодарю тебя!
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_04");	//Теперь я смогу заплатить стражникам, и они найдут мою Гритту.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_06");	//Постой! Не уходи так быстро - я хочу тебя отблагодарить за твою помощь.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_08");	//Вот, возьми эти отмычки.
	AI_Output(self,other,"DIA_Thorben_MissGritta_Ok_01_09");	//Думаю, тебе они наверняка будут полезны.
	B_GiveInvItems(self,other,ItKE_lockpick,20);
	AI_Output(other,self,"DIA_Thorben_MissGritta_Ok_01_10");	//Спасибо!
	GRITTAMUSTNOTDEAD = TRUE;
	MIS_MISSGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_MISSGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_Running);
	B_LogEntry(TOPIC_MISSGRITTA,"У плотника Торбена пропала племянница Гритта. Она встречалась с торговцем, который обещал ей продать ткань, а потом отправилась с ним лес. С тех пор прошло несколько дней, а Гритта до сих пор не вернулась домой. Я дал Торбену пятьсот золотых для городской стражи, чтобы те занялись поиском Гритты.");
	Info_ClearChoices(dia_thorben_missgritta);
	Npc_ExchangeRoutine(VLK_462_Thorben,"GoAndre");
};

func void dia_thorben_missgritta_no()
{
	AI_Output(other,self,"DIA_Thorben_MissGritta_No_01_00");	//Это слишком много.
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_02");	//Я понимаю. (печально) Ладно, постараюсь сам найти эти деньги.
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_03");	//И надеюсь, до этого времени с моей девочкой ничего не случится.
	AI_Output(self,other,"DIA_Thorben_MissGritta_No_01_04");	//Эх...(грустно вздыхает)
	B_KillNpc(gobbo_mage_gr1);
	B_KillNpc(gobbo_mage_gr2);
	B_KillNpc(gobbo_mage_gr3);
	B_KillNpc(gobbo_mage_gr4);
	B_KillNpc(gobbo_mage_gr5);
	CreateInvItems(Gritta,itri_grittasring,1);
	Npc_ExchangeRoutine(VLK_418_Gritta,"MissGr");
	AI_Teleport(Gritta,"NW_CITY_GRITTA_MISS_01");
	B_KillNpc(Gritta);
	Wld_InsertNpc(bdt_6140_grittashunt0,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(bdt_6141_grittashunt1,"NW_CITY_GRITTA_MISS_HUNT_02");
	Wld_InsertNpc(bdt_6142_grittashunt2,"NW_CITY_GRITTA_MISS_HUNT_03");
	Wld_InsertNpc(bdt_6143_grittashunt3,"NW_CITY_GRITTA_MISS_HUNT_04");
	Wld_InsertNpc(bdt_6144_grittashunt4,"NW_CITY_GRITTA_MISS_HUNT_05");
	GRITTAMUSTISDEAD = TRUE;
	Info_ClearChoices(dia_thorben_missgritta);
};


instance DIA_THORBEN_GRITTAISBACK(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisback_condition;
	information = dia_thorben_grittaisback_info;
	permanent = FALSE;
	description = "С Гриттой все в порядке?";
};


func int dia_thorben_grittaisback_condition()
{
	if(!Npc_IsDead(Gritta) && (GRITTAISBACK == TRUE) && (MIS_MISSGRITTA == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisback_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaIsBack_01_00");	//С Гриттой все в порядке?
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_01");	//Да, слава Инносу - она вернулась!
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == FALSE))
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_02");	//Я от всей души благодарю тебя!
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_07");	//К сожалению, я не слишком богат, и не могу отблагодарить тебя золотом.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_08");	//Поэтому лучше я покажу тебе, как более ловко управляться с разными типами замков.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_09");	//Смотри, это не так уж и сложно. Готов?
		Info_ClearChoices(dia_thorben_grittaisback);
		Info_AddChoice(dia_thorben_grittaisback,"Я готов.",dia_thorben_grittaisback_teach);
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry(TOPIC_MISSGRITTA,"Гритта вернулась домой.");
	}
	else if((MIS_MISSGRITTA == LOG_Running) && (GRITTAMUSTNOTDEAD == TRUE))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_10");	//Я заплатил стражникам, и они отправились на ее поиски.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_11");	//А через пару дней уже вернулись с Гриттой.
		AI_Output(self,other,"DIA_Thorben_GrittaIsBack_01_15");	//Прими от меня мою искреннюю благодарность. Спасибо тебе!
		MIS_MISSGRITTA = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MISSGRITTA,LOG_SUCCESS);
		B_LogEntry(TOPIC_MISSGRITTA,"Гритта вернулась домой.");
	};
};

func void dia_thorben_grittaisback_teach()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,1);
	AI_Output(other,self,"DIA_Thorben_GrittaIsBack_Teach_01_00");	//Я готов.
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_01");	//Прежде всего, нужно следить за тем, чтобы не сломать отмычку.
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_02");	//Когда поднаберешься опыта, начнешь чувствовать момент, когда отмычка готова вот-вот сломаться. Тогда у нее и звук меняется.
	AI_Output(self,other,"DIA_Thorben_GrittaIsBack_Teach_01_03");	//Думаю, у тебя получится. Приучай себя вслушиваться в тихое пощелкивание замка, и в будущем ты сбережешь себе кучу отмычек.
};


instance DIA_THORBEN_GRITTAISDEAD(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = dia_thorben_grittaisdead_condition;
	information = dia_thorben_grittaisdead_info;
	permanent = TRUE;
	description = "Гритта не вернется.";
};


func int dia_thorben_grittaisdead_condition()
{
	if((GRITTAFOUNDISDEAD == TRUE) && (GRITTAISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorben_grittaisdead_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_00");	//Гритта не вернется.
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_01");	//(испуганно) Что?! Почему?
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_02");	//Я нашел ее тело в лесу. Она мертва.
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_03");	//Но... Но кто это сделал? (растерянно) Кто убил мою девочку?
	AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_04");	//Это были бандиты.
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_05");	//Нет! Этого просто не может быть! Я тебе не верю!
	AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_06");	//Это не может быть правдой! Ты обманываешь меня!
	if(Npc_HasItems(other,itri_grittasring) >= 1)
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_Thorben_GrittaIsDead_01_07");	//Вот, я нашел при ней это кольцо.
		B_GiveInvItems(other,self,itri_grittasring,1);
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_08");	//О боже, нет! (дрожащим голосом) Это же ее обручальное кольцо.
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_10");	//Так значит...(растерянно) О нет! Я не могу в это поверить!
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_12");	//О Иннос, за что мне все это?
		AI_Output(self,other,"DIA_Thorben_GrittaIsDead_01_15");	//Это я во всем виноват! Мне нет оправдания...
		GRITTAISDEAD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTA(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgritta_condition;
	information = dia_addon_thorben_elvrichgritta_info;
	permanent = FALSE;
	description = "Как поживает Элврих?!";
};


func int dia_addon_thorben_elvrichgritta_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((Npc_IsDead(Elvrich) == FALSE) && (Npc_IsDead(Gritta) == FALSE) && (MIS_FINDLOSTHUSB == LOG_SUCCESS) && (MIS_LuciasLetter == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == TRUE) && (ELVRIHMARRYGRITTATIMER < (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgritta_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_00");	//Как поживает Элврих?
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_01");	//Пока все вроде нормально.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Мне остается только надеяться, что он не испарится опять после первого же взгляда на женскую юбку.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_03");	//Эх... Женить бы его!
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_04");	//Мне кажется, что и Гритте тоже не помешало бы найти нового мужа.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_07");	//(задумчиво) Точно. Из них бы действительно вышла хорошая пара.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_11");	//Только... как же мне свести их вместе?
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_01_12");	//Просто поговори с ними.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_13");	//Это, конечно, можно. Вот только, боюсь, они меня и слушать не станут.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_15");	//Тут нужно слова какие-нибудь особые подбирать...
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_01_17");	//Может, ты сам с ними поговоришь?
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
	Info_AddChoice(dia_addon_thorben_elvrichgritta,"Почему бы и нет?",dia_addon_thorben_elvrichgritta_help);
	Info_AddChoice(dia_addon_thorben_elvrichgritta,"Нет, это все не для меня.",dia_addon_thorben_elvrichgritta_no);
};

func void dia_addon_thorben_elvrichgritta_no()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_No_01_00");	//Нет. Это все не для меня.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_No_01_01");	//Эх. А жаль.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_No_01_02");	//Ладно, попробую как-нибудь сам - надеюсь, у меня получится.
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};

func void dia_addon_thorben_elvrichgritta_help()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGritta_Help_01_00");	//Почему бы и нет? Я поговорю с ними.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGritta_Help_01_01");	//Отлично! Надеюсь, у тебя все получится.
	MIS_ELVRIHMARRYGRITTA = LOG_Running;
	Log_CreateTopic(TOPIC_ELVRIHMARRYGRITTA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_Running);
	B_LogEntry(TOPIC_ELVRIHMARRYGRITTA,"Плотник Торбен задумал поженить свою Гритту и Элвриха. Я вызвался поучаствовать в этом деле свахой.");
	Info_ClearChoices(dia_addon_thorben_elvrichgritta);
};


instance DIA_ADDON_THORBEN_ELVRICHGRITTADONE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichgrittadone_condition;
	information = dia_addon_thorben_elvrichgrittadone_info;
	permanent = FALSE;
	description = "Я поговорил с Элврихом и Гриттой.";
};


func int dia_addon_thorben_elvrichgrittadone_condition()
{
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichgrittadone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGrittaDone_01_00");	//Я поговорил с Элврихом и Гриттой.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_01");	//И как успехи?
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichGrittaDone_01_02");	//Кажется, скоро у Гритты появится новый муж.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_03");	//Неужели?
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichGrittaDone_01_08");	//Спасибо тебе за помощь!
	MIS_ELVRIHMARRYGRITTA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELVRIHMARRYGRITTA,LOG_SUCCESS);
	Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"BackInTheCity");
	Npc_ExchangeRoutine(VLK_418_Gritta,"Start");
};

var int ThorbenDoCrossBow;

instance DIA_Thorben_DoCrossBow(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_DoCrossBow_condition;
	information = DIA_Thorben_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Thorben_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (CrossBowNeedPlotnik == TRUE) && (ThorbenDoCrossBow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_DoCrossBow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Thorben_DoCrossBow_01_02");	//Да, но не сами арбалеты, а только деревянные упоры для них.
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_03");	//А хотя бы этому ты можешь меня научить?
	AI_Output(self,other,"DIA_Thorben_DoCrossBow_01_04");	//Конечно! Но тебе придется заплатить за обучение.
	AI_Output(other,self,"DIA_Thorben_DoCrossBow_01_05");	//Ну, это само собой.
	ThorbenDoCrossBow = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Плотник Торбен сможет показать мне, как сделать деревянный упор для арбалета.");
};

instance DIA_Thorben_MakeUpor(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_MakeUpor_condition;
	information = DIA_Thorben_MakeUpor_info;
	permanent = TRUE;
	description = "Научи меня делать упоры для арбалетов. (Цена: 1500 монет)";
};

func int DIA_Thorben_MakeUpor_condition()
{
	if((ThorbenDoCrossBow == TRUE) && (PlayerTeachCrBowMade == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_MakeUpor_info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Thorben_MakeUpor_01_00");	//Научи меня делать упоры для арбалетов.
	money = 1500;

	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Thorben_MakeUpor_03_90");	//У тебя не хватает золота. Приходи позже.
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= money)
	{
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_01");	//Это очень просто! Берешь большую деревянную заготовку.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_02");	//Потом на верстаке выпиливаешь из нее форму упора и делаешь прорези для крючка и желоба.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_03");	//Ну, а потом уже все остальные металлические части арбалета крепятся к упору на наковальне в кузне.
		AI_Output(self,other,"DIA_Thorben_MakeUpor_01_04");	//Запомнил?
		AI_Output(other,self,"DIA_Thorben_MakeUpor_01_05");	//Конечно.
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		PlayerTeachCrBowMade = TRUE;
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Теперь я умею делать деревянный упор для арбалета.");
	};
};

//----------------ветка Дракии------------------------------------------

instance DIA_Addon_Thorben_TalkAboutElza(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Info;
	permanent = FALSE;
	description = "Ты ведь плотник?";
};

func int DIA_Addon_Thorben_TalkAboutElza_Condition()
{
	if((MIS_OldElza == LOG_Running) && (Npc_HasItems(other,ItMi_ShipShceme) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_01");	//Ты ведь плотник?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_02");	//Вроде как. Но если дела будут идти все также плохо, придется заняться чем-нибудь более прибыльным.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_03");	//Хорошо. У меня как раз для тебя есть одна работенка.
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_04");	//Новый заказ? Отлично! И в чем он заключается?
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_05");	//Вот, тут все написано. 
	B_GiveInvItems(other,self,ItMi_ShipShceme,1);
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_06");	//Хорошо, давай взглянем.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_07");	//Хммм... Похоже на детали для рулевого управления судном. Ты что, строишь корабль?!
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_08");	//Пока нет. Но подумываю над этим. Так что, ты возьмешься за эту работу?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_09");	//Само собой. Хотя это будет непросто. Изготовление этих деталей требует особенной точности и специальных сортов древисины. Кроме этого...
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_01_10");	//Сколько? 
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_01_11");	//Эх... Две тысячи золотых! Возможно, я бы и сделал тебе скидку, но в моем нынешнем положении это было бы непозволительной роскошью.
	B_LogEntry(TOPIC_OldElza,"Плотник Торбен взялся за изготовление деталей для рулевого управления 'Одноглазой Эльзы'. Однако выкатил при этом за работу кругленькую сумму в две тысячи золотых.");
};

instance DIA_Addon_Thorben_TalkAboutElza_Money(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Money_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Money_Info;
	permanent = FALSE;
	description = "Вот твои деньги.";
};

func int DIA_Addon_Thorben_TalkAboutElza_Money_Condition()
{
	if((MIS_OldElza == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Thorben_TalkAboutElza) == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Money_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_01");	//Вот твои деньги. 
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Money_01_02");	//Хорошо. Тогда я приступаю к работе немедленно.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_03");	//Сколько это займет по времени?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Money_01_04");	//Не больше дня! Так что, можешь заглянуть ко мне завтра.
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Money_01_05");	//Договорились. 
	B_LogEntry(TOPIC_OldElza,"Я заплатил Торбену за работу. На изготовление всех деталей у него уйдет не менее дня. Надеюсь, Скип возместит мне потраченные деньги.");
	ThorbenElzaDay = Wld_GetDay();
	ThorbenOnWork = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Thorben_TalkAboutElza_Done(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 13;
	condition = DIA_Addon_Thorben_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Thorben_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = "Как поживает мой заказ?";
};

func int DIA_Addon_Thorben_TalkAboutElza_Done_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_OldElza == LOG_Running) && (ThorbenOnWork == TRUE) && (ThorbenElzaDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_TalkAboutElza_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Done_01_01");	//Как поживает мой заказ?
	AI_Output(self,other,"DIA_Addon_Thorben_TalkAboutElza_Done_01_02");	//Все готово. Можешь его забрать.
	B_GiveInvItems(self,other,ItMi_SkipShipPack,1);
	AI_Output(other,self,"DIA_Addon_Thorben_TalkAboutElza_Done_01_03");	//Благодарю.
	B_LogEntry(TOPIC_OldElza,"Торбен изготовил все детали. Пора их отнести Скипу.");
};