
instance DIA_RATFORD_EXIT(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 999;
	condition = dia_ratford_exit_condition;
	information = dia_ratford_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ratford_exit_condition()
{
	return TRUE;
};

func void dia_ratford_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_HALLO(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_hallo_condition;
	information = dia_ratford_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ratford_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DRAXHASRING == FALSE) && (RatfordCap == FALSE))
	{
		return TRUE;
	};
};

func void dia_ratford_hallo_info()
{
	AI_Output(self,other,"DIA_Ratford_Hallo_01_00");	//(ворчливо) По всем вопросам к Драксу.
	AI_Output(self,other,"DIA_Ratford_Hallo_01_01");	//Это он у нас разговорчивый.
	AI_Output(other,self,"DIA_Ratford_Hallo_15_00");	//Хммм...
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISK(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fisk_condition;
	information = dia_ratford_fisk_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_ratford_fisk_condition()
{
	if((DRAXHASRING == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void dia_ratford_fisk_info()
{
	AI_Output(self,other,"DIA_Ratford_Fisk_01_00");	//Вижу, тебе можно доверять.
	AI_Output(self,other,"DIA_Ratford_Fisk_01_01");	//Скажи-ка, ты не встречал там в лагере парня по имени Фиск?
	AI_Output(other,self,"DIA_Ratford_Fisk_01_02");	//Фиск? Конечно встречал. А что?

	if(FISK_ISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Ratford_Fisk_15_07");	//Только он.... как-бы это сказать... в общем...
		AI_Output(self,other,"DIA_Ratford_Fisk_01_10");	//ЧТО? Да не тяни ты кота за хвост!
		AI_Output(other,self,"DIA_Ratford_Fisk_15_08");	//В общем, он умер.
		AI_Output(self,other,"DIA_Ratford_Fisk_01_11");	//Вот черт!
		AI_Output(other,self,"DIA_Ratford_Fisk_15_09");	//Что, плохие новости?
		AI_Output(self,other,"DIA_Ratford_Fisk_01_13");	//Ах, неважно - забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Ratford_Fisk_01_03");	//И как он там? Как всегда небось хорошо пристроился.
		AI_Output(other,self,"DIA_Ratford_Fisk_15_02");	//В общем, да, неплохо. Торгует всяким барахлом.
		AI_Output(self,other,"DIA_Ratford_Fisk_01_04");	//Тогда, если вдруг опять его встретишь, передай ему привет от Рэтфорда.
		AI_Output(other,self,"DIA_Ratford_Fisk_15_03");	//И все?
		AI_Output(self,other,"DIA_Ratford_Fisk_01_05");	//И все. Думаю, этого будет вполне достаточно.
		AI_Output(other,self,"DIA_Ratford_Fisk_01_08");	//Ладно, если встречу, - передам привет от тебя.
		AI_Output(self,other,"DIA_Ratford_Fisk_15_05");	//Спасибо, парень.
		MIS_RATFORDFISK = LOG_Running;
		Log_CreateTopic(TOPIC_RATFORDFISK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RATFORDFISK,LOG_Running);
		B_LogEntry(TOPIC_RATFORDFISK,"Рэтфорд попросил меня передать привет Фиску при встрече.");
	};

	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISKOK(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fiskok_condition;
	information = dia_ratford_fiskok_info;
	permanent = FALSE;
	description = "Я передал Фиску привет...";
};

func int dia_ratford_fiskok_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == TRUE) && (Npc_HasItems(other,itmi_fiskpacket) > 0))
	{
		return TRUE;
	};
};

func void dia_ratford_fiskok_info()
{
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_00");	//Я передал Фиску привет от тебя.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_01");	//Да? И что?
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_02");	//Он просил передать тебе вот этот пакет.
	B_GiveInvItems(other,self,itmi_fiskpacket,1);
	Npc_RemoveInvItems(self,itmi_fiskpacket,1);
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_03");	//Вот это другое дело! Ах он старый плут...(смеется)
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_04");	//А что у тебя за дела с Фиском?
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_05");	//До того как рухнул Барьер, я сбывал Фиску разного рода барахло - в основном, конечно, охотничьи трофеи.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_06");	//Так получилось, что за последнюю партию товара Фиск не успел расплатиться из-за всех этих событий тут.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_07");	//Ну и задолжал мне некоторую сумму. В общем, обычное дело.
	AI_Output(other,self,"DIA_Ratford_FiskOk_01_08");	//Ну, тогда все ясно. Видимо, поэтому у него было такое недовольное лицо, когда я заикнулся про тебя.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_09");	//М-да, по-прежнему такой же жмот - а что ты хочешь от торговца.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_10");	//Ну да ладно. Наверное, мне стоит отблагодарить тебя за помощь...
	if(Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_11");	//Ты же тоже охотник, как я погляжу. Вот, возьми эти охотничьи трофеи. Наверняка найдешь кому продать подороже.
		CreateInvItems(self,ItAt_ShadowHorn,5);
		B_GiveInvItems(self,other,ItAt_ShadowHorn,5);
	}
	else if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_12");	//Я вижу, ты разбираешся в ковке. Возьми эти стальные заготовки. Наверняка сможешь сделать из них что-то толковое.
		CreateInvItems(self,ItMiSwordraw,5);
		B_GiveInvItems(self,other,ItMiSwordraw,5);
	}
	else if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_13");	//Я вижу, ты неплохо разбираешся в травах. Вот, возьми вот эту редкую штуку. Говорят, она невероятно ценная!
		CreateInvItems(self,ItPl_Perm_Herb,1);
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Ratford_FiskOk_01_14");	//Немножно золотишка - это все, что я могу дать.
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	};
	B_LogEntry(TOPIC_RATFORDFISK,"Я передал Рэтфорду пакет, который дал мне Фиск.");
	Log_CreateTopic(TOPIC_RATFORDFISK,LOG_SUCCESS);
	MIS_RATFORDFISK = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Capitan(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_condition;
	information = DIA_Ratford_Capitan_info;
	permanent = FALSE;
	description = "Я слышал, ты был капитаном корабля.";
};

func int DIA_Ratford_Capitan_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordCap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ratford_Capitan_01_00");	//Я слышал, ты был капитаном корабля.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_01");	//(ухмыляясь) Ну да, был когда-то.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_02");	//А ты не хочешь вновь отправиться в небольшое морское путешествие?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_03");	//Что? О чем это ты, парень?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_04");	//О том, что мне позарез нужен капитан, готовый выйти в открытое море.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_05");	//Хммм...(ухмыляясь) Для этого нужно иметь корабль. Он у тебя есть?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_06");	//Конечно. И ты его увидишь, если прямо сейчас посмотришь вниз.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_07");	//Ты что, имеешь в виду дракар орков?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_08");	//В точку!
	AI_Output(self,other,"DIA_Ratford_Capitan_01_09");	//Ты что, спятил, приятель! Орки и близко тебя не подпустят к нему.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_10");	//Они все уже давно мертвы.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_11");	//Так что сейчас дракар пуст и ждет того момента, когда им кто-нибудь воспользуется.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_12");	//Вот это новость! Ну, если так, тогда я, конечно, в деле.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_13");	//А ты уверен, что справишься с ним?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_14");	//Справлюсь, не сомневайся! И куда ты хочешь плыть?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_15");	//Сам я пока что никуда не собираюсь. Твоим боссом будет наемник по имени Сильвио.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_16");	//А с ним еще десяток головорезов. 
	AI_Output(other,self,"DIA_Ratford_Capitan_01_17");	//И насколько мне известно, они задумали плыть на материк.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_18");	//Тогда мне понадобится карта. Иначе мы можем легко сбиться с пути на большой воде.
	AI_Output(self,other,"DIA_Ratford_Capitan_01_19");	//И еще пятьсот золотых за работу. Бесплатно я не стану ему помогать.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_20");	//Хорошо. Насчет оплаты я договорюсь. А что за карта тебе нужна?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_21");	//Обычная морская карта, на которой показан курс до материка.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_22");	//И где же мне ее взять?
	AI_Output(self,other,"DIA_Ratford_Capitan_01_23");	//Наверняка ее можно раздобыть в городе. А без нее я в море не выйду. Даже не проси.
	AI_Output(other,self,"DIA_Ratford_Capitan_01_24");	//Хорошо, попробую достать ее для тебя.
	RatfordNeedMap = TRUE;
	B_LogEntry(Topic_SylvioCrew,"Рэтфорд согласился быть капитаном. Но чтобы отплыть на материк, ему нужна морская карта с проложенным курсом.");
};

instance DIA_Ratford_Capitan_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_Done_condition;
	information = DIA_Ratford_Capitan_Done_info;
	permanent = FALSE;
	description = "Вот твоя карта.";
};

func int DIA_Ratford_Capitan_Done_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_HasItems(hero,ItWr_Seamap_Mirtana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_00");	//Вот твоя карта.
	B_GiveInvItems(other,self,ItWr_Seamap_Mirtana,1);
	Npc_RemoveInvItems(self,ItWr_Seamap_Mirtana,1);
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_01");	//Ну-ка, давай взглянем на нее.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_02");	//Да, превосходно! То что надо.
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_03");	//Теперь ты готов встать за штурвал дракара?
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_04");	//Естественно. Как мы и договаривались.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_05");	//Но только не забудь, что тот парень мне еще должен пятьсот золотых!
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_06");	//Конечно. Ты их получишь, можешь не сомневаться.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_07");	//Тогда я отправляюсь на корабль и буду ждать их там.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_08");	//Дракс, кстати, тоже изъявил желание покинуть этот остров.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_09");	//Так что он идет со мной.
	AI_Output(other,self,"DIA_Ratford_Capitan_Done_01_10");	//Дракар большой. Думаю, места всем хватит.
	AI_Output(self,other,"DIA_Ratford_Capitan_Done_01_11");	//Ладно, тогда увидимся.
	RatfordAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_condition;
	information = DIA_Ratford_SylvioDebts_info;
	permanent = FALSE;
	description = "Что-то не так?";
};

func int DIA_Ratford_SylvioDebts_condition()
{
	if((MoveDracarBoard == TRUE) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_info()
{
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_00");	//Что-то не так?
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_01");	//Этот проклятый механизм... похоже, он сломан!
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_02");	//А ты можешь его починить?
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_03");	//Думаю, да. Но это займет какое-то время.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_04");	//Кстати, твой приятель Сильвио так и не заплатил мне.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_05");	//Был же уговор - пятьсот монет!
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_01_06");	//А он меня постоянно завтраками кормит.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_01_07");	//Я поговорю с ним.
	MIS_SylvioDebts = LOG_Running;
	Log_CreateTopic(Topic_SylvioDebts,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Running);
	B_LogEntry(Topic_SylvioDebts,"Сильвио до сих пор не заплатил Рэтфорду. Мне надо разобраться с этим, ведь я дал ему слово.");
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_Done_condition;
	information = DIA_Ratford_SylvioDebts_Done_info;
	permanent = FALSE;
	description = "Вот твои деньги.";
};

func int DIA_Ratford_SylvioDebts_Done_condition()
{
	if((SylvioIsDead == TRUE) && (MIS_SylvioDebts == LOG_Running) && (Npc_HasItems(hero,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_00");	//Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_01");	//Спасибо. А как тебе удалось выбить их из него?
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_02");	//Я просто прикончил ублюдка.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_03");	//(смеется) Я смотрю, с тобой шутки плохи.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_04");	//Да - особенно когда не держат свое слово.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_05");	//Ладно. Надеюсь, меня ты не станешь убивать.
	AI_Output(other,self,"DIA_Ratford_SylvioDebts_Done_01_06");	//Ну, ты мне вроде ничего не должен.
	AI_Output(self,other,"DIA_Ratford_SylvioDebts_Done_01_07");	//Это точно, приятель. Ничего!
	MIS_SylvioDebts = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Success);
	B_LogEntry(Topic_SylvioDebts,"Я отдал деньги Рэтфорду.");
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Drakar_Perm(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_Drakar_Perm_condition;
	information = DIA_Ratford_Drakar_Perm_info;
	permanent = TRUE;
	description = "Как продвигается починка?";
};

func int DIA_Ratford_Drakar_Perm_condition()
{
	if((MIS_SylvioDebts == LOG_Success) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_Ratford_Drakar_Perm_01_00");	//Как продвигается починка?
	AI_Output(self,other,"DIA_Ratford_Drakar_Perm_01_01");	//Делаю что могу...(пожимая плечами) Тут не все так просто!
	AI_Output(other,self,"DIA_Ratford_Drakar_Perm_01_02");	//Понимаю.
};