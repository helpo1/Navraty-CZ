
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Надеюсь, скоро придет какой-нибудь корабль, и я наймусь на него.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Это шатание без дела уже действует мне на нервы.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Я слышал, что ты набираешь команду на свой корабль?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//И?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Я готов!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Марио бывший моряк, заговорил со мной в портовой таверне. Он хочет плыть на корабле.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Почему я должен брать тебя?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Почему я должен брать тебя?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Это просто. Потому что я нужен тебе.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Я... я был лейтенантом в королевском флоте.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Я служил моряком на 'Короле Робаре' и 'Гордости Миртаны'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//В битве у восточного архипелага я собственноручно отправил пару десятков орков назад в царство Белиара.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//К сожалению, нас осталось слишком мало, когда наш флагман затонул и нам пришлось отступить.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "А что ты делаешь здесь?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//А что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Флоту пришлось бежать, и мы лишились жалования.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//После моего списания на берег я застрял в этой дыре, и вот теперь ищу новое судно.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Что ты можешь делать?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Что ты можешь делать?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Я обучен абордажу и ближнему бою, к тому же я метко стреляю из корабельной пушки.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Я уверен, что я смогу обучить тебя чему-нибудь во время путешествия.
	B_LogEntry(Topic_Crew,"Марио, похоже, собаку съел в том, что касается морских боев. Возможно, он сможет научить меня кое-чему.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "Что ты за это хочешь?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Что ты за это хочешь?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Что я хочу? Да я буду рад просто убраться отсюда.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Я помогу тебе, а ты поможешь мне выбраться из этой дыры.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Путешествие может быть опасным.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Путешествие может быть опасным.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Я привык к опасности. Когда ты вдали от дома, каждый день для тебя полон опасностей.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Любой шторм может стать для тебя последним, а монстры с глубин могут проглотить твой корабль целиком.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//Не говоря уже о галерах орков. Поверь мне, я ничего не боюсь. Матрос, который боится, обречен на гибель.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "Ты не нужен мне.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Ты не нужен мне.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Я лучший матрос, которого можно найти здесь.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Мне кажется, ты не очень-то разбираешься в навигации.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Так что дважды подумай, прежде чем доверяться кому-нибудь.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Я всегда найду место для хороших людей.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Я всегда найду место для хороших людей.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Конечно, увидимся на корабле.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я все-таки не могу взять тебя с собой!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Я понял, что ты мне не нужен!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Как скажешь. Ты знаешь, где искать меня!
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Я знал! Увидимся на корабле!
		Mario_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		AI_StopProcessInfos(self);
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Ты не смеешь так обращаться со мной. Плевать я на тебя хотел!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

//---------------------------эпический данж------------------------------------------------

instance DIA_NONE_1813_Ilesil_EXIT(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 999;
	condition = DIA_NONE_1813_Ilesil_EXIT_Condition;
	information = DIA_NONE_1813_Ilesil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1813_Ilesil_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_Job(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Job_Condition;
	information = DIA_NONE_1813_Ilesil_Job_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Job_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Job_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Job_15_00");	//Так, так... Еще одна заблудшая душа. Что ты ишещь здесь, странник?
};

instance DIA_NONE_1813_Ilesil_WhoYou(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhoYou_Condition;
	information = DIA_NONE_1813_Ilesil_WhoYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_NONE_1813_Ilesil_WhoYou_Condition()
{
	return TRUE;
};

func void DIA_NONE_1813_Ilesil_WhoYou_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_00");	//Кто ты, и что здесь делаешь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_01");	//Мое имя - Иле'Силь. Я здесь в поисках ответов, как и ты.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_02");	//И давно ты их ищешь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_03");	//Точно не знаю. С тех пор как я попал сюда, время для меня почти остановилось.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_04");	//Я знаю, это звучит довольно странно, но... ты и сам в этом скоро сможешь убедиться.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_05");	//Вообще, я не собирался тут долго задерживаться.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_06");	//Ты только пришел, и уже хочешь уйти? Боюсь огорчить тебя: отсюда просто так не уйти.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_07");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhoYou_15_08");	//Отсюда нет выхода!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhoYou_15_09");	//(про себя) Кажется, я снова влип.
};

instance DIA_NONE_1813_Ilesil_WhatPlace(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhatPlace_Condition;
	information = DIA_NONE_1813_Ilesil_WhatPlace_Info;
	permanent = FALSE;
	description = "Что это за место?";
};

func int DIA_NONE_1813_Ilesil_WhatPlace_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhatPlace_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_00");	//Что это за место?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_01");	//Я знаю о нем немногим больше, чем ты.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_02");	//Но если бы мне предоставили выбор самому дать определение этому месту, то я бы назвал его Обителью потерянных душ.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_03");	//Почему именно так?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_04");	//Тот, кто сюда попадает, навсегда теряется в круговороте событий этого мира. А его душа будет навеки обречена здесь на скитание.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhatPlace_15_05");	//Но ты ведь здесь давно, не так ли?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhatPlace_15_06");	//Когда ты прикован к одному месту, это не имеет значения. Не спрашивай меня об этом, мне все равно нечего сказать.
};

instance DIA_NONE_1813_Ilesil_WhyNotRun(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyNotRun_Condition;
	information = DIA_NONE_1813_Ilesil_WhyNotRun_Info;
	permanent = FALSE;
	description = "И ты не пытался выбраться отсюда?";
};

func int DIA_NONE_1813_Ilesil_WhyNotRun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyNotRun_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_00");	//И ты не пытался выбраться отсюда?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_01");	//Пытался. Но лишь единожды. В тот раз я дошел примерно до того большого камня.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_02");	//И что потом?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_03");	//Потом, по всей видимости, я умер. Помню, нечто огромное выпрыгнуло из-за того камня и набросилось на меня.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_04");	//А дальше все как во тьме. Только ужасная боль по всему телу!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_05");	//Значит, ты призрак?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyNotRun_15_06");	//Теперь я и сам не знаю, кто я. Но, может, ты поможешь мне найти ответ на этот вопрос.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyNotRun_15_07");	//Возможно. Но обещать пока ничего не буду.
};

instance DIA_NONE_1813_Ilesil_WhyComeHere(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_WhyComeHere_Condition;
	information = DIA_NONE_1813_Ilesil_WhyComeHere_Info;
	permanent = FALSE;
	description = "Зачем ты вообще пришел сюда?";
};

func int DIA_NONE_1813_Ilesil_WhyComeHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhoYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_WhyComeHere_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_00");	//Зачем ты вообще пришел сюда?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_01");	//Я тут не по своей воле. Это все мой сумасшедший брат!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_02");	//У тебя был брат?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_03");	//Его звали Иль'Кирит. Мы оба были охотниками.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_04");	//Когда всех нас охватил страх и началось всеобщее безумие, он сказал, что знает безопасное место, где можно укрыться.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_05");	//Постой. О каком безумии ты говоришь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_06");	//Ах, да... Ведь с тех пор прошло столько времени, и ты, конечно, мог и не знать о том, что тогда произошло.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_07");	//Я был бы не прочь узнать об этом сейчас.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_08");	//Тогда начну с самого начала. Спешить нам теперь некуда. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_09");	//То место, откуда ты пришел, некогда представляло из себя прекраснейшую долину, именуемую Адарос.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_10");	//В ней жило множество людей, которые поклонялись Аданосу, богу Воды и Равновесия. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_11");	//К слову сказать, именно там, по словам наших жрецов, он впервые ступил на землю людей. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_12");	//После чего Аданос благословил ее и мой народ, проживавший в этой долине.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_13");	//Кое-что из этого я уже знаю. Что было дальше?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_14");	//В один прекрасный день наши земли в одночасье наводнили орды ужасных монстров и нежити.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_15");	//Я не знаю, кто или что стало тому причиной, но это были ужасные дни! Погибло очень много людей.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_16");	//Чтобы избежать той же участи, мой брат повел меня сюда.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_17");	//С виду это место напоминало храм, похожий на те, что возводили мы сами.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_18");	//Но как только мы вошли туда, со всех сторон на нас полезли невиданные твари.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_19");	//Мы отбивались как могли, но в какой то момент оказалось, что нам больше некуда отступать. Нас зажали в угол со всех сторон.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_20");	//И тогда мой брат случайно заприметил в углу комнаты нечто похожее на магический портал.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_21");	//Выбора у нас не было. Мы оба прыгнули в него, и так я оказался на этом самом месте.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_22");	//И уже после я понял, что все мерзкие твари, наводнившие нашу долину, явились к нам как раз из этого портала.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_23");	//Но кто мог тогда об этом знать.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_WhyComeHere_15_24");	//А что твой брат?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_25");	//Его рядом не было. Оказавшись здесь один, я решил сразу же отправиться на его поиски.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_26");	//Только вот закончились они примерно у того большого камня, что ты видишь впереди. Как и моя жизнь.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_27");	//С тех пор я не оставлял надежды узнать, что стало с моим братом.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_WhyComeHere_15_28");	//Но, боюсь, моим надеждам уже не суждено сбыться. С тех пор прошло столько времени...
};

instance DIA_NONE_1813_Ilesil_SeekBro(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SeekBro_Condition;
	information = DIA_NONE_1813_Ilesil_SeekBro_Info;
	permanent = FALSE;
	description = "Я бы мог поискать твоего брата.";
};

func int DIA_NONE_1813_Ilesil_SeekBro_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyComeHere) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhyNotRun) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_WhatPlace) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SeekBro_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_00");	//Я бы мог поискать твоего брата.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_01");	//Ты предлагаешь мне помощь? Это достойно уважения.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_02");	//Но это очень опасное место. Здесь повсюду веет смертью!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_03");	//Мне приходилось иметь дело с тварями и похуже. Да, и ты ведь поможешь мне?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_04");	//Всем, чем только смогу. Но сражаться со всеми злобными существами, населяющими этот остров, тебе придется в одиночку.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_05");	//А что тебе мешает принять в этом участие?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_06");	//На протяжении уже очень долгого времени какая-то неведомая магическая сила приковывает меня к этому месту.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_07");	//Нелегко объяснить словами, но я чувствую это всем своим телом, когда пытаюсь двинуться куда-то в сторону.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_08");	//А потому я пока останусь здесь и буду просто наблюдать за тобой. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_09");	//Если тебе удастся пробраться вглубь острова, то, возможно, там ты сможешь найти ответ и на этот вопрос.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_10");	//И тогда мы продолжим наши поиски вместе.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_11");	//Ну, хорошо. А как выглядел твой брат? У него было что-нибудь при себе, что помогло бы его опознать?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_12");	//В момент нашего расставания на нем был охотничий доспех из шкуры пантеры и хитиновый меч, который подарил ему наш отец перед смертью.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_13");	//Это все, что я помню о нем.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_14");	//Хорошо, я это запомню. Будем надеяться, что кроме твоего брата мы найдем еще и выход отсюда.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_15");	//Не очень бы хотелось застрять тут на целую вечность.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_16");	//Ты очень смел и отважен, странник. Надеюсь, удача будет на твоей стороне.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_17");	//Возьми этот медальон. Он защитит тебя от смертельного воздействия здешнего климата.
	B_GiveInvItems(self,other,ItMi_IlisilAmulet,1);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SeekBro_15_18");	//Благодарю. Теперь мне пора в путь.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SeekBro_15_19");	//Береги себя.
	EpicJorneyStart = TRUE;
	MIS_Miss_Brother = LOG_Running;
	Log_CreateTopic(TOPIC_Miss_Brother,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Running);
	B_LogEntry(TOPIC_Miss_Brother,"Проследовав в загадочный портал, на выходе из него я повстречал необычного призрака по имени Иле'Силь. Он поведал мне свою историю, в которой он и его брат Иль'Кирит пытались скрыться в этом портале от преследующих их монстров. Однако во время телепортации они разделились, и Иле'Силь так и не узнал, что стало с его братом. Я решил помочь этому призраку найти Иль'Кирита, или, по крайней мере, то, что от него осталось. Кроме того, мне придется найти способ самому выбраться из этого места, поскольку, по словам Иле'Силя, это не представляется возможным.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PaleCrawler,"LOSTVALLEY_PALECRAWLER");
};

instance DIA_NONE_1813_Ilesil_FirstBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FirstBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_FirstBossDown_Info;
	permanent = FALSE;
	description = "Похоже, я прикончил того монстра, что напал на тебя.";
};

func int DIA_NONE_1813_Ilesil_FirstBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (PaleCrawlerIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FirstBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_00");	//Похоже, я прикончил того монстра, что напал на тебя.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_01");	//Правда? И что это была за тварь?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_02");	//Вроде как ползун, только куда более опасный, чем его сородичи.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_03");	//Кто бы мог подумать... А ты, похоже, хороший боец, раз тебе удалось справиться с ним.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_04");	//Кто знает, - возможно, у нас действительно есть некоторые шансы на успех.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_05");	//О каких шансах ты говоришь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_06");	//Тебе - убраться отсюда, а мне - найти моего брата и навсегда упокоить свою душу.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_07");	//Понимаю. Тогда мне пора двигаться дальше.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FirstBossDown_15_08");	//Хорошо, только будь осторожен! Уверен, тот ползун - ничто по сравнению с тем, что ждет тебя дальше.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FirstBossDown_15_09");	//Вот и увидим.
	ReadyForBoss2 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Иле'Силя воодушевило то, что мне удалось прикончить напавшего на него монстра. Однако он предупредил, что дальше меня ждут куда более трудные испытания.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(AraharPlague,"LOSTVALLEY_ARAHARPLAGUE");
};

instance DIA_NONE_1813_Ilesil_SecondBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_SecondBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_SecondBossDown_Info;
	permanent = FALSE;
	description = "Посмотри, что я нашел.";
};

func int DIA_NONE_1813_Ilesil_SecondBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (AraharPlagueIsDead == TRUE) && (Npc_HasItems(other,ItMi_ArahArEye_Unknown) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_SecondBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_00");	//Посмотри, что я нашел.
	B_GiveInvItems(other,self,ItMi_ArahArEye_Unknown,1);
	Npc_RemoveInvItems(self,ItMi_ArahArEye_Unknown,1);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_01");	//Интересный предмет... Немного похож на чье-то око. Где ты его нашел?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_02");	//Похоже, он принадлежал одному могущественному личу, который охранял что-то наподобие кладбища недалеко отсюда.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_03");	//А эта вещь просто лежала в его сундуке.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_04");	//Надо полагать, что он не просто так хранил ее там. Должны быть причины.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_05");	//И ты сможешь отыскать их?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_06");	//Возможно. Пребывание в виде нежити иногда дает и свои плюсы. Порой мы способны видеть то, что не смог бы увидеть живой человек.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_07");	//Тогда осмотри этот предмет получше и постарайся понять, что в нем такого особенного.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_08");	//Так и сделаю. Но это займет некоторое время. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_09");	//Ну, времени у нас предостаточно, так что я тебя не тороплю. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_10");	//А что будешь делать ты?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_SecondBossDown_15_11");	//Осмотрюсь рядом с тем кладбищем. Может, там найдется еще что-нибудь интересное.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_SecondBossDown_15_12");	//Хорошо. А я пока займусь этим... глазом.
	ReadyForBoss3 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Я принес Иле'Силю странный предмет, похожий на око, найденный мной в сундуке могущественного лича. Иле'Силь обещал изучить его и понять, для чего он нужен. Но это займет некоторое время. Мне же лучше осмотреться вокруг старого кладбища. Может, мне посчастливится найти еще что-нибудь интересное.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_ThirdBossDown(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_ThirdBossDown_Condition;
	information = DIA_NONE_1813_Ilesil_ThirdBossDown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_ThirdBossDown_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_ThirdBossDown_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_01");	//А, это ты... я ждал тебя.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_02");	//Есть новости?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_03");	//Давай лучше начнем с тебя. Что тебе удалось узнать?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_04");	//Ничего особенного. Недалеко от кладбища я нашел только старый магический алтарь. И пару призраков, который его охраняли.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_05");	//И как он выглядел?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_06");	//Он был весь испещрен древними рунами, а посередине у него была такая круглая выемка, вроде жертвенной чаши.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_07");	//Это все?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_08");	//Да. А что там с глазом?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_09");	//Насколько я понимаю, этот предмет является своего рода ключом. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_11");	//По крайней мере, те воспоминания, которые мне удалось вытянуть из него, отчетливо свидетельствуют об этом.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_12");	//Если это ключ, - значит, должен быть и сундук. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_13");	//Не принимай все так буквально. Под этим словом я имел в виду то, что этот предмет может воздействовать на окружающие предметы по-особому.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_14");	//Хорошо, и что нам с ним теперь делать?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_15");	//Ты говорил, что нашел какой-то жертвенный алтарь. Попробуй использовать этот предмет на нем.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_16");	//Возможно, из этого что-то и выйдет путное.
	B_GiveInvItems(self,other,ItMi_ArahArEye,1);
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_17");	//А если нет?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_ThirdBossDown_15_18");	//Тогда будем думать дальше.
	ReadyForBoss4 = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Иле'Силь вернул мне странное око и попросил использовать его на том алтаре, который охраняли призраки. Надеюсь, из этого что-нибудь выйдет.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_IsFree(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_IsFree_Condition;
	information = DIA_NONE_1813_Ilesil_IsFree_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_IsFree_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (LookAtDemonAltar == TRUE) && (SoulKeeperIsDead == TRUE) && (IlesilIsFree == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_IsFree_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_01");	//Я вижу, что тебе все-таки удалось каким-то образом освободить меня от магических пут.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_02");	//По всей видимости - раз уж ты здесь. Как себя чувствуешь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_03");	//Лучше, намного лучше. Последние годы пребывания в этом месте были просто невыносимы.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_04");	//Но теперь в один момент вдруг все закончилось. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_05");	//Я освободил твою душу, но, боюсь, этого будет мало, чтобы вернуть тебя к жизни.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_06");	//Ты и так уже много сделал для меня. За что я тебе премного благодарен.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_07");	//Только давай не будем отвлекаться на любезности.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_08");	//Нам надо как-то выбираться отсюда. У тебя есть мысли на этот счет?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_09");	//Хммм... Это место смердит проклятием. Очень сильным и очень злым!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_10");	//Думаю, если нам удастся отыскать его источник, то мы найдем ответ и на этот вопрос.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_11");	//А как насчет твоего брата? Здесь что-нибудь есть, что помогло бы нам в поисках? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_12");	//Нет. Ничего такого.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_13");	//Ладно. Куда двигаться дальше?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_IsFree_15_14");	//Дай мне немного осмотреться...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_IsFree_15_15");	//Хорошо, - думаю, у нас есть пара минут.
	IlesilCount = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Душа Иле'Силя свободна, и теперь он может спокойно передвигаться по острову. Теперь нам надо решить, что делать дальше. Иле'Силь попросил немного времени, чтобы осмотреться вокруг.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SearchPlace");
};

instance DIA_NONE_1813_Ilesil_Move(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Move_Condition;
	information = DIA_NONE_1813_Ilesil_Move_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Move_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (IlesilCountDone == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Move_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_01");	//Ну как, нашел что-нибудь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_02");	//Видишь тот храм на горе?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_03");	//Темная магия этого места проистекает именно откуда.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_04");	//Откуда ты это знаешь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_05");	//Я этого не знаю, но я это чувствую. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_06");	//Тогда не будем терять времени и сейчас же отправимся туда.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Move_15_07");	//Похоже, это единственное, что нам остается сделать. Только будь осторожен. Наверняка путь туда хорошо охраняется.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Move_15_08");	//Заодно это и выясним. Идем!
	ReadyForBoss5 = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Нам необходимо попасть в храм в центре острова, откуда темная магия расползается по всему острову.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowTemple");
};

instance DIA_NONE_1813_Ilesil_FireCave(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_FireCave_Condition;
	information = DIA_NONE_1813_Ilesil_FireCave_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_FireCave_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (ReadyForBoss5 == TRUE) && (Npc_GetDistToWP(self,"WDS_LAVA_CEMETRY_07") < 1000))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_FireCave_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_01");	//Ты здесь не пройдешь.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_FireCave_15_02");	//Это я уже заметил. И что теперь будем делать? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_03");	//Видишь этот небольшой алтарь рядом с решеткой? Уверен, что он и есть ключ к подсказке.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_04");	//Попробуй его как-нибудь использовать. Возможно, это даст нужный эффект.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_FireCave_15_05");	//Я буду ждать тебя на противоположной стороне прохода. Как видишь, быть призраком порой очень удобно.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	WaitForHero = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Нам перегородила дорогу массивная решетка. Иле'Силь посоветовал мне использовать алтарь, который расположен рядом с ней. Он будет ждать меня на противоположной стороне прохода.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitForHero");
};

instance DIA_NONE_1813_Ilesil_NextMove(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_NextMove_Condition;
	information = DIA_NONE_1813_Ilesil_NextMove_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_NextMove_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FiarasIsDead == TRUE) && (FiarasHeartInPlace == TRUE))
	{
		if((Hlp_GetHeroStatus() != HERO_THREATENED) && (Hlp_GetHeroStatus() != HERO_FIGHTING))
		{
			return TRUE;
		};
	};
};

func void DIA_NONE_1813_Ilesil_NextMove_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_01");	//Вижу, тебе все-таки удалось добраться сюда.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_02");	//Что это за место?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_03");	//Не знаю. Но оно мне чем-то напоминает круг друидов. 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_04");	//Только вот самих друидов не видно. А вместо них куча нежити.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_05");	//Как бы то ни было, это место обладает очень сильной магической аурой. Думаю, нам необходимо там осмотреться, прежде чем продолжить путь.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_NextMove_15_06");	//По мне, так мы просто теряем время. Храм уже близко!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_NextMove_15_07");	//Возможно, ты прав, но что-то мне подсказывает, что все-таки лучше осмотреть это место.
	SearchCircle = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Пройдя подгорный проход, я вновь повстречал Иле'Силя. Он ожидал меня в довольно странном месте. По его словам, оно обладает мощной магической аурой. Иле'Сель предложил здесь осмотреться. По мне, это пустая трата времени, хотя к советам призрака все-таки стоит прислушаться...");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InspectCircle");
};

instance DIA_NONE_1813_Ilesil_EnterHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_EnterHram_Condition;
	information = DIA_NONE_1813_Ilesil_EnterHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_EnterHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (EkronIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_EnterHram_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_01");	//Твой бой с той грудой древесины... это было невероятно.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_02");	//По правде говоря, я надеялся на твою помощь.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_03");	//Прости меня, мой друг... Но что может сделать простой призрак против такого сосредоточения ненависти и злобы.  
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_04");	//К тому же я - часть этого места. А значит, я не могу долго сопротивляться его воле.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_05");	//Ладно, забудем об этом. Что там впереди?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_06");	//Мы почти дошли до храма. Но вход туда преграждают могущественные призраки.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_07");	//Я чувствую их. Я чувствую их боль, страх и ненависть! Они уже ждут тебя.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_08");	//Тогда не стоит их заставлять ждать.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_09");	//Кстати, по дороге сюда мы так ничего и не выяснили насчет твоего брата.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_10");	//Ты прав... Но, думаю, ответ на этот вопрос уже где-то рядом. Возможно, он кроется внутри этого храма.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_11");	//Значит, нам нужно туда попасть.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_12");	//Иного пути у нас нет.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_13");	//Хорошо, тогда пойдем.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_14");	//Ты иди... а я останусь здесь. И буду наблюдать за тобой.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_15");	//Но почему?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_16");	//Я не могу близко подойти к этим призракам. Если они меня увидят, то моментально поймут, в чем дело.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_EnterHram_15_17");	//И тогда для меня все будет кончено. Они пожрут мою душу и обратят мои кости в пыль.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_EnterHram_15_18");	//Тогда жди здесь. Я скоро вернусь.
	B_LogEntry(TOPIC_Miss_Brother,"Мы почти добрались до храма. По словам Иле'Силя, вход в него охраняют какие-то могущественные призраки. Сам же Иле'Силь не смеет подойди к ним близко, ибо они уничтожат его. А это значит, что всю работу опять предстоит делать мне...");
	ReadyForBoss6 = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Bro_Dex,"LV_SKELETON_DEX_01");
	Wld_InsertNpc(Skeleton_Bro_Str,"LV_SKELETON_STR_01");
	Wld_InsertNpc(Skeleton_Bro_Mag,"LV_SKELETON_MAG_01");
};

instance DIA_NONE_1813_Ilesil_OpenHram(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHram_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHram_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHram_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (SkelBrosFightWin == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHram_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_01");	//Итак, мы достигли храма. Не думал, что у нас это получится.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_02");	//Рано радоваться. Теперь в него надо как-то попасть. Есть какие-нибудь мысли на этот счет?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_03");	//Скорее всего, вход в него открывают эти каменные переключатели.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_04");	//Тут их довольно много.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_05");	//И, вероятнее всего, их необходимо повернуть в правильной последовательности.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHram_15_06");	//В какой именно? 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHram_15_07");	//Это мне неизвестно. Тебе придется самому это узнать. Надеюсь, тебе повезет...
	StartLvStory = TRUE;
	B_LogEntry(TOPIC_Miss_Brother,"Вход в храм оказался заперт прочной решеткой. По словам Иле'Силя, открыть его можно, использовав каменные переключатели, расположенные на небольшой площадке перед храмом. Придется изрядно поломать голову, чтобы понять, в какой последовательности их активировать.");
	AI_StopProcessInfos(self);
};

var int NeedIlesilStory;
var int HintIlesilDone;

instance DIA_NONE_1813_Ilesil_OpenHramHint(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHint_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHint_Info;
	permanent = FALSE;
	description = "(спросить о пюпитрах).";
};

func int DIA_NONE_1813_Ilesil_OpenHramHint_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_15_01");	//Видишь эти древние пюпитры, расположенные по всей храмовой площади? В каждом из них сделаны какие-то странные записи. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_15_02");	//(задумчиво) Возможно, это подсказки, которые помогут открыть вход в храм. Поведай мне, что именно в них написано?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_15_03");	//Только предельно точно, до последнего слова. Иначе мы не сможем понять их правильный смысл.
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHint);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint,"Вот, слушай...",DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHint,"К сожалению, я еще не до конца их прочитал.",DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintAgain(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info;
	permanent = TRUE;
	description = "Насчет тех надписей...";
};

func int DIA_NONE_1813_Ilesil_OpenHramHintAgain_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (StartLvStoryFR == TRUE) && (NeedIlesilStory == TRUE) && (HintIlesilDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintAgain_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_01");	//Насчет тех надписей...
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintAgain_15_02");	//Ты все их прочитал?
	Info_ClearChoices(DIA_NONE_1813_Ilesil_OpenHramHintAgain);

	if((LV_Story_01 == TRUE) && (LV_Story_02 == TRUE) && (LV_Story_03 == TRUE) && (LV_Story_04 == TRUE) && (LV_Story_05 == TRUE) && (LV_Story_06 == TRUE))
	{
		Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain,"Вот, слушай...",DIA_NONE_1813_Ilesil_OpenHramHint_Yes);
	};

	Info_AddChoice(DIA_NONE_1813_Ilesil_OpenHramHintAgain,"К сожалению, я еще не до конца их прочитал.",DIA_NONE_1813_Ilesil_OpenHramHint_No);
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_01");	//Вот, собственно, и все, что там было написано.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_02");	//(задумчиво) Древние хорошо умели прятать истинный смысл в словах.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_03");	//У тебя ушла бы целая вечность на разгадку этой тайны. Но я все-таки попытаюсь тебе помочь.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_04");	//Было бы неплохо.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_05");	//Итак, по всей видимости, каждый из этих каменных переключателей означает одну из сторон света.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_06");	//А текст является ключом к разгадке их поочередного использования.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_Yes_15_07");	//Тут надо хорошенько подумать... Дай мне некоторое время на размышление.
	B_LogEntry(TOPIC_Miss_Brother,"Иле'Силю потребуется некоторое время, чтобы расшифровать эти тайные письмена древних. Надеюсь, у него получится.");
	HintIlesilDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TransText");
};

func void DIA_NONE_1813_Ilesil_OpenHramHint_No()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHint_No_15_01");	//К сожалению, я еще не до конца их прочитал.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHint_No_15_02");	//Тогда я ничем не смогу тебе помочь.

	if(NeedIlesilStory == FALSE)
	{
		B_LogEntry(TOPIC_Miss_Brother,"Мне нужно прочитать все надписи на древних пюпитрах, чтобы Иле'Силь смог понять их смысл.");
		NeedIlesilStory = TRUE;
	};

	AI_StopProcessInfos(self);
};

instance DIA_NONE_1813_Ilesil_OpenHramHintDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramHintDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramHintDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (HintIlesilDone == TRUE) && (IlesilCountNextDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramHintDone_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_01");	//Кажется, я кое-что понял из того, о чем говорится в записях.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_02");	//Камень, который находится ближе всех к решетке, указывает на север.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_03");	//Но первый в последовательности смотрит на юго-восток.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_04");	//Третий - на юго-запад, пятый - четко указывает на север, а восьмой - на юг.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_05");	//Остальные камни в последовательности тебе придется отыскать самому.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramHintDone_15_06");	//Ну хоть что-то. Спасибо.
	B_LogEntry(TOPIC_Miss_Brother,"По словам Иле'Силя, ближайший к решетке камень указывает на север. Третий - на юго-запад, пятый - на север, а восьмой - на юг. Остальные камни в последовательности мне придется отыскать самому...");
};

instance DIA_NONE_1813_Ilesil_OpenHramDone(C_Info)
{
	npc = NONE_1813_Ilesil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_OpenHramDone_Condition;
	information = DIA_NONE_1813_Ilesil_OpenHramDone_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_OpenHramDone_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (OpenHramDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_OpenHramDone_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_01");	//Решетка храма открыта. Тебе осталось лишь проследовать внутрь.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_02");	//Ты со мной не пойдешь?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_03");	//Я останусь снаружи. Это место слишком опасно для меня.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_04");	//Ты так говоришь, как будто еще раз можешь умереть.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_05");	//После того как ты вернул мне мою душу, после стольких лет забвения и бессмысленного существования, я вновь обрел вкус к жизни.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_06");	//И не хочу потерять его вновь...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_OpenHramDone_15_07");	//Я тебя понимаю. Ладно, оставайся тут, если хочешь. А мне пора.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_OpenHramDone_15_08");	//Удачи, странник...
	B_LogEntry(TOPIC_Miss_Brother,"Иле'Силь остался снаружи храма, опасаясь заходить внутрь. Мне же придется это сделать, если я хочу выбраться отсюда.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Skeleton_Lord_LV,"LOSTVALLEY_CHELDRAK");
};

instance DIA_NONE_1813_Ilesil_Die(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1813_Ilesil_Die_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (FinalDialogeLv == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Info()
{
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_01");	//Наконец-то, после стольких сотен лет ожиданий и лишений...
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_15_02");	//Ты здесь?! Но ведь ты говорил, что это место опасно для тебя.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_03");	//Оно и было опасным, покуда был жив Чел'Драк.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_04");	//Но теперь благодаря тебе его дух мертв. А значит, я смогу выполнить то, зачем пришел сюда.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_15_05");	//И ты мне в этом поможешь.
};


instance DIA_NONE_1813_Ilesil_Die_Ans_01(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_01_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_01_Info;
	permanent = FALSE;
	description = "Говоря о помощи, ты имеешь в виду своего брата?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_01_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_01_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_01");	//Говоря о помощи, ты, наверно, имеешь в виду своего брата?
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_02");	//Но ведь мы так его и не нашли.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_03");	//Проблема была не в том, чтобы найти его, а в том, чтобы добраться до него.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_04");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_05");	//Обернись - и все поймешь.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_06");	//Те застывшие останки в объятиях статуи Белиара - это и есть мой брат, Иль'Кирит.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_01_15_07");	//Но скоро он вновь будет рядом со мной. А твоя душа поможет мне вернуть его к жизни.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_02(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_02_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_02_Info;
	permanent = FALSE;
	description = "Откуда ты узнал о Чел'Драке?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_02_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_02_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_01");	//Откуда ты узнал о Чел'Драке? Ведь ты же никогда не был в храме.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_02");	//Так оно и есть. Древние старательно позаботились о том, чтобы никто чужой не смог проникнуть сюда.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_03");	//Но в отличие от многих, тебе это удалось.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_04");	//А что, были и другие, кто пытался попасть сюда?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_05");	//Поверь, их было предостаточно. Но все они давно мертвы... а ты - нет.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_06");	//По всей видимости, боги довольно благосклонны к тебе, странник. Однако тебя это все равно не спасет.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_07");	//Белиар с радостью примет твою душу в свои объятия, - естественно, в обмен на душу моего брата.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_08");	//Честная и выгодная сделка, не правда ли? 
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_02_15_09");	//Мне так не кажется.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_03(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_03_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_03_Info;
	permanent = FALSE;
	description = "Кто ты вообще такой?";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_03_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_01) == TRUE) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_02) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_03_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_01");	//Кто ты вообще такой?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_02");	//Тот, с кем тебе было бы лучше не встречаться вовсе.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_03");	//Я и мой брат Иль'Кирит были когда-то могущественными Лордами Теней.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_04");	//Много лет мы оба верой и правдой служили Белиару. А потом... потом этот лживый божок просто предал нас.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_05");	//Белиар предал вас? На него это похоже.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_06");	//После того как наша многочисленная армия опустошила священные земли Аданоса, мы с братом, вместо обещанной им награды, получили от него лишь вечное изгнание и забвение.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_07");	//И все потому, что Аданос в своем стремлении отомстить Белиару вознамерился уничтожить одного из его избранных. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_08");	//Темный бог решил, что мы с братом больше не представляем для него какой-либо ценности и просто отдал нас в руки Аданоса.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_09");	//Тот, в свою очередь, заточил моего брата в этом храме, а у меня отнял душу и обрек тут на вечные страдания.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_10");	//Другого я от него и не ожидал. Правда, мне не совсем понятно, каким образом вы смогли попасть на плато Древних.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_11");	//Да еще и привести за собой огромную армию гнусных тварей.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_03_15_12");	//Это было довольно просто. В том нам помогла алчность и глупость самих Зодчих.
	B_LogEntry(TOPIC_Miss_Brother,"Иле'Силь оказался не тем, за кого себя выдавал. Он и его брат некогда служили Белиару, и именно по его приказу уничтожили народ Зодчих на плато. После чего Аданос навечно заточил их в этом месте.");
};

instance DIA_NONE_1813_Ilesil_Die_Ans_04(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_04_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_04_Info;
	permanent = FALSE;
	description = "Расскажи мне об этом.";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_04_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_04_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_01");	//Расскажи мне об этом.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_02");	//В своей священной земле Аданос когда-то сокрыл очень могущественный артефакт, созданный самим Белиаром для своего пожирателя душ - демона С'эньяка.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_03");	//Ты имеешь в виду Коготь Белиара?
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_04");	//Да. Он отдал меч одному из своих избранных - Эр'Хазиру, дабы тот охранял его.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_05");	//После смерти Эр'Хазира, меч был похоронен вместе с ним в одном из храмов Аданоса в долине.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_06");	//Зодчие отыскали этот храм и забрали Коготь себе, полагая, что он дарует им могущество и власть.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_07");	//Но они даже и представить себе не могли, на что было способно это оружие.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_08");	//Коготь был не только могущественным мечом, способным поглощать души умерших, но и ключом в царство самого Белиара!
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_09");	//Узнав о том, что меч оказался в руках простых смертных, Белиар воспользовался этим случаем.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_10");	//Он заставил его владельца использовать силу меча и тем самым открыть магический портал, через который мы и провели нашу армию. 
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_11");	//Узнав о таком вероломном предательстве, Аданос сначала проклял свой любимый народ, а потом и вовсе смыл его остатки с лица земли.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_12");	//А с помощью Когтя запечатал то место, где мы сейчас находимся.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_13");	//К слову, меч должен быть сейчас у тебя. Иначе бы ты никогда не попал сюда.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_14");	//Все верно. Коготь у меня.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_15");	//Это ненадолго. Когда я заберу твою душу и освобожу своего брата, я найду этому оружию лучшее применение.
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_04_15_16");	//Ну, это мы еще посмотрим.
};

instance DIA_NONE_1813_Ilesil_Die_Ans_05(C_Info)
{
	npc = Ilesil_Evil;
	nr = 1;
	condition = DIA_NONE_1813_Ilesil_Die_Ans_05_Condition;
	information = DIA_NONE_1813_Ilesil_Die_Ans_05_Info;
	permanent = FALSE;
	description = "Придется мне закончить начатое Аданосом.";
};

func int DIA_NONE_1813_Ilesil_Die_Ans_05_Condition()
{
	if((MIS_Miss_Brother == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_1813_Ilesil_Die_Ans_03) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1813_Ilesil_Die_Ans_05_Info()
{
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_01");	//Придется мне закончить начатое Аданосом.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_02");	//Ты надеешься победить меня, глупец? Как это неразумно с твоей стороны.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_03");	//Даже сейчас, после стольких лет заточения, я способен сокрушить тебя одним ударом!
	AI_Output(other,self,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_04");	//Ну что же, попробуй.
	AI_Output(self,other,"DIA_NONE_1813_Ilesil_Die_Ans_05_15_05");	//(...яростно вопит)
	AI_StopProcessInfos(self);
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	IlesilCanFight = TRUE;
};