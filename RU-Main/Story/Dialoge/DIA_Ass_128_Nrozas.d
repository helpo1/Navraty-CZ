instance DIA_Ass_128_Nrozas_EXIT(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 999;
	condition = dia_Ass_128_Nrozas_exit_condition;
	information = dia_Ass_128_Nrozas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_128_Nrozas_exit_condition()
{
	return TRUE;
};

func void dia_Ass_128_Nrozas_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_PreHALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PreHALLO_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_condition()
{
	if((MIS_OsairDemand == LOG_SUCCESS) && (NrozasMurid == FALSE))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (MeetNrozas == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PreHALLO_01_00");	//(раздраженно) Зачем ты беспокоишь меня?
};


instance DIA_Ass_128_Nrozas_PreHALLO_Kill(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PreHALLO_Kill_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (PW_WelcomeToHram == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_HALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_hallo_condition;
	information = dia_Ass_128_Nrozas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_hallo_condition()
{
	if((Npc_IsDead(SEK_168_SLAVEOBSSEK) == FALSE) && (PW_WelcomeToHram == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_hallo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_00");	//(довольно) А, мой новый раб! Ну наконец-то. Иди сюда, не бойся.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_01");	//Что касается тебя, послушник, - больше не заставляй меня ждать. Иначе окажешься на его месте!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_02");	//А сейчас, чтобы хоть как-то сгладить свою вину, ты поможешь мне.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_03");	//У меня заканчиваются целебные травы и листья серафиса.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_01_04");	//Так что сходи и принеси мне по десятку стеблей каждого растения. Тебе все ясно?
	B_LogEntry(TOPIC_MasiafStory,"Кажется, мне удалось проникнуть в Храм. При случае надо будет сообщить об этом Гонсалесу.");
	Info_ClearChoices(DIA_Ass_128_Nrozas_HALLO);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"...(молчать)",DIA_Ass_128_Nrozas_HALLO_Molchat);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"...(молча кивнуть)",DIA_Ass_128_Nrozas_HALLO_Kivok);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"Да, я все понял.",DIA_Ass_128_Nrozas_HALLO_Yes);
};

func void DIA_Ass_128_Nrozas_HALLO_Molchat()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Molchat_01_00");	//И? Что ты уставился на меня, как тупой баран?
};

func void DIA_Ass_128_Nrozas_HALLO_Kivok()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_00");	//Хорошо. И вот еще что...
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_01");	//Если будешь поблизости от пещеры Осаира, передай ему, чтобы в следующий раз прислал мне более крепких рабов.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_02");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_03");	//А то последние и двух дней не протянули. Мрут как мухи!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_04");	//Если так дальше пойдет, то мне в скором времени не на ком уже будет ставить свои эксперименты с ядами.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Kivok_01_05");	//Теперь все. Ступай!
	MIS_NrozasFl = LOG_Running;
	MIS_NrozasToOsair = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasFl,LOG_MISSION);
	Log_CreateTopic(TOPIC_NrozasToOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_Running);
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_Running);
	B_LogEntry(TOPIC_NrozasFl,"Мастер ядов Нрозас дал мне поручение принести ему по десятку стеблей целебной травы и серафиса.");
	B_LogEntry_Quiet(TOPIC_NrozasToOsair,"Нрозас попросил меня заглянуть в пещеру к приору Осаиру и передать ему, чтобы в следующий раз он прислал Нрозасу более крепких рабов для его экспериментов с ядами.");
	MeetNrozas = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
};

func void DIA_Ass_128_Nrozas_HALLO_Yes()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HALLO_Yes_01_00");	//Да, я все понял.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_01");	//Ты посмел заговорить со мной без разрешения?!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_02");	//Что-то мне подсказывает, что ты вовсе не тот, за кого себя выдаешь.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HALLO_Yes_01_03");	//Ну что же, тогда это будет стоить тебе жизни. Зря ты пришел сюда!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_NrozasFl(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NrozasFl_condition;
	information = dia_Ass_128_Nrozas_NrozasFl_info;
	permanent = FALSE;
	description = "(отдать все растения)";
};

func int dia_Ass_128_Nrozas_NrozasFl_condition()
{
	if((MIS_NrozasFl == LOG_Running) && (Npc_HasItems(other,ItPl_Blueplant) >= 10) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 10))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasFl_info()
{
	B_GivePlayerXP(100);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Blueplant,10);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_01");	//Отлично! Как раз то, что мне было нужно.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_02");	//А ты не так и безнадежен, как мне показалось на первый взгляд.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasFl_01_03");	//Возможно, из тебя выйдет хороший помощник.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NrozasFl_01_04");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasFl = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasFl,"Я принес Нрозасу все растения, которые он хотел. Кажется, он остался доволен моей работой.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_NrozasToOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NrozasToOsair_condition;
	information = dia_Ass_128_Nrozas_NrozasToOsair_info;
	permanent = FALSE;
	description = "(отдать письмо)";
};

func int dia_Ass_128_Nrozas_NrozasToOsair_condition()
{
	if((MIS_NrozasToOsair == LOG_Running) && (Npc_HasItems(other,ItWr_Osair) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasToOsair_info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItWr_Osair,1);
	Npc_RemoveInvItems(self,ItWr_Osair,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_00");	//Что это? А, письмо от Осаира.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_01");	//Хорошо, давай его сюда. Посмотрим, что он тут пишет.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_02");	//Хммм...(задумчиво) И он полагает, что я соглашусь с этим? Ну да ладно.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_03");	//Когда он пришлет ко мне своего человека за новой порцией отравленных стрел, я напомню ему об этом письме.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_04");	//Что касается тебя, то ты хорошо поработал.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_05");	//Если и дальше будешь так же точно исполнять мои распоряжения, я позабочусь о твоей судьбе послушника.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NrozasToOsair_01_06");	//Теперь ступай. Ты пока что мне не нужен.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NrozasToOsair_01_07");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasToOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasToOsair,"Я принес Нрозасу ответ от Осаира. Письмо явно не пришлось ему по душе, но свою работу я сделал.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItWr_Osair_Read,"FP_ITEM_NROZAS_LETTER");
};

instance DIA_Ass_128_Nrozas_NewSlaves(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_NewSlaves_condition;
	information = dia_Ass_128_Nrozas_NewSlaves_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_NewSlaves_condition()
{
	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NewSlaves_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_01");	//(серьезно) Стой, послушник. Ответь мне на один вопрос.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_02");	//Я слышал, что ты принес Осаиру шкуру черного пещерного тролля.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_03");	//Откуда ты узнал, что он хотел заполучить ее? Ты что, прочитал его письмо, присланное мне?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_04");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_05");	//Хватит этих кивков! Отвечай нормально, и не вздумай мне солгать!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_06");	//Да, я его прочитал.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_07");	//Хммм. А ты, однако, храбрец! У других бы духу не хватило на такое, а ты смог.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_08");	//Конечно, за такую дерзость тебя стоило бы прикончить прямо на месте.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_09");	//Но благодаря твоей услуге Осаир сегодня прислал мне целую партию новых рабов.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_10");	//И это, как ты понимаешь, немного меняет обстоятельства дела.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_11");	//Ты оказался не только полезен нам обоим, но и помог разрешить нам очень давний спор.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_12");	//Поэтому я принял решение. Отныне ты - мой мюрид! Избранный из числа послушников.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_13");	//Надеюсь, ты понимаешь, что это большая честь. Так что не подведи меня.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_14");	//Благодарю тебя, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_15");	//Не стоит. Ты это заслужил.
	NrozasMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry(TOPIC_MasiafStory,"Нрозас был очень доволен тем, что я смог разрешить его давний спор с Осаиром, и в то же время оказался полезен обоим. За это он назначил меня своим мюридом - избранным послушником.");

	if((OsairMurid == TRUE) && (PlayerSendToTiamant == FALSE))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_16");	//Да, и еще кое-что...
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_17");	//Раз ты смог одолеть пещерного тролля, то я смею предположить, что ты довольно искусный боец.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_18");	//Приор Тиамант занимается боевой подготовкой Теней, и наверняка его заинтересует этот факт.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_NewSlaves_01_19");	//Поговори с ним. А если у него возникнут какие-то вопросы, просто скажи, что я тебя прислал.
		AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_20");	//Хорошо, мастер.
		PlayerSendToTiamant = TRUE;
	};
};


instance DIA_Ass_128_Nrozas_Murid(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Murid_condition;
	information = dia_Ass_128_Nrozas_Murid_info;
	permanent = FALSE;
	description = "Что значит быть избранным, мастер?";
};

func int dia_Ass_128_Nrozas_Murid_condition()
{
	if((NrozasMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Murid_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_01");	//Что значит быть избранным, мастер?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_02");	//Давай я кое-что тебе объясню. Слушай внимательно.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_03");	//Раз в четыре года один из наших послушников удостаивается чести обратиться в Тень Масиаф.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_04");	//Тенями мы зовем своих воинов, несущих смерть всем тем, кто сомневается в нашем могуществе и, главное, в могуществе самого Белиара!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_05");	//Каждый приор Масиаф, и я в том числе, выбирает из числа послушников того, кто, по его мнению, достоин этого.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_06");	//И назначает его своим мюридом, тем самым предлагая его в качестве кандидата для ритуала обращения.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_07");	//Когда наступает срок, все мюриды подвергаются ряду очень сложных и смертельных испытаний.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_08");	//И тот единственный, кто останется жив, в конце концов проходит обряд посвящения в воина Белиара.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_09");	//Я выбрал тебя в качестве своего мюрида. Однако другие, насколько мне известно, еще не сделали свой выбор.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_10");	//А если все приоры выберут одного и того же послушника?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_11");	//Хммм. Насколько мне известно, такого еще никогда не было.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_12");	//Но, скорее всего, его судьбу уже будет решать сам Ханиар Слепец, как самый могущественный и мудрый из нас.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Murid_01_13");	//А что он решит, известно только самому Белиару.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_14");	//Понимаю.
	MuridTells = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Нрозас рассказал мне о ритуале обращения избранных послушников в ряды Теней, воинов Братства Масиафа. Каждый приор должен выбрать себе мюрида, а потом уже те соревнуются между собой. Если все приоры выберут одного и того же человека, судьбу этого мюрида будет решать самый мудрый из них - Ханиар Слепец.");
};

instance DIA_Ass_128_Nrozas_HasimVine(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_HasimVine_condition;
	information = dia_Ass_128_Nrozas_HasimVine_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_HasimVine_condition()
{
	if(HasimNeedRareWine == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_01");	//А, мюрид! Хорошо, что ты здесь.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_02");	//Мне нужно, чтобы ты сходил в кладовую и принес мне пакет с серой и углем.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_01_03");	//Вот тебе ключ. Но смотри больше ничего там не трогай!
	B_GiveInvItems(self,other,ItKe_PW_Sklad,1);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_01_04");	//Конечно, мастер.
	MIS_NrozasPacket = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasPacket,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_Running);
	B_LogEntry(TOPIC_NrozasPacket,"Мне необходимо сходить на склад и принести пакет с серой и углем мастеру Нрозасу.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_HasimVine_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_HasimVine_Done_condition;
	information = dia_Ass_128_Nrozas_HasimVine_Done_info;
	permanent = FALSE;
	description = "Я принес пакет с серой и углем.";
};

func int dia_Ass_128_Nrozas_HasimVine_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_PacketColesulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_01");	//Я принес пакет с серой и углем.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_02");	//Так, хорошо. Давай его сюда.
	B_GiveInvItems(other,self,ItMi_PacketColesulfur,1);

	if(Npc_HasItems(other,ItKe_PW_Sklad) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_PW_Sklad,1);
	};

	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_03");	//Посмотрим. Хммм... ну да, я так и думал.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_04");	//Этого количества серы мне совершенно не хватит для моих экспериментов.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_05");	//Мне нужно еще как минимум два десятка кусков этого материала.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_06");	//А где я смогу достать ее для вас, мастер?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_07");	//Я точно не смогу сказать. Но, кажется, в подгорном проходе были небольшие залежи серных копий. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_HasimVine_Done_01_08");	//Поищи ее там. Правда, можешь особо не спешить. Того количества, что ты принес, мне пока хватит на некоторое время.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_Done_01_09");	//Я все понял, мастер.
	NrozasNeedMoreSulfur = TRUE;
	B_LogEntry(TOPIC_NrozasPacket,"Я отдал Нрозасу пакет, однако серы оказалось недостаточно. Мне нужно накопать еще пару десятков кусков этого материала. По словам Нрозаса, в подгорном проходе были несколько серных копий.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_Sulfur_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Sulfur_Done_condition;
	information = dia_Ass_128_Nrozas_Sulfur_Done_info;
	permanent = FALSE;
	description = "Вот два десятка кусков серной породы.";
};

func int dia_Ass_128_Nrozas_Sulfur_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_Sulfur) >= 20) && (NrozasNeedMoreSulfur == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Sulfur_Done_info()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Sulfur_Done_01_01");	//Вот два десятка кусков серной породы.
	B_GiveInvItems(other,self,ItMi_Sulfur,20);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_02");	//Отлично. Вот это совсем другое дело.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_03");	//С таким количеством мне больше не о чем беспокоиться в моих экспериментах.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_04");	//Ты хорошо поработал, мюрид. Теперь ступай.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Sulfur_Done_01_05");	//Если ты мне вдруг понадобишься, я дам тебе знать.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Sulfur_Done_01_06");	//Да, мастер.
	MIS_NrozasPacket = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_SUCCESS);
	B_LogEntry(TOPIC_NrozasPacket,"Я принес Нрозасу серу. Он остался доволен моей работой.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_condition;
	information = dia_Ass_128_Nrozas_Poison_info;
	permanent = FALSE;
	description = "У меня к вам одно дело, мастер.";
};

func int dia_Ass_128_Nrozas_Poison_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_01");	//У меня к вам одно дело, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_02");	//(удивленно) Дело ко мне? Довольно редко можно услышать о том, что у кого ко мне дело.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_03");	//И в чем же оно заключается?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_04");	//Приор Осаир рассказал мне, что вам удалось приготовить один очень сильный яд.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_05");	//(довольно) Ага. Значит, его все-таки заинтересовала эта тема!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_06");	//Да, и поэтому он хотел бы получить образец этого зелья. Разумеется, с вашего разрешения.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_07");	//Хммм. Почему бы и нет. Однако для начала мне необходимо испытать его действие.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_08");	//Если вдруг что-то пойдет не так, то сам понимаешь - моя репутация в Братстве довольно сильно пострадает.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_09");	//А я этого допустить не могу.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_10");	//Само собой.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_11");	//Я уже давно хотел отправить с этим заданием моего помощника Кадуина.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_12");	//Однако сейчас мне пришла идея получше. Это сделаешь ты.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_13");	//Помоги мне опробовать этот яд на каком-нибудь очень могучем существе.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_14");	//И Осаир, в знак моей благодарности, получит свой экземпляр этого зелья.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_15");	//Только это должна быть по-настоящему сильная и крайне выносливая тварь.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_16");	//Например, горный тролль. Ну или что-то подобное этому.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_17");	//И не смей опробовать его на рабах. Эти никчемные скоты подохнут от одного его запаха.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_18");	//А мне необходимо как можно тщательней оценить его действие.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_19");	//Ну и, наверное, не стоит говорить о том, что мне нужны вещественные доказательства использования моего яда.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_20");	//Конечно. Я все понял, мастер. Можете на меня положиться.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_21");	//Хорошо. Тогда вот, возьми этот пузырек.
	B_GiveInvItems(self,other,ItMi_NrozasPoison,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_22");	//Будь с ним осторожен! Если, конечно, не хочешь стать мертвецом.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_01_23");	//Все, ступай. Я жду от тебя отчета как можно скорее.
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозасу нужно испытать действие созданного им яда. Если я справлюсь с этим заданием, он даст мне экземпляр этого зелья для приора Осаира. Мне необходимо испытать действие яда на каком-нибудь очень сильном и выносливом существе, например, на горном тролле. Но как заставить тролля проглотить пузырек с ядом? Может, стоит поговорить об этом с Гонсалесом?");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_Done_condition;
	information = dia_Ass_128_Nrozas_Poison_Done_info;
	permanent = FALSE;
	description = "По поводу вашего яда, мастер.";
};

func int dia_Ass_128_Nrozas_Poison_Done_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_Done_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_00");	//По поводу вашего яда, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_01");	//Я тебя слушаю. Тебе удалось испытать мой яд?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_02");	//К сожалению, я не смог этого сделать.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_03");	//Что? Болван! Неужели с таким простым делом могли возникнуть какие-то трудности?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_04");	//Эх, зря я, видимо, тебе доверился! Ладно, отдай мне мой пузырек с ядом и проваливай с глаз моих.
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_05");	//Боюсь, что яда у меня тоже нет.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_06");	//(гневно) Как так?  И где же он?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_07");	//Я... я случайно пролил его.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_08");	//Ты что, держишь меня за идиота?!
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_09");	//Ну, просто так тебе это с рук не сойдет!
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Как и ожидалось, Нрозас был в гневе. Теперь мне остается только сражаться со всем Братством.");
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_10");	//Как вы и приказали. Я испытал его на молодом горном тролле.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_11");	//Хммм. Лучше, конечно, было бы испытать его на взрослой особи, но и это сойдет.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_12");	//Ну и что случилось далее?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_13");	//Тролль мгновенно умер.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_14");	//А где доказательства?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{	
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_15");	//Вот его язык.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_16");	//Хммм... Да, похоже он действительно умер от отравления.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_17");	//Ну что же, отличная работа, брат! Ты как всегда меня не подвел.
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_18");	//А что насчет небольшой порции яда для Осаира?
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_19");	//(пытливо) А моего яда у тебя, случайно, не осталось?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_20");	//Прошу простить меня, мастер. Но я использовал весь яд, что был в пузырьке.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_21");	//Ладно. Как я и обещал, будет Осаиру этот яд.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_22");	//Но мне нужно некоторое время, чтобы приготовить новую порцию.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_23");	//Это все займет около суток. Так что приходи завтра.
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_24");	//Как скажете, мастер.
			DayOsairPoisonReady = Wld_GetDay();
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Как и ожидалось, Нрозас был доволен моим успехом. Теперь мне остается только дождаться, пока он сварит новый яд, а затем отнести его Осаиру.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_25");	//Эммм... У меня их нет.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_26");	//(гневно) Как так? Я же, вроде бы, сказал, чтобы ты принес доказательства действия яда!
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_27");	//Или ты хочешь просто меня обмануть?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_28");	//Нет, ни в коем случае.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_29");	//Знаешь, я люблю, когда мои приказы выполняются с надлежащей точностью. 
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_30");	//И терпеть не могу, когда меня пытаются держать за идиота!
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_31");	//Так что извини.
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозас был в гневе от того, что я не принес ему доказательства применения яда. Моя беспечность теперь может стоить мне жизни.");
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_32");	//К сожалению, я не смог этого сделать.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_33");	//Что? Болван! Неужели с таким простым делом могли возникнуть какие-то трудности?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_34");	//Эх, зря я, видимо, тебе доверился. Ладно, отдай мне мой пузырек с ядом и проваливай с глаз моих.
		
		if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
		{	
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_35");	//Вот он.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_36");	//(раздраженно) Ну, хоть мой яд цел. Все, теперь пошел вон!
			PlayerSafeFromNrozasNo = TRUE;
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозас был в гневе от того, что мне не удалось испытать его яд. Хвала Инносу, мне удалось сохранить голову на плечах.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_37");	//У меня нет его при себе.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_38");	//Как так?! И где же он?
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_39");	//Я не помню, куда его дел.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_40");	//Хммм...(гневно вглядываясь) Ты что, держишь меня за идиота?
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_41");	//Ну, просто так тебе это с рук не сойдет...
			B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозас был в гневе. Я не смог отдать ему яд, поскольку его у меня с собой нет. Теперь мне остается только сражаться со всем Братством.");
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_Poison_DoneForOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_DoneForOsair_condition;
	information = dia_Ass_128_Nrozas_Poison_DoneForOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_Poison_DoneForOsair_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE) && (DayOsairPoisonReady != FALSE) && (DayOsairPoisonReady < daynow))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_DoneForOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_00");	//Постой. Вот, возьми эту склянку.
	B_GiveInvItems(self,other,ItMi_NrozasPoisonOsair,1);
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_01");	//Тут достаточно яда, чтобы порадовать Осаира.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_02");	//Благодарю, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_03");	//Ладно уже, ступай.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_NoDone(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_NoDone_condition;
	information = dia_Ass_128_Nrozas_Poison_NoDone_info;
	permanent = FALSE;
	description = "По поводу вашего яда, мастер.";
};

func int dia_Ass_128_Nrozas_Poison_NoDone_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == FALSE) && (OsairGetsNrozasPoison == FALSE) && ((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_NoDone_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_00");	//По поводу вашего яда, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_01");	//Я тебя слушаю. Тебе удалось испытать мой яд?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_02");	//К сожалению, я не смог этого сделать.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_03");	//Что? Болван! Неужели с таким простым делом могли возникнуть какие-то трудности?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_04");	//Эх, зря я, видимо, тебе доверился! Ладно, отдай мне мой пузырек с ядом - и проваливай с глаз моих.
		
	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_05");	//Вот он.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_06");	//(раздраженно) Ну, хоть мой яд цел. Все, теперь пошел вон!
		PlayerSafeFromNrozasNo = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозас был в гневе от того, что мне не удалось испытать его яд. Хвала Инносу, мне удалось сохранить голову на плечах.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_07");	//У меня нет его при себе.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_08");	//Как так?! И где же он?
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_09");	//Я не помню, куда его дел.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_10");	//Хммм...(гневно вглядываясь) Ты что, держишь меня за идиота?
		AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_NoDone_01_11");	//Ну, просто так тебе это с рук не сойдет...
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Нрозас был в гневе. Я не смог отдать ему яд, поскольку его у меня с собой нет. Теперь мне остается только сражаться со всем Братством.");
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_PoisonGiveOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PoisonGiveOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonGiveOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonGiveOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairGetsNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonGiveOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonGiveOsair_01_01");	//Как ты посмел отдать мой яд Осаиру без моего разрешения?!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonGiveOsair_01_02");	//За подобную дерзость ты умрешь в муках, доселе тебе неизвестных...
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_PoisonTellOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_PoisonTellOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonTellOsair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonTellOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairTellNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonTellOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_01");	//Постой!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_02");	//Ответь мне: это, случаем, не ты тот ублюдок, что пустил слух о моей неудаче с ядом?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_03");	//Нет, это был не я.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_04");	//Ты пытаешься меня обмануть?!
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_05");	//А я ведь точно знаю, что это был ТЫ! Больше просто некому.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_06");	//И теперь все в Братстве только и говорят обо мне как о неудачнике-хвастуне.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_07");	//Тогда попробуй докажи это.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_08");	//(гневно) Что? Ах ты мерзкий щенок! Я сейчас вырву твое сердце и скормлю его шакалам!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_09");	//Не думаю, что подобный подход придется по душе остальным приорам.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_10");	//Белиар бы тебя побрал! Ты, конечно, прав, но я знаю другой способ заткнуть твою лживую пасть. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_11");	//Поэтому я вызываю тебя на поединок Истины! Приор Ханиар нас рассудит.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_12");	//И что это такое?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_13");	//Все очень просто. Ты должен будешь доказать свою правоту в битве со мной, либо сдохнуть со своей ложью у себя в глотке.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_14");	//Я буду ждать тебя на арене Братства. Надеюсь, что у тебя хватит смелости прийти туда.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_16");	//А если нет, то мои братья найдут тебя и сделают с тобой такое, что даже Белиару не снилось!
	MIS_TrueBattle = LOG_Running;
	Log_CreateTopic(TOPIC_TrueBattle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueBattle,LOG_Running);
	B_LogEntry(TOPIC_TrueBattle,"За мою ложь Нрозас вызвал меня на поединок Истины. Теперь все зависит от меня.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TrueBattle");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TrueBattle");
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

instance DIA_Ass_128_Nrozas_TrueBattle(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 2;
	condition = dia_Ass_128_Nrozas_TrueBattle_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_01_00");	//Скоро ты утонешь в луже своей кровавой блевотины, ублюдок!
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Ready(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_TrueBattle_Ready_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Ready_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Ready_condition()
{
	if((MIS_TrueBattle == LOG_Running) && (Npc_GetDistToWP(hero,"PW_HANIAR_DEATHMATCH") <= 500) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Ready_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_00");	//Вижу, что тебе все-таки хватило смелости появиться здесь.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_01");	//Тогда давай посмотрим, настолько же хорош твой меч, как твой гнилой язык.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_02");	//И да... если покинешь пределы арены - ты проиграл! Что равносильно для тебя смерти.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Ready_01_03");	//А теперь умри, шелудивый пес!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	Wld_SendTrigger("EVT_TRUEBATTLE_DEATHMATCH");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Repeat(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_TrueBattle_Repeat_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Repeat_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Repeat_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasStartTrueBattle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Repeat_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TrueBattle_Repeat_01_01");	//Иди сюда, подлый шакал!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_Poison_KillNrozas(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 1;
	condition = dia_Ass_128_Nrozas_Poison_KillNrozas_condition;
	information = dia_Ass_128_Nrozas_Poison_KillNrozas_info;
	permanent = FALSE;
	description = "Приор Осаир посылает вам бутылку вина, мастер.";
};

func int dia_Ass_128_Nrozas_Poison_KillNrozas_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && ((Npc_HasItems(hero,ItFo_BeliarTear) >= 1) || (Npc_HasItems(hero,ItFo_BeliarTear_Haniar) >= 1)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_KillNrozas_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_00");	//Приор Осаир посылает вам бутылку вина, мастер.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_01");	//В знак благодарности за ваш яд.

	if(HaniarGetGift == FALSE)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Я отнес бутылку вина, которую Осаир передал для Нрозаса.");
	}
	else
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_BeliarTear_Haniar,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear_Haniar,1);
		B_LogEntry(TOPIC_NrozasPoisonGift,"Я отнес бутылку вина, которую Осаир передал для Нрозаса, как меня и просил Ханиар.");
	};
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_02");	//(восхищенно) Я не верю своим глазам! Неужели это 'Слеза Белиара'?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_03");	//Я не очень-то разбираюсь в винах.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_04");	//(небрежно) Это заметно. Ведь 'Слеза Белиара' - это не просто какое-то там вино.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_05");	//Оно сродни божественному нектару! Такие напитки достойны пить лишь избранные.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_06");	//Даже сам Зубен позавидовал бы такому.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_07");	//Видимо, Осаир окончательно признал мой гений, раз решился на такой дорогой подарок.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_KillNrozas_01_08");	//Что же, за такое и выпить не грех! Не так ли?
	MIS_NrozasPoisonGift = LOG_Success;
	Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Success);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WineDrink");
};

instance DIA_Ass_128_Nrozas_PRETEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_PRETEACH_Condition;
	information = DIA_Ass_128_Nrozas_PRETEACH_Info;
	permanent = FALSE;
	description = "Могу я чему-нибудь научиться у вас, мастер?";
};

func int DIA_Ass_128_Nrozas_PRETEACH_Condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_PRETEACH_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_PRETEACH_01_00");	//Могу я чему-нибудь научиться у вас, мастер?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_01");	//Конечно. Я могу обучить тебя секретам такого величайшего искусства, как алхимия.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_02");	//Однако тебе понадобится иметь некоторый опыт для ее освоения. 
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PRETEACH_01_03");	//Иначе из наших занятий ничего толкового не выйдет.
	NrozasTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Приор Нрозас сможет обучить меня искусству алхимии.");
};

instance DIA_Ass_128_Nrozas_TEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_TEACH_Condition;
	information = DIA_Ass_128_Nrozas_TEACH_Info;
	permanent = TRUE;
	description = "Обучите меня алхимии, мастер.";
};

func int DIA_Ass_128_Nrozas_TEACH_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TEACH_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TEACH_01_00");	//Обучите меня алхимии, мастер.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TEACH_01_01");	//Хорошо. Что ты хочешь узнать?

	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
	Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,Dialog_Back,DIA_Ass_128_Nrozas_TEACH_BACK);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ass_128_Nrozas_TEACH_HEALTH_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Ass_128_Nrozas_TEACH_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Ass_128_Nrozas_TEACH_Health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Ass_128_Nrozas_TEACH_Perm_Health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ass_128_Nrozas_TEACH_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Ass_128_Nrozas_TEACH_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Ass_128_Nrozas_TEACH_Mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир духа ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Ass_128_Nrozas_TEACH_Perm_Mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Ass_128_Nrozas_TEACH_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир ловкости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Ass_128_Nrozas_TEACH_Perm_DEX);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ass_128_Nrozas_TEACH_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),DIA_Ass_128_Nrozas_TEACH_perm_stamina);
	};
};

func void DIA_Ass_128_Nrozas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

instance Ass_129_DeadNrozas_PreHALLO(C_Info)
{
	npc = Ass_129_DeadNrozas;
	nr = 1;
	condition = Ass_129_DeadNrozas_PreHALLO_condition;
	information = Ass_129_DeadNrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int Ass_129_DeadNrozas_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void Ass_129_DeadNrozas_PreHALLO_info()
{
	Snd_Play("MYSTERY_04");
	AI_StopProcessInfos(self);
};

var int NrozasTeachMakePoison;

instance DIA_Ass_128_Nrozas_TeachPoisonMake(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 10;
	condition = DIA_Ass_128_Nrozas_TeachPoisonMake_Condition;
	information = DIA_Ass_128_Nrozas_TeachPoisonMake_Info;
	permanent = FALSE;
	description = "А есть ли что-то особенное, чему я смогу научиться только у вас?";
};

func int DIA_Ass_128_Nrozas_TeachPoisonMake_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TeachPoisonMake_Info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_00");	//А есть ли что-то особенное, чему я смогу научиться только у вас?
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_01");	//Хммм...(оценивающе) Как ты, наверное, уже знаешь, мой конек - это приготовление различных ядов.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_02");	//В этом мне нет равных, ибо любой из моих ядов это настоящее произведение искусства.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_03");	//Тебе же я могу показать, как можно изготовить самые простые из них.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_04");	//Либо научить тебя покрывать им клинки или стрелы.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_05");	//Но все это потребует от тебя предельного внимания.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoisonMake_01_06");	//Поскольку любая ошибка в этом деле может запросто убить тебя.
	NrozasTeachMakePoison = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Приор Нрозас может научить меня изготавливать яды, а также показать, как покрывать ядом клинки или стрелы.");
};

instance DIA_Ass_128_Nrozas_TeachPoison(C_Info)
{
	npc = Ass_128_Nrozas;
	nr = 800;
	condition = dia_Ass_128_Nrozas_TeachPoison_condition;
	information = dia_Ass_128_Nrozas_TeachPoison_info;
	permanent = TRUE;
	description = "Научи меня обращаться с ядами.";
};

func int dia_Ass_128_Nrozas_TeachPoison_condition()
{
	if((NrozasTeachMakePoison == TRUE) && ((PoisonArrowKnow == FALSE) || (PoisonBladeKnow == FALSE) || (MakePoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TeachPoison_info()
{
	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_01_01");	//Научи меня обращаться с ядами.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_01_02");	//Что ты хочешь узнать?
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
	Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,Dialog_Back,DIA_Ass_128_Nrozas_TeachPoison_BACK);
	
	if(PoisonArrowKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Изготовление отравленных стрел (Очки обучения: 5, Цена: 2500 монет)",DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow);
	};
	if(PoisonBladeKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Покрывать лезвие оружия ядом (Очки обучения: 5, Цена: 3000 монет)",DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade);
	};
	if(MakePoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Научи меня готовить яды (Очки обучения: 3, Цена: 1500 монет)",DIA_Ass_128_Nrozas_TeachPoison_MakePoison);
	};
	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,"Научи меня сопротивлению яду (Очки обучения: 10, Цена: 3000 монет)",DIA_Ass_128_Nrozas_TeachPoison_Resist);
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
};

func void DIA_Ass_128_Nrozas_TeachPoison_Resist()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_Resist_01_00");	//Научи меня сопротивлению яду.

	kosten = 10;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_01");	//Извини, но для этого у тебя еще не хватает опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_02");	//Извини, но бесплатно я этого делать не стану!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_03");	//Яд - дело плохое. Особенно если он попал в твой организм.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_04");	//Ты должен позаботиться о том, чтобы твой организм как можно быстрее разложил яд.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_05");	//Непрерывно двигайся и больше потей! Тогда отравление ядом не причинит тебе вреда.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучено: сопротивление яду");
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_00");	//Научи меня делать отравленные стрелы.

	kosten = 5;
	money = 2500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//У тебя недостаточно опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//У тебя мало золота!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_03");	//Тебе нужен яд и несколько стрел.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_04");	//Осторожно окунаешь наконечники стрел в колбу.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_05");	//Рука не должна дрожать. Поэтому не торопись.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучен рецепт изготовления - 'Отравленные стрелы'");
		PoisonArrowKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для изготовления отравленных стрел: двадцать стрел и пузырек с ядом.");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_00");	//Научи меня покрывать оружие ядом.

	kosten = 5;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//У тебя недостаточно опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//У тебя мало золота!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_03");	//Прежде всего тебе нужны яд и оружие.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_04");	//Не погружай в яд весь клинок.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_05");	//Нанеси его тонким слоем на лезвие и его кончик.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_06");	//И смотри не порежься!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучено: изготовление отравленного оружия");
		PoisonBladeKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для изготовления отравленного оружия: клинок и пузырек с ядом.");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_MakePoison()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_00");	//Научи меня делать яды.

	kosten = 3;
	money = 1500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01");	//У тебя недостаточно опыта!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02");	//У тебя мало золота!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_03");	//По сути дела, яд - это не что иное, как обычное целебное снадобье.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_04");	//Тебе нужен рецепт и ингредиенты.
		AI_Output(self,other,"DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_05");	//Хорошенько смешиваешь все вместе. Когда смесь станет липкой - готово.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Изучен алхимический рецепт - 'Яд'");
		MakePoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для изготовления яда: бутылка воды, стебель болотной травы, мандибулы паука или жало кровяной мухи.");
	
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};