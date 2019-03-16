
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Паршиво!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Ммм!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//А что еще я могу сказать? Изо дня в день я вижу только эту чертову реку.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Орки шныряют на левом берегу, бандиты - на правом, и каждый день я ем только мясо шныгов. Я уже не могу выносить все это!
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "А ты не думал о том, чтобы выбраться отсюда?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//А ты не думал о том, чтобы выбраться отсюда?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Да, конечно. С этим нет никаких проблем.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Сначала мне нужно прорубить себе дорогу через орды орков, поприветствовать всех остальных монстров, которых там тоже немало, а затем прошмыгнуть через Проход!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//Что может быть легче!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Я же пришел сюда.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Ты хочешь сказать мне, что ты только что прошел через Проход?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Ну, в общем да!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Значит, тебе повезло. Пока вокруг творится такой бардак, я с места не сдвинусь.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "Как охота?";
};

func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Охота - моя единственная отрада. Но мне бы хотелось хоть иногда видеть нормальную цель, а не этих отвратительных шныгов.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP4_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP4_EXIT_Condition;
	information = DIA_Engrom_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "Все в порядке?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "Ты одержим Злом.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Ты одержим Злом.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Давай, я помогу тебе.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(вопит) Не трогай меня!
	B_NpcClearObsessionByDMT(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,ZS_Flee,0,"");
};


instance DIA_Engrom_KAP5_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP5_EXIT_Condition;
	information = DIA_Engrom_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_KAP6_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP6_EXIT_Condition;
	information = DIA_Engrom_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_PICKPOCKET(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 900;
	condition = DIA_Engrom_PICKPOCKET_Condition;
	information = DIA_Engrom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Engrom_PICKPOCKET_Condition()
{
	return C_Beklauen(10,5);
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,Dialog_Back,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

instance DIA_Engrom_Goblins(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Condition;
	information = DIA_Engrom_Goblins_Info;
	permanent = FALSE;
	description = "Кажется, тебя что-то беспокоит.";
};

func int DIA_Engrom_Goblins_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Info()
{
	AI_Output(other,self,"DIA_Engrom_Goblins_01_01");	//Кажется, тебя что-то беспокоит.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_02");	//Это все гоблины! (нервно) Эти проклятые гоблины.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_03");	//О чем это ты?
	AI_Output(self,other,"DIA_Engrom_Goblins_01_04");	//Приятель, я говорю о тех гоблинах, которые поселились в пещере под нами.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_05");	//Они сводят меня с ума больше, чем все эти толпы орков, окружившие замок!
	AI_Output(other,self,"DIA_Engrom_Goblins_01_06");	//И ты, конечно, хотел бы избавиться от них?
	AI_Output(self,other,"DIA_Engrom_Goblins_01_07");	//О, это было бы прекрасно! Но...
	AI_Output(other,self,"DIA_Engrom_Goblins_01_08");	//В чем же проблема?!
	AI_Output(self,other,"DIA_Engrom_Goblins_01_09");	//Проблема в том, что я просто не могу добраться до них! 
	AI_Output(self,other,"DIA_Engrom_Goblins_01_10");	//Я слишком боюсь высоты, чтобы прыгать вниз, а идти в обход - чистое самоубийство.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_11");	//Понимаю! Поэтому ты предпочитаешь просто сидеть тут и потихонечку сходить с ума.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_12");	//Очень смешно. (угрюмо) Ты просто не знаешь, какие жуткие вопли доносятся из той пещеры по ночам.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_13");	//Иначе бы так не говорил.
	AI_Output(other,self,"DIA_Engrom_Goblins_01_14");	//Ладно! Если буду поблизости, то обязательно познакомлюсь с твоими гоблинами.
	AI_Output(self,other,"DIA_Engrom_Goblins_01_15");	//Уж сделай одолжение! Поверь, я в долгу не останусь...
	MIS_EngromGoblins = LOG_Running;
	Log_CreateTopic(TOPIC_EngromGoblins,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Running);
	B_LogEntry(TOPIC_EngromGoblins,"Охотника Энгрома сводят с ума гоблины, поселившиеся в близлежащей пещере. Он был бы признателен, если бы я устранил источник его раздражения...");
};


instance DIA_Engrom_Goblins_Done(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Goblins_Done_Condition;
	information = DIA_Engrom_Goblins_Done_Info;
	permanent = FALSE;
	description = "Твои гоблины тебя больше не побеспокоят.";
};

func int DIA_Engrom_Goblins_Done_Condition()
{
	if((MIS_EngromGoblins == LOG_Running) && (Npc_IsDead(Engrom_Goblin_01) == TRUE) && (Npc_IsDead(Engrom_Goblin_02) == TRUE) && (Npc_IsDead(Engrom_Goblin_03) == TRUE) && (Npc_IsDead(Engrom_Goblin_04) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Goblins_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Engrom_Goblins_Done_01_01");	//Гоблины тебя больше не побеспокоят.
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_02");	//Спасибо тебе, приятель. Наконец-то я смогу спать спокойно!
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_03");	//Вот, возьми эту шкуру мракориса. 
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	AI_Output(self,other,"DIA_Engrom_Goblins_Done_01_04");	//Это все, что я могу тебе предложить в качестве награды.
	AI_Output(other,self,"DIA_Engrom_Goblins_Done_01_05");	//Все в порядке. Этого вполне хватит.
	MIS_EngromGoblins = LOG_Success;
	Log_SetTopicStatus(TOPIC_EngromGoblins,LOG_Success);
	B_LogEntry(TOPIC_EngromGoblins,"Я известил Энгрома о том, что с гоблинами покончено. В качестве благодарности он подарил мне шкуру мракориса.");
};