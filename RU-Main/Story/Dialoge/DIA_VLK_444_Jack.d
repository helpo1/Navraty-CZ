
instance DIA_Jack_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_PICKPOCKET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 900;
	condition = DIA_Jack_PICKPOCKET_Condition;
	information = DIA_Jack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jack_PICKPOCKET_Condition()
{
	return C_Beklauen(50,100);
};

func void DIA_Jack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
	Info_AddChoice(DIA_Jack_PICKPOCKET,Dialog_Back,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};


instance DIA_Jack_GREET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 4;
	condition = DIA_Jack_GREET_Condition;
	information = DIA_Jack_GREET_Info;
	important = TRUE;
};


func int DIA_Jack_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_GREET_Info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Привет, сухопутная крыса! Похоже, ты сейчас на мели.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//У тебя жабры какие-то бледные.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Не бери в голову, парень. Все, что тебе нужно - это крепкий морской бриз.
};


instance DIA_Jack_Job(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_Job_Condition;
	information = DIA_Jack_Job_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Jack_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_GREET) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Job_Info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Когда я был еще юношей, я отправился странствовать по морям, и пережил много сильных штормов.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Но много лет назад я осел здесь, и с тех пор работал смотрителем маяка Хориниса.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//В этом нет ничего сложного. Совсем. Но этот старый маяк стал мне родным домом.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Но я так давно уже не был в нем.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Почему?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//С тех пор, как эти подонки захватили мой маяк, я не осмеливаюсь подойти к нему ближе, чем на двадцать футов. Это очень плохие люди.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Они преступники из Долины Рудников, понимаешь?
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//По другую сторону гор раздался оглушительный взрыв, а затем они налетели на эту землю, как мухи на дерьмо. Теперь они скрываются здесь повсюду - даже на моем маяке.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//Я думаю, они поджидают корабль, на котором могли бы уплыть.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ха! Пусть плывут, куда хотят. Тогда, по крайней мере, они уберутся с моего маяка!
	Log_CreateTopic(TOPIC_KillLighthouseBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits,LOG_Running);
	B_LogEntry(TOPIC_KillLighthouseBandits,"Старый морской волк Джек не может вернуться на свой маяк, так как там засели бандиты.");
	MIS_Jack_KillLighthouseBandits = LOG_Running;
};

instance DIA_Jack_HauntedLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_HauntedLH_Condition;
	information = DIA_Jack_HauntedLH_Info;
	description = "Ты имеешь в виду маяк, что в море?";
};

func int DIA_Jack_HauntedLH_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_Job) == TRUE) && (Kapitel <= 4))
	{
		return TRUE;
	};
};

func void DIA_Jack_HauntedLH_Info()
{
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_00");	//Ты имеешь в виду тот маяк, что расположен в море у островка?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_01");	//Нет, я говорю о том, что находится на суше, на высоком склоне недалеко от города.
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_02");	//А тот, что в море, это старый маяк. Его уже давно никто не использует.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_03");	//Почему?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_04");	//Эмм... Люди боятся туда ходить. Говорят, что там водятся призраки.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_05");	//Ты серьезно?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_06");	//Говорю как есть! Одного призрака я сам лично видел. Давно, правда. Лет десять назад.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_07");	//Интересно. Откуда на маяке призраки?
   	AI_Output(self,other,"DIA_Jack_HauntedLH_01_08");	//Я точно не знаю, что там произошло. Но люди говорят, что тот маяк проклят. А за что и почему - никто не знает.
	MIS_HauntedLighthouse = LOG_Running;
	Log_CreateTopic(TOPIC_HauntedLighthouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Running);
	B_LogEntry(TOPIC_HauntedLighthouse,"По словам Джека, на старом маяке, что расположен посреди моря у побережья Хориниса, водятся призраки.");
};

instance DIA_Jack_City(C_Info)
{
	npc = VLK_444_Jack;
	nr = 6;
	condition = DIA_Jack_City_Condition;
	information = DIA_Jack_City_Info;
	description = "Ты часто бываешь в городе?";
};


func int DIA_Jack_City_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_Job) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_City_Info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Ты часто бываешь в городе?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Я всегда говорю: город настолько хорош, насколько хорош его порт.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Порт - это ворота в мир. Здесь все встречаются, и все начинается здесь.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//А когда в порту царит запустение, город неминуемо ждет та же участь.
};


instance DIA_Jack_Harbor(C_Info)
{
	npc = VLK_444_Jack;
	nr = 70;
	condition = DIA_Jack_Harbor_Condition;
	information = DIA_Jack_Harbor_Info;
	permanent = TRUE;
	description = "Расскажи мне об этом порте.";
};


func int DIA_Jack_Harbor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_City) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Harbor_Info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Расскажи мне об этом порте.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Порт Хориниса сейчас не тот, что был раньше.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Здесь никого не осталось, кроме праздношатающегося сброда. Корабли сюда больше не заходят и торговля пришла в упадок! Этому порту, похоже, скоро придет конец.
	Info_ClearChoices(DIA_Jack_Harbor);
	Info_AddChoice(DIA_Jack_Harbor,Dialog_Back,DIA_Jack_Harbor_Back);
	Info_AddChoice(DIA_Jack_Harbor,"Почему корабли больше не приходят сюда?",DIA_Jack_Harbor_Ships);
	Info_AddChoice(DIA_Jack_Harbor,"Что ты имеешь в виду под сбродом?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice(DIA_Jack_Harbor,"Так почему ты не уедешь отсюда?",DIA_Jack_Harbor_Leave);
};

func void DIA_Jack_Harbor_Back()
{
	Info_ClearChoices(DIA_Jack_Harbor);
};

func void DIA_Jack_Harbor_Ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Почему корабли больше не приходят сюда?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//Здесь говорят, что когда война будет окончена, все вернется на круги своя. Это все чушь собачья.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Уверяю тебя, настоящий матрос всегда первым понимает, что город приходит в упадок.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Матрос чувствует это своим нутром. И я говорю тебе, забудь об этом порте, его лучшие дни давно позади.
};

func void DIA_Jack_Harbor_Rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Что ты имеешь в виду под сбродом?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Посмотри на них, это же сборище лодырей. Большинство из них даже не знает, что такое работа. Они только и делают, что пьют все дни напролет и относят свои последние гроши в бордель.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Говорю тебе, держись от них подальше.
};

func void DIA_Jack_Harbor_Leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Так почему ты не уедешь отсюда?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Сегодня никто не возьмет на корабль старого морского волка, вроде меня.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Большинство полагает, что Старый Джек ни на что не годен, и что его старые кости разъедает подагра.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//И? Они правы?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Вздор. Как только я опять почувствую под своими ногами палубу, я дам фору любому из этих нахальных юнцов.
};


instance DIA_Jack_BANDITENWEG(C_Info)
{
	npc = VLK_444_Jack;
	nr = 7;
	condition = DIA_Jack_BANDITENWEG_Condition;
	information = DIA_Jack_BANDITENWEG_Info;
	description = "Бандитов, которые захватили твой маяк, больше нет.";
};


func int DIA_Jack_BANDITENWEG_Condition()
{
	if(Npc_IsDead(LeuchtturmBandit_1021) && Npc_IsDead(LeuchtturmBandit_1022) && Npc_IsDead(LeuchtturmBandit_1023) && (MIS_Jack_KillLighthouseBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jack_BANDITENWEG_Info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Бандитов, которые захватили твой маяк, больше нет.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Это правда? Наконец-то я смогу опять вернуться к своей работе.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Пойдем со мной к маяку. Оттуда ты сможешь насладиться потрясающим видом на море.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillLighthouseBandits);
};

instance DIA_Jack_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_444_Jack;
	nr = 8;
	condition = DIA_Jack_LIGHTHOUSEFREE_Condition;
	information = DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent = FALSE;
	description = "Мне нравится твой маяк.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKnowsWayToIrdorath == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//Мне нравится твой маяк.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Спасибо! Поднимись по лестнице наверх, оттуда открывается такой потрясающий вид. Чувствуй себя здесь как дома!
};

instance DIA_Jack_SmokePipe(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Condition;
	information = DIA_Jack_SmokePipe_Info;
	permanent = FALSE;
	description = "О чем ты задумался?";
};

func int DIA_Jack_SmokePipe_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_LIGHTHOUSEFREE) == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Info()
{
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_00");	//О чем ты задумался?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_01");	//Эх...(мечтательно) Я подумал о том, что сейчас было бы неплохо выкурить добрую трубку табака!
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_02");	//Так в чем же дело?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_03");	//В том, что у меня ее нет! Моя старая трубка уже давно осыпалась, а достать новую тут проблематично.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_04");	//Особенно сейчас, когда с материка перестали приплывать корабли с торговцами.
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_05");	//А чем тебя не устроит косяк из болотника?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_06");	//Кури эту гадость сам! А я привык к хорошему табаку и трубке. Курил ее в своих странствиях по морям, и на суше всегда хранил ей верность. 
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_07");	//К тому же в холодную и ветреную погоду трубка согревала мне лицо, когда я стоял на верху маяка.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_08");	//А твой косяк вряд ли для этого сгодится!
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_09");	//Ну, если так, тогда я могу поискать ее для тебя.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_10");	//Ох, спасибо, приятель. Сделай одолжение старику! А я тебя за это щедро отблагодарю.
	MIS_JackSmokePipe = LOG_Running;
	Log_CreateTopic(TOPIC_JackSmokePipe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_Running);
	B_LogEntry(TOPIC_JackSmokePipe,"Джеку нужна новая трубка. Он пообещал щедро отблагодарить меня, если я найду ее для него.");
};

instance DIA_Jack_SmokePipe_Done(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Done_Condition;
	information = DIA_Jack_SmokePipe_Done_Info;
	permanent = FALSE;
	description = "Я принес тебе трубку.";
};

func int DIA_Jack_SmokePipe_Done_Condition()
{
	if((MIS_JackSmokePipe == LOG_Running) && (Npc_HasItems(other,ItMi_Smoke_Pipe) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_SmokePipe_Done_01_00");	//Я принес тебе трубку.
	B_GiveInvItems(other,self,ItMi_Smoke_Pipe,1);
	Npc_RemoveInvItems(self,ItMi_Smoke_Pipe,1);
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_01");	//Отлично, приятель. Это как раз то, что надо!
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_02");	//А что насчет моей награды?
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_03");	//Вот, возьми это золото. Надеюсь, такая благодарность позволит тебе забыть те утомительные поиски, которым ты себя подверг ради меня.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_04");	//Спасибо.
	MIS_JackSmokePipe = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_SUCCESS);
	B_LogEntry(TOPIC_JackSmokePipe,"Я принес Джеку новую трубку, а он отсыпал мне кучу золота.");
	AI_StopProcessInfos(self);

	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	};
};

instance DIA_Jack_KAP3_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP3_EXIT_Condition;
	information = DIA_Jack_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP4_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP4_EXIT_Condition;
	information = DIA_Jack_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP5_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP5_EXIT_Condition;
	information = DIA_Jack_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_BEMYCAPTAIN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 51;
	condition = DIA_Jack_BEMYCAPTAIN_Condition;
	information = DIA_Jack_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "Ты бы не хотел опять выйти в море?";
};


func int DIA_Jack_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (MIS_Jack_NewLighthouseOfficer == 0))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Ты бы не хотел опять выйти в море?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Я бы с радостью отдал свою правую руку только за то, чтобы кто-нибудь нанял меня на большую шхуну, хотя бы ненадолго.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Но для старого морского волка вроде меня это не так-то легко, приятель. Да и к тому же кто тогда будет присматривать за маяком?
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Забудь. Это я просто так сказал.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Я нуждаюсь в твоем опыте моряка.",DIA_Jack_BEMYCAPTAIN_seaman);
};

func void DIA_Jack_BEMYCAPTAIN_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Я нуждаюсь в твоем опыте моряка.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//Черт меня побери! Что ты задумал, приятель? Ты же не собираешься захватить королевскую военную галеру, а?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Кто знает?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(смеется) Это будет что-то! Ох, черт. Но я не могу вот так взять и бросить свой маяк. Ммм. Что же нам с этим делать?
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Джек, старый морской волк из гавани, мог бы стать хорошим капитаном. Но сначала я должен найти кого-нибудь, кто посторожит его маяк.");
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Забудь. Это я просто так сказал.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"А что если я приведу к тебе кого-нибудь?",DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer);
};

func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//А что если я приведу к тебе кого-нибудь, кто позаботился бы о маяке в твое отсутствие?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//Неплохая идея, приятель. И у меня есть подходящая кандидатура.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//У Харада, кузнеца, есть подмастерье по имени Брайан. Я много раз беседовал с ним.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Я бы хотел доверить свой маяк ему. Я думаю, он лучше всего подходит для этого.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Иди, поговори с ним. Возможно, нам повезет, и этот парень согласится помочь нам.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_Running;
};

func void DIA_Jack_BEMYCAPTAIN_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Забудь! Это я просто так сказал.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
};


instance DIA_Jack_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_444_Jack;
	nr = 52;
	condition = DIA_Jack_BEMYCAPTAIN2_Condition;
	information = DIA_Jack_BEMYCAPTAIN2_Info;
	description = "Насчет Брайана...";
};


func int DIA_Jack_BEMYCAPTAIN2_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) || ((MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_IsDead(Brian)))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN2_Info()
{
	if(Npc_IsDead(Brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Брайан мертв.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Ох. Ужасные времена. Он был таким хорошим парнем.
		MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Брайан позаботится о твоем маяке.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Я надеялся, что ты скажешь это.
		B_GivePlayerXP(XP_Jack_NewLighthouseOfficer);

		if(SCGotCaptain == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Я тебе все еще нужен?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Посмотрим, выйдет ли из этого парня толк.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Jack_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_444_Jack;
	nr = 53;
	condition = DIA_Jack_BEMYCAPTAIN3_Condition;
	information = DIA_Jack_BEMYCAPTAIN3_Info;
	description = "Будь моим капитаном.";
};


func int DIA_Jack_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_BEMYCAPTAIN2) && (SCGotCaptain == FALSE) && (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Я переплыл семь морей, приятель, но еще никогда я не был капитаном корабля.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//Я ничего не знаю о навигации. Ты должен взять на себя эти обязанности.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Я сделаю все, что будет в моих силах.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//А теперь покажи мне мой корабль и твою команду. А ты вообще знаешь, куда направляешься? Я имею в виду, у тебя есть морская карта?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Подожди меня в порту. А об остальном не волнуйся.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Ну, как скажешь.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jack_LOSFAHREN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 59;
	condition = DIA_Jack_LOSFAHREN_Condition;
	information = DIA_Jack_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Отлично, старик. Поднять паруса!";
};


func int DIA_Jack_LOSFAHREN_Condition()
{
	if((JackIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Отлично, старик. Поднять паруса!

	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Все в полном порядке! А теперь покажи мне свою морскую карту.
		AI_Output(other,self,"DIA_Jack_LOSFAHREN_14_07");	//Вот.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//Это будет нелегкое плавание, но я все же надеюсь, что мы доберемся туда целыми и невредимыми.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//У тебя действительно есть все, что тебе нужно? Мы не станем возвращаться назад только потому, что ты что-то забыл.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Если ты уверен, что у тебя есть все необходимое, иди в капитанскую каюту и вздремни немного. Силы тебе скоро понадобятся!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Полегче, приятель. Я еще даже не видел это корыто. Так не пойдет.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Сначала ты должен укомплектовать команду не менее чем из пяти человек, получить доступ на корабль и достать морскую карту. В противном случае забудь об этом.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Jack_KAP6_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP6_EXIT_Condition;
	information = DIA_Jack_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_kapitelorcattack_condition;
	information = dia_jack_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Что скажешь, капитан?";
};


func int dia_jack_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JACKBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_01_00");	//Что скажешь, капитан?
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_01");	//Да что тут говорить... Я слышал, что в Хоринисе во всю орудуют орки!
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_01_02");	//Я слышал, что несколько парней все-таки хотят попробовать прорваться через город с боем.
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_04");	//Многие из них - опытные воины и им не впервой сражаться против орков.
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_03");	//Эх, что нельзя сказать обо мне. Я ведь даже и меч толком держать не умею. Куда мне против этих тварей?
	Info_ClearChoices(dia_jack_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jack_nw_kapitelorcattack,"Предложить руну телепортации к таверне.",dia_jack_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jack_nw_kapitelorcattack,"Придется тебе попробовать.",dia_jack_nw_kapitelorcattack_nogiverune);
};

func void dia_jack_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_01");	//Подожди. У меня с собой есть руна телепортации к таверне 'Мертвая Гарпия'.
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_05");	//Пробиваться с боем через город, доверху набитый орками, - это для тебя верная смерть!
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_08");	//Да уж... ты прав. Я возьму ее, спасибо!
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_10");	//Эх! Надеюсь, после нее меня не будет опять неделю мутить, как после похмелья.
	JACKNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Джеку руну телепортации к таверне 'Мертвая Гарпия'. Теперь я спокоен за его судьбу.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jack_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Другой возможности убраться отсюда нет!
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Не думаю, что у меня получится...(обреченно) Но придется попробовать.
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Тогда удачи! Он тебе понадобится.
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_04");	//(отчаянно) Спасибо.
	B_LogEntry(TOPIC_HELPCREW,"Джек будет со всеми пробиваться с боем из захваченного города. Думаю, у него нет никаких шансов остаться в живых.");
	JACKBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_againcapitan_condition;
	information = dia_jack_nw_againcapitan_info;
	permanent = FALSE;
	description = "Моему кораблю снова нужен капитан.";
};


func int dia_jack_nw_againcapitan_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_needcapitan) && (WHOTRAVELONBIGLAND == FALSE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_00");	//Моему кораблю снова нужен капитан.
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_01");	//Хммм...(с ухмылкой) И куда же на этот раз ты собрался плыть?
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_02");	//Я плыву на материк. У меня есть очень важное сообщение для короля. Ты поможешь мне?
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_03");	//На материк?! Эх, парень... Прости, но по мне так лучше остаться тут.
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_04");	//Я слышал, что на большой земле вовсю уже хозяйничают орки.
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_05");	//Так что лучше поищи себе другого капитана.
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_06");	//Очень жаль. Я на тебя рассчитывал.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Джек отказался плыть со мной на материк.");
};

instance DIA_JACK_BANDITENWEG1(C_Info)
{
	npc = VLK_444_Jack;
	nr = 2;
	condition = dia_jack_banditenweg1_condition;
	information = dia_jack_banditenweg1_info;
	permanent = FALSE;
	description = "А что ты знаешь про пиратов?";
};

func int dia_jack_banditenweg1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jack_City))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg1_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_01_01");	//А что ты знаешь про пиратов?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_02");	//Ну... все пираты - это отъявленные головорезы, воры и негодяи!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_03");	//Правда, за жестокостью и бесчеловечностью, с коими они грабят и топят суда, порой скрывается нечто теплое и душевное.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_04");	//Например, чтобы хоть как-то скоротать время и развлечься в перерывах между грабежами, они сочиняют стихи и песни.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_05");	//И зачастую у них получаются действительно неплохие вещи! Хочешь послушать?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1,"Нет, спасибо.",dia_jack_banditenweg1_no);
	Info_AddChoice(dia_jack_banditenweg1,"Я бы не отказался.",dia_jack_banditenweg1_yes);
};

func void dia_jack_banditenweg1_no()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_no_01_01");	//Нет, спасибо.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_no_01_02");	//Что же, понимаю. Тогда всего хорошего, молодой человек. До встречи!
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yes()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yes_01_01");	//Я бы не отказался.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_02");	//Тогда слушай...(напевая под нос)
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_03");	//Ну вот и все, дружок, пора открыть кингстоны,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_04");	//К добру не привели проказы на воде.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_05");	//Ну сколько ж можно плыть к безмерно удаленной,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_06");	//К единственно своей загадочной звезде?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_07");	//Уже запал не тот, чтоб курс держать упрямо,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_08");	//И всем ветрам назло стремиться в никуда.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_09");	//И очень тяжело быть капитаном,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_10");	//Когда во тьме горит всего одна звезда.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_11");	//Не лучше ль скромно лечь на дне среди угрюмых
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_12");	//Глубоководных рыб с отравленным хвостом?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_13");	//Ведь золото лежит на дне в пиратских трюмах,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_14");	//А поверху плывет бессмысленный планктон.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_15");	//Так что ж меня влечет к границам небосклона?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_16");	//О чем терзаюсь я в бреду и наяву?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_17");	//Зачем же я опять к безмерно удаленной,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_18");	//К единственной своей плыву, плыву, плыву...
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_19");	//Кммм... ну как тебе?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1,"Так себе.",dia_jack_banditenweg1_not);
	Info_AddChoice(dia_jack_banditenweg1,"Это было прекрасно!",dia_jack_banditenweg1_yea);
};

func void dia_jack_banditenweg1_not()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_not_01_01");	//Так себе.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_not_01_02");	//Что же...(с досадой) Тогда всего хорошего, молодой человек. До встречи!
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yea()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_01");	//Это было прекрасно!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yea_01_02");	//Я знал, что тебе понравится. Это же ведь настоящая пиратская романтика!
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_03");	//Послушай, а ты сам, часом, не пират?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yea_01_04");	//Кто? Я?! (замялся) Нет, что ты! Я просто старый моряк. И всего-то...
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_05");	//Ну да, конечно.
	AI_StopProcessInfos(self);
};

instance DIA_Jack_DiscoverLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_DiscoverLH_Condition;
	information = DIA_Jack_DiscoverLH_Info;
	description = "Ты когда-нибудь слышал о пирате по прозвищу Келевра?";
};

func int DIA_Jack_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (KnowStoryDLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_DiscoverLH_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_DiscoverLH_01_00");	//Ты когда-нибудь слышал о пирате по прозвищу Келевра?
	AI_Output(self,other,"DIA_Jack_DiscoverLH_01_01");	//(задумчиво) Первый раз о таком слышу.
	AI_Output(self,other,"DIA_Jack_DiscoverLH_01_02");	//И вообще, якшаться с пиратами - не в моих правилах, сынок.
	AI_Output(other,self,"DIA_Jack_DiscoverLH_01_03");	//Ладно, я тебя понял.
	CanGoGreg = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Джек ничего не знает о пирате по прозвищу Келевра. Возможно, стоит спросить об этому у самих пиратов?");
};

instance DIA_Jack_GotPirate(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_GotPirate_Condition;
	information = DIA_Jack_GotPirate_Info;
	description = "Привет тебе, Джек.";
};

func int DIA_Jack_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (GotPirate == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_GotPirate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_GotPirate_01_00");	//Привет тебе, Келевра!
	AI_Output(self,other,"DIA_Jack_GotPirate_01_01");	//Что?!
	AI_Output(other,self,"DIA_Jack_GotPirate_01_02");	//Можешь не отпираться, Грэг мне о тебе рассказал.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_03");	//Вот трепло!.. Ну хорошо. И что с того?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_04");	//Кажется, не такой уж ты благодушный человек, каким пытаешься казаться.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_05");	//Не понимаю, о чем это ты?!
	AI_Output(other,self,"DIA_Jack_GotPirate_01_06");	//А мне кажется, все ты прекрасно понимаешь! Ведь это ты убил парня по имени Стефан, который, между прочим, спас тебе жизнь.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_07");	//Какого Белиара! Откуда тебе?.. (вхдыхает) Ладно. Вижу, что тебе и так обо всем известно. Это тебе тоже Грэг разболтал?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_08");	//Об этом мне рассказал призрак того смотрителя, которого ты убил лишь за то, что он не захотел отдавать тебе лодку.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_09");	//Да, это сделал я! Ну и что теперь? Убьешь меня? Давай! Я и сам до сих пор жалею о том, что натворил тогда.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_10");	//После того случая я завязал с пиратством, осел на берегу и стал работать смотрителем маяка, чтобы хоть как-то загладить свою вину.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_11");	//Убивать я тебя не стану. Но у меня есть идея получше. Ты поможешь мне снять проклятие с того маяка.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_12");	//Я?! Интересно... И что я должен для этого сделать? Пойти и умереть там?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_13");	//Это необязательно. Достаточно испросить прощения у призрака, чтобы сила проклятия ослабла.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_14");	//Но в одном ты был прав - пойти тебе туда все равно придется.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_15");	//Корму мне в зад! Ладно, если уж по-другому никак нельзя.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_16");	//Только... Прежде чем я пойду туда, позволь мне уладить пару вопросов здесь на берегу. Я же не знаю, вернусь я оттуда живым или нет.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_17");	//Хорошо. У есть тебя день.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_18");	//Тогда встретимся послезавтра сразу на причале у маяка.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_19");	//Увидимся. Да, и пока не забыл... что означает это прозвище - Келевра?
	AI_Output(self,other,"DIA_Jack_GotPirate_01_20");	//На языке ассасинов оно означает 'Злобный пес'. Только не спрашивай, почему меня стали так называть...
	JackGoLH = TRUE;
	JackGoLHDay = Wld_GetDay();
	B_LogEntry(TOPIC_HauntedLighthouse,"Джек во всем признался. Теперь мы с ним отправимся на маяк, чтобы попытаться снять с него проклятие.");
	AI_StopProcessInfos(self);
};

instance DIA_Jack_OnLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLH_Condition;
	information = DIA_Jack_OnLH_Info;
	important = TRUE;
};

func int DIA_Jack_OnLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackOnLH == TRUE) && (Npc_GetDistToWP(self,"NW_JACK_LH_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLH_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jack_OnLH_01_00");	//Ты все-таки пришел.
	AI_Output(self,other,"DIA_Jack_OnLH_01_01");	//За кого ты меня принимаешь, мальчик?! Если я уж дал слово, то сдержу его.
	AI_Output(other,self,"DIA_Jack_OnLH_01_02");	//Тогда идем. Только позволь говорить буду я.
	AI_Output(self,other,"DIA_Jack_OnLH_01_03");	//Как скажешь.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	JackMeetLHGhost = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Я встретился с Джеком на маяке, и мы отправились к призраку Стефана.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowLH");
};

instance DIA_Jack_OnLHDone(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLHDone_Condition;
	information = DIA_Jack_OnLHDone_Info;
	important = TRUE;
};

func int DIA_Jack_OnLHDone_Condition()
{
	if(FinishStoryLH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLHDone_Info()
{
	AI_Output(self,other,"DIA_Jack_OnLHDone_01_00");	//Якорь мне в зад! А я уж подумал, что мне конец.
	AI_Output(other,self,"DIA_Jack_OnLHDone_01_01");	//Можешь успокоиться. Все уже позади.
	AI_Output(self,other,"DIA_Jack_OnLHDone_01_02");	//Честно говоря, у меня самого после всего этого как камень с души упал.

	if(JackMeetGhost == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jack_OnLHDone_01_03");	//А что у тебя с глазом?
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_04");	//Да так, ослеп...(усмехается) Подарок на память от того призрака.
		AI_Output(other,self,"DIA_Jack_OnLHDone_01_05");	//Тебе еще повезло, что он не убил тебя.
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_06");	//И не говори. (вздыхает) Спасибо тебе за помощь, приятель. Теперь я у тебя в долгу.
		MIS_HauntedLighthouse = LOG_Success;
		Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);
		B_LogEntry(TOPIC_HauntedLighthouse,"Я снял проклятие с маяка. Теперь людям тут ничего не угрожает.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_08");	//Спасибо тебе за помощь, приятель. Теперь я у тебя в долгу.
	};

	AI_StopProcessInfos(self);

	if(JackIsCaptain == TRUE)
	{
		Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	}
	else if(MIS_JackSmokePipe == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	}
	else
	{
		if(MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"Lighthouse");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
};