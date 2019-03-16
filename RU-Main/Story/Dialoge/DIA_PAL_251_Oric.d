
instance DIA_Oric_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_HALLO(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_HALLO_Condition;
	information = DIA_Oric_HALLO_Info;
	permanent = FALSE;
	description = "Каковы твои обязанности?";
};


func int DIA_Oric_HALLO_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Oric_HALLO_Info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//Каковы твои обязанности?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//Я офицер-стратег короля, и в настоящее время подчиняюсь достопочтенному командующему Гаронду.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//Мы последние паладины, оставшиеся здесь, в замке. Все остальные ушли либо пали на поле боя.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//Это наш долг, чтобы эта экспедиция завершилась успешно. И мы добьемся этого. Клянусь Инносом - мы добьемся этого.
};


instance DIA_Oric_Bruder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Bruder_Condition;
	information = DIA_Oric_Bruder_Info;
	permanent = FALSE;
	description = "У меня есть известие для тебя.";
};


func int DIA_Oric_Bruder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Bruder_Info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//У меня есть известие для тебя.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//Что за известие?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Твой брат мертв. Он погиб у Прохода.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(бормочет)... мой брат...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Иннос подвергает меня суровым испытаниям. Но он погиб как его слуга...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//Эта новость - стрела, пронзившая мое сердце. Я буду искать новые силы в молитвах.
	OricBruder = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Oric_Statue(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Condition;
	information = DIA_Oric_Statue_Info;
	permanent = FALSE;
	description = "Ты выглядишь немного подавленым.";
};

func int DIA_Oric_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Info()
{
	AI_Output(other,self,"DIA_Oric_Statue_01_00");	//Ты выглядишь немного подавленным.
	AI_Output(self,other,"DIA_Oric_Statue_01_01");	//(мрачно) Неужели это так заметно?
	AI_Output(other,self,"DIA_Oric_Statue_01_02");	//Более чем. Тебя что-то гложет?
	AI_Output(self,other,"DIA_Oric_Statue_01_03");	//Да как сказать? Все бы ничего, но как на зло в этом замке не оказалось ни одной статуи Инноса.
	AI_Output(other,self,"DIA_Oric_Statue_01_04");	//И что с того? Это ведь замок рудных баронов, и вряд ли они пеклись о своей душе.
	AI_Output(self,other,"DIA_Oric_Statue_01_05");	//Как что? Я же паладин! И каждый день должен возносить ему хвалу в своих молитвах.
	AI_Output(self,other,"DIA_Oric_Statue_01_06");	//Все это наполняет мою душу стойкостью, а тело - силой.
	AI_Output(self,other,"DIA_Oric_Statue_01_07");	//А в этом проклятом замке не нашлось даже маленькой статуэтки нашего владыки!
	MIS_OricStatue = LOG_Running;
	Log_CreateTopic(TOPIC_OricStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Running);
	B_LogEntry(TOPIC_OricStatue,"Паладин Орик подавлен тем, что в замке нет ни одной статуи Инноса, и из-за этого он не может молиться.");
};

instance DIA_Oric_Statue_Done(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Done_Condition;
	information = DIA_Oric_Statue_Done_Info;
	permanent = FALSE;
	description = "Вот тебе статуэтка Инноса.";
};

func int DIA_Oric_Statue_Done_Condition()
{
	if((MIS_OricStatue == LOG_Running) && (Npc_HasItems(other,ItMi_InnosStatue) >= 1) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Oric_Statue_Done_01_00");	//Вот тебе статуэтка Инноса.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	AI_Output(self,other,"DIA_Oric_Statue_Done_01_01");	//Ох! Это действительно она! Нужно немедленно продолжить моления, иначе Иннос отвернется от меня.
	AI_Output(self,other,"DIA_Oric_Statue_Done_01_03");	//Ах, извини! Благодарю тебя. Ты просто не представляешь, как это важно для меня.
	AI_Output(other,self,"DIA_Oric_Statue_Done_01_04");	//По тебе это и так видно.
	MIS_OricStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Success);
	B_LogEntry(TOPIC_OricStatue,"Я достал для паладина Орика статуэтку Инноса. Он был просто счастлив.");
};

instance DIA_Oric_ScoutMine(C_Info)
{
	npc = PAL_251_Oric;
	nr = 1;
	condition = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent = FALSE;
	description = "Я отправляюсь к шахтам.";
};

func int DIA_Oric_ScoutMine_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel < 3) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Fajeth_Ore == FALSE) && (Marcos_Ore == FALSE) && (Silvestro_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_ScoutMine_Info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//Я отправляюсь к шахтам.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//Будь острожен. Это нелегкая задача. Прежде всего, найди паладинов. Они возглавляют эти три группы.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//Если тебе нужно больше информации, поговори с Парсивалем.
};


instance DIA_Oric_Perm(C_Info)
{
	npc = PAL_251_Oric;
	nr = 99;
	condition = DIA_Oric_Perm_Condition;
	information = DIA_Oric_Perm_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int DIA_Oric_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Oric_Perm_Info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//Как обстановка?
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//Ты должен найти старателей и выяснить, сколько у них руды. А там будет видно, как и когда мы сможем покинуть эту долину.
	}
	else if(MIS_ScoutMine == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//Ситуация накалилась до предела. Но мы не отступим. Иннос всегда с нами. Он выведет нас из этой долины.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//Твое появление здесь вселяет в нас надежду.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//Ты нужен нам. Иди, поговори с Гарондом - он все объяснит тебе.
	};
};


instance DIA_Oric_KAP3_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP3_EXIT_Condition;
	information = DIA_Oric_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP4_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP4_EXIT_Condition;
	information = DIA_Oric_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_IAmBack(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;
	description = "Я уже вернулся.";
};


func int DIA_Oric_IAmBack_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_IAmBack_Info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//Я уже вернулся.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//Я уже не надеялся, что мы еще когда-нибудь увидим тебя после того, что произошло, когда ты был здесь несколько дней назад.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//Я приветствую тебя от имени нашего ордена.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//Я вижу, ты стал магом. Мое почтение.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//Возможно, твое появление - добрый знак.
};


instance DIA_Oric_CanHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;
	description = "Могу я чем-нибудь помочь?";
};


func int DIA_Oric_CanHelp_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//В настоящий момент, похоже, мы сделали все, что было возможно.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//Впрочем, есть кое-что. Кое-что очень важное, что ты мог бы сделать для нас за пределами этих стен.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//Мы планируем отрубить змею голову.
	Info_ClearChoices(DIA_Oric_CanHelp);
	Info_AddChoice(DIA_Oric_CanHelp,"Я думаю, тебе лучше поискать кого-нибудь еще. ",DIA_Oric_CanHelp_NotYourMan);
	Info_AddChoice(DIA_Oric_CanHelp,"Что ты хочешь этим сказать?",DIA_Oric_CanHelp_WhatYouMean);
};

func void DIA_Oric_CanHelp_NotYourMan()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//Я думаю, тебе лучше поискать кого-нибудь еще.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//Я не могу выделить ни одного человека - ты наша единственная надежда.
};

func void DIA_Oric_CanHelp_WhatYouMean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//Что ты хочешь сказать этим?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//Мы знаем одного из их предводителей. Его зовут Хош-Пак.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//Он один из самых влиятельных шаманов орков.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//А какова в этом моя роль?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Убей его.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//Ты шутишь!?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//Ты единственный, кого мы можем выделить для этого дела. Все остальные рыцари нужны здесь.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//Мне нелегко просить тебя об этом, мастер. Но ты как нельзя лучше подходишь для этого задания.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//Ты ведь хочешь помочь нам, разве нет? Ну, тогда...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Палатка Хош-Пака находится за осадным кругом, на утесе к югу отсюда.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//Ее даже видно из этих окон.
	Info_ClearChoices(DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};


instance DIA_Oric_NeedStuff(C_Info)
{
	npc = PAL_251_Oric;
	nr = 6;
	condition = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;
	description = "Мне нужно снаряжение.";
};


func int DIA_Oric_NeedStuff_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NeedStuff_Info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//Мне нужно снаряжение.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//У нас мало что осталось, чем мы могли бы поделиться с тобой.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//Ну, я могу предложить тебе вот это.
	Info_ClearChoices(DIA_Oric_NeedStuff);
	Info_AddChoice(DIA_Oric_NeedStuff,"или 1 эликсира ловкости",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice(DIA_Oric_NeedStuff,"или 1 эликсира силы",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice(DIA_Oric_NeedStuff,"или 3 эликсира маны",DIA_Oric_NeedStuff_Mana);
	Info_AddChoice(DIA_Oric_NeedStuff,"3 лечебных эликсира",DIA_Oric_NeedStuff_Health);
};

func void DIA_Oric_NeedStuff_Health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//Я возьму эти лечебные зелья.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//Хороший выбор. Надеюсь, они помогут тебе.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//Я возьму эти зелья маны.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//Надеюсь, они помогут тебе. Да хранит тебя Иннос.
	CreateInvItems(self,ItPo_Mana_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//Я возьму эликсир силы.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Вот, он наверняка пригодится тебе. Я желаю тебе удачи.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//Я возьму эликсир ловкости.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//Пусть всегда твои стрелы летят точно в цель. Вот, держи.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};


instance DIA_Oric_NoMurder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 7;
	condition = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;
	description = "Я не буду убивать Хош-Пака таким подлым образом.";
};


func int DIA_Oric_NoMurder_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NoMurder_Info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//Я не буду убивать Хош-Пака таким подлым образом.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Ты хотя бы представляешь себе, насколько тяжело наше положение?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//Нас осаждают превосходящие силы орков. Наши запасы уже на исходе.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//Если мы не сможем доставить эту руду на корабль, орки превратят в руины все наше королевство.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//Все, ради чего мы живем, пойдет прахом.
};


instance DIA_Oric_WillHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent = FALSE;
	description = "Хорошо. Я убью Хош-Пака.";
};


func int DIA_Oric_WillHelp_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_WillHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//Хорошо! Я убью Хош-Пака.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//Я рад слышать это.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Палатка Хош-Пака находится на небольшом утесе. Ты, должно быть, уже видел его раньше.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//Этот утес стоит неподалеку от дороги, ведущей к нашей шахте. В тени огромной горы.
	Log_CreateTopic(TOPIC_KillHoshPak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak,LOG_Running);
	B_LogEntry(TOPIC_KillHoshPak,"Орик хочет, чтобы я убил шамана орков Хош-Пака. Его палатка находится на небольшом утесе недалеко от задней части замка.");
	MIS_KillHoshPak = LOG_Running;
};


instance DIA_ORIC_CANHELPAGAIN(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = dia_oric_canhelpagain_condition;
	information = dia_oric_canhelpagain_info;
	permanent = FALSE;
	description = "У тебя есть еще какие-нибудь идеи?";
};


func int dia_oric_canhelpagain_condition()
{
	if((KAPITELORCATC == FALSE) && (MIS_KillHoshPak == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_oric_canhelpagain_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_01_00");	//У тебя есть для меня какие-нибудь поручения?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_01");	//Да. Однако, полагаю, на это способен только полный безумец.
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_01_02");	//Отлично! В чем оно заключается?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_04");	//(смешок) Насколько мне известно, недалеко от замка расположилось несколько орочьих военачальников.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_05");	//Покуда Хош-Пак был жив, они подчинялись ему. Сейчас же бразды правления всей этой лохматой оравой, что осаждает замок, находятся в их руках.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_01_09");	//Было бы неплохо, если бы их постигла та же участь, что и их лидера.
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain,"Это слишком рискованно!",dia_oric_canhelp_nosorry);
	Info_AddChoice(dia_oric_canhelpagain,"Идея действительно хороша, хоть и безумна.",dia_oric_canhelpagain_stuff);
};

func void dia_oric_canhelp_nosorry()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NoSorry_01_01");	//Это слишком рискованно! Я не согласен.
	AI_Output(self,other,"DIA_Oric_CanHelp_NoSorry_01_02");	//Хммм. Ну что же, это твое решение.
	AI_Output(self,other,"DIA_Oric_CanHelp_NoSorry_01_05");	//(с грустной улыбкой) Придется искать большего безумца. Хотя вряд ли здесь объявится кто-то более ретивый, чем ты, но оставим.
	Info_ClearChoices(dia_oric_canhelpagain);
};

func void dia_oric_canhelpagain_stuff()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_01");	//Идея действительно хороша, хоть и безумна.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_02");	//Значит ты согласен?
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_03");	//Само собой. Однако, как ты сам понимаешь - сделать это будет крайне тяжело.
	if(other.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_04");	//Думаю, мне понадобится снаряжение, не говоря уже о золоте.
		AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_05");	//О золоте можешь не беспокоиться. Ты получишь его.
	}
	else
	{
		AI_Output(other,self,"DIA_Oric_CanHelpAgain_Stuff_01_06");	//Думаю, мне понадобится снаряжение.
		AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_07");	//Отлично, друг! Я знал, что могу положиться на тебя.
	};
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_08");	//Что же касается снаряжения, то вот...(печально) Это наши последние запасы.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Stuff_01_09");	//Бери, что тебе больше всего требуется.
	MIS_KILLOCELITE = LOG_Running;
	Log_CreateTopic(TOPIC_KILLOCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_Running);
	B_LogEntry(TOPIC_KILLOCELITE,"Паладин Орик хочет, чтобы я покончил с четырьмя военачальниками орков, расположившимися недалеко от замка.");
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain,"Взять эликсир ловкости.",dia_oric_canhelpagain_dexterity);
	Info_AddChoice(dia_oric_canhelpagain,"Взять эликсир силы.",dia_oric_canhelpagain_strength);
	Info_AddChoice(dia_oric_canhelpagain,"Взять эликсир духа.",dia_oric_canhelpagain_mana);
	Info_AddChoice(dia_oric_canhelpagain,"Взять эликсир жизни.",dia_oric_canhelpagain_health);
};

func void dia_oric_canhelpagain_health()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Health_15_00");	//Я беру эликсир жизни.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Health_11_01");	//Хороший выбор! Прежде всего, ты должен выжить при выполнении этой непростой миссии.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Health_11_02");	//Теперь иди, и пусть Иннос защитит тебя!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_mana()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Mana_15_00");	//Я беру эликсир духа.
	CreateInvItems(self,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Mana_11_01");	//Хорошо! На крепости духа держатся отвага и героизм, без которых в бою никуда... хотя кому я рассказываю?
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Mana_11_02");	//Да не оставит тебя Иннос без своей поддержки!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_dexterity()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Dexterity_15_00");	//Я беру эликсир ловкости.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Dexterity_11_01");	//Отлично! Чувствую, ты решил разить вражьих предводителей на расстоянии.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Dexterity_11_02");	//Да направит Иннос твои стрелы точно в цель!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_strength()
{
	AI_Output(other,self,"DIA_Oric_CanHelpAgain_Strength_15_00");	//Я беру эликсир силы.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Strength_11_01");	//И это правильно! Орки сильны, но смерть всем им несущий должен быть сильнее.
	AI_Output(self,other,"DIA_Oric_CanHelpAgain_Strength_11_02");	//Да хранит тебя Иннос!
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_WHEREFARROK(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = dia_oric_wherefarrok_condition;
	information = dia_oric_wherefarrok_info;
	permanent = FALSE;
	description = "Где точно находятся эти военачальники?";
};


func int dia_oric_wherefarrok_condition()
{
	if((MIS_KILLOCELITE == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_wherefarrok_info()
{
	AI_Output(other,self,"DIA_Oric_WhereFarrok_11_00");	//Где находятся эти военачальники орков?
	AI_Output(self,other,"DIA_Oric_WhereFarrok_11_01");	//Извини...(с сожалением) Но я сам должным образом не проинформирован.
	AI_Output(self,other,"DIA_Oric_WhereFarrok_11_02");	//Я знаю лишь только то, что их всего четверо. Об их местонахождении мне ничего не известно.
	AI_Output(other,self,"DIA_Oric_WhereFarrok_11_03");	//Ладно, я посмотрю что можно сделать.
};


instance DIA_ORIC_FARROKDEAD(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_farrokdead_condition;
	information = dia_oric_farrokdead_info;
	permanent = FALSE;
	description = "С военачальниками орков покончено!";
};


func int dia_oric_farrokdead_condition()
{
	if((MIS_KILLOCELITE == LOG_Running) && (KAPITELORCATC == FALSE) && (ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
	{
		return TRUE;
	};
};

func void dia_oric_farrokdead_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Oric_FarrokDead_01_00");	//С военачальниками орков покончено! Они все мертвы.
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_01");	//Отлично! Я знал, что у тебя это получится.
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_03");	//Итак, неразбериха и паника в рядах орков усилились.
	AI_Output(self,other,"DIA_Oric_FarrokDead_01_05");	//А значит, выросли и наши шансы на победу!
	MIS_KILLOCELITE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLOCELITE,"Я сообщил Орику о том, что мне удалось убить всех орочьих военачальников, командующих осадой замка.");
};


instance DIA_ORIC_ELITEPAY(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_elitepay_condition;
	information = dia_oric_elitepay_info;
	permanent = FALSE;
	description = "А что там с моим вознаграждением?!";
};


func int dia_oric_elitepay_condition()
{
	if((MIS_KILLOCELITE == LOG_SUCCESS) && (hero.guild == GIL_DJG) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_elitepay_info()
{
	AI_Output(other,self,"DIA_Oric_ElitePay_15_00");	//А что там с моим вознаграждением?
	AI_Output(self,other,"DIA_Oric_ElitePay_11_01");	//Я могу дать тебе лишь тысячу золотых. Больше у меня просто нет.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_Oric_HoshDead(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent = FALSE;
	description = "Хош-Пак мертв!";
};


func int DIA_Oric_HoshDead_Condition()
{
	if(Npc_IsDead(Hosh_Pak) && (MIS_KillHoshPak == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_HoshDead_Info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Хош-Пак мертв!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//Отлично, это обязательно посеет хаос в рядах орков. Может быть, у нас все еще есть какие-то шансы.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//Я думаю, это позволит нам получить передышку, по крайней мере, на неделю.
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillHosh_Pak);
};


instance DIA_Oric_AnyNews(C_Info)
{
	npc = PAL_251_Oric;
	nr = 9;
	condition = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Oric_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Есть новости?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//Ты имеешь в виду, кроме того, что орки вторглись в замок?
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Да. Ты наш герой. Уничтожить всех драконов разом - это воистину героический подвиг. Я потрясен!
	}
	else if(MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//Орки, похоже, выбиты из колеи смертью Хош-Пака.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//Орков становится все больше и больше. Мне это не нравится.
	};
};


instance DIA_Oric_DragonPlettBericht(C_Info)
{
	npc = PAL_251_Oric;
	nr = 3;
	condition = DIA_Oric_DragonPlettBericht_Condition;
	information = DIA_Oric_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "Мне нужна информация о драконах.";
};


func int DIA_Oric_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_AllDragonsDead == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;

func void DIA_Oric_DragonPlettBericht_Info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//Мне нужна информация о драконах.
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//Я уже убил одного из них. Ты можешь сказать мне, где нужно искать других?
	}
	else if(MIS_KilledDragons != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//У меня есть чувство, что я пока нашел не всех драконов. Может, я что-то упустил?
	};
	if(((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE)) && ((Oric_SwampdragonInfo_OneTime == FALSE) || (Oric_RockdragonInfo_OneTime == FALSE) || (Oric_FiredragonInfo_OneTime == FALSE) || (Oric_IcedragonInfo_OneTime == FALSE)))
	{
		if((Npc_IsDead(SwampDragon) == FALSE) && (Oric_SwampdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//Несколько дней назад к западу от нашего замка появилось большое болото. Это довольно подозрительно, тебе так не кажется?
			B_LogEntry(TOPIC_DRACHENJAGD,"Орик дал мне повод к размышлению: За последние несколько дней к западу от замка образовалось большое болото. Он считает это очень подозрительным.");
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(RockDragon) == FALSE) && (Oric_RockdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//На юге находится крепость в скалах, далеко за вулканом.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Наши разведчики докладывают, что эта крепость хорошо охраняется. Может быть, один из них скрывается там.
			B_LogEntry(TOPIC_DRACHENJAGD,"Разведчики паладинов сообщили Орику, что крепость в скалах за вулканом на юге хорошо охраняется. Орик подозревает, что дракон находится там.");
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(FireDragon) == FALSE) && (Oric_FiredragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//После прошлого нападения драконов, один из них, по слухам, полетел в направлении вулкана на юге. Тебе стоит поискать его там.
			B_LogEntry(TOPIC_DRACHENJAGD,"По-видимому, последнего дракона, нападавшего на замок в Долине Рудников, видели неподалеку от вулкана.");
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(IceDragon) == FALSE) && (Oric_IcedragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//На западе находится обширная ледяная долина. Я не удивлюсь, если один из драконов скрывается там.
			B_LogEntry(TOPIC_DRACHENJAGD,"Согласно информации, полученной от Орика, заснеженный район на западе может быть логовом дракона.");
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//В настоящий момент мне нечего сказать тебе.
	};
};


instance DIA_Oric_KAP5_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP5_EXIT_Condition;
	information = DIA_Oric_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP6_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP6_EXIT_Condition;
	information = DIA_Oric_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORIC_CAPTURED(C_Info)
{
	npc = PAL_251_Oric;
	nr = 2;
	condition = dia_oric_captured_condition;
	information = dia_oric_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_oric_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};



