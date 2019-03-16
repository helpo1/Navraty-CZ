
instance DIA_MiltenOW_EXIT(C_Info)
{
	npc = PC_Mage_OW;
	nr = 999;
	condition = DIA_MiltenOW_EXIT_Condition;
	information = DIA_MiltenOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenOW_Hello(C_Info)
{
	npc = PC_Mage_OW;
	nr = TRUE;
	condition = DIA_MiltenOW_Hello_Condition;
	information = DIA_MiltenOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Посмотрите, кто вернулся! Наш герой из-за Барьера!
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Рад видеть тебя, Милтен!",DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello,"Я знаю тебя?",DIA_MiltenOW_Hello_NO);
};

func void B_Milten_GornDiegoLester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Ты помнишь Горна, Диего и Лестера?
};

func void DIA_MiltenOW_Hello_YES()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Рад видеть тебя, Милтен. Ты все еще здесь или здесь опять?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Опять. После того как Барьер рухнул, я вступил в монастырь Магов Огня.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Но когда стало ясно, что паладины хотят отправиться сюда, мой опыт и знание этих мест оказались весьма полезными.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Поэтому было решено доверить мне эту священную миссию обеспечения магической поддержки этой экспедиции.
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Конечно же, я помню парней!",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Эти имена ни о чем мне не говорят.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Я знаю тебя?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Ты через многое прошел, да?
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Конечно же, я помню парней!",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Эти имена ни о чем мне не говорят.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Конечно же, я помню парней!
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//Ну, Горн и Диего не ушли далеко. Их подобрали паладины здесь, в долине.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Лестер исчез, впрочем - и я понятия не имею, где он сейчас ошивается.

	if(Npc_KnowsInfo(other,DIA_Lester_Hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//Я встретил Лестера - он теперь с Ксардасом.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Ну, хоть какие-то хорошие новости.
	};

	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//Ну, а у меня нет ничего хорошего.
	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Эти имена ни о чем мне не говорят.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Ты многое забыл, да? Что ж, оставим прошлое в покое и посвятим себя делам нынешних дней.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Хотя у меня и нет приятных новостей.
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

instance DIA_MiltenOW_Bericht(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Bericht_Condition;
	information = DIA_MiltenOW_Bericht_Info;
	permanent = FALSE;
	description = "Как здесь обстоят дела?";
};

func int DIA_MiltenOW_Bericht_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Bericht_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//Как здесь обстоят дела?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Паладины пришли сюда, чтобы добывать магическую руду.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Но из-за всех этих нападений драконов и орков я сомневаюсь, что паладины уйдут отсюда с рудой.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Нет, клянусь Инносом - я чувствую присутствие чего-то темного... какого-то зла, оно разрастается здесь. Что-то, темное поднимается от этой долины.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Мы заплатили высокую цену за уничтожение Спящего. Разрушение Барьера погубило и это место.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Мы можем считать себя счастливчиками, если нам удастся пережить все это.
};

instance DIA_MiltenOW_Pashal(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Pashal_Condition;
	information = DIA_MiltenOW_Pashal_Info;
	permanent = FALSE;
	description = "У меня к тебе один вопрос.";
};

func int DIA_MiltenOW_Pashal_Condition()
{
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestMageStep == TRUE) && (PashalQuestCaveStep == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Pashal_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_00");	//У меня к тебе один вопрос.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_01");	//Какой именно?
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_02");	//Ты что-нибудь слышал о неком магическом артефакте, который вобрал в себя всю силу этого мира?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_03");	//Хммм...(задумчиво) Да! Я что-то припоминаю...помойму мастер Корристо однажды упоминал о таком.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_04");	//В его планах было даже использование этого артефакта для того, чтобы разрушить магический барьер!
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_05");	//Но поскольку артефакт так и не был найден, то все это осталось лишь на словах.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_06");	//А что вы конкретно предприняли?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_07");	//Насколько я знаю, Корристо послал одного из магов на его поиски.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_08");	//Но тот так и не вернулся! Больше попыток его отыскать не предпринималось.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_09");	//Ясно.
	PashalQuestCaveStep = TRUE;
	B_LogEntry(TOPIC_PashalQuest,"Милтен рассказал мне о том, что Маги Огня пытались найти этот артефакт и даже отправили на поиски одного из Магов. Но у них ничего не вышло, а тот маг вообще пропал.");
	Wld_InsertNpc(KDF_4569_AlexOne,"OW_ALEXONE");
};

instance DIA_MiltenOW_Erz(C_Info)
{
	npc = PC_Mage_OW;
	nr = 4;
	condition = DIA_MiltenOW_Erz_Condition;
	information = DIA_MiltenOW_Erz_Info;
	permanent = FALSE;
	description = "Сколько руды удалось добыть?";
};


func int DIA_MiltenOW_Erz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Bericht))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Сколько руды удалось добыть?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Сколько руды?.. Ни одного ящика! У нас уже давно нет вестей от старателей.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Я не удивлюсь, если они все давно мертвы. А нас атакуют драконы и осаждают орки!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Эта экспедиция обернулась полным провалом.
};


instance DIA_MiltenOW_Wo(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Wo_Condition;
	information = DIA_MiltenOW_Wo_Info;
	permanent = FALSE;
	description = "А где сейчас Горн и Диего?";
};


func int DIA_MiltenOW_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello) && (Knows_Diego == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//А где сейчас Горн и Диего?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Ну, Горн сидит здесь, в темнице, за то, что сопротивлялся аресту.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Диего прикрепили к отряду старателей. Спроси паладина Парсиваля, он отправлял этот отряд.
	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_Running;
};


instance DIA_MiltenOW_Gorn(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Gorn_Condition;
	information = DIA_MiltenOW_Gorn_Info;
	permanent = FALSE;
	description = "Пойдем, освободим Горна!";
};


func int DIA_MiltenOW_Gorn_Condition()
{
	if((KnowsAboutGorn == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Пойдем, освободим Горна!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//Ну... проблема заключается в том, что Горн - осужденный заключенный.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Но если нам повезет, Гаронд согласится на сделку и мы сможем купить Горну свободу.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Да, может быть...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Держи меня в курсе.
	Log_CreateTopic(TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn,LOG_Running);
	B_LogEntry(TOPIC_RescueGorn,"Командующий Гаронд посадил Горна в тюрьму. Возможно, с ним можно договориться и нам удастся вытащить беднягу.");
};


instance DIA_MiltenOW_Preis(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Preis_Condition;
	information = DIA_MiltenOW_Preis_Info;
	permanent = FALSE;
	description = "Гаронд хочет тысячу золотых монет за Горна.";
};


func int DIA_MiltenOW_Preis_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Гаронд хочет тысячу золотых монет за Горна.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Немаленькая сумма. Я могу пожертвовать двести пятьдесят монет.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	B_LogEntry(TOPIC_RescueGorn,"Милтен дал мне двести пятьдесят монет, чтобы я заплатил за освобождение Горна.");
};


instance DIA_MiltenOW_Mehr(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Mehr_Condition;
	information = DIA_MiltenOW_Mehr_Info;
	permanent = FALSE;
	description = "Мне нужно больше золота, чтобы купить свободу Горна.";
};


func int DIA_MiltenOW_Mehr_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && (Npc_HasItems(other,ItMi_Gold) < 1000) && Npc_KnowsInfo(other,DIA_MiltenOW_Preis))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mehr_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Мне нужно больше золота, чтобы купить свободу Горна.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Добыть еще золота... Хм, Диего мог бы помочь, но его здесь нет.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Может, Горн припрятал где-нибудь золото для себя. Нужно выяснить это.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Я напишу ему записку - вот, попробуй передать ее в темницу.
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"Милтен дал мне записку для Горна. Если я смогу пробраться в тюрьму, возможно, Горн сможет сообщить, не припрятал ли он где-нибудь немного золота.");
};


instance DIA_MiltenOW_Equipment(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Equipment_Condition;
	information = DIA_MiltenOW_Equipment_Info;
	permanent = FALSE;
	description = "Ты можешь обеспечить меня снаряжением?";
};


func int DIA_MiltenOW_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Ты можешь обеспечить меня снаряжением? Гаронд попросил меня отправиться в шахты.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//И где я, по-твоему, возьму его? Единственное, что я могу тебе дать, - это ценный рунный камень.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_MiltenOW_Versteck(C_Info)
{
	npc = PC_Mage_OW;
	nr = 1;
	condition = DIA_MiltenOW_Versteck_Condition;
	information = DIA_MiltenOW_Versteck_Info;
	permanent = FALSE;
	important = FALSE;
	description = "Я получил ответ от Горна.";
};


func int DIA_MiltenOW_Versteck_Condition()
{
	if((GornsTreasure == TRUE) && (Npc_HasItems(other,ItMi_GornsTreasure_MIS) <= 0) && (Gorns_Beutel == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Я получил ответ от Горна. Он говорит, что его золото находится у южных ворот.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//Бывших южных ворот, ты хочешь сказать. Дракон превратил их в развалины.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Как мне добраться туда?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Это неподалеку от тарана орков. Южные ворота были справа от него.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Это будет непросто - так что постарайся сделать все побыстрее и не привлекая внимания врага.
	B_LogEntry(TOPIC_RescueGorn,"Бывшие южные ворота находятся справа от тарана орков. Золото Горна спрятано где-то там.");
};


instance DIA_MiltenOW_Frei(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Frei_Condition;
	information = DIA_MiltenOW_Frei_Info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int DIA_MiltenOW_Frei_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Я освободил Горна.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Хорошо! Теперь мы можем подумать о том, что делать дальше.
};


instance DIA_MiltenOW_Lehren(C_Info)
{
	npc = PC_Mage_OW;
	nr = 9;
	condition = DIA_MiltenOW_Lehren_Condition;
	information = DIA_MiltenOW_Lehren_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_MiltenOW_Lehren_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Lehren_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Ты можешь чему-нибудь меня научить?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Я могу посвятить тебя в некоторые из заклинаний второго круга магии или помогу увеличить твою волшебную силу.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Если ты чувствуешь готовность приумножить свою силу, я дам тебе указания.
};

instance DIA_MILTENOW_CASSIA(C_Info)
{
	npc = PC_Mage_OW;
	nr = 10;
	condition = dia_miltenow_cassia_condition;
	information = dia_miltenow_cassia_info;
	permanent = FALSE;
	description = "А ты не знаешь случайно...";
};

func int dia_miltenow_cassia_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ItKe_OC_Store) == 0))
	{
		return TRUE;
	};
};

func void dia_miltenow_cassia_info()
{
	AI_Output(other,self,"DIA_Milten_Cassia_15_00");	//А ты не знаешь случайно, где ключ от склада паладинов?
	AI_Output(self,other,"DIA_Milten_Cassia_03_01");	//Что ты задумал, разбойник? Впрочем, тебе не повезло.
	AI_Output(self,other,"DIA_Milten_Cassia_03_02");	//В один прекрасный день Энгор вылез из своей конуры подышать свежим воздухом и где-то его посеял.
	AI_Output(self,other,"DIA_Milten_Cassia_03_03");	//Думаю, что Гаронд рано или поздно прикажет сломать дверь и заставит Энгора ее чинить.
	AI_Output(self,other,"DIA_Milten_Cassia_03_04");	//Да, кстати...
	AI_Output(self,other,"DIA_Milten_Cassia_03_05");	//Если ты, все же, найдешь ключ - верни его Энгору!
	AI_Output(self,other,"DIA_Milten_Cassia_03_06");	//Так будет лучше для всех.
	AI_Output(other,self,"DIA_Milten_Cassia_15_07");	//Понятно.
	B_LogEntry(TOPIC_CASSIAGOLDCUP,"Энгор потерял ключ склада паладинов, когда выходил подышать свежим воздухом. Если я найду ключ, будет лучше, если я верну его Энгору.");
	MILTENSAYABOUTOCKEY = TRUE;
};

instance DIA_MiltenOW_TeachCircle2(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle2_Condition;
	information = DIA_MiltenOW_TeachCircle2_Info;
	permanent = TRUE;
	description = "Обучи меня второму Кругу магии. (Очки обучения: 30)";
};


func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Обучи меня второму кругу магии.
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//Это обычно привилегия учителей нашего ордена.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Но я думаю, что в твоем случае мы можем сделать исключение...

	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Я не уверен, что помню все эти официальные и торжественные слова...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Войди во второй круг. Э-э... он покажет тебе направление, но твои дела формируют путь..
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Я думаю, ты понимаешь, о чем все это...
	};
};


instance DIA_MiltenOW_Teach(C_Info)
{
	npc = PC_Mage_OW;
	nr = 90;
	condition = DIA_MiltenOW_Teach_Condition;
	information = DIA_MiltenOW_Teach_Info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int DIA_MiltenOW_Teach_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Я хочу изучить новые заклинания.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach,Dialog_Back,DIA_MiltenOW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
		};
		if((PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),DIA_MiltenOW_Teach_RapidFirebolt);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Ты все еще не достиг второго круга магии. Я ничему не могу научить тебя.
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

instance DIA_MiltenOW_Mana(C_Info)
{
	npc = PC_Mage_OW;
	nr = 100;
	condition = DIA_MiltenOW_Mana_Condition;
	information = DIA_MiltenOW_Mana_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_MiltenOW_Mana_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Я хочу повысить мои магические способности
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Твоя магическая энергия велика. Слишком велика, чтобы я мог увеличить ее.
	};
	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};


instance DIA_MiltenOW_Perm(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Perm_Condition;
	information = DIA_MiltenOW_Perm_Info;
	permanent = TRUE;
	description = "А какие у тебя здесь обязанности?";
};


func int DIA_MiltenOW_Perm_Condition()
{
	if((Kapitel == 2) && (Npc_KnowsInfo(other,DIA_MiltenOW_Frei) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//А какие у тебя здесь обязанности?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Изначально, я должен был проверять магическую руду. Но она здесь редко попадала мне в руки.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//И теперь я сосредоточился на изучении алхимии.
};


instance DIA_MiltenOW_Plan(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Plan_Condition;
	information = DIA_MiltenOW_Plan_Info;
	permanent = TRUE;
	description = "Что ты планируешь делать дальше?";
};


func int DIA_MiltenOW_Plan_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Я вернусь. Подожду еще немного, и теперь, когда Горн свободен, я могу отправиться в путь вместе с ним.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Крайне важно, чтобы Пирокар узнал о ситуации здесь.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Ну, если ты так считаешь.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Я надеюсь, что лорд Хаген поймет, какая угроза исходит от этой долины. Не хочется думать, что произойдет, если орки пройдут через Проход.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Ну, тогда удачного путешествия.
};

instance DIA_MiltenOW_Baby(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Condition;
	information = DIA_MiltenOW_Baby_Info;
	permanent = FALSE;
	description = "У меня к тебе есть весьма необычная просьба.";
};

func int DIA_MiltenOW_Baby_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_00");	//У меня к тебе есть весьма необычная просьба.
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_01");	//Говори. Ты же знаешь, для друга я готов сделать все, что в моих силах.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_02");	//В общем, один оруженосец из замка попросил меня... попросить тебя, чтобы ты наколдовал женщину для него и его товарищей.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_03");	//Ну, ты понимаешь о чем я.
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_04");	//(озадаченно) По правде говоря, я не ожидал услышать от тебя подобной просьбы.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_05");	//Так ты сможешь им помочь?
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_06");	//Ну... Я в таких делах, скажем так, не слишком опытен. Но раз ты просишь, то я попробую что-нибудь придумать.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_07");	//Отлично! Уверен, парни будут просто вне себя от радости. Когда все будет готово?
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_08");	//Думаю, к завтрашнему вечеру, не раньше. Мне надо хорошенько подготовиться.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_09");	//Так им и передам.
	B_LogEntry(TOPIC_BrutusBaby,"Как ни странно, Милтен согласился помочь. По его словам, к вечеру завтрашнего дня, все должно быть готово.");
	AI_StopProcessInfos(self);
};

instance DIA_MiltenOW_Baby_Done(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Done_Condition;
	information = DIA_MiltenOW_Baby_Done_Info;
	permanent = FALSE;
	description = "Все готово?";
};

func int DIA_MiltenOW_Baby_Done_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running) && (BrutusGoParty == TRUE) && (BrutusGoPartyNever == FALSE) && (Npc_GetDistToWP(self,"OC_DRAGO") <= 500))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Done_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_00");	//Все готово?
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_01");	//Да, все приготовления завершены. Осталось только прочитать нужное заклинание.
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_02");	//Так, в чем же дело, читай.
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_03");	//Лучше это сделаешь ты, поскольку мне необходимо поддерживать свою концентрацию вокруг магической пентаграммы вызова.
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_04");	//Вот, возьми этот свиток. Там все написано.
	B_GiveInvItems(self,other,ItWr_MiltenSummon,1);
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_05");	//Ладно, давай сюда.
	Info_ClearChoices(DIA_MiltenOW_Baby_Done);
	Info_AddChoice(DIA_MiltenOW_Baby_Done,"Использовать свиток...",DIA_MiltenOW_Baby_Done_Do);
};

func void DIA_MiltenOW_Baby_Done_Do()
{
	B_GivePlayerXP(500);
	Npc_RemoveInvItems(other,ItWr_MiltenSummon,1);
	B_HeroUseFakeScroll();
	MIS_BrutusBaby = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Success);
	B_LogEntry(TOPIC_BrutusBaby,"Похоже, Милтен что-то напутал в заклинании. Вместо прекрасной девы в центре пентаграммы появился огромный архидемон. Правда, вполне безобидный. Но один его вид нагнал такого ужаса на всех присутствующих, что они теперь наверняка надолго забудут о каких-либо своих желаниях.");
	MiltenSummon = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Demon_Lord_Milten,"OC_MAGE_CENTER");
};
