var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int prayday_vatr;
var int prayday_vatr1;
var int prayday2_vatr;
var int praysum_vatr;

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 2) && (MadKillerCount >= 5) && (MadKillerCount <= 10) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Я слышал про тебя.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Говорят, что ты замешан в убийстве невинных людей.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Если это так, то я должен предупредить тебя, сынок.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Не стоит нарушать баланс сил, ибо в противном случае тебе придется столкнуться с последствиями своих поступков.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Чем я могу помочь тебе?
};


instance DIA_Addon_Vatras_LastWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount > 10) && (VatrasPissedOffForever == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Что ты можешь сказать в свое оправдание?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Отвали!",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Мне очень жаль. Я не понимал, что делаю.",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Отвали!
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Я не слышу в твоих словах ни тени раскаяния.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Ты не оставляешь мне другого выбора.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Мне очень жаль. Я не понимал, что делаю.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Я буду молиться за тебя и просить богов, чтобы они вернули тебе рассудок.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Горе тебе, если я услышу хотя бы об одном убийстве, к которому ты приложил руку.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if((MadKillerCount > VatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Vatras_LastWarning) && (Kapitel >= 5) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Твои слова так же лживы, как и твои деяния.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Ты никак не хочешь прекращать бездумные убийства.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Ты не оставляешь мне другого выбора...
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Подожди!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Если увидишь Лареса...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Я хочу, чтобы ты оказал мне небольшую услугу.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Отправляйся в порт. Там ты найдешь человека по имени Ларес.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Передай ему этот орнамент и скажи, что его нужно вернуть. Он знает, что делать.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	AI_StopProcessInfos(self);

	if(Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		if(MIS_NOVICECANJOIN == FALSE)
		{
			B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		};
		Vatras_SchickeLeuteWeg = FALSE;
	};
};

instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Да пребудет с тобой Аданос.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Я Ватрас, слуга Аданоса, стража равновесия божественного и земного.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Что я могу сделать для тебя?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "У меня для тебя письмо.";
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if(((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) >= 1) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || (Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//У меня для тебя письмо.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Для меня?
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Да, но... оно вскрыто. Я надеюсь, оно не попало в чужие руки?
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Да. Это очень важное известие.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Интересно как к тебе попало это письмо?
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Я забрал его у бандитов.",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Я получил его у Кавалорна, охотника.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Я забрал его у бандитов.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(обеспокоено) О Аданос! Это плохо. Это очень плохо.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Если то, что ты говоришь правда, то у нас огромная проблема.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Я должен как можно скорее разобраться с этим.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Я получил его у Кавалорна, охотника.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(с удивлением) Кавалорн? А где он?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Он просил передать тебе, что не успевает и сразу направился к месту встречи. Что бы это ни значило.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Я смотрю, ты завоевал доверие Кавалорна. Это говорит в твою пользу.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = "Меня прислал к тебе Кавалорн!";
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Vatras_Why == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Меня прислал к тебе Кавалорн!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//И что же он тебе сказал?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Он сказал, что ты ищешь верных людей.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(улыбается) Ага... Значит, ты хочешь присоединиться к нам, сынок?
};

instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "Расскажи мне о Кольце Воды.";
};

func int DIA_Addon_Vatras_TellMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Расскажи мне о Кольце Воды.

	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//И зачем мне это делать?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Так как ты пока не являешься членом нашего сообщества, я не смогу рассказать тебе ВСЕ.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Но я расскажу тебе то, что тебе можно услышать.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Чем именно вы занимаетесь?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"А где остальные маги воды?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Кто является членом Кольца Воды?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Чем именно вы занимаетесь?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Мы стоим на пути порядка Инноса и хаоса Белиара.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Если одна из сторон одержит верх, то это будет означать либо полный хаос, либо окончательную потерю свободы.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//Поэтому мы поддерживаем баланс двух сил. Благодаря нам существует все живое.
	if(MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"И что это значит для меня?",DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//И что это значит для меня?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Падение Барьера стало причиной возникновения многих опасностей.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Бандиты, наверное, самая очевидная их них.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//И дело не только в том, что теперь нельзя путешествовать в безопасности...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//В городе есть кто-то, кто помогает бандитам!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Мы узнали, что бандиты получают регулярные поставки от торговца оружием в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Сейчас мы пытаемся всеми силами помешать этому.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Если что-нибудь узнаешь об этом, дай мне знать.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"Некий торговец из Хориниса поставляет бандитам оружие. Ватрас хочет, чтобы я вывел его на чистую воду.");
	B_LogEntry_Quiet(TOPIC_Addon_Bandittrader,"Интендант паладинов Мартин также занимается поставкой оружия. Я могу найти его в гавани, где паладины хранят свои запасы.");
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater,"Кольцо Воды занимается проблемой бандитов в Хоринисе.");
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//А где остальные маги воды?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Они исследуют постройки древней цивилизации к северо-востоку от Хориниса.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Мы подозреваем, что в этих руинах может скрываться проход к той части острова, которая еще не отмечена на карте.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Маги воды исследуют руины построек древней культуры, которые находятся на северо-востоке от Хориниса. Возможно, там находится проход в неисследованную часть острова.");
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"Расскажи мне об этом.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Расскажи мне об этом.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Если хочешь присоединиться к экспедиции, я могу передать с тобой письмо, которое ты отнесешь Сатурасу.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Ты можешь пойти с ним только в том случае, если ты будешь одним из нас.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Безусловно.
	B_LogEntry(TOPIC_Addon_KDW,"Прежде чем допустить меня до участия в экспедиции, Ватрас требует, чтобы я присоединился к Кольцу Воды.");
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Кто является членом Кольца Воды?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//Пока ты не вступишь в наше братство, я не могу сообщать тебе подробности.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Но ты наверняка уже встречался с ними.
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "Я хочу присоединиться к братству 'Кольца Воды'!";
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if((SC_KnowsRanger == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Я хочу присоединиться к братству 'Кольца Воды'!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Правда? Значит, ты уже выполнил первое требование.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//Что ты хочешь этим сказать?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Должно быть, среди нас есть кто-то, кто доверяет тебе. В противном случае ты бы просто ничего не узнал.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Но я совсем ничего не знаю про тебя...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Что ты хочешь знать?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Ну, ты можешь рассказать мне, откуда ты пришел и зачем ты пришел в этот город.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//У меня важное сообщение для главы паладинов.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Что за сообщение?
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Драконы собрали огромную армию!",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Скоро произойдут ужасные вещи...",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Пока мы разговариваем, собирается огромная армия, ведомая драконами. Эта армия намеревается завоевать нашу страну.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Если это действительно правда, баланс на земле будет нарушен. Кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(задумчиво) Драконы? Ты говоришь о существах, которые до последнего времени упоминались только в легендах. Откуда ты знаешь это?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Ох, я где-то слышал об этом...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Мне сказал об этом маг Ксардас!",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Скоро произойдут ужасные вещи...
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Ага...(сердито) И кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Ужасные вещи, хммм...(задумчиво) Откуда ты знаешь это?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Ох, я где-то слышал об этом...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Мне сказал об этом маг Ксардас!",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Мне сказал об этом маг Ксардас! Он послал меня предупредить паладинов.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Я знаю этого человека как мудрого и могущественного мастера магии. А ты откуда пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Некромант... Так он жив... (задумчиво) И он послал тебя? А кто же ты тогда такой?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я искатель приключений с юга.",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я бывший заключенный колонии Хориниса.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ох, я где-то слышал об этом...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(раздраженно) Ты хотя бы помнишь, откуда ты пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Ага. И поэтому ты поделал весь этот долгий путь. Кто ты такой вообще?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я искатель приключений с юга.",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я бывший заключенный.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Хорошо, давай подытожим...
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Ты бывший заключенный...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Ты искатель приключений с юга...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//...которому сказал некромант Ксардас...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//...который слышал слухи...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//...о том, что пришли драконы, чтобы завоевать страну.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//...что скоро произойдут ужасные вещи.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//И ты пришел, чтобы сообщить это паладинам...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Это все звучит довольно фантастически, но я не думаю, что ты солгал мне.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Поэтому я вынужден предположить, что твои мотивы благородны.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Я хочу дать тебе шанс присоединиться к Кольцу Воды.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Мне кажется, что ты не все говоришь мне.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Если ты опасаешься, что я расскажу кому-нибудь о том, что ты поведаешь мне, то позволь мне уверить тебя.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Я поклялся хранить все секреты, которые доверяют мне, как свои собственные.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//А что насчет людей, стоящих здесь?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Они понимают только половину того, что я ПРОПОВЕДУЮ им. Так что не беспокойся.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Начнем с начала. Что это за сообщение?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Драконы собрали огромную армию!",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Скоро произойдут ужасные вещи...",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Я бывший заключенный колонии Хориниса.
	Vatras_Third = TRUE;
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Я искатель приключений с юга.
	Vatras_Third = FALSE;
	B_Vatras_INFLUENCE_REPEAT();
};


instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "Что я должен делать?";
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Что я должен делать?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Ты должен понимать, какую ответственность берешь на себя, вступая в наше общество.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Мы не принимаем кого попало.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Если хочешь присоединиться к обществу, ты должен доказать, что готов действовать как один из нас.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//Что это значит?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Перед тем как новый воин вступит в наши ряды, он должен совершить во благо Кольца великое деяние.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//И только после этого мы решаем, можно ли доверить ему великое дело по сохранению баланса сил на этом острове.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"И что же мне нужно сделать, чтобы убедить тебя?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Я освободил многих людей! Барьера больше нет.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Я уничтожил Спящего. Мне кажется, это достаточно великое деяние.",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Я уничтожил Спящего. Мне кажется, это достаточно великое деяние.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//В последнее время я слышал много невероятных историй.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Включая историю про уничтожение зверя, которого называют Спящим.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Я не слышал, чтобы это было совершено одним человеком, хотя в твоих глазах нет лжи.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Меня это немного смущает, но мои чувства иногда играют со мной злые шутки.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Я освободил многих людей! Барьера больше нет.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Даже если это действительно твоя работа...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Великое событие в Долине Рудников стало причиной освобождения не только магов воды, но и многих заключенных.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Преступники со всей страны рыщут в окрестностях Хориниса, угрожая местному населению.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Бандиты уже захватили огромные территории земель за пределами города. Теперь практически невозможно выйти за пределы города и вернуться обратно целым и невредимым.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//И что же мне нужно сделать, чтобы убедить тебя?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Хоринис столкнулся с великой загадкой.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Число людей, пропавших без вести, увеличивается с каждой минутой.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Если сумеешь объяснить мне причину их исчезновения, то займешь достойное место среди нас.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater,"Ватрас примет меня в Кольцо Воды только в том случае, если я найду пропавших людей.");

	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	SC_HearedAboutMissingPeople = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Однако...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Что еще?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//...сначала ты должен доставить сообщение паладинам.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Это дело первостепенной важности!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Поговори с лордом Хагеном!
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ватрас хочет, чтобы я передал лорду Хагену важное сообщение.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "Но лорд Хаген не станет меня принимать!";
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Но лорд Хаген не станет меня принимать!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Нет, примет, можешь не сомневаться. При условии, что сначала ты станешь членом влиятельного общества.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//У Кольца свои связи.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Мы поможем тебе передать сообщение как можно скорее.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Ты должен поговорить с Ларесом, ему я доверяю. Он поможет тебе.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Чтобы встретиться с лордом Хагеном, я должен вступить в одно из влиятельных сообществ Хориниса.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"В какое сообщество я должен вступить?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Так и сделаем.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//В какое сообщество я должен вступить?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Есть только три сообщества, которые обладают достаточной властью.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//А именно - городское ополчение, монастырь Магов Огня и отряд наемников на ферме землевладельца Онара.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_0A");	//Конечно, есть и другие, но они не так могущественны, как эти первые три. Возможно, ты сможешь присоединиться и к ним.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Выбор за тобой, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Ларес поможет тебе принять это непростое решение. Поговори с ним!
	VatrasTellOther = TRUE;
	B_LogEntry(TOPIC_Addon_RingOfWater,"Самые видные сообщества - это Маги Огня, городское ополчение и наемники. Cуществуют и другие гильдии, - правда, менее могущественные, чем эти три.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Так и сделаем.",DIA_Addon_Vatras_GuildBypass_BACK);
};

instance DIA_Addon_Vatras_GuildBypass_Other(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Other_condition;
	information = DIA_Addon_Vatras_GuildBypass_Other_info;
	permanent = FALSE;
	description = "Какие еще существуют сообщества, кроме самых влиятельных?";
};

func int DIA_Addon_Vatras_GuildBypass_Other_condition()
{
	if((VatrasTellOther == TRUE) && (TELLABOUTOTHERGUILD == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Other_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_Other_15_00");	//Какие еще существуют сообщества, кроме самых влиятельных?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_01");	//Ну... прежде всего это мы - маги Воды! На острове наше представительство не очень велико, но все-таки наш орден имеет большое влияние в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_02");	//Также я слышал, что бывшие болотники из Братства Спящего тоже образовали небольшую гильдию в этой части острова. Можешь попробовать присоединиться к ним.
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_Other_15_03");	//А еще?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_04");	//Хммм. Ну, кроме этого, я не исключаю возможность существования гильдии последователей Темного бога, Белиара! Хотя об этом вряд ли смогу рассказать тебе очень много.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_05");	//Думаю, тебе лучше спросить об этом Ксардаса.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_06");	//А так, в общем-то, все, наверное.
	TELLABOUTOTHERGUILD = TRUE;
};

instance DIA_ADDON_VATRAS_GUILDBYPASSKDW(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypasskdw_condition;
	information = dia_addon_vatras_guildbypasskdw_info;
	description = "А могу я присоединиться к вам, магам Воды?";
};

func int dia_addon_vatras_guildbypasskdw_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_GuildBypass) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypasskdw_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypassKDW_15_00");	//А могу я присоединиться к вам, магам Воды?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_01");	//Боюсь, здесь на острове мы не сможем организовать должное обучение желающему посвятить себя пути мага Воды.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_02");	//Правда, при определенных обстоятельствах мы могли бы, конечно, сделать исключение.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_03");	//Но этой возможности удостаивались немногие. Ибо данную честь необходимо, прежде всего, заслужить своими делами во славу Аданоса!
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_04");	//И кроме этого, избранный должен быть полностью свободен от обетов, данных другим богам.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_05");	//Только при этих условиях, возможно, ты сможешь вступить на этот путь.
		MIS_BECOMEKDW = LOG_Running;
		VATRASSAYABOUTKDW = TRUE;
		Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
		B_LogEntry(TOPIC_BECOMEKDW,"Если я докажу своими делами, что достоин чести вступить на путь служения Аданосу - то возможно смогу впоследствии начать свое обучение у магов Воды.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_06");	//Ты уже сделал свой выбор! Так что следуй твердо выбранному тобой пути.
	};
};

instance DIA_ADDON_VATRAS_HRAM(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HRAM_condition;
	information = DIA_ADDON_VATRAS_HRAM_info;
	permanent = FALSE;
	description = "А есть ли у магов Воды свой храм?";
};

func int DIA_ADDON_VATRAS_HRAM_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HRAM_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_ADDON_VATRAS_HRAM_01_00");	//А есть ли у магов Воды свой храм?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_01");	//К сожалению, нет. Мы несем слово Аданоса только в наших проповедях.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_02");	//Однако в древние времена строилось множество великолепных храмов и святилищ в его честь! 
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_03");	//Останки этих построек можно еще наблюдать во многих уголках нашего мира.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HRAM_01_04");	//А на этом острове?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_05");	//Насколько нам известно, в свое время тут существовала высокоразвитая цивилизация, по всей видимости, поклонявшаяся именно Аданосу.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_06");	//Но ко временам появления здесь поселенцев из Миртаны от нее осталась лишь небольшая часть строений на северо-востоке этого острова.
};

instance DIA_ADDON_VATRAS_HOWBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HOWBE_condition;
	information = DIA_ADDON_VATRAS_HOWBE_info;
	permanent = FALSE;
	description = "И как же мне заслужить эту честь?";
};

func int DIA_ADDON_VATRAS_HOWBE_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HOWBE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_00");	//И как же мне заслужить эту честь?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_01");	//Если ты хочешь моего совета, то лучше всего об этом поговорить с Сатурасом.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_02");	//Сатурас?! Тот самый Сатурас, возглавлявший круг Воды в Долине Рудников?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_03");	//Он самый. Сейчас он находится с остальными магами Воды на раскопках древних святынь. 
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_04");	//Заслужи его уважение и доверие! И тогда, возможно, он посвятит тебя в послушники нашего круга.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_05");	//Ну, а после у тебя будет возможность проявить себя, дабы стать уже одним из нас.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_06");	//Ладно, я все понял.
	B_LogEntry(TOPIC_BECOMEKDW,"Если я хочу начать свое обучение у магов Воды, то первым делом мне стоит поговорить с Сатурасом. Не думаю, что он будет рад меня видеть, учитывая, что я сделал с их рудой в Новом лагере.");
};

instance DIA_ADDON_VATRAS_WATERLINE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_WATERLINE_condition;
	information = DIA_ADDON_VATRAS_WATERLINE_info;
	permanent = FALSE;
	description = "Могу я чем-нибудь помочь?";
};

func int DIA_ADDON_VATRAS_WATERLINE_condition()
{
	if(MIS_BECOMEKDW != FALSE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_WATERLINE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_WATERLINE_01_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_ADDON_VATRAS_WATERLINE_01_01");	//(задумчиво) Возможно. У меня действительно есть несколько дел, которые не терпят отлагательств.
	AI_Output(self,other,"DIA_ADDON_VATRAS_WATERLINE_01_02");	//К сожалению, я не могу надолго отлучаться из города, и поэтому мне вполне пригодился бы помощник.
	Water_Line_Start = TRUE;
};

instance DIA_ADDON_VATRAS_LobartMeal(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_info;
	permanent = FALSE;
	description = "Что я должен сделать?";
};

func int DIA_ADDON_VATRAS_LobartMeal_condition()
{
	if(Water_Line_Start == TRUE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_01_00");	//Что я должен сделать?
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_01");	//Для начала сходи на ферму Лобарта. У него должна быть подготовлена для меня партия продовольствия.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_02");	//Я раздам его беднякам и всем, кто сейчас нуждается в этом.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_03");	//Вот, возьми триста монет. Отдашь их Лобарту за его посылку.
	B_GiveInvItems(self,other,ItMi_VatrasPurse,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_04");	//Только не вздумай забрать эти деньги себе. Иначе потом можешь не рассчитывать на мою помощь!
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_01_05");	//Да, конечно.
	MIS_LobartMeal = LOG_Running;
	Log_CreateTopic(TOPIC_LobartMeal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Running);
	B_LogEntry(TOPIC_LobartMeal,"Ватрас попросил меня сходить к Лобарту и забрать партию продовольствия для бедняков и обездоленных.");	
};

instance DIA_ADDON_VATRAS_LobartMeal_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_Done_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_Done_info;
	permanent = FALSE;
	description = "Я принес посылку от Лобарта.";
};

func int DIA_ADDON_VATRAS_LobartMeal_Done_condition()
{
	if((MIS_LobartMeal == LOG_Running) && (Npc_HasItems(other,ItMi_VatrasPacket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_Done_01_00");	//Я принес посылку от Лобарта.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_01");	//Отлично, сын мой! Отдай ее мне.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_Done_01_02");	//Конечно.
	B_GiveInvItems(other,self,ItMi_VatrasPacket,1);
	Npc_RemoveInvItems(self,ItMi_VatrasPacket,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_03");	//Благодарю, тебя. Теперь людям не придется голодать. По крайней мере, хотя бы некоторое время.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_04");	//За свою помощь ты заслужил небольшую награду.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_05");	//Вот, возьми эти целебные эликсиры! Они пригодятся тебе в твоих странствиях.
	B_GiveInvItems(self,other,ItPo_Health_01,3);
	MIS_LobartMeal = LOG_Success;
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Success);
	B_LogEntry(TOPIC_LobartMeal,"Я принес Ватрасу посылку с продовольствием.");	
};

instance DIA_ADDON_VATRAS_PureElixir(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_condition;
	information = DIA_ADDON_VATRAS_PureElixir_info;
	permanent = FALSE;
	description = "Что-нибудь еще?";
};

func int DIA_ADDON_VATRAS_PureElixir_condition()
{
	if(MIS_LobartMeal == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_01_00");	//Что-нибудь еще?
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_01");	//Хорошо, что ты спросил! У меня как раз заканчиваются эликсиры чистой магической энергии.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_02");	//Необходимо, чтобы ты сходил к алхимику Саландрилу и сделал ему заказ на новые зелья.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_03");	//Возьми эти двести монет в качестве аванса за его работу.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_04");	//Остальное он получит, когда выполнит мой заказ.
	MIS_VatrasPotion = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Running);
	B_LogEntry(TOPIC_VatrasPotion,"У Ватраса заканчиваются эликсиры чистой магической энергии. Он попросил сходить к алхимику Саландрилу и передать ему аванс за новую партию этих зелий.");	
};

instance DIA_ADDON_VATRAS_PureElixir_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_Done_condition;
	information = DIA_ADDON_VATRAS_PureElixir_Done_info;
	permanent = FALSE;
	description = "Я передал Саландрилу твой заказ.";
};

func int DIA_ADDON_VATRAS_PureElixir_Done_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (SalandrilPureElixir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_01_00");	//Я передал Саландрилу твой заказ.
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_01_01");	//Он сказал, что в течение этой недели пришлет тебе несколько десятков новых эликсиров.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_02");	//Хорошо. Это меня вполне устраивает.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_03");	//Больше ничего он не просил мне передать?
	MIS_VatrasPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Success);
	B_LogEntry(TOPIC_VatrasPotion,"Я передал слова Саландрила Ватрасу.");	
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
	Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Нет.",DIA_ADDON_VATRAS_PureElixir_Done_No);

	if(Npc_HasItems(other,ItPo_Mana_Addon_04) >= 2)
	{
		Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Да, чуть не забыл...",DIA_ADDON_VATRAS_PureElixir_Done_Yes);
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_No()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_01");	//Нет, больше ничего.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_02");	//Хммм. Ладно.
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

func void DIA_ADDON_VATRAS_PureElixir_Done_Yes()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_01");	//Да, чуть не забыл. Еще он просил передать тебе эти два эликсира на случай того, если они у тебя вдруг закончатся.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_03");	//Я рад, что Саландрил проявил такую заботу о моих потребностях.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_04");	//Но думаю, что будет лучше, если ты оставишь их себе, сын мой.
	VatrasPotionTruth = TRUE;
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

instance DIA_ADDON_VATRAS_ShadowBeast(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_info;
	permanent = FALSE;
	description = "А зачем тебе столько эликсиров маны?";
};

func int DIA_ADDON_VATRAS_ShadowBeast_condition()
{
	if(MIS_VatrasPotion == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_00");	//А зачем тебе столько эликсиров маны?

	if(VatrasPotionTruth == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_01");	//Дело в том, что почти каждый день мне приходится помогать раненым и больным людям.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_02");	//А все это, как ты понимаешь, требует больших затрат магической энергии!
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_03");	//Бывает даже так, что некоторые недуги невозможно вылечить, используя только одни целебные эликсиры.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_04");	//И тогда мне на помощь приходит магия Аданоса, способная порой творить чудеса!
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_05");	//Вот буквально вчера ко мне пришел один человек...
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_06");	//Какая-то злобная тварь его так сильно покусала, что он еле держался на ногах!
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_07");	//Мне пришлось применить свое магическое искусство, чтобы спасти ему жизнь.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_08");	//И после таких случаев я чувствую себя полностью опустошенным.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_09");	//Однако эликсиры маны помогают мне восстановить свои силы.
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_10");	//Понятно. А что за тварь так покусала этого беднягу?
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_12");	//По словам того человека, это был огромный мракорис! Кажется, он напал на него вблизи маяка. 
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_13");	//Уж лучше бы кто-нибудь позаботился об этом звере, пока тот не натворил еще больших бед.
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_14");	//Ну, может и найдется такой смельчак.
		MIS_VatrasBeast = LOG_Running;
		Log_CreateTopic(TOPIC_VatrasBeast,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Running);
		B_LogEntry(TOPIC_VatrasBeast,"Недавно неподалеку от маяка на одного горожанина напал огромный мракорис. Ватрас полагает, что следует разобраться с этим зверем, пока он не наделал еще больших бед.");	
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_15");	//Это тебя не должно волновать, сын мой.
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_16");	//Хммм... ладно.
	};
};

instance DIA_ADDON_VATRAS_ShadowBeast_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_Done_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_Done_info;
	permanent = FALSE;
	description = "С мракорисом покончено.";
};

func int DIA_ADDON_VATRAS_ShadowBeast_Done_condition()
{
	if((MIS_VatrasBeast == LOG_Running) && (Npc_IsDead(Shadowbeast_Vatras) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_00");	//С мракорисом покончено! Я убил того зверя.
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_01");	//Ты поступил правильно, сын мой. Хотя я тебя и не просил об этом.
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_02");	//Поэтому ты заслужил особенной награды.
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_03");	//Вот, прими этот свиток в качестве моего признания твоих благородных деяний.
	B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_04");	//Спасибо, отче!
	MIS_VatrasBeast = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Success);
	B_LogEntry(TOPIC_VatrasBeast,"Ватрас был доволен, узнав, что со зверем покончено, и щедро отблагодарил меня.");	
};

instance DIA_ADDON_VATRAS_MagicBook(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_condition;
	information = DIA_ADDON_VATRAS_MagicBook_info;
	permanent = FALSE;
	description = "Для меня будут еще поручения?";
};

func int DIA_ADDON_VATRAS_MagicBook_condition()
{
	if((MIS_VatrasPotion == LOG_Success) && (Npc_IsDead(VLK_447_Cassia) == FALSE) && (Npc_IsDead(VLK_445_Ramirez) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_00");	//Для меня будут еще поручения?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_01");	//(задумчиво) Даже не знаю. Я не уверен в том, стоит ли тебе поручать это дело.
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_02");	//А в чем проблема?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_03");	//Ну, хорошо. Недавно меня обокрали какие-то гнусные воры!
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_04");	//То, что они украли почти все золотые вещи, которые только смогли найти в доме, меня мало заботит.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_05");	//Но, ко всему прочему, они прихватили с собой еще и мой дневник, куда я записывал магические формулы изготовления рун.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_06");	//Эта вещь была очень ценна для меня. И мне, разумеется, хотелось бы вернуть ее обратно.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_08");	//Я уже обращался за помощью к лорду Андрэ, но его людям так и не удалось выйти на след вора.
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_09");	//Думаешь, если они не смогли, то и мне не справиться?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_10");	//Ты можешь попробовать, сын мой. Хотя мне кажется, что все это бесполезно.
	MIS_VatrasMagicBook = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasMagicBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Running);
	B_LogEntry(TOPIC_VatrasMagicBook,"Неизвестные воры ограбили дом Ватраса. Помимо золота, которое мало интересовало мага, они стащили его дневник, куда он записывал свои магические формулы. Надо бы помочь старику!");	
};

instance DIA_ADDON_VATRAS_MagicBook_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Done_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Done_info;
	permanent = FALSE;
	description = "Я нашел твой дневник.";
};

func int DIA_ADDON_VATRAS_MagicBook_Done_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (Npc_HasItems(other,ItWr_VatrasDiary) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_00");	//Я нашел твой дневник.
	B_GiveInvItems(other,self,ItWr_VatrasDiary,1);
	Npc_RemoveInvItems(self,ItWr_VatrasDiary,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Done_01_01");	//Благодарю тебя, сын мой. Надеюсь, что тебя не сильно обременили эти поиски?
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_02");	//Нет, все в порядке.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Done_01_03");	//Тогда вот - возьми эти магические свитки как награду за свои хлопоты.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceCube,1);
	CreateInvItems(other,ITSC_SUMSHOAL,2);
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_04");	//Спасибо.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook,"Я вернул дневник Ватрасу.");	
};

instance DIA_ADDON_VATRAS_MagicBook_Fail(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Fail_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Fail_info;
	permanent = FALSE;
	description = "Боюсь, я не смог найти твой дневник.";
};

func int DIA_ADDON_VATRAS_MagicBook_Fail_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (MagicBookCantFind == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Fail_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Fail_01_00");	//Боюсь, я не смог найти твой дневник.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Fail_01_02");	//Ничего страшного, сын мой. По крайней мере, ты попытался.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Fail_01_03");	//А это уже чего-то да стоит.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook,"Я сообщил Ватрасу, что не смог найти его дневник.");	
};

instance DIA_ADDON_VATRAS_LeeLetter(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetter_condition;
	information = DIA_ADDON_VATRAS_LeeLetter_info;
	permanent = FALSE;
	description = "У тебя есть еще задания для меня?";
};

func int DIA_ADDON_VATRAS_LeeLetter_condition()
{
	if((MIS_VatrasPotion == LOG_Success) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetter_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetter_01_00");	//У тебя есть еще задания для меня?
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetter_01_01");	//Мне нужно, чтобы ты отнес это письмо главарю наемников генералу Ли.
	B_GiveInvItems(self,other,ItWr_VatrasLee,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetter_01_02");	//Это очень важно! Поэтому лучше тебе поторопиться.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetter_01_03");	//Я все сделаю.
	MIS_LeeLetter = LOG_Running;
	Log_CreateTopic(TOPIC_LeeLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Running);
	B_LogEntry(TOPIC_LeeLetter,"Ватрас попросил меня отнести написанное им письмо генералу Ли, и сделать это как можно скорее.");	
};

instance DIA_ADDON_VATRAS_LeeLetterDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetterDone_condition;
	information = DIA_ADDON_VATRAS_LeeLetterDone_info;
	permanent = FALSE;
	description = "Я доставил твое письмо.";
};

func int DIA_ADDON_VATRAS_LeeLetterDone_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetterDone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetterDone_01_00");	//Я доставил твое письмо.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetterDone_01_01");	//Хорошо. Надеюсь, никаких трудностей при этом не возникло?
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetterDone_01_02");	//Нет, никаких. 
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetterDone_01_03");	//Я рад! Вот, возьми это золото за свои труды.
	B_GiveInvItems(self,other,ItMi_Gold,200);
};

instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "Я готов вступить в 'Кольцо воды'!";
};

func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if((SC_IsRanger == FALSE) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Я готов вступить в общество 'Кольца Воды'!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Значит, ты доставил сообщение лорду Хагену?
	if(Kapitel >= 1)
	{
		if((MIS_OLDWORLD != LOG_SUCCESS) && (Kapitel >= 2))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Но он послал меня в Долину Рудников, чтобы я достал доказательства моих слов!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Тебе решать, что делать дальше.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Мне было важно, чтобы он получил сообщение. Теперь ему решать - действовать самому или ждать твоих доказательств.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Если ты заинтересован...
		}
		else if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Нет, пока нет.
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_05_18");	//Но я нашел недостающие части орнамента для активации портала.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_17");	//Да...(одобрительно) Это заслуживает уважения! Но осталось еще одно незавершенное дело.
			AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Поговори с лордом Хагеном!
			AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Это дело первостепенной важности!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Хорошо.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Ты доказал, что нужен нам. Ты станешь одним из нас и будешь служить на благо Аданоса.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Я вручаю тебе это кольцо. Пусть оно поможет тебе найти твоих собратьев и вместе с ними хранить баланс сил в этом мире.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Ты первый маг огня среди нас. Я очень рад этому факту.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Да хранит тебя Аданос. А теперь иди и познакомься со своими братьями.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Они будут ждать тебя в таверне 'Мертвая Гарпия'. Братья готовы принять тебя в наше общество.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Ты наверняка знаешь эту таверну. Она находится по пути к ферме Онара.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Не забудь надеть кольцо, чтобы братья узнали тебя.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Я стал членом Кольца Воды. Мои новые братья ждут меня в таверне 'Мертвая Гарпия'.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Братья Кольца послали меня к тебе.";
};

func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if((Lares_TakeFirstMissionFromVatras == TRUE) && (CAPITANORDERDIAWAY == FALSE) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Братья Кольца послали меня к тебе.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Хорошо! Я ждал тебя!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Значит, ты доставил сообщение лорду Хагену?

	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Я отправлю тебя через портал, чтобы ты присоединился к остальным магам Воды.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Ты должен выследить бывшего рудного барона Ворона и узнать, с какой целью он похищает жителей города.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//А мы останемся здесь и попытаемся разобраться с бандитами.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Передай это письмо Сатурасу. Отныне он будет давать тебе задания.

			if(MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Ларес поможет тебе пройти к нему, если он уже не передал орнамент сам.
			};

			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Да пребудет с тобой Аданос!
		B_LogEntry(TOPIC_Addon_KDW,"Ватрас шлет меня с письмом к Сатурасу. Я должен теперь с другими магами воды пройти сквозь портал и идти по следам рудного барона Ворона.");
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_Sklaven,"Я должен выяснить, для чего Ворон взял в плен жителей Хориниса.");
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Нет, пока нет.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//В таком случае поспеши. Отправляйся к нему. Это сообщение очень важное!
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};

instance DIA_ADDON_VATRAS_CANGOPORTAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_cangoportal_condition;
	information = dia_addon_vatras_cangoportal_info;
	permanent = FALSE;
	description = "Сатурас ждет от тебя сообщения.";
};

func int dia_addon_vatras_cangoportal_condition()
{
	if((SATURASWAITSVATRASMESSAGE == TRUE) && (CANGOTOPORTAL == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportal_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CanGoPortal_15_00");	//Сатурас ждет от тебя сообщения, чтобы отправиться через портал.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_01");	//Ах да, я совсем забыл. Я сейчас же напишу ему письмо. А ты отнесешь его Сатурасу.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_02");	//Но для начала ответь мне на один вопрос.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_04");	//Ты передал сообщение лорду Хагену?

	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.

		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Но он послал меня в Долину Рудников, чтобы я достал доказательства моих слов!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Тебе решать, что делать дальше.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Мне было важно, чтобы он получил сообщение. Теперь ему решать - действовать самому или ждать твоих доказательств.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Что касается тебя...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Хорошо.
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Я отправлю тебя через портал, чтобы ты присоединился к остальным магам Воды.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Ты должен выследить бывшего рудного барона Ворона и узнать, с какой целью он похищает жителей города.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//А мы останемся здесь и попытаемся разобраться с бандитами.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Передай это письмо Сатурасу. Отныне он будет давать тебе задания.
			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		if((SC_IsRanger == FALSE) && (hero.guild == GIL_NDW))
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_05");	//И еще одна вещь. Поскольку ты являешься нашим послушником, тебе нет необходимости вступать в наше тайное общество - 'Кольцо Воды'.
			AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_06");	//Однако, чтобы наши братья по кольцу доверяли тебе, прими эту вещь в качестве их опозновательного знака.
			CreateInvItems(self,ItRi_Ranger_Addon,1);
			B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_07");	//Теперь все. Ступай к Сатурасу!
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Да пребудет с тобой Аданос!
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_Addon_Sklaven,"Я должен выяснить, для чего Ворон взял в плен жителей Хориниса.");
		B_LogEntry_Quiet(TOPIC_Addon_KDW,"Ватрас шлет меня с письмом к Сатурасу. Я должен теперь с другими магами воды пройти сквозь портал и идти по следам рудного барона Ворона.");
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		CANGOTOPORTAL = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Нет, пока нет.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//В таком случае, поспеши. Отправляйся к нему. Это сообщение очень важное!
		VATRASSENDHAGEN = TRUE;

		if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
		{
			RangerMeetingRunning = LOG_SUCCESS;
			B_SchlussMitRangerMeeting();
		};
	};
};


instance DIA_ADDON_VATRAS_CANGOPORTALTWO(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_cangoportaltwo_condition;
	information = dia_addon_vatras_cangoportaltwo_info;
	permanent = FALSE;
	description = "Я передал сообщение лорду Хагену.";
};

func int dia_addon_vatras_cangoportaltwo_condition()
{
	if((Kapitel >= 2) && (CANGOTOPORTAL == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportaltwo_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CanGoPortalTwo_15_00");	//Я передал сообщение лорду Хагену.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Хорошо! Я ждал тебя!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Я отправлю тебя через портал, чтобы ты присоединился к остальным магам Воды.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Ты пойдешь по следам бывшего рудного барона Ворона и узнаешь, зачем он воровал граждан Хориниса.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//А мы останемся здесь и попытаемся разобраться с бандитами.

	if(VatrasGiveLetterSaturas == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Отнеси это письмо Сатурасу. Впредь он будет руководить твоими действиями.
		CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
		B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
		VatrasGiveLetterSaturas = TRUE;
	};

	if((SC_IsRanger == FALSE) && (hero.guild == GIL_NDW))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_05");	//И еще одна вещь. Поскольку ты являешься нашим послушником, тебе нет необходимости вступать в наше тайное общество "Кольцо Воды".
		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_06");	//Однако, чтобы наши братья по кольцу доверяли тебе, прими эту вещь в качестве их опозновательного знака.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
	};
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortalTwo_15_03");	//Теперь все. Ступай к Сатурасу!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//И пусть Аданос направит тебя.
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_GivePlayerXP(100);
	B_LogEntry_Quiet(TOPIC_Addon_Sklaven,"Я должен выяснить, для чего Ворон взял в плен жителей Хориниса.");
	B_LogEntry(TOPIC_Addon_KDW,"Ватрас шлет меня с письмом к Сатурасу. Я должен теперь с другими магами воды пройти сквозь портал и идти по следам рудного барона Ворона.");
	CANGOTOPORTAL = TRUE;

	if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
	{
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};



var int missingpeopleinfo[20];

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = "Насчет людей, пропавших без вести...";
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//Насчет людей, пропавших без вести...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Да?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Я знаю, где находятся пропавшие люди.",DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Позволь рассказать тебе то, что я знаю...",DIA_Addon_Vatras_MissingPeople_Report);
	};
	if(DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Где мне их искать?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Где мне их искать?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Большинство людей исчезли у гавани. Тебе следует начинать свои поиски именно там.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Большинство из людей пропало в окрестностях порта. Лучше всего начать поиски именно там.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Позволь рассказать тебе то, что я знаю...
	if(((MIS_Akil_BringMissPeopleBack != 0) || (MIS_Bengar_BringMissPeopleBack != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Фермеры тоже потеряли своих близких.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Я узнал, что ответственность за эти исчезновения лежит на бандитах.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Элврих, ученик мастера Торбена, рассказал мне, что бандиты вывозят похищенных людей по морю.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//С этим как-то связаны пираты. Я пока не до конца понял их роль в этом мероприятии.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Я спас Элвриха от бандитов.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Бандиты захватили девушку по имени Люсия.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Люсия, девушка, похищенная бандитами, решила присоединиться к ним.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//По всей видимости, она присоединилась к ним по доброй воле.
		};
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Главаря бандитов зовут Декстер. Он несет ответственность за все эти похищения.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Я познакомился с Декстером на каторге. Тогда он работал на торговца рудой Гомеса.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//Он наверняка узнает тебя. Будь осторожен.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Мне кажется, ты на верном пути. Продолжай.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Что ты узнал?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Пока ничего важного.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Я знаю, где находятся пропавшие люди.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Что ты узнал?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Человек по прозвищу Ворон спрятал их в удаленной части Хориниса.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//Почему ты так уверен в этом?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Я читал его приказы. На него работают местные бандиты.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Вот.
		B_UseFakeScroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Отличная работа. Я боялся, что мы никогда не узнаем ответа на эту загадку.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Vatras_WhereAreMissingPeople);
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_11");	//Ты доказал что достоин присоединиться к нам.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_12");	//Если ты решишь присоединиться к магам Воды - поговори с Сатурасом.
	};
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "Пропавшие люди вернулись в свои дома.";
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Пропавшие люди вернулись в свои дома.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Хорошая работа, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Но ты должен продолжать свой путь. Да благословит тебя Аданос.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//О Аданос. Благослови этого воина! Освети его путь и даруй ему силу противостоять любым опасностям.
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_Addon_Vatras_Waffen(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = "Насчет этого торговца оружием...";
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//Насчет этого торговца оружием...
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Я знаю торговца, который продает оружие бандитам!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Как много ты знаешь про этого торговца?",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Как много ты знаешь про этого торговца?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Спроси Мартина, интенданта паладинов. Он сможет рассказать тебе больше.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Он должен вывести торговца оружием на чистую воду.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Ты найдешь Мартина в портовом районе. Когда увидишь кучу ящиков и множество паладинов, то знай: Мартин неподалеку.
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Я знаю торговца, который продает оружие бандитам!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Его зовут Фернандо.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Отлично. Мартин предпринял необходимые меры, чтобы остановить его?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Да. Мартин проследит за тем, чтобы он нескоро вышел из тюрьмы.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Хорошая работа, сын мой.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(с надеждой) А теперь вы примете меня в Кольцо Воды?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(улыбается) Мы не об ЭТОМ договаривались, и ты это знаешь.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Да осветит твой путь Аданос.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
		if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
		{
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_11");	//Ты доказал что достоин присоединиться к нам.
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_12");	//Если ты решишь присоединиться к магам Воды - поговори с Сатурасом.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//До сих пор еще нет.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Прошу тебя поторопиться и рассказать ему все. Это надо прекратить как можно быстрее.
	};
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "У меня с собой есть каменная табличка.";
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if((Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//У меня с собой есть каменная табличка. Не мог бы ты мне рассказать о ней что-нибудь?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Это артефакт древней культуры, которую мы давно исследуем.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Существует несколько разновидностей таких табличек. В некоторых из них содержится информация по истории древних народов.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//Меня интересуют именно они. Принеси мне все, какие сможешь найти.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Тебя будет ждать достойная награда.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "Я принес тебе еще таблички...";
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Vatras_Stoneplate) && (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

	AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Я принес тебе еще таблички...
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Отлично!

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//За это я повышу твои магические способности!
		B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Вот, возьми в награду несколько магических свитков...

		if(anzahl >= 25)
		{
			B_GiveInvItems(self,other,ItSc_AdanosBall,1);
			B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
			B_GiveInvItems(self,other,ItSc_Geyser,1);
		}
		else if(anzahl >= 15)
		{
			B_GiveInvItems(self,other,ItSc_IceWave,1);
			B_GiveInvItems(self,other,ItSc_LightningFlash,1);
		}
		else if(anzahl >= 10)
		{
			B_GiveInvItems(self,other,ItSc_Waterfist,1);
			B_GiveInvItems(self,other,ITSC_SUMSHOAL,1);
		}
		else if(anzahl >= 5)
		{
			B_GiveInvItems(self,other,ItSc_ThunderBall,1);
			B_GiveInvItems(self,other,ItSc_IceCube,1);
		}
		else if(anzahl > 1)
		{
			B_GiveInvItems(self,other,ItSc_Icebolt,1);
			B_GiveInvItems(self,other,ItSc_Icelance,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItSc_Zap,1);
		};
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Вот, возьми в награду несколько зелий...
		B_GiveInvItems(self,other,ItPo_Health_03,anzahl + 1);
	};

	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = "Ларес сказал, что ты можешь помочь мне попасть в монастырь магов огня.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if((RangerHelp_gildeKDF == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Ларес сказал, что ты можешь помочь мне попасть в монастырь магов огня.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//Это твой выбор? Идти по пути огня?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Да. Я хочу стать магом огня.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Насколько мне известно, они с радостью принимают послушников. Так зачем тебе нужна моя помощь?
	if(SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Послушник перед воротам монастыря требует, чтобы я заплатил за вход. Он требует овцу и золото.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Ларес упомянул, что они требуют плату за вход в монастырь.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//Я не смогу провести тебя в монастырь. Я все-таки маг воды, знаешь ли. Но я очень хорошо знаю мага огня Дарона.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Большую часть времени он проводит на рыночной площади, собирая пожертвования.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//Но я слышал, что иногда он отлучается из города.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Он рассказал мне о статуэтке, которую у него украли.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Эта вещица очень много значит для него. Если ты сумеешь вернуть статуэтку, он обязательно проведет тебя в монастырь.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Помни, что даже если ты вступишь в круг огня, ты все еще сможешь присоединиться к нам.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Если, конечно, докажешь свою полезность.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Маг огня Дарон поможет мне попасть в монастырь, если я найду его похищенную статуэтку.");
};

instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = "Я прошу твоего благословения.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Я прошу твоего благословения.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Почему я должен дать тебе мое благословение, чужеземец?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Я хочу стать учеником одного из мастеров в нижней части города.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Ступай с благословением Аданоса, сын мой!
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry(TOPIC_Thorben,"Маг воды Ватрас благословил меня.");
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Где мне найти жреца Инноса?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Segen == TRUE) && (Vatras_SentToDaron == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Где мне найти жреца Инноса?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Попробуй поискать его на рыночной площади. Ты найдешь там представителя монастыря.
};

var int VatrasBonusMana;

instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование Аданосу!";
};


func int DIA_Vatras_Spende_Condition()
{
	return TRUE;
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Я хочу сделать пожертвование Аданосу!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Пожертвование церкви Аданоса снимет часть грехов, которые ты мог совершить, сын мой.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Сколько ты можешь пожертвовать?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Мне сейчас нечем поделиться...",DIA_Vatras_Spende_BACK);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"У меня есть пятьдесят золотых монет...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"У меня есть сто золотых монет...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Мне сейчас нечем поделиться...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Это не проблема, ты можешь выразить свои добрые намерения позже, сын мой.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//У меня есть пятьдесят золотых монет...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Я благодарю тебя от имени Аданоса, сын мой. Твое золото будет роздано нуждающимся.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	PRAYSUM_VATR += 50;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};


	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//У меня есть сто золотых монет...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Я благословляю тебя от имени Аданоса за это большое пожертвование!
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Да будет путь, по которому ты идешь, благословлен Аданосом!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	PRAYSUM_VATR += 100;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};

	Info_ClearChoices(DIA_Vatras_Spende);
};

instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь из области магии?";
};

func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь из области магии?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Только Избранным Инноса и Избранным Аданоса позволено пользоваться магией рун.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Но обычные смертные также могут пользоваться магией при помощи свитков.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Я могу показать тебе, как направлять и усиливать свои магические способности.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Маг воды Ватрас может помочь мне повысить мои магические способности.");
};

instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};

func int DIA_Vatras_Teach_Condition()
{
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (other.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Регенерация маны (Очки обучения: 10, Цена: 5000 монет)",DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 500)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Твоя магическая энергия стала слишком велика, чтобы я мог еще повысить ее.
	};

	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_RegenMana()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Научи меня регенерации маны.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Vatras_Teach_regen_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Регенерация маны");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Регенерация маны (Очки обучения: 5, Цена: 15000 монет)",DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Регенерация маны (Очки обучения: 5, Цена: 15000 монет)",DIA_Vatras_Teach_RegenMana);
	};
};

instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Расскажи мне о богах.";
};

func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Расскажи мне о богах.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Что именно ты хочешь знать?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе ",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Хорошо. (проповедует) Иннос - первый и величайший из богов. Он создал солнце и мир.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Он повелевает светом и огнем - его даром человечеству. Он суть закон и правосудие.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Его жрецы - маги Огня, а паладины - его воины.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе ",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Расскажи мне об Аданосе.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Аданос - бог центра. Он - весы правосудия, страж равновесия между Инносом и Белиаром.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Он повелевает силой изменения. Его дар - вода во всех океанах, реках и озерах.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Его жрецы - маги Воды. Я тоже слуга и жрец Аданоса.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе ",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Расскажи мне о Белиаре.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Белиар - это темный бог смерти, разрушения и всего неестественного.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Он ведет вечную битву с Инносом, но Аданос стоит на страже баланса между этими двумя.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Только немногие люди следуют зову Белиара, однако он дарует огромную силу своим слугам.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе ",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Ты можешь вылечить меня?";
};

func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Ты можешь вылечить меня?

	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if((hero.guild == GIL_KDW) || (hero.guild == GIL_NDW))
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Аданос, благослови это тело! Освободи его от ран и вдохни в него силу новой жизни.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			BONUSCOUNT += 1;
		}
		else if((PRAYSUM_VATR >= 500) && (PRAYDAY2_VATR != Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_05");	//Ты много пожертвовал церкви Аданоса, сын мой, и я помогу тебе!
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//Аданос, благослови это тело! Освободи его от ран и вдохни в него силу новой жизни.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAY2_VATR = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else if(PRAYDAY2_VATR == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_03");	//Сегодня я уже помог тебе. Мои силы не безграничны, приходи завтра.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//И зачем мне это делать?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Сейчас ты не нуждаешься в магии исцеления.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//У меня есть сообщение для мастера Исгарота. Он охраняет часовню перед монастырем.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Если ты выполнишь это задание для меня, ты можешь выбрать вознаграждение.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Пока нет!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Конечно.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Хорошо. Так иди же к мастеру Исгароту.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Я сделаю это.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Хорошо, тогда доставь это сообщение и выбери один из этих свитков с заклинаниями.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//А когда ты доставишь сообщение, я вознагражу тебя соответствующим образом.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Ватрас дал мне записку для мастера Исгарота. Он находится в часовне неподалеку от монастыря.");
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Я выбираю свет.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Я выбираю малое лечение.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Я выбираю ледяную стрелу.",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Пока нет!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Нет проблем. Я отправлю кого-нибудь другого.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Я выбираю лечебное заклинание.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Дай мне Ледяную стрелу.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Я возьму заклинание света.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Я доставил твое сообщение.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Я доставил твое сообщение.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Прими мою благодарность. И свою награду!
	MIS_Vatras_Message = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_SUCCESS);
	B_LogEntry(TOPIC_Botschaft,"Я сообщил Ватрасу, что доставил письмо Исгароту.");
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Царский щавель.",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Кольцо ловкости.",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Кусок руды.",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Послушайте меня люди! Я нужен в другом месте.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Это не займет много времени. А когда я вернусь, я расскажу вам окончание этой истории.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Я не знаю, вернусь ли я. Если же вы хотите знать окончание, прочтите эту историю в писаниях.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Да пребудет с вами Аданос!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE;
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = "У меня сложности в связи с Глазом Инноса!";
};

func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if((Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == FALSE) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//У меня сложности в связи с Глазом Инноса! Я хотел попросить о помощи.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//И из-за твоей проблемы мне придется покинуть город?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//Я не знаю, возможно.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Я уже много дней жду, чтобы меня сменили. Остальные маги воды должны были уже вернуться в Хоринис.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Если ты сделаешь так, чтобы хотя бы один из них сменил меня, я смогу помочь тебе.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_VatrasAbloesung = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Ватрас не может помочь мне решить проблему с 'Глазом Инноса' пока не найдется еще одного Мага Воды, готового заменить его в городе.");
};

instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "Я нашел тебе смену.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if((MIS_VatrasAbloesung == LOG_Running) && (CAPITANORDERDIAWAY == FALSE) && (MyxirIsBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Я нашел тебе смену.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//Это очень хорошая новость! Будем надеяться, что ничего страшного больше не случится.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//ТЕПЕРЬ я могу помочь тебе.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Кажется дело касается Глаза Инноса, не так ли?
	};
	MIS_VatrasAbloesung = LOG_Success;
	VatrasCanLeaveTown_Kap3 = TRUE;
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Success);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Теперь Ватрас поможет мне с Глазом Инноса.");
};

instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Глаз Инноса поврежден.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Меня прислал Пирокар.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Меня прислал Ксардас.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Глаз Инноса поврежден.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Я знаю. Я уже узнал об этом от одного очень огорченного послушника.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Темные маги использовали Круг Солнца магов Огня, чтобы уничтожить Глаз.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Я бы назвал это вынужденным шагом врага.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"В этом городе новости распространяются быстро.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Почему Пирокар послал меня именно к тебе?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Что теперь будет с Глазом?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Что теперь будет с Глазом?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Мы должны восстановить его. Но это, боюсь, будет непростой задачей.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Оправа разбита на две части. Искусный кузнец должен быть способен починить ее.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Но проблема не в этом. Меня больше волнует драгоценный камень.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Он тускл и безжизнен. Враг, похоже, хорошо знал, как ослабить его.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Где мне найти кузнеца, способного починить оправу?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Как можно восстановить силу камня?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Как можно восстановить силу камня?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Я вижу только один способ. Союз трех правящих божеств должен дать желаемый эффект.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Хорошо подготовленный ритуал обращения в месте уничтожения камня вернет ему его огонь.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Однако проблема состоит в том, что ты должен привести в это место земных представителей каждого их этих троих богов.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Кроме того, для этого ритуала необходимо много болотной травы. Я думаю, необходимо не менее 3-х растений.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Кто может быть этими тремя земными представителями богов?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Где мне найти болотную траву?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Где мне найти болотную траву?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Я слышал о старой шаманке Сагитте, живущей в лесу. Предположительно, она продает такие травы.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Но также ты можешь попытать счастья в местной гавани.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Кто может быть этими тремя земными представителями богов?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Я буду представлять бога Аданоса лично.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Пирокар, высший маг Огня, был бы подходящей кандидатурой на представителя бога Инноса.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Но для Белиара, мне не приходит в голову подходящий кандидат. Это должен быть кто-то, кто владеет черной магией.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Черной магией? А что насчет Ксардаса?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Черной магией? А что насчет Ксардаса?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Точно. Это может сработать.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Но я задаю себе вопрос - как ты приведешь нас троих в одно место.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Представляю выражение лица Пирокара, когда он услышит, что должен работать рука об руку с Ксардасом.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Я должен идти.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Где мне найти кузнеца, способного починить оправу Глаза?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Поспрашивай вокруг о том, кто может ремонтировать драгоценности.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Почему Пирокар послал меня именно к тебе?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Я подозревал, что рано или поздно что-то подобное должно было случиться.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Пирокар всегда считал себя таким неуязвимым и непревзойденным, что это почти граничило с беспечностью.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Так, его меры предосторожности по защите Глаза были тоже беспечными.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Я просто думаю, что он подсознательно полагается на способности, которые Аданос даровал мне.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Невыносимо думать, что могло бы произойти, если бы я сейчас был недоступен.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//В этом городе новости распространяются быстро.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Это конечно хорошо, но враг тоже не будет спать.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Я тоже должен отправляться в путь, чтобы подготовить церемонию в Круге Солнца.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Пошли Ксардаса и Пирокара туда. И не забудь принести болотную траву. Я полагаюсь на тебя.
	B_LogEntry(TOPIC_INNOSEYE,"Ватрас хочет провести ритуал в Круге Солнца, чтобы восстановить Глаз. Я должен убедить Ксардаса и Пирокара принять в нем участие. Также, я должен найти кузнеца, который может починить поврежденную оправу амулета.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	Vatras_GoesToRitualInnosEye = TRUE;
	B_Vatras_GeheWeg(kurz);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};

instance DIA_ADDON_VATRAS_SEEKERS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_SEEKERS_condition;
	information = DIA_ADDON_VATRAS_SEEKERS_info;
	permanent = FALSE;
	description = "А кто такие эти темные странники";
};

func int DIA_ADDON_VATRAS_SEEKERS_condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_SEEKERS_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_ADDON_VATRAS_SEEKERS_01_00");	//А кто такие эти темные странники?
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_01");	//Это могущественные темные маги, начавшие служить Белиару еще в очень давние времена!
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_02");	//Они получили большую силу и власть, но в обмен их души поглотила демоническая магия Тьмы.
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_03");	//Даже после своей смерти, эти люди скованные своей клятвой остались призраками и служат своему хозяину.
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_04");	//Старайся держаться подальше от них! Ибо они крайне опасные создания...
};

instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Как обстоят дела с Глазом Инноса?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Как обстоят дела с Глазом Инноса?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Помни: только ритуал обращения в Круге Солнца вместе с Ксардасом и Пирокаром восстановит Глаз.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//И не забудь принести Глаз с отремонтированной оправой.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Я сделал все, как ты сказал мне.";
};

func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Я сделал все, как ты сказал мне! Вот починенный Глаз.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Да, теперь все готово для проведения ритуала.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//Что насчет болотной травы?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ах, да. Ты принес три стебля болотной травы?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Вот три растения.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Превосходно!
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Нет, боже мой, нет!
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Хорошо! Тогда нам придется обойтись без нее.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Ты хорошо поработал, но теперь отойди в сторону, чтобы мы могли начать церемонию. Да объединятся наши души!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Это прекрасно! Нам удалось расстроить план врага и вылечить глаз.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Пусть Пирокар объяснит тебе, как пользоваться его силой.

	if((JOINWATERRING == TRUE) && (YARKENDARTROUBLE == FALSE) && (RavenAway == TRUE) && (AWORCINVASIONSTART == FALSE))
	{
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_03");	//И еще кое-что. Поскольку ты состоишь в нашем тайном обществе 'Кольцо Воды', у меня есть к тебе одно очень важное поручение.
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_04");	//Мы давно не получали никаких вестей от нашей экспедиции в Яркендаре. Меня очень сильно тревожит этот факт!
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_05");	//Ты должен как можно скорее попасть туда и узнать, что там произошло. Это дело не терпит отлагательств!
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_06");	//Но прежде чем отправиться туда, обязательно поговори с Пирокаром. Теперь все.
		MIS_ADW_NEWSVATRAS = LOG_Running;
		Log_CreateTopic(TOPIC_ADW_NEWSVATRAS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_Running);
		Log_AddEntry(TOPIC_ADW_NEWSVATRAS,"Ватрас давно не получал никаких известий от Магов Воды в Яркендаре. Он просит меня отправиться туда и выяснить, что случилось.");
		YARKENDARTROUBLE = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Я надеюсь, я вновь увижу тебя, когда ты выполнишь свое задание. Удачи!
	B_LogEntry(TOPIC_INNOSEYE,"Глаз излечен. Пирокар даст его мне и объяснит, как с ним обращаться.");
	AI_StopProcessInfos(self);
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
};


instance DIA_VATRAS_NEWSFORVATRAS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = dia_vatras_newsforvatras_condition;
	information = dia_vatras_newsforvatras_info;
	description = "По поводу вестей от экспедиции...";
};


func int dia_vatras_newsforvatras_condition()
{
	if((YARKENDARTROUBLE == TRUE) && (AWORCINVASIONSTOP == TRUE) && (NEWSFORVATRAS == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_newsforvatras_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_00");	//По поводу вестей от экспедиции...
	AI_Output(self,other,"DIA_Vatras_NewsForVatras_01_01");	//Да? Что ты можешь сообщить?
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_02");	//Орки вторглись в долину. Сатурасу и другим магам пришлось скрыться в храме у древних развалин.
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_03");	//Они опасались, что орки проникнут через портал в Хоринис.
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_06");	//Но сейчас все нормально. Я уладил эту проблему!
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_07");	//Все маги Воды целы и приступили вновь к изучению древних реликвий Яркендара.
	AI_Output(self,other,"DIA_Vatras_NewsForVatras_01_08");	//Да благословит тебя Аданос, сын мой! Ты принес воистину хорошие новости.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_ADW_NEWSVATRAS = LOG_SUCCESS;
	Log_AddEntry(TOPIC_ADW_NEWSVATRAS,"Я рассказал Ватрасу о том, что случилось в Яркендаре. Он был очень доволен тем, что мне удалось помочь магам Воды решить эту проблему с орками.");
	Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_SUCCESS);
	NEWSFORVATRAS = TRUE;
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Спасибо, что помог восстановить Глаз Инноса.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Спасибо, что помог восстановить Глаз Инноса.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Оставь пустые слова благодарности. Самое тяжелое еще ждет тебя впереди.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Поговори с Пирокаром, он объяснит все, что тебе нужно знать.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Надеюсь, увидеть тебя опять целым и невредимым, сын мой.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Жена Лобарта, Хильда, больна.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Жена Лобарта, Хильда, больна.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Что? Опять? Эта добрая женщина должна больше заботиться о себе.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Еще одна тяжелая зима, и ее с нами больше не будет. Хорошо, я дам ей лекарство, которое облегчит лихорадку.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Ох, знаешь, раз все равно ты здесь, ты мог бы занести ей его.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Я ощущаю внутреннюю тревогу.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Я ощущаю внутреннюю тревогу.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Да, и выглядишь ты бледно. Ты слишком долго подвергался воздействию черного взгляда темных странников.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Все, что я могу - это вылечить твое тело, но только монастырь может очистить твою душу. Поговори с Пирокаром. Он поможет тебе.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Драконы больше не будут сеять хаос.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Драконы больше не будут сеять хаос.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Я знал, что ты вернешься в добром здравии. Однако самое суровое испытание еще ждет тебя впереди.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Я знаю.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Тогда найди себе снаряжение получше и приходи ко мне, если тебе нужна помощь. И всегда носи с собой Глаз Инноса, слышишь? Аданос благословляет тебя.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я знаю, где находится наш враг.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Я знаю, где находится наш враг.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Тогда не будем терять времени и найдем его в его логове, пока он сам не пришел к нам.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Ты хочешь сопровождать меня?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Я много думал об этом. Да, я никогда не был так уверен в своем выборе, мой друг.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Как это ни странно, Ватрас предложил мне сопровождать меня в моем путешествии. Человек, обладающий его навыками и опытом, может оказаться очень полезным для меня.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//В моем списке и так уже слишком много народа. Боюсь, там не найдется места для тебя.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Так освободи место. Я тебе понадоблюсь.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Мне нужно еще подумать об этом.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Я сочту за честь, что ты будешь на моей стороне.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Я сочту за честь, что ты будешь на моей стороне. Встретимся в гавани.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Только не трать время понапрасну. Помни, друг мой, враг не дремлет.
	B_GivePlayerXP(XP_Crewmember_Success);
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Мне нужно еще подумать об этом.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Как знаешь. Возвращайся ко мне, если передумаешь.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Тебе лучше остаться здесь. Ты нужен городу.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Тебе лучше остаться здесь. Ты нужен городу.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Возможно, ты прав. И все же я готов сопровождать тебя, если ты этого захочешь. Ты знаешь это.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Поплывем вместе на вражеский остров.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Сопровождай меня к острову врага.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Мудрое решение! Я надеюсь, ты на нем остановишься.
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(lang);
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


instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_PRAYFORGOMEZ(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_prayforgomez_condition;
	information = dia_addon_vatras_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_vatras_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_00");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_03");	//О ком ты говоришь, сын мой?
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_04");	//Я хотел, чтобы Аданос даровал прощение одной из неупокоенных в этом мире душ.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_05");	//Хммм. Это немного меняет дело.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_06");	//И чья же эта душа?
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_07");	//При жизни его звали Гомез. Он - бывший рудный барон!
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_20");	//Другому, кто бы пришел ко мне с такой просьбой, - я бы сразу же отказал.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_21");	//Но не тебе.
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_22");	//Значит ли это, что его душа получит прощение Аданоса?
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_23");	//Да, я помогу тебе.
	Info_ClearChoices(dia_addon_vatras_prayforgomez);
	Info_AddChoice(dia_addon_vatras_prayforgomez,"(просить благословение Аданоса)",dia_addon_vatras_prayforgomez_ok);
};

func void dia_addon_vatras_prayforgomez_ok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_00");	//Божественной мудростью Аданоса и силой, данной мне Водой...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_01");	//...я дарую этой грешной душе прощение...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_02");	//...и пусть священная Вода очистит ее от грехов...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_03");	//...и даст ей упокоение в этом мире!
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_04");	//Это все. Теперь ты можешь идти, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_05");	//Да пребудет с тобой Аданос!
	RESCUEGOMEZPRAYADANOS = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от мага Воды, Ватраса.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Я получил прощение для души Гомеза от всех богов. Теперь необходимо отправляться в Старую шахту.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_ABOUTORKS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutorks_condition;
	information = dia_addon_vatras_aboutorks_info;
	permanent = FALSE;
	description = "Какова ситуация в монастыре?";
};


func int dia_addon_vatras_aboutorks_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutorks_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_00");	//Какова ситуация в монастыре?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_01");	//Все в порядке, сын мой. Здесь мы пока что все в полной безопасности!
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_02");	//Однако меня очень сильно беспокоят те вещи, которые сейчас творятся за пределами его стен.
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_04");	//Боюсь тебя расстроить, но там ситуация еще намного хуже!
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_05");	//Орки практически полностью захватили эту часть острова, и только ферма Онара до сих пор не была ими атакована.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_06");	//О всемогущий Аданос! И как только ты смог допустить это?
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermage_condition;
	information = dia_addon_vatras_aboutwatermage_info;
	permanent = FALSE;
	description = "А где остальные маги Воды?";
};


func int dia_addon_vatras_aboutwatermage_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE) && (BEWAREWATERMAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_00");	//А где остальные маги Воды?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_01");	//Полагаю, что они до сих пор находятся в неизвестной нам части острова.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_02");	//И, по правде говоря, меня все это очень сильно беспокоит!
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_03");	//Что именно тебя тревожит?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_04");	//Наверняка им еще не ведом тот факт, что орки вторглись в Хоринис.
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_06");	//Тогда необходимо их как-то предупредить об этом.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_07");	//Я полностью согласен с тобой, сын мой! Однако мне самому сейчас нельзя покидать стены этого монастыря.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_08");	//Поскольку Пирокару и его магам Огня все еще нужна моя помощь, чтобы защитить монастырь от этих тварей.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_09");	//Хммм...(задумчиво) А вот ты вполне мог бы сообщить им эту новость.
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
	Info_AddChoice(dia_addon_vatras_aboutwatermage,"У меня сейчас нет на это времени.",dia_addon_vatras_aboutwatermage_no);
	Info_AddChoice(dia_addon_vatras_aboutwatermage,"Почему бы и нет?",dia_addon_vatras_aboutwatermage_ok);
};

func void dia_addon_vatras_aboutwatermage_no()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_No_01_00");	//У меня сейчас нет на это времени.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_No_01_01");	//Конечно, сын мой. Я все понимаю.
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};

func void dia_addon_vatras_aboutwatermage_ok()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_00");	//Почему бы и нет?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_01");	//Спасибо, сын мой. Я знал, что могу рассчитывать на твою помощь.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_02");	//Только умоляю тебя, поспеши! Нам сейчас дорога каждая минута.
	MIS_BEWAREWATERMAGE = LOG_Running;
	Log_CreateTopic(TOPIC_BEWAREWATERMAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_Running);
	B_LogEntry(TOPIC_BEWAREWATERMAGE,"Ватрас попросил меня предупредить остальных магов Воды об опасности, которая подстерегает их в Хоринисе.");
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGEDONE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermagedone_condition;
	information = dia_addon_vatras_aboutwatermagedone_info;
	permanent = FALSE;
	description = "Я предупредил остальных магов Воды об опасности.";
};


func int dia_addon_vatras_aboutwatermagedone_condition()
{
	if((MIS_BEWAREWATERMAGE == LOG_SUCCESS) && (MOVEFORCESCOMPLETE_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermagedone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMageDone_01_01");	//Я предупредил остальных магов Воды об опасности.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMageDone_01_02");	//Хорошо, сын мой. Я рад, что тебе удалось это сделать.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMageDone_01_03");	//Вот - прими от меня это золото в качестве моей благодарности. Ты заслужил эту награду!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_ADDON_VATRAS_ABOUTBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutbigbattle_condition;
	information = dia_addon_vatras_aboutbigbattle_info;
	permanent = FALSE;
	description = "Сражение с орками обещает быть трудным.";
};


func int dia_addon_vatras_aboutbigbattle_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutbigbattle_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutBigBattle_01_00");	//Сражение с орками обещает быть трудным.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutBigBattle_01_01");	//Не беспокойся за нас...(улыбаясь) Мы к нему готовы.
};


instance DIA_ADDON_VATRAS_AFTERBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_afterbigbattle_condition;
	information = dia_addon_vatras_afterbigbattle_info;
	permanent = FALSE;
	description = "Как ты?";
};


func int dia_addon_vatras_afterbigbattle_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_afterbigbattle_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AfterBigBattle_01_00");	//Как ты?
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_01");	//Со мной все хорошо, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_02");	//Однако, как видишь, этого нельзя сказать об остальных из нас.
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_03");	//(мрачно) Так много нас погибло...
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_04");	//Мне крайне тяжело наблюдать за всем этим.
};


instance DIA_ADDON_VATRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_runemagicnotwork_condition;
	information = dia_addon_vatras_runemagicnotwork_info;
	permanent = FALSE;
	description = "Ты все еще можешь использовать свою рунную магию?";
};


func int dia_addon_vatras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_RuneMagicNotWork_01_00");	//Ты все еще можешь использовать свою рунную магию?
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_01");	//Боюсь тебя огорчить, сын мой. Все мои магические руны каким-то образом утратили свою силу.
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_02");	//Причем не только у меня, но и других магов Воды тоже! И я даже понятия не имею о том, как это могло произойти.
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_03");	//Возможно, в этом мире произошло нечто страшное и непоправимое, если сейчас мы все вдруг утратили этот дар.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, маги Воды также потеряли свою способность использовать рунную магию.");
	WATERMAGERUNESNOT = TRUE;
};


//--------------------линейка Яркендара про нежить-------------------------------

instance DIA_Vatras_JarCurse(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_JarCurse_Condition;
	information = DIA_Vatras_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Vatras_JarCurse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_DarkOrden == LOG_Success) && (HagenSendVat == TRUE) && (DO_SendToHagen == TRUE) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurse_Info()
{
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_00");	//Хорошо, что ты пришел, сын мой!
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_01");	//О чем ты хотел поговорить со мной?
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_02");	//Кажется, для нас настали темные времена. Поэтому я вынужден обратиться к тебе за помощью!
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_03");	//Я тебя внимательно слушаю.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_04");	//Недавно до меня дошли слухи, что недалеко от наших раскопок рядом с пирамидами видели несколько мертвых воинов.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_05");	//Однако они не были похожи на ту нежить, с которой нам приходилось сталкиваться здесь ранее!
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_06");	//Я уже отправил туда Миксира и еще одного нашего брата, дабы прояснить сложившуюся ситуацию.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_07");	//Но от них до сих пор нет никаких вестей.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_08");	//Все это меня очень беспокоит. Уж не случилось ли с ними чего худого!
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_09");	//Я понимаю, к чему ты клонишь.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_10");	//Значит, я могу рассчитывать на твою помощь?
	Info_ClearChoices(DIA_Vatras_JarCurse);
	Info_AddChoice(DIA_Vatras_JarCurse,"Конечно! Я помогу тебе.",DIA_Vatras_JarCurse_Yes);
	//Info_AddChoice(DIA_Vatras_JarCurse,"Извини, но у меня сейчас нет на это времени.",DIA_Vatras_JarCurse_No);
};

func void DIA_Vatras_JarCurse_Yes()
{
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_01");	//Конечно. Я помогу тебе.
	AI_Output(self,other,"DIA_Vatras_JarCurse_Yes_01_02");	//Благодарю тебя, сын мой. Это было очень благородно с твоей стороны.
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_03");	//Ладно, оставим все эти хвальбы. Лучше скажи, как давно ты послал Миксира на раскопки?
	AI_Output(self,other,"DIA_Vatras_JarCurse_Yes_01_04");	//Три дня назад. Так что лучше поспешить, пока не слишком поздно.
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_05");	//Тогда отправлюсь туда немедленно.
	MIS_JarCurse = LOG_Running;
	Log_CreateTopic(TOPIC_JarCurse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarCurse,LOG_Running);
	B_LogEntry(TOPIC_JarCurse,"По словам Ватраса, недалеко от раскопок магов Воды, рядом с пирамидами, видели несколько мертвых воинов. Ватрас послал Миксира и еще одного мага туда, чтобы разобраться в ситуации. Однако от них до сих пор нет никаких вестей! Ватрас попросил меня отправиться к пирамидам и выяснить все, что удастся.");	
	AI_StopProcessInfos(self);
	B_KillNpc(pal_188_ritter);
	B_KillNpc(pal_189_ritter);
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_04");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_10");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_09");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_12");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_24");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_20");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_19");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_17");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_16");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_18");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_22");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_01");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_STUDY_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_06");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_04A");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_JC,"EXIT_ADDON");

	//------атака Миксира и Митраса--------------------------------

	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_41");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_40");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
};

func void DIA_Vatras_JarCurse_No()
{
	AI_Output(other,self,"DIA_Vatras_JarCurse_No_01_01");	//Извини, но у меня сейчас нет на это времени.
	AI_Output(self,other,"DIA_Vatras_JarCurse_No_01_02");	//Как скажешь, сын мой. Но в любом случае благодарю тебя за то, что ты выслушал меня.
	AI_StopProcessInfos(self);
};

instance DIA_Vatras_JarCurseDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_JarCurseDone_condition;
	information = DIA_Vatras_JarCurseDone_info;
	permanent = FALSE;
	description = "Миксир снова вернулся в город.";
};

func int DIA_Vatras_JarCurseDone_condition()
{
	if((MyxirSendSaturas == TRUE) && (Npc_IsDead(KDW_140300_Addon_Myxir_CITY) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurseDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_01");	//Миксир снова вернулся в город.
	AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_02");	//Да, я знаю. Он рассказал мне обо всем, что случилось на раскопках храма.
	AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_03");	//Надеюсь, ты уже побывал у Сатураса?

	if(MeetSaturasOkPortal == TRUE)
	{
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_04");	//Конечно! Я говорил с ним.
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_05");	//Значит, они живы. Этим ты меня немного успокоил.
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_06");	//Но в любом случае я благодарю тебя за помощь с Миксиром.
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_07");	//Еще нет.
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_08");	//Тогда не стоит терять времени! Немедленно отправляйся к ним.
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_09");	//Ладно, ладно. Уже иду.
	};
};

instance DIA_Vatras_MAXROBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_condition;
	information = DIA_Vatras_MAXROBE_info;
	permanent = FALSE;
	description = "Как насчет робы получше?";
};

func int DIA_Vatras_MAXROBE_condition()
{
	if((hero.guild == GIL_KDW) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDW == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Vatras_MAXROBE_01_00");	//Как насчет робы получше?
	AI_Output(self,other,"DIA_Vatras_MAXROBE_01_01");	//Поскольку ты владеешь всеми шестью кругами магии, ты достоин носить робу архимага Воды.
	AI_Output(self,other,"DIA_Vatras_MAXROBE_01_02");	//Однако тебе придется за нее заплатить. Она слишком дорогая в изготовлении, чтобы мы отдавали ее просто так даром.
	AI_Output(other,self,"DIA_Vatras_MAXROBE_01_03");	//Понимаю.
	LastRobeKDW = TRUE;
};

instance DIA_Vatras_MAXROBE_Buy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_Buy_condition;
	information = DIA_Vatras_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Продай мне робу архимага Воды! (Цена: 20000 монет)";
};

func int DIA_Vatras_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDW) && (LastRobeKDW == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Vatras_MAXROBE_Buy_01_00");	//Продай мне робу архимага Воды!

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_01");	//Хорошо! Вот - держи ее.
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_02");	//Это огромная честь носить подобное одеяние. Помни об этом.
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_01_03");	//У тебя недостаточно золота.
	};
};

instance DIA_Vatras_WolfAndMan(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_WolfAndMan_condition;
	information = DIA_Vatras_WolfAndMan_info;
	permanent = FALSE;
	description = "У меня к тебе очень необычное дело.";
};

func int DIA_Vatras_WolfAndMan_condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (SagittaWereWolf == TRUE) && (WereWolfIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WolfAndMan_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_00");	//У меня к тебе очень необычное дело.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_01");	//Хорошо. Я слушаю тебя.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_02");	//Одному человеку очень нужна твоя помощь! Точнее, это как бы не совсем человек...
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_03");	//(удивленно) Ты говоришь загадками, сын мой.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_04");	//Ну, это человек, но только он в теле зверя!
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_05");	//На него наложили заклинание превращения, но вернуться в свое тело он так и не смог.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_06");	//(серьезно) И ты хочешь, чтобы я вернул ему обратно человеческий облик? Я прав?
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_07");	//Именно так.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_08");	//Извини. Не хочу тебя расстраивать, но, боюсь, ему никто не сможет в этом помочь.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_09");	//Подобные вещи неподвластны никому! Даже самым могущественным магам этого мира.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_10");	//Единственное, что я могу сделать - это вернуть ему человеческое сознание.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_11");	//Он останется в теле зверя, но будет думать и рассуждать, как человек.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_12");	//Ну, тогда сделай хотя бы это.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_13");	//(серьезно) Хорошо, подожди минутку...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_14");	//Вот, возьми этот магический свиток и используй его на том звере.
	B_GiveInvItems(self,other,ItWr_VatrasTransferMagic,1);
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_15");	//Но большего не проси...
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_16");	//Хорошо. Я понимаю.
	VatrasGiveSpell = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Ватрас способен вернуть помощнику Игнаца лишь человеческое сознание. На остальное можно не рассчитывать! Он дал мне магический свиток. который я должен буду использовать на мракорисе.");
};

instance DIA_ADDON_VATRAS_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Ты можешь помочь мне в моих поисках?";
};

func int dia_addon_vatras_wisp_condition()
{
	if(MIS_Vatras_FindTheBanditTrader != FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Ты можешь помочь мне в моих поисках?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Ты очень настойчивый юноша. Но я действительно могу кое-что тебе дать, чтобы облегчить тебе задачу.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Я дам тебе этот амулет. Тебе он пригодится.
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Это амулет ищущего огонька.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Очень редкая вещь! Ищущий огонек, который живет в этом амулете, обладает особыми свойствами.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Он будет помогать тебе искать предметы, которые без него ты мог бы и не найти.
	//AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Чтобы вызвать огонька, просто надень амулет.
	//AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Если огонек потеряет свою силу или потеряется, сними амулет и надень его снова, и огонек вернется.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Храни его, и он никогда не подведет тебя.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Спасибо! Я обязательно воспользуюсь им.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"А что еще может делать ищущий огонек?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Ищущий огонек в амулете?",dia_addon_vatras_wisp_amulett);
	SC_GotWisp = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Спасибо! Я обязательно воспользуюсь им.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//А что еще может делать ищущий огонек?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Мне кажется, Риордан знает, как обучать эти штуки. Он один из нас, и в данный момент он путешествует вместе с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Возможно, он сможет рассказать тебе больше.
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//Ищущий огонек в амулете?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Ищущие огоньки - это удивительные существа. Они полностью состоят из магической энергии.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Они связаны с магической рудой этого мира. Она дает им силу.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Меня не удивляет, что ты никогда не слышал о них. Они являются только людям, у которых при себе есть их родная руда.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Ищущие огоньки были насильно изгнаны со своих земель.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Мы никак не можем помочь этим несчастным созданиям. Тебе лучше держаться от них подальше.
};

var int VatrasInspectRing;
var int VatrasInspectScroll;

instance DIA_Addon_Vatras_DarkWeb(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Info;
	permanent = FALSE;
	description = "Ты можешь взглянуть на одно кольцо?";
};

func int DIA_Addon_Vatras_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_HasItems(hero,ItMi_LotarRing) >= 1) && (FindLotarRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_01");	//Ты можешь взглянуть на одно кольцо?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_02");	//Конечно, сын мой. Покажи мне его.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_03");	//Вот.
	B_GiveInvItems(other,self,ItMi_LotarRing,1);
	Npc_RemoveInvItems(self,ItMi_LotarRing,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_04");	//(с сомнением) С виду это обычное серебряное кольцо. Хотя...
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_05");	//Видишь это слабое магическое свечение вокруг него? Скорее всего, это остаток воздействия на него какой-то магии.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_06");	//Причем, насколько я могу судить, довольно могущественной! Только она могла оставить магический отпечаток на этом кольце.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_07");	//И что это за магия?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_08");	//Пока не знаю. Мне нужно время, чтобы доскональнее изучить этот предмет. Оставь кольцо мне и загляни ко мне завтра.
	VatrasInspectRing = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb,"Осмотрев кольцо, Ватрас пришел к выводу, что свечение кольца вызвано воздействием могущественной магии. Он оставил кольцо себе, чтобы понять природу этой магии. Мне стоит заглянуть к нему завтра.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Done_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Done_Info;
	permanent = FALSE;
	description = "Тебе что-нибудь удалось узнать?";
};

func int DIA_Addon_Vatras_DarkWeb_Done_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb) == TRUE) && (VatrasInspectRing < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_01");	//Тебе что-нибудь удалось узнать?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_02");	//И даже больше, чем я предполагал. Но у меня к тебе один вопрос - откуда у тебя это кольцо?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_03");	//Оно принадлежало паладину Лотару, который недавно был подло убит. А кольцо я нашел недалеко от места убийства.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_04");	//Тогда это многое объясняет. Эта магия - не что иное, как темная магия Белиара!
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_05");	//Причем настолько сильная, что даже мне было опасно соприкасаться с ней. Тот, кто ее использовал, наверняка очень могущественный маг.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_06");	//А есть что-нибудь, что поможет найти его?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_07");	//Что ты задумал?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_08");	//Лорду Хагену нужна голова убийцы Лотара, и я ни перед чем не остановлюсь, пока не заполучу ее.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_09");	//Ты хотя бы осознаешь, с чем тебе предстоит столкнуться?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_10");	//Вполне. Так ты поможешь мне?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_11");	//Хорошо. Но для этого мне понадобится одна из вещей, принадлежавших этому магу. Без нее все наши попытки определить его местоположение будут тщетны.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_12");	//Тогда попробую что-нибудь найти.

	B_LogEntry(TOPIC_DarkWeb,"По словам Ватраса, отпечаток на кольце остался от темной магии Белиара. Использовать такую мог только очень могущественный маг. Чтобы выследить его, Ватрасу потребуется какая-нибудь вещь, с которой соприкасался маг. Осталось только понять, где ее искать.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Wait(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Wait_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Wait_Info;
	permanent = FALSE;
	description = "У меня есть магический свиток, который использовал убийца Лотара.";
};

func int DIA_Addon_Vatras_DarkWeb_Wait_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb_Done) == TRUE) && (Npc_HasItems(hero,ItMi_DarkScroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Wait_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Wait_01_01");	//У меня есть магический свиток, который использовал убийца Лотара. Это сгодится?
	B_GiveInvItems(other,self,ItMi_DarkScroll,1);
	Npc_RemoveInvItems(self,ItMi_DarkScroll,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_02");	//(с отвращением) Я уже чувствую, что за магия в нем заключена.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_03");	//Теперь я должен хорошенько подготовиться к задуманному нами. А ты пока можешь отдохнуть.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_04");	//Это займет не более одного дня.
	VatrasInspectScroll = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb,"Я отдал магический свиток Ватрасу. Теперь ему нужно время, чтобы подготовить нечто, что поможет найти нам убийцу Лотара. Надо заглянуть к нему завтра.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Ready(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Ready_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Ready_Info;
	permanent = FALSE;
	description = "Ты уже закончил приготовления?";
};

func int DIA_Addon_Vatras_DarkWeb_Ready_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb_Wait) == TRUE) && (VatrasInspectScroll < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Ready_01_01");	//Ты уже закончил приготовления?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_02");	//Да, возьми эту магическую руну.
	B_GiveInvItems(self,other,ItMi_Darktransfer,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_03");	//Просто используй ее, и она перенесет тебя туда, где ты найдешь ответ на свой вопрос.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_04");	//Но мой тебе совет: прежде как следует подготовься. То, с чем ты там столкнешься, может плохо закончиться для тебя.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Ready_01_05");	//Спасибо.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_06");	//Да хранит тебя Аданос, сын мой.
	B_LogEntry(TOPIC_DarkWeb,"Ватрас дал мне руну, которая перенесет меня туда, где скрывается убийца Лотара. Мне стоит хорошо подготовиться, прежде чем использовать ее.");
	AI_StopProcessInfos(self);
};