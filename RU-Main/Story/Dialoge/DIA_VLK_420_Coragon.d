
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_PICKPOCKET(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 900;
	condition = DIA_Coragon_PICKPOCKET_Condition;
	information = DIA_Coragon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Coragon_PICKPOCKET_Condition()
{
	return C_Beklauen(40,45);
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,Dialog_Back,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "Могу я выпить здесь?";
};

func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Могу я выпить здесь?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Если у тебя есть деньги, ты здесь можешь даже поесть.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Я могу покупать еду и питье у трактирщика Корагона.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};

instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Как идут дела?";
};

func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//А, не спрашивай...(с досадой) На главной площади по приказу лорда Андрэ раздают бесплатное пиво!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Ко мне практически никто не заходит. Ну, кроме этих богачей из верхнего квартала.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//А что с ними не так?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//Некоторые из этих франтов ужасно действуют на нервы.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Взять хотя бы Валентино. Я его просто не переношу.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Но клиентов мне выбирать не приходится! Сейчас мне дорога каждая монетка.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//Все, что мне удалось скопить, у меня украли вместе с моим серебром.
};

instance DIA_Coragon_FixBeer(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Condition;
	information = DIA_Coragon_FixBeer_Info;
	permanent = FALSE;
	description = "Может, я смогу чем-то помочь с посетителями?";
};

func int DIA_Coragon_FixBeer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Info()
{
	AI_Output(other,self,"DIA_Coragon_FixBeer_01_00");	//Может, я смогу как-нибудь привлечь посетителей?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_01");	//Каким образом? Силком, что ли, их сюда притащишь?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_02");	//Вирт наливает пиво совершенно бесплатно. А здесь придется за него платить.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_03");	//Они же, в конце концов, не полные идиоты, чтобы просто так отдавать деньги.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_04");	//Но ты, конечно, можешь попробовать. Чем Белиар не шутит?
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_05");	//Если у тебя получится увеличить количество посетителей в моей таверне, я лично готов отвалить тебе три...
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_06");	//...(задумчиво) Нет! Две бочки с пивом.
	AI_Output(other,self,"DIA_Coragon_FixBeer_01_07");	//Договорились! Тогда можешь уже начинать готовить мое пиво.
	AI_Output(self,other,"DIA_Coragon_FixBeer_01_08");	//Ты...(махнув рукой) Аааа, сумасшедший...
	MIS_CoragonFixBeer = LOG_Running;
	Log_CreateTopic(TOPIC_CoragonFixBeer,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Running);
	B_LogEntry(TOPIC_CoragonFixBeer,"Корагон жалуется на то, что в последнее время в его таверне мало посетителей. Это связано с тем, что на городской площади Вирт угощает всех пивом совершенно бесплатно. Я вызвался помочь трактирщику уладить эту проблему. За это он готов отвалить мне две бочки превосходнейшего пива!");
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_FixBeer_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_FixBeer_Done_Condition;
	information = DIA_Coragon_FixBeer_Done_Info;
	permanent = FALSE;
	description = "Как твои дела?";
};

func int DIA_Coragon_FixBeer_Done_Condition()
{
	if((MIS_CoragonFixBeer == LOG_Running) && (CoragonGuestBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_FixBeer_Done_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_00");	//Как твои дела?
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_01");	//(удивленно) И как тебе это удалось?
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_02");	//Что?
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_03");	//В моей таверне теперь не протолкнуться от посетителей!
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_04");	//Правда я это связываю с тем, что ополчение внезапно забрало Вирта на службу. Теперь просто некому разливать пиво!
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_05");	//И зачем он им только сдался, этот старый мешок с костями?
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_06");	//Неважно. Зато теперь ты не несешь убытки.
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_07");	//Ладно. (вздыхая) Признаю, я проиграл! И, как обещал, с меня причитается две бочки с пивом.
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_08");	//Мне они не нужны. Лучше отвези их ополченцу Мартину, в порт.
	AI_Output(other,self,"DIA_Coragon_FixBeer_Done_01_09");	//Думаю, он их уже заждался.
	AI_Output(self,other,"DIA_Coragon_FixBeer_Done_01_10");	//Хорошо, как скажешь. (ехидно) Ну ты хитрец!
	MIS_CoragonFixBeer = LOG_Success;
	Log_SetTopicStatus(TOPIC_CoragonFixBeer,LOG_Success);
	B_LogEntry(TOPIC_CoragonFixBeer,"Корагон был удивлен, что в его таверне теперь полно посетителей. Пришлось ему выкатить мне две бочки с пивом, которые я попросил отослать Мартину на склад.");
};

instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = "Что ты знаешь о пропавших людях?.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Что ты знаешь о пропавших людях?.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Я слышал, что многие из них пропали в районе порта. Неудивительно, если учитывать, что там творится.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Пропал даже ученик плотника Торбена из нижней части города.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Хакон, один из рыночных торговцев, рассказал мне очень странную историю.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Он говорил, что каждый день этого он встречал одного парня, а потом тот словно исчез с лица земли. Хакон даже обратился в ополчение.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Горожане начинают паниковать. Не понимаю, почему это происходит. Думаю, все это чепуха.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Жизнь в Хоринисе непростая, но за воротами еще опаснее.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Те, кто не остается в городе, рано или поздно попадет в руки к бандитам или в зубы к диким животным. Все просто.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Хакон, торговец на рыночной площади, и плотник Торбен знают что-то о пропавших людях.");
};

instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Тебя ограбили?";
};

func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Тебя ограбили?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Да, некоторое время назад. Тем вечером было довольно людно, и я только и делал, что разносил пиво.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//От стойки я надолго не отлучался, но этим подонкам хватило и небольшого времени.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Я рассказал о краже ополчению, но они, конечно же, никого не нашли. Эти лентяи предпочитают накачиваться бесплатным пивом.
	MIS_Coragon_Silber = LOG_Running;
	Log_CreateTopic(TOPIC_Coragon_Silber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_Running);
	B_LogEntry(TOPIC_Coragon_Silber,"У Корагона украли все столовое серебро. Думаю, он будет не против, вернуть его себе обратно.");
};

var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Вот, возьми это в качестве награды.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);

	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Мое особое пиво! Один бочонок остался.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Буквально последние капли!
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "Я принес твое серебро.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Я принес твое серебро.

	if(B_GiveInvItems(other,self,ItMi_CoragonsSilber,8))
	{
		Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	};

	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Правда?
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Coragon_Silber,LOG_SUCCESS);
	B_LogEntry(TOPIC_Coragon_Silber,"Я вернул Корагону его столовое серебро.");
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Посмотри, что у меня есть.";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Посмотри, что у меня есть.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Хммм...(удивленно) Но это же гроссбух Лемара!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Что ты с ним собираешься делать?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Вот твоя книга.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) > 0) && (Npc_KnowsInfo(hero,DIA_Coragon_Schuldenbuch) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Вот твоя книга.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Спасибо! Ты спас меня. Лемар может быть очень неприятным человеком.
	B_Coragon_Bier();
};

instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "Как мне попасть в верхний квартал?";
};

func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Как мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Ты должен стать гражданином города. Найди себе работу!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Лучше всего наймись к одному из ремесленников из нижней части города. Тогда ты станешь гражданином.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//А если этого будет недостаточно, отправляйся в казармы и поговори с лордом Андрэ.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Возможно, он примет тебя в ряды ополчения. Это откроет тебе путь в верхний квартал.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "А что там насчет Валентино?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//А что там насчет Валентино?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Он богат до неприличия, и ему не приходится работать. И он рассказывает об этом всем подряд.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Хочешь ты его слушать или нет.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Он пьет как конь и всегда остается до самого утра. А потом, шатаясь, отправляется домой, в верхний квартал.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Так происходит каждый день.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if(Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Прошлой ночью он не смог расплатиться по счету.
	if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Он болтал что-то о том, что его обокрали и что он заплатит мне потом. Как же!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//Только что он разорялся о том, как много у него денег.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//И тут он запускает руку в карман, делает глупое лицо и говорит, что его обокрали...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//И? Что ты сделал?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Я?! Задал ему хорошую трепку, что же еще.
	VALENTINOSHIT = TRUE;
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Вот - возьми это кольцо.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && (Npc_HasItems(other,ItRi_ValentinosRing) > 0))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Вот - возьми это кольцо.
	B_GiveInvItems(other,self,ItRi_ValentinosRing,1);
	Npc_RemoveInvItems(self,ItRi_ValentinosRing,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Что? Не понимаю...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Оно принадлежало Валентино.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Ты можешь передать его следующему, кто отдубасит его...
	B_GivePlayerXP(300);
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_TRADERING(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_tradering_condition;
	information = dia_coragon_tradering_info;
	permanent = FALSE;
	description = "Есть что-нибудь интересное?";
};


func int dia_coragon_tradering_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE))
	{
		return TRUE;
	};
};

func void dia_coragon_tradering_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_01");	//Есть что-нибудь интересное?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_02");	//(раздраженно) Конечно есть!
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_03");	//В последнее время все, кому не лень, только и делают, что расплачиваются за мою выпивку не золотом, а всяким барахлом!
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_04");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_05");	//Да вот, недавно тут один парень пытался всучить мне вместо денег одно кольцо.
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_07");	//Сказал, что кроме этого кольца у него больше ничего нет.
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_09");	//Пришлось взять его кольцо - не отпускать же этого парня просто так!
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_10");	//Правда, колечко то, по-видимому, стоит приличных денег...(ехидно)
	AI_Output(other,self,"DIA_Coragon_TradeRing_01_13");	//А что это был за парень?
	AI_Output(self,other,"DIA_Coragon_TradeRing_01_14");	//Кажется, его имя Джо. Он вроде как из портового квартала.
	CORAGONTELLJO = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Парень по имени Джо пытался расплатиться с Корагоном дорогим кольцом. Возможно, это и есть то самое кольцо, которое украли у Хакона. Надо бы поговорить с Джо и узнать, откуда оно у него.");
};


instance DIA_CORAGON_TRADERINGME(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingme_condition;
	information = dia_coragon_traderingme_info;
	permanent = FALSE;
	description = "То кольцо, оно еще у тебя?";
};


func int dia_coragon_traderingme_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_tradering))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingme_info()
{
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_01");	//То кольцо, оно еще у тебя?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_02");	//Конечно.
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_03");	//Тогда, продай мне его!
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_04");	//Продать тебе кольцо? Хммм...(задумчиво) Да нет проблем!
	AI_Output(other,self,"DIA_Coragon_TradeRingMe_01_06");	//Сколько ты хочешь за него?
	AI_Output(self,other,"DIA_Coragon_TradeRingMe_01_09");	//Сто золотых монет.
};


instance DIA_CORAGON_TRADERINGMEDONE(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = dia_coragon_traderingmedone_condition;
	information = dia_coragon_traderingmedone_info;
	permanent = TRUE;
	description = "Продай мне кольцо.";
};


func int dia_coragon_traderingmedone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && Npc_KnowsInfo(hero,dia_coragon_traderingme) && (CORAGONSELLRINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_coragon_traderingmedone_info()
{
	AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_00");	//Продай мне кольцо.
	AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_01");	//(ехидно) А где деньги?
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		B_GivePlayerXP(100);
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_02");	//Вот они.
		AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_03");	//Хорошо! Тогда держи кольцо.
		B_GiveInvItems(self,other,itri_hakonmissring,1);
		CORAGONSELLRINGDONE = TRUE;
		B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Корагон продал мне кольцо. Кажется, оно действительно раньше принадлежало торговцу Хакону.");
	}
	else
	{
		AI_Output(other,self,"DIA_Coragon_TradeRingMeDone_01_04");	//У меня их нет.
		AI_Output(self,other,"DIA_Coragon_TradeRingMeDone_01_05");	//Тогда приходи, когда они у тебя будут.
	};
};


instance DIA_CORAGON_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = dia_coragon_aboutkillignaz_condition;
	information = dia_coragon_aboutkillignaz_info;
	permanent = FALSE;
	description = "Ты что-нибудь слышал об убийстве алхимика Игнаца?";
};


func int dia_coragon_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_coragon_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Coragon_AboutKillIgnaz_01_00");	//Ты что-нибудь слышал об убийстве алхимика Игнаца?
	AI_Output(self,other,"DIA_Coragon_AboutKillIgnaz_01_01");	//Не думаю. Я стараюсь держаться подальше от подобного рода тем.
	AI_Output(self,other,"DIA_Coragon_AboutKillIgnaz_01_04");	//У меня нет времени на то, чтобы слушать, о чем болтают другие люди.
	B_LogEntry(TOPIC_KILLIGNAZ,"Хозяин городской таверны Корагон сказал, что его вообще не интересуют подобные вещи. Не думаю, что он что-то знает об убийстве Игнаца.");
	ASKKILLSECOND = TRUE;
};

instance DIA_Coragon_LoaParty(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Condition;
	information = DIA_Coragon_LoaParty_Info;
	permanent = FALSE;
	description = "Мне нужна хорошая еда!";
};

func int DIA_Coragon_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Info()
{
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_01");	//Мне нужна хорошая еда!
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_02");	//Но только не та, какой ты кормишь своих обычных посетителей, а действительно хорошая - вкусная и свежая.
	AI_Output(self,other,"DIA_Coragon_LoaParty_01_03");	//Ха, ишь ты какой! Еда моя ему не нравится. Знаешь, хорошая еда стоит приличных денег.
	AI_Output(other,self,"DIA_Coragon_LoaParty_01_04");	//О деньгах можешь не беспокоиться. Лучше скажи, ты сможешь ее достать?
	AI_Output(self,other,"DIA_Coragon_LoaParty_01_05");	//Хммм... смогу конечно. Но это будет стоить тебе не меньше тысячи золотых монет.
	B_LogEntry(TOPIC_LoaSecret,"Корагон сможет достать для меня приличной еды. Но это будет стоить мне тысячу золотых монет.");
};

instance DIA_Coragon_LoaParty_Done(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_Done_Condition;
	information = DIA_Coragon_LoaParty_Done_Info;
	permanent = FALSE;
	description = "Вот твоя тысяча!";
};

func int DIA_Coragon_LoaParty_Done_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty) == TRUE) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Coragon_LoaParty_Done_01_01");	//Вот твоя тысяча!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Coragon_LoaParty_Done_01_02");	//Отлично! Загляни ко мне завтра. Думаю, у меня будет чем тебя порадовать.
	B_LogEntry(TOPIC_LoaSecret,"Я отдал Корагону деньги. Теперь, надо будет заглянуть к нему завтра за едой.");
	CoragonDayParty = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Coragon_LoaParty_GiveFood(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_LoaParty_GiveFood_Condition;
	information = DIA_Coragon_LoaParty_GiveFood_Info;
	permanent = FALSE;
	description = "Как поживает мой заказ?";
};

func int DIA_Coragon_LoaParty_GiveFood_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Coragon_LoaParty_Done) == TRUE) && (CoragonDayParty < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Coragon_LoaParty_GiveFood_Info()
{
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_01");	//Как поживает мой заказ?
	AI_Output(self,other,"DIA_Coragon_LoaParty_GiveFood_01_02");	//Все готово. Можешь забирать!
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_03");	//Она точно свежая?!
	AI_Output(self,other,"DIA_Coragon_LoaParty_GiveFood_01_04");	//Лучшей еды тебе не сыскать во всем Хоринисе. Уж поверь мне!
	AI_Output(other,self,"DIA_Coragon_LoaParty_GiveFood_01_05");	//Ладно, убедил.
	B_GiveInvItems(self,other,ItMi_LoaPartyFood,1);
	B_LogEntry(TOPIC_LoaSecret,"Я достал вкусной и свежей еды для нашего пикника.");
	LoaPartyFood = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret,"Теперь можно вернуться к Лоа и обсудить с ней остальные моменты предстоящего отдыха.");
	};

	AI_StopProcessInfos(self);
};