
instance DIA_STRF_8120_Addon_Gars_EXIT(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 999;
	condition = DIA_STRF_8120_Addon_Gars_exit_condition;
	information = DIA_STRF_8120_Addon_Gars_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8120_Addon_Gars_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8120_Addon_Gars_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8120_Addon_Gars_PreHello(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_PreHello_condition;
	information = DIA_STRF_8120_Addon_Gars_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_00");	//(угрюмо) А, еще один орочий прихвостень к нам пожаловал.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_PreHello_01_01");	//С чего ты взял?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_03");	//Да это даже дураку ясно! Иначе, орки просто не позволили бы тебе здесь разгуливать.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_04");	//Ну, так что...(угрюмо) Чего тебе от меня надо?
};

instance DIA_STRF_8120_Addon_Gars_HELLO(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_hello_condition;
	information = DIA_STRF_8120_Addon_Gars_hello_info;
	permanent = FALSE;
	description = "А ты кто?";
};

func int DIA_STRF_8120_Addon_Gars_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Hello_01_00");	//А ты кто?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Hello_01_01");	//Можешь звать меня просто Гарс. Я раб орков, так же, как и все остальные здесь люди.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Hello_01_02");	//Ну, если, конечно, не считать тебя...
};

instance DIA_STRF_8120_Addon_Gars_NoOrc(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NoOrc_condition;
	information = DIA_STRF_8120_Addon_Gars_NoOrc_info;
	permanent = FALSE;
	description = "Ты ошибаешься!";
};

func int DIA_STRF_8120_Addon_Gars_NoOrc_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_NoOrc_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NoOrc_01_00");	//Ты ошибаешься! Я не работаю на орков.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_01");	//Хммм...(ехидно) Так может сказать каждый! Но я привык обычно верить делам, а не словам.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_02");	//Так что если хочешь, чтобы люди стали тебе доверять, то вначале докажи это!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_03");	//А пустым словам и обещаниям тут никто не поверит.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NoOrc_01_04");	//И как мне это сделать?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_05");	//Ну, насчет этого у меня есть одна мысль.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_06");	//У старейшины Ар Дагара имеется ключ от склада, где хранятся все запасы орочьего продовольствия.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_07");	//Принеси мне его! Только смотри, чтобы он ничего не заподозрил.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_08");	//Вот тогда я, может быть, поменяю свое мнение о тебе. Но не раньше.
	MIS_ArDagarKey = LOG_Running;
	Log_CreateTopic(TOPIC_ArDagarKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Running);
	B_LogEntry(TOPIC_ArDagarKey,"Прежде чем Гарс поверит в то, что я не работаю на орков, мне необходимо выкрасть у орка Ар Дагара ключ от продовольственного склада орков.");
};

instance DIA_STRF_8120_Addon_Gars_ArDagarKey(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArDagarKey_condition;
	information = DIA_STRF_8120_Addon_Gars_ArDagarKey_info;
	permanent = FALSE;
	description = "Вот нужный тебе ключ.";
};

func int DIA_STRF_8120_Addon_Gars_ArDagarKey_condition()
{
	if((MIS_ArDagarKey == LOG_Running) && (Npc_HasItems(other,ItKe_ArDagar) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArDagarKey_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_00");	//Вот нужный тебе ключ.
	B_GiveInvItems(other,self,ItKe_ArDagar,1);
	Npc_RemoveInvItems(self,ItKe_ArDagar,1);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_01");	//Хммм...(довольно) Совсем другое дело, приятель!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_02");	//Теперь действительно видно, что ты свой человек.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_03");	//А зачем тебе он понадобился?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_04");	//Нам всем тут приходится довольно несладко.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_05");	//Многие голодают. А у орков на складе наверняка есть чем поживиться.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_06");	//Думаю, они вряд ли заметят, если со склада вдруг пропадет немного еды.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_07");	//А парням лишний кусок хлеба только в радость. Смекаешь?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_08");	//Конечно. Главное, чтобы орки ничего не заподозрили.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_09");	//А откуда они узнают? (с ухмылкой) Ты ведь им ничего рассказывать не собираешься?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_10");	//Само собой.
	RT_Respect = RT_Respect + 1;
	MIS_ArDagarKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Success);
	B_LogEntry(TOPIC_ArDagarKey,"Я принес ключ от склада Гарсу.");
};

instance DIA_STRF_8120_Addon_Gars_Paladin(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Paladin_condition;
	information = DIA_STRF_8120_Addon_Gars_Paladin_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_Paladin_condition()
{
	if(MIS_RemoveOrc == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Paladin_info()
{
	B_GivePlayerXP(150);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_00");	//Эй...(сурово) Это ты искал со мной встречи?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Paladin_01_01");	//Да, это был я. Если ты действительно паладин.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_02");	//Он самый! Мое настоящее имя - Венцель.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Paladin_01_03");	//Венцель?! Выходит, что я не ошибся.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_04");	//Рад за тебя. Но так что тебе от меня было нужно?
	FindVenzel = TRUE;
	self.name[0] = "Венцель";
	B_LogEntry(TOPIC_LostPaladins,"Я нашел паладина в шахте. Им оказался рудокоп Гарс! Кто бы мог подумать...");
};


instance DIA_STRF_8120_Addon_Gars_Name(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Name_condition;
	information = DIA_STRF_8120_Addon_Gars_Name_info;
	permanent = FALSE;
	description = "Гарс это не настоящее твое имя?";
};

func int DIA_STRF_8120_Addon_Gars_Name_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Name_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Name_01_00");	//Значит, Гарс это ненастоящее твое имя?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Name_01_01");	//Нет. Просто это первое, что мне пришло в голову, когда орки схватили меня.
};

instance DIA_STRF_8120_Addon_Gars_Back(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Back_condition;
	information = DIA_STRF_8120_Addon_Gars_Back_info;
	permanent = FALSE;
	description = "Меня прислал Гаронд.";
};

func int DIA_STRF_8120_Addon_Gars_Back_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Back_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_00");	//Меня прислал Гаронд.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_01");	//Гаронд?! Ты знаешь Гаронда?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_02");	//Конечно. Он сейчас укрылся со своими паладинами в старом замке рудных баронов.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_03");	//Правда, его со всех сторон окружили орки, поэтому им там приходится несладко.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_04");	//Но он послал меня выяснить, что стало с тобой и твоим отрядом.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_05");	//Именно поэтому я сейчас здесь!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_06");	//Боюсь, что у меня для него печальные новости... Все мои люди мертвы.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_07");	//Лишь мне одному удалось выжить, но, как видишь, я попал к оркам в плен.
};

instance DIA_STRF_8120_Addon_Gars_Happen(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Happen_condition;
	information = DIA_STRF_8120_Addon_Gars_Happen_info;
	permanent = FALSE;
	description = "А как это произошло?";
};

func int DIA_STRF_8120_Addon_Gars_Happen_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Happen_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Happen_01_00");	//А как это произошло?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_01");	//(печально) Мы нарвались на один из их патрулей... Орки напали на нас внезапно!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_02");	//Уже через несколько минут боя я потерял почти половину своих людей.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_03");	//Видя, что ситуация складывается не в нашу пользу, я приказал своим людям отступать к реке.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_04");	//Но было уже поздно! Орков становилось все больше и больше.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_05");	//В итоге пересечь реку удалось только мне. 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_06");	//Хвала Инносу - орки не погнались за мной. Однако я был ранен и сильно истекал кровью.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_07");	//Мне даже пришлось снять свои доспехи, поскольку они сильно сковывали мои действия.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_08");	//Теперь единственная надежда была только на то, что Гаронд успел занять оборону в замке.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_09");	//И мне нужно было как-то добраться туда.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_10");	//Но, как видишь, этого я сделать не смог... Орки поймали меня раньше и притащили сюда.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_11");	//Так что теперь я обычный раб, добывающий железную руду.
};

instance DIA_STRF_8120_Addon_Gars_DontKnow(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_DontKnow_condition;
	information = DIA_STRF_8120_Addon_Gars_DontKnow_info;
	permanent = FALSE;
	description = "Орки ведь не догадываются, что ты паладин?";
};

func int DIA_STRF_8120_Addon_Gars_DontKnow_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Happen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_DontKnow_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_DontKnow_01_00");	//Орки ведь не догадываются, что ты паладин?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_DontKnow_01_01");	//Нет. Эти твари приняли меня за обычного каторжника-рудокопа.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_DontKnow_01_02");	//Если бы они только знали, кто на самом деле стоял перед ними, я был бы уже давно мертв.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_DontKnow_01_03");	//Понимаю.
};

instance DIA_STRF_8120_Addon_Gars_GetOut(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_GetOut_condition;
	information = DIA_STRF_8120_Addon_Gars_GetOut_info;
	permanent = FALSE;
	description = "Мне надо каким-то образом вытащить тебя отсюда!";
};

func int DIA_STRF_8120_Addon_Gars_GetOut_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_GetOut_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_00");	//Мне надо каким-то образом вытащить тебя отсюда!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_01");	//Интересно! И как ты собрался это делать?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_02");	//Думаешь, что орки просто так возьмут и отпустят меня?!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_03");	//Нет, конечно! Но я что-нибудь обязательно придумаю.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_04");	//Послушай меня, приятель...(серьезно) Я, безусловно, польщен тем, что ты проделал такой долгий путь только ради меня.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_05");	//Но в этой шахте есть и другие люди! Нельзя их просто так взять и бросить на произвол судьбы.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_06");	//Ведь когда они узнали, что среди них есть теперь паладин, то у людей появилась самая настоящая надежда на спасение.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_07");	//Поэтому теперь я несу ответственность за их жизни. Так что либо выбираться отсюда всем вместе, либо никак!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_08");	//Но ты должен понимать, что я не смогу вытащить всех из этой шахты.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_09");	//Тогда лучше не стоит больше говорить об этом!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_10");	//Я отсюда никуда не уйду, если не буду уверен в том, что остальные находятся в безопасности.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_11");	//Понимаю.
	VenzelNeedProof = TRUE;
	OrcDoneWalArDagar = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Если даже я найду способ вытащить Венцеля из лап орков, он все равно не покинет шахту до тех пор, пока не удостоверится, что остальные рабы находятся в безопасности.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Start");
};

instance DIA_STRF_8120_Addon_Gars_Teleport(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Teleport_condition;
	information = DIA_STRF_8120_Addon_Gars_Teleport_info;
	permanent = FALSE;
	description = "Где-то тут должен быть магический портал.";
};

func int DIA_STRF_8120_Addon_Gars_Teleport_condition()
{
	if(MIS_MineTeleport == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Teleport_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_00");	//Где-то тут должен быть магический портал.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_01");	//Портал? С чего ты вообще такое взял?!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_02");	//Кроу перевел старую табличку, которую Нутс нашел здесь, в шахте.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_03");	//В ней как раз написано о его существовании.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_04");	//Хммм...(задумчиво) Я бы не стал слишком сильно доверять все этому.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_05");	//Ведь мы даже не знаем, кто именно писал это!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_06");	//Но если это правда, то у вас бы, возможно, появился шанс на спасение.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_07");	//Тут ты, конечно, прав, приятель. Мне нечего тебе противопоставить в ответ.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_08");	//Поэтому мы должны выяснить все, что может быть с этим связано!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_09");	//Но если портал действительно и существует, то, скорее всего, он находится на нижнем уровне шахты.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_10");	//А туда орки никого не пускают. Некоторые даже поговаривают, что там завелось страшное зло.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_11");	//Выходит, что для начала придется расчистить вам путь.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_12");	//Ты все правильно понимаешь...(серьезно) Однако действовать тебе придется в одиночку.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_13");	//Ибо мы не может рисковать жизнями остальных людей.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_14");	//Ну, мне не привыкать.
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Я рассказал про портал Венцелю. Однако по его мнению этот портал может находится только на нижнем уровне шахты. Поэтому мне надо как-то попасть туда.");	
};

instance DIA_STRF_8120_Addon_Gars_TeleportFind(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_TeleportFind_condition;
	information = DIA_STRF_8120_Addon_Gars_TeleportFind_info;
	permanent = FALSE;
	description = "Я побывал на нижнем уровне шахты.";
};

func int DIA_STRF_8120_Addon_Gars_TeleportFind_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_TeleportFind_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_00");	//Я побывал на нижнем уровне шахты.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_01");	//Тогда чем порадуешь?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_02");	//Похоже, что мне действительно удалось отыскать нечто похожее на магический портал.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_03");	//А с ним еще этот странный камень.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_04");	//Хммм...(задумчиво) Этот предмет очень сильно напоминает фокусирующий камень, который обычно используют только маги.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_05");	//Попробуй отнести его Кроу! Возможно, он что-нибудь тебе и подскажет.
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Я сообщил Венцелю о том, что внизу есть место, отдаленно напоминающее магический портал. Кроме того, я показал ему странного вида камень, который мне посчастливилось обнаружить внизу. По мнению Венцеля, тот очень сильно похож на фокусирующий элемент, которые используют обычно только маги. И посоветовал поговорить с Кроу.");	
	SendPortalKrow = TRUE;
};

instance DIA_STRF_8120_Addon_Gars_NeedWeapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NeedWeapons_condition;
	information = DIA_STRF_8120_Addon_Gars_NeedWeapons_info;
	permanent = FALSE;
	description = "Я поговорил с Кроу.";
};

func int DIA_STRF_8120_Addon_Gars_NeedWeapons_condition()
{
	if(MIS_MineTeleport == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_NeedWeapons_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_00");	//Я поговорил с Кроу.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_01");	//(серьезно) И что он сказал?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_02");	//Похоже, что ты был прав. Это действительно магический юнитор.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_03");	//И, по всей видимости, с его помощью можно будет активировать найденный мною портал.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_04");	//Это хорошие новости! Благодаря тебе, у нас теперь появился реальный шанс спасти всех людей!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_05");	//Но это еще не всё. По словам Кроу, портал может вести на материк.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_06");	//(удивленно) На материк? Ты в этом уверен?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_07");	//На самом юниторе есть клеймо королевского ордена магов Огня.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_08");	//Потому и не исключено, что может оказаться именно так.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_09");	//Значит, Миртана...(задумчиво) Я уж и думал, что никогда больше не увижу ее вновь.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_10");	//Тебя что-то смущает?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_11");	//Нет, конечно...(ностальгически) Ведь там находится мой дом. Как и многих тех, кто приплыл сюда вместе с лордом Хагеном.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_12");	//Но ладно, довольно воспоминаний! На это сейчас просто нет времени.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_13");	//Кроу сказал, что ты подскажешь, как нам быть дальше.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_14");	//Все очень просто. Я возьму командование людьми на себя.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_15");	//Но для начала, нам нужно хорошенько подготовится к побегу.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_16");	//Нам необходимо нормальное оружие и достаточное количество продовольствия.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_17");	//Без всего этого наши планы изначально будут обречены на неудачу.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_18");	//Кроме этого, будет хорошо, если ты принесешь мне обратно мои доспехи и меч.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_19");	//Если нам придется пробиваться с боем, то они спасут не одну жизнь!
	B_LogEntry(TOPIC_EscapeMine,"Венцель готов возглавить мятеж рабов и совершить побег с остальными людьми в шахте. Он подгадает для этого нужный момент и отправит людей через магический портал! Но для начала ему необходимо хорошо подготовится к задуманому.");
};

instance DIA_STRF_8120_Addon_Gars_Weapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Weapons_condition;
	information = DIA_STRF_8120_Addon_Gars_Weapons_info;
	permanent = FALSE;
	description = "Сколько оружия тебе необходимо?";
};

func int DIA_STRF_8120_Addon_Gars_Weapons_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Weapons_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Weapons_01_00");	//Сколько оружия тебе необходимо?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_01");	//Если учитывать общее количество людей, то, по меньшей мере, два десятка мечей. Сгодятся и обычные.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_02");	//Но я раздам его людям только перед тем, как мы начнем пробиваться к порталу.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_03");	//Раньше будет слишком опасно, иначе орки могут что-нибудь заподозрить.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Weapons_01_04");	//Понимаю.
	MIS_GarsWeapons = LOG_Running;
	Log_CreateTopic(TOPIC_GarsWeapons,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Running);
	B_LogEntry(TOPIC_GarsWeapons,"Чтобы вооружить людей, Венцелю нужно по крайней мере два десятка обычных мечей.");
};

instance DIA_STRF_8120_Addon_Gars_WeaponsDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_WeaponsDone_condition;
	information = DIA_STRF_8120_Addon_Gars_WeaponsDone_info;
	permanent = FALSE;
	description = "Я принес тебе оружие.";
};

func int DIA_STRF_8120_Addon_Gars_WeaponsDone_condition()
{
	if((MIS_GarsWeapons == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Common_01) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_WeaponsDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_00");	//Я принес тебе оружие.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_01");	//(шепотом) Потише, приятель... Если орки услышат нас, то не сносить нам головы!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_02");	//Давай его сюда. Пусть пока полежит здесь, в укромном местечке.
	B_GiveInvItems(other,self,ItMw_1H_Common_01,20);
	Npc_RemoveInvItems(self,ItMw_1H_Common_01,20);
	MIS_GarsWeapons = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Success);
	B_LogEntry(TOPIC_GarsWeapons,"Я принес Венцелю оружие.");
};

instance DIA_STRF_8120_Addon_Gars_Food(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Food_condition;
	information = DIA_STRF_8120_Addon_Gars_Food_info;
	permanent = FALSE;
	description = "Как много продовольствия вам потребуется?";
};

func int DIA_STRF_8120_Addon_Gars_Food_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Food_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Food_01_00");	//Как много продовольствия вам потребуется?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_01");	//Хммм, дай подумать...(серьезно) Скажем, двадцати бутылок воды и полсотни кусков мяса будет достаточно.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_02");	//Но только прожаренного. Я не хочу, чтобы в самый ответственный момент у кого-нибудь из моих людей скрутило живот.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Food_01_03");	//А не маловато ли?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_04");	//Нет, в самый раз...(твердо) На первое время нам этого хватит. И к тому же, не так сильно обременит нас ношей.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_05");	//Ну, а остальное уже все в руках Инноса!
	MIS_GarsFood = LOG_Running;
	Log_CreateTopic(TOPIC_GarsFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Running);
	B_LogEntry(TOPIC_GarsFood,"Чтобы прокормить людей в походе, Венцелю необходимо полсотни прожаренных кусков мяса и двадцать бутылок воды.");
};

instance DIA_STRF_8120_Addon_Gars_FoodDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_FoodDone_condition;
	information = DIA_STRF_8120_Addon_Gars_FoodDone_info;
	permanent = FALSE;
	description = "Я принес вам еды.";
};

func int DIA_STRF_8120_Addon_Gars_FoodDone_condition()
{
	if((MIS_GarsFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Water) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_FoodDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_FoodDone_01_00");	//Я принес вам еды.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,50);
	Npc_RemoveInvItems(other,ItFo_Water,20);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_FoodDone_01_01");	//Отлично, приятель! Без нее нам бы пришлось совсем туго.
	MIS_GarsFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Success);
	B_LogEntry(TOPIC_GarsFood,"Я принес Венцелю нужное количество продовольствия.");
};

instance DIA_STRF_8120_Addon_Gars_Armor(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Armor_condition;
	information = DIA_STRF_8120_Addon_Gars_Armor_info;
	permanent = FALSE;
	description = "Где мне искать твои доспехи и меч?";
};

func int DIA_STRF_8120_Addon_Gars_Armor_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Armor_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Armor_01_00");	//Где мне искать твои доспехи и меч?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_01");	//Перед тем, как орки схватили меня, я спрятал их в пещере, под водопадом.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_02");	//Но только не вздумай их одевать!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Armor_01_03");	//Это еще почему?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_04");	//(гордо) Мои доспехи освящены слезами самого Инноса.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_05");	//Если ты их посмеешь одеть, то умрешь мучительной смертью! Это касается и меча...
	MIS_GarsArmor = LOG_Running;
	Log_CreateTopic(TOPIC_GarsArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Running);
	B_LogEntry(TOPIC_GarsArmor,"Перед тем, как орки схватили Венцеля, он успел спрятать свой доспех и меч в пещере, под водопадом.");
};

instance DIA_STRF_8120_Addon_Gars_ArmorDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArmorDone_condition;
	information = DIA_STRF_8120_Addon_Gars_ArmorDone_info;
	permanent = FALSE;
	description = "Вот твои доспехи и меч.";
};

func int DIA_STRF_8120_Addon_Gars_ArmorDone_condition()
{
	if((MIS_GarsArmor == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Blessed_Venzel) >= 1) && (Npc_HasItems(other,ITAR_PAL_H_V2_VENZEL) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArmorDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_00");	//Вот твои доспехи и меч.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMw_1H_Blessed_Venzel,1);
	Npc_RemoveInvItems(other,ITAR_PAL_H_V2_VENZEL,1);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_01");	//Хммм...(с уважением) По правде говоря, я не думал, что ты со всем этим справишься.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_02");	//Это было несложно. Ты ведь сказал, где их искать.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_03");	//Тогда, выходит, что я напрасно беспокоился.
	MIS_GarsArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Success);
	B_LogEntry(TOPIC_GarsArmor,"Я вернул Венцелю его доспехи и меч.");
};

instance DIA_STRF_8120_Addon_Gars_Buy(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Buy_condition;
	information = DIA_STRF_8120_Addon_Gars_Buy_info;
	permanent = FALSE;
	description = "Больше вам ничего не надо?";
};

func int DIA_STRF_8120_Addon_Gars_Buy_condition()
{
	if((MIS_GarsArmor == LOG_Success) && (MIS_GarsFood == LOG_Success) && (MIS_GarsWeapons == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Buy_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_00");	//Больше вам ничего не надо?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_01");	//Пожалуй, что нет...(серьезно) Все необходимое для побега у нас уже есть.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_02");	//Хорошо. Тогда, что дальше?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_03");	//Теперь нам осталось только дождаться удобного момента и как можно скорее свалить отсюда.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_04");	//Знаешь...(задумчиво) Я тут подумал, что, возможно, мы больше уже не свидимся.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_05");	//Поэтому здесь и сейчас хочу поблагодарить тебя за оказанную нам помощь!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_06");	//Для всех нас она оказалась просто бесценной. 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_07");	//Тебе удалось спасти множество человеческих жизней, что всегда ценилось превыше всего остального.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_08");	//Приятно это слышать. Но что с Гарондом? 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_09");	//Передай ему, что я уже больше не вернусь в Долину Рудников.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_10");	//А что ты будешь делать?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_11");	//Я отправлюсь в Миртану и буду дальше сражаться против орков.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_12");	//В конце концов, дела там сейчас не лучше, чем здесь! У короля на счету каждый мужчина, умеющий держать меч.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_13");	//Хорошо, так ему и передам.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_14");	//Тогда прощай! И да пребудет всегда с тобой Иннос...
	MIS_EscapeMine = LOG_Success;
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Success);
	B_LogEntry(TOPIC_EscapeMine,"Теперь судьба заключенных в их собственных руках! Я им помог всем, чем только смог...");
	AI_StopProcessInfos(self);
};

//--------------------------------Харт--------------------------------------

instance DIA_STRF_8146_Hart_EXIT(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 999;
	condition = DIA_STRF_8146_Hart_exit_condition;
	information = DIA_STRF_8146_Hart_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8146_Hart_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8146_Hart_HELLO(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_hello_condition;
	information = DIA_STRF_8146_Hart_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8146_Hart_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_hello_info()
{
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_00");	//(удивленно) Эй, приятель! Ты вообще как сюда попал?
	AI_Output(other,self,"DIA_STRF_8146_Hart_Hello_01_01");	//У меня к тебе тот же вопрос.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_02");	//Я тут не по своей воле. Так уж вышло.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_03");	//Но вот ты - совсем другое дело. И как только орки впустили тебя сюда?
	AI_Output(other,self,"DIA_STRF_8146_Hart_Hello_01_04");	//Это ты лучше спроси у них сам.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_05");	//Нет уж, уволь... Я предпочитаю поменьше общаться с этими тварями.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_06");	//У них слишком крутой нрав! Чуть что не так, сразу хватаются за свой топор.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_07");	//А мне лишние неприятности совсем ни к чему!
};

instance DIA_STRF_8146_Hart_About(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_About_condition;
	information = DIA_STRF_8146_Hart_About_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};

func int DIA_STRF_8146_Hart_About_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_About_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_01");	//Я боец здешней арены и сражаюсь тут на потеху оркам.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_02");	//Правда, эту честь я завоевал себе ценой своей собственной жизни.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_03");	//Интересно! Обычно орки особо не жалуют людей.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_04");	//Почему же они тебя не убили?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_05");	//Это долгая история... Я тогда состоял в личной гвардии одного из рудных баронов.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_06");	//Как-то, во время одной охоты, мы угодили в засаду этих зеленокожих выродков.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_07");	//Мы храбро сражались, но орков было куда больше, чем нас.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_08");	//Но перед тем, как угодить к ним в лапы, я прикончил с дюжину этих тварей!
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_09");	//(гордо) Я сражался до последнего! Отчаянно! Зная, что почти уже обречен на смерть.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_10");	//А когда удар одного из орков пригвоздил меня к земле и я уже было попрощался со своей жизнью...
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_11");	//...оказалось, что на меня положил глаз один из их старейшин!
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_12");	//Орки очень уважают сильных и храбрых воинов, даже если ты для них враг.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_13");	//Того старейшину звали Ур Кан. Он забрал меня сюда, в город, и сделал бойцом на своей арене.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_14");	//И теперь мне до конца своих дней придется отрабатывать перед ним свой долг.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_15");	//А что ты ему должен?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_16");	//Как что? Свою жизнь! Только ее, приятель.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_17");	//Ясно.
};

instance DIA_STRF_8146_Hart_Arena(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Arena_condition;
	information = DIA_STRF_8146_Hart_Arena_info;
	permanent = FALSE;
	description = "Расскажи мне немного про арену.";
};

func int DIA_STRF_8146_Hart_Arena_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Arena_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Arena_01_00");	//Расскажи мне про арену.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_01");	//Да что тут рассказывать? Здесь всем заправляет Ур Кан.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_02");	//Если хочешь сражаться, то сначала придется поговорить с ним.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_03");	//В основном все бойцы арены это орки. Самый сильный из них - Умрак!
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_04");	//Но я тебе не советую с ним связываться, ибо этот черный орк чертовски силен.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_05");	//Некоторые поговаривают, что даже сам Ур Кан немного побаивается его.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_06");	//А так, это все. Об остальном тебе лучше расскажет сам Ур Кан.
	AI_Output(other,self,"DIA_STRF_8146_Hart_Arena_01_07");	//Ладно, спасибо.
	KnowAboutUmrak = TRUE;
};

instance DIA_STRF_8146_Hart_Escape(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Escape_condition;
	information = DIA_STRF_8146_Hart_Escape_info;
	permanent = FALSE;
	description = "Ты не пробовал отсюда сбежать?";
};

func int DIA_STRF_8146_Hart_Escape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Escape_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Escape_01_00");	//Ты не пробовал отсюда сбежать?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_01");	//Ха! Ты что, шутишь? (хохочет) Тут такие номера не пройдут.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_02");	//Это же ведь город орков, приятель! Тут охрана чуть ли не на каждом шагу.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_03");	//Единственный путь выбраться отсюда, так это стать абсолютным победителем на их арене.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_04");	//Но тогда придется сражаться с Умраком, а это, считай, верная смерть!
};

instance DIA_STRF_8146_Hart_Duel(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Duel_condition;
	information = DIA_STRF_8146_Hart_Duel_info;
	permanent = FALSE;
	description = "А я могу тебя вызвать на поединок?";
};

func int DIA_STRF_8146_Hart_Duel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Duel_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Duel_01_00");	//А я могу вызвать тебя на поединок?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Duel_01_01");	//Только если Ур Кан даст на это свое разрешение.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Duel_01_02");	//Тут все делается только с его ведома. Иначе никак!
};

instance DIA_STRF_8146_Hart_Help(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Help_condition;
	information = DIA_STRF_8146_Hart_Help_info;
	permanent = FALSE;
	description = "Может, я смогу чем-то тебе помочь?";
};

func int DIA_STRF_8146_Hart_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Escape) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_00");	//Может, я смогу чем-то тебе помочь?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_01");	//Хммм...(задумчиво) Ну, мне бы не помешало новое оружие.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_02");	//Эти орочьи топоры слишком тяжелы для такого человека, как я.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_03");	//Я, конечно, научился ими управляться, но человеческое оружие мне все-таки больше по душе.
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_04");	//Какое именно оружие тебе нужно?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_05");	//Эх...(ностальгически) Если бы ты только смог принести мне мой старый меч.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_06");	//Я бы тогда показал эти тварям, как на самом деле умеют сражаться люди!
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_07");	//А где твой меч сейчас?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_08");	//Понятия не имею, приятель...(печально) В тот день я оставил свой меч местному кузнецу, чтобы тот хорошенько заточил его.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_10");	//А потом угодил сюда! Поэтому, что потом сталось с моим мечом, Белиар его знает.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_11");	//Может быть, он до сих пор в замке, а может быть, кто-то уже давно положил на него свой глаз.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_12");	//Меч-то был действительно роскошный!
	MIS_HartSword = LOG_Running;
	Log_CreateTopic(TOPIC_HartSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Running);
	B_LogEntry(TOPIC_HartSword,"Харт сражается на арене орочьим оружием, но он не отказался бы заполучить свой старый меч. В тот день, когда ему посчастливилось попасть в плен к оркам, Харт оставил меч местному кузнецу в замке, чтобы тот заточил его. Так что он понятия не имеет, где теперь этот меч.");
};

instance DIA_STRF_8146_Hart_HelpDone(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_HelpDone_condition;
	information = DIA_STRF_8146_Hart_HelpDone_info;
	permanent = FALSE;
	description = "Это твой меч?";
};

func int DIA_STRF_8146_Hart_HelpDone_condition()
{
	if((MIS_HartSword == LOG_Running) && (Npc_HasItems(hero,ItMw_HartSword) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_HelpDone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_00");	//Это твой меч?
	B_GiveInvItems(other,self,ItMw_HartSword,1);
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_01");	//Глазам своим не верю! Где ты его откопал?
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_02");	//На складе, в старом замке рудных баронов.
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_03");	//По всей видимости, им там никто так и не заинтересовался.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_04");	//Что же, тем лучше для меня...(смеется)
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,Npc_HasItems(self,ItMw_2H_OrcAxe_01));
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_05");	//Мой старый друг! Твоя рукоять вновь в моей руке, как и тогда.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_06");	//Спасибо тебе, приятель! Ты не представляешь, насколько это было важно для меня.
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_07");	//Ну что же, рад был помочь.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_08");	//Знаешь, у меня нет ничего такого, чем бы я мог как-то отблагодарить тебя.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_09");	//Поэтому я покажу тебе свой излюбленный прием, который поможет тебе в обращении с одноручным мечом.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_10");	//Многие попадались на эту уловку, что стоило им собственной жизни! Ну как, идет?
	MIS_HartSword = LOG_Success;
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Success);
	B_LogEntry(TOPIC_HartSword,"Я принес Харту его меч.");
	Info_ClearChoices(DIA_STRF_8146_Hart_HelpDone);
	Info_AddChoice(DIA_STRF_8146_Hart_HelpDone,"Договорились!",DIA_STRF_8146_Hart_HelpDone_Ok);
};

func void DIA_STRF_8146_Hart_HelpDone_Ok()
{
	var string concatText;

	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_Ok_01_00");	//Договорились!
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_01");	//Хорошо. Тогда слушай внимательно.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_02");	//Сражаясь с мечом в руках, попробуй использовать инерцию своего противника.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_03");	//Когда он нанесет свой следующий удар, не старайся с силой заблокировать его.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_04");	//Ты плавно уворачиваешься и мгновенно контратакуешь.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_05");	//По сути тебе и делать ничего не придется! Твой враг сам напорется на острие твоего клинка.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_06");	//Ну как, запомнил?
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_Ok_01_07");	//Да, все предельно ясно.
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,2);
	concatText = ConcatStrings(PRINT_Learn1H," + ");
	concatText = ConcatStrings(concatText,IntToString(2));
	concatText = ConcatStrings(concatText," (Навык: ");
	concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
	concatText = ConcatStrings(concatText,"%)");
	AI_Print(concatText);
	Snd_Play("Levelup");
};

instance DIA_STRF_8146_Hart_Fight(C_Info)
{
	npc = STRF_8146_Hart;
	condition = DIA_STRF_8146_Hart_Fight_condition;
	information = DIA_STRF_8146_Hart_Fight_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8146_Hart_Fight_condition()
{
	if((ArenaBattle_04 == TRUE) && (ArenaBattle_04_Won == FALSE) && (ArenaBattle_04_Lost == FALSE) && (HartIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 150) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Fight_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_STRF_8146_Hart_Fight_01_01");	//Ну что, приятель...(улыбаясь) Покажи мне теперь, на что ты способен!
	HartIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

var int HartTeach;

instance DIA_STRF_8146_Hart_Teach(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Teach_condition;
	information = DIA_STRF_8146_Hart_Teach_info;
	permanent = TRUE;
	description = "Ты можешь меня чему-нибудь научить?";
};

func int DIA_STRF_8146_Hart_Teach_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) == TRUE) && (HartTeach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Teach_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Teach_01_00");	//Ты можешь меня чему-нибудь научить?

	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_HartSword == LOG_Success) && (HeroIsMorDar == TRUE))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Я могу обучить тебя контролю над телом. Это искусство называется акробатика.
		HartTeach = TRUE;
		Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
		B_LogEntry(Topic_OutTeacher,"Наемник орков Харт сможет обучить меня акробатике.");
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8146_Hart_Teach_01_01");	//Извини, приятель. Но на это у меня совсем нет времени.
		AI_Output(self,other,"DIA_STRF_8146_Hart_Teach_01_02");	//Скоро бой с Туруком! И мне надо хорошо подготовиться к нему.
	};
};

instance DIA_STRF_8146_Hart_Acrobat(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 10;
	condition = DIA_STRF_8146_Hart_Acrobat_Condition;
	information = DIA_STRF_8146_Hart_Acrobat_Info;
	permanent = TRUE;
	description = "Покажи мне, как правильно управлять своим телом. (Очки обучения: 10)";
};

func int DIA_STRF_8146_Hart_Acrobat_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (HartTeach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Acrobat_Info()
{
	AI_Output(other,self,"DIA_Cassia_Acrobat_15_00");	//Покажи мне, как правильно управлять своим телом.

	if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный! 
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
	};
};