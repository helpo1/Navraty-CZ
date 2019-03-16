
instance DIA_Ass_127_Osair_EXIT(C_Info)
{
	npc = Ass_127_Osair;
	nr = 999;
	condition = dia_Ass_127_Osair_exit_condition;
	information = dia_Ass_127_Osair_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_127_Osair_exit_condition()
{
	return TRUE;
};

func void dia_Ass_127_Osair_exit_info()
{
	if((OsairGetsNrozasPoisonLaw == TRUE) && (MIS_NrozasPoisonGift == FALSE) && (NrozasIsDead == FALSE))
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_01");	//Постой! Прежде чем уйдешь, вот.
		B_GiveInvItems(self,other,ItFo_BeliarTear,1);
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_02");	//Возьми эту бутылку прекрасного вина и отнеси ее Нрозасу. В знак моей благодарности.
		AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_03");	//Конечно, мастер. Я передам ему это вино.
		AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NrozasPoisonGift_01_04");	//Все, теперь ступай.
		MIS_NrozasPoisonGift = LOG_Running;
		Log_CreateTopic(TOPIC_NrozasPoisonGift,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Running);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Осаир хочет, чтобы я передал бутылку вина мастеру Нрозасу в качестве благодарности.");
	};

	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_PreHALLO(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_PreHALLO_condition;
	information = dia_Ass_127_Osair_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (OsairMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_PreHALLO_01_00");	//(сухо) Что тебе нужно, послушник? Говори!
};

instance DIA_Ass_127_Osair_PreHALLO_Kill(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_PreHALLO_Kill_condition;
	information = dia_Ass_127_Osair_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairMurid == FALSE) && (MIS_NrozasToOsair == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_NrozasToOsair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_NrozasToOsair_condition;
	information = dia_Ass_127_Osair_NrozasToOsair_info;
	permanent = FALSE;
	description = "Меня прислал мастер Нрозас.";
};

func int dia_Ass_127_Osair_NrozasToOsair_condition()
{
	if(MIS_NrozasToOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_NrozasToOsair_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_01");	//Меня прислал мастер Нрозас.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_02");	//Чего он хочет?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_03");	//Он просил передать, чтобы в следующий раз ты присылал ему рабов покрепче.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_04");	//(надменно) И чем его не устраивают нынешние?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_05");	//Они у него слишком быстро умирают.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_06");	//Еще бы. Учитывая, что он с ними вытворяет.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_07");	//Хотя без его экспериментов с ядами нам бы пришлось немного туговато.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_08");	//Ну да ладно, вот.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_09");	//Передай ему это письмо, послушник. Тут мой ответ на его просьбу.
	B_GiveInvItems(self,other,ItWr_Osair,1);
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_10");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_11");	//Кстати, раз ты тут, послушник, то у меня к тебе будет еще одно поручение.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_12");	//Недавно недалеко от мой пещеры появилась стая черных глорхов.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_13");	//Меня и моих людей это мало беспокоит, но недавно они сожрали моего посыльного.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_14");	//А это, как ты понимаешь, мне не очень пришлось по душе.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_15");	//Я хочу, чтобы ты разобрался с этой проблемой.
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_16");	//Заодно и покажешь мне, на что ты способен. Ты все понял?
	AI_Output(other,self,"DIA_Ass_127_Osair_NrozasToOsair_01_17");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_NrozasToOsair_01_18");	//Хорошо. Тогда ступай.
	MIS_OsairSnappers = LOG_Running;
	OsairMeet = TRUE;
	Log_CreateTopic(TOPIC_OsairSnappers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_Running);
 	B_LogEntry(TOPIC_OsairSnappers,"Одного из посыльных мастера Осаира недавно сожрала стая черных глорхов, появившаяся недалеко от его пещеры. Он хочет, чтобы я уладил эту проблему и таким образом проявил себя.");
	B_LogEntry_Quiet(TOPIC_NrozasToOsair,"Я сообщил Осаиру о просьбе Нрозаса. В ответ он попросил передать ему письмо. Похоже, у Осаира свои мысли на этот счет.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Snapper_Black_Osair_01,"PW_OSAIRSNAPPER_01");
	Wld_InsertNpc(Snapper_Black_Osair_02,"PW_OSAIRSNAPPER_02");
	Wld_InsertNpc(Snapper_Black_Osair_03,"PW_OSAIRSNAPPER_03");
	Wld_InsertNpc(Snapper_Black_Osair_04,"PW_OSAIRSNAPPER_04");
	Wld_InsertNpc(Snapper_Black_Osair_05,"PW_OSAIRSNAPPER_05");
};	


instance DIA_Ass_127_Osair_Snapper(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Snapper_condition;
	information = dia_Ass_127_Osair_Snapper_info;
	permanent = FALSE;
	description = "Я убил черных глорхов.";
};

func int dia_Ass_127_Osair_Snapper_condition()
{
	if((MIS_OsairSnappers == LOG_Running) && (Npc_IsDead(Snapper_Black_Osair_01)) && (Npc_IsDead(Snapper_Black_Osair_02)) && (Npc_IsDead(Snapper_Black_Osair_03)) && (Npc_IsDead(Snapper_Black_Osair_04)) && (Npc_IsDead(Snapper_Black_Osair_05)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Snapper_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_01");	//Я убил черных глорхов.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_02");	//Хммм. Ну, тогда мне не о чем больше беспокоиться. Верно?
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_03");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_04");	//Вот и отлично! Прекрасная работа, послушник.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_05");	//И поскольку ты так хорошо справился со своим поручением, то я решил тебе дать еще одно. Более сложное, чем первое.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_06");	//Надеюсь, ты не против?
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_07");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_08");	//Тогда слушай. Ты ведь уже видел моих рабов, что находятся внизу?
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_09");	//Так вот. Мне кажется, что среди них зреет что-то вроде небольшого заговора.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_10");	//Безусловно, они вряд ли что-то смогут противопоставить моей охране и тем более сбежать отсюда.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_11");	//Но дело совсем в другом. Надо выбить эту дурь из их голов, чтобы они боялись самой мысли о возможном побеге.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_12");	//Поэтому я хочу найти их зачинщика и в назидание всем преподнести ему, так скажем, небольшой урок!
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_13");	//И этим, я полагаю, ты и займешься.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_14");	//Найди того, кто подбивает рабов к восстанию и потом сообщи мне об этом. Ты все понял?
	AI_Output(other,self,"DIA_Ass_127_Osair_Snapper_01_15");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_16");	//Тогда выполняй. Я очень надеюсь на тебя.
	AI_Output(self,other,"DIA_Ass_127_Osair_Snapper_01_17");	//Если нужно будет поговорить с рабами - скажешь, что я разрешил.
	MIS_OsairSnappers = LOG_SUCCESS;
	MIS_RebelSlave = LOG_Running;
	OsairLetsPrision = TRUE;
	Log_CreateTopic(TOPIC_RebelSlave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairSnappers,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_Running);
	B_LogEntry(TOPIC_OsairSnappers,"Осаир был доволен тем, что я смог разобраться с глорхами.");
	B_LogEntry_Quiet(TOPIC_RebelSlave,"Осаир дал мне еще одно поручение. Я должен найти раба, который подбивает остальных заключенных устроить побег из тюрьмы. Интересно, с чего мне следует начать?");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_OsairDemand(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_OsairDemand_condition;
	information = dia_Ass_127_Osair_OsairDemand_info;
	permanent = FALSE;
	description = "(отдать шкуру пещерного тролля)";
};

func int dia_Ass_127_Osair_OsairDemand_condition()
{
	if((MIS_OsairDemand == LOG_Running) && (Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_OsairDemand_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_02");	//Что это такое, послушник? Постой. Неужели это то, о чем я подумал?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_03");	//Да это же шкура черного пещерного тролля! Невероятно! Неужели Нрозас согласился расстаться с ней?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_04");	//Ладно, это не важно. Главное, что теперь она наконец-то моя.
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_05");	//Ему же в следующий раз я пришлю самых крепких рабов из тех, что только у меня есть. Как он и просил.
	MIS_OsairDemand = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OsairDemand,LOG_SUCCESS);
	B_LogEntry(TOPIC_OsairDemand,"Осаир был вне себя от счастья, заполучив шкуру черного пещерного тролля. Теперь он пришлет Нрозасу лучших рабов.");

	if(MIS_RebelSlave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_06");	//Что касается тебя, послушник. Ты смог доказать мне, что способен на многое.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_07");	//Поверь, немногим такое удавалось.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_08");	//И в качестве награды за твое старание отныне я нарекаю тебя своим мюридом-избранником!
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_09");	//Думаю, ты понимаешь, что это означает и не подведешь меня в дальнейшем.
		AI_Output(other,self,"DIA_Ass_128_Osair_OsairDemand_01_10");	//Благодарю тебя, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_11");	//Не стоит. Тебе просто воздалось по заслугам.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet(TOPIC_MasiafStory,"Мастер Осаир был доволен тем, что я смог выполнить все его поручения. За это он назначил меня своим мюридом - избранным послушником. Надо сообщить об этом Гонсалесу.");

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_12");	//Да, и еще кое-что.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_13");	//Раз ты смог одолеть пещерного тролля, то я смею предположить, что ты довольно искусный боец.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_14");	//Приор Тиамант занимается боевой подготовкой теней, и наверняка его заинтересует этот факт.
			AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_15");	//Поговори с ним. А если у него возникнут какие-то вопросы, просто скажи, что я тебя прислал.
			AI_Output(other,self,"DIA_Ass_127_Osair_OsairDemand_01_16");	//Хорошо, мастер.
			PlayerSendToTiamant = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_OsairDemand_01_17");	//А ты чего ждешь? Ступай - уверен, у тебя есть еще дела.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_127_Osair_Murid(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Murid_condition;
	information = dia_Ass_127_Osair_Murid_info;
	permanent = FALSE;
	description = "Что значит быть избранным, мастер?";
};

func int dia_Ass_127_Osair_Murid_condition()
{
	if((OsairMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Murid_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Murid_01_01");	//Что значит быть избранным, мастер?
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_02");	//Давай я кое-что тебе объясню. Слушай внимательно.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_03");	//Раз в четыре года один из наших послушников удостаивается чести обратиться в Тень Масиаф.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_04");	//Тенями мы зовем своих воинов, несущих смерть всем тем, кто сомневается в нашем могуществе и, главное, в могуществе самого Белиара.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_05");	//Каждый приор Масиаф, и я в том числе, выбирает из числа послушников того, кто, по его мнению, достоин этого.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_06");	//И назначает его своим мюридом, тем самым предлагая его в качестве кандидата для ритуала обращения.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_07");	//Когда наступает срок, все мюриды подвергаются ряду очень сложных и смертельных испытаний.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_08");	//И тот единственный, кто останется жив, в конце концов проходит обряд посвящения в воина Белиара.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_09");	//Я выбрал тебя в качестве своего мюрида. Однако другие, насколько мне известно, еще не сделали свой выбор.
	AI_Output(other,self,"DIA_Ass_127_Osair_Murid_01_10");	//А если все приоры выберут одного и того же послушника?
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_11");	//(задумчиво) Насколько мне известно, такого еще никогда не было.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_12");	//Но, скорее всего, его судьбу уже будет решать сам Ханиар Слепец как самый могущественный и мудрый из нас.
	AI_Output(self,other,"DIA_Ass_127_Osair_Murid_01_13");	//А что он решит, известно только самому Белиару.
	MuridTells = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Осаир рассказал мне о ритуале обращения избранных послушников в ряды Теней - воинов Братства Масиафа. Каждый приор должен выбрать себе мюрида, а потом уже те соревнуются между собой. Если все приоры выберут одного и того же человека, то судьбу этого мюрида будет решать самый мудрый из них - Ханиар Слепец.");
};

instance DIA_Ass_127_RebelSlave(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_RebelSlave_condition;
	information = dia_Ass_127_Osair_RebelSlave_info;
	permanent = FALSE;
	description = "(указать на послушника)";
};

func int dia_Ass_127_Osair_RebelSlave_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == FALSE) && (PW_Betray.aivar[AIV_PARTYMEMBER] == TRUE) && (PW_BetrayFollowMe == TRUE) && (Npc_GetDistToWP(PW_Betray,"PW_OSAIR_BETRAY") <= 750))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_RebelSlave_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_01");	//(указывает на послушника)
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_02");	//(вглядываясь) Так это, значит, тот самый наш герой?
	AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_03");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	PW_Betray.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_04");	//Ну что же, тогда, полагаю, мне более незачем беспокоится о мятеже.
	AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_05");	//(зловеще) С ним я поговорю позже. А что касается тебя, то ты хорошо поработал.
	MIS_RebelSlave = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelSlave,LOG_SUCCESS);
	B_LogEntry(TOPIC_RebelSlave,"Осаир был доволен тем, что я смог привести ему зачинщика бунта, хоть и не настоящего. Но он об этом уже никогда не узнает.");

	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_06");	//Ты смог доказать мне, что способен на многое. И уж поверь на слово, немногим такое удавалось.
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_07");	//Поэтому, в качестве награды за твое старание, отныне я нарекаю тебя своим мюридом-избранником!
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_08");	//Думаю, ты понимаешь, что это означает и не подведешь меня в дальнейшем.
		AI_Output(other,self,"DIA_Ass_128_Osair_RebelSlave_01_09");	//Благодарю тебя, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_10");	//Не стоит. Тебе просто воздалось по заслугам.
		OsairMurid = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry_Quiet(TOPIC_MasiafStory,"Я смог выполнить все поручения мастера Осаира. За это он назначил меня своим мюридом - избранным послушником. Надо сообщить об этом Гонсалесу.");

		if((NrozasMurid == TRUE) && (PlayerSendToTiamant == FALSE))
		{
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_11");	//Да, и еще кое-что. 
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_12");	//Раз ты смог одолеть пещерного тролля, то я смею предположить, что ты довольно искусный боец.
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_13");	//Приор Тиамант занимается боевой подготовкой Теней, и наверняка его заинтересует этот факт.
			AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_14");	//Поговори с ним. А если у него возникнут какие-то вопросы, просто скажи, что я тебя прислал.
			AI_Output(other,self,"DIA_Ass_127_Osair_RebelSlave_01_15");	//Хорошо, мастер.
			PlayerSendToTiamant = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_RebelSlave_01_16");	//Продолжай в том же духе, и вскоре у тебя появится шанс по-настоящему проявить себя.
		AI_StopProcessInfos(self);
	};

	Npc_ExchangeRoutine(PW_Betray,"OsairReady");
	B_Attack(self,PW_Betray,AR_KILL,1);
};

instance DIA_Ass_127_Osair_AssasinGold(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_AssasinGold_condition;
	information = dia_Ass_127_Osair_AssasinGold_info;
	permanent = FALSE;
	description = "Для меня будут еще поручения?";
};

func int dia_Ass_127_Osair_AssasinGold_condition()
{
	if(OsairMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_01");	//Для меня будут еще поручения?
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_01_02");	//Нет. Хотя, если будешь в храме, передай вот это золото двум Теням - Хасиму и Наругу.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,2);
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_01_03");	//Это их оплата за последнюю партию рабов. А так, пока все.
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_04");	//Слушаюсь, мастер.
	MIS_AssasinGold = LOG_Running;
	Log_CreateTopic(TOPIC_AssasinGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_Running);
	B_LogEntry(TOPIC_AssasinGold,"Я должен отнести золото Осаира двум Теням в храм. Их имена - Хасим и Наруг.");
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_127_Osair_AssasinGold_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_AssasinGold_Done_condition;
	information = dia_Ass_127_Osair_AssasinGold_Done_info;
	permanent = FALSE;
	description = "Я раздал золото Теням, мастер.";
};

func int dia_Ass_127_Osair_AssasinGold_Done_condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWineDone == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_AssasinGold_Done_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_Done_01_01");	//Я раздал золото Теням, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_Done_01_02");	//Хорошо. Хотя мог бы и не докладываться об этом, мюрид.
	AI_Output(self,other,"DIA_Ass_127_Osair_AssasinGold_Done_01_03");	//Теперь ступай, я сейчас немного занят.
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_Done_01_04");	//Да, мастер.
	PW_RecoverDeadBodyDay = Wld_GetDay();
	MIS_AssasinGold = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinGold,LOG_SUCCESS);
	B_LogEntry(TOPIC_AssasinGold,"Я доложил Осаиру о том, что раздал его золото Теням.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_HelpWithAssair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_HelpWithAssair_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_info;
	permanent = FALSE;
	description = "Меня прислал приор Тиамант, мастер.";
};

func int dia_Ass_127_Osair_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_01");	//Меня прислал приор Тиамант, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_02");	//И что же ему нужно?
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_03");	//Он хотел напомнить, что в рудную шахту необходимо доставить новых рабов, и как можно скорее.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_04");	//(гневно) Что?! Он мне еще собирается указывать, что делать?
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_05");	//На его месте я получше бы охранял старых рабов!
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_06");	//Но, по всей видимости, его люди не способны даже на это.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_07");	//Так вот. Пока я не буду уверен в том, что шахта нормально охраняется...
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_08");	//...я не отправлю туда больше ни одного раба. И меня не волнует, как он это сделает.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_09");	//Я передам ему ваш ответ, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_10");	//Не надо. Я сам пошлю своего посыльного с письмом для Тиаманта.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_11");	//С тебя хватит и того, что он тебя просил передать мне.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_12");	//К тому же у меня к тебе будет другое поручение.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_13");	//Я слушаю вас, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_14");	//Недавно до меня дошли слухи, что якобы в старом подгорном проходе, где-то глубоко в горе, есть большой золотой рудник.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_15");	//Из этого следует, что кто-то должен отправиться туда и проверить, так это или нет.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_16");	//Дело, конечно, непростое, но я уверен, что тебе оно вполне под силу.

	MIS_PW_GOLDSHAHT = LOG_Running;
	Log_CreateTopic(TOPIC_PW_GOLDSHAHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_Running);

	if(PW_GOLDSHAHT == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_17");	//Рудник действительно существует, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_18");	//Ты в этом уверен?
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_19");	//Сомнений быть не может.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_20");	//(задумчиво) Не то чтобы я тебе не доверяю. Но я все-таки привык верить своим глазам, а не словам. 
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_21");	//Поэтому достань мне хотя бы один экземпляр той золотой породы. Это будет лучшим доказательством твоих слов.
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_22");	//Само собой, мастер. Я все сделаю.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_23");	//Хорошо, тогда ступай.
		B_LogEntry(TOPIC_PW_GOLDSHAHT,"Осаир хочет, чтобы я принес экземпляр золотой породы с рудника, который я обнаружил в подгорном проходе, в качестве доказательства моих слов.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_24");	//И если вдруг обнаружишь этот рудник, то принеси мне хотя бы один экземпляр той золотой породы.
		AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_01_25");	//Само собой, мастер. Я все сделаю.
		AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_01_26");	//Хорошо, тогда ступай.
		B_LogEntry(TOPIC_PW_GOLDSHAHT,"Осаир хочет, чтобы я проверил информацию о том, что в подгорном проходе существует большой золотой рудник. Если я все-таки его найду, мне надо принести приору экземпляр золотой породы с того рудника.");
	};
	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_185_Adept,"PW_CAVEGOLDORE_01");
};

instance DIA_Ass_127_Osair_HelpWithAssair_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_HelpWithAssair_Done_condition;
	information = dia_Ass_127_Osair_HelpWithAssair_Done_info;
	permanent = FALSE;
	description = "По поводу золотого рудника...";
};

func int dia_Ass_127_Osair_HelpWithAssair_Done_condition()
{
	if((MIS_PW_GOLDSHAHT == LOG_Running) && (Npc_HasItems(other,ItMi_Osair_GoldNugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_HelpWithAssair_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_01");	//По поводу золотого рудника...
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_02");	//Да? Чем порадуешь?
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_03");	//У меня есть образец золотой породы, который ты просил.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_04");	//Ну-ка, дай мне взглянуть на него.
	B_GiveInvItems(other,self,ItMi_Osair_GoldNugget,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_05");	//Судя по его виду, этот рудник должен быть довольно богат золотом.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_06");	//Думаю, стоит отправить туда парочку рабов, чтобы те хорошенько прочесали его своим кайлом.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_07");	//Лишнее золото никогда нам не помешает.
	AI_Output(other,self,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_08");	//Само собой, мастер. 
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_09");	//Так. Где этот бездельник Хоакин?
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_10");	//Ах, ну да, я же его послал с письмом к приору Тиаманту.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_11");	//Ладно! Тогда, как только он вернется из храма, отведи его и нескольких рабов на тот рудник.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_12");	//И проследи, чтобы он там заставил их работать.
	AI_Output(self,other,"DIA_Ass_127_Osair_HelpWithAssair_Done_01_13");	//Все, ступай.
	MIS_PW_GOLDSHAHT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PW_GOLDSHAHT,LOG_SUCCESS);
	B_LogEntry(TOPIC_PW_GOLDSHAHT,"Я отдал кусок породы Осаиру. По всей видимости, руднику недолго осталось пустовать.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_127_Osair_DamnHoakin(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_DamnHoakin_condition;
	information = dia_Ass_127_Osair_DamnHoakin_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarBlameTiamant == TRUE) && (HoakinIsDead == TRUE) && (MIS_PW_FollowGoldOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_01");	//Ах! Хорошо, что ты зашел ко мне.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_02");	//Мой подручный, этот болван Хоакин, куда-то пропал. Ты, случайно, его не видел?
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_03");	//Нет.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_04");	//Проклятье! Ладно, Белиар с ним. Но если вдруг встретишь его, то скажи, что он может больше сюда не возвращаться.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_05");	//Иначе я с него шкуру живьем сдеру, а голову насажу на кол!
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_06");	//Что насчет тебя, то тебе придется самому отвести рабов в тот золотой рудник.
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_07");	//Это я уже понял, мастер. Однако ваши рабы... они же там останутся совсем без охраны.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_08");	//Не волнуйся. Они никуда не сбегут. Из этой долины просто так не выбраться.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_09");	//Так что их там либо сожрут дикие звери, или найдут мои люди, что равносильно одному и тому же - смерти.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_10");	//Не думаю, что среди них найдутся желающие разделить подобную участь.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_01_11");	//Поэтому бери рабов и отправляйся в шахту. Оставайся там, а я через пару дней пришлю туда своих людей.
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_01_12");	//Конечно, мастер! Считайте, что все уже сделано.
	OsairWarriorWait = TRUE;
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Поскольку Хоакин мертв, мне придется самому вести рабов в золотой рудник. А кроме этого, дождаться людей Осаира, которых он обещал прислать через пару дней. М-да... Смерть Хоакина не сыграла мне на руку.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_127_Osair_DamnHoakin_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_DamnHoakin_Done_condition;
	information = dia_Ass_127_Osair_DamnHoakin_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_DamnHoakin_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((OsairInRage == TRUE) || (ConvoyGoldShahtDone == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_DamnHoakin_Done_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_01");	//Ну что? Как обстоят дела с золотой шахтой?

	if(OsairInRage == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_02");	//Кммм... дело в том, что мне нужны еще рабы.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_03");	//А что случилось с теми, кто отправился вместе с тобой?
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_04");	//Ну, так получилось, что они не сумели живыми добраться до рудника.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_05");	//Хочешь сказать, что они мертвы?
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_06");	//Совершенно верно, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_07");	//Хорошее дело! А какого Белиара ты позволил этому произойти?
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_08");	//Знаешь, а ты не лучше этого болвана Хоакина, если дал им так просто умереть.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_09");	//Так что давай я кое-что тебе объясню. Дело в том, что это были МОИ рабы!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_10");	//И если ты не смог уберечь их, то тебе придется за них заплатить!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_11");	//Скажем, по две тысячи золотых монет за каждого раба.
		Info_ClearChoices(DIA_Ass_127_Osair_DamnHoakin_Done);
		Info_AddChoice(DIA_Ass_127_Osair_DamnHoakin_Done,"У меня нет столько золота.",DIA_Ass_127_Osair_DamnHoakin_Done_None);

		if(Npc_HasItems(other,ItMi_Gold) >= 4000)
		{
			Info_AddChoice(DIA_Ass_127_Osair_DamnHoakin_Done,"Вот мое золото за рабов, мастер.",DIA_Ass_127_Osair_DamnHoakin_Done_Yes);
		};
	}
	else if(ConvoyGoldShahtDone == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_12");	//Ваши рабы уже приступили к добыче золота, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_13");	//Отличная новость! Что же, если ничто нам не помешает, то вскоре мы станем богаче самого Зубена.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_14");	//Хорошая работа, брат. Я очень доволен твоим усердием.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_15");	//Вот, возьми это золото за свои труды.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_16");	//Благодарю, мастер.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_17");	//Не стоит благодарности, ты его заслужил. 
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_18");	//Но хватит болтовни. Кажется, меня уже заждались в храме. Думаю, сегодня там без крови дело не обойдется.
		AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_01_19");	//Прошу прощения, мастер. А что случилось?
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_20");	//Ханиар вызвал приора Тиаманта на смертельный поединок, обвинив его в предательстве Братства.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_21");	//Это очень серьезное обвинение. Но Ханиар не тот человек, который будет разбрасываться пустыми обвинениями.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_22");	//Наверняка у него что-то есть на Тиаманта. Что-то очень серьезное!
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_23");	//Ну а я, как один из приоров, должен буду выступить судьей между ними и засвидетельствовать смерть одного из них.
		AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_01_24");	//Если тебе это так интересно, лучше самому сходить к Храму и все увидеть воочию.
		B_GiveInvItems(self,other,ItMi_PurseOsair,1);
		MIS_PW_FollowGoldOre = LOG_Success;
		Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
		B_LogEntry(TOPIC_PW_FollowGoldOre,"Осаира обрадовала новость о том, что золотой рудник начал работать.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
		Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
		Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
		Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
		Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
		Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
	};
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_None()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_None_01_01");	//У меня нет столько золота.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_None_01_02");	//Ну что же. Тогда тебе придется заплатить собственной жизнью!
	MIS_PW_FollowGoldOre = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_PW_FollowGoldOre);
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_127_Osair_DamnHoakin_Done_Yes()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_01");	//Вот мое золото за рабов, мастер.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_02");	//Оно уже не твое - оно МОЕ! И я надеюсь, что ты впредь запомнишь этот урок.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_03");	//Потому что в следующий раз одним золотом ты уже не откупишься.
	AI_Output(self,other,"DIA_Ass_127_Osair_DamnHoakin_Done_Yes_01_04");	//А теперь пошел вон с глаз моих!
	MIS_PW_FollowGoldOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Success);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Осаир узнал о том, что все его рабы мертвы. Мне пришлось заплатить за них, чтобы не разгневать приора. Думаю, в следующий раз не стоит испытывать судьбу.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_125_Tiamant,"DeathMatch");
	Npc_ExchangeRoutine(Ass_126_Haniar,"DeathMatch");
	Npc_ExchangeRoutine(Ass_127_Osair,"DeathMatch");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"DeathMatch");
	Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
};

instance DIA_Ass_127_Osair_Poison(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Poison_condition;
	information = dia_Ass_127_Osair_Poison_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_Poison_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (OsairSeekYou == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_01");	//Вы искали меня, мастер?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_02");	//Тебя? Ах, да. Тут действительно есть кое-какое дельце.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_03");	//Тогда я весь во внимании.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_04");	//Хммм... Недавно в разговоре с Нрозасом тот случайно обмолвился о том, что ему удалось приготовить крайне сильный и быстродействующий яд.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_05");	//По его словам, он настолько силен, что способен мгновенно убить даже огромного горного тролля.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_06");	//Я, конечно, не очень-то верю ему, поскольку Нрозас иногда любит приукрасить свои труды.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_07");	//Но если это действительно так, то, безусловно, я бы не отказался иметь при себе небольшое количество этого зелья.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_08");	//Вот поэтому мне и нужно, чтобы кто-нибудь вроде тебя сходил к Нрозасу и прояснил ситуацию.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_09");	//Ну и, при возможности, естественно, принес бы мне небольшой флакон этого яда.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_10");	//А почему вы сами не попросите об этом Нрозаса, мастер?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_11");	//Ты что-то в последнее время стал задавать слишком много вопросов. Большинство из которых абсолютно глупые!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_12");	//Если бы я мог это сделать, то не просил бы тебя об этом. Или разве это не ясно?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_01_13");	//Хорошо. Я схожу к нему и попробую достать для вас этот яд.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_01_14");	//Вот так бы сразу. Ладно, все, - ступай. Поговорим уже об этом позже.
	MIS_PW_PoisonNrozas = LOG_Running;
	Log_CreateTopic(TOPIC_PW_PoisonNrozas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Running);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Осаир хочет, чтобы я принес для него новый сильнодействующий яд, изготовленный приором Нрозасом.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_Poison_Done(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Poison_Done_condition;
	information = dia_Ass_127_Osair_Poison_Done_info;
	permanent = TRUE;
	description = "Я насчет Нрозаса, мастер.";
};

func int dia_Ass_127_Osair_Poison_Done_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Poison_Done_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_01_01");	//Я насчет Нрозаса, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_01_02");	//Надеюсь, что у тебя есть новости, которые меня порадуют.
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);

	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"У меня тут для вас есть пузырек с его ядом.",DIA_Ass_127_Osair_Poison_Done_Give);
	}
	else if(Npc_HasItems(other,ItMi_NrozasPoisonOsair) >= 1)
	{	
		Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"У меня тут для вас есть пузырек с его ядом.",DIA_Ass_127_Osair_Poison_Done_GiveLaw);
	};
	
	if(PlayerSafeFromNrozasNo == TRUE)
	{
		if(PlayerSafeFromNrozas == TRUE)
		{
			Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Его яд не так уж и хорош.",DIA_Ass_127_Osair_Poison_Done_TellPoison);
		}
		else
		{
			Info_AddChoice(DIA_Ass_127_Osair_Poison_Done,"Ничего существенного.",DIA_Ass_127_Osair_Poison_Done_NoTellPoison);
		};
	};

};

func void DIA_Ass_127_Osair_Poison_Done_Give()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_01");	//У меня тут для вас есть пузырек с его ядом.
	B_GiveInvItems(other,self,ItMi_NrozasPoison,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_02");	//(довольно) Ага. Значит, у тебя все получилось как нельзя лучше.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_03");	//Вы абсолютно правы, мастер. 
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_04");	//Ну что же, тогда при возможности я лично проверю, насколько он хорош.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_05");	//И, если что, закажу у Нрозаса его большую партию для своих людей.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_06");	//А почему в этом такая острая необходимость?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_07");	//Дело в том, что последняя экспедиция в глубь острова была не слишком удачной для нас.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_08");	//По всей видимости, кто-то уже догадывается о нашем присутствии на острове.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_09");	//И этот кто-то в последний раз перебил очень много наших верных братьев!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_10");	//По всей видимости, это был очень достойный противник, если смог так легко справиться с моими Тенями.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_11");	//Однако с таким ядом даже ему будет не под силу одолеть нас.
	OsairGetsNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я отдал пузырек с ядом Осаиру. Он остался доволен моей работой. Хотя он и не знает, что этот пузырек предназначался вовсе не ему.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_GiveLaw()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_01");	//У меня тут для вас есть пузырек с его ядом.
	B_GiveInvItems(other,self,ItMi_NrozasPoisonOsair,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_02");	//(довольно) Ага. Значит, у тебя все получилось как нельзя лучше.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_03");	//Вы абсолютно правы, мастер. 
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_04");	//Ну что же, тогда при возможности я лично проверю, насколько он хорош.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_05");	//И, если что, закажу у Нрозаса его большую партию для своих людей.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_Give_01_06");	//А почему в этом такая острая необходимость?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_07");	//Дело в том, что последняя экспедиция в глубь острова была не слишком удачной для нас.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_08");	//По всей видимости, кто-то уже догадывается о нашем присутствии на острове.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_09");	//И этот кто-то в последний раз перебил очень много наших верных братьев!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_10");	//По всей видимости, это был очень достойный противник, если смог так легко справиться с моими Тенями.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_Give_01_11");	//Однако с таким ядом даже ему будет не под силу одолеть нас.
	OsairGetsNrozasPoisonLaw = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я отдал пузырек с ядом Осаиру. Он остался очень доволен моей работой.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

func void DIA_Ass_127_Osair_Poison_Done_NoTellPoison()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_01");	//Ничего существенного.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_02");	//Объясни, что все это значит?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_03");	//Нрозас сам не знает, насколько хорош его яд.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_04");	//Он даже ни разу его не пробовал в действии.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_05");	//Это не очень похоже на него. Обычно Нрозас не бросается пустыми словами.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_06");	//Каждый его яд - это почти произведение искусства.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_07");	//(пристально вглядываясь) Мне кажется, что ты что-то недоговариваешь.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_08");	//Кстати, тебе не удалось получить образец этого зелья?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_09");	//Нет, мастер. Нрозас отказал мне в этой просьбе.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_10");	//Он сказал, что отдаст вам этот яд, только если вы попросите его об этом лично.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_11");	//Даже так?! Белиар бы его побрал, этого Нрозаса!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_12");	//У меня были огромные планы на этот счет, но теперь, по всей видимости, с ними пока придется повременить.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_13");	//А в чем, собственно, дело?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_14");	//Дело в том, что последняя экспедиция в глубь острова была не слишком удачной для нас.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_15");	//По всей видимости, кто-то уже догадывается о нашем присутствии на острове.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_16");	//И этот кто-то в последний раз перебил очень много наших верных братьев!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_17");	//По всей видимости, это был очень достойный противник, если смог так легко справиться с моими Тенями.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_18");	//Однако с таким ядом даже ему будет не под силу одолеть нас.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_19");	//Понимаю.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_20");	//Ну да ладно. Придется мне поговорить с Нрозасом об этом лично.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_21");	//Но учти, если я узнаю, что ты соврал мне, то пеняй на себя!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_NoTellPoison_01_22");	//Все, можешь идти.
	OsairLiarNrozasPoison = TRUE;
	MIS_PW_PoisonNrozas = LOG_Success;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я соврал Осаиру, сказав, что Нрозас отдаст яд лишь ему самому. И если теперь я не позабочусь о самом Нрозасе, мне придет конец, как только Осаир узнает правду. Надо что-то срочно придумать.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_Poison_Done_TellPoison()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_01");	//Его яд не так уж и хорош, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_02");	//Объясни, что все это значит?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_03");	//Я смог испробовать его действие.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_04");	//И он не смог убить даже молодого горного тролля.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_05");	//(задумчиво) Ты говоришь правду?
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_06");	//Можете не сомневаться в этом, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_07");	//Выходит, что Нрозас несколько преувеличил ценность своего нового изобретения.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_08");	//Что же, тем хуже для него. Это послужит для него уроком.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_09");	//Хотя у меня и были большие планы на него, но, по всей видимости, придется пока повременить с ними.
	AI_Output(other,self,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_10");	//А в чем, собственно, дело?
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_11");	//Дело в том, что последняя экспедиция в глубь острова была не слишком удачной для нас.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_12");	//По всей видимости, кто-то уже догадывается о нашем присутствии на острове.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_13");	//И этот кто-то в последний раз перебил очень много наших верных братьев!
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_14");	//По всей видимости, это был очень достойный противник, если смог так легко справиться с моими Тенями.
	AI_Output(self,other,"DIA_Ass_127_Osair_Poison_Done_TellPoison_01_15");	//Однако с таким ядом даже ему будет не под силу одолеть нас.
	MIS_PW_PoisonNrozas = LOG_Success;
	OsairTellNrozasPoison = TRUE;
	Log_SetTopicStatus(TOPIC_PW_PoisonNrozas,LOG_Success);
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Я соврал Осаиру, сказав, что яд Нрозаса довольно плох. Эта новость его немного расстроила, но, похоже, задеть этим Нрозаса для него куда важней.");
	Info_ClearChoices(DIA_Ass_127_Osair_Poison_Done);
};

instance DIA_Ass_127_Osair_Portal(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Portal_condition;
	information = dia_Ass_127_Osair_Portal_info;
	permanent = FALSE;
	description = "Могу ли я поучаствовать в следующей экспедиции?";
};

func int dia_Ass_127_Osair_Portal_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Portal_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_Portal_01_01");	//Могу ли я поучаствовать в следующей экспедиции?
	AI_Output(self,other,"DIA_Ass_127_Osair_Portal_01_02");	//Я ценю твое рвение, брат. Но этот вопрос решает только Ханиар.
	AI_Output(self,other,"DIA_Ass_127_Osair_Portal_01_03");	//Как он скажет, так и будет.
	AI_Output(other,self,"DIA_Ass_127_Osair_Portal_01_04");	//Ясно.
};

instance DIA_Ass_127_Osair_GotoHram(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_condition;
	information = dia_Ass_127_Osair_GotoHram_info;
	permanent = FALSE;
	description = "Когда вы собираетесь отправиться в храм, мастер?";
};

func int dia_Ass_127_Osair_GotoHram_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE) && (OsairGotoHram == FALSE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_01_01");	//Когда вы собираетесь отправиться в храм, мастер?
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_01_02");	//Насколько я знаю Нрозаса, с ним лучше всего обсуждать проблемы до обеда.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_01_03");	//Так что, полагаю, завтра до полудня я уже там буду.
	OsairGotoHram = TRUE;
	OsairGotoHramDay = Wld_GetDay();
};

instance DIA_Ass_127_Osair_GotoHram_Fail(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_Fail_condition;
	information = dia_Ass_127_Osair_GotoHram_Fail_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Fail_condition()
{
	if(OsairGetKill == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Fail_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_01");	//Я был в храме. И имел крайне неприятный разговор с Нрозасом.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_02");	//Знаешь, мне совсем не нравится, когда меня принимают за идиота!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_03");	//И, в особенности, если потом я выгляжу еще большим идиотом в глазах других братьев!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Fail_01_04");	//Хммм... Мне кажется, что твоя голова будет хорошим украшением для моей пещеры.
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_127_Osair_GotoHram_Ok(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_GotoHram_Ok_condition;
	information = dia_Ass_127_Osair_GotoHram_Ok_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_GotoHram_Ok_condition()
{
	if((OsairGoKill == TRUE) && (OsairGetKill == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_GotoHram_Ok_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_01");	//Что ты здесь делаешь, брат? И что за человек с тоб...
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_02");	//Проклятие Белиара! Я глазам своим не верю. Гонсалес!
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_03");	//Вот так встреча. Давненько мы с тобой не виделись... старый друг.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_04");	//Интересно, что вы тут делаете вместе?
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_Ok_01_05");	//Думаю, ты и сам уже понял.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_06");	//Само собой! Однако мне кажется, что это крайне благоприятное стечение обстоятельств.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_07");	//Когда я принесу Ханиару его голову, а заодно и твою - это, безусловно, станет моим триумфом!
	AI_Output(other,self,"DIA_Ass_127_Osair_GotoHram_Ok_01_08");	//Ну что же, можешь попробовать.
	AI_Output(self,other,"DIA_Ass_127_Osair_GotoHram_Ok_01_09");	//Как скажешь...
	Info_ClearChoices(DIA_Ass_127_Osair_GotoHram_Ok);
	Info_AddChoice(DIA_Ass_127_Osair_GotoHram_Ok,Dialog_Ende,DIA_Ass_127_Osair_GotoHram_Ok_Exit);
};

func void DIA_Ass_127_Osair_GotoHram_Ok_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	PlayerIsPrioratFake = TRUE;
	OsairAttackMe = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};

instance DIA_Ass_127_Osair_DualWeapon(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_DualWeapon_condition;
	information = DIA_Ass_127_Osair_DualWeapon_info;
	permanent = FALSE;
	description = "Я хотел бы спросить про рецепт изготовления лунных клинков.";
};

func int DIA_Ass_127_Osair_DualWeapon_condition()
{
	if(MIS_MoonBlades == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_DualWeapon_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_01");	//Я хотел бы спросить про рецепт изготовления лунных клинков.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_02");	//(пристально вглядываясь) Откуда тебе стало известно о них?
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_03");	//Мастер Тиамант рассказал мне об этом.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_04");	//(ворчливо) Ну да, больше некому. Что же, у меня действительно есть этот рецепт.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_05");	//Могу сказать даже больше: в свое время я сам хотел изготовить это легендарное оружие.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_06");	//Но столкнулся с небольшой проблемой, которая полностью перечеркнула все мои начинания.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_07");	//Что за проблема?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_08");	//Все дело в лунном камне, который требуется для их изготовления.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_09");	//Эта редчайшая рудная порода, которую практически невозможно отыскать в чистом виде.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_10");	//Я провел долгие годы в ее поисках, но так и не смог заполучить хотя бы даже один экземпляр.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_11");	//Я бы все-таки взглянул на этот рецепт.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_12");	//Не сомневаюсь. Однако просто так я его тебе не отдам.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_01_13");	//И что мне для этого надо сделать?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_14");	//Ты можешь его купить у меня, либо выполнить мое небольшое поручение.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_01_15");	//И только тогда ты получишь от меня рецепт лунных клинков.
	B_LogEntry(TOPIC_MoonBlades,"У приора Осаира действительно есть рецепт изготовления лунных клинков. Но просто так он мне его не отдаст. Я могу либо купить его, либо выполнить одно его небольшое поручение.");
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Сколько ты хочешь за рецепт?",DIA_Ass_127_Osair_DualWeapon_Gold);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Что это за поручение?",DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Gold()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Gold_01_01");	//Сколько ты хочешь за рецепт?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Gold_01_02");	//(улыбаясь) Совсем пустяк. Двадцать тысяч золотых монет.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Gold_01_03");	//Не слишком ли много?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Gold_01_04");	//Вовсе нет. При условии, что ты, конечно, очень хочешь заполучить этот рецепт.
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);

	if(Npc_HasItems(other,ItMi_Gold) >= 20000)
	{
		Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Хорошо. Вот твое золото.",DIA_Ass_127_Osair_DualWeapon_Buy);
	}
	else
	{
		Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"У меня нет столько золота.",DIA_Ass_127_Osair_DualWeapon_NoGold);
	};
};

func void DIA_Ass_127_Osair_DualWeapon_Buy()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Buy_01_01");	//Хорошо. Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,20000);
	Npc_RemoveInvItems(self,ItMi_Gold,20000);
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Buy_01_02");	//Тогда рецепт изготовления твой. Вот, возьми его.
	B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
	B_LogEntry(TOPIC_MoonBlades,"Я купил у Осаира свиток с рецептом. Теперь осталось найти все необходимые материалы.");
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
};

func void DIA_Ass_127_Osair_DualWeapon_NoGold()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_NoGold_01_01");	//У меня нет столько золота.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_NoGold_01_02");	//Тогда, боюсь, я ничем не смогу тебе помочь.
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"А что за поручение?",DIA_Ass_127_Osair_DualWeapon_Mission);
};

func void DIA_Ass_127_Osair_DualWeapon_Mission()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Mission_01_01");	//Что это за поручение?
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_02");	//Дело довольно деликатное. Если ты, конечно, понимаешь, о чем я.
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Mission_01_03");	//Само собой.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_04");	//Тогда я изложу суть дела. Мне необходимо заручиться поддержкой нескольких наших братьев.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_05");	//Но сделать это надо так, чтобы никто ничего не заподозрил.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_06");	//Как ты понимаешь, сам я этого сделать не могу.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_07");	//Поэтому я предлагаю это тебе. Выполнишь все - и свиток с рецептом твой.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Mission_01_08");	//Ну так как, что скажешь?
	Info_ClearChoices(DIA_Ass_127_Osair_DualWeapon);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Хорошо! Я сделаю это.",DIA_Ass_127_Osair_DualWeapon_Yes);
	Info_AddChoice(DIA_Ass_127_Osair_DualWeapon,"Нет, это не для меня.",DIA_Ass_127_Osair_DualWeapon_No);
};

func void DIA_Ass_127_Osair_DualWeapon_No()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_No_01_01");	//Нет, это не для меня.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_No_01_02");	//Ладно, как скажешь. Я найду для этого другого человека.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_No_01_03");	//Но про свиток с рецептом можешь забыть. Ты его никогда не получишь.
	B_LogEntry(TOPIC_MoonBlades,"Я отказался от предложения Осаира. Теперь он не отдаст мне этот свиток.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_DualWeapon_Yes()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_DualWeapon_Yes_01_01");	//Хорошо! Я сделаю это.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Yes_01_02");	//Отлично. Тогда имена тех, с кем тебе необходимо поговорить, - это Фамид, Рафат, Назим и Кудир.
	AI_Output(self,other,"DIA_Ass_127_Osair_DualWeapon_Yes_01_03");	//Теперь ступай. Надеюсь, что у тебя все получится.
	MIS_CareOsair = LOG_Running;
	Log_CreateTopic(TOPIC_CareOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_Running);
	B_LogEntry(TOPIC_CareOsair,"Я должен поговорить с четырьмя братьями Масиаф и заручиться их поддрежкой для Осаира. Имена этих людей: Фамид, Рафат, Назим и Кудир.");
	B_LogEntry_Quiet(TOPIC_MoonBlades,"Чтобы получить свиток, я должен буду поработать на приора Осаира.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_391_Adept,"PW_FAMID");
	Wld_InsertNpc(Ass_392_Adept,"PW_RAFAT");
	Wld_InsertNpc(Ass_393_Adept,"PW_NAZIM");
	Wld_InsertNpc(Ass_394_Adept,"PW_KUDIR");
};

instance DIA_Ass_127_Osair_FinalHaniar(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_FinalHaniar_condition;
	information = DIA_Ass_127_Osair_FinalHaniar_info;
	permanent = FALSE;
	description = "Я принес послание от Ханиара, мастер.";
};

func int DIA_Ass_127_Osair_FinalHaniar_condition()
{
	if(Npc_HasItems(other,ItWr_HaniarToOsair) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_FinalHaniar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_FinalHaniar_01_01");	//Я принес послание от Ханиара, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_02");	//Хорошо, отдай его мне.
	AI_Output(other,self,"DIA_Ass_127_Osair_FinalHaniar_01_03");	//Вот.
	B_GiveInvItems(other,self,ItWr_HaniarToOsair,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,ItWr_HaniarToOsair,1);
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_04");	//Хорошая новость! Давно пора было это сделать.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_05");	//Так что передай Ханиару, что я согласен на его предложение.
	AI_Output(self,other,"DIA_Ass_127_Osair_FinalHaniar_01_06");	//И постарайся не медлить с этим.
	OsairReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_127_Osair_RafatNeedPermission(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_RafatNeedPermission_condition;
	information = DIA_Ass_127_Osair_RafatNeedPermission_info;
	permanent = FALSE;
	description = "Рафат хочет снова молиться в храме.";
};

func int DIA_Ass_127_Osair_RafatNeedPermission_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatNeedPermission == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_RafatNeedPermission_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_01");	//Рафат хочет снова молиться в храме.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_02");	//(ворчливо) А я тут при чем?
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_03");	//Ему нужно разрешение одного из приоров, поскольку сам Ханиар запретил ему это делать.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_04");	//Ах, вот в чем дело!
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_05");	//И если он получит его от вас, думаю, его преданность не будет знать границ.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_06");	//Это вполне логично. Хорошо, передай Рафату, что я даю ему подобное разрешение.
	AI_Output(self,other,"DIA_Ass_127_Osair_RafatNeedPermission_01_07");	//Если Ханиар спросит его, он может смело сослаться на меня.
	AI_Output(other,self,"DIA_Ass_127_Osair_RafatNeedPermission_01_08");	//Я так ему и передам.
	RafatGetPermission = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаир дал разрешение Рафату молиться в храме, несмотря на запрет Ханиара. Уверен, что Ханиару это не очень понравится.");
	AI_StopProcessInfos(self);
};

var int FazimAboutKnow;
var int NazimAboutKnow;
var int RafatAboutKnow;
var int KudirAboutKnow;
var int CareOsairCount;

instance DIA_Ass_127_Osair_CareOsair(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_CareOsair_condition;
	information = DIA_Ass_127_Osair_CareOsair_info;
	permanent = TRUE;
	description = "По поводу новых людей...";
};

func int DIA_Ass_127_Osair_CareOsair_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_CareOsair_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_01_01");	//По поводу новых людей...
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_01_02");	//Есть какие новости?
	Info_ClearChoices(DIA_Ass_127_Osair_CareOsair);

	Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Пока нет.",DIA_Ass_127_Osair_CareOsair_NoNews);

	if((FazimAgreed == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Фамид теперь один из ваших людей.",DIA_Ass_127_Osair_CareOsair_Fazim);
	}
	else if((FazimRefuseTalk == TRUE) && (FazimAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Я не смог договориться с Фамидом.",DIA_Ass_127_Osair_CareOsair_NoFazim);
	};
	if((RafatAgreed == TRUE) && (RafatAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Рафат согласен быть вашим человеком.",DIA_Ass_127_Osair_CareOsair_Rafat);
	};
	if((NazimKnowAboutCave == TRUE) && (NazimAboutKnow == FALSE) && ((NazimPissOff == TRUE) || (NazimGetOutCave == TRUE) || (NazimStayInCave == TRUE)))
	{
		if((NazimPissOff == TRUE) || (NazimStayInCave == TRUE))
		{
			Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Назим не сможет работать на вас, мастер.",DIA_Ass_127_Osair_CareOsair_NoNazim);
		}
		else if(NazimGetOutCave == TRUE)
		{
			Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Назим готов работать на вас.",DIA_Ass_127_Osair_CareOsair_Nazim);
		};
	};
	if((KudirGetTrollPlant == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Кудир вскоре присоединится к вам.",DIA_Ass_127_Osair_CareOsair_Kudir);
	}
	else if((KudirPissOff == TRUE) && (KudirAboutKnow == FALSE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Кудир отказался от предложения.",DIA_Ass_127_Osair_CareOsair_NoKudir);
	};
	if((FazimAboutKnow == TRUE) && (NazimAboutKnow == TRUE) && (RafatAboutKnow == TRUE) && (KudirAboutKnow == TRUE))
	{
		Info_AddChoice(DIA_Ass_127_Osair_CareOsair,"Думаю, я поговорил со всеми.",DIA_Ass_127_Osair_CareOsair_AlDone);
	};
};

func void DIA_Ass_127_Osair_CareOsair_AlDone()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_AlDone_01_01");	//Думаю, я поговорил со всеми.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_AlDone_01_02");	//Как теперь насчет нашего договора?

	if(CareOsairCount >= 3)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_03");	//Что же, твоя помощь была действительно неоценима.
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_04");	//Вот, возьми это свиток с рецептом, как мы и договаривались.
		B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_05");	//Теперь он по праву твой.
		B_LogEntry(TOPIC_MoonBlades,"Осаир отдал мне свиток с рецептом. Теперь осталось найти все необходимые материалы.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_06");	//По мне, так ты и на полсвитка не наработал!
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_07");	//Так что считай, что наша сделка не состоялась.
		AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_AlDone_01_08");	//Все, разговор окончен.
		B_LogEntry(TOPIC_MoonBlades,"Осаир счел, что я плохо поработал. Боюсь, теперь мне этого свитка не видать.");
	};

	MIS_CareOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CareOsair,LOG_SUCCESS);
	B_LogEntry(TOPIC_CareOsair,"Я поговорил со всеми, кто бы мог помочь Осаиру.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_NoNews()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNews_01_01");	//Пока нет.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNews_01_02");	//Тогда и не о чем говорить.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_127_Osair_CareOsair_Fazim()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_01");	//Фамид теперь один из ваших людей, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_02");	//Отлично! Правда, насчет него я особо и не сомневался.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_03");	//(улыбаясь) Только ответь мне на один вопрос. Как дорого тебе обошлась его преданность?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_04");	//В небольшую гору золота.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_05");	//Так я и думал. Хотя по мне такая преданность самая надежная.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_06");	//Только не думай, что я буду возмещать твои расходы.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Fazim_01_07");	//Все, что ты сделал, касается только тебя и никого больше.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Fazim_01_08");	//На другое я и не рассчитывал.
	CareOsairCount += 1; 
	FazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаир остался доволен тем, что Фамид присоединится к его людям.");
};


func void DIA_Ass_127_Osair_CareOsair_NoFazim()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_01");	//Я не смог договориться с Фамидом, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_02");	//Это плохо. По всей видимости, ты предложил ему не слишком выгодные условия.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_03");	//Этот ублюдок слишком жадный до золота.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_04");	//Я это знаю. Однако ты понимаешь, что это не оправдание.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoFazim_01_05");	//Мне нужен результат, а как ты его добьешься, меня не интересует.
	FazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаир остался недоволен тем, что Фамид не присоединится к его людям.");
};

func void DIA_Ass_127_Osair_CareOsair_Rafat()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Rafat_01_01");	//Рафат согласен быть вашим человеком.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Rafat_01_02");	//Хорошая новость! Хотя другого я и не ожидал.
	CareOsairCount += 1; 
	RafatAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Решение Рафата порадовало приора Осаира.");
};

func void DIA_Ass_127_Osair_CareOsair_Nazim()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Nazim_01_01");	//Назим готов работать на вас.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Nazim_01_02");	//Рад слышать об этом. Надеюсь, тебе не пришлось его долго уговаривать?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Nazim_01_03");	//Он был готов на все, лишь бы выбраться из рудной шахты.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Nazim_01_04");	//Ну да, конечно.
	CareOsairCount += 1; 
	NazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаира порадовала новость о том, что Назим теперь работает на него.");
};

func void DIA_Ass_127_Osair_CareOsair_NoNazim()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_01");	//Назим не сможет работать на вас, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_02");	//(недовольно) А в чем причина?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_03");	//Он сейчас охраняет рудную шахту по приказу Ханиара.
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_04");	//Я говорил об этом с Ханиаром, но не смог убедить его в необходимости отпустить Назима.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_05");	//Ах, вот в чем дело? Ладно, тогда я попробую сам уладить эту проблему.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoNazim_01_06");	//От тебя же больше ничего не требуется.
	NazimAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаир сам разберется с Назимом. Моя помощь ему теперь не нужна.");
};

func void DIA_Ass_127_Osair_CareOsair_Kudir()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Kudir_01_01");	//Кудир вскоре присоединится к вам.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_02");	//Никогда бы не подумал, что он согласится на подобное.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_03");	//Как тебе это удалось?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_Kudir_01_04");	//Я сделал ему предложение, от которого он не смог отказаться.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_05");	//А ты, похоже, умеешь договариваться с людьми. Это довольно редкий дар.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_Kudir_01_06");	//И, если его правильно использовать, можно многого достичь.
	CareOsairCount += 1; 
	KudirAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Осаир был удивлен, что мне удалось переманить Кудира на его сторону.");
};

func void DIA_Ass_127_Osair_CareOsair_NoKudir()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_01");	//Кудир отказался от предложения.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_02");	//Почему?
	AI_Output(other,self,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_03");	//Сейчас он работает на приора Ханиара и не собирается ничего менять.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_04");	//Так он человек Ханиара? Хммм... Что же, это существенно меняет суть дела.
	AI_Output(self,other,"DIA_Ass_127_Osair_CareOsair_NoKudir_01_05");	//Ладно, об остальном я сам позабочусь. Может оставить Кудира в покое.
	KudirAboutKnow = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Приор Осаир сам позаботится о Кудире.");
};

instance DIA_Ass_127_Osair_OsairPlans(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = DIA_Ass_127_Osair_OsairPlans_condition;
	information = DIA_Ass_127_Osair_OsairPlans_info;
	permanent = FALSE;
	description = "Почему именно эти люди, мастер?";
};

func int DIA_Ass_127_Osair_OsairPlans_condition()
{
	if((HaniarKnowsOsairPlans_01 == TRUE) && (MIS_OsairTrait == FALSE) && ((MIS_CareOsair == LOG_Running) || (MIS_CareOsair == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_Ass_127_Osair_OsairPlans_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_OsairPlans_01_01");	//Почему именно эти люди, мастер?
	AI_Output(self,other,"DIA_Ass_127_Osair_OsairPlans_01_02");	//Это тебя касаться не должно. Лучше занимайся своими делами.
};

instance DIA_Ass_127_Osair_Trait(C_Info)
{
	npc = Ass_127_Osair;
	nr = 1;
	condition = dia_Ass_127_Osair_Trait_condition;
	information = dia_Ass_127_Osair_Trait_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_127_Osair_Trait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_127_Osair_Trait_info()
{
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_01");	//Ах, ты здесь. Я уже слышал, что произошло в храме.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_02");	//По правде говоря, на моей памяти это первый случай, когда адепт смог победить приора в бою.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_03");	//Всегда что-то случается в первый раз.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_04");	//(пристально вглядываясь) А ты довольно непрост, как кажешься на первый взгляд.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_05");	//Поэтому у меня к тебе будет одно предложение.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_06");	//Я слушаю вас, мастер.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_07");	//За последнее время я смог убедится в том, что ты довольно заметная фигура в Братстве. 
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_08");	//Если так и дальше пойдет, то ты вполне бы смог стать одним из приоров Масиафа.
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_09");	//А посему мне нужно быть уверенным в том, что, когда придет время, такие люди, как ты, будут на моей стороне.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_10");	//Что вы имеете в виду?
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_11");	//Думаю, ты и сам прекрасно все понял. А надежные и преданные люди у меня всегда в цене.
	AI_Output(other,self,"DIA_Ass_127_Osair_Trait_01_12");	//А если я откажусь?
	AI_Output(self,other,"DIA_Ass_127_Osair_Trait_01_13");	//Тогда ты просто не оставишь мне выбора. А я не могу так рисковать.
	Info_ClearChoices(DIA_Ass_127_Osair_Trait);
	Info_AddChoice(DIA_Ass_127_Osair_Trait,"Придется тебе все-таки рискнуть!",DIA_Ass_127_Osair_Trait_No);
	Info_AddChoice(DIA_Ass_127_Osair_Trait,"Тогда лучше быть на вашей стороне.",DIA_Ass_127_Osair_Trait_Yes);
};

func void dia_Ass_127_Osair_Trait_No()
{
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_No_01_01");	//Придется тебе все-таки рискнуть!
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_No_01_02");	//Что же, ты сам выбрал свой путь. Убить его!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void dia_Ass_127_Osair_Trait_Yes()
{
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_01");	//Тогда лучше быть на вашей стороне.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_02");	//Разумное решение, о отец мудрости. И я тебе обещаю, что ты об этом не пожалеешь.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_03");	//А что вы задумали, мастер?
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_04");	//В последнее время в Братстве творятся довольно странные вещи.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_05");	//И, на мой взгляд, Ханиар уже слишком стар, чтобы держать все это под контролем.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_06");	//Тебе так не кажется?
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_07");	//Вполне возможно.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_08");	//Исходя из сказанного, я полагаю, что пришло время немного изменить положение дел в Братстве.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_09");	//Мне кажется, что Ханиару это не слишком придется по душе.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_10");	//Само собой. Поэтому без небольшой резни здесь не обойтись. 
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_11");	//Я понимаю сейчас твое недоумение, но поверь - такое происходит уже не в первый раз.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_12");	//Поэтому нам придется пустить немного старой крови во благо процветания новой.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_13");	//Так значит, вы хотите напасть на храм?
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_14");	//К сожалению, у нас нет другого выбора. Нам придется это сделать, если, конечно, мы хотим спасти Братство.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_15");	//Но Ханиару сейчас предано слишком много людей, чтобы разрешить этот вопрос мирно.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_16");	//Поэтому ты правильно сделал, что согласился на мое предложение.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_17");	//Ибо когда придет время, все, кто не поддержал меня сейчас, - просто-напросто умрут.
	AI_Output(other,self,"dia_Ass_127_Osair_Trait_Yes_01_18");	//Иного и быть не может, мастер.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_19");	//Меня радует тот факт, что мы нашли общий язык. А пока что можешь заниматься своими делами.
	AI_Output(self,other,"dia_Ass_127_Osair_Trait_Yes_01_20");	//Когда ты мне понадобишься, я дам тебе об этом знать.
	MIS_OsairTrait = LOG_Running;
	Log_CreateTopic(TOPIC_OsairTrait,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Running);
	B_LogEntry(TOPIC_OsairTrait,"Похоже, дело набирает серьезные обороты. Осаир задумал напасть на храм и убить Ханиара, дабы захватить власть в Братстве! Надо немедленно сообщить об этом Ханиару. Но сделать это лучше без свидетелей.");
	AI_StopProcessInfos(self);
};