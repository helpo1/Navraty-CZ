var int GregCanPray;
var int FindPirate_01;
var int FindPirate_02;

instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	if((GregCanPray == TRUE) && (MIS_PiratePray == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_00");	//Постой! У меня к тебе есть одна небольшая просьба.
		AI_Output(other,self,"DIA_Addon_Greg_Pray_01_01");	//Какая?
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_02");	//(вздыхая) Знаешь, я никогда не был верующим человеком.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_03");	//Но случай с кольцом заставил меня кое о чем задуматься.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_04");	//Так вот. Не мог бы ты сходить в монастырь и попросить там кого-нибудь помолиться за души моих людей?
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_05");	//Поверь мне - я щедро отблагодарю тебя за это.
		AI_Output(other,self,"DIA_Addon_Greg_Pray_01_06");	//Это будет непросто. Но я постараюсь.
		AI_Output(self,other,"DIA_Addon_Greg_Pray_01_07");	//Хорошо. Я надеюсь на тебя, парень!
		MIS_PiratePray = LOG_Running;
		Log_CreateTopic(TOPIC_PiratePray,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Running);
		B_LogEntry(TOPIC_PiratePray,"Грэг попросил меня сходить в монастырь и попросить кого-нибудь помолиться за души его людей. Похоже, история с кольцом на него серьезно подействовала.");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(угрожающе) Эй, ты! Что ты делаешь в моей хижине?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Я...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(в ярости) Стоит уехать на несколько дней, и вот уже каждый проходимец норовит похозяйничать в моем жилище.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Какого черта, что здесь происходит?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Частокол еще не закончен! Каньон просто кишит зверьем, а все только и делают, что слоняются вокруг.
	GregIsBack = TRUE;
	if(!Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(кричит) И это все, что ты сделал, Фрэнсис?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(кричит) Немедленно слезь с моей скамейки!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//А ТЫ? Что ТЫ сделал?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"Пока не так много.",DIA_Addon_Greg_ImNew_nich);
	if((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0)) || (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"Я работал.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//И не думай, что я забыл, что ты мой должник.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//В различных местах Хориниса я зарыл несколько сотен золотых монет.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ты их прикарманил, не так ли?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Я заставлю тебя отработать все до последнего медяка.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Я покажу тебе, что значит вкалывать по-черному.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Пока не так много.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//Неважно. Я что-нибудь подберу тебе, дружище.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Я работал.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Правда? И что?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Я разобрался с бандитами из башни.
	};
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//На побережье к северу больше нет диких зверей.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Ну что ж. Полагаю, хорошее начало.
	B_UseRakeBilanz();
};

instance DIA_Addon_Greg_SmokePipe(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = DIA_Addon_Greg_SmokePipe_Condition;
	information = DIA_Addon_Greg_SmokePipe_Info;
	permanent = FALSE;
	description = "Я вижу, что ты куришь трубку.";
};

func int DIA_Addon_Greg_SmokePipe_Condition()
{
	if((GregHasPipe == TRUE) && (MIS_JackSmokePipe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_SmokePipe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_00");	//Я смотрю, ты куришь трубку.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_01");	//Ну да, наблюдательности тебе не занимать. 
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_02");	//А с чего это вдруг ты решил спросить об этом?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_03");	//Просто мне нужна такая же.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_04");	//Тебе нужна трубка? И на кой черт она тебе понадобилась?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_05");	//Мне она ни к чему. Это для одного старого морского волка вроде тебя.
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_06");	//Его старая трубка осыпалась, а новую он найти нигде не может.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_07");	//Хммм. (задумчиво) И как же зовут этого твоего моряка?
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_08");	//Джек. Он сейчас присматривает за маяком в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_09");	//(удивленно) Старина Джек? Ну да, я его помню. Ходили в плавание когда-то вместе!
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_10");	//Он тоже был пиратом?
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_11");	//Был. И, насколько мне помнится, довольно лихим!
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_12");	//И то, что он сейчас остался без трубки, - это не совсем хорошо.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_13");	//К своей, например, я уже привык так, как будто она - часть меня самого!
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_14");	//Как и он к своей, я думаю.
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_15");	//И что мы можем сделать?
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_16");	//На твое счастье у меня есть еще одна трубка, которой я уже давно не пользуюсь.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_17");	//Я могу отдать ее тебе, но при условии, что ты отнесешь ее Джеку.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_18");	//И смотри - если я узнаю, что ты присвоил трубку себе, - я с тебя шкуру живьем спущу! Понял?!
	AI_Output(other,self,"DIA_Addon_Greg_SmokePipe_01_19");	//Само собой.
	AI_Output(self,other,"DIA_Addon_Greg_SmokePipe_01_20");	//Хорошо. Тогда вот, держи. И передай Джеку от меня привет!
	B_GiveInvItems(self,other,ItMi_Smoke_Pipe,1);
	B_LogEntry(TOPIC_JackSmokePipe,"Грэг дал мне трубку, чтобы я отнес ее Джеку.");
	FindPirate_02 = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_DiscoverLH(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_DiscoverLH_Condition;
	information = DIA_Addon_Greg_DiscoverLH_Info;
	description = "Ты когда-нибудь слышал про пирата по прозвищу 'Келевра'?";
};

func int DIA_Addon_Greg_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (CanGoGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_DiscoverLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Greg_DiscoverLH_01_00");	//Ты когда-нибудь слышал про пирата по прозвищу Келевра?
	AI_Output(self,other,"DIA_Addon_Greg_DiscoverLH_01_01");	//И не только слышал. Мы с ним в одной команде моря бороздили.
	AI_Output(other,self,"DIA_Addon_Greg_DiscoverLH_01_02");	//А не знаешь, где он сейчас?
	AI_Output(self,other,"DIA_Addon_Greg_DiscoverLH_01_03");	//Понятия не имею. Лет десять его уже не видел.
	B_LogEntry(TOPIC_HauntedLighthouse,"Грэг когда-то был знаком с пиратом по имени 'Келевра'. Но не видел его уже много лет, и где его искать тоже не знает.");
	FindPirate_01 = TRUE;
};

instance DIA_Addon_Greg_GotPirate(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_GotPirate_Condition;
	information = DIA_Addon_Greg_GotPirate_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Greg_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindPirate_01 == TRUE) && (FindPirate_02 == TRUE) && (JackMainIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_GotPirate_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_GotPirate_01_00");	//Эй! Ты спрашивал меня про пирата по прозвищу 'Келевра'?
	AI_Output(self,other,"DIA_Addon_Greg_GotPirate_01_02");	//Так вот... Когда отдашь мою старую трубку тому, кому собирался ее отдать - то найдешь его.
	GotPirate = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Вот так поворот! Похоже, пиратом, убившим смотрителя на проклятом маяке, был не кто иной, как сам Джек! Придется поговорить с ним по душам...");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "Что нужно сделать?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Что нужно сделать?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Прежде всего необходимо разобраться с делами здесь.
	if(Npc_IsDead(Morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Эта ленивая свинья Морган будет пилить древесину.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//А ты займешься работой Моргана и очистишь каньон от этих проклятых зверей.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Грэг хочет, чтобы я взял на себя работу Моргана и очистил каньон от зверей.");
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"В таком случае мне пора.",DIA_Addon_Greg_JoinPirates_Leave);
	if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Я что, должен делать это в одиночку?",DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Что это за звери?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//Ну тогда я отправляюсь.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Еще кое-что. Теперь ты один из нас.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Поэтому найди сначала нормальную одежду охотника.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Вот, надень это! Надеюсь, это снаряжение тебе придется впору.
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//И не мешкай. Скорее принимайся за дело.
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Я что, должен делать это в одиночку?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Можешь захватить с собой парней.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Пусть отрабатывают свою зарплату.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Грэг сказал, что я могу взять с собой нескольких ребят.");
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Что это за звери?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//Бритвозубы в каньоне все ближе подбираются к нашему лагерю.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Я не собираюсь ждать, пока они сожрут кого-нибудь из моих людей.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Охотиться я должен на бритвозубов.");
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "Насчет каньона...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//Насчет каньона...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Да, что там?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Мне кто-нибудь может помочь?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"А что это за звери, которых я должен убить?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Я уничтожил всех бритвозубов.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Мне кто-нибудь может помочь?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Захвати с собой пару ребят.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Они все равно болтаются без дела.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//А что это за звери, которых я должен убить?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Избавься от бритвозубов! Другие существа неопасны.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Я уничтожил всех бритвозубов.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Хорошо. Похоже, от тебя есть польза.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Грэг был впечатлен, когда я сообщил ему, что убил всех бритвозубов в каньоне.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "Мне нужны бандитские доспехи.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Мне нужны бандитские доспехи.

	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Сначала покажи, на что ты способен. После этого поговорим.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Сначала ты должен убить всех бритвозубов!
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Грэг хочет, чтобы я помог ему навести порядок в лагере. После этого я смогу поговорить с ним о доспехах.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//А ты молодец!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Следить за бандитами должен был Бонес. Для него и предназначались эти доспехи.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Но, быть может, для этой работы больше подойдет ТВОЯ кандидатура.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Возможно, у тебя даже получится выбраться оттуда живым.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Поговори с Бонесом, чтобы он дал тебе броню. Потом надевай ее и отправляйся в лагерь бандитов.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Я хочу узнать, почему эти ублюдки приперлись в нашу долину.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Будет сделано, капитан!
		B_LogEntry(TOPIC_Addon_BDTRuestung,"После того как я закончу, я смогу забрать доспехи у Бонеса.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_ScoutBandits,"Я должен узнать, для чего бандиты пришли в долину, и сообщить Грэгу.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "Есть для меня еще работа?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != 0) && ((C_TowerBanditsDead() == FALSE) || ((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Есть для меня еще работа?
	if((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Северное побережье все еще населяют звери.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Похоже, Морган ничего не сделал.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Грэг хочет, чтобы я очистил кишащий монстрами пляж.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//В южной башне все еще есть бандиты.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Фрэнсис должен был уже давно с ними разобраться, но ничего не сделал.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Грэг попросил меня разобраться с бандитами, занявшими башню к югу от лагеря.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Думаю, ты можешь этим заняться.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "На северном пляже теперь безопасно.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//На северном побережье теперь безопасно.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Отлично. Держи свою награду.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Я доложил Грэгу, что пляж на севере очищен от монстров.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "Бандиты в башне уничтожены.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Бандиты в башне уничтожены.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Прекрасно. Хорошая работа. Вот твоя награда.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Бандиты из башни мертвы. Грэг очень доволен.");
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "Бандиты нашли шахту с золотом.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Бандиты нашли шахту с золотом.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Я так и знал! Вот почему они приперлись сюда.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Никто не захочет жить в этой дыре.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Хорошая работа. Вот, держи, у меня для тебя награда.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"Я рассказал Грэгу о золотой шахте.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Я Грэг, предводитель этой ленивой своры.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Тебя устраивает такой ответ?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "А как ты сюда попал?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//А как ты сюда попал?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Не ожидал увидеть меня здесь, да?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Давай сразу расставим точки над 'и'. Я Грэг, и это мой лагерь.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Тебя устраивает такой ответ?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "Я хотел бы знать еще кое-что.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if(((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) == TRUE) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) == TRUE)) && (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Я хотел бы знать еще кое-что.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Что именно?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"Как ты сюда попал?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"А где твой корабль?",DIA_Addon_Greg_Story_Ship);

	if(RavenAway == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"Что ты знаешь о Вороне?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Я обнаружил вход в тоннель возле древней пирамиды, которую охраняли несколько магов.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Мне удалось незаметно проскользнуть мимо этих слепцов.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Сначала я принял это место за древний склеп и решил проверить, чем там можно поживиться.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Представь мое удивление, когда я оказался в этой чудесной долине.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//И это произошло как раз в тот момент, когда я уже решил, что весь остаток жизни мне придется скрываться от ополчения.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//А где твой корабль?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//(с сарказмом) Я чертовски удачливый человек. Уже несколько месяцев сюда не приплывали корабли.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Несколько месяцев! И первый корабль, который мне после этого встречается, оказывается боевым кораблем, принадлежащим королю.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Он был битком набит паладинами.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//Да уж, не повезло тебе.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//Вот именно. Они тут же потопили нас. Я единственный, кто добрался до берега.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Что ты знаешь о Вороне?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Он торговал рудой. Довольно крупная шишка в колонии.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Я не имею ни малейшего представления, где он может быть сейчас и почему люди все еще следуют за ним.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Но он явно что-то замышляет. Он-то уж точно не будет отсиживаться в укромном месте.
};

instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "С Вороном покончено...";
};

func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//С Вороном покончено...
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Чтоб меня... Не ожидал я этого... Застал его врасплох, да?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Ну, на мой взгляд, это стоит пятиста золотых монет.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//А ты смелый! Продолжай в том же духе.
};

var int greg_cantradearmor;
var int greg_tradearmor_middle;
var int greg_tradearmor_heavy;

instance DIA_ADDON_GREG_CANTRADEARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 8;
	condition = dia_addon_greg_cantradearmor_condition;
	information = dia_addon_greg_cantradearmor_info;
	permanent = TRUE;
	description = "Как насчет доспехов получше?";
};


func int dia_addon_greg_cantradearmor_condition()
{
	if((GREG_CANTRADEARMOR == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_greg_cantradearmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_CanTradeArmor_01_00");	//Как насчет доспехов получше?
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_01");	//А чем тебя не устраивают эти?
	AI_Output(other,self,"DIA_Addon_Greg_CanTradeArmor_01_02");	//Эти тряпки не слишком хорошо меня защищали от когтей бритвозубов, когда я был в каньоне.
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_03");	//Ты доказал, на что ты способен. Будут тебе новые доспехи.
	AI_Output(self,other,"DIA_Addon_Greg_CanTradeArmor_01_04");	//Только не думай, что я тебе отдам их даром!
	GREG_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_GREG_ARMOR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_armor_condition;
	information = dia_addon_greg_armor_info;
	permanent = TRUE;
	description = "Мне нужна кольчуга получше.";
};


func int dia_addon_greg_armor_condition()
{
	if((GREG_CANTRADEARMOR == TRUE) && ((GREG_TRADEARMOR_MIDDLE == FALSE) || (GREG_TRADEARMOR_HEAVY == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_armor_info()
{
	Info_ClearChoices(dia_addon_greg_armor);
	AI_Output(other,self,"DIA_Addon_Greg_Armor_01_00");	//Мне нужна лучшая кольчуга.
	Info_AddChoice(dia_addon_greg_armor,Dialog_Back,dia_addon_greg_armor_back);
	if(GREG_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_addon_greg_armor,"Доспехи пирата (Цена: 2000 монет)",dia_addon_greg_armor_buy1);
	};
	if((RavenAway == TRUE) && (GREG_TRADEARMOR_HEAVY == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(dia_addon_greg_armor,"Тяжелые доспехи пирата (Цена: 2500 монет)",dia_addon_greg_armor_buy2);
	};
};

func void dia_addon_greg_armor_back()
{
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_M_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy1_01_01");	//Отлично!
		B_GiveInvItems(self,other,ITAR_PIR_M_Addon,1);
		GREG_TRADEARMOR_MIDDLE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy1_01_02");	//Нет денег - нет кольчуги.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};

func void dia_addon_greg_armor_buy2()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_H_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy2_01_01");	//Отлично!
		B_GiveInvItems(self,other,ITAR_PIR_H_Addon,1);
		GREG_TRADEARMOR_HEAVY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_Armor_Buy2_01_02");	//Нет денег - нет кольчуги.
	};
	Info_ClearChoices(dia_addon_greg_armor);
};


instance DIA_ADDON_GREG_MISSGRHUSB(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusb_condition;
	information = dia_addon_greg_missgrhusb_info;
	permanent = FALSE;
	description = "Ты знаешь парня по имени Брендик?";
};


func int dia_addon_greg_missgrhusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusb_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_00");	//Ты знаешь парня по имени Брендик?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_01");	//Брендик? Конечно знаю...(ухмыляется) Отчаянный парень, головорез!
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_03");	//В моей команде все такие - можешь в этом не сомневаться!
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_04");	//Только сейчас его нет в лагере, - ушел на болота несколько недель тому назад.
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_05");	//А как он вообще попал к вам?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_08");	//Пару лет назад мы как-то взяли на абордаж одно торговое судно.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_09");	//Ну и, выпотрошив весь их трюм подчистую, уже решили отвалить - как вдруг какой-то парень попросился к нам на судно.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_13");	//У меня просто тогда людей было маловато. А в нашем деле лишние руки никогда не помешают.
	AI_Output(other,self,"DIA_Addon_Greg_MissGrHusb_01_20");	//Скажи, а что он делает на болотах?
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_21");	//Я его туда послал...(ворчливо) А то с тех пор как мы потеряли наш корабль, парень как-то совсем скис.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusb_01_22");	//А так, у него есть теперь хорошее занятие - следить за лагерем бандитов.
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Брендик действительно стал пиратом. Об этом мне рассказал сам Грэг. Однако в лагере Брендика не оказалось - Грэг послал его на болота следить за бандитами. Придется поискать его там.");
	Wld_InsertNpc(pir_6145_brendik,"ADW_BRENDIK_01");
};


instance DIA_ADDON_GREG_MISSGRHUSBAFTER(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_missgrhusbafter_condition;
	information = dia_addon_greg_missgrhusbafter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_missgrhusbafter_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_greg_missgrhusb) && (MEETBRENDIK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_missgrhusbafter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusbAfter_01_00");	//Да, и чуть не забыл. Если встретишь Брендика - передай ему, чтобы он возвращался в лагерь.
	AI_Output(self,other,"DIA_Addon_Greg_MissGrHusbAfter_01_01");	//У меня для него есть еще одно поручение.
	MEETBRENDIKGREG = TRUE;
};


instance DIA_ADDON_GREG_GATHERARMY(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmy_condition;
	information = dia_addon_greg_gatherarmy_info;
	permanent = FALSE;
	description = "Тут есть одно дельце.";
};


func int dia_addon_greg_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmy_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_02");	//Паладины хотят освободить этот остров от орков и в этом им не помешала бы ваша помощь!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_03");	//Что?! Парень, да ты, видно, шутишь!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_07");	//С какой стати я им должен помогать?
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_08");	//Потому что рано или поздно орки заявятся и сюда.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_09");	//Ха! Насколько мне известно, им пока еще до этого слишком далеко.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_10");	//Не так уж и далеко, поскольку они уже захватили Хоринис. И навряд ли остановятся на достигнутом.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_13");	//Хммм. Тогда, судя по всему, дело действительно паршиво!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_14");	//Эх... Жаль, что у нас нет нашего корабля! А то бы мы уже давно убрались подальше от этого острова.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_18");	//Давай ближе к делу. Так ты согласен помочь им в войне с орками?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_19");	//Хммм...(задумчиво) Я, быть может, и согласен, но не знаю, что скажут обо всем об этом остальные парни.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_21");	//Я не могу заставить их рисковать своей жизнью только потому, что это нужно паладинам.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_22");	//Поэтому они должны предложить нам нечто такое, что нас в свою очередь могло бы заинтересовать.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_23");	//И что вам нужно?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_24");	//Хммм, хороший вопрос... Ну, например, их корабль.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_25");	//Корабль паладинов?!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmy_01_29");	//Не думаю, что паладины вот так просто согласятся отдать вам свой корабль.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_30");	//Ха! В таком случае пускай и от нас они не ждут какой-либо помощи.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmy_01_31");	//Это наше условие.
	MIS_PIRATENEEDSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_PIRATENEEDSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_Running);
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"По словам капитана Грэга, пиратам не помешал бы новый корабль. Если паладины отдадут им свой, то они готовы выступить вместе с ними против орков. Интересно, что на это скажет сам лорд Хаген?");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Я решил поговорить с пиратами насчет их вступления в армию паладинов. Посмотрим, что они на это скажут.");
};


var int gregtellstocrew;

instance DIA_ADDON_GREG_GATHERARMYDONE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydone_condition;
	information = dia_addon_greg_gatherarmydone_info;
	permanent = FALSE;
	description = "Я принес ответ от паладинов.";
};


func int dia_addon_greg_gatherarmydone_condition()
{
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (HAGENINVITEPIRATES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_01_00");	//Я принес ответ от паладинов.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_01");	//Да? И что они сказали?
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_01_02");	//Лорд Хаген согласен отдать вам свой корабль, но при условии, что вы станете паладинами!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_03");	//Кхмм... Нам стать паладинами?!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_04");	//Но мы же пираты! И как ему в голову только пришла подобная мысль?!
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_01_06");	//Это же просто немыслимо - НАМ и пойти на службу к паладинам!
	Info_ClearChoices(dia_addon_greg_gatherarmydone);

	if(RhetorikSkillValue[1] >= 80)
	{
		Info_AddChoice(dia_addon_greg_gatherarmydone,"Ну и что с того?",dia_addon_greg_gatherarmydone_tell);
	};

	Info_AddChoice(dia_addon_greg_gatherarmydone,"Ладно, как скажешь.",dia_addon_greg_gatherarmydone_no);
};

func void dia_addon_greg_gatherarmydone_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_No_01_00");	//Ладно, как скажешь.
	MIS_PIRATENEEDSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
	PIR_JOINHAGENREFUSE = TRUE;
	ALLFRACTIONS = ALLFRACTIONS - 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
	};
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Грэг отказался от предложения лорда Хагена, и я не стал переубеждать его в обратном. Думаю, теперь на помощь с стороны пиратов можно не рассчитывать.");
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_gatherarmydone_tell()
{
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_00");	//Ну и что с того?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_01");	//Как что? На такие условия даже последний идиот не согласился бы!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_04");	//Подумай - у тебя будет новый корабль!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_06");	//Да и потом, всей твоей команде будут прощены старые преступления.
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_07");	//Или, быть может, тебе больше по душе быть повешенным?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_16");	//Ладно...(угрюмо) Считай, что убедил меня! Но только это еще ничего не значит.
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_17");	//Для начала мне надо посовещаться с командой. А уж потом мы решим - подходит ли нам это или нет!
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDone_Tell_01_18");	//И когда дашь ответ?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDone_Tell_01_19");	//Будет лучше, если мы поговорим об этом завтра.
	GREGFLAGCONTI = TRUE;
	GREGTELLSTOCREW = Wld_GetDay();
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Мне удалось убедить Грэга принять условия лорда Хагена. Теперь надо подождать, что скажут остальные пираты из его команды.");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_GATHERARMYDONEEXTR(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_gatherarmydoneextr_condition;
	information = dia_addon_greg_gatherarmydoneextr_info;
	permanent = FALSE;
	description = "Так что вы решили?";
};


func int dia_addon_greg_gatherarmydoneextr_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_PIRATENEEDSHIP == LOG_Running) && (GREGFLAGCONTI == TRUE) && (GREGTELLSTOCREW < daynow))
	{
		return TRUE;
	};
};

func void dia_addon_greg_gatherarmydoneextr_info()
{
	var int countpir;
	var int overallpir;
	AI_Output(other,self,"DIA_Addon_Greg_GatherArmyDoneExtr_01_00");	//Так что вы решили?
	AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_01");	//Ну...(задумчиво) В общем, я тут поговорил со всеми своими парнями...
	countpir = 15;
	overallpir = 50;

	if(MIS_AlligatorJack_BringMeat == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Addon_Bill_SearchAngusMurder == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_ADDON_GARett_BringKompass == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(MIS_Owen_FindMalcom == LOG_SUCCESS)
	{
		countpir = countpir + 5;
	};
	if(RavenAway == TRUE)
	{
		countpir = countpir + 5;
	};
	if(countpir >= overallpir)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_02");	//... и мы решили принять предложение паладинов.
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_04");	//И, надеюсь, мы не пожалеем о своем решении!
		PIR_JOINHAGEN = TRUE;
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		B_LogEntry(TOPIC_PIRATENEEDSHIP,"Грэг и его люди приняли предложение лорда Хагена.");
		B_LogEntry_Quiet(TOPIC_ORсGREATWAR,"Надо сообщить лорду Хагену о том, что теперь пираты будут сражаться на стороне паладинов.");
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_06");	//... и мы решили отказаться от предложения паладинов.
		AI_Output(self,other,"DIA_Addon_Greg_GatherArmyDoneExtr_01_07");	//Это все не для нас! Лучше уж мы будем как-нибудь сами по себе, чем под пятой у этих болванов.
		MIS_PIRATENEEDSHIP = LOG_SUCCESS;
		PIR_JOINHAGENREFUSE = TRUE;
		ALLFRACTIONS = ALLFRACTIONS - 1;
		Log_SetTopicStatus(TOPIC_PIRATENEEDSHIP,LOG_SUCCESS);
		if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
		{
			PREGATHERALLONBIGFARM = TRUE;
		};
		B_LogEntry(TOPIC_PIRATENEEDSHIP,"Грэг и его люди отказались от предложения лорда Хагена.");
		B_LogEntry_Quiet(TOPIC_ORсGREATWAR,"Думаю, теперь на помощь со стороны пиратов лорду Хагену рассчитывать не стоит.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_GREG_DOOMRING(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DOOMRING_condition;
	information = dia_addon_greg_DOOMRING_info;
	permanent = FALSE;
	description = "У меня есть к тебе одно дело.";
};

func int dia_addon_greg_DOOMRING_condition()
{
	if(MIS_PirateRing == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_DOOMRING_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_00");	//У меня к тебе дело.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_01");	//Ну выкладывай тогда, не тяни!
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_02");	//Кое-кто прознал, что у тебя есть одно очень необычное кольцо.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_03");	//(мрачно) Может быть и есть. И что с того?
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_04");	//Один могущественный маг хотел бы заполучить его себе, и попросил меня договорится с тобой о цене.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_06");	//(задумчиво) Маг, говоришь? У этого может и получиться.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_07");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_08");	//Парень, я бы и рад отдать тебе это кольцо. Да только не могу!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_09");	//Похоже, на нем висит какое-то темное проклятье. Белиар его дери!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_10");	//И если я отдам его тебе, то, боюсь, что вскоре сам отправлюсь в его объятия.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_11");	//Как же так вышло?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_12");	//Да было дело...(почесывая затылок) 
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_13");	//В общем, один раз нам удалось разграбить очень богатый караван торговых судов, шедших, по всей видимости, в Бакареш.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_14");	//Бакареш?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_15");	//Это один из крупных городов ассасинов, что находится на востоке Варанта.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_16");	//Так вот, среди прочей добычи мое внимание привлекло одно кольцо. Внешне невзрачное, но обладавшее какой-то особой притягательной силой. 
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_17");	//Недолго думая, я решил оставить кольцо себе.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_18");	//Сначала все складывалось так, что лучше и представить нельзя.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_19");	//Наши набеги на торговые караваны и суда были крайне удачны! Мы всегда возвращались с очень богатой добычей.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_20");	//Но как-то раз мы с ребятами решили припрятать большую часть наших сокровищ.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_21");	//Мы отправились к старому гроту, что на юге-востоке отсюда.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_22");	//Зарыв все золото, мы уже собирались идти обратно в лагерь, как вдруг стали происходить абсолютно непонятные для меня вещи.
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_23");	//А что произошло?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_24");	//Дрейк и еще несколько человек из моей команды как будто обезумели.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_25");	//Они накинулись на меня и остальных парней, словно в них вселился сам Белиар!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_26");	//Выбраться живым из той пещеры удалось лишь мне.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_27");	//Через несколько дней я послал туда нескольких человек на разведку, но они так и не вернулись.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_28");	//Вот тогда мне и стало понятно, что больше я своего золота никогда не увижу. Ибо в том гроте поселилось настоящее зло!
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_29");	//Да, история не из веселых.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_30");	//Но это еще не конец, приятель...(мрачно) То были еще цветочки по сравнению с тем, что нас ждало дальше!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_32");	//Ты будешь смеяться, но, похоже, сама удача отвернулась от нас.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_33");	//Во всех наших начинаниях и замыслах нас ждало одно разочарование!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_34");	//То захваченный торговец плыл без груза...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_35");	//...то груз оказывался таким, что его стоимости не хватило бы даже на покрытие наших издержек.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_36");	//А в последний раз мы вообще потеряли свой корабль, наткнувшись в море на паладинскую галеру! Белиар бы ее побрал...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_37");	//(нервно) Но самое страшное, что ко мне по ночам стали приходить призраки тех, кто остался в этой пещере!
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_38");	//Эти кошмары мучают меня уже очень давно. Но с каждым днем они становятся все страшнее и мучительней.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_39");	//Тут-то до меня и дошло, что все дело в этом кольце. 
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_40");	//Оно явно было непростым! И я попытался избавиться от него.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_41");	//Но как только я попытался снять его с пальца, меня скрутило так, что...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_42");	//...в общем, я его надел обратно и с того времени больше не снимал.
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_43");	//Теперь понимаешь, что мне с ним никак нельзя расставаться?
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_44");	//Вот если бы этот твой маг немного пораскинул мозгами и подумал, как можно снять с меня это проклятье...
	AI_Output(self,other,"DIA_Addon_Greg_DOOMRING_01_45");	//Я ему задаром бы отдал это кольцо! Смекаешь?
	AI_Output(other,self,"DIA_Addon_Greg_DOOMRING_01_46");	//Ладно, попробую спросить его об этом.
	B_LogEntry(TOPIC_PirateRing,"Все оказалось не так просто. Похоже, то кольцо, которое искал Ксардас, по словам его последнего хозяина - капитана Грэга - проклято темной магией! Сила этого проклятия сгубила много его людей и лишило удачи всю его команду. К тому же он не может просто так снять это кольцо, иначе проклятье убьет и его. Надо поговорить об этом с Ксардасом.");
	GregCurse = TRUE;
};

instance DIA_ADDON_GREG_DRAKE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_DRAKE_condition;
	information = dia_addon_greg_DRAKE_info;
	permanent = FALSE;
	description = "А кто такой этот Дрейк?";
};

func int dia_addon_greg_DRAKE_condition()
{
	if((MIS_PirateRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Greg_DOOMRING)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_DRAKE_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Greg_DRAKE_01_01");	//А кто такой этот Дрейк?
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_02");	//Один из капитанов, плававших под моим началом. Когда-то он был моим самым лучшим другом.
	AI_Output(other,self,"DIA_Addon_Greg_DRAKE_01_03");	//Расскажи немного о нем.
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_04");	//Да что тут говорить, приятель! Это был очень надежный человек. Я мог положится на него как на самого себя.
	AI_Output(self,other,"DIA_Addon_Greg_DRAKE_01_05");	//Однажды он даже спас мою жизнь... И вдруг - такое!
	B_LogEntry(TOPIC_PirateRing,"По ночам Грэгу снятся кошмары и приходят призраки тех, кого когда-то сгубило проклятие кольца. Среди этих призраков есть один его старый приятель - капитан Дрейк. Именно с него и начали происходить странные вещи.");
};

instance DIA_ADDON_GREG_NOMORECURSE(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_NOMORECURSE_condition;
	information = dia_addon_greg_NOMORECURSE_info;
	permanent = FALSE;
	description = "Попробуй снять свое кольцо.";
};

func int dia_addon_greg_NOMORECURSE_condition()
{
	if((MIS_PirateRing == LOG_Running) && (XarCurseClear == TRUE) && (Npc_IsDead(Skeleton_Capitan_Drake) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_NOMORECURSE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_01");	//Попробуй снять свое кольцо.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_02");	//ЧТО?! Я не буду этого делать, парень!
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_03");	//Сейчас же сними свое кольцо! Если, конечно, ты хочешь избавиться от своего проклятья.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_04");	//Ну смотри, приятель...(грозно) Если я вдруг отправлюсь на тот свет, не будет тебе больше покоя в этой жизни.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_05");	//Снимай уже.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_06");	//(снимает кольцо)
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_07");	//Ну и как ты себя чувствуешь?
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_08");	//(удивленно) Знаешь, а похоже ты был прав! Как будто камень с души упал.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_09");	//Вот видишь, а ты боялся.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_10");	//(ворчливо) Посмотрел бы я на тебя, будь ты на моем месте.
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_11");	//Ладно, давай мне кольцо.
	AI_Output(self,other,"DIA_Addon_Greg_NOMORECURSE_01_12");	//Вот - забирай это чертову побрякушку! Видеть ее больше не хочу!
	B_GiveInvItems(self,other,ItRi_DarkCurse,1);
	AI_Output(other,self,"DIA_Addon_Greg_NOMORECURSE_01_13");	//Благодарю.
	GregCanPray = TRUE;
	B_LogEntry(TOPIC_PirateRing,"Как и говорил Ксардас, проклятье ослабло, и Грэг, хоть и не без моей помощи, смог снять проклятое кольцо. Теперь надо отнести его обратно старику. Пусть немного порадуется.");
};

instance DIA_ADDON_GREG_PiratePray_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 3;
	condition = dia_addon_greg_PiratePray_Done_condition;
	information = dia_addon_greg_PiratePray_Done_info;
	permanent = FALSE;
	description = "Насчет твоей просьбы о молитве...";
};

func int dia_addon_greg_PiratePray_Done_condition()
{
	if((MIS_PiratePray == LOG_Success) || (PyrNotAgreePray == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PiratePray_Done_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_00");	//Насчет твоей просьбы о молитве...
	AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_01");	//Так тебе удалось договориться с магами?

	if(MIS_PiratePray == LOG_Success)
	{
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_02");	//Да, они помолятся за тебя и твоих людей.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_03");	//(довольно) Отлично, приятель. Уверен, что эта новость немного взбодрит парней!
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_04");	//А те маги, наверное, вытрясли с тебя кучу золота за это, да?
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_05");	//Не могу сказать, что прощение вам обошлось слишком дешево.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_06");	//Ладно, чего уж там! Я не хуже тебя знаю этих толстосумов.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_07");	//Возьми это в качестве награды за свои труды.

		if(GregBonusPray == 1)
		{
			B_GivePlayerXP(100);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 2)
		{
			B_GivePlayerXP(200);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		}
		else if(GregBonusPray == 3)
		{
			B_GivePlayerXP(300);
			b_giveinvitemsmanythings(self,other);
			CreateInvItems(other,ItMi_DarkPearl,1);
			CreateInvItems(other,ITMI_QUICKSILVER,1);
			CreateInvItems(other,ItFo_Addon_SchnellerHering,3);
			CreateInvItems(other,ItWr_HitPointStonePlate1_Addon,1);
		};

		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_08");	//Хотя это и не золото, но довольно ценные предметы.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_09");	//Ты наверняка им найдешь применение. (смеется)
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_Greg_PiratePray_Done_01_11");	//К сожалению, нет.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_12");	//Белиар бы их побрал! Ну да ладно. Иннос свидетель - я хотел изменить свою жизнь.
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_13");	//Но, видать, - не судьба. Так что придется и дальше быть плохим парнем!
		AI_Output(self,other,"DIA_Addon_Greg_PiratePray_Done_01_14");	//Грабить, убивать, топить корабли... Не жизнь, а сказка! (смеется)
		MIS_PiratePray = LOG_Success;
		Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	};
};

var int PirateDealDay;
var int PirateDealFlag;
var int PirateDealCost;

instance DIA_ADDON_GREG_PirateDeal(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_condition;
	information = dia_addon_greg_PirateDeal_info;
	permanent = FALSE;
	description = "Тут к тебе есть одно дело.";
};

func int dia_addon_greg_PirateDeal_condition()
{
	if(MIS_PirateDeal == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_00");	//Тут к тебе есть одно дело.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_01");	//Хммм...(прищурясь) Ну, выкладывай тогда.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_02");	//Я принес предложение от магов Воды.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_03");	//Магов Воды?!
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_04");	//Необходимо обеспечить их миссию всем необходимым - провиантом, припасами и оружием.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_05");	//И мне кажется, что вам это вполне по силам. Я прав?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_06");	//Интересно, с чего это вдруг маги решили якшаться с отбросами общества вроде нас?
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_07");	//В этой части острова есть только вы и бандиты Ворона.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_08");	//А они-то вряд ли станут даже слушать об этом. Так что остаетесь только вы, пираты.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_09");	//Логично! Ну хорошо. Допустим, мы согласны.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_10");	//Но какая нам выгода от всего этого?
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_11");	//Ты мне скажи. На каких условиях вы согласны обеспечивать магов всем необходимым?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_12");	//Хммм...(задумчиво) Тут надо хорошенько подумать.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_13");	//И сколько это займет времени?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_01_14");	//Приходи завтра. Я обмозгую все, переговорю с парнями. А дальше будет видно.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_01_15");	//Договорились.
	PirateDealDay = Wld_GetDay();
	PirateDealFlag = TRUE;
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Грэгу надо подумать над предложением магов Воды. Завтра он будет готов выдвинуть свои предложения.");
};

instance DIA_ADDON_GREG_PirateDeal_Choice(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Choice_condition;
	information = dia_addon_greg_PirateDeal_Choice_info;
	permanent = FALSE;
	description = "Так что ты решил?";
};

func int dia_addon_greg_PirateDeal_Choice_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((MIS_PirateDeal == LOG_Running) && (PirateDealFlag == TRUE) && (PirateDealDay <= (Daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Choice_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_01_00");	//Так что ты решил?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_01");	//(ехидно) Ну, мы тут с парнями подумали и решили, что для начала ты нам заплатишь...
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_02");	//...скажем, пять тысяч золотых. Только тогда мы будем готовы помочь магам Воды с поставками провианта и прочих запасов.
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_01_03");	//Пять тысяч?! Да ты с ума сошел.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_01_04");	//Это наши условия, приятель! В ином случае их предложение нам не интересно.
	PirateDealCost = 5000;
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);

	if(RhetorikSkillValue[1] >= 45)
	{
		Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice,"Может, сойдемся в половину этой суммы?",DIA_Addon_Greg_PirateDeal_Choice_Cheap);
	};

	Info_AddChoice(DIA_Addon_Greg_PirateDeal_Choice,"Может, хотя бы поторгуемся?",DIA_Addon_Greg_PirateDeal_Choice_Yes);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Cheap()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_00");	//Может, для начала сойдемся на половину этой суммы? Кто знает, как там дело пойдет.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_02");	//Ну хорошо. Можешь мне отдать сейчас часть денег.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Cheap_01_03");	//Но только не думай, что я забуду про оставшуюся.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	PirateDealCost = 2500;
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Грэг выдвинул свои требования. Ему нужно пять тысяч золотом! Тогда он готов начать торговать с магами Воды. Вот жадная скотина. Однако мне удалось договориться, что сейчас я отдам ему только половину, а остальную принесу позже.");
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

func void DIA_Addon_Greg_PirateDeal_Choice_Yes()
{
	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_00");	//Может, хотя бы поторгуемся?
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_01");	//Нет, торг тут не уместен, парень.
	AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Choice_Yes_01_02");	//Так что выкладывай пять тысяч или проваливай к Белиару!
	B_LogEntry_Quiet(TOPIC_PirateDeal,"Грэг выдвинул свои требования. Ему нужно пять тысяч золотом! Тогда он готов начать торговать с магами Воды. Вот жадная скотина...");
	Info_ClearChoices(DIA_Addon_Greg_PirateDeal_Choice);
};

instance DIA_ADDON_GREG_PirateDeal_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = dia_addon_greg_PirateDeal_Done_condition;
	information = dia_addon_greg_PirateDeal_Done_info;
	permanent = TRUE;
	description = "Вот твои деньги.";
};

func int dia_addon_greg_PirateDeal_Done_condition()
{
	if((MIS_PirateDeal == LOG_Running) && (PirateDealCost > 0) && (PirateDealOk == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_PirateDeal_Done_info()
{
	var int Xp_Temp;

	AI_Output(other,self,"DIA_Addon_Greg_PirateDeal_Done_01_00");	//Вот твои деньги.

	if(Npc_HasItems(hero,ItMi_Gold) >= PirateDealCost)
	{
		Xp_Temp = 100 -(PirateDealCost / 100);
		Xp_Temp = Xp_Temp * 10;
		B_GivePlayerXP(Xp_Temp);
		B_GiveInvItems(other,self,ItMi_Gold,PirateDealCost);
		Npc_RemoveInvItems(self,ItMi_Gold,PirateDealCost);
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_01");	//(жадно) Отлично! Можешь передать своим магам, что мы согласны снабжать их всем необходимым.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_02");	//Теперь осталось только уладить вопрос с количеством и содержимым этих поставок.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_03");	//Пусть они пришлют к нам кого-нибудь из своих людей. Не самому же мне к ним идти!
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_04");	//А там я уже сам обо всем договорюсь.
		PirateDealOk = TRUE;
		B_LogEntry(TOPIC_PirateDeal,"Я договорился с пиратами о поставках продовольствия магам Воды.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_06");	//(ухмыляясь) Правда? И где они? Я что-то не вижу тут той суммы, о которой мы договаривались.
		AI_Output(self,other,"DIA_Addon_Greg_PirateDeal_Done_01_08");	//Смотри! Я не позволю делать из себя дурака.
	};
};

instance DIA_Addon_Greg_FoundTreasure(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_FoundTreasure_Condition;
	information = DIA_Addon_Greg_FoundTreasure_Info;
	permanent = TRUE;
	description = "Я нашел все закопанные вещи.";
};

func int DIA_Addon_Greg_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Я нашел все закопанные вещи.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Тогда у тебя должно быть около ста золотых, золотая чаша, серебряное блюдо и амулет! Давай их сюда.
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"У меня с собой их нет.",DIA_Addon_Greg_FoundTreasure_not);

	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_CupGold) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_FoundTreasure,"Вот твои вещи.",DIA_Addon_Greg_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Вот твои вещи.

	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Кошелек.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//Сотня золотых.
	};
	if(B_GiveInvItems(other,self,ItMi_CupGold,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Золотая чаша.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Серебряная чаша.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//И амулет.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Очень хорошо! Вижу, тебе хватило ума не присваивать себе мои вещи.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Вот твоя доля.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//У меня с собой их нет.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Тогда поторопить и принеси их мне, пока я не рассердился.
	AI_StopProcessInfos(self);
};

//------------------------Дракия-----------------------------------------------------

var int GregCanTalkAboutElsa;

instance DIA_Addon_Greg_TalkAboutElza(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Info;
	permanent = TRUE;
	description = "А куда вы сбываете весь свой товар?";
};

func int DIA_Addon_Greg_TalkAboutElza_Condition()
{
	if((GregIsBack == TRUE) && (GregCanTalkAboutElsa == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_00");	//А куда вы сбываете весь свой товар?

	if(RavenAway == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_01");	//Не твоего ума дело!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_02");	//Хммм... А с чего ты вдруг заинтересовался этим?
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_03");	//Мне просто стало интересно, куда вы это все деваете.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_04");	//Ведь наверняка, до того, как паладины потопили ваш корабль, вы награбили немало добра!
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_05");	//Да уж, в логике тебе не откажешь, приятель.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_06");	//Естественно, наше ремесло не стоило бы и гроша, если бы мы не могли продать весь наш улов за хорошую цену.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_07");	//Небольшую часть награбленного мы отвозили в Хоринис тем торговцам, которые не чурались иметь с нами дела. И поверь, таких было не мало.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_08");	//Но, к сожалению, сейчас там стало слишком опасно. И всему виной эти проклятые паладины, которые недавно прибыли в город.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_09");	//А что с остальным?
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_10");	//Остальное мы везли в Дракию. Тамошние торговцы с привеликим удовольствием платили нам звонкую монету за любой товар.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_11");	//И при этом без всякого риска для жизни! Ибо их местный барон только лишь на словах подчиняется королевским указам.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_12");	//А на самом деле, такой же разбойник и пират, как и мы.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_13");	//Дракию?! Что это за место?
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_14");	//Ты что, хочешь сказать, что нигода не слышал о ней?!
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_15");	//Нет, не слышал. Но с удовольствием бы послушал.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_16");	//Дракия - это западная провинция острова Хоринис и город в ней же с аналогичным названием. Правда не такой большой, как сам Хоринис.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_17");	//Насколько мне известно, до недавнего времени там всем заправлял барон Локхард.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_18");	//Хотя Дракия и является частью королевства Миртаны, но по сути ее правит только сам барон. Это целиком и полностью его земли.
		AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_01_19");	//А ему все равно - пират ты или нет. Главное, чтобы в карманах водилось золото.
		AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_01_20");	//Хммм... Неплохо.
		GregCanTalkAboutElsa = TRUE;
	};
};

instance DIA_Addon_Greg_TalkAboutElza_Done(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Done_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Done_Info;
	permanent = FALSE;
	description = "А как можно попасть в эту Дракию?";
};

func int DIA_Addon_Greg_TalkAboutElza_Done_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE) && (GregCanTalkAboutElsa == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_00");	//А как можно попасть в эту Дракию?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_01");	//Только по морю. Причем придется плыть в огиб всего острова, через север.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_02");	//Почему?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_03");	//На юге слишком много скал и можно застросто налететь на подводный риф, не зная правильного форватера.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Done_01_04");	//Но ведь ты его наверняка знаешь.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Done_01_05");	//Знаю, только что толку. Корабля то все равно нет! А на простой лодке туда все равно не добраться.
};

instance DIA_Addon_Greg_TalkAboutElza_Ship(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_TalkAboutElza_Ship_Condition;
	information = DIA_Addon_Greg_TalkAboutElza_Ship_Info;
	permanent = FALSE;
	description = "Я тут недалеко видел один корабль.";
};

func int DIA_Addon_Greg_TalkAboutElza_Ship_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_TalkAboutElza_Done) == TRUE) && (ViewElza == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_TalkAboutElza_Ship_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_00");	//Я тут недалеко видел один корабль.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_01");	//Что?! Хватит уже этих шуток... 
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_02");	//Я серьезно! Он стоит вон за теми скалами, недалеко от вашего лагеря.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_03");	//Аааа... (усмехаясь) Кажется, я понял о чем говоришь. Ты наверно имеешь ввиду 'Одноглазую Эльзу'. 
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_04");	//'Одноглазую Эльзу'?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_05");	//Да, наш старый галеон. Только мы на нем уже давно не плаваем.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_06");	//А что с ним не так?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_07");	//C ним все хорошо, если не учитывать тот факт, что у него сломан руль, дыра в левом боку и сам он еле держится на плаву.
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_08");	//Тогда почему вы его не почините?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_09");	//Пробовали уже, не вышло. Для этого нужен хороший плотник, а у нас такого отродясь не было.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_10");	//Но лучше спросить об этом Скипа. Это он занимался ее починкой. 
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_11");	//Парень прямо таки из кожи вон лез, чтобы только 'Эльза' вновь могла плавать. Но в конце концов тоже смирился.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_12");	//Как говорится, старушка отжила свое...
	AI_Output(other,self,"DIA_Addon_Greg_TalkAboutElza_Ship_01_13");	//И откуда такая ретивость?
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_14");	//Не знаю. Похоже, для него этот корабль значил нечто большее, чем просто груда досок.
	AI_Output(self,other,"DIA_Addon_Greg_TalkAboutElza_Ship_01_15");	//Но лучше ты сам у него спроси.
	MIS_OldElza = LOG_Running;
	Log_CreateTopic(TOPIC_OldElza,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldElza,LOG_Running);
	B_LogEntry(TOPIC_OldElza,"Я спросил Грэга о корабле, стоящим в бухте, недалеко от лагеря. Он рассмеялся и сказал, что это их старый галеон - 'Одноглазая Эльза', на котором они уже давно не плавают. У корабля сломан руль, дыра в левом боку и сам он еле держится на плаву. Пираты пробовали его починить, но без хорошего плотника им это не удалось сделать. Особенно при этом старался Скип. Похоже для него этот кораль значил куда больше, чем что-либо иное.");
};

instance DIA_Addon_Greg_OldRumors(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Condition;
	information = DIA_Addon_Greg_OldRumors_Info;
	permanent = FALSE;
	description = "Я насчет Лоа.";
};

func int DIA_Addon_Greg_OldRumors_Condition()
{
	if(MIS_OldRumors == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_00");	//Я насчет Лоа.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_01");	//Какой еще Лоа?...(раздраженно)
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_02");	//Ну, той девушки, что приходила к тебе с небольшой просьбой - взять ее с собой в Дракию.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_03");	//С просьбой?! Белиар бы ее побрал! Да она ворволась ко мне в хижину как бешеная волчица!
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_04");	//Стала на меня кричать и угрожать, что мол если я ее не посажу на этот корабль, то она устроит мне тут в лагере сущий ад.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_05");	//Я конечно все понимаю, что характер у баб далеко не из легких. Одна Абигаль чего стоит!
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_06");	//Но так разговаривать со мной, с Грэгом, с капитаном пиратов и уж тем более угрожать мне в моем же доме... Нет, приятель, это перебор!
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_07");	//Ну вот я ее и выставил за дверь без всяких разговоров, сказав, что женщина на корабле - это к беде.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_08");	//Ты должен понять, что для меня очень важно, чтобы 'Эльза' добралась до берегов Дракии целой и невредимой.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_09");	//А это чертовка с ее то манерами может устроить мне на борту не весть знает что.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_10");	//Тише, тише... Успокойся! Она видно просто сильно перенервничала. Как и ты.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_11");	//Я могу поручиться за то, что ничего дурного у нее и в мыслях не было.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_12");	//Одних слов мало! Я привык верить только делам. А то что я видел, во мне не вызывает никакого доверия.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_13");	//Я тебе могу сказать только одно - она должна попасть в Дракию! Иначе, она действительно разнесет весь этот лагерь на мелкие кусочки.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_14");	//Хммм... Ладно, давай так. Выплати мне половину стоимости моего товара и можешь сажать ее на борт.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_15");	//В ином же случае, ноги ее не будет на палубе 'Эльзы'.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_16");	//И о какой сумме идет речь?
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_17");	//По моим подсчетам, мы сможем выручить за него в Дракии по меньшей мере тысяч двадцать. Вот и считай.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_18");	//Выходит, ты хочешь получить не меньше десяти тысяч монет. Не слишком ли дороговато выходит за подобную услугу?
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_01_19");	//Пойми, я должен обезопасить свой товар. А уж, соглашаться тебе с этим или нет - твое личное дело.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_01_20");	//Ладно, я подумаю над твоим предложением.
	B_LogEntry(TOPIC_OldRumors,"Грэг готов взять на корабль Лоа, но только при условии если я покрою половину стоимости его товара, который он повезет в Дракию.");
};

instance DIA_Addon_Greg_OldRumors_Agreed(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 13;
	condition = DIA_Addon_Greg_OldRumors_Agreed_Condition;
	information = DIA_Addon_Greg_OldRumors_Agreed_Info;
	permanent = FALSE;
	description = "Вот твои деньги.";
};

func int DIA_Addon_Greg_OldRumors_Agreed_Condition()
{
	if((MIS_OldRumors == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Greg_OldRumors) == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_OldRumors_Agreed_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_00");	//Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_01");	//Приятно иметь с тобой дело.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_02");	//Естественно, теперь ты можешь передать своей подружке, что мы ее возьмем с собой в Дракию.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_03");	//Только попробуй этого не сделать.
	AI_Output(self,other,"DIA_Addon_Greg_OldRumors_Agreed_01_04");	//Не волнуйся! Я всегда держу свое слово.
	AI_Output(other,self,"DIA_Addon_Greg_OldRumors_Agreed_01_05");	//Надеюсь.
	MIS_OldRumors = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_SUCCESS);
	B_LogEntry(TOPIC_OldRumors,"Я отдал деньги Грэгу. Теперь Лоа безприпятственно сможет подняться на борт 'Эльзы'.");
};