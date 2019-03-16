instance DIA_NagShor_EXIT(C_Info)
{
	npc = Orc_Clan_Boss;
	nr = 999;
	condition = DIA_NagShor_Exit_Condition;
	information = DIA_NagShor_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NagShor_Exit_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_Hello(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_Hello_Condition;
	information = DIA_NagShor_Hello_Info;
	permanent = FALSE;
	description = "Приветствую тебя, орк.";
};

func int DIA_NagShor_Hello_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Hello_Info()
{
	AI_Output(other,self,"DIA_NagShor_Hello_01_01");	//Приветствую тебя, орк.
	AI_Output(self,other,"DIA_NagShor_Hello_01_02");	//УРГ ХАР БАР... Человек?!
	AI_Output(self,other,"DIA_NagShor_Hello_01_03");	//Никогда бы не подумать, что люди по собственной воле могут пожаловать сюда.
	AI_Output(self,other,"DIA_NagShor_Hello_01_04");	//Хотя я видеть, что человек носить Улу-Мулу - знак силы орков.
	AI_Output(self,other,"DIA_NagShor_Hello_01_05");	//Выходит, он знать наши обычаи...(с уважением) Это быть хорошо для человек.
	AI_Output(self,other,"DIA_NagShor_Hello_01_06");	//Орки уважать Улу-Мулу и не трогать человек. Теперь он сам говорить, зачем прийти сюда?
	Info_ClearChoices(DIA_NagShor_Hello);
	Info_AddChoice(DIA_NagShor_Hello,"Я и сам этого не знаю.",DIA_NagShor_Hello_None);

	if((MIS_WakonTest == LOG_Running) && (UrShakTellWaterSoul == TRUE))
	{
		Info_AddChoice(DIA_NagShor_Hello,"Меня прислал шаман Ур-Шак.",DIA_NagShor_Hello_UrShak);
	};

	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == FALSE) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		Info_AddChoice(DIA_NagShor_Hello,"У меня есть для тебя послание, вождь.",DIA_NagShor_Hello_UrKarras);
	};
};

func void DIA_NagShor_Hello_UrShak()
{
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_01");	//Меня прислал шаман Ур-Шак.
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_02");	//Он сказал, что здесь я смогу получить некоторые ответы на свои вопросы.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_03");	//Тебя прислать Ур-Шак?! Хммм...(задумчиво) Однако человек сильно удивить меня этим!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_04");	//Это почему же?
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_05");	//Аргхх...(враждебно) Потому что орки никогда не любить людей!
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_06");	//Орки всегда сражаться с человек и делать его мертвый. Люди быть всегда враг орков!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_07");	//Как видишь, бывают и исключения. К тому же я когда-то спас Ур-Шаку жизнь.
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_08");	//Так что у нас нет с ним причин враждовать.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_09");	//Человек спасать жизнь орка?! (очень удивленно) Никогда о таком не слышать! Ты говорить правда?
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_10");	//Можешь сам пойти к нему и спросить, если мне не веришь.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_11");	//(вглядваясь) Хорошо. Я верить тебе, человек и думать, что так оно и быть.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_13");	//Теперь человек говорить - чего он хотеть знать?
	NagShorFirstMeet = TRUE;
	NagShorAreedAnswer = TRUE;
	NagShorTellUrShak = TRUE;
	Info_ClearChoices(DIA_NagShor_Hello);
};


func void DIA_NagShor_Hello_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_01");	//У меня есть для тебя послание, вождь.
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_02");	//Его передает тебе Ур-Каррас, один из военачальников орков клана Черного Дракона.
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_03");	//Человек сойти с ума?! (грозно) Я сомневаться, что наши братья могут доверить ему такое дело!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_04");	//Я думать, что ты меня обманывать! Поэтому говорить сейчас своим воинам убить тебя, человек!
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_05");	//Погоди, вождь! Вот, возьми этот свиток. Тут все написано.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_06");	//Аргххх... Похоже, человек говорить правду!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_07");	//Но если сам Ур-Каррас доверить тебе принести его нам, это означать, что братья орки Черного Дракона тебя очень уважать!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_08");	//Они уважать тебя - мы тоже уважать, человек. Не убивать его! Относится к нему, как к брату.
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_09");	//Я рад, что все прояснилось, вождь. Теперь, когда ты прочитал его послание - какой ответ мне передать Ур-Каррасу?
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_10");	//(задумавшись) Передай ему, что я и мои братья быть согласны на его предложение. 
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_11");	//Хорошо. Теперь мне пора.
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_12");	//Прощай, брат человек.
	NagShorFirstMeet = TRUE;
	NagShorTellUrKarras = TRUE;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я передал послание Ур-Карраса вождю клана Высокой Скалы. Теперь пора возвращаться в город орков и передать Ур-Каррасу его ответ.");
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_Hello_None()
{
	AI_Output(other,self,"DIA_NagShor_Hello_None_01_01");	//Я и сам этого не знаю.
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_02");	//Человек сам не знать, зачем прийти сюда? (смеется) Какой глупый человек!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_03");	//Человек очень сильно насмешить меня...(смеется) Никогда не видеть такой глупый человек!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_04");	//Если человеку нечего сказать - я тоже не буду с ним говорить!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_05");	//Так что человек лучше идти! Орк будет дальше смеяться...
	NagShorFirstMeet = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_HelloAgain(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_HelloAgain_Condition;
	information = DIA_NagShor_HelloAgain_Info;
	permanent = TRUE;
	description = "Мне нужно поговорить с тобой, орк!";
};

func int DIA_NagShor_HelloAgain_Condition()
{
	if(NagShorFirstMeet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_HelloAgain_Info()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_01_01");	//Мне нужно поговорить с тобой, орк.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_01_02");	//УРГ ХАР БАР! Глупый человек опять здесь?! Снова хочет смешить орк?
	AI_Output(self,other,"DIA_NagShor_HelloAgain_01_03");	//Зачем он прийти сюда?
	Info_ClearChoices(DIA_NagShor_HelloAgain);
	Info_AddChoice(DIA_NagShor_HelloAgain,"Понятия не имею.",DIA_NagShor_HelloAgain_None);

	if((MIS_WakonTest == LOG_Running) && (UrShakTellWaterSoul == TRUE) && (NagShorTellUrShak == FALSE))
	{
		Info_AddChoice(DIA_NagShor_HelloAgain,"Меня прислал шаман Ур-Шак.",DIA_NagShor_HelloAgain_UrShak);
	};

	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == FALSE) && (NagShorTellUrKarras == FALSE) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		Info_AddChoice(DIA_NagShor_HelloAgain,"У меня для тебя послание.",DIA_NagShor_HelloAgain_UrKarras);
	};
};

func void DIA_NagShor_HelloAgain_UrShak()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_01");	//Меня прислал шаман Ур-Шак.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_02");	//Он сказал, что здесь я смогу получить некоторые ответы на свои вопросы.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_03");	//Тебя прислать Ур-Шак?! Хммм...(задумчиво) Однако человек сильно удивить меня этим!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_04");	//Это почему же?
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_05");	//Аргхх...(враждебно) Потому что орки никогда не любить людей! 
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_06");	//Орки всегда сражаться с человек и делать его мертвый. Люди быть всегда враг орков!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_07");	//Как видишь, бывают и исключения. К тому же я когда-то спас Ур-Шаку жизнь, а это, как ты сам понимаешь - все-таки чего-то стоит.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_08");	//Так что у нас нет с ним причин сейчас враждовать.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_09");	//Человек спасать жизнь орка?! (очень удивленно) Никогда о таком не слышать! Ты говорить правда?
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_10");	//Можешь сам пойти к нему и спросить, если мне не веришь.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_11");	//(вглядываясь) Хорошо. Я верить тебе, человек и думать, что так оно и быть.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_13");	//Теперь человек говорить - чего он хотеть знать?
	NagShorTellUrShak = TRUE;
	NagShorAreedAnswer = TRUE;
	Info_ClearChoices(DIA_NagShor_HelloAgain);
};

func void DIA_NagShor_HelloAgain_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_01");	//У меня есть для тебя послание, вождь.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_02");	//Его передает тебе Ур-Каррас, один из военачальников орков клана Черного Дракона.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_03");	//Человек сойти с ума?!...(грозно) Я сомневаться, что наши братья могут доверить ему такое дело!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_04");	//Я думать, что ты меня обманывать! Поэтому говорить сейчас своим воинам убить тебя, человек!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_05");	//Погоди, вождь! Вот, возьми этот свиток...тут все написано.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_06");	//Аргххх... Похоже, человек говорить правду!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_07");	//Но если сам Ур-Каррас доверить тебе принести его нам это означть, что братья орки Черного Дракона тебя очень уважать!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_08");	//Они уважать тебя - мы тоже уважать, человек. Не убивать его! Относится к нему, как к брату!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_09");	//Я рад, что все прояснилось, вождь. Теперь, когда ты прочитал его послание - какой ответ мне передать Ур-Каррасу?
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_10");	//Хммм...(задумавшись) Передай ему, что я и мои братья быть согласны на его предложение. 
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_11");	//Хорошо. Теперь мне пора.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_12");	//Прощай, брат человек.
	NagShorTellUrKarras = TRUE;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я передал послание Ур-Карраса вождю клана Высокой Скалы. Теперь пора возращаться в город орков и передать Ур-Каррасу его ответ.");
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_HelloAgain_None()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_None_01_01");	//Понятия не имею.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_None_01_02");	//Ха ха ха! Человек опять очень сильно насмешить меня...(смеется) Какой глупый человек!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_None_01_03");	//Теперь ему лучше идти! Орк будет дальше смеяться...
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_WhoYou(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WhoYou_Condition;
	information = DIA_NagShor_WhoYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_NagShor_WhoYou_Condition()
{
	if(NagShorAreedAnswer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_WhoYou_Info()
{
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_01");	//Кто ты?
	AI_Output(self,other,"DIA_NagShor_WhoYou_01_02");	//Звать Наг-Шор. Быть вождь клана Высокой Скалы - быть самый сильный воин клана.
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_03");	//Значит, именно ты здесь самый главный?
	AI_Output(self,other,"DIA_NagShor_WhoYou_01_04");	//Думать, что человек говорить правильно. Быть здесь главный!
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_05");	//Все ясно.
};

instance DIA_NagShor_WaterSoul(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WaterSoul_Condition;
	information = DIA_NagShor_WaterSoul_Info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о Духе Воды?";
};

func int DIA_NagShor_WaterSoul_Condition()
{
	if((MIS_WakonTest == LOG_Running) && (NagShorAreedAnswer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NagShor_WaterSoul_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_01");	//Ты что-нибудь знаешь о древнем создании, именуемом Дух Воды?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_02");	//Дух Воды?! (задумчиво) Наг Шор думать, что ничего не знать о том, о чем спрашивать человек.
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_03");	//Только шаман говорить с духами и заклинать их! Наг Шор не быть шаман.
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_04");	//Наг Шор быть только воин - только сражаться с врагом и убивать их! Больше ничего не делать.
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_05");	//Ну да, иначе и быть не могло. А кто из шаманов может знать об этом?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_06");	//Хммм... Наг Шор думать, что, возможно, Ур-Дах может помочь человек. Он должен знать больше!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_07");	//Ур-Дах? А кто это?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_08");	//Быть главным шаманом клана Высокой Скалы - говорить с духами и заклинать их магия. Быть очень старый и мудрый!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_09");	//Ну раз так, тогда придется с ним поговорить. Скажи, где мне найти его в вашем лагере?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_10");	//Ур-Даха сейчас нет в лагерь! Он уйти отсюда, чтобы помогать братьям сражаться против человек.
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_11");	//Тогда, может быть, подскажешь, куда бы он мог отправиться?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_12");	//Наг Шор думать, что человек должен идти туда, где орки хоронят своих братьев - место очень далеко отсюда. 
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_14");	//Ты говоришь о кладбище орков?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_15");	//Наг Шор полагать, что человек быть прав - быть то самое место. Искать рядом!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_16");	//Ладно, спасибо - все понял.
	NagShorTellMe = TRUE;
	B_LogEntry(TOPIC_WakonTest,"Наг Шор, вождь клана Высокой Скалы, ничего не знает о загадочном Духе Воды. Он сказал, что Ур-Дах - верховный шаман его племени, сможет помочь мне в этом деле. По словам Наг Шора, тот сейчас находится на кладбище орков.");
};

instance DIA_NagShor_UrShak(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_UrShak_Condition;
	information = DIA_NagShor_UrShak_Info;
	permanent = FALSE;
	description = "Откуда ты знаешь шамана Ур-Шака?";
};

func int DIA_NagShor_UrShak_Condition()
{
	if(NagShorAreedAnswer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_UrShak_Info()
{
	AI_Output(other,self,"DIA_NagShor_UrShak_01_01");	//Откуда ты знаешь шамана Ур-Шака?
	AI_Output(self,other,"DIA_NagShor_UrShak_01_02");	//Много зим назад быть воин - сражаться со своим врагом! Враг жить в клане Огня.
	AI_Output(self,other,"DIA_NagShor_UrShak_01_03");	//Ур-Шак тоже жить в клане Огня и быть мой враг.
	AI_Output(self,other,"DIA_NagShor_UrShak_01_04");	//Я и Ур-Шак когда-то сражаться между собой и хотеть убивать друг друга.
	AI_Output(other,self,"DIA_NagShor_UrShak_01_05");	//Так значит, Ур-Шак твой враг?
	AI_Output(self,other,"DIA_NagShor_UrShak_01_06");	//Быть когда-то мой враг, но сейчас уже нет! 
	AI_Output(self,other,"DIA_NagShor_UrShak_01_07");	//Сейчас мы больше не быть враг - клан Огня больше нет. Враг умереть!
	AI_Output(self,other,"DIA_NagShor_UrShak_01_08");	//Но я помнить Ур-Шак и очень уважать! Быть сначала великий воин, потом стать великий шаман - сыном духа.
	AI_Output(other,self,"DIA_NagShor_UrShak_01_09");	//Понятно.
};