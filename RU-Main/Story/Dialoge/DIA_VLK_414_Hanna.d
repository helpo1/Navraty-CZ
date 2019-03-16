
instance DIA_Hanna_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_EXIT_Condition;
	information = DIA_Hanna_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Hello(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Hello_Condition;
	information = DIA_Hanna_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_Hello_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Ах, клиент! Что я могу сделать для тебя?
};

instance DIA_Hanna_Armor(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Condition;
	information = DIA_Hanna_Armor_Info;
	permanent = FALSE;
	description = "Я пришел от ополченца Пабло.";
};

func int DIA_Hanna_Armor_Condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Info()
{
	AI_Output(other,self,"DIA_Hanna_Armor_01_00");	//Я пришел от ополченца Пабло.
	AI_Output(other,self,"DIA_Hanna_Armor_01_01");	//Он сказал, что ты можешь продать мне одежду горожанина.
	AI_Output(self,other,"DIA_Hanna_Armor_01_02");	//Хммм...(недоверчиво) Ну, если он так сказал, то могу.
	AI_Output(self,other,"DIA_Hanna_Armor_01_03");	//Но только не думай, что я тебе ее отдам бесплатно.
	AI_Output(self,other,"DIA_Hanna_Armor_01_04");	//Тебе придется заплатить за нее. Ровно сто монет.
	AI_Output(other,self,"DIA_Hanna_Armor_01_05");	//На другое я и не рассчитывал.
	B_LogEntry(TOPIC_PathFromDown,"Ханна может продать мне легкую одежду горожанина за сто золотых монет.");
};

instance DIA_Hanna_Armor_Dis(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Dis_Condition;
	information = DIA_Hanna_Armor_Dis_Info;
	permanent = TRUE;
	description = "Ты можешь продать мне одежду дешевле?";
};

func int DIA_Hanna_Armor_Dis_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (Hanna_LeatherBought_Dis == FALSE) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Dis_Info()
{
	AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_00");	//Ты можешь продать мне одежду дешевле?

	if(HannaTakeBuh == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_01");	//(задумчиво) Хорошо. Все-таки ты помог мне решить проблему с Лемаром.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_02");	//Поэтому я отдам тебе ее просто так.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_03");	//Вот, возьми.
		AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_04");	//Спасибо.
		B_GiveInvItems(self,other,ITAR_Vlk_L,1);
		Hanna_LeatherBought = TRUE;
	}
	else if(IS_LOVCACH == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_05");	//(задумчиво) Хорошо. Все-таки ты один из нас.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_06");	//А со своими людьми надо считаться.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_07");	//Поэтому я продам тебе ее в два раза дешевле.
		AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_08");	//И на том спасибо.
		Hanna_LeatherBought_Dis = TRUE;
		B_LogEntry(TOPIC_PathFromDown,"Поскольку я вор, Ханна продаст мне легкую одежду горожанина в два раза дешевле.");
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_09");	//(ехидно) И почему я должна это делать?
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_10");	//Нет, дорогой мой. Дешевле я тебе ее не продам!
	};
};

instance DIA_Hanna_LEATHER(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 850;
	condition = DIA_Hanna_LEATHER_Condition;
	information = DIA_Hanna_LEATHER_Info;
	permanent = TRUE;
	description = "(купить легкую одежду горожанина).";
};

func int DIA_Hanna_LEATHER_Condition()
{
	if((CanTeachTownMaster == FALSE) && (Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Hanna_LEATHER_15_00");	//Продай мне одежду.

	if(Hanna_LeatherBought_Dis == TRUE)
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			B_GiveInvItems(other,self,ItMi_Gold,50);
			Npc_RemoveInvItems(self,ItMi_Gold,50);
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_01");	//Хорошо...(улыбаясь) Вот, возьми ее.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_02");	//Прости, но у тебя не хватает золота.
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			B_GiveInvItems(other,self,ItMi_Gold,100);
			Npc_RemoveInvItems(self,ItMi_Gold,100);
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_01");	//Хорошо...(улыбаясь) Вот, возьми ее.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_02");	//Прости, но у тебя не хватает золота.
		};
	};
};

instance DIA_Hanna_Room(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Room_Condition;
	information = DIA_Hanna_Room_Info;
	permanent = FALSE;
	description = "Я хочу снять комнату.";
};

func int DIA_Hanna_Room_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Я хочу снять комнату.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//Ты обратился как раз по адресу.

	if(Npc_KnowsInfo(other,DIA_Lothar_Schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Один из паладинов сказал мне, что я могу провести ночь здесь бесплатно...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Сколько стоит комната на ночь?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Эта услуга абсолютно бесплатна.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Паладины оплачивают ночлег всех путешественников.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//То есть я могу остановиться здесь на ночь бесплатно?!
	};

	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Да, да.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Просто поднимись вверх по лестнице.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Пара коек там еще свободна.
};


instance DIA_Hanna_WhyPay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 3;
	condition = DIA_Hanna_WhyPay_Condition;
	information = DIA_Hanna_WhyPay_Info;
	permanent = FALSE;
	description = "А почему паладины платят за все?";
};

func int DIA_Hanna_WhyPay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//А почему паладины платят за все?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Я не знаю точно, с чем это связано.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//С одной стороны я думаю, они хотят, чтобы нищие не ошивались ночью на улицах. Так безопаснее для всех.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//Ну а с другой - они хотят завоевать расположение странствующих торговцев.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Сейчас, когда фермеры подняли восстание, нам остается полагаться только на торговцев в вопросах обеспечения города продовольствием.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//Кроме того, я думаю, они хотят поднять немного моральный дух в городе.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Лорд Андрэ даже приказал раздавать бесплатное пиво на Площади Правосудия.
};


instance DIA_Hanna_WerHier(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 4;
	condition = DIA_Hanna_WerHier_Condition;
	information = DIA_Hanna_WerHier_Info;
	permanent = FALSE;
	description = "Кто здесь живет сейчас?";
};

func int DIA_Hanna_WerHier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Кто здесь живет сейчас?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//В основном странствующие торговцы с рынка.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Ага.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Даже не думай, чтобы пошарить в их пожитках! Мне не нужны здесь проблемы!
};


instance DIA_Hanna_City(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 5;
	condition = DIA_Hanna_City_Condition;
	information = DIA_Hanna_City_Info;
	permanent = TRUE;
	description = "Несколько вопросов о городе...";
};

func int DIA_Hanna_City_Condition()
{
	return TRUE;
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Несколько вопросов о городе...
	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City,Dialog_Back,DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City,"Где я могу купить что-нибудь здесь?",DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City,"Расскажи мне о городе.",DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Где я могу купить что-нибудь здесь?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Рынок находится прямо перед парадным входом в отель. Я думаю, ты найдешь там все, что тебе нужно.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Также есть несколько лавок ремесленников в другой части города. Большинство из них находятся недалеко от городских ворот.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//Также в порту ты найдешь торговца рыбой. Его лавка смотрит прямо на гавань.
};

func void DIA_Hanna_City_City()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Расскажи мне о городе.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Хоринис - один из самых богатых городов королевства, даже несмотря на то, что сейчас он совсем не кажется таким.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Но с тех пор, как началась война с орками, всяческая торговля практически умерла. Король реквизировал весь торговый флот для нужд армии,
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//и теперь в наш порт корабли практически не заходят. Поэтому поставки товаров очень ограничены, и многие горожане очень обеспокоены этим.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Никто не знает, что принесет нам будущее. Нам ничего не остается, кроме как ждать и надеяться на лучшее. Вряд ли в наших силах хоть что-то изменить.
};


instance DIA_Hanna_Kap3_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_Kap3_EXIT_Condition;
	information = DIA_Hanna_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hanna_PriceForLetter;

instance DIA_Hanna_AnyNews(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_AnyNews_Condition;
	information = DIA_Hanna_AnyNews_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Hanna_AnyNews_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Мне почему-то кажется, что тебя не особо-то волнуют проблемы других людей.
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ты ошибаешься.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ну, как сказать...",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews,"В общем-то, нет.",DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//В общем, да.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//Ну, значит я права. Сейчас все думают только о себе. Так что тебе нужно?
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//Ну, как сказать...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//Это зависит от того, сколько на этом можно заработать, ты хочешь сказать?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Я не люблю таких, как ты.
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Ты ошибаешься.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Ох, понимаешь какое дело... Я разбирала недавно у себя всякий хлам и продала пачку старых карт Ибрагиму, картографу в гавани.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Но потом я заметила, что у меня не хватает одного документа.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Я думаю, он мог случайно оказаться в стопке этих карт.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Ты не мог бы вернуть его мне?
	MIS_HannaRetrieveLetter = LOG_Running;
	Log_CreateTopic(TOPIC_HannaRetrieveLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter,LOG_Running);
	B_LogEntry(TOPIC_HannaRetrieveLetter,"У Ханны пропал документ. Похоже, он пропал в гавани, там, где живет картограф Ибрагим.");
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Я тебе не мальчик на побегушках.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews,"А что мне с этого будет?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews,"Я попробую.",DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Я тебе не мальчик на побегушках.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Понимаю - проблемы простой женщины слишком ничтожны для тебя. Значит, тебе придется заняться этим самой.
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//Что я за это получу?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Ага, я знала - ты не лучше, чем весь этот остальной портовый сброд.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Так что ты хочешь получить с бедной женщины?
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ладно, забудь.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ну, ты могла бы быть немного поласковее со мной... Как женщина...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews,"Золото.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Ладно, забудь.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Ну, хоть остатки совести у тебя еще есть. Если ты принесешь мне этот документ, я дам тебе 75 золотых.
	Hanna_PriceForLetter = 75;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Ну, ты могла бы быть немного поласковее со мной... Как женщина...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//Ну, ты хам! Я... убирайся отсюда! Неотесанный мужлан!
	MIS_HannaRetrieveLetter = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Золото.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Тебе нужен этот презренный металл? Ладно - я оцениваю этот документ в полсотни золотых.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Если ты сможешь вернуть мне этот документ, я дам тебе эти деньги.
	Hanna_PriceForLetter = 50;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Я попробую.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//Ты такой любезный. Я желаю тебе удачи!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Если ты принесешь мне эту бумагу, тебя ждет награда.
	Hanna_PriceForLetter = 200;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

instance DIA_Hanna_ThisLetter(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_ThisLetter_Condition;
	information = DIA_Hanna_ThisLetter_Info;
	permanent = FALSE;
	description = "Ты этот документ имела в виду?";
};

func int DIA_Hanna_ThisLetter_Condition()
{
	if((MIS_HannaRetrieveLetter == LOG_Running) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Ты имела в виду этот документ?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Да, именно его я и искала! Спасибо.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//Какое вознаграждение я получу?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Только спокойно! Вот твое золото.
	B_GiveInvItems(other,self,itwr_shatteredgolem_mis_1,1);
	CreateInvItems(self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems(self,other,ItMi_Gold,Hanna_PriceForLetter);
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};


instance DIA_Hanna_PICKPOCKET(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 900;
	condition = DIA_Hanna_PICKPOCKET_Condition;
	information = DIA_Hanna_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hanna_PICKPOCKET_Condition()
{
	return C_Beklauen(45,25);
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,Dialog_Back,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

var int HannaThief;
var int HannaBuyStones;

instance DIA_Hanna_AusKeller(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_AusKeller_Condition;
	information = DIA_Hanna_AusKeller_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanna_AusKeller_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if((Cassia.aivar[AIV_KilledByPlayer] == TRUE) || (Jesper.aivar[AIV_KilledByPlayer] == TRUE) || (Ramirez.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Откуда... ты пришел?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//Я нашел кое-что интересное в твоем подвале...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//Что ты делал в моем подвале?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//Ты прекрасно знаешь это!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//Я не знаю, о чем ты говоришь...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//Посмотри на себя! Ты откуда такой взялся? А?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//Я...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//Я все знаю!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//Не говори мне! Я все знаю.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Даже и не думай, чтобы украсть что-нибудь здесь, понял?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//Мы не можем себе позволить привлекать внимание к отелю.
		HannaThief = TRUE;
	};
};

instance DIA_Hanna_TradeMe(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_TradeMe_Condition;
	information = DIA_Hanna_TradeMe_Info;
	permanent = FALSE;
	description = "Ты тоже воровка?";
};

func int DIA_Hanna_TradeMe_Condition()
{
	if((HannaThief == TRUE) && ((HANNAISKNAST == FALSE) || (HANNAISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Hanna_TradeMe_Info()
{
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_00");	//Ты тоже воровка?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Hanna_TradeMe_01_01");	//Была когда-то.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_02");	//Но сейчас я неплохо зарабатываю, содержа гостиницу и занимаясь продажей еды для постояльцев.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_03");	//Правда, у меня до сих пор остались некоторые клиенты, которых интересует нечто большее, чем просто еда и кров над головой.
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_04");	//И что ты им продаешь?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Hanna_TradeMe_01_05");	//Моих покупателей часто интересуют драгоценные камни и шкатулки.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_06");	//Подобные вещи на торговом рынке просто так не найти.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_07");	//Так что, если хочешь хорошенько подзаработать, приноси их мне.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_08");	//А я в свою очередь щедро вознагражу тебя!
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_09");	//Договорились.
	Log_CreateTopic(Topic_GoldStones,LOG_NOTE);
	B_LogEntry(Topic_GoldStones,"Ханна скупает любые драгоценные камни и шкатулки по хорошей цене.");
	HannaBuyStones = TRUE;
};

instance DIA_Hanna_BuyStones(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 200;
	condition = DIA_Hanna_BuyStones_Condition;
	information = DIA_Hanna_BuyStones_Info;
	permanent = TRUE;
	description = "Я принес тебе кое-что на продажу.";
};

func int DIA_Hanna_BuyStones_Condition()
{
	if((HannaBuyStones == TRUE) && ((Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) >= 1) || (Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY) >= 1) || (Npc_HasItems(other,ItMi_Diamod) >= 1) || (Npc_HasItems(other,ItMi_Emerald) >= 1) || (Npc_HasItems(other,ItMi_Topaz) >= 1) || (Npc_HasItems(other,ItMi_Opal) >= 1) || (Npc_HasItems(other,ItMi_Sapphire) >= 1) || (Npc_HasItems(other,ItMi_Ruby) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hanna_BuyStones_Info()
{
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_00");	//Я принес тебе кое-что на продажу.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_01");	//Хорошо. Давай посмотрим.
	Info_ClearChoices(DIA_Hanna_BuyStones);
	Info_AddChoice(DIA_Hanna_BuyStones,DIALOG_BACK,DIA_Hanna_BuyStones_Back);

	if((Npc_HasItems(other,ItMi_Diamod) > 0) || (Npc_HasItems(other,ItMi_Emerald) > 0) || (Npc_HasItems(other,ItMi_Topaz) > 0) || (Npc_HasItems(other,ItMi_Opal) > 0) || (Npc_HasItems(other,ItMi_Sapphire) > 0) || (Npc_HasItems(other,ItMi_Ruby) > 0))
	{
		Info_AddChoice(DIA_Hanna_BuyStones,"Продать все драгоценные камни.",DIA_Hanna_BuyStones_Stones);
	};
	if((Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) > 0) || (Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY) > 0))
	{
		Info_AddChoice(DIA_Hanna_BuyStones,"Продать все пустые шкатулки.",DIA_Hanna_BuyStones_Chests);
	};
};

func void DIA_Hanna_BuyStones_Back()
{
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Stones()
{
	var int misc_03;
	var int misc_04;
	var int misc_05;
	var int misc_06;
	var int misc_07;
	var int misc_08;
	var int misc_all;

	misc_03 = Npc_HasItems(other,ItMi_Diamod);	
	misc_04 = Npc_HasItems(other,ItMi_Emerald);
	misc_05 = Npc_HasItems(other,ItMi_Topaz);
	misc_06 = Npc_HasItems(other,ItMi_Opal);
	misc_07 = Npc_HasItems(other,ItMi_Sapphire);
	misc_08 = Npc_HasItems(other,ItMi_Ruby);

	misc_03 = misc_03 * 750;
	misc_04 = misc_04 * 450;
	misc_05 = misc_05 * 150;
	misc_06 = misc_06 * 300;
	misc_07 = misc_07 * 450;
	misc_08 = misc_08 * 450;

	misc_all = misc_03 + misc_04 + misc_05 + misc_06 + misc_07 + misc_08;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_Diamod,Npc_HasItems(other,ItMi_Diamod));
	Npc_RemoveInvItems(other,ItMi_Emerald,Npc_HasItems(other,ItMi_Emerald));
	Npc_RemoveInvItems(other,ItMi_Topaz,Npc_HasItems(other,ItMi_Topaz));
	Npc_RemoveInvItems(other,ItMi_Opal,Npc_HasItems(other,ItMi_Opal));
	Npc_RemoveInvItems(other,ItMi_Sapphire,Npc_HasItems(other,ItMi_Sapphire));
	Npc_RemoveInvItems(other,ItMi_Ruby,Npc_HasItems(other,ItMi_Ruby));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_02");	//Хммм...(довольно) Да, неплохо, мой дорогой. Я, пожалуй, возьму у тебя все.
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_03");	//А деньги?
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_04");	//Само собой. Вот твое вознаграждение.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_05");	//И поверь: это куда больше, чем ты получил бы за них у торговцев на площади.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_06");	//Если у тебя будет еще что-нибудь на продажу - ты знаешь, где меня найти.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Chests()
{
	var int misc_01;
	var int misc_02;
	var int misc_all;

	misc_01 = Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD); 
	misc_02 = Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY);

	misc_01 = misc_01 * 45;
	misc_02 = misc_02 * 60;

	misc_all = misc_01 + misc_02;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ITMI_CHEST_EMPTYGOLD,Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD));
	Npc_RemoveInvItems(other,ITMI_JEWELERYCHEST_EMPTY,Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_02");	//Хммм...(довольно) Да, неплохо, мой дорогой. Я, пожалуй, возьму у тебя все.
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_03");	//А деньги?
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_04");	//Само собой. Вот твое вознаграждение.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_05");	//И поверь: это куда больше, чем ты получил бы за них у торговцев на площади.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_06");	//Если у тебя будет еще что-нибудь на продажу - ты знаешь, где меня найти.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

instance DIA_Hanna_Schuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Schuldenbuch_Condition;
	information = DIA_Hanna_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Посмотри, какая у меня есть книга.";
};

func int DIA_Hanna_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) >= 1) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Посмотри, какая у меня есть книга.
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Гроссбух Лемара! Как тебе это удалось?!
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//Ну...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//То, что Лемар лишился своего гроссбуха - это хорошо. Но лучше, если он будет у меня...
};

instance DIA_Hanna_GiveSchuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_GiveSchuldenbuch_Condition;
	information = DIA_Hanna_GiveSchuldenbuch_Info;
	permanent = FALSE;
	description = "Вот, возьми эту книгу.";
};

func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Schuldenbuch) && (Npc_HasItems(other,ItWr_Schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Вот, возьми эту книгу.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Спасибо!
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Возьми это в качестве награды.
	B_GiveInvItems(self,other,ItMi_Emerald,1);
	HannaTakeBuh = TRUE;
};

func void Hanna_Blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//В логове все в порядке?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//Я давно уже не видела их.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Я, пожалуй, схожу туда, когда у меня будет время. И проверю, как у них дела.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Да. Но тебе лучше не говорить об этом...
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Ты знала о логове воров?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//Я... не понимаю, о чем ты говоришь...(с ухмылкой)
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//Здесь было ополчение. Кто-то предал наше убежище!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Мне они ничего не смогли предьявить, но Кассия и ее люди мертвы.
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Я уверена, что это ТЫ!
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Я купила это специально для тебя.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Это обошлось мне в кругленькую сумму. Но для тебя мне ничего не жалко, свинья!
};

instance DIA_HANNA_INKNAST(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_inknast_condition;
	information = dia_hanna_inknast_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hanna_inknast_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_inknast_info()
{
	AI_Output(self,other,"DIA_Hanna_InKnast_01_00");	//Ты не должен разговаривать со мной.
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_ISFREE(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_isfree_condition;
	information = dia_hanna_isfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_isfree_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_isfree_info()
{
	AI_Output(self,other,"DIA_Hanna_IsFree_01_00");	//Спасибо, что помог мне доказать мою невиновность.
	AI_Output(self,other,"DIA_Hanna_IsFree_01_01");	//Теперь я твоя должница!
	AI_Output(other,self,"DIA_Hanna_IsFree_01_02");	//Не стоит благодарностей. Я всего лишь восстановил справедливость.
	AI_Output(self,other,"DIA_Hanna_IsFree_01_03");	//Я все равно отблагодарю тебя.
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Что это такое ты дала мне?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//Это ключ от врат, ведущих к богатству.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Ханна поблагодарила меня за мою помощь и дала мне странного вида ключ. Осталось передать Ханне ожерелье, которое дала мне Абигаль, и вернуться к последней за наградой.");
};

instance DIA_HANNA_GOLDNECKLACEHANNA(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = dia_hanna_goldnecklacehanna_condition;
	information = dia_hanna_goldnecklacehanna_info;
	permanent = FALSE;
	description = "Твоя сестра передает тебе это ожерелье.";
};


func int dia_hanna_goldnecklacehanna_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (Npc_HasItems(other,ITMI_HANNAGOLDNECKLACE) >= 1) && (HANNAISFREE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hanna_goldnecklacehanna_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_00");	//Твоя сестра передает тебе это золотое ожерелье.
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_01");	//Правда?
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_02");	//Вот, держи.
	B_GiveInvItems(other,self,ITMI_HANNAGOLDNECKLACE,1);
	Npc_RemoveInvItems(self,ITMI_HANNAGOLDNECKLACE,Npc_HasItems(self,ITMI_HANNAGOLDNECKLACE));
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_03");	//(радостно) Ах! Как мило с ее стороны.
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_07");	//Если встретишь Абигаль еще раз, поблагодари ее от меня за этот подарок и передай привет!
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_08");	//Хорошо, передам.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Я отдал Ханне золотое ожерелье Абигаль. Надо сообщить об этом ее сестре.");
	HANNATAKESNECKLACE = TRUE;
};

instance DIA_Hanna_HauntedLH(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_HauntedLH_condition;
	information = DIA_Hanna_HauntedLH_info;
	permanent = FALSE;
	description = "Ты случайно не знаешь никого, кого бы звали Стефан?";
};

func int DIA_Hanna_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_HauntedLH_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_00");	//Тебе, случайно, не знакомо имя Стефан?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_01");	//Стефан? А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_02");	//Я нашел это серебряное кольцо. На нем надпись: 'Стефану от Ха...'. Вот я и подумал...
	B_GiveInvItems(other,self,ItMi_StafanRing,1);
	Npc_RemoveInvItems(self,ItMi_StafanRing,1);
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_03");	//(с горечью) Эх... Прошло столько времени, а я до сих пор не могу это забыть.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_04");	//Выходит, тебе оно знакомо?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_05");	//Конечно, ведь это я подарила ее Стефану.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_06");	//А кем он был, этот Стефан?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_07");	//Он работал на маяке, был его смотрителем. В дни своей молодости я там часто бывала.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_08");	//Можно сказать, мы были очень близки. А потом... потом кто-то его убил.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_09");	//Даже не представляю, кто мог это сделать. Стефан был добрым и порядочным человеком. Он бы и мухи не обидел.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_10");	//Я нашел его останки на маяке. Почему его не похоронили?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_11");	//Наверно, потому, что всем было на него наплевать, кроме меня.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_12");	//Потом кто-то пустил слух, что на маяке стали появляться призраки. И с тех пор туда не заглядывает ни одна живая душа.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_13");	//К тому же это отличное место, чтобы спрятать там свои тайны. Если ты понимаешь, о чем я говорю.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_14");	//Возможно. А сам Стефан ничего не рассказывал?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_15");	//В последние дни перед убийством он редко заглядывал ко мне. Говорил, что у него на маяке важные дела.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_16");	//Поначалу я думала, что он разлюбил меня. Но позже поняла, что он попал в какую-то беду, и не хотел меня впутывать в это.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_17");	//(вздыхает) Ты не возражаешь, если я оставлю это кольцо себе? Глядя на него, я вспоминаю дни, когда была по-настоящему счастлива.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_18");	//Конечно.
	KnowStefan = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Оказывается, кольцо тому бедолаге подарила Ханна. Как выяснилось, ее многое связывало с тем человеком. По словам Ханны, Стефан был убит неизвестным. Значит, на маяке произошло убийство... Интересно.");
};