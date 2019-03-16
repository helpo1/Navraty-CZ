
instance DIA_Sarah_EXIT(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 999;
	condition = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_PICKPOCKET(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 900;
	condition = DIA_Sarah_PICKPOCKET_Condition;
	information = DIA_Sarah_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sarah_PICKPOCKET_Condition()
{
	return C_Beklauen(57,60);
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,Dialog_Back,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};


instance DIA_Sarah_Greet(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 1;
	condition = DIA_Sarah_Greet_Condition;
	information = DIA_Sarah_Greet_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_Greet_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Ах! Опять ты!
};


instance DIA_Sarah_HALLO(C_Info)
{
	npc = VLK_470_Sarah;
	condition = DIA_Sarah_HALLO_Condition;
	information = DIA_Sarah_HALLO_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Как торговля?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Когда пришли паладины, я сначала думала, что это хорошо для бизнеса.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Но теперь Харад делает для них оружие. А ни я, ни Хакон еще не получили от них ни одной монеты.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//И, что еще хуже, фермеры больше не поставляют нам продовольствие, и цены на все взлетели до небес.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Одно маленькое утешение - паладины оплачивают мою комнату в отеле.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Сара торгует оружием на рыночной площади.");
};


instance DIA_Sarah_Bauern(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 2;
	condition = DIA_Sarah_Bauern_Condition;
	information = DIA_Sarah_Bauern_Info;
	permanent = FALSE;
	description = "А что за проблема с фермерами?";
};


func int DIA_Sarah_Bauern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//А что за проблема с фермерами?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Они отказываются поставлять нам продовольствие.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Теперь, когда корабли больше не заходят в наш порт, город полностью зависит от продуктов, производимых нашими фермерами.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//А Онар, самый крупный фермер, нанял наемников, чтобы защищать свою ферму от городской стражи. До этого они забирали у него все подчистую.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Но наемники не просто охраняют ферму Онара.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Они добрались даже до маленьких ферм у города, и запугивают их владельцев.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Я видела их, когда ходила на ферму Акила. Не хотела бы я сейчас оказаться на его месте.
};


instance DIA_Sarah_AkilsHof(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 3;
	condition = DIA_Sarah_AkilsHof_Condition;
	information = DIA_Sarah_AkilsHof_Info;
	permanent = FALSE;
	description = "Где мне найти ферму Акила?";
};


func int DIA_Sarah_AkilsHof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Где мне найти ферму Акила?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Если выйдешь из восточных ворот и пойдешь по дороге направо, скоро ты увидишь каменную лестницу.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//Она ведет прямо к ферме Акила.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Но я бы сейчас туда не совалась! Эти наемники, наверняка, все еще там.
};


instance DIA_Sarah_Trade(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_Trade_Condition;
	information = DIA_Sarah_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};

func int DIA_Sarah_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO) && Wld_IsTime(5,15,20,15) && (Sarah_Ausgeliefert == FALSE) && (SARAFLEE == FALSE) && (SARAISDEAD == FALSE))
	{
		return TRUE;
	};
	if((SARAHELPYOUDONE == TRUE) && Wld_IsTime(5,15,20,15))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
	Sarah_WaffenGesehen = TRUE;
};


instance DIA_Sarah_IMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_IMKNAST_Condition;
	information = DIA_Sarah_IMKNAST_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_IMKNAST_Condition()
{
	if((Sarah_Ausgeliefert == TRUE) && Npc_IsInState(self,ZS_Talk) && (SARAISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ты?! Ты осмелился появиться здесь! Я, конечно, не могу доказать этого, но я готова поклясться, что это твоих рук дело!
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Это ты виноват, что я здесь. Ты и этот проклятый Кантар - да накажет вас Иннос!
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_Success(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = DIA_Sarah_Success_Condition;
	information = DIA_Sarah_Success_Info;
	permanent = FALSE;
	description = "Кантар пытался подставить тебя!";
};


func int DIA_Sarah_Success_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Canthar_WiederRaus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Кантар пытался подставить тебя и заполучить твой прилавок. Но я сдал его городской страже.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Ты этим нажил себе очень опасного врага. Я давно знаю этого ублюдка. И он всегда хотел заполучить мой прилавок.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Возьми это оружие в знак моей благодарности!
	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
	SARAKNOWSABOUTCANTHAR = TRUE;
};


instance DIA_SARAH_FLEE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_flee_condition;
	information = dia_sarah_flee_info;
	permanent = FALSE;
	description = "Ты в порядке?";
};

func int dia_sarah_flee_condition()
{
	if(SARAFLEE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_flee_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_Flee_15_00");	//Ты в порядке?
	AI_Output(self,other,"DIA_Sarah_Flee_16_01");	//Хорошо, что ты меня предупредил в прошлый раз. А то бы мне не жить!
	AI_Output(self,other,"DIA_Sarah_Flee_16_02");	//Кантар вышел из тюрьмы, и я едва унесла ноги. Теперь я сыта городом по горло.
	AI_Output(self,other,"DIA_Sarah_Flee_16_03");	//Не знаю только, что мне делать - тут совсем никакой торговли.
	AI_Output(self,other,"DIA_Sarah_Flee_16_04");	//Но в любом случае благодарю тебя за помощь.
};

instance DIA_SARAH_RETURN(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_return_condition;
	information = dia_sarah_return_info;
	permanent = FALSE;
	description = "Ты можешь вернуться на рынок.";
};

func int dia_sarah_return_condition()
{
	if((SARAFLEE == TRUE) && (SARAAGREE == FALSE) && (Npc_IsDead(Canthar) == TRUE) && (SARAHELPYOU == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_return_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_Return_01_00");	//Ты можешь вернуться на рынок.
	AI_Output(self,other,"DIA_Sarah_Return_01_01");	//Но... но там же Кантар! Если он увидит меня - я не знаю, что он со мной сделает!
	AI_Output(other,self,"DIA_Sarah_Return_01_02");	//О Кантаре можешь не беспокоиться - с ним произошел несчастный случай.
	AI_Output(other,self,"DIA_Sarah_Return_01_03");	//Теперь твое место вновь свободно!
	AI_Output(self,other,"DIA_Sarah_Return_01_04");	//Правда? Ну и поделом этому ублюдку - он заслужил это, мерзавец!
	AI_Output(self,other,"DIA_Sarah_Return_01_05");	//Однако я все же лучше останусь тут - от того места на рынке у меня мурашки по коже.
	AI_Output(self,other,"DIA_Sarah_Return_01_07");	//Но в любом случае спасибо, что немного порадовал меня...
};


instance DIA_SARAH_AFTERIMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = dia_sarah_afterimknast_condition;
	information = dia_sarah_afterimknast_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sarah_afterimknast_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (SARAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_afterimknast_info()
{
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_00");	//Ах! Это ты, мерзавец?
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_01");	//Это ты виноват в том, что меня засадили в тюрьму! (гневно) Ты и твой проклятый Кантар!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_02");	//Теперь все люди из-за тебя думают, что я - грязная преступница!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_04");	//Я не желаю с тобой разговаривать, ублюдок!
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_05");	//Подожди, хотя бы выслушай меня!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_06");	//Назови хоть одну причину, по которой я должна сделать это.
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_07");	//Для начала, хотя бы то, что это я вытащил тебя из тюрьмы.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_08");	//ЧТО?! Это сделал ты?
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_09");	//Да, это я заплатил за тебя штраф лорду Андрэ.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_12");	//Ты сначала упрятал меня в тюрьму - а потом вытащил оттуда?
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_14");	//Что все это значит?
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast,"Мне нечего тебе сказать.",dia_sarah_afterimknast_unknown);
	Info_AddChoice(dia_sarah_afterimknast,"Я прошу прощения за тот случай.",dia_sarah_afterimknast_sorry);
	Info_AddChoice(dia_sarah_afterimknast,"У меня тогда не было выбора.",dia_sarah_afterimknast_nochoice);
};

func void dia_sarah_afterimknast_unknown()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Unknown_01_00");	//Мне нечего тебе сказать.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_01");	//(презирающе) Я так и знала!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_03");	//Убирайся с глаз моих, подлец!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_04");	//Не желаю больше тебя слушать!
	B_LogEntry(TOPIC_SARAHTOGUILD,"Я попытался поговорить с Сарой, но она даже и слушать меня не захотела. Пожалуй, стоит вернуться к Лютеро и поговорить с ним об этом.");
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_sorry()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Sorry_01_00");	//Я прошу прощения за тот случай.
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Sorry_01_02");	//Поверь, я очень сожалею, что так получилось и приношу тебе свои извинения.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_03");	//Хммм...(недоверчиво) Я удивлена, что тебе хватило смелости признать это.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_05");	//На этот раз я поверю тебе и приму твои извинения.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_06");	//Но не более того.
	B_LogEntry(TOPIC_SARAHTOGUILD,"Я попытался поговорить с Сарой и вновь наладить с ней хорошие отношения. Думаю, это немного удалось. Однако, мне кажется, что стоит немного повременить с предложением Лютеро, пока Сара окончательно не придет в себя. После всего случившегося, она еще не слишком сильно мне доверяет. Возможно, мне пока стоит попробовать чем-нибудь еще завоевать ее доверие.");
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};

func void dia_sarah_afterimknast_nochoice()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_NoChoice_01_00");	//Пойми, у меня тогда не было выбора. Кантар шантажировал меня!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_02");	//И поэтому ты решил, что лучше подставить меня? (гневно) Ну ты и подлец!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_03");	//Знаешь, что я тебе скажу - ты человек, у которого нет ни чести, ни достоинства!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_04");	//Я еще удивлена, что у тебя хватило совести заплатить за меня штраф.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_05");	//И мне кажется, что даже это ты сделал не просто так. Видимо, тебе что-то понадобилось от меня.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_06");	//Я права?
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast,"Нет. Я просто решил исправить свою ошибку.",dia_sarah_afterimknast_no);
	Info_AddChoice(dia_sarah_afterimknast,"В общем, да. У меня есть к тебе одно дельце.",dia_sarah_afterimknast_yes);
};

func void dia_sarah_afterimknast_yes()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Yes_01_00");	//В общем, да. У меня есть к тебе дело...
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Yes_01_02");	//Я не имею дел с такими мерзавцами, как ты!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Yes_01_03");	//Так что лучше убирайся с глаз моих!
	B_LogEntry(TOPIC_SARAHTOGUILD,"Я попытался поговорить с Сарой, но она даже и слушать меня не захотела. Пожалуй, стоит вернуться к Лютеро и поговорить с ним об этом.");
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_no()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_No_01_00");	//Нет. Я просто решил исправить свою ошибку.
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_No_01_01");	//Поверь, я сожалею, что так получилось и приношу тебе свои извинения.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_No_01_03");	//На этот раз я поверю тебе и приму их.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_No_01_04");	//Но не более того.
	B_LogEntry(TOPIC_SARAHTOGUILD,"Я попытался поговорить с Сарой и вновь наладить с ней хорошие отношения. Думаю, это немного удалось. Однако, мне кажется, что стоит немного повременить с предложением Лютеро, пока Сара окончательно не придет в себя. После всего случившегося, она еще не слишком сильно мне доверяет. Возможно, мне пока стоит попробовать чем-нибудь еще завоевать ее доверие.");
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};


instance DIA_SARAH_FUCKOFF(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 10;
	condition = dia_sarah_fuckoff_condition;
	information = dia_sarah_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_fuckoff_condition()
{
	if((SARAPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SARAH_SARAHELPSONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsone_condition;
	information = dia_sarah_sarahelpsone_info;
	permanent = FALSE;
	description = "Ты неважно выглядишь.";
};


func int dia_sarah_sarahelpsone_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsone_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_01_00");	//Ты неважно выглядишь.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_01");	//Я уже целый день ничего не ела и очень голодна.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_03");	//Но у меня нет денег, чтобы заплатить за еду.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_05");	//Так что, пока я не нашла себе новую работу - придется немного поголодать.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	Info_AddChoice(dia_sarah_sarahelpsone,"Понятно.",dia_sarah_sarahelpsone_no);
	Info_AddChoice(dia_sarah_sarahelpsone,"Я принесу тебе еды.",dia_sarah_sarahelpsone_yes);
};

func void dia_sarah_sarahelpsone_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_No_01_00");	//У меня нет на это времени.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Думаю, теперь Сара не захочет со мной разговаривать о предложении Лютеро.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsone_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_Yes_01_01");	//Я принесу тебе еды.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_Yes_01_02");	//(улыбается) Спасибо тебе.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_Yes_01_03");	//Думаю, двух кусков прожаренного мяса и бутылки молока будет вполне достаточно, чтобы немного утолить мой голод.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	MIS_SARAHELPSONE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSONE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSONE,"Сара очень голодна, и я решил принести ей еды. Она попросила два куска прожаренного мяса и бутылку молока.");
};


instance DIA_SARAH_SARAHELPSONEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsonedone_condition;
	information = dia_sarah_sarahelpsonedone_info;
	permanent = FALSE;
	description = "Я принес тебе поесть.";
};


func int dia_sarah_sarahelpsonedone_condition()
{
	if((MIS_SARAHELPSONE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 2) && (Npc_HasItems(hero,ItFo_Milk) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsonedone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOneDone_01_00");	//Я принес тебе поесть. Вот, возьми.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_01");	//Благодарю тебя.
	Npc_RemoveInvItems(other,ItFoMutton,2);
	Npc_RemoveInvItems(other,ItFo_Milk,1);
	CreateInvItems(self,ItFoMutton,2);
	CreateInvItems(self,ItFo_Milk,1);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_02");	//Этой еды мне хватит на какое-то время.
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_03");	//Мммм... Как вкусно!
	B_UseItem(self,ItFo_Milk);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_04");	//После тех помоев, которыми кормили меня в тюрьме - эта еда кажется пищей богов!
	MIS_SARAHELPSONE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSONE,"Я принес Саре поесть.");
	SARAHELPSONEDONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_06");	//И знаешь, после всего, что ты для меня сделал - мне кажется, тебе можно доверять.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_07");	//Ведь мерзавцы, вроде того Кантара, так бы никогда не поступили. А ты помог мне в тяжелой ситуации!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_08");	//Ты хороший человек!
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Кажется, теперь Сара мне доверяет и считает меня хорошим человеком. Думаю, пора поговорить с ней насчет предложения Лютеро.");
	};
};


instance DIA_SARAH_SARAHELPSTWO(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwo_condition;
	information = dia_sarah_sarahelpstwo_info;
	permanent = FALSE;
	description = "Тебя что-то беспокоит?";
};


func int dia_sarah_sarahelpstwo_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwo_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwo_01_00");	//Тебя что-то беспокоит?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_03");	//У меня была с собой одна вещица - фамильное драгоценное кольцо, которое мне подарили мои родители на память.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_04");	//Но когда я находилась в тюрьме, один из охранников отнял его у меня!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_05");	//Подонок! Я до сих пор помню, с каким жадным лицом он сдирал его с моего пальца!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_13");	//Теперь он навряд ли мне отдаст это кольцо.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	Info_AddChoice(dia_sarah_sarahelpstwo,"У меня нет на это времени.",dia_sarah_sarahelpstwo_no);
	Info_AddChoice(dia_sarah_sarahelpstwo,"Я помогу тебе вернуть это кольцо.",dia_sarah_sarahelpstwo_yes);
};

func void dia_sarah_sarahelpstwo_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_No_01_00");	//У меня нет на это времени.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Думаю, теперь Сара не захочет со мной разговаривать о предложении Лютеро.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpstwo_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwo_Yes_01_00");	//Я помогу тебе вернуть это кольцо.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_01");	//Правда? Это было бы так мило с твоей стороны!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_02");	//Кажется, того охранника, что отнял у меня мое кольцо, звали Болтан.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_03");	//Только будь с ним поосторожнее - он еще тот подонок!
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	MIS_SARAHELPSTWO = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTWO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Сара очень расcтроена. Охранник по имени Болтан отнял у нее фамильное кольцо. Саре очень дорога эта вещица, и она хотела бы его вернуть.");
};


instance DIA_SARAH_SARAHELPSTWODONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwodone_condition;
	information = dia_sarah_sarahelpstwodone_info;
	permanent = FALSE;
	description = "Я принес твое кольцо.";
};


func int dia_sarah_sarahelpstwodone_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,itri_sarafamilyring) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwodone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwoDone_01_00");	//Я принес твое кольцо.
	B_GiveInvItems(other,self,itri_sarafamilyring,1);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_03");	//О, Иннос! Как я благодарна тебе!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_04");	//Однако мне даже нечем тебя отблагодарить...
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_06");	//Но все же спасибо тебе!
	MIS_SARAHELPSTWO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Я принес Саре ее фамильное кольцо.");
	SARAHELPSTWODONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_07");	//И знаешь, после всего, что ты для меня сделал - мне кажется, тебе можно доверять.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_08");	//Ведь мерзавцы, вроде того Кантара, так бы никогда не поступили. А ты помог мне в тяжелой ситуации!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_09");	//Ты хороший человек!
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Кажется, теперь Сара мне доверяет и считает меня хорошим человеком. Думаю, пора поговорить с ней насчет предложения Лютеро.");
	};
};


instance DIA_SARAH_SARAHELPSTHREE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthree_condition;
	information = dia_sarah_sarahelpsthree_info;
	permanent = FALSE;
	description = "Могу я еще чем-то тебе помочь?";
};


func int dia_sarah_sarahelpsthree_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAREFUSEHELPS == FALSE) && (SARAPROOFBEFRIEND == TRUE) && ((SARAHELPSTWODONE == TRUE) || (SARAHELPSONEDONE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthree_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_00");	//Могу я тебе еще чем-то помочь?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_05");	//Понимаешь, я задолжала немного денег кузнецу Хараду за последнюю партию оружия.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_06");	//Тогда я просто не успела с ним до конца расплатиться. А сейчас у меня и гроша за душой нет!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_08");	//Конечно, Харад - человек неплохой и понимает трудности других людей, но мне от этого не легче.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_09");	//Я привыкла честно вести свое дело и всегда платить по долгам.
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_10");	//Я понимаю тебя. И что же нужно сделать?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_11");	//Поэтому если бы ты смог заплатить за меня Хараду ту недостающую сумму - я бы была тебе очень признательна за это!
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_12");	//А сколько ты еще должна Хараду?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_13");	//Сумма совсем немаленькая - две тысячи золотых монет.
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	Info_AddChoice(dia_sarah_sarahelpsthree,"Извини, но это мне не по карману.",dia_sarah_sarahelpsthree_no);
	Info_AddChoice(dia_sarah_sarahelpsthree,"Я разберусь с этим.",dia_sarah_sarahelpsthree_yes);
};

func void dia_sarah_sarahelpsthree_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_No_01_00");	//Извини, но это мне не по карману.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_No_01_01");	//Я понимаю...
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Думаю, теперь Сара не захочет со мной разговаривать о предложении Лютеро.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsthree_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_Yes_01_00");	//Я разберусь с этим.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_01");	//(удивленно) Ты и вправду это сделаешь?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_03");	//Благослови тебя Иннос!
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_Yes_01_05");	//В конце концов, все это случилось по моей вине - так что мне и разбираться с этим.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_06");	//Хорошо, как скажешь. Однако я все равно тебе благодарна за помощь!
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	MIS_SARAHELPSTHREE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTHREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSTHREE,"Сара задолжала кузнецу Хараду денег. Я вызвался решить эту проблему... проблему ценой в две тысячи золотых монет.");
};


instance DIA_SARAH_SARAHELPSTHREEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthreedone_condition;
	information = dia_sarah_sarahelpsthreedone_info;
	permanent = FALSE;
	description = "Я отдал Хараду твой долг.";
};


func int dia_sarah_sarahelpsthreedone_condition()
{
	if((MIS_SARAHELPSTHREE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARADOBTPAYED == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthreedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThreeDone_01_00");	//Я отдал Хараду твой долг.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_01");	//Спасибо! Теперь я смогу без стыда смотреть ему в глаза.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_02");	//Благодарю тебя!
	MIS_SARAHELPSTHREE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSTHREE,"Сара поблагодарила меня за то, что я отдал Хараду ее долг.");
	SARAHELPSTHREEDONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_04");	//И знаешь, после всего, что ты для меня сделал - мне кажется, тебе можно доверять.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_05");	//Ведь мерзавцы, вроде того Кантара, так бы никогда не поступили. А ты помог мне в тяжелой ситуации!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_06");	//Ты хороший человек!
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Кажется, теперь Сара мне доверяет и считает меня хорошим человеком. Думаю, пора поговорить с ней насчет предложения Лютеро.");
	};
};


instance DIA_SARAH_SARAHTOGUILD(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahtoguild_condition;
	information = dia_sarah_sarahtoguild_info;
	permanent = TRUE;
	description = "У меня есть к тебе одно дело.";
};


func int dia_sarah_sarahtoguild_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPYOU == TRUE) && (SARAAGREE == FALSE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_00");	//У меня есть к тебе дело.
	if(SARAPROOFBEFRIEND == TRUE)
	{
		if(SARABEFRIEND == TRUE)
		{
			B_GivePlayerXP(250);
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_01");	//И в чем оно заключается?
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_02");	//Ты знаешь торговца по имени Лютеро?
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_03");	//Конечно! (улыбается) Кто же его не знает - он ведь один из самых крупных торговцев Хориниса.
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_04");	//Он предлагает тебе работу, а именно вступить в гильдию торговцев.
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_13");	//Правда? Я согласна!
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_14");	//Многие торговцы об этом мечтают. Это действительно вернет меня к жизни.
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_15");	//Отлично. Я передам твои слова Лютеро.
			SARAAGREE = TRUE;
			B_LogEntry(TOPIC_SARAHTOGUILD,"Сара согласилась на предложение, которое сделал ей Лютеро. Теперь надо вернуться к нему и рассказать эту новость.");
			AI_StopProcessInfos(self);
		}
		else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE))
		{
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_28");	//Извини, но я не разговариваю о делах с людьми, которым не доверяю.
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_31");	//Так что ты напрасно тратишь свое время - я не стану обсуждать с тобой никаких дел, пока не начну полностью доверять тебе.
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_35");	//Извини, но я пока не совсем тебе доверяю, чтобы обсуждать с тобой какие-то дела.
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_36");	//А разве я еще не доказал тебе - что мне можно доверять?
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_37");	//(недоверчиво) Ну, только отчасти...
			if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_38");	//Конечно, я благодарна тебе за то, что ты принес мне немного еды.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_39");	//Безусловно, вернуть мне мое кольцо было очень мило с твоей стороны...
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_40");	//Конечно, я благодарна тебе за то, что ты принес мне немного еды.
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_41");	//Вернуть мне мое кольцо - тоже было очень мило с твоей стороны...
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_42");	//Конечно, я благодарна тебе за то, что ты принес мне немного еды.
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_43");	//И то, что ты заплатил за меня долг Хараду - тоже, безусловно, говорит в твою пользу.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_44");	//Вернуть мне мое кольцо было очень мило с твоей стороны...
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_45");	//И то, что ты заплатил за меня долг Хараду - тоже, безусловно, говорит в твою пользу.
			};
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_46");	//Однако этого мало, чтобы начать тебе полностью доверять.
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_47");	//Пойми меня правильно - я просто боюсь, что ты опять меня втянешь в какую-нибудь грязную историю.
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_50");	//А в чем оно заключается?
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_51");	//Ты знаешь торговца по имени Лютеро?
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_52");	//Конечно! (улыбается) Кто же его не знает - он ведь один из самых крупных торговцев Хориниса.
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_53");	//Он предлагает тебе работу, а именно вступить в гильдию торговцев.
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_54");	//Правда? Я согласна!
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_58");	//Многие торговцы об этом мечтают. Это действительно вернет меня к жизни.
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_60");	//Отлично. Я передам твои слова Лютеро.
		SARAAGREE = TRUE;
		B_LogEntry(TOPIC_SARAHTOGUILD,"Сара согласилась на предложение, которое сделал ей Лютеро. Теперь надо вернуться к нему и рассказать эту новость.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_SARAH_SARAHELPYOUDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpyoudone_condition;
	information = dia_sarah_sarahelpyoudone_info;
	permanent = TRUE;
	description = "Как тебе новое место?";
};

func int dia_sarah_sarahelpyoudone_condition()
{
	if(SARAHELPYOUDONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpyoudone_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpYouDone_01_00");	//Как тебе новое место?
	AI_Output(self,other,"DIA_Sarah_SaraHelpYouDone_01_01");	//Благодарю тебя за все, что ты для меня сделал!
};