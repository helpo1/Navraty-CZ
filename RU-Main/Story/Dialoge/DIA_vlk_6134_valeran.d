
instance DIA_VLK_6134_VALERAN_EXIT(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 999;
	condition = dia_vlk_6134_valeran_exit_condition;
	information = dia_vlk_6134_valeran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6134_valeran_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6134_valeran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6134_VALERAN_HALLO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hallo_condition;
	information = dia_vlk_6134_valeran_hallo_info;
	permanent = FALSE;
	description = "Привет. Ты кто?";
};


func int dia_vlk_6134_valeran_hallo_condition()
{
	if((Fernando_ImKnast == FALSE) && !Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_00");	//Привет. Ты кто?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_01");	//Приветствую тебя, незнакомец. Меня зовут Валеран.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_02");	//А чем ты занимаешься?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_03");	//Я работаю управляющим у торговца Фернандо. Помогаю ему вести дела.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_04");	//Это очень трудная и ответственная работа, поэтому Фернандо и нанял меня.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_05");	//И как тебе твоя работа?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_06");	//Жаловаться мне не на что - здесь платят хорошие деньги, если ты это имел в виду.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_07");	//Да и сам Фернандо неплохо ко мне относится.
};


instance DIA_VLK_6134_VALERAN_HALLOAFTER(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_halloafter_condition;
	information = dia_vlk_6134_valeran_halloafter_info;
	permanent = FALSE;
	description = "Привет. Ты кто?";
};


func int dia_vlk_6134_valeran_halloafter_condition()
{
	if((Fernando_ImKnast == TRUE) && !Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_halloafter_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_00");	//Привет. Ты кто?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_01");	//Приветствую тебя, незнакомец. Меня зовут Валеран.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_02");	//Твое лицо мне кажется знакомым. Я тебя нигде раньше не встречал?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_03");	//Ну, возможно, мы встречались в верхнем квартале Хориниса.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_04");	//Я работал там управляющим у торговца по имени Фернандо.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_05");	//Да, я знаю Фернандо. Кажется, у него в последнее время возникли некоторые проблемы с законом.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_06");	//Да, недавно его арестовало городское ополчение за то, что он продавал оружие бандитам.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_07");	//Никогда бы не подумал, что он на такое пойдет. Меня это крайне удивило.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_08");	//А что стало с тобой?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_09");	//Что касается меня, то из-за всего этого я остался без работы.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_10");	//Теперь вот сижу тут и жду... Сам не знаю чего.
	CanHireValeran = TRUE;
};


instance DIA_VLK_6134_VALERAN_CANTRADENO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantradeno_condition;
	information = dia_vlk_6134_valeran_cantradeno_info;
	permanent = FALSE;
	description = "Ты что-нибудь продаешь?";
};


func int dia_vlk_6134_valeran_cantradeno_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter) && (Fernando_ImKnast == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantradeno_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_CanTradeNo_01_00");	//Ты что-нибудь продаешь?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_CanTradeNo_01_01");	//Нет, уже нет.
	VALERANCANTRADE = TRUE;
};


instance DIA_VLK_6134_VALERAN_CANTRADE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantrade_condition;
	information = dia_vlk_6134_valeran_cantrade_info;
	permanent = FALSE;
	description = "Ты что-нибудь продаешь?";
};


func int dia_vlk_6134_valeran_cantrade_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantrade_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_CanTrade_01_00");	//Ты что-нибудь продаешь?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_CanTrade_01_01");	//У меня ты можешь купить все, что тебе нужно, и по хорошей цене!
	VALERANCANTRADE = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Валеран продает различные товары в верхнем квартале города.");
};


instance DIA_VLK_6134_VALERAN_WAREZ(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 700;
	condition = dia_vlk_6134_valeran_warez_condition;
	information = dia_vlk_6134_valeran_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне, что у тебя есть.";
};


func int dia_vlk_6134_valeran_warez_condition()
{
	if(((VALERANHIRED == TRUE) && (VALERANCANTRADE == TRUE)) || ((Fernando_ImKnast == FALSE) && (VALERANCANTRADE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_VLK_6134_Valeran_Warez_01_00");	//Покажи мне, что у тебя есть.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Warez_01_01");	//Выбирай.
	B_GiveTradeInv(self);
};


instance DIA_VLK_6134_VALERAN_WHATYOUDO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_whatyoudo_condition;
	information = dia_vlk_6134_valeran_whatyoudo_info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int dia_vlk_6134_valeran_whatyoudo_condition()
{
	if((Fernando_ImKnast == TRUE) && Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_whatyoudo_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_01");	//А что, разве не видно? Жду, когда кто-нибудь подкинет мне работу.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_02");	//Теперь, когда Фернандо арестовали, я остался совсем без дела.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_04");	//А почему ты не попробовал устроиться в городе?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_05");	//Да кто меня возьмет к себе на работу? Эти грязные делишки Фернандо сказались и на моей репутации.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_07");	//А в нашем деле это очень важный момент.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_08");	//Понятно. И как успехи?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_09");	//Как видишь, похвастаться особо нечем.
	CanHireValeran = TRUE;
};


instance DIA_VLK_6134_VALERAN_PERM(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_perm_condition;
	information = dia_vlk_6134_valeran_perm_info;
	permanent = TRUE;
	description = "Чем-нибудь порадуешь?";
};


func int dia_vlk_6134_valeran_perm_condition()
{
	if((FINDPERSONTHREE == FALSE) && (VALERANRECRUITEDDT == FALSE) && (Fernando_ImKnast == TRUE) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo) || Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_perm_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Perm_01_00");	//Чем-нибудь порадуешь?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Perm_01_01");	//Боюсь, радовать нечему - я все так же без дела. Просиживаю тут свои штаны целыми днями, а толку нет.
};


instance DIA_VLK_6134_VALERAN_HIRE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hire_condition;
	information = dia_vlk_6134_valeran_hire_info;
	permanent = FALSE;
	description = "Я нашел тебе работу.";
};


func int dia_vlk_6134_valeran_hire_condition()
{
	if((MIS_TRADEHELPER == LOG_Running) && (Fernando_ImKnast == TRUE) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo) || Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_00");	//Я нашел тебе работу.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_01");	//(с интересом) Правда? И в чем она заключается?
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_03");	//Один крупный торговец из верхнего квартала города ищет человека на место своего помощника.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_04");	//А работа заключается в том, чтобы выполнять его поручения и помогать ему вести торговые дела.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_05");	//Кто этот торговец?
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_06");	//Его зовут Лютеро. Тебе знакомо это имя?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_07");	//Лютеро? Конечно...(смеется) Кто же его не знает.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_08");	//Но постой... у него же был помощник.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_09");	//Его звали Бенчел, если не ошибаюсь.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_10");	//Ты прав. Но он больше не работает на Лютеро.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_16");	//Лютеро однажды предлагал работать на него, но я тогда отказался. Идиот!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_17");	//Правда, кто мог тогда предположить, что Фернандо был не чист на руку.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_19");	//А сейчас ты приходишь сюда и предлагаешь мне работать на Лютеро!
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_20");	//Так ты согласен?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_21");	//Конечно согласен! Или, по-твоему, у меня есть выбор?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_22");	//К тому же я хорошо знаю Лютеро - это честный торговец, и работать у него - большая честь.
	B_LogEntry(TOPIC_TRADEHELPER,"Я поговорил с Валераном, бывшим управляющим торговца Фернандо, и он согласился работать у Лютеро. Похоже, лучшей кандидатуры на место помощника мне просто не найти.");
	VALERANAGREE = TRUE;
};


instance DIA_VLK_6134_VALERAN_HIREOK(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hireok_condition;
	information = dia_vlk_6134_valeran_hireok_info;
	permanent = FALSE;
	description = "Идем к Лютеро.";
};


func int dia_vlk_6134_valeran_hireok_condition()
{
	if((VALERANAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HireOk_01_00");	//Идем к Лютеро.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HireOk_01_01");	//Думаю, именно ты тот человек, который ему нужен.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HireOk_01_02");	//Как скажешь. Пошли.
	B_LogEntry(TOPIC_TRADEHELPER,"Я остановил свой выбор на Валеране. Думаю, Лютеро должна понравиться его кандидатура.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONTHREE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6134_VALERAN_THANKS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_thanks_condition;
	information = dia_vlk_6134_valeran_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6134_valeran_thanks_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_thanks_info()
{
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_00");	//Спасибо, что помог мне!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_01");	//Я снова при деле, и это только благодаря тебе. Теперь я твой должник!
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Thanks_01_02");	//Это было не так уж и сложно.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_05");	//Я хочу поблагодарить тебя. Вот, возьми эту вещицу.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_06");	//Ты вряд ли сможешь найти ее у других торговцев. Это большая редкость.
	B_GiveInvItems(self,other,itwr_kampfkunst,1);
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_07");	//И наверняка она будет тебе полезна.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_10");	//Кстати, теперь я снова могу продавать тебе различные товары.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_11");	//Если тебе что-нибудь понадобится, можешь смело обращаться ко мне.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Thanks_01_12");	//Хорошо, я учту это.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_13");	//Тогда увидимся. Пока!
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6134_VALERAN_NEWLIFE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_newlife_condition;
	information = dia_vlk_6134_valeran_newlife_info;
	permanent = TRUE;
	description = "Как тебе новая работа?";
};


func int dia_vlk_6134_valeran_newlife_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_newlife_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_NewLife_01_00");	//Как тебе новая работа?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_NewLife_01_01");	//Все просто замечательно! Спасибо, что спросил.
};


instance DIA_VLK_6134_VALERAN_PICKPOCKET(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 900;
	condition = dia_vlk_6134_valeran_pickpocket_condition;
	information = dia_vlk_6134_valeran_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6134_valeran_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_vlk_6134_valeran_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket,Dialog_Back,dia_vlk_6134_valeran_pickpocket_back);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6134_valeran_pickpocket_doit);
};

func void dia_vlk_6134_valeran_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

func void dia_vlk_6134_valeran_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

instance DIA_VLK_6134_VALERAN_RECRFAIL(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrfail_condition;
	information = dia_vlk_6134_valeran_recrfail_info;
	permanent = FALSE;
	description = "Как у тебя дела?";
};

func int dia_vlk_6134_valeran_recrfail_condition()
{
	if((VALERANHIRED == TRUE) && (EROLRECRUITEDDT == FALSE) && (MIS_PPL_FOR_TOWER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrfail_info()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_01");	//Просто отлично! Я очень благодарен тебе за то, что ты нашел мне работу.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_02");	//Тогда, боюсь, глупо будет тебя спрашивать о том, не хочешь ли ты ее сменить.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_03");	//Сменить? О, нет. Только не теперь, когда я снова при делах.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_04");	//Платит Лютеро хорошо, работать у него интересно, да и если я буду просто так менять работодателей, меня быстро перестанут уважать.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_05");	//Так что с каким бы предложением ты ко мне ни пришел, - извини, но я буду вынужден его отклонить.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_06");	//Хорошо. В таком случае удачи тебе.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_07");	//Спасибо! За все, что ты для меня сделал.
};

//--------------------CEO----------------------------------------------

instance DIA_VLK_6134_VALERAN_RECRDT(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrdt_condition;
	information = dia_vlk_6134_valeran_recrdt_info;
	permanent = FALSE;
	description = "Как у тебя дела с работой?";
};

func int dia_vlk_6134_valeran_recrdt_condition()
{
	if((CanHireValeran == TRUE) && (PasswordSet == TRUE) && (VALERANHIRED == FALSE) && (EROLRECRUITEDDT == FALSE) && (MIS_PPL_FOR_TOWER == LOG_Running) && ((Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo) == TRUE) || (Npc_KnowsInfo(hero,DIA_VLK_6134_VALERAN_HALLOAFTER) == TRUE)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrdt_info()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_00");	//Как у тебя дела с работой? Все еще не нашел?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_01");	//Нет. Похоже, в моих услугах никто не нуждается. Я уже думаю податься в крестьяне на какую-нибудь ферму.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_02");	//И зачем я только потратил несколько лет на изучение торговли и финансов?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_03");	//Я же был лучшим! Но рынок труда переполнен и вот: уже которую неделю сижу без работы, а в кармане лишь пара монет осталась.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_04");	//А что ты скажешь, если я предложу тебе работу?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_05");	//(Оживленно) Работу? Где? Ты не шутишь?
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_06");	//Ни чуточки. Мне для моего нового жилья нужен управляющий, который бы вел хозяйство в мое отсутствие.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_07");	//Это старая башня рядом с фермой Онара, в которой я хочу организовать небольшой лагерь. Жилье и еда за мой счет.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_08");	//О, Иннос, я, должно быть, сплю! Поверь, ты нигде не найдешь человека, умеющего заниматься денежными вопросами лучше меня!
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_09");	//Я согласен. Когда мне приступать?
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_10");	//Можешь отправляться хоть прямо сейчас. И да, какая оплата тебя интересует?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_11");	//(Задумчиво) Фернандо платил мне по восемьдесят золотых в день, но для тебя я готов работать за пятьдесят!
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Пятьдесят золотых монет? Звучит разумно. Ты принят.",dia_vlk_6134_valeran_recrdt_yes);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Боюсь, это слишком много.",dia_vlk_6134_valeran_recrdt_no);
	};
};

func void dia_vlk_6134_valeran_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_yes_15_00");	//Ты принят. Увидимся в башне. Если у тебя на входе спросят пароль, им будут 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_yes_01_01");	//Поверь, ты не пожалеешь о своем решении!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Валеран согласился работать моим управляющим.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VALERANRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_15_00");	//Боюсь, это слишком много.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_no_01_01");	//(В отчаянии) Погоди! А тридцать пять золотых? Я готов работать за тридцать пять!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Хорошо, ты принят. ",dia_vlk_6134_valeran_recrdt_no_yes);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Слишком много. Боюсь, я не могу позволить себе твои услуги.",dia_vlk_6134_valeran_recrdt_no_no);
};

func void dia_vlk_6134_valeran_recrdt_no_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_yes_15_00");	//Хорошо, ты принят. Увидимся в башне. Если у тебя на входе спросят пароль, им будут 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_no_yes_01_01");	//Спасибо. Я немедленно отправлюсь в путь!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Валеран согласился работать моим управляющим.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VALERANRECRUITEDDT = TRUE;
	VALERANBONUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no_no()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_no_15_00");	//Слишком много. Боюсь, я не могу позволить себе твои услуги.
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
};

instance DIA_VALERAN_FIRSTCEO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_condition;
	information = dia_valeran_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valeran_firstceo_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_info()
{
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_00");	//Хорошая у тебя башня!
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_01");	//Здесь, конечно, грязновато, но у этого места отличный потенциал.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_02");	//Ты упоминал, что хочешь устроить здесь что-то вроде лагеря. Я правильно помню?
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_03");	//Да. Лорд Хаген хочет, чтобы я навел порядок в данной области, именно на этих условиях мне была передана башня.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_04");	//На тех же условиях в договорился с Онаром, чтобы он не препятствовал моему проживанию здесь.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_05");	//Но так как в одиночку поддерживать эту башню и защищать ее я не могу, мне нужны будут люди. С первыми двумя ты, думаю, уже познакомился.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_06");	//Мне нравятся твои планы. Будет интересно поработать над оживлением этого места.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_07");	//Итак, в таком случае, прежде всего тебе необходимо оставить мне некоторую сумму денег, из которой я мог бы осуществлять необходимые выплаты.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_08");	//Сколько?
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_09");	//Думаю, пяти тысяч золотых будет достаточно.
	CEONEEDSFIRSTMONEY = TRUE;
};


instance DIA_VALERAN_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_moneylate_condition;
	information = dia_valeran_firstceo_moneylate_info;
	permanent = FALSE;
	description = "Вот пять тысяч золотых монет.";
};


func int dia_valeran_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Valeran_FirstCEO_MoneyLate_15_00");	//Вот пять тысяч золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_01");	//Отлично! Тогда с деньгами мы временно разобрались, и я немедленно могу начать вести дела.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_02");	//Однако, кроме этого мне и остальным людям необходимо чем-то питаться.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_03");	//Думаю, для начала тебе нужно оставить нам хотя бы пятьдесят кусков жареного мяса, двадцать пять рыб и десять батонов хлеба.
	CEONEEDSFIRSTFOOD = TRUE;
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Для проживающих у меня людей нужны начальные запасы еды, а точнее - пятьдесят кусков жареного мяса, двадцать пять рыб и десять батонов хлеба.");
};

instance DIA_VALERAN_FIRSTCEO_FOODLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_foodlate_condition;
	information = dia_valeran_firstceo_foodlate_info;
	permanent = FALSE;
	description = "Вот вся необходимая еда.";
};

func int dia_valeran_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_00");	//Вот вся необходимая еда.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_01");	//Превосходно! Теперь у меня имеется достаточно денег и запасов еды, чтобы я мог вести хозяйство, не испытывая затруднений.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_02");	//Но этого хватит лишь на время. Ты же не хочешь, чтобы содержание этой башни разорило тебя?
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_03");	//Разумеется, нет. Что мне необходимо сделать, чтобы этого избежать?
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_04");	//Найди людей, которые согласятся работать на тебя.  	
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_05");	//К примеру, найди охотников, которые будут предоставлять мясо для наших запасов.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_06");	//Также здесь рядом есть шахта, возможно, в ней еще осталась руда. Не помешало бы это проверить.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_07");	//Одним словом, думай. Ты путешествуешь больше, чем я, и тебе проще найти людей, готовых присоединиться к тебе.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_08");	//Хорошо... Думаю, у меня есть несколько человек на примете.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_09");	//Удачи в поисках. И да, помни, что организация поставок еды и денежных средств на тебе, и что большинство людей питается три раза в день.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_10");	//Я не могу этим заниматься, поскольку это требует длительного отлучения из башни, и тогда я уже не смогу выполнять свои прямые обязанности - следить за хозяйством и порядком здесь.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_11");	//Ты не можешь допустить, чтобы в башне закончились деньги или еда.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Теперь, когда у меня есть управляющий, я могу подумать о расширении и о поиске людей, готовых работать на меня. При этом я должен помнить, что им надо будет платить деньги и предоставлять трехразовое питание.");
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireCook(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireCook_condition;
	information = DIA_VALERAN_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireCook_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireCook == TRUE) && (EddaIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireCook_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_00");	//В лагере начались первые поставки продовольствия. Это хорошие новости!
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_01");	//Однако встает вопрос по части его хранения. Ведь без должного ухода часть еды просто напросто испортится.
	AI_Output(other,self,"DIA_VALERAN_CanHireCook_10_02");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_03");	//На мой взгляд лагерю не помешал бы хороший повар, которой смог бы взять решение этой проблемы в свои руки.
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_04");	//Подумай над этим! Это очень важно.
	AI_Output(other,self,"DIA_VALERAN_CanHireCook_10_05");	//Хорошо, я что-нибудь придумаю.
	EddaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"В лагере необходим повар, который будет заниматься вопросами хранения еды. Интересно, с кем мне стоит поговорить?");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireSmith(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireSmith_condition;
	information = DIA_VALERAN_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireSmith_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireSmith == TRUE) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireSmith_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_00");	//В лагере началась добыча руды.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_01");	//Настало время подумать о том, чтобы обзавестись хорошим кузнецом. Тем более, что сама кузня, как видишь, у нас есть.
	AI_Output(other,self,"DIA_VALERAN_CanHireSmith_10_02");	//И где же я тебе его найду? Хороших кузнецов не так уж и много на этом острове.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_03");	//Согласен. Но если ты хочешь, чтобы твой лагерь по-настоящему вырос и окреп, то тебе придется его найти.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_04");	//Починить оружие, залатать доспех, что-то изготовить на продажу из добываемой нами руды, сможет только кузнец.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_05");	//Так что лучше поднапряги извилины и подумай, кто бы мог занять это место.
	AI_Output(other,self,"DIA_VALERAN_CanHireSmith_10_06");	//Ладно, я что-нибудь придумаю.
	CarlNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Лагерю нужен кузнец. Без этого он не сможет по-настоящему развиваться.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireHealer(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireHealer_condition;
	information = DIA_VALERAN_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireHealer_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_00");	//Последние дни в лагере прибавилось охраны.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_01");	//Это хорошо, поскольку недавно мы подверглись нападению нескольких хищных тварей.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_02");	//Одному из охранников прилично досталось в той схватке, но к счастью для него рана оказалась не слишком серьезной.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_03");	//Однако если так и дальше пойдет, то вскоре мы тут потеряем всех людей.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_04");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_05");	//Нам нужен целитель, а лучше всего алхимик, способный варить целебные эликсиры на такие случаи.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_06");	//И где же я тебе его найду?
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_07");	//Я понимаю, что это не простая задача. Но от ее решения зависят судьбы людей, живущих в лагере.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_08");	//Поэтому тебе придется с этим что-то сделать.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_09");	//Хорошо, я поищу нам лекаря.
	SagittaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Лагерю нужен целитель. Без этого, люди долго тут не протянут.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceSmith(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceSmith_condition;
	information = DIA_VALERAN_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanProduceSmith_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_00");	//Карл начал работать в кузнице. Я рад, что у тебя получилось уговорить его присоединиться к нам.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_01");	//Но теперь стоит подумать о главном.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_03");	//Кузня должна приносить доход, иначе толку от нее будет мало.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_04");	//Хорошо. Какие будут предложения?
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_05");	//Мы могли бы использовать наши запасы руды для ее дальнейшей переработки в стальные заготовки.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_06");	//Это довольно ходовой товар в нынешнее время, и его продажа позволит нам существенно сократить денежные расходы лагеря.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_07");	//Звучит неплохо.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_08");	//Мне тоже нравится! Так что подумай над этим.
	CanSellOre = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Валеран предложил использовать запасы руды для изготовления стальных заготовок, которые впоследствии можно будет продать. Это обеспечит лагерь дополнительным доходом.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceWeapon(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceWeapon_condition;
	information = DIA_VALERAN_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanProduceWeapon_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_01");	//В последнее время в лагере прибавилось людей. Думаю, нам стоит получше вооружить нашу охрану.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_02");	//Тем более времена сейчас неспокойные, кругом бродят хищные твари.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_03");	//Недавно кто-то из наших даже видел неподалеку настоящего орка!
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_04");	//Если мы не позаботимся о нашей безопасности, это место станет легкой добычей для бандитов или для тех же орков.
	AI_Output(other,self,"DIA_VALERAN_CanProduceWeapon_10_05");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_06");	//Оружием нас обеспечит Карл. Он, конечно,не мастер-кузнец, но сковать добротный меч вполне сможет.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_07");	//Но нашим бойцам нужны доспехи получше. Те, что сейчас на них, не спасут даже от укуса обычного кровяного шершня.
	AI_Output(other,self,"DIA_VALERAN_CanProduceWeapon_10_08");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_13");	//Естественно, было бы лучше, если бы мы смогли производить свои собственные доспехи. Но для этого нам потребуются чертежи и схемы их изготовления.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_14");	//Уверен, ты бываешь в разных местах, и, возможно, тебе уже попадалось на глаза нечто подобное.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_15");	//Если что, приноси их мне. И я позабочусь о том, чтобы наши парни больше не ходили в лохмотьях.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CrawlerArmor(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CrawlerArmor_condition;
	information = DIA_VALERAN_CrawlerArmor_info;
	permanent = FALSE;
	description = "Я принес чертежи доспехов.";
};

func int DIA_VALERAN_CrawlerArmor_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_VALERAN_CrawlerArmor_15_00");	//Я принес чертежи доспехов.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other,"DIA_VALERAN_CrawlerArmor_15_01");	//Хорошо, давай их сюда. Я отдам их Карлу, чтобы тот разобрался с ними.
	AI_Output(self,other,"DIA_VALERAN_CrawlerArmor_15_02");	//Если по ним и вправду можно будет изготовить доспехи, то через пару дней все наши ребята уже будут щеголять в них.
	AI_Output(other,self,"DIA_VALERAN_CrawlerArmor_15_03");	//Очень надеюсь на это.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instance DIA_VALERAN_ArmorDone(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_ArmorDone_condition;
	information = DIA_VALERAN_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_ArmorDone_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_00");	//Карл закончил изготовление доспехов, и я сразу же раздал их нашим парням.
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_01");	//Теперь об их снаряжении можно не волноваться. Да и сами доспехи на вид очень прочные.
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_02");	//Вот, держи. Этот экземпляр я оставил специально для тебя. Вдруг они и тебе пригодится.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self,"DIA_VALERAN_ArmorDone_15_03");	//Благодарю.
};

instance DIA_VALERAN_BUSINESSACTION(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 21;
	condition = dia_valeran_businessaction_condition;
	information = dia_valeran_businessaction_info;
	permanent = TRUE;
	description = "Мне бы хотелось кое-что сделать...";
};

func int dia_valeran_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_businessaction_info()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_15_00");	//Мне бы хотелось кое-что сделать.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_10_01");	//Что именно?	
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Забрать деньги из казны лагеря.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Внести деньги в казну лагеря.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Продать запасы еды со склада в лагере.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Оставить припасы еды на складе в лагере.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать магическую руду со склада в лагере.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать железную руду со склада в лагере.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Начать производство стальных заготовок.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Остановить производство стальных заготовок.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_oretake()
{
	AI_Output(other,self,"dia_valeran_businessaction_oretake_15_00");	//Я бы хотел забрать магическую руду со склада в лагере.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other,"dia_valeran_businessaction_oretake_10_01");	//К сожалению, у нас сейчас нет лишних запасов руды.
	}
	else
	{
		AI_Output(self,other,"dia_valeran_businessaction_oretake_10_02");	//Хорошо. Вот тут вся магическая руда, что у нас есть!
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Забрать деньги из казны лагеря.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Внести деньги в казну лагеря.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Продать запасы еды со склада в лагере.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Оставить припасы еды на складе в лагере.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать магическую руду со склада в лагере.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать железную руду со склада в лагере.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Начать производство стальных заготовок.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Остановить производство стальных заготовок.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_irontake()
{
	AI_Output(other,self,"dia_valeran_businessaction_irontake_15_00");	//Я бы хотел забрать железную руду со склада в лагере.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other,"dia_valeran_businessaction_irontake_10_01");	//К сожалению, у нас сейчас нет лишних запасов руды.
	}
	else
	{
		AI_Output(self,other,"dia_valeran_businessaction_irontake_10_02");	//Хорошо. Вот тут вся железная руда, что у нас есть!
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Забрать деньги из казны лагеря.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Внести деньги в казну лагеря.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Продать запасы еды со склада в лагере.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Оставить припасы еды на складе в лагере.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать магическую руду со склада в лагере.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать железную руду со склада в лагере.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Начать производство стальных заготовок.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Остановить производство стальных заготовок.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Забрать деньги из казны лагеря.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Внести деньги в казну лагеря.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Продать запасы еды со склада в лагере.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Оставить припасы еды на складе в лагере.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать магическую руду со склада в лагере.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать железную руду со склада в лагере.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Начать производство стальных заготовок.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Остановить производство стальных заготовок.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Забрать деньги из казны лагеря.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Внести деньги в казну лагеря.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Продать запасы еды со склада в лагере.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Оставить припасы еды на складе в лагере.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать магическую руду со склада в лагере.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Забрать железную руду со склада в лагере.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Начать производство стальных заготовок.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Остановить производство стальных заготовок.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_back()
{
	Info_ClearChoices(dia_valeran_businessaction);
};

func void dia_valeran_businessaction_budgetgive()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_15_00");	//Я бы хотел внести деньги в казну лагеря.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetGive_10_01");	//О какой сумме идет речь?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_small()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Small_15_00");	//Пять сотен золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_medium()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Medium_15_00");	//Полторы тысячи золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_huge()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Huge_15_00");	//Две с половиной тысячи золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_15_00");	//Я бы хотел забрать деньги из казны лагеря.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetTake_10_01");	//К сожалению, сейчас я не могу выдать тебе деньги, поскольку у меня на руках имеются лишь минимальные средства, необходимые для надежного функционирования лагеря.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetTake_10_02");	//Сколько конкретно?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_budgettake_small()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Small_15_00");	//Пять сотен золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_medium()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Medium_15_00");	//Полторы тысячи золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Huge_15_00");	//Две с половиной тысячи золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пять сотен золотых монет.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Полторы тысячи золотых монет.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"Две с половиной тысячи золотых монет.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_15_00");	//Я бы хотел оставить припасы еды на складе в лагере.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodGive_10_01");	//О каком размере припасов идет речь?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков жареного мяса.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков сырого мяса.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Два десятка свежей рыбы.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять батонов хлеба.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_hmf()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_MF_15_00");	//Двадцать кусков жаренного мяса.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков жареного мяса.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков сырого мяса.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Два десятка свежей рыбы.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять батонов хлеба.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_mf()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_MF_15_00");	//Двадцать кусков сырого мяса.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков жареного мяса.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков сырого мяса.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Два десятка свежей рыбы.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять батонов хлеба.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_fb()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_FB_15_00");	//Два десятка свежей рыбы.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков жареного мяса.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков сырого мяса.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Два десятка свежей рыбы.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять батонов хлеба.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_bsc()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_BSC_15_00");	//Десять батонов хлеба.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков жареного мяса.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать кусков сырого мяса.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"Два десятка свежей рыбы.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять батонов хлеба.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_15_00");	//Я бы хотел продать запасы еды со склада в лагере.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodSell_10_01");	//К сожалению, это невозможно, ибо запасы на складе минимальны для нормального существования лагеря в ближайшее время.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodSell_10_02");	//Это возможно организовать. Сколько конкретно еды ты желаешь продать?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_valeran_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_valeran_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_valeran_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_valeran_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_valeran_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_valeran_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Small_15_00");	//Десять единиц еды.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Medium_15_00");	//Двадцать пять единиц еды.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Huge_15_00");	//Пятьдесят единиц еды.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

instance DIA_VALERAN_MONEYCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_moneycrisis_condition;
	information = dia_valeran_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_00");	//Наконец-то! В лагере нет денег, мне нечем платить людям зарплату!
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_01");	//Мне еле-еле удалось отговорить их от того, чтобы начать расходиться по домам.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_02");	//Нам срочно нужны деньги!
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_15_03");	//Сколько?
	concatText1 = ConcatStrings("Необходимо ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1," золотых монет");
	AI_Print(concatText1);
	Info_ClearChoices(dia_valeran_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_valeran_moneycrisis,"Вот деньги.",dia_valeran_moneycrisis_yes);
	};

	Info_AddChoice(dia_valeran_moneycrisis,"У меня сейчас нет таких денег.",dia_valeran_moneycrisis_no);
};

func void dia_valeran_moneycrisis_yes()
{
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_Yes_15_00");	//Вот деньги.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_Yes_07_01");	//Отлично! Я немедленно распоряжусь выплатить долги.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_valeran_moneycrisis_no()
{
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_No_15_00");	//У меня сейчас нет таких денег.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_No_07_01");	//Значит, найди их! Нельзя быть таким безответственным.
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_FOODCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_foodcrisis_condition;
	information = dia_valeran_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_foodcrisis_info()
{
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_00");	//Наконец-то! В лагере закончилась еда, нам нечего есть!
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_01");	//Я временно договорился с Онаром о поставках, но у него на носу важный контракт, и он их прекратит, как только его заключит.
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_02");	//Нам срочно нужна еда. Прежде всего, мясо, рыба, хлеб...
	Info_ClearChoices(dia_valeran_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Вот двадцать кусков жареного мяса.",dia_valeran_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Вот двадцать кусков сырого мяса.",dia_valeran_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Вот два десятка свежей рыбы.",dia_valeran_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Вот десять батонов хлеба.",dia_valeran_foodcrisis_b);
	};

	Info_AddChoice(dia_valeran_foodcrisis,"У меня нет с собой нужного количества еды.",dia_valeran_foodcrisis_no);
};

func void dia_valeran_foodcrisis_m()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_M_15_00");	//Вот двадцать кусков жареного мяса.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_M_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_M_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Вот двадцать кусков жареного мяса.",dia_valeran_foodcrisis_m);
		};
	};
};

func void dia_valeran_foodcrisis_rm()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_RM_15_00");	//Вот двадцать кусков сырого мяса.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_RM_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_RM_M_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Вот двадцать кусков сырого мяса.",dia_valeran_foodcrisis_rm);
		};
	};
};

func void dia_valeran_foodcrisis_f()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_F_15_00");	//Вот два десятка свежей рыбы.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_F_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_F_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Вот два десятка свежей рыбы.",dia_valeran_foodcrisis_f);
		};
	};
};

func void dia_valeran_foodcrisis_b()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_B_15_00");	//Вот десять батонов хлеба.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_B_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_B_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Вот десять батонов хлеба.",dia_valeran_foodcrisis_b);
		};
	};
};

func void dia_valeran_foodcrisis_no()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_No_15_00");	//У меня нет с собой нужного количества еды. Я сам живу впроголодь.
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_No_07_01");	//О, Иннос! Нельзя же быть таким безответственным. Нам нужна еда!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_IGETTHEFOUTOFHERE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 15;
	condition = dia_valeran_igetthefoutofhere_condition;
	information = dia_valeran_igetthefoutofhere_info;
	permanent = FALSE;
	description = "Я собираюсь отплыть на материк.";
};

func int dia_valeran_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_igetthefoutofhere_info()
{
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_00");	//Я собираюсь отплыть на материк. Ты сможешь присмотреть за башней?
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_01");	//Это неожиданные новости... ты уплываешь навсегда или же намереваешься вернуться назад через какое-то время?
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_02");	//Боюсь, что нет, я уже не вернусь в Хоринис. Если ты готов и дальше заниматься ведением дел в башне, я оставлю ее тебе.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_03");	//Эээ... хорошо, как скажешь. Благодаря твоим усилиям мы неплохо здесь обустроились, так что, думаю, сможем и дальше поддерживать этот лагерь.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_04");	//Теперь, когда твоя башня и ферма Онара стали основным центром сопротивления оркам, мы сможем укрепить отношения с остальными лагерями и совместными усилиями продолжить противостоять этим тварям.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_05");	//Так что, думаю, ты можешь отплывать, не беспокоясь за благополучие лагеря.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_06");	//Ты уже сделал для нас все, что мог, и теперь наша очередь приложить усилия. Удачного плавания!
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_07");	//Спасибо!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_INTOWER(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 22;
	condition = dia_valeran_intower_condition;
	information = dia_valeran_intower_info;
	permanent = TRUE;
	description = "Как дела в башне?";
};

func int dia_valeran_intower_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_intower_info()
{
	AI_Output(other,self,"DIA_Valeran_InTower_15_00");	//Как дела в башне?
	AI_Output(self,other,"DIA_Valeran_InTower_07_01");	//Отлично! Покуда у нас будет достаточно еды и денег, тебе не о чем беспокоиться.
};