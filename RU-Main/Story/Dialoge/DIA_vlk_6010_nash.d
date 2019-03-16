
instance DIA_NASH_EXIT(C_Info)
{
	npc = vlk_6010_nash;
	nr = 999;
	condition = dia_nash_exit_condition;
	information = dia_nash_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nash_exit_condition()
{
	return TRUE;
};

func void dia_nash_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NASH_HELLO(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_condition;
	information = dia_nash_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Эй парень, как дела?";
};


func int dia_nash_hello_condition()
{
	if(MEETNASH == FALSE)
	{
		return TRUE;
	};
};

func void dia_nash_hello_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_01");	//Эй, парень, как дела?
	AI_Output(self,other,"DIA_Nash_Hello_01_02");	//Нормально, приятель. Ты же тот новичок, который недавно появился в лагере?
	AI_Output(other,self,"DIA_Nash_Hello_01_03");	//Да, это я. И что с того?
	AI_Output(self,other,"DIA_Nash_Hello_01_04");	//Если хочешь знать мое мнение, то, по-моему ты просто сумасшедший! У тебя точно крыша поехала!
	AI_Output(self,other,"DIA_Nash_Hello_01_05");	//Ты хоть представляешь, куда ты попал? На твоем месте я бы уже давно свалил из этого местечка куда подальше.
	AI_Output(other,self,"DIA_Nash_Hello_01_06");	//Но ты не на моем месте...
	AI_Output(self,other,"DIA_Nash_Hello_01_07");	//Да ладно, не обижайся. Просто я и подумать не мог, что кто-то вот так отважиться прийти сюда, да еще и по собственному желанию.
	AI_Output(self,other,"DIA_Nash_Hello_01_08");	//Ты наверно очень храбрый парень...
	AI_Output(other,self,"DIA_Nash_Hello_01_09");	//А ты нет?
	AI_Output(self,other,"DIA_Nash_Hello_01_10");	//Я? Нет, приятель. По мне лучше сидеть здесь, в пещере. Подальше от всяких там неприятностей!
	AI_Output(other,self,"DIA_Nash_Hello_01_11");	//И ты весь день торчишь в этой пещере?
	AI_Output(self,other,"DIA_Nash_Hello_01_12");	//Да. И не могу сказать, что мне это не нравится.
	AI_Output(other,self,"DIA_Nash_Hello_01_13");	//А чем тогда ты вообще тут занимаешься?
	AI_Output(self,other,"DIA_Nash_Hello_01_14");	//Я помогаю Хасану охранять склад, когда он отдыхает. Все равно из меня охотник никудышный.
	AI_Output(self,other,"DIA_Nash_Hello_01_15");	//Не то, что Багрус, например, или Гунмар! Эти парни знают свое дело.
	AI_Output(self,other,"DIA_Nash_Hello_01_16");	//Ну, и кроме того, кто-то же должен следить за тем, что бы парни не умирали с голоду, когда возвращаются с охоты.
	AI_Output(other,self,"DIA_Nash_Hello_01_17");	//Ты что - повар?
	AI_Output(self,other,"DIA_Nash_Hello_01_18");	//Ну, типа того. Особенно у меня хорошо получается мясной суп с добавкой сушеных корнеплодов. Просто пальчики оближешь!
	AI_Output(self,other,"DIA_Nash_Hello_01_19");	//Могу даже поспорить, что вряд ли кто-то вообще сумеет приготовить нечто подобное, как мой суп.
	AI_Output(self,other,"DIA_Nash_Hello_01_20");	//Хочешь попробовать?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello,"С удовольствием.",dia_nash_hello_yes);
	Info_AddChoice(dia_nash_hello,"Нет, спасибо.",dia_nash_hello_no);
};

func void dia_nash_hello_yes()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_21");	//С удовольствием...
	AI_Output(self,other,"DIA_Nash_Hello_01_22");	//Держи.
	CreateInvItems(other,itfo_nashsoup,1);
	B_UseItem(other,itfo_nashsoup);
	AI_Output(self,other,"DIA_Nash_Hello_01_23");	//Ну и как?
	Info_ClearChoices(dia_nash_hello);
	Info_AddChoice(dia_nash_hello,"Знатный супец!",dia_nash_hello_ok);
	Info_AddChoice(dia_nash_hello,"Да как-то не очень.",dia_nash_hello_not);
};

func void dia_nash_hello_no()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_24");	//Нет, спасибо.
	AI_Output(self,other,"DIA_Nash_Hello_01_25");	//Ну, дело твое, конечно. Хотя зря ты отказался...
	MEETNASH = TRUE;
};

func void dia_nash_hello_ok()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_26");	//Знатный супец!
	AI_Output(self,other,"DIA_Nash_Hello_01_27");	//Я так и знал, что тебе он понравится. Еще никто нос не воротил!
	AI_Output(other,self,"DIA_Nash_Hello_01_28");	//Правда, вкус у твоего супа какой-то странный.
	AI_Output(self,other,"DIA_Nash_Hello_01_29");	//По первому разу да, есть немного. Но потом привыкаешь и уже глядишь - а тебя от тарелки и за уши не оттащишь! (смеется)
	AI_Output(other,self,"DIA_Nash_Hello_01_30");	//А чье мясо было в супе?
	AI_Output(self,other,"DIA_Nash_Hello_01_31");	//Если честно, тебе лучше не знать...
	AI_StopProcessInfos(self);
	NASH_STEW_DAY = Wld_GetDay();
	MEETNASH = TRUE;
	NASHREADYTEACH = TRUE;
};

func void dia_nash_hello_not()
{
	AI_Output(other,self,"DIA_Nash_Hello_01_33");	//Да как-то не очень.
	AI_Output(self,other,"DIA_Nash_Hello_01_34");	//Странно. У ребят в лагере он просто на ура идет. Еще и добавки просят!
	AI_Output(other,self,"DIA_Nash_Hello_01_35");	//Ну, значит, я буду первым, кто ее не станет просить.
	AI_Output(self,other,"DIA_Nash_Hello_01_36");	//Жаль, что тебе он не понравился. Но как говорится, на вкус и цвет...
	AI_StopProcessInfos(self);
	MEETNASH = TRUE;
};


instance DIA_NASH_HELLO_VALLEY(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_valley_condition;
	information = dia_nash_hello_valley_info;
	permanent = TRUE;
	important = FALSE;
	description = "Можешь рассказать что-нибудь о долине?";
};


func int dia_nash_hello_valley_condition()
{
	if((MEETNASH == TRUE) && (ASKNASHVALLEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_valley_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_Valley_01_01");	//Можешь рассказать что-нибудь о долине?
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_02");	//Навряд ли, приятель. Тебе лучше поговорить об этом с Эльваисом или с другими парнями.
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_03");	//Они лучше, чем я знают местность в округе.
	AI_Output(other,self,"DIA_Nash_Hello_Valley_01_04");	//Ну, может, они тебе что-нибудь рассказывали?
	AI_Output(self,other,"DIA_Nash_Hello_Valley_01_05");	//Хмм... дай подумать...
	if(NASHREADYTEACH == TRUE)
	{
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_06");	//Помнится, Каррок, один из охотников когда-то мне рассказывал, как наткнулся на какой-то странный подземный... то ли склеп, то ли храм...
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_07");	//Я уже не помню... Он говорил, что это находится где-то к востоку от нашего лагеря... так давно это было.
		AI_Output(other,self,"DIA_Nash_Hello_Valley_01_08");	//А где сейчас сам Каррок?
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_09");	//К сожалению, однажды он пошел на охоту и так с нее и не вернулся.
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_10");	//Он все твердил, что хочет еще раз попробовать проникнуть в тот подземный храм.
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_11");	//Возможно, именно там он и нашел свою судьбу...
		B_LogEntry(TOPIC_URNAZULRAGE,"В лагере, я повстречал парня по имени Нэш. Он рассказал, что один охотник из лагеря по имени Каррок, в свое время нашел вход в подземный храм, где-то на востоке долины. К сожалению, самого Каррока я не смогу об этом спросить, поскольку с тех пор его никто не видел. Судя по всему, он погиб, пытаясь пробраться в сам храм.");
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Hello_Valley_01_12");	//Нет... ничего такого не припоминаю... Извини, парень.
		AI_Output(other,self,"DIA_Nash_Hello_Valley_01_13");	//Ну, на нет и суда нет.
	};
	ASKNASHVALLEY = TRUE;
};


instance DIA_NASH_HELLO_SOUPAGAIN(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = dia_nash_hello_soupagain_condition;
	information = dia_nash_hello_soupagain_info;
	permanent = TRUE;
	important = FALSE;
	description = "Дай мне еще твоего супчика.";
};


func int dia_nash_hello_soupagain_condition()
{
	if((MEETNASH == TRUE) && (NASHREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_nash_hello_soupagain_info()
{
	AI_Output(other,self,"DIA_Nash_Hello_SoupAgain_01_01");	//Дай мне еще твоего супчика.
	if(NASH_STEW_DAY != Wld_GetDay())
	{
		B_GiveInvItems(self,other,itfo_nashsoup,1);
		AI_Output(self,other,"DIA_Nash_Hello_SoupAgain_01_02");	//Вот, возьми...
		NASH_STEW_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Hello_SoupAgain_01_03");	//Ты сегодня уже получил свою порцию! Приходи завтра.
	};
};

instance DIA_Nash_Shield(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_Shield_condition;
	information = DIA_Nash_Shield_info;
	permanent = FALSE;
	description = "Я смотрю, ты носишь щит.";
};

func int DIA_Nash_Shield_condition()
{
	if((MEETNASH == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_info()
{
	AI_Output(other,self,"DIA_Nash_Shield_01_01");	//Я смотрю, ты носишь щит.
	AI_Output(self,other,"DIA_Nash_Shield_01_02");	//А тебя это удивляет? В таком месте, как это надежный щит может спасти тебе жизнь!
	AI_Output(self,other,"DIA_Nash_Shield_01_04");	//Если, конечно, ты знаешь, как с ним обращаться.
	AI_Output(other,self,"DIA_Nash_Shield_01_05");	//А меня ты можешь обучить сражаться с ним?
	AI_Output(self,other,"DIA_Nash_Shield_01_06");	//Конечно, могу! Но для этого ты должен хотя бы немного разбираться в этом деле.
	AI_Output(self,other,"DIA_Nash_Shield_01_07");	//Для зеленого новичка мои уроки будут абсолютно бесполезны.
	AI_Output(self,other,"DIA_Nash_Shield_01_08");	//Кроме того, тебе придется заплатить за них.
	AI_Output(self,other,"DIA_Nash_Shield_01_09");	//Но не золотом, как ты мог подумать! Для нас его звон здесь мало что значит.
	AI_Output(other,self,"DIA_Nash_Shield_01_10");	//А чего же ты хочешь?
	AI_Output(self,other,"DIA_Nash_Shield_01_11");	//Еды, конечно! С ней у нас тут очень большие проблемы.
	AI_Output(self,other,"DIA_Nash_Shield_01_12");	//Поэтому за то, чтобы я тебя тренировал, ты принесешь мне пятьдесят кусков свежего мяса.
	AI_Output(other,self,"DIA_Nash_Shield_01_13");	//Ладно, я подумаю над твоим предложением.
	MIS_MeetNashShield = LOG_Running;
	Log_CreateTopic(TOPIC_MeetNashShield,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_Running);
	B_LogEntry(TOPIC_MeetNashShield,"Нэш может научить меня обращению с щитом. Однако за это он попросил принести ему полсотни кусков мяса.");
};

instance DIA_Nash_ShieldDone(C_Info)
{
	npc = vlk_6010_nash;
	nr = 1;
	condition = DIA_Nash_ShieldDone_condition;
	information = DIA_Nash_ShieldDone_info;
	permanent = FALSE;
	description = "Вот твое мясо.";
};

func int DIA_Nash_ShieldDone_condition()
{
	if((MIS_MeetNashShield == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 50))
	{
		return TRUE;
	};
};

func void DIA_Nash_ShieldDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Nash_ShieldDone_01_01");	//Вот твое мясо.
	B_GiveInvItems(other,self,ItFoMuttonRaw,50);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,50);
	AI_Output(other,self,"DIA_Nash_ShieldDone_01_02");	//Теперь ты научишь меня своим приемам?
	AI_Output(self,other,"DIA_Nash_ShieldDone_01_03");	//(довольно) Конечно. Главное, чтобы у тебя хватило опыта для моих уроков.
	AI_Output(self,other,"DIA_Nash_ShieldDone_01_04");	//Просто скажи, когда будешь готов начать тренировку.
	MIS_MeetNashShield = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MeetNashShield,LOG_SUCCESS);
	B_LogEntry(TOPIC_MeetNashShield,"Я принес Нэшу полсотни кусков мяса. Теперь он покажет мне свои приемы владения щитом.");
};

instance DIA_Nash_Shield_Teach(C_Info)
{
	npc = vlk_6010_nash;
	nr = 7;
	condition = DIA_Nash_Shield_Teach_Condition;
	information = DIA_Nash_Shield_Teach_Info;
	permanent = TRUE;
	description = "Научи меня лучше обращаться с щитом.";
};

func int DIA_Nash_Shield_Teach_Condition()
{
	if((MIS_MeetNashShield == LOG_SUCCESS) && ((hero.attribute[ATR_REGENERATEMANA] <= 100) || (SkillBlockShield == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Nash_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Nash_Shield_Teach_15_00");	//Научи меня лучше обращаться с щитом.
	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_Back()
{
	Info_ClearChoices(DIA_Nash_Shield_Teach);
};

func void DIA_Nash_Shield_Teach_Block()
{
	AI_Output(other,self,"DIA_Nash_Shield_Teach_Block_01_00");	//Научи меня блокировать магический урон щитом.

	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_01");	//Тут все зависит от твоего навыка владения и прочности самого щита.
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_02");	//Весь магический урон у тебя вряд ли получится заблокировать, однако ты можешь его ослабить.
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_03");	//Если твой щит способен будет выдержать магическую атаку, он поглотит часть урона. 
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_04");	//Ну, а если нет...
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_05");	//Вот поэтому для начала постарайся раздобыть приличный щит! Остальное приложится само.
		AI_Print("Бой с щитом - обучен!");
		Snd_Play("LevelUP");
		SkillBlockShield = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Nash_Shield_Teach_Block_01_06");	//У тебя не хватает опыта!
	};

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_1()
{
	B_TeachShieldNoMoney(self,other,1,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};

func void DIA_Nash_Shield_Teach_5()
{
	B_TeachShieldNoMoney(self,other,5,100);

	Info_ClearChoices(DIA_Nash_Shield_Teach);
	Info_AddChoice(DIA_Nash_Shield_Teach,Dialog_Back,DIA_Nash_Shield_Teach_Back);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney1,DIA_Nash_Shield_Teach_1);
	Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldNoMoney5,DIA_Nash_Shield_Teach_5);

	if(SkillBlockShield == FALSE)
	{
		Info_AddChoice(DIA_Nash_Shield_Teach,PRINT_ShieldBlock,DIA_Nash_Shield_Teach_Block);
	};
};