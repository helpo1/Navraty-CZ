
instance DIA_Pyrokar_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_NoEnter_PissOff(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_NoEnter_PissOff_Condition;
	information = DIA_Pyrokar_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Pyrokar_WELCOME(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WELCOME_Condition;
	information = DIA_Pyrokar_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Pyrokar_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//Итак, у нас новый послушник. Я полагаю, ты уже получил задание у мастера Парлана.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//Ты же знаешь, что все в монастыре должны выполнять свои обязанности согласно воле Инноса.
};


instance DIA_Pyrokar_Hagen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Hagen_Condition;
	information = DIA_Pyrokar_Hagen_Info;
	permanent = FALSE;
	description = "Я должен поговорить с паладинами! Это срочно.";
};


func int DIA_Pyrokar_Hagen_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Я должен поговорить с паладинами! Это срочно.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//Ты кажешь нам, о чем ты собираешься говорить с ними?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//У меня для них важное сообщение.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//Что это за сообщение?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//Армия зла собирается в Долине Рудников. Ее возглавляют драконы! Мы должны остановить их, пока это еще возможно.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Хм. Мы должны обдумать твои слова, послушник. Когда придет время, мы дадим тебе знать, что по этому поводу решил Совет.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//А пока тебе лучше уделить самое пристальное внимание своим обязанностям послушника.
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_Auge(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Auge_Condition;
	information = DIA_Pyrokar_Auge_Info;
	permanent = FALSE;
	description = "Я ищу Глаз Инноса.";
};


func int DIA_Pyrokar_Auge_Condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Auge_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Я ищу Глаз Инноса.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Любой, кто полагает, что он может не только найти этот священный амулет, но также и носить его - идиот.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//Этот амулет сам выбирает своего хозяина - только тот, кто судьбой предназначен для этого, способен носить его.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Я все же хотел бы попробовать.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Обязанность послушника проявлять смирение - не желания.
	B_LogEntry(TOPIC_INNOSEYE,"Я не думал, что это будет так непросто, но Пирокар не отдаст Глаз добровольно, здесь не обойтись без помощи паладинов.");
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Что ж, мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Pyrokar_MissingPeople(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Addon_Pyrokar_MissingPeople_Condition;
	information = DIA_Addon_Pyrokar_MissingPeople_Info;
	description = "Жители Хориниса таинственным образом исчезают.";
};


func int DIA_Addon_Pyrokar_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pyrokar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Жители Хориниса таинственным образом исчезают.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//Мне это известно, и я глубоко опечален этими исчезновениями. Но этим делом занимаются маги воды.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//Они же пытаются выяснить причины странных землетрясений, происходящих в северо-восточной части Хориниса.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//До сих пор они не давали мне понять, что им требуется наша помощь. Поэтому мы не предпринимаем никаких действий.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Да, но...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//Никаких 'но'! Мы будем поступать так, как считаем нужным, и я надеюсь, что ты это поймешь.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Маги Огня огорчены исчезновениями горожан. Однако они говорят, что этим должны заниматься маги Воды. В монастыре мне не удастся найти помощь по этому вопросу.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_GOAWAY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_GOAWAY_Condition;
	information = DIA_Pyrokar_GOAWAY_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pyrokar_GOAWAY_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Pyrokar_MissingPeople) == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Pyrokar_Hagen) && Npc_KnowsInfo(other,DIA_Pyrokar_Auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(раздраженно) Смирение - благодетель, которой тебе еще предстоит научиться. Так или иначе.
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_FIRE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_FIRE_Condition;
	information = DIA_Pyrokar_FIRE_Info;
	permanent = FALSE;
	description = "Я хочу пройти Испытание Огнем!";
};


func int DIA_Pyrokar_FIRE_Condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FIRE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Я хочу пройти Испытание Огнем!
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//Так ты знаешь о...(удивленно) Ты хочешь пройти Испытание Огнем?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Да, я ссылаюсь на Закон Огня, который гласит...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(резко прерывает) Мы знаем Закон Огня. Мы также видели, как множество послушников погибли при прохождении этого испытания. Ты должен пересмотреть свое решение.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Я хочу пройти это испытание - и я пройду его.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(предупреждающе) Если ты категорически настаиваешь, Высший Совет подвергнет тебя этому испытанию.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Я настаиваю на прохождении Испытания Огнем.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//В таком случае - так тому и быть. Когда ты будешь готов, каждый из магов Высшего Совета даст тебе задание, которое ты должен будешь выполнить.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Да сжалится Иннос над твоей душой.
	B_LogEntry(TOPIC_FireContest,"Я потребовал у Пирокара пройти Испытание Огнем. Теперь я должен выполнить три задания Высшего совета.");
};


instance DIA_Pyrokar_TEST(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_TEST_Condition;
	information = DIA_Pyrokar_TEST_Info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int DIA_Pyrokar_TEST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEST_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Я готов пройти испытание, Мастер.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//И только одному Инносу ведомо, пройдешь ли ты его. Ты будешь подвергнут тому же испытанию, что и избранные послушники.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Испытанию Огнем!...(надменно) Ты, вероятно, знаешь, что только ОДИН из послушников сможет пройти это испытание.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//Понимаю. А кто мои соперники?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Иннос в своей мудрости выбрал троих послушников, которые должны подвергнуться этому испытанию: Агон, Игарац и Ульф. Они уже приступили к поискам.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//Но хватит об этом! Услышь слова этого испытания: 'Следуй знакам Инноса и принеси то, что верующий находит в конце пути'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Тебе понадобится этот ключ.
	Log_CreateTopic(TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Schnitzeljagd,LOG_Running);
	B_LogEntry(TOPIC_Schnitzeljagd,"Пирокар дает мне Испытание Огня. Это то же самое испытание, что должны пройти избранные послушники Ульф, Игарац и Агон.");
	B_LogEntry_Quiet(TOPIC_Schnitzeljagd,"Я должен следовать знакам Инноса и 'принести то, что верующий находит в конце пути'. Также он дал мне ключ.");
	CreateInvItems(self,ItKe_MagicChest,1);
	B_GiveInvItems(self,other,ItKe_MagicChest,1);
	B_StartOtherRoutine(Igaraz,"CONTEST");
	AI_Teleport(Igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(Igaraz,ItKe_MagicChest,1);
	Igaraz.aivar[AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar[AIV_NewsOverride] = TRUE;
	B_StartOtherRoutine(Nov607,"EXCHANGE");
	B_StartOtherRoutine(Agon,"GOLEMDEAD");
	AI_Teleport(Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(Agon,ItKe_MagicChest,1);
	Agon.aivar[AIV_DropDeadAndKill] = TRUE;
	Agon.aivar[AIV_NewsOverride] = TRUE;
	B_StartOtherRoutine(Ulf,"SUCHE");
	AI_Teleport(Ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(Ulf,ItKe_MagicChest,1);
	Ulf.aivar[AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar[AIV_NewsOverride] = TRUE;
	MIS_SCHNITZELJAGD = LOG_Running;
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_RUNNING(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 20;
	condition = DIA_Pyrokar_RUNNING_Condition;
	information = DIA_Pyrokar_RUNNING_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Pyrokar_RUNNING_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_RUNNING_Info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Пока ты не пройдешь это испытание, нам нечего сказать тебе.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Чего ты ждешь? Иди, проходи испытание!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Пришло время подтвердить твои громкие слова делами. Тебе так не кажется, послушник?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_SUCCESS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SUCCESS_Condition;
	information = DIA_Pyrokar_SUCCESS_Info;
	permanent = FALSE;
	description = "Я нашел рунный камень.";
};

func int DIA_Pyrokar_SUCCESS_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (MageFireChestOpen == TRUE) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",ItMi_RuneBlank) && ((Npc_HasItems(other,ItMi_RuneBlank) >= 1) || (Npc_HasItems(other,ItRu_FireBolt) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SUCCESS_Info()
{
	B_GivePlayerXP(XP_SCHNITZELJAGD);
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Я нашел рунный камень.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(недоверчиво) Ты сделал это? Ты следовал знакам и нашел скрытый портал...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//...и одной левой победил всех тех монстров, что уже считали меня своей добычей.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//А другие послушники? Что насчет Агона? Они не опередили тебя?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Они не смогли. Я думаю, им было не суждено пройти это испытание.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Что ж, в таком случае мы объявляем, что ты прошел это испытание. А этот рунный камень теперь твой.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Schnitzeljagd,LOG_SUCCESS);
	B_LogEntry(TOPIC_Schnitzeljagd,"Я прошел Испытание Огнем, которое дал мне Пирокар!");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Igaraz,"Start");
	Igaraz.aivar[AIV_DropDeadAndKill] = FALSE;
	Igaraz.aivar[AIV_NewsOverride] = FALSE;
	B_StartOtherRoutine(Nov607,"Start");
	B_StartOtherRoutine(Agon,"Start");
	Agon.aivar[AIV_DropDeadAndKill] = FALSE;
	Agon.aivar[AIV_NewsOverride] = FALSE;
	B_StartOtherRoutine(Ulf,"Start");
	Ulf.aivar[AIV_DropDeadAndKill] = FALSE;
	Ulf.aivar[AIV_NewsOverride] = FALSE;
};

instance DIA_Pyrokar_Todo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Todo_Condition;
	information = DIA_Pyrokar_Todo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Pyrokar_Todo_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Todo_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Ты прошел испытание, которому подверг тебя я.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Но...

	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... тебе еще необходимо пройти испытание Ультара.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... тебе еще необходимо выполнить задание Серпентеса.
	};

	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_MAGICAN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_MAGICAN_Condition;
	information = DIA_Pyrokar_MAGICAN_Info;
	permanent = FALSE;
	description = "Теперь я буду принят в Гильдию Магов?";
};

func int DIA_Pyrokar_MAGICAN_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAGICAN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Теперь я буду принят в Гильдию Магов?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Ты сделал это. Ты прошел Испытание Огнем. Мы с самого начала были уверены, что ты преуспеешь в этом.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(настойчиво) Мы также уверены, что ты продолжишь прилагать все усилия, чтобы стать ДОСТОЙНЫМ слугой Инноса.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Итак, если ты готов принять Клятву Огня, ты будешь принят в наши ряды.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_100_01");	//Но прежде у меня есть последнее задание для тебя, как избранного послушника Инноса. Иди к Каррасу, он все расскажет тебе в подробностях!
	MIS_KARRAS_BOOKS = LOG_Running;
	Log_CreateTopic(TOPIC_HELPKARRASBOOKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_Running);
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Пирокар сказал, что меня примут в маги только после выполнения последнего задания. Что именно нужно делать он не сказал, но от правил меня к Каррасу.");
};

instance DIA_Pyrokar_OATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_OATH_Condition;
	information = DIA_Pyrokar_OATH_Info;
	permanent = FALSE;
	description = "Я готов вступить в Круг Огня.";
};

func int DIA_Pyrokar_OATH_Condition()
{
	if((hero.guild == GIL_NOV) && (MIS_KARRAS_BOOKS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_OATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Я готов вступить в Круг Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Хорошо, тогда принеси Клятву Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(торжественно) Клянешься ли ты, перед лицом Инноса Всемогущего, его слуг и Священного Огня...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... что с этого момента и до конца дней вся жизнь твоя будет едина с огнем...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... до тех пор пока твое тело и душа не найдут покой в этих священных чертогах и пламя твоей жизни не угаснет?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Клянусь.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Произнеся слова этой клятвы, ты присоединился к Соглашению Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Носи эту робу в знак этих вечных уз.
	CreateInvItems(self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItAr_KDF_L,1);

	if(CanTeachTownMaster == FALSE)
	{
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_KDF;
	other.protection[PROT_FIRE] += 10;
	REALPROTFIRE += 10;
	AI_PrintClr("Защита от огня + 10",83,152,48);
	CheckHeroGuild[0] = TRUE;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_1A");	//Также прими от меня этот посох. Только нам - магам Огня - дарована честь обладать им и распоряжаться его силой!
	Npc_ExchangeRoutine(Lothar,"START");
	Fire_Contest = TRUE;
	Snd_Play("GUILD_INV");
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 15;
	B_GivePlayerXP(XP_BecomeMage);
	CreateInvItems(self,ITMW_2H_G3_STAFFFIRE_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFFIRE_01,1);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Теперь, когда ты был принят в наши ряды, ты можешь поговорить с лордом Хагеном, главнокомандующим паладинов.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Нам также очень интересно знать, как он оценивает ситуацию. Так что ты теперь можешь отправляться в Хоринис.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Мы ожидаем, что ты принесешь его ответ немедленно.
	AI_StopProcessInfos(self);
};

instance DIA_Pyrokar_Lernen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Lernen_Condition;
	information = DIA_Pyrokar_Lernen_Info;
	permanent = FALSE;
	description = "Что я могу изучить теперь?";
};


func int DIA_Pyrokar_Lernen_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Lernen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Что я могу изучить теперь?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Прежде всего, теперь ты имеешь право изучать Круги магии. Они дадут тебе власть над рунами.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Чем выше ты будешь подниматься в шести Кругах магии, тем более сильными заклинаниями ты сможешь овладеть.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_10");	//Брат Парлан введет тебя в первый Круг магии и научит созданию рун. И не забывай также повышать свою магическую силу!
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry(Topic_KlosterTeacher,"Брат Парлан введет меня в первый Круг магии и может посвятить меня в тайны Огня.");
};


instance DIA_Pyrokar_Wunsch(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Wunsch_Condition;
	information = DIA_Pyrokar_Wunsch_Info;
	permanent = FALSE;
	description = "Я хотел бы высказать пожелание...";
};


func int DIA_Pyrokar_Wunsch_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Wunsch_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Я хотел бы высказать пожелание...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//После принятия в наши ряды, каждый маг обладает правом на первый шаг.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Итак, каким же будет твой первый шаг в качестве мага?
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
	Info_AddChoice(DIA_Pyrokar_Wunsch,"Ничего.",DIA_Pyrokar_Wunsch_Nothing);
	if(MIS_HelpBabo == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Позволь послушнику Бабо возглавить монастырский сад.",DIA_Pyrokar_Wunsch_Babo);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Позволь послушнику Ополосу получить доступ в библиотеку.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"Позволь послушнику Дуриану остаться в монастыре.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

func void DIA_Pyrokar_Wunsch_Nothing()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Никаким.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(удивленно) Да будет так. Новый маг отказывается от первого шага.
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");

	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Позволь послушнику Дуриану остаться в монастыре.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Этому послушнику будет позволено остаться в монастыре, и он займет место садовника, которое сейчас вакантно.
	B_GivePlayerXP(XP_HelpDyrian);
	B_StartOtherRoutine(Dyrian,"FAVOUR");
	MIS_HelpDyrian = LOG_SUCCESS;
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Babo()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Позволь послушнику Бабо возглавить монастырский сад.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//С сего момента, послушник Бабо будет отвечать за монастырский сад.
	B_GivePlayerXP(XP_HelpBabo);
	B_StartOtherRoutine(Babo,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpBabo = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_OpolosStudy,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Opolos()
{
	AI_Teleport(Dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Позволь послушнику Ополосу получить доступ в библиотеку.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//С сего момента послушнику Ополосу будет позволено изучать писания Инноса.
	B_GivePlayerXP(XP_HelpOpolos);
	B_StartOtherRoutine(Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	MIS_HelpOpolos = LOG_SUCCESS;
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_DyrianDrin,LOG_OBSOLETE);
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
		Log_SetTopicStatus(TOPIC_BaboGaertner,LOG_OBSOLETE);
	};
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};


instance DIA_Pyrokar_Nachricht(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Nachricht_Condition;
	information = DIA_Pyrokar_Nachricht_Info;
	permanent = FALSE;
	description = "Я принес новости от лорда Хагена.";
};


func int DIA_Pyrokar_Nachricht_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Nachricht_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Я принес новости от лорда Хагена. Он хочет получить доказательства присутствия драконов и армии Зла.
	if(EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport(Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//Поэтому я должен отправиться в Долину Рудников и доставить ему эти доказательства.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Хорошо. Ты выполнишь этот приказ. Паладин Сержио сопроводит тебя к Проходу.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Да хранит тебя Иннос.
		Sergio_Follow = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Я отправляюсь в Долину Рудников.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Хорошо. Так как ты уже знаешь путь в долину, тебе не нужен эскорт.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Выполни это задание лорда Хагена - да хранит тебя Иннос.
	};
};

instance DIA_Pyrokar_TEACH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 4;
	condition = DIA_Pyrokar_TEACH_Condition;
	information = DIA_Pyrokar_TEACH_Info;
	permanent = TRUE;
	description = "Обучи меня шестому Кругу магии. (Очков обучения: 100)";
};

func int DIA_Pyrokar_TEACH_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan))
	{
		if((MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_TEACH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Обучи меня последнему Кругу Магии.

	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if(B_TeachMagicCircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Много времени прошло с тех пор, как ты связал себя с Огнем. Многое произошло с тех пор, но покоя все нет.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Ты Избранный Инноса. И тебе понадобятся все твои силы, чтобы победить в этой битве.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Я посвящаю тебя, о, Избранный. Ты входишь в шестой Круг - да принесешь ты с собой свет и рассеешь тьму.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Теперь ты можешь узнать формулы этого последнего круга от меня, если ты того желаешь.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ох - и еще одно. Мне понадобилось некоторое время, чтобы признать тебя.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//Ты получил это письмо от меня, когда они швырнули тебя за Барьер.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Да, ты таким образом избавил меня от пустой болтовни судьи.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//И ты Избранный Инноса.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Получи же теперь мое благословение, о Избранный!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Иннос, свет солнца и огонь дерева, благослови этого человека, твоего избранного слугу.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Дай ему мужество, силу и мудрость следовать по пути, который ты предначертал ему.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Время для этого еще не пришло. Когда ты пройдешь чуть дальше по пути, который Иннос покажет тебе, я обучу тебя.
	};
};


instance DIA_Pyrokar_SPELLS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SPELLS_Condition;
	information = DIA_Pyrokar_SPELLS_Info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};

func int DIA_Pyrokar_SPELLS_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan) && ((PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE) || (PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPELLS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Обучи меня.
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
	Info_AddChoice(DIA_Pyrokar_SPELLS,Dialog_Back,DIA_Pyrokar_SPELLS_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Pyrokar_SPELLS_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,b_buildlearnstringforrunes(NAME_SPL_FireMeteor,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FireMeteor)),DIA_Pyrokar_SPELLS_FireMeteor);
	};
};

func void DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
};

func void DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Pyrokar_SPELLS_FireMeteor()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FireMeteor);
};

instance DIA_Pyrokar_Parlan(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_Parlan_Condition;
	information = DIA_Pyrokar_Parlan_Info;
	permanent = FALSE;
	description = "Меня прислал Парлан.";
};

func int DIA_Pyrokar_Parlan_Condition()
{
	if((hero.guild == GIL_KDF) && (Parlan_Sends == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Parlan_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Меня прислал Парлан. Я хочу повысить мои магические способности
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Что ж, ты многое узнал, и твоя сила выросла. С этого момента ты будешь учиться у меня.
};


instance DIA_Pyrokar_TEACH_MANA(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_TEACH_MANA_Condition;
	information = DIA_Pyrokar_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_Pyrokar_TEACH_MANA_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pyrokar_Parlan))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Я чувствую, как магическая энергия течет через тебя, не зная преград. Даже я не могу показать тебе, как повысить ее еще больше.
	};
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
};

func void DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
};


instance DIA_Pyrokar_PERM(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PERM_Condition;
	information = DIA_Pyrokar_PERM_Info;
	permanent = TRUE;
	description = "(благословение)";
};


func int DIA_Pyrokar_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Благослови меня, мастер.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Как насчет благословения? Мне оно не помешало бы.
	};
	if((Kapitel == 5) && (MIS_PyrokarClearDemonTower == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Да увенчается успехом твоя последняя битва против нашего заклятого врага. Да пребудет с тобой Иннос.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Да встанет Иннос между тобой и болью на всех нечестивых путях, по которым тебе суждено пройти.
	};
};


instance DIA_Pyrokar_KAP3_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP3_EXIT_Condition;
	information = DIA_Pyrokar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_BACKFROMOW(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BACKFROMOW_Condition;
	information = DIA_Pyrokar_BACKFROMOW_Info;
	description = "Я пришел из старой Долины Рудников.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition()
{
	if((Kapitel >= 3) && (Kapitel < 6) && (MIS_OLDWORLD == LOG_SUCCESS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Я пришел из старой Долины Рудников.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Что ты можешь доложить?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Враг сформировал там армию из орков и драконов.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//Мы уже узнали это от Милтена - но что насчет королевского груза руды?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Шахты, в которых идет добыча в долине, не могут удовлетворить потребности короля.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Дни становятся темнее, а свет солнца все тусклее.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//На меня напали люди в черных рясах.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Я знаю! Это темные маги, приспешники Белиара. Остерегайся их! Они попытаются овладеть тобой.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Будучи одержимым, ты больше не будешь самим собой. Только здесь, в монастыре сможешь ты найти помощь. Так что будь осторожен.

	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry(TOPIC_DEMENTOREN,"Пирокар рассказал мне о людях в черных рясах. Это приспешники Белиара. Он предупредил меня, что они могут сделать меня одержимым. Если это произойдет, я должен немедленно возвращаться в монастырь.");
	};
	if((Npc_IsDead(Karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Я попросил Карраса заняться этим вопросом. Ему наверняка скоро удастся лучше понять эту проблему, что позволит нам видеть яснее.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Пирокар приказал Каррасу ликвидировать угрозу, исходящую от темных магов.");
	};

	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Помни, мы должны сопротивляться, иначе нам всем настанет конец.
};


instance DIA_Pyrokar_GIVEINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 31;
	condition = DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information = DIA_Pyrokar_GIVEINNOSEYE_Info;
	description = "Я пришел, чтобы забрать Глаз Инноса.";
};


func int DIA_Pyrokar_GIVEINNOSEYE_Condition()
{
	if((Kapitel == 3) && (Npc_HasItems(hero,ItWr_PermissionToWearInnosEye_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//Я пришел, чтобы забрать Глаз Инноса.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Я вижу, ты получил позволение лично от лорда Хагена носить Глаз Инноса.

	if(DarkPathStartPyr == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Но боюсь, мне придется разочаровать тебя. Мы стали жертвами вероломного плана врага.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Глаз Инноса был нагло украден из этих священных стен.

		if(hero.guild == GIL_KDF)
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"Кто мог совершить столь дерзкий поступок, мастер?",DIA_Pyrokar_GIVEINNOSEYE_wer);
		}
		else
		{
			Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"Кто это сделал?",DIA_Pyrokar_GIVEINNOSEYE_wer);
		};
	}
	else
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_01");	//Как видишь.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_02");	//Хорошо! Тогда ты можешь его забрать. Вот, теперь он твой.
		B_GiveInvItems(self,other,ItMi_InnosEye_Bad,1);
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_03");	//Благодарю тебя, мастер.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_04");	//Храни его! И помни, что подобные вещи никогда не должны попасть в руки зла.
		AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_Bad_01_05");	//Теперь ступай. Да освятит твой путь Иннос, сын мой...
		B_LogEntry(TOPIC_INNOSEYE,"Пирокар отдал мне артефакт Инноса. Теперь мне стоит отправиться к кругу Солнца и передать его Темному вестнику. Этим я докажу, что достоин служить Белиару!");
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(DMT_2200_DarkSpeaker,"Circle");
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Кто мог совершить столь дерзкий поступок, мастер?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Кто сделал это?
	};

	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Зло коварно, и обычно действует тайно. Крайне редко можно видеть, как оно выползает на свет божий, чтобы открыто проводить в жизнь свои махинации.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//Но в эти дни все стало по-другому. Враг теперь действует в открытую на каждой улице, в каждом доме и на каждой площади.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//Это может означать только, что он больше не боится своего противника, и не собирается отступать ни перед чем.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Один из наших самых верных последователей, кандидат на священную робу Мага Огня, неожиданно изменил свою веру и сделал это в вызывающе дьявольской манере. Это Педро.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Враг овладел им, нанеся тем самым ужасное поражение всем нам.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Педро пробил себе дорогу мечом в наши самые священные покои и украл Глаз.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Я боюсь, что он просто слишком много времени проводил наедине, за воротами и защитными стенами монастыря, открытый для опасностей всякого рода.
	Pedro.flags = 0;
	Pedro_Traitor = TRUE;
	B_LogEntry(TOPIC_INNOSEYE,"Невероятно. Хотя я ожидал чего-то подобного. Я опоздал, эти тупицы из монастыря позволили какому-то послушнику украсть Глаз, и теперь мне придется гнаться за предателем Педро и надеяться, что он еще не продал Глаз кому-нибудь.");
	MIS_TraitorPedro = LOG_Running;
	Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_Running);
	B_LogEntry(TOPIC_TraitorPedro,"Предатель Педро украл Глаз Инноса из монастыря. Как я понимаю, маги Огня теперь из кожи вон лезут, чтобы найти этого предателя.");
};

instance DIA_Pyrokar_NOVIZENCHASE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 34;
	condition = DIA_Pyrokar_NOVIZENCHASE_Condition;
	information = DIA_Pyrokar_NOVIZENCHASE_Info;
	description = "Куда побежал этот вор?";
};


func int DIA_Pyrokar_NOVIZENCHASE_Condition()
{
	if((Kapitel == 3) && (Pedro_Traitor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Куда побежал этот вор?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Педро убил несколько послушников, пытавшихся остановить его, и растворился в утреннем тумане.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Многие послушники бросились за ним в погоню, чтобы вернуть Глаз назад, на его законное место.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Если ты хочешь догнать их, то поторопись, пока Педро не стал недосягаемым.
	MIS_NovizenChase = LOG_Running;
};


instance DIA_Pyrokar_FOUNDINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 35;
	condition = DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information = DIA_Pyrokar_FOUNDINNOSEYE_Info;
	description = "Я нашел Глаз Инноса.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Я нашел Глаз Инноса. Он поврежден.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Но... этого не может быть. Что произошло?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Его заполучили в свои руки заказчики весьма отвратительного вида. Так получилось, что я прибыл слишком поздно.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//Они выполняли странный обряд на пьедестале в форме полумесяца в здешнем лесу.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Да пребудет с нами Иннос! Они осквернили наш Круг Солнца.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Даже в своих худших кошмарах не мог я представить, что они обладают такой силой.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Что мы теперь можем сделать?",DIA_Pyrokar_FOUNDINNOSEYE_was);
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Что мы теперь можем сделать?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Враг стал очень силен. Но все же, этот древний артефакт представлял серьезную угрозу для него.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Мы должны исцелить Глаз и восстановить его былую силу. Но время работает против нас.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Я даже представить себе не могу, что теперь ждет всех нас. Без защиты Глаза, мы беспомощны и находимся полностью в руках врага.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Иди в город, к Ватрасу, магу Воды. В этой ужасной ситуации, только он знает, что нужно делать. Отнеси Глаз ему, и поторопись.
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,Dialog_Back,DIA_Pyrokar_FOUNDINNOSEYE_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Почему Ватрас?",DIA_Pyrokar_FOUNDINNOSEYE_was_vatras);
	};
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"Что такое Круг Солнца?",DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis);
	B_LogEntry(TOPIC_INNOSEYE,"Пирокар хочет, чтобы я спросил у мага воды Ватраса, находящегося в городе, совета о том, что можно сделать с поврежденным Глазом.");
	MIS_Pyrokar_GoToVatrasInnoseye = LOG_Running;
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Почему Ватрас?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Привилегия ношения робы мага не дает тебе права обсуждать мои приказы, брат.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Ватрас слуга Аданоса. Только знания Магов Воды могут принести нам прояснение в этот мрачный час.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//Это все, что тебе нужно знать.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Что такое Круг Солнца?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Каждый год все маги и послушники монастыря отправляются к этому месту во время солнцестояния, чтобы отметить начало нового цикла.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//Это место наполняется безмерной силой солнца.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//У меня никогда даже мысль такая не появлялась, что эту силу можно обратить. И все же это произошло.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter()
{
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
};


instance DIA_Pyrokar_SPOKETOVATRAS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information = DIA_Pyrokar_SPOKETOVATRAS_Info;
	description = "Я говорил с Ватрасом.";
};


func int DIA_Pyrokar_SPOKETOVATRAS_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Я говорил с Ватрасом.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//Ах, хорошо. Где он?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Он готовит ритуал в Круге Солнца, чтобы исцелить Глаз Инноса.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Если это правда, то, может быть, у нас все же сеть надежда.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Ватрас хочет, чтобы Ксардас и ты помогли ему в этом.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//ЧТО? Ксардас тоже будет там? Ты ведь это не серьезно.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Послушай. Это не мое решение. Ватрас настаивает.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Всегда и всюду этот Ксардас. Я устал от этого. Ничего не может быть хуже.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Откуда мне знать, что этот Ксардас не в союзе с нашим врагом?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Я не могу доверять Ксардасу. И не важно, что мы так нуждаемся в нем.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Извини, но я не могу помочь Ватрасу при таких условиях.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Pyrokar_XARDASVERTRAUEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information = DIA_Pyrokar_XARDASVERTRAUEN_Info;
	description = "Без тебя ничего не получится!";
};


func int DIA_Pyrokar_XARDASVERTRAUEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SPOKETOVATRAS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Без тебя ничего не получится! Ватрас не сможет провести этот ритуал.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Ты должен довериться Ксардасу.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Я ничего не могу поделать, ты слышишь? У меня нет ни малейшего доказательства, что Ксардас не работает против нас. Я не могу сделать это.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//А что если я принесу тебе доказательство?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//Боюсь, это невозможно. Это должно быть что-то, что действительно потрясет меня.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//Что касается Ксардаса, то у меня большие сомнения насчет того, что он вообще может произвести на меня впечатление.
	B_LogEntry(TOPIC_INNOSEYE,"Пирокара прямо в дрожь бросает, когда он слышит о Ксардасе. Я должен обсудить с Ксардасом, как заставить Пирокара принять участие в ритуале в Круге Солнца.");
	Pyrokar_DeniesInnosEyeRitual = TRUE;
};


instance DIA_Pyrokar_BUCHZURUECK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BUCHZURUECK_Condition;
	information = DIA_Pyrokar_BUCHZURUECK_Info;
	description = "Я принес эту книгу от Ксардаса.";
};


func int DIA_Pyrokar_BUCHZURUECK_Condition()
{
	if(Npc_HasItems(other,ItWr_XardasBookForPyrokar_Mis) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHZURUECK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Я принес эту книгу от Ксардаса.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//Это знак его доверия.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Покажи.
	B_GiveInvItems(other,self,ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems(self,ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(пораженно) Но это невероятно! Ты имеешь хоть малейшее представление о том, что ты только что дал мне?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ээээ. Нет.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(сердито) Это древний, давно потерянный том из давно прошедших дней.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//Мы все думали, что он утерян навсегда, и теперь я узнаю, что Ксардас все это время знал, что сталось с ним.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Так ты будешь присутствовать на ритуале?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Да, я отправляюсь в Круг Солнца, но, конечно, не потому, что я убедился в добрых намерениях Ксардаса.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//На самом деле, я собираюсь заставить этого шакала объяснить, где он прятал эту книгу столько долгих лет. На этот раз он, определенно, зашел слишком далеко.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Увидимся в Круге Солнца.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	B_LogEntry(TOPIC_INNOSEYE,"Пирокар, наконец, согласился отправиться к Кругу Солнца.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};


instance DIA_Pyrokar_PRERITUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_PRERITUAL_Condition;
	information = DIA_Pyrokar_PRERITUAL_Info;
	permanent = TRUE;
	description = "Ты думаешь, вы сможете восстановить Глаз?";
};


func int DIA_Pyrokar_PRERITUAL_Condition()
{
	if((Pyrokar_GoesToRitualInnosEye == TRUE) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PRERITUAL_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Ты думаешь, вы сможете восстановить Глаз?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Трудно сказать. Поживем - увидим.
};


instance DIA_Pyrokar_AUGEGEHEILT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_AUGEGEHEILT_Condition;
	information = DIA_Pyrokar_AUGEGEHEILT_Info;
	description = "Вы сделали это. Глаз Инноса исцелен.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AUGEGEHEILT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Вы сделали это! Глаз Инноса исцелен.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//Я почти не верил, что это возможно.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Да, мастер.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//Ты уже неоднократно доказал, что готов к вступлению в Высший Орден Магов Огня.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//С этого дня ты являешься членом Совета и будешь представлять наш Орден по всему свету. Теперь ты один из высших Магов Огня.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Носи эту священную робу и магический посох с достоинством. Неси в мир порядок, честь и славу, брат мой!
		CreateInvItem(hero,ItMW_Addon_Stab01);
		CreateInvItems(self,ItAr_KDF_H,1);
		B_GiveInvItems(self,other,ItAr_KDF_H,1);
		heroGIL_KDF2 = TRUE;
	};
};

instance DIA_Pyrokar_KAP3_READY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_KAP3_READY_Condition;
	information = DIA_Pyrokar_KAP3_READY_Info;
	description = "Что мне остается сделать здесь?";
};

func int DIA_Pyrokar_KAP3_READY_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Pyrokar_AUGEGEHEILT))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_READY_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Что мне остается сделать здесь?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Не трать свое время на тривиальные вещи. Иди и уничтожь драконов! Вот, возьми Глаз.
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Помни, что тебе нужно сначала поговорить с драконом, прежде чем ты сможешь атаковать его.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Сила Глаза заставит драконов говорить с тобой, и говорить правду.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Кроме того, он даст защиту от их атак.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Однако его сила не вечна. Тебе придется снова пополнять его магической энергией.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//Для этого тебе понадобится эссенция из сердца дракона, которую нужно объединить с Глазом на алхимическом столе.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Только тогда ты сможешь приблизиться к очередному дракону.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Спасибо. Я запомню это.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Теперь у тебя есть все необходимое. Иди же, у тебя не так много времени!
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP(XP_Ambient);
	CreateInvItems(Gorax,ItMi_RuneBlank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_Running);
	B_LogEntry(TOPIC_DRACHENJAGD,"Теперь я готов к встрече с драконами. Глаз Инноса поможет мне уничтожить их. Но прежде чем вступать в битву с драконами, я должен не забыть надеть его. Я должен поговорить с драконами, прежде чем начинать сражение. Проблема состоит в том, что Глаз теряет свою силу каждый раз, когда я разговариваю с одним из них. Чтобы восстановить силу этого амулета, мне необходимо сердце дракона и пустая мензурка. Я должен объединить ослабленный камень и экстракт из драконьего сердца на алхимическом столе, прежде чем противостоять другому дракону.");
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"Start");
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	B_Chapter4_OneTime = TRUE;
	IntroduceCH_04 = TRUE;
};


instance DIA_Pyrokar_BUCHDERBESSENEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 39;
	condition = DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information = DIA_Pyrokar_BUCHDERBESSENEN_Info;
	description = "Я нашел странный альманах.";
};


func int DIA_Pyrokar_BUCHDERBESSENEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_BACKFROMOW) && Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Я нашел странный альманах.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Да? Что это за альманах?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Я не уверен. Я думал, ты можешь знать, что делать с ним.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//Воистину, это очень тревожный знак. Я рад, что ты принес его мне. Это было мудро.
	B_GivePlayerXP(XP_Ambient);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Я полагаю, что он не единственный. Иди и найди еще эти книги проклятия.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Я подозреваю, что это инструмент темных магов.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Они используют его, чтобы контролировать потерянные души своих жертв.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Они, очевидно, записывают имена тех, кем они планируют овладеть, в эти книги.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Послушай. Я дам тебе это магическое письмо. Оно покажет тебе имена, записанные в этих книгах.
		CreateInvItems(self,ItWr_PyrokarsObsessionList,1);
		B_GiveInvItems(self,other,ItWr_PyrokarsObsessionList,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Найди этих жертв и принеси мне их книги. Я избавлюсь от них.
		if(Npc_IsDead(Karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Но сначала ты должен показать хотя бы одну из них Каррасу. Может, это поможет ему в его исследованиях.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//И не сделай ошибку, попытавшись уничтожить их самостоятельно. Ты еще не готов выдержать их силу.
		B_LogEntry(TOPIC_DEMENTOREN,"Пирокар хочет, чтобы Альманах Одержимых не принес вреда. Он дал мне список всех, кого темные маги планируют сделать одержимыми. В этом списке Пирокара позднее могут появиться новые имена.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Не приближайся к ним, иначе они овладеют тобой.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Если ты все же поймешь, что не в состоянии сопротивляться их зову, возвращайся ко мне как можно скорее.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Только здесь, в монастыре, твоя душа может быть спасена.
	if((Npc_IsDead(Karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//А от их ментальных атак нет никакой защиты?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Защита возможна. Каррас может знать что-нибудь об этом.
		Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Каррас должен помочь мне найти защиту от ментальных атак темных странников.");
	};
};

instance DIA_Pyrokar_SCOBSESSED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 70;
	condition = DIA_Pyrokar_SCOBSESSED_Condition;
	information = DIA_Pyrokar_SCOBSESSED_Info;
	permanent = TRUE;
	description = "Я думаю, я одержим. Ты можешь исцелить меня?";
};

func int DIA_Pyrokar_SCOBSESSED_Condition()
{
	if(SC_IsObsessed == TRUE)
	{
		return TRUE;
	};
};


var int Got_HealObsession_Day;

func void DIA_Pyrokar_SCOBSESSED_Info()
{
	if(((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0)) && (Npc_HasItems(other,ItPo_HealObsession_MIS) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Исцели меня, мастер, ибо я одержим.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//Да будет так! Возьми это зелье. Оно избавит тебя от ночных кошмаров.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Да избавит тебя Иннос от этой напасти.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Действуй от его имени и остерегайся черного взгляда врага.
			if(SC_ObsessionTimes > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Но я предостерегаю тебя - если ты будешь попадать в их сети слишком часто, может статься так, что возврата уже не будет. Всегда помни об этом.
			};
			CreateInvItems(self,ItPo_HealObsession_MIS,10);
			B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Я думаю, я одержим. Ты можешь исцелить меня?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//При условии проявления твоего уважения к этому монастырю, сын мой. Триста золотых монет!
			Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"Это слишком много.",DIA_Pyrokar_SCOBSESSED_nein);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"Отлично! Вот деньги.",DIA_Pyrokar_SCOBSESSED_ok);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Я думаю, я одержим. Ты можешь исцелить меня?
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Но ты только что получил исцеляющее зелье. Обратись ко мне, только если тебе действительно понадобится помощь.
	};
};

func void DIA_Pyrokar_SCOBSESSED_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Отлично! Вот деньги.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Вот, выпей это. Да избавит тебя Иннос от этой напасти.
		CreateInvItems(self,ItPo_HealObsession_MIS,10);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Принеси мне деньги, и я смогу помочь тебе.
	};
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//Это слишком много.
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};


instance DIA_PYROKAR_GIVEHEALPOTIONS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 71;
	condition = dia_pyrokar_givehealpotions_condition;
	information = dia_pyrokar_givehealpotions_info;
	permanent = TRUE;
	description = "Мне нужно лекарство от головных болей.";
};

func int dia_pyrokar_givehealpotions_condition()
{
	if(MIS_SEKTEHEILEN == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_givehealpotions_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_00");	//Мне нужно лекарство от головных болей.
	if(FIRSTGIVEHEALPOTIONS == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_01");	//(раздраженно) А разве при входе в монастырь висит вывеска целителя?
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_02");	//Мне кажется, это не просто головные боли. Это больше напоминает первые признаки одержимости!
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_03");	//Ну, если так, то тогда ты пришел по адресу. У нас действительно есть одно средство, которое может избавить тебя от этой болезни.
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_04");	//Ну, не совсем меня. Думаю, мне понадобится большое количество этого лекарcтва.
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_05");	//Хорошо! Но тебе придется заплатить за него, в знак твоего почтения этому монастырю.
		AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_01_06");	//Сколько?
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_07");	//По триста монет за один напиток.
		FIRSTGIVEHEALPOTIONS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_01_08");	//Как я уже тебе сказал, это стоит триста монет за один напиток.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Это слишком много!",dia_pyrokar_givehealpotions_nein);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Хорошо! Я возьму одну штуку.",dia_pyrokar_givehealpotions_ok_1);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Хорошо! Я возьму пять штук.",dia_pyrokar_givehealpotions_ok_5);
	Info_AddChoice(dia_pyrokar_givehealpotions,"Хорошо! Я возьму десять штук.",dia_pyrokar_givehealpotions_ok_10);
};

func void dia_pyrokar_givehealpotions_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_nein_01_00");	//Это слишком много!
	AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_nein_01_01");	//Как скажешь.
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_1()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_1_01_00");	//Хорошо! Я возьму одну штуку.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_1_01_01");	//Вот, возьми этот напиток. Он избавит страждующего от этой черной заразы!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_1_01_02");	//Принеси мне деньги и получишь помощь.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_5()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_5_01_00");	//Хорошо! Я возьму пять штук.
	if(B_GiveInvItems(other,self,ItMi_Gold,1500))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_5_01_01");	//Вот, возьми эти напитки. Они избавят страждующих от этой черной заразы!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,5);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_5_01_02");	//Принеси мне деньги и получишь помощь.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};

func void dia_pyrokar_givehealpotions_ok_10()
{
	AI_Output(other,self,"DIA_Pyrokar_GiveHealPotions_ok_10_01_00");	//Хорошо! Я возьму десять штук.
	if(B_GiveInvItems(other,self,ItMi_Gold,3000))
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_10_01_01");	//Вот, возьми эти напитки. Они избавят страждующих от этой черной заразы!
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,10);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_GiveHealPotions_ok_10_01_02");	//Принеси мне деньги и получишь помощь.
	};
	Info_ClearChoices(dia_pyrokar_givehealpotions);
};


instance DIA_Pyrokar_AlmanachBringen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Pyrokar_AlmanachBringen_Condition;
	information = DIA_Pyrokar_AlmanachBringen_Info;
	permanent = TRUE;
	description = "Я могу рассказать еще кое-что об этих одержимых.";
};


func int DIA_Pyrokar_AlmanachBringen_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE) && (Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) >= 1) && Npc_KnowsInfo(other,DIA_Pyrokar_BUCHDERBESSENEN))
	{
		return TRUE;
	};
};


var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info()
{
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Я могу рассказать еще кое-что об этих одержимых.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Говори, брат.
	PyrokarsAlmanachOffer = 400;
	AlmanachCount = Npc_HasItems(other,ITWR_DementorObsessionBook_MIS);
	if(AlmanachCount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Я нашел еще один альманах.
		B_GivePlayerXP(XP_KDF_BringAlmanach);
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
		AlmanachCounter = AlmanachCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Я нашел еще несколько книг темных странников.
		B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,AlmanachCount);
		XP_KDF_BringAlmanachs = AlmanachCount * XP_KDF_BringAlmanach;
		AlmanachCounter = AlmanachCounter + AlmanachCount;
		B_GivePlayerXP(XP_KDF_BringAlmanachs);
	};
	if(AlmanachCounter <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Это хорошо. Боюсь, впрочем, что это далеко не все. Продолжай поиски.
	}
	else if(AlmanachCounter <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Многие из них уже найдены. Но я не думаю, что мы изъяли их все.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//Ты уже принес целую кучу этих вражеских книг.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Я буду удивлен, если тебе удастся найти еще.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Вот, возьми. Это дар от монастыря, который поможет тебе противостоять злу.
	if(DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//И не забывай время от времени заглядывать в мое магическое письмо.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Возможно, они попытаются проделать это с другими, чьи имена пока еще не вписаны в альманахи.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE;
	};
	AlmanachGeld = AlmanachCount * PyrokarsAlmanachOffer;
	CreateInvItems(self,ItMi_Gold,AlmanachGeld);
	B_GiveInvItems(self,other,ItMi_Gold,AlmanachGeld);
};


instance DIA_Pyrokar_KAP4_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP4_EXIT_Condition;
	information = DIA_Pyrokar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_KAP5_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP5_EXIT_Condition;
	information = DIA_Pyrokar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_DRACHENTOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DRACHENTOT_Condition;
	information = DIA_Pyrokar_DRACHENTOT_Info;
	description = "Все драконы мертвы.";
};


func int DIA_Pyrokar_DRACHENTOT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Все драконы мертвы.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//Это воистину хорошие новости. Но это совершенно не меняет наше положение, которое кажется безнадежным.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Темные странники все еще не ушли. Скорее наоборот! Я слышу все больше и больше сообщений о том, что за последние несколько дней, их численность даже увеличилась.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Уничтожение драконов нанесло врагу серьезный удар, но этого недостаточно. Нам нужно вырвать это зло с корнем.
};


instance DIA_Pyrokar_DERMEISTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DERMEISTER_Condition;
	information = DIA_Pyrokar_DERMEISTER_Info;
	description = "Я говорил с драконами.";
};


func int DIA_Pyrokar_DERMEISTER_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Я говорил с драконами.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//Что они сказали?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Они все время говорили о силе их хозяина и о том, что он находится в Чертогах Ирдората.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Да пребудет с нами Иннос. Черный Храм восстановил свою силу и теперь отправляет своих приспешников в наш мир.
};


instance DIA_Pyrokar_WASISTIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WASISTIRDORATH_Condition;
	information = DIA_Pyrokar_WASISTIRDORATH_Info;
	description = "Что такое эти Чертоги Ирдората?";
};


func int DIA_Pyrokar_WASISTIRDORATH_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(other,DIA_Pyrokar_DERMEISTER))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Что такое эти Чертоги Ирдората?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//Восточный храм вызова бога Белиара. Всего на земле Миртаны их четыре. Но этот, вероятно, самый ужасный храм из всех.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Около сорока лет назад северный и западный храмы этого ужасного божества были уничтожены.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//Мужественные рыцари того времени отдали все, чтобы сравнять эти величественные сооружения с землей.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Тогда черные орды врага были бессильны против превосходящих их мужеством и числом рыцарей и паладинов.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Было бы несложно уничтожить и оставшиеся два храма, чтобы избавить землю от зла навсегда...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... но после того как пал второй храм, они просто растворились.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(насмешливо) Растворился. Целый храм. Да, точно.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Не смейся. Ситуация серьезная. Чертоги Ирдората действительно восстановили свою силу, и теперь врага будет победить очень трудно.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Поэтому, сначала ты должен найти этот храм, и я думаю, это будет твоя следующая и самая тяжелая задача.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Посмотрим.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Согласно Пирокару, Чертоги Ирдората - это забытый храм вызова бога Белиара. Я должен найти этот храм.");
};


instance DIA_Pyrokar_BUCHIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 54;
	condition = DIA_Pyrokar_BUCHIRDORATH_Condition;
	information = DIA_Pyrokar_BUCHIRDORATH_Info;
	description = "Книга Ксардаса, которую считали потерянной - где она?";
};


func int DIA_Pyrokar_BUCHIRDORATH_Condition()
{
	if((Kapitel == 5) && (ItWr_HallsofIrdorathIsOpen == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Книга Ксардаса, которую считали потерянной - где она?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Я ожидал, что ты спросишь это. Но, боюсь, она будет бесполезной для тебя.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Она закрыта при помощи магии. Я отнес ее в один из наших подвалов, но сколько мы не пытались открыть ее - все тщетно.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Этот проклятый Ксардас сыграл с нами грязную шутку.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Могу я увидеть эту книгу?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Будь моим гостем. Но я представить себе не могу, что тебе удастся преуспеть там, где потерпели поражение величайшие маги нашего монастыря.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Но все же ты можешь попытаться, Таламон не будет препятствовать тебе.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Книга Ксардаса 'ЧЕРТОГИ ИРДОРАТА' находится в нижних подвалах монастыря. Ее охраняет Таламон. Маги не смогли открыть эту книгу. Она закрыта при помощи магии и они обвиняют в этом Ксардаса.");
	Pyrokar_LetYouPassTalamon = TRUE;
};


instance DIA_Pyrokar_IRDORATHBOOKOPEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information = DIA_Pyrokar_IRDORATHBOOKOPEN_Info;
	description = "Я смог открыть книгу Ксардаса.";
};


func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition()
{
	if((ItWr_HallsofIrdorathIsOpen == TRUE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Я смог открыть книгу Ксардаса.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Что?! Как у тебя это получилось? Это все сведет меня с ума!
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"Ксардас рассказал мне секрет.",DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"Просто слепая удача, я думаю.",DIA_Pyrokar_IRDORATHBOOKOPEN_glueck);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Просто слепая удача, я думаю.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Не говори чепухи. Удача!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Если даже я не смог открыть эту книгу, а затем приходит кто-то вроде тебя и играючи открывает ее...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... это наводит меня на грустные размышления...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Ладно. Так как ты, очевидно, единственный, кто смог открыть эту книгу, то я, пожалуй, позволю тебе держать ее у себя. По крайней мере, пока мы не разрешили этот кризис.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Ксардас рассказал мне секрет.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ах, вот оно что. Как интересно. Мне остается только надеяться, что пагубное влияние Ксардаса не отравит твою душу.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Я предостерегаю тебя. Не поддавайся на уловки этого старого дьявола. Ты можешь пожалеть об этом.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};


instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;
	description = "В этой книге упоминается секретная библиотека.";
};


func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//В этой книге упоминается секретная библиотека.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//О чем это ты?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//О библиотеке, находящейся под этими стенами. Тебе это ни о чем не говорит?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Нет. Где эта библиотека должна быть, ты сказал?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Понятно. Ты ничего не знаешь о ней. Ммм.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Пирокар ничего не знает о тайной библиотеке. Похоже, только Ксардас бывал в ней.");
};


instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;
	description = "Я знаю, где нужно искать Чертоги Ирдората.";
};


func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Я знаю, где нужно искать Чертоги Ирдората.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Этот храм находится на острове. Я нашел морскую карту, которая покажет путь.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//Это великолепно. Тогда тебе понадобится корабль и команда, чтобы добраться до этого врага.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Но помни, что ты должен хорошо подготовиться, если хочешь уничтожить Повелителя Ирдората.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Где мне найти команду?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Твоя команда должна состоять из людей, которым ты можешь доверять.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Поговори со своими друзьями и подумай о том, кто может быть полезен тебе на этом острове.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Тебе там, наверняка, понадобится маг. Но, к сожалению, я не могу выделить ни одного человека из монастыря.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Тебе придется поискать мага за пределами наших стен.
};


instance DIA_Pyrokar_SCWILLJORGEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_SCWILLJORGEN_Condition;
	information = DIA_Pyrokar_SCWILLJORGEN_Info;
	description = "Йорген - опытный моряк.";
};


func int DIA_Pyrokar_SCWILLJORGEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Pyrokar_SCKNOWSWAYTOIRDORATH) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Йорген - опытный моряк. Он мог бы помочь мне добраться до Острова Ирдорат.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Боюсь, это будет не так уж просто.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Он попросился работать в нашем монастыре. Но он не платил вступительного взноса и не привел овцы.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Йорген должен сначала закончить свою работу, а потом ты можешь забрать его, если пожелаешь.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Сколько времени это займет?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Он в первый же день съел целую гору продуктов. Этой провизии обычному послушнику хватило бы на три недели.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Поэтому я не могу отпустить его, пока он не отработает три месяца в наших садах.
};


instance DIA_Pyrokar_MACHDTFREI(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_MACHDTFREI_Condition;
	information = DIA_Pyrokar_MACHDTFREI_Info;
	description = "А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?";
};


func int DIA_Pyrokar_MACHDTFREI_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SCWILLJORGEN) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MACHDTFREI_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Ммм. Действительно, есть кое-что, что ты мог бы сделать для меня. Твои хорошие отношения с Ксардасом могли бы помочь тебе в этом.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Мое внимание привлекло то, что последние несколько дней в его башне творятся странные вещи.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Много людей слышало громкие вопли в ночи, исходящие оттуда, и видели странный свет, пляшущий над этой башней.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Только этого нам еще не хватало. Иди, проверь что там происходит и прекрати это безобразие.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Тогда ты сможешь забрать Йоргена.
	MIS_PyrokarClearDemonTower = LOG_Running;
	Log_CreateTopic(TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PyrokarClearDemonTower,LOG_Running);
	B_LogEntry(TOPIC_PyrokarClearDemonTower,"Странные вещи творятся с башней Ксардаса. Если я соберусь выяснить, что там происходит, я могу взять с собой Йоргена.");
};


instance DIA_Pyrokar_DTCLEARED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_DTCLEARED_Condition;
	information = DIA_Pyrokar_DTCLEARED_Info;
	description = "Башня Ксардаса больше никого не будет беспокоить.";
};


func int DIA_Pyrokar_DTCLEARED_Condition()
{
	if(Npc_IsDead(Xardas_DT_Demon1) && Npc_IsDead(Xardas_DT_Demon2) && Npc_IsDead(Xardas_DT_Demon3) && Npc_IsDead(Xardas_DT_Demon4) && Npc_IsDead(Xardas_DT_Demon5) && Npc_IsDead(Xardas_DT_DemonLord) && (MIS_PyrokarClearDemonTower == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DTCLEARED_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Башня Ксардаса больше никого не будет беспокоить.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//Так что там было... нет, подожди, я не хочу даже знать.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Если Йорген тебе все еще нужен, можешь забрать его из монастыря.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Да хранит тебя Иннос.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_PyrokarClearDemonTower);
};


var int Pyro_Gives_Aura;

instance DIA_Pyrokar_AmulettofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_AmulettofDeath_Condition;
	information = DIA_Pyrokar_AmulettofDeath_Info;
	permanent = TRUE;
	description = "В пророчестве упоминается священная Аура Инноса.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition()
{
	if((PlayerGetsAmulettOfDeath == TRUE) && (Pyro_Gives_Aura == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//В пророчестве упоминается священная Аура Инноса.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Аура Инноса - это амулет, который могут носить только величайшие маги всех времен и народов.
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,Dialog_Back,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"Могу я взять его?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"Что делает этот амулет?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

func void DIA_Pyrokar_AmulettofDeath_BAck()
{
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
};

func void DIA_Pyrokar_AmulettofDeath_CanHaveIt()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Могу я взять его?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//Что? Что ты с ним собираешься делать?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Выступить против драконов.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Да, конечно. Я дам тебе этот амулет, но обращайся с ним бережно.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Да, конечно.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Я не хочу, чтобы мне потом пришлось выкупать его назад у какого-нибудь торговца.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Используй его разумно, и да хранит тебя Иннос.
	CreateInvItems(self,ItAm_AmulettOfDeath_Mis,1);
	B_GiveInvItems(self,other,ItAm_AmulettOfDeath_Mis,1);
	Pyro_Gives_Aura = TRUE;
};

func void DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Что делает этот амулет?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Говорят, что Иннос самолично выковал его и передал человечеству.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Он защищает своего владельца от всех типов урона.
};


instance DIA_Pyrokar_PotionofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_PotionofDeath_Condition;
	information = DIA_Pyrokar_PotionofDeath_Info;
	permanent = TRUE;
	description = "Что такое Слезы Инноса?";
};


func int DIA_Pyrokar_PotionofDeath_Condition()
{
	if(Npc_HasItems(other,ItPo_PotionOfDeath_01_Mis))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Что такое Слезы Инноса?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//Слезы Инноса - это не более чем старые детские сказки. В них говорится, как в начале времен разгорелась битва между Инносом и Белиаром.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Понимаю.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Я нашел это зелье.",DIA_Pyrokar_PotionofDeath_Potion);
};

func void DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Понимаю.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Я не знаю, понимаешь ли ты всю серьезность нашей ситуации, но я очень сомневаюсь, что нашего врага можно победить при помощи детских сказок.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Я нашел это зелье.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//Этого не может быть! Не могу поверить в это!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//В чем дело?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Если это действительно настоящие Слезы Инноса, то...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//Вряд ли.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Не прерывай меня! Если это действительно настоящие Слезы Инноса, то мы получили грозное оружие против врага.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,Dialog_Back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Так что такое эти Слезы Инноса?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"Что ты имеешь в виду под 'оружием'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

func void DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Так что такое эти Слезы Инноса?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Когда Иннос осознал, что ему придется сражаться с Белиаром, своим собственным братом, чтобы сохранить созданное, его печаль была велика.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Слезы потекли из глаз его и упали в наш мир. Их было много, ибо сердце его было переполнено печалью, и плакал он тринадцать лет.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Ближе к делу.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Люди, нашедшие его слезы и попробовавшие их, обретали сверхъестественную силу и ясность ума. Они признавали мудрость Инноса, Создателя, и начинали служить ему.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Они стали первыми членами Братства Огня! Эти слезы давали им силу, мужество и мудрость. Но это было давным-давно, и прошло уже более двузсот пятидесяти лет с тех пор, как последний раз видели Слезы Инноса.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Что ты имеешь в виду под оружием?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Легенда гласит, что под воздействием этой субстанции, воины Инноса могли вершить почти сверхъестественные дела.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Им была неведома усталость, и они обладали силой двух медведей.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Величайшие героические подвиги прошлых дней стали возможны только благодаря Слезам Инноса.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Понятно.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Но эти слезы могут также приносить страдания и смерть. Только члены нашего ордена могут пить их.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Любого другого - даже паладина нашего Владыки - ожидает мучительная смерть.
	Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
};

instance DIA_Pyrokar_KAP6_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_KAP6_EXIT_Condition;
	information = DIA_Pyrokar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_PICKPOCKET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PICKPOCKET_Condition;
	information = DIA_Pyrokar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Pyrokar_PICKPOCKET_Condition()
{
	return C_Beklauen(108,550);
};

func void DIA_Pyrokar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,Dialog_Back,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};


instance DIA_PYROKAR_KAPITELORCATTACK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_kapitelorcattack_condition;
	information = dia_pyrokar_kapitelorcattack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_kapitelorcattack_condition()
{
	if((CAPITANORDERDIAWAY == TRUE) && (CAPITANORDERLIAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kapitelorcattack_info()
{
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_00");	//Хвала Инносу! Наконец-то вы объявились!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_01");	//А то я уж начал подумывать, что этого никогда больше не произойдет.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_01_02");	//Ну, честно говоря, мы и не собирались возвращаться на остров - так уж получилось.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_01_04");	//У нас есть очень важные новости для паладинов. Поэтому мне как можно быстрее надо поговорить с лордом Хагеном!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_01_08");	//За время вашего отсутствия тут произошли просто ужасные вещи.
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"А что здесь случилось?",dia_pyrokar_kapitelorcattack_what);
};

func void dia_pyrokar_kapitelorcattack_what()
{
	PlayVideo("RET2_OrcSiege.BIK");
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_01");	//(обреченно) Хоринис пал! Теперь там всем заправляют орки.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_02");	//Что? Но как это произошло?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_03");	//Через несколько дней после вашего отплытия их орды прошли через проход и атаковали город!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_04");	//Вначале они просто взяли его в кольцо, а уже следующей ночью - пошли на штурм.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_05");	//Ты просто не представляешь, что там творилось. Это был даже не бой, а просто кровавая резня!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_07");	//Лорд Хаген и его люди сделали все, что смогли... Они храбро сражались до последнего, но численный перевес был просто ужасающим.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_08");	//В конце концов, те, кому все-таки удалось выжить, отошли на позиции в форт Азган, а город перешел в лапы орков.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_09");	//М-да... Ничего себе! Выходит, ситуация полностью вышла из-под контроля!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_12");	//Это только малая часть того ужаса, что здесь посеяли орки!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_13");	//Монастырь магов Огня уже давно находится под их осадой, и только Иннос знает - сколько мы еще сможем продержаться.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_14");	//Все дороги контролируют военные патрули орков, а большинство крестьянских ферм просто захвачено!
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_What_01_15");	//А что с фермой Онара?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_16");	//До нее орки пока что еще не добрались! Но думаю, что это лишь вопрос времени.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_17");	//Они разбили большой лагерь возле самой фермы и, по всей видимости, скоро пойдут на штурм.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_18");	//Правда, еще, конечно, остается надежда на форт Азган, в котором сосредоточены остатки отряда паладинов.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_What_01_19");	//Но от них нет пока никаких вестей!
	KAPITELORCATC = TRUE;
	MIS_ORсGREATWAR = LOG_Running;
	Log_CreateTopic(TOPIC_ORсGREATWAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORсGREATWAR,LOG_Running);
	B_LogEntry(TOPIC_ORсGREATWAR,"Пирокар сообщил мне ужасные новости: сразу после нашего отплытия на Ирдорат, орды орков прошли через проход и атаковали Хоринис! Битва за город была довольно жаркая, но силы противостоящих сторон оказались слишком неравными. Лорду Хагену пришлось сдать свои позиции и отступить в королевский форт Азган со своими людьми. Город пал. Теперь там заправляют орки.");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Сами маги Огня находятся не в лучшем положении - их монастырь уже несколько недель осаждают орки. Более или менее стабильное положение на ферме Онара - туда орки пока что не добрались. Правда, они разбили небольшой лагерь рядом с фермой, и, по всей видимости, ждут удобного момента для атаки.");
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"И что мы теперь будем делать?",dia_pyrokar_kapitelorcattack_do);
};

func void dia_pyrokar_kapitelorcattack_do()
{
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_01");	//И что будем делать?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_02");	//Этого точно я пока не знаю. Но, думаю, что для начала нам надо как-то попытаться исправить сложившуюся ситуацию.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_07");	//Думаю, что прежде всего тебе следует немедленно отправиться к лорду Хагену! Это первое, что надо сделать.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_11");	//Отправляйся в королевский форт Азган как можно скорее и выясни, какова там ситуация.
	B_GiveInvItems(self,other,itwr_pyrorderfort,1);
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_12");	//(серьезно) И еще кое-что...
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_13");	//Как ты уже наверняка понял, в городе полно орков, и выбраться отсюда будет для вас крайне сложно.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_15");	//Я уверен, что ты сможешь как-нибудь выбраться из этой тяжелой ситуации.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_16");	//Но большинство из тех, кто приплыл вместе с тобой, фактически оказались в западне.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_17");	//Не ровен час, когда орки пожалуют на ваш корабль, и тогда... Думаю, ты и сам все понимаешь.
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_18");	//Понимаю. И что ты предлагаешь?
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_19");	//Единственное, что мне сейчас приходит в голову, это использовать магические руны телепортации.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_20");	//Думаю, это самый простой способ беспрепятственно уйти отсюда.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_99");	//Вот, возьми. Это все, что у меня сейчас есть.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_TeleportFarm,1);
	CreateInvItems(other,ItMi_TeleportTaverne,1);
	CreateInvItems(other,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_21");	//Однако я также понимаю, что, возможно, рун на всех не хватит, и многим все-таки придется пробиваться через город с боем.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_22");	//Поэтому прежде, чем решить, кому их отдать, - хорошенько подумай над этим.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_23");	//Да, и еще. Не вздумай им предлагать руны телепортации к монастырю или к проходу в Долину Рудников!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_24");	//Тем самым ты подпишешь им смертный приговор!
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_26");	//Выход из долины, как и местность рядом с монастырем, хорошо охраняется орками.
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_29");	//Хорошо. Кстати, насчет Ватраса и Милтена можешь не беспокоиться. Маги сами смогут о себе позаботиться.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_30");	//Они отправятся вместе со мной в монастырь - их место сейчас там.
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_31");	//Хорошо. Кстати, насчет Милтена можешь не беспокоиться. Маг сам сможет о себе позаботиться.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_32");	//Он отправится вместе со мной в монастырь - его место сейчас там.
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_33");	//Хорошо. Кстати, насчет Ватраса можешь не беспокоиться. Маг сам сможет о себе позаботиться.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_34");	//Он отправится вместе со мной в монастырь - его место сейчас там.
		};
	};
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_35");	//Хорошо. Что же касательно остальных - думаю, что тебе в любом случае надо поговорить с ними.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_36");	//Это наверняка придаст им хоть немного уверенности в своих силах!
	if(PEDROBACKNW == TRUE)
	{
		AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_37");	//А что насчет послушника Педро?
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_38");	//Что?! (гневно) Этот предатель тоже с вами? Я думал, что он погиб.
		AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_39");	//Я нашел его в одной из пещер на острове Ирдорат. Он был в плену у орков.
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_40");	//Ну раз так, то тогда, пожалуй, я заберу его вместе с собой в монастырь.
		AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_41");	//Там он свое получит!
		if(MIS_HELPPEDRO == LOG_Running)
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_42");	//Только постарайся быть с ним немного помягче.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_43");	//Это еще почему?!
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_44");	//Я уверен, что парень не особо виноват в том, что произошло.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_45");	//Да? И почему же ты так считаешь?
			AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_46");	//Давай я расскажу тебе об этом чуть позже. Сейчас для этого не самое подходящее время.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_47");	//Хммм. Ну хорошо.
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_48");	//Но учти, что потом ты в любом случае будешь должен доказать мне его невиновность!
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_49");	//В ином же случае ты и сам знаешь, какое наказание его ожидает в монастыре.
			PEDROCANSAVE = TRUE;
			Log_AddEntry(TOPIC_HELPPEDRO,"Как и обещал, я замолвил словечко за послушника Педро перед Пирокаром. Правда, теперь мне еще нужно будет объяснить и доказать ему, почему я считаю его невиновным.");
		}
		else
		{
			AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_50");	//Что же касается тебя, то мне добавить больше нечего. Теперь все зависит от твоих действий!
		};
	};
	AI_Output(other,self,"DIA_Pyrokar_KapitelOrcAttack_Do_01_51");	//Хорошо, я все понял.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_52");	//(серьезно) Хорошо. Я же тогда отправляюсь обратно в монастырь.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_53");	//Если захочешь поговорить со мной о чем-то еще, - ты знаешь, где меня найти.
	AI_Output(self,other,"DIA_Pyrokar_KapitelOrcAttack_Do_01_54");	//Да хранит тебя Иннос!
	MIS_HELPCREW = LOG_Running;
	PYROKARSENTTOHAGEN = TRUE;
	Log_CreateTopic(TOPIC_HELPCREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_Running);
	B_LogEntry(TOPIC_HELPCREW,"Пирокар попросил меня помочь остальным членам экипажа выбраться из Хориниса, захваченного орками. Он дал мне несколько рун телепортации. Они помогут остальным беспрепятственно уйти из города. Но на всех рун не хватит, да и пробиваться через толпы орков с боем смогут не все. Думаю, мне стоит обязательно поговорить с каждым из членов моей команды.");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Похоже, мне снова придется взять на себя роль спасителя этого мира. По мнению Пирокара, я единственный, кому это под силу. Надеюсь, он прав.");
	Log_AddEntry(TOPIC_ORсGREATWAR,"Для начала я должен как можно скорее отправиться в королевский форт Азган и выяснить у лорда Хагена, в каком состоянии находятся его войска. Ведь паладины - единственная сила на острове, способная хоть как-то противостоять оркам.");
	Info_ClearChoices(dia_pyrokar_kapitelorcattack);
	Info_AddChoice(dia_pyrokar_kapitelorcattack,"(закончить разговор)",dia_pyrokar_kapitelorcattack_away);
};

func void dia_pyrokar_kapitelorcattack_away()
{
	if((VATRASBACKNW == TRUE) || (MAGEBACKNW == TRUE))
	{
		if((VATRASBACKNW == TRUE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == FALSE) && (MAGEBACKNW == TRUE))
		{
			AI_Teleport(PC_Mage_NW,"NW_MONASTERY_GRASS_05");
			Npc_ExchangeRoutine(PC_Mage_NW,"OrcAtcNW");
		}
		else if((VATRASBACKNW == TRUE) && (MAGEBACKNW == FALSE))
		{
			AI_Teleport(VLK_439_Vatras,"NW_MONASTERY_GRASS_VATRAS");
			Npc_ExchangeRoutine(VLK_439_Vatras,"OrcAtcNW");
		};
	};
	if(PEDROCANSAVE == TRUE)
	{
		AI_Teleport(NOV_600_Pedro,"NW_MONASTERY_CHAPELL_02");
		Npc_ExchangeRoutine(NOV_600_Pedro,"OrcAtcNW");
	};

	IntroduceCH_07 = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,0,0);
};


instance DIA_PYROKAR_PEDROCANSAVE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansave_condition;
	information = dia_pyrokar_pedrocansave_info;
	permanent = FALSE;
	description = "Поговорим насчет Педро.";
};


func int dia_pyrokar_pedrocansave_condition()
{
	if((MIS_HELPPEDRO == LOG_Running) && (PEDROCANSAVE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansave_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_01_00");	//Поговорим насчет Педро.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_01_01");	//Хорошо. И что ты можешь сказать в его оправдание?
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Я не знаю.",dia_pyrokar_pedrocansave_dontknow);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Полагаю, что он не виновен.",dia_pyrokar_pedrocansave_innocent);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Поверь мне на слово.",dia_pyrokar_pedrocansave_trustme);
};

func void dia_pyrokar_pedrocansave_dontknow()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_DontKnow_01_00");	//Я не знаю.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_DontKnow_01_01");	//В таком случае нам и разговаривать не о чем...(властно) Я не изменю своего решения!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_DontKnow_01_02");	//Послушник Педро будет сурово наказан за свое предательство, и сам Иннос будет тому свидетелем.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
};

func void dia_pyrokar_pedrocansave_trustme()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_02");	//Просто поверь мне на слово, - он невиновен.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_03");	//(гневно) Что? Да ты в своем уме, чтобы предлагать мне такое?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_05");	//Твоя дерзость на сей раз просто не знает своего предела! У тебя нет никакого права решать за меня судьбу этого вора и предателя!
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_06");	//Вы мне многим обязаны! Неужели нельзя оказать мне такую маленькую услугу?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_09");	//Мне кажется, что ты просишь слишком много!
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_10");	//Просто сними с Педро все обвинения и отпусти его - это все, о чем я тебя прошу.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_TrustMe_01_11");	//Я же в свою очередь готов за него поручиться. Или тебе этого недостаточно?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_12");	//(скрепя сердце) Ну хорошо! Если ты так слепо ручаешься за него, то я готов пойти на подобную уступку.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_13");	//В конце концов, мы действительно много чем тебе обязаны и не имеем права ставить под сомнения какие-либо твои действия.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_TrustMe_01_14");	//С послушника Педро сняты все обвинения в предательстве и воровстве.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Как и обещал, я помог Педро спасти его жизнь, использовав свое влияние на Пирокара.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_innocent()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_00");	//Полагаю, что он не виновен.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_03");	//Уверен, что его просто заставили это сделать.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_04");	//Обычный послушник слишком слаб для того, чтобы сопротивляться темной магии Ищущих.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_08");	//Дай ему шанс вернуть себе веру!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_10");	//Но воровство у своих братьев достойно самого сурового наказания!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_11");	//Неужели ты полагаешь, что я способен закрыть глаза на это?!
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_12");	//Я не прошу тебя этого делать. Я лишь хочу, чтобы ты сохранил ему жизнь!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_17");	//Ну хорошо...(серьезно) Если ты так горячо просишь об этом, я готов пойти на подобную уступку.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_18");	//Однако за его жизнь тебе придется заплатить!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_19");	//Полагаю, что небольшое пожертвование нашему монастырю немного смягчит негодование остальных по поводу принятия подобного решения.
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Innocent_01_20");	//Сколько?
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Innocent_01_21");	//(властно) Пять тысяч золотых монет. Уверен, что этого вполне хватит.
	Info_ClearChoices(dia_pyrokar_pedrocansave);
	Info_AddChoice(dia_pyrokar_pedrocansave,"У меня недостаточно золота.",dia_pyrokar_pedrocansave_nomoney);
	Info_AddChoice(dia_pyrokar_pedrocansave,"Это дело не стоит того.",dia_pyrokar_pedrocansave_tomuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_pyrokar_pedrocansave,"Вот твое золото.",dia_pyrokar_pedrocansave_money);
	};
};

func void dia_pyrokar_pedrocansave_nomoney()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_NoMoney_01_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_NoMoney_01_01");	//Тогда поговорим об этом, когда оно у тебя будет.
	GIVEPEDROCHANCE = TRUE;
	B_LogEntry(TOPIC_HELPPEDRO,"Пирокар согласился снять все обвинения с Педро, но только если я пожертвую его монастырю пять тысяч золотых.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_tomuch()
{
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_ToMuch_01_00");	//Я не буду терять время на такие мелочи.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_ToMuch_01_01");	//В таком случае нам и разговаривать не о чем...(властно) Я не изменю своего решения!
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_ToMuch_01_02");	//Послушник Педро будет сурово наказан за свое предательство, и сам Иннос будет тому свидетелем.
	MIS_HELPPEDRO = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_HELPPEDRO);
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};

func void dia_pyrokar_pedrocansave_money()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSave_Money_01_00");	//Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Money_01_01");	//Хорошо. В таком случае можешь считать, что с Педро отныне сняты все обвинения в предательстве и воровстве.
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSave_Money_01_02");	//И я очень надеюсь на то, что в дальнейшем не пожалею об этом своем решении.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Как и обещал, я помог Педро спасти ему свою жизнь, купив для него индульгенцию магов Огня за огромную сумму золота.");
	Info_ClearChoices(dia_pyrokar_pedrocansave);
};


instance DIA_PYROKAR_PEDROCANSAVEFORMONEY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = dia_pyrokar_pedrocansaveformoney_condition;
	information = dia_pyrokar_pedrocansaveformoney_info;
	permanent = FALSE;
	description = "Я хочу внести пожертвование за послушника Педро.";
};


func int dia_pyrokar_pedrocansaveformoney_condition()
{
	if((MIS_HELPPEDRO == LOG_Running) && (GIVEPEDROCHANCE == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		return TRUE;
	};
};

func void dia_pyrokar_pedrocansaveformoney_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Pyrokar_PedroCanSaveForMoney_01_00");	//Я хочу внести пожертвование за послушника Педро.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Pyrokar_PedroCanSaveForMoney_01_03");	//Ну что же...(немного удивленно) В таком случае можешь считать, что с Педро отныне сняты все обвинения в предательстве и воровстве.
	MIS_HELPPEDRO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPPEDRO,"Как и обещал, я помог Педро спасти ему свою жизнь, купив для него индульгенцию магов Огня за огромную сумму золота.");
};


instance DIA_PYROKAR_ABOUTGUARDIANS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_aboutguardians_condition;
	information = dia_pyrokar_aboutguardians_info;
	permanent = FALSE;
	description = "Что тебе известно о Хранителях?";
};


func int dia_pyrokar_aboutguardians_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_aboutguardians_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AboutGuardians_01_00");	//Что тебе известно о Хранителях?
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_01");	//Хранителях? (задумчиво) Боюсь, я не так много знаю об этих древних созданиях.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_02");	//И большая часть этих знаний, скорее всего, - слухи или вымысел других людей, нежели правда.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_04");	//Многие из тех, кто когда-либо слышал о Хранителях, полагают, что они были порождены самими богами!
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_05");	//Однако есть и те, кто считает их творением более могущественных сил, существовавших еще задолго до появления этого мира.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_06");	//Что из всего этого есть правда, а что нет - мне, конечно, неизвестно.
	AI_Output(self,other,"DIA_Pyrokar_AboutGuardians_01_07");	//Истинный факт существования Хранителей никому неизвестен и является большей частью мифом.
};


instance DIA_PYROKAR_GUARDIANSEXISTS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardiansexists_condition;
	information = dia_pyrokar_guardiansexists_info;
	permanent = FALSE;
	description = "Хранители вовсе не миф!";
};


func int dia_pyrokar_guardiansexists_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_aboutguardians))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardiansexists_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_00");	//Хранители вовсе не миф!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_02");	//Я лично повстречал одного из них в храме Ирдората.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_03");	//(задумчиво) По правде говоря, мне в это очень трудно поверить. Ибо никто до этого времени не встречал их в этом мире!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_06");	//И что же хранителю было нужно от тебя?!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_07");	//Он хотел убить меня.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_08");	//Убить? (растерянно) Это достаточно неожиданный поворот событий.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_14");	//Перед тем как атаковать, хранитель поведал мне их истинный смысл появления в этом мире.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_15");	//И, по всей видимости, мое присутствие здесь может помешать им осуществить задуманное.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_16");	//И каков же их замысел?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_17");	//Они хотят уничтожить всех богов. А вместе с ними и все остальное в этом мире!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_18");	//О милосердный Иннос! Но как такое может быть? Зачем им это делать?!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_19");	//Хранители полагают, что извечная борьба между Инносом и Белиаром несет лишь одно разрушение и хаос в этот мир.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_20");	//Они хотят покончить с этой враждой раз и навсегда.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_21");	//Но неужели они думают, что боги позволят им это сделать?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_22");	//Боюсь, что боги сейчас слишком слабы, чтобы противостоять могуществу Хранителей.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_23");	//И отчасти все сложилось так именно по моей вине. Хранители просто использовали меня...
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_24");	//Сам не осознавая того, я каждым своим действием понемногу ослаблял их власть в этом мире.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_25");	//И теперь они вряд ли смогут чем-то нам помочь!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_26");	//О Иннос! Все, что ты сказал, это просто немыслимо...(растерянно) Кто бы мог подумать, что все наши действия обернутся против нас.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_27");	//И, если это действительно так, то тогда, боюсь, что мы все обречены. Нам самим никогда не одолеть Хранителей без помощи со стороны богов.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_28");	//К тому же нельзя также забывать и об орках.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_29");	//Ах да, еще эти чертовы орки...(гневно) Мы даже с ними справиться не можем, не говоря уже об этой новой угрозе!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_30");	//Ты еще не знаешь того, что сами Хранители помогают этим тварям!
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_31");	//Именно с их помощью они хотят уничтожить людей и, тем самым, еще больше ослабить силу богов.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_32");	//И вот почему все усилия паладинов в войне с ними так тщетны!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_33");	//Что?! Только этого нам еще не хватало! Все повернулось против нас и, кажется, этот мир действительно обречен.
	AI_Output(other,self,"DIA_Pyrokar_GuardiansExists_01_34");	//Я что-нибудь придумаю.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansExists_01_35");	//А что тут можно придумать? Все наши усилия будут напрасны, если уж сами Хранители жаждут нашей смерти.
	B_LogEntry(TOPIC_GUARDIANS,"Я рассказал Пирокару о моей встрече с Хранителем Даготом в храме Ирдората и о том, что нам всем теперь угрожает. Нам необходимо подумать, как противостоять угрозе со стороны Хранителей.");
};

instance DIA_PYROKAR_WHATDOUS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdous_condition;
	information = dia_pyrokar_whatdous_info;
	permanent = FALSE;
	description = "У тебя есть мысли насчет того, как нам одолеть Хранителей?";
};

func int dia_pyrokar_whatdous_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdous_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDoUs_01_00");	//У тебя есть какие-нибудь мысли насчет того, как нам одолеть Хранителей?
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_01");	//Боюсь, что пока нет...(серьезно) И я даже представить себе не могу, как это сделать.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_02");	//Единственное, что сейчас мне приходит в голову, так это обратиться к древним рукописям, что хранятся в тайной библиотеке монастыря.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_03");	//Возможно, в них мне все-таки удастся найти ответы на интересующий нас вопрос.
	AI_Output(self,other,"DIA_Pyrokar_WhatDoUs_01_04");	//Но мне понадобится некоторое время. По меньшей мере два дня.
	B_LogEntry(TOPIC_GUARDIANS,"Пирокар отправится в тайную библиотеку монастыря, чтобы изучить древние рукописи. Возможно, в них он найдет нечто такое, что поможет нам одолеть Хранителей. Мне стоит узнать результат его поисков не раньше, чем через два дня.");
	DAYDISCOVERANSWER = Wld_GetDay();
	PYROKARBEGINSEARCH = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_500_Pyrokar,"SearchAnswer");
};

instance DIA_PYROKAR_WHATDOUSNOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdousnot_condition;
	information = dia_pyrokar_whatdousnot_info;
	permanent = TRUE;
	description = "Тебе что-нибудь удалось выяснить насчет Хранителей?";
};

func int dia_pyrokar_whatdousnot_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(((daynow - 2) >= DAYDISCOVERANSWER) && (PYROKARBEGINSEARCH == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdousnot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_00");	//Тебе удалось что-нибудь выяснить насчет Хранителей?

	if(PYROKARMESSAGEPAL == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_01");	//Пока нет...(серьезно) Полагаю, что это займет еще больше времени, чем я думал.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_04");	//Да! Я исследовал несколько древних рукописей, касательно этих древних созданий, и пришел к выводу, что их все-таки можно уничтожить.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_05");	//Точнее, не уничтожить, ибо они бессмертные существа. (серьезно) А просто лишить их части божественной силы, дабы потом изгнать из этого мира.
		AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_06");	//И как же нам это сделать?
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_07");	//Поскольку Хранители по своей сути не являются частью этого мира и их истинная обитель - некие священные чертоги Вакхана...
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_08");	//...то и их власть здесь не так безгранична, как на самом деле может показаться.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_09");	//И, видимо, поэтому Хранители пытались ослабить богов, зная, что в своем могуществе им здесь не сравниться с тем же Инносом или Белиаром.
		AI_Output(other,self,"DIA_Pyrokar_WhatDoUsNot_01_10");	//То есть именно сами боги могут их уничтожить?
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_11");	//В этом вся и проблема. Они могли, пока были в состоянии это сделать. Но теперь ситуация изменилась!
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_12");	//Они сами скоро могут пасть жертвой собственной непредусмотрительности, и надеяться на их помощь мы сейчас никак не можем.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_17");	//Возможно, как раз именно тебе удастся отыскать какую-нибудь зацепку во всем этом.
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_18");	//Ведь не просто так Хранители хотели тебя убить. Выходит, что ты для них тоже представляешь серьезную угрозу!
		AI_Output(self,other,"DIA_Pyrokar_WhatDoUsNot_01_19");	//А значит, пока ты жив, у нас есть призрачный шанс на спасение.
		GATHERALLONBIGFARM = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Пирокар поведал мне обо всем, что смог найти в древних рукописях касательно Хранителей. Их могущество не столь безгранично, как мы полагали ранее - сила богов вполне способна их уничтожить. Именно поэтому они так жаждали ослабить влияние Инноса, Белиара и Аданоса в этом мире. Думаю, нападение орков на Хоринис тоже как-то с этим связано. Мне стоит поискать ответ также и на этот вопрос.");

		if(PyrokarTellAboutCreatures == TRUE)
		{
			B_LogEntry_Quiet(TOPIC_GUARDIANS,"Единственный шанс одолеть Хранителей - попытаться отыскать еще какое-нибудь божество, способное противостоять их мощи.");
		};

		Npc_ExchangeRoutine(self,"Start");
	};
};

instance DIA_PYROKAR_ORCSECRET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_PYROKAR_ORCSECRET_condition;
	information = DIA_PYROKAR_ORCSECRET_info;
	permanent = FALSE;
	description = "Меня прислал Ли.";
};

func int DIA_PYROKAR_ORCSECRET_condition()
{
	if(MIS_ORCSECRET == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_PYROKAR_ORCSECRET_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_01");	//Меня прислал Ли.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_02");	//В последней стычке с орками он обратил внимание, что некоторые из них были почти неуязвимы.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_04");	//Это его очень беспокоит, поскольку у людей в таком случае не будет ни единого шанса против орков в предстоящей битве.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_05");	//(задумчиво) На мой взгляд, это все звенья одной цепи!
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_06");	//Наверняка и тут не обошлось без вмешательства со стороны Хранителей.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_07");	//Значит, пока мы их не уничтожим, все наши действия будут бессмысленными?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_08");	//Боюсь, что так.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_09");	//Однако ты должен понимать, что Хранители - это все-таки божественные создания.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_10");	//Они настолько же могущественны, насколько и тщеславны!
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_11");	//Так что вряд ли они снизойдут до того, чтобы самолично явиться в этот мир, чтобы начать помогать этим зеленокожим тварям.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_12");	//Они уже это делали! Я это точно знаю, потому что...
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_13");	//Ты - совсем другое дело. По сути, ты стал их камнем преткновения в желании повелевать этим миром.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_14");	//Но сейчас им нет особого смысла являть свое вмешательство столь явно.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_15");	//Ведь боги этого мира все еще слишком сильны, и Хранители пока что не готовы открыто бросить им вызов.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_16");	//Тогда каким образом они помогают оркам?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_17");	//Возможно, посредством своих слуг в этом мире...(задумчиво) Например, каковыми в свое время являлись драконы в Долине Рудников.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_18");	//Магическая аура, окружавшая эти древние и могущественные создания, вполне бы могла сделать орков еще более сильными и опасными врагами.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_19");	//Опять драконы?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_20");	//Ты меня не совсем понял. Их я привел лишь в качестве примера.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_21");	//На самом деле, это могут быть любые другие существа, подчиняющиеся воле Хранителей.
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_22");	//Правда, это всего лишь мое предположение. Поэтому я бы не стал утверждать это с абсолютной уверенностью.
	AI_Output(other,self,"DIA_PYROKAR_ORCSECRET_01_23");	//Что же это за существа и где их найти?
	AI_Output(self,other,"DIA_PYROKAR_ORCSECRET_01_24");	//Извини, но я не знаю ответа на этот вопрос. Попробуй его поискать в другом месте.
	B_LogEntry(TOPIC_ORCSECRET,"Пирокар предположил, что Хранители даровали защиту оркам посредством каких-то могущественных созданий.");
	PyrokarTellAboutCreatures = TRUE;

	if(GATHERALLONBIGFARM == TRUE)
	{
		B_LogEntry_Quiet(TOPIC_GUARDIANS,"Возможно, единственный шанс одолеть Хранителей - попытаться отыскать еще какое-нибудь божество, способное противостоять их мощи.");
	};
};

instance DIA_PYROKAR_GATHERALLONBIGFARMTWO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_gatherallonbigfarmtwo_condition;
	information = dia_pyrokar_gatherallonbigfarmtwo_info;
	permanent = FALSE;
	description = "У меня есть для тебя новость.";
};

func int dia_pyrokar_gatherallonbigfarmtwo_condition()
{
	if(HAGENNOMORETIMEWAIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_gatherallonbigfarmtwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_00");	//У меня есть для тебя новость.
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_02");	//Паладины готовы выступить на позиции в Хоринис. Лорд Хаген со своими людьми встанет лагерем недалеко от фермы Онара, и просит тебя быть готовым присоединиться к нему.
	AI_Output(self,other,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_03");	//Но почему он решил именно там занять оборону?
	AI_Output(other,self,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_04");	//По его сведениям, орки стягивают свои основные силы именно к этой ферме. Поэтому глава паладинов уверен, что они именно туда нанесут свой удар!
	AI_Output(self,other,"DIA_Pyrokar_GatherAllOnBigFarmTwo_01_05");	//Все ясно...(серьезно) Тогда в скором времени мы присоединимся к его армии.
	PYROKARMESSAGEPAL = TRUE;
};


instance DIA_PYROKAR_TELLTOHAGENFORT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_telltohagenfort_condition;
	information = dia_pyrokar_telltohagenfort_info;
	permanent = FALSE;
	description = "Я говорил с главой паладинов.";
};


func int dia_pyrokar_telltohagenfort_condition()
{
	if((KAPITELORCATC == TRUE) && (TELLTOHAGENFORT == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_telltohagenfort_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_00");	//Я говорил с главой паладинов.
	AI_Output(self,other,"DIA_Pyrokar_TellToHagenFort_01_01");	//И что сказал лорд Хаген? (взволнованно) Как он сам оценивает сложившуюся ситуацию?
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_02");	//Ситуация хуже некуда! Паладины понесли огромные потери при защите города, и теперь вряд ли смогут открыто выступить против орков.
	AI_Output(other,self,"DIA_Pyrokar_TellToHagenFort_01_03");	//Поэтому он и его люди пока останутся в форте и будут готовить план контратаки.
	AI_Output(self,other,"DIA_Pyrokar_TellToHagenFort_01_12");	//Эх. Надеюсь он понимает, что делает.
};


instance DIA_PYROKAR_KDFANSWER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_kdfanswer_condition;
	information = dia_pyrokar_kdfanswer_info;
	permanent = FALSE;
	description = "Паладинам нужна ваша помощь!";
};


func int dia_pyrokar_kdfanswer_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (KDF_JOINHAGEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kdfanswer_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_KDFAnswer_01_00");	//Паладинам нужна ваша помощь!
	AI_Output(other,self,"DIA_Pyrokar_KDFAnswer_01_02");	//Лорд Хаген хочет выступить против орков, и сейчас собирает под свои знамена всех людей, готовых поддержать его в этом.
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_03");	//Что же, это хорошая новость. И мы, безусловно, окажем ему всяческую поддержку в борьбе с этими тварями.
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_04");	//Однако все-таки не стоит забывать, что орки - это сейчас не самый главный наш враг. Хранители - вот истинная угроза этого мира!
	AI_Output(self,other,"DIA_Pyrokar_KDFAnswer_01_05");	//Поэтому, прежде всего, мы должны решить именно эту проблему. Иначе, все будет напрасно.
	KDF_JOINHAGEN = TRUE;
	Log_AddEntry(TOPIC_ORсGREATWAR,"Маги Огня поддержат паладинов в сражении с орками.");
};


instance DIA_PYROKAR_STRANGETHINGS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethings_condition;
	information = dia_pyrokar_strangethings_info;
	permanent = FALSE;
	description = "Стали происходить довольно странные вещи...";
};


func int dia_pyrokar_strangethings_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_guardiansexists) && (MIS_STRANGETHINGS == LOG_Running) && (GUARDIANSISDEFEATED == FALSE) && ((FIRSTLOOKONTOTEM == TRUE) || (FIRSTSTRIKEME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethings_info()
{
	AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_00");	//Стали происходить довольно странные вещи...
	AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_01");	//Какие именно?

	if((FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_02");	//Путешествуя по острову, я случайно наткнулся на огромную и необычного вида статую.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_03");	//Могу поспорить, что раньше я никогда ее там не видел!
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_04");	//(задумчиво) Это действительно странно, поскольку недалеко от монастыря появилась точно такая же.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_05");	//Еще мне показалось, что она излучает какую-то очень странную магическую энергию, от которой, если честно, мне становится немного не по себе.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_06");	//Ты не знаешь, что бы это все могло значить?
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_07");	//Боюсь, что нет. Но полагаю, что тебе пока следует держаться подальше от них. Еще неизвестно, какими именно магическими свойствами они обладают.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_08");	//Возможно, это дело рук Хранителей.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_09");	//Но это еще не все.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_10");	//Недавно, когда я попытался атаковать одного из орков, в меня ударил сильный разряд молнии, чуть не убивший меня.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_12");	//(задумчиво) Кажется, я начинаю кое-что понимать.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_15");	//Я предполагаю, что те необычные статуи, которые ты повстречал на острове, служат оркам в качестве некоторого рода защитных тотемов.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_16");	//И судя по всему, в их близи эти твари практически непобедимы!
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_17");	//А если учесть, что сами орки вряд ли обладают такими познаниями в магии, то из всего этого можно сделать только один вывод - за всем этим стоят именно Хранители!
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_20");	//И теперь наш единственный шанс одолеть орков - это лишить их поддержки Хранителей.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_23");	//Мне пока неизвестно, насколько велико влияние этих древних артефактов и дальность их действия.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_24");	//Так что, думаю, будет лучше, если ты пока будешь обходить стороной большие скопления орков.
		MIS_STRANGETHINGS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
	}
	else
	{
		if(FIRSTLOOKONTOTEM == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_27");	//Путешествуя по острову, я случайно наткнулся на огромного и необычного вида статую.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_28");	//Могу поспорить, что раньше ее там я не никогда видел!
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_29");	//(задумчиво) Это действительно странно, поскольку недалеко от монастыря появилась точно такая же.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_30");	//И еще мне показалось, что она излучает какую-то очень странную магическую энергию, от которой, если честно, мне становится немного не по себе.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_31");	//Ты не знаешь, что бы это все могло значить?
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_32");	//Боюсь, что нет. Но полагаю, что тебе пока следует держаться подальше от них. Еще неизвестно, какими именно магическими свойствами они обладают.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_33");	//Возможно, это дело рук Хранителей.
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_34");	//Хорошо, мне все ясно.
			STRIKENODISCOVER = TRUE;
			B_LogEntry(TOPIC_STRANGETHINGS,"Я рассказал Пирокару о странных статуях, которые встретил на острове. Он посоветовал мне держаться от них подальше, поскольку не исключает, что все это дело рук Хранителей, а с их древней магией лучше связываться.");
		};
		if(FIRSTSTRIKEME == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_StrangeThings_01_35");	//Недавно, когда я попытался атаковать одного из орков, в меня ударил сильный разряд молнии, чуть не убивший меня.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_37");	//(задумчиво) Это действительно крайне неожиданно! Я даже и не знаю, что тебе сказать на это.
			AI_Output(self,other,"DIA_Pyrokar_StrangeThings_01_38");	//В любом случае постарайся пока обходить стороной патрули орков.
			B_LogEntry(TOPIC_STRANGETHINGS,"Я рассказал Пирокару о своей попытке атаковать орков и том, что из всего этого получилось. Он посоветовал мне держаться от них подальше, пока не откроются все обстоятельства этого необычного поворота дел.");
		};
	};
};

instance DIA_PYROKAR_STRANGETHINGSAGAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_strangethingsagain_condition;
	information = dia_pyrokar_strangethingsagain_info;
	permanent = FALSE;
	description = "По поводу странных вещей...";
};

func int dia_pyrokar_strangethingsagain_condition()
{
	if((MIS_STRANGETHINGS == LOG_Running) && (FIRSTLOOKONTOTEM == TRUE) && (FIRSTSTRIKEME == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_strangethings) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_strangethingsagain_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_00");	//По поводу странных вещей...
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_01");	//Да? Случилось что-нибудь еще?
	if(STRIKENODISCOVER == TRUE)
	{
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_02");	//Недавно, когда я попытался атаковать одного из орков, в меня ударил сильный разряд молнии, чуть не убивший меня.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_04");	//(задумчиво) Кажется, я начинаю кое-что понимать.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_06");	//Путешествуя по острову, я случайно наткнулся на огромную и необычного вида статую.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_07");	//Могу поспорить, что раньше ее там я не никогда видел!
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_08");	//(задумчиво) Это действительно странно, поскольку недалеко от монастыря появилась точно такая же.
		AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_09");	//И еще мне показалось, что эта статуя излучает какую-то очень странную магическую энергию, от которой, если честно, мне становится немного не по себе.
		AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_10");	//(задумчиво) Кажется, я начинаю кое-что понимать.
	};
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_13");	//Я предполагаю, что те необычные статуи, которые ты повстречал на острове, служат оркам в качестве некоторого рода защитных тотемов.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_14");	//И судя по всему, в их близи эти твари практически непобедимы!
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_15");	//А если учесть, что сами орки навряд ли обладают такими познаниями в магии, то из всего этого можно сделать только один вывод - за всем этим стоят именно Хранители!
	AI_Output(other,self,"DIA_Pyrokar_StrangeThingsAgain_01_16");	//И как же нам теперь быть со всем этим?
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_18");	//Не знаю, но я уверен, что теперь наш единственный шанс одолеть орков - это лишить их поддержки Хранителей.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_21");	//Мне пока неизвестно, насколько велико влияние этих древних артефактов и дальность их действия.
	AI_Output(self,other,"DIA_Pyrokar_StrangeThingsAgain_01_22");	//Так что, думаю, будет лучше, если ты пока будешь обходить стороной большие скопления орков.
	MIS_STRANGETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
};

instance DIA_PYROKAR_TRANSENERGY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergy_condition;
	information = dia_pyrokar_transenergy_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};

func int dia_pyrokar_transenergy_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergy_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_01");	//Помощь? Какая именно?
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_02");	//Мне срочно необходим свиток с заклинанием, способным перенести энергию из одного предмета в другой.
	AI_Output(other,self,"DIA_Pyrokar_TransEnergy_01_03");	//Ты сможешь сделать для меня такой?
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_04");	//(задумчиво) Это будет непросто.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_07");	//Все это займет у меня кое-какое время.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_12");	//Формула нужного тебе заклинания достаточно сложна, поэтому спешка в его расчетах может повлечь за собой непредсказуемые последствия.
	AI_Output(self,other,"DIA_Pyrokar_TransEnergy_01_15");	//Мне потребуется около суток на это.
	TRANSENERGYDAY = Wld_GetDay();
	B_LogEntry(TOPIC_GUARDIANS,"Я обратился к Пирокару за помощью в создании свитка с заклинанием, способным перенести всю энергию магических артефактов в рудный клинок. Как и ожидалось, создание подобного заклинания для верховного мага Огня не составит особых проблем, однако придется подождать около суток.");
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_TRANSENERGYDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_transenergydone_condition;
	information = dia_pyrokar_transenergydone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_transenergydone_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((daynow > TRANSENERGYDAY) && (NETBEKLEADME_STEP2DONE == FALSE) && (Npc_KnowsInfo(other,dia_pyrokar_transenergy) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_transenergydone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Pyrokar_TransEnergyDone_01_00");	//Свиток с нужным тебе заклинанием уже готов!
	AI_Output(self,other,"DIA_Pyrokar_TransEnergyDone_01_01");	//Вот, возьми его. И главное, помни, что обращаться с ним нужно предельно аккуратно.
	B_GiveInvItems(self,other,itwr_transferenergy,1);
};


instance DIA_PYROKAR_RUNEMAGIC(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagic_condition;
	information = dia_pyrokar_runemagic_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pyrokar_runemagic_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagic_info()
{
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_00");	//(облегченно) Хвала Инносу - ты жив!
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_01");	//А то я уже начал опасаться, что этим тварям все-таки удалось добраться и до тебя.
	AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_02");	//Нет, все в полном порядке.

 	if(HERONOTJOINBIGBATTLE == FALSE)
	{
		AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_03");	//Между прочим, думаю, ты наверняка заметил - мы только что разбили огромную армию орков!
	};

	AI_Output(other,self,"DIA_Pyrokar_RuneMagic_01_04");	//Так что у меня есть для тебя новости на этот счет.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagic_01_06");	//Да? O каких новостях ты говоришь?
};

instance DIA_PYROKAR_GUARDIANSKILLED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_guardianskilled_condition;
	information = dia_pyrokar_guardianskilled_info;
	permanent = FALSE;
	description = "Угрозы со стороны Хранителей больше нет!";
};

func int dia_pyrokar_guardianskilled_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (ORCSWINSBB == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_guardianskilled_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_GuardiansKilled_01_00");	//Угрозы со стороны Хранителей больше нет!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_01");	//(очень удивленно) Что ты хочешь этим сказать?
	AI_Output(other,self,"DIA_Pyrokar_GuardiansKilled_01_02");	//Я смог одержать над ними верх и изгнать их из этого мира.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_03");	//О Иннос! Неужели все это правда?
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_05");	//Тогда это самая лучшая новость, которую ты только мог мне сообщить.
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_11");	//Теперь этот мир спасен, как и мы все!
	AI_Output(self,other,"DIA_Pyrokar_GuardiansKilled_01_12");	//Так что прими от меня мою глубочайшую благодарность за все, что ты для нас сделал.
};

instance DIA_PYROKAR_LOOKUNUSUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_lookunusual_condition;
	information = dia_pyrokar_lookunusual_info;
	permanent = FALSE;
	description = "Ты как-то странно на меня смотришь.";
};

func int dia_pyrokar_lookunusual_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_lookunusual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_00");	//Ты как-то странно на меня смотришь.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_04");	//У меня возникло такое чувство, что со времени нашей последней встречи в тебе что-то изменилось.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_05");	//Я вдруг стал ощущать в тебе огромную силу, которой не чувствовал ранее.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_06");	//Как-будто передо мной сейчас стоит не простой человек...(неуверенно) А сам Иннос!
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_07");	//Хммм... По всей видимости, от тебя действительно ничего не сможет ускользнуть.
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_08");	//Ты прав! Сами боги даровали мне свое могущество для того, чтобы я мог сразиться с нашим врагом.
	AI_Output(other,self,"DIA_Pyrokar_LookUnusual_01_09");	//Причем все без исключения.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_10");	//И даже сам Белиар? Бог Тьмы?
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_12");	//Невероятно! Я и представить себе не мог, что подобное возможно!
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_16");	//Боги сделали тебя своим избранным, дабы именно ты защитил их мир от постигшего его зла!
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_17");	//И судя по всему, они не ошиблись в свое выборе.
	AI_Output(self,other,"DIA_Pyrokar_LookUnusual_01_19");	//Мне лишь только остается вновь преклонить свои колени перед тобой, герой.
};

instance DIA_PYROKAR_WHATDO(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_whatdo_condition;
	information = dia_pyrokar_whatdo_info;
	permanent = FALSE;
	description = "И что теперь?";
};

func int dia_pyrokar_whatdo_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MONASTERYISFREE == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_guardianskilled))
	{
		return TRUE;
	};
};

func void dia_pyrokar_whatdo_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_01_00");	//И что теперь?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_01");	//Я и все оставшиеся в живых маги должны будем теперь вернуться в монастырь!
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_02");	//Он до сих пор находится под осадой орков, и мы не можем надолго покидать его стены.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_01_03");	//Поскольку те послушники, которые остались там, вряд ли смогут сдержать этих тварей, если те решат вновь его штурмовать!
	RUNEMAGICNOTWORK = TRUE;
	Info_ClearChoices(dia_pyrokar_whatdo);
	Info_AddChoice(dia_pyrokar_whatdo,"(закончить разговор)",dia_pyrokar_whatdo_away);
};

func void dia_pyrokar_whatdo_away()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_00");	//Черт! Что происходит? Я не понимаю!
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_02");	//Моя руна телепортации - она не работает!
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_03");	//То есть как не работает?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_04");	//Я уже несколько секунд назад должен был оказаться во дворе монастыря.
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_08");	//Тогда попробуй еще раз. Может быть, сейчас все получится.
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_10");	//Нет! Ничего не выходит...(растерянно) Но как вообще такое возможно?
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_12");	//А что насчет других рун?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_13");	//(задумчиво) Хммм.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_14");	//Нет, то же самое! Я не могу воспользоваться ни одной магической руной.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_15");	//Кажется, что они все потеряли свою магию!
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_17");	//О Иннос! Только этого нам сейчас не хватало!
	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_18");	//Без этой магии у нас нет ни единого шанса защитить наш монастырь от орков.
	};
	AI_Output(other,self,"DIA_Pyrokar_WhatDo_Away_01_19");	//И что теперь будем делать?
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_20");	//Слушай меня внимательно. Найди кого-нибудь из магов и спроси у них, работают ли их магические руны.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_21");	//Узнай это также и у паладинов. Мы должны как можно быстрее понять, что здесь творится.
	AI_Output(self,other,"DIA_Pyrokar_WhatDo_Away_01_24");	//Ступай!
	MIS_RUNEMAGICNOTWORK = LOG_Running;
	Log_CreateTopic(TOPIC_RUNEMAGICNOTWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_Running);
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Странно - по непонятной причине Пирокару теперь не удается использовать рунную магию. Ни одно из его заклинаний так и не сработало. Необходимо срочно выяснить, как с этим обстоят дела у других магов и паладинов.");
	AI_StopProcessInfos(self);
};


var int frdnw;
var int wrdnw;
var int grdnw;
var int prdnw;

instance DIA_PYROKAR_RUNEMAGICNOTWORKDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdone_condition;
	information = dia_pyrokar_runemagicnotworkdone_info;
	permanent = TRUE;
	description = "Мне удалось узнать кое-что насчет рунной магии.";
};


func int dia_pyrokar_runemagicnotworkdone_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == FALSE) && ((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdone_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_01_00");	//Мне удалось кое-что узнать насчет рунной магии.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_01_01");	//(нетерпеливо) Что именно?  Говори же!
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
	if((FIREMAGERUNESNOT == TRUE) && (FRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Остальные маги Огня также не могут ее больше использовать.",dia_pyrokar_runemagicnotworkdone_fire);
	};
	if((WATERMAGERUNESNOT == TRUE) && (WRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Маги Воды лишились возможности управлять своими рунами.",dia_pyrokar_runemagicnotworkdone_water);
	};
	if((GURUMAGERUNESNOT == TRUE) && (GRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Гуру Братства больше не обладают силой творить заклинания с помощью рун.",dia_pyrokar_runemagicnotworkdone_guru);
	};
	if((PALADINRUNESNOT == TRUE) && (PRDNW == FALSE))
	{
		Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Магия паладинов больше не работает!",dia_pyrokar_runemagicnotworkdone_paladin);
	};
	Info_AddChoice(dia_pyrokar_runemagicnotworkdone,"Пока это все, что я узнал.",dia_pyrokar_runemagicnotworkdone_no);
};

func void dia_pyrokar_runemagicnotworkdone_fire()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_00");	//Остальные маги Огня также не могут ее больше использовать.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Fire_01_01");	//(задумчиво) Этого я и опасался. Что-нибудь еще?
	FRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_water()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_00");	//Маги Воды лишились возможности управлять своими рунами.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Water_01_01");	//Это еще более странно, чем я предполагал. Еще что-то удалось выяснить?
	WRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_guru()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_00");	//Гуру Братства больше не обладают силой творить заклинания с помощью рун.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Guru_01_01");	//Даже так! Хммм...(задумчиво) Есть еще новости?
	GRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_paladin()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_00");	//Магия паладинов больше не работает.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_01");	//Так я и думал...(задумчиво) Тогда, по всей видимости, у нас очень серьезные проблемы.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_Paladin_01_02");	//Это все, что тебе удалось узнать?
	PRDNW = TRUE;
};

func void dia_pyrokar_runemagicnotworkdone_no()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_00");	//Пока это все, что я узнал.
	if((FRDNW == TRUE) && (WRDNW == TRUE) && (GRDNW == TRUE) && (PRDNW == TRUE))
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_01");	//Хорошо. Думаю, этого достаточно.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_02");	//И судя по всему, я, кажется, начинаю понимать, что именно произошло.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_03");	//Но прежде чем окончательно удостовериться в верности своих суждений...
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_04");	//...я хочу попросить тебя выполнить еще одну мою небольшую просьбу.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_06");	//Ты должен сам попробовать использовать любую магическую руну.
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_07");	//И после этого рассказать мне, что у тебя получилось.
		ALLMAGESRUNEMAGICNOTWORK = TRUE;
		if(TESTRUNEME == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_08");	//Я уже это делал!
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_09");	//И?
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_10");	//Мне до сих пор удается использовать рунную магию.
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_11");	//Так я и думал! Теперь мне все ясно.
			KNOWNHOWDESTROYRUNE = TRUE;
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, я сообщил Пирокару все, что мог о рунной магии. Узнав о том, что сам я до сих пор могу использовать силу рун, - ему, наконец, стало ясно, что произошло.");
			Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
		}
		else
		{
			B_GivePlayerXP(100);
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, я сообщил Пирокару все, что мог о рунной магии. Теперь верховный маг попросил меня лично попробовать воспользоваться силой своих рун, а затем сообщить ему результаты.");
			AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_12");	//Ладно, попробую.
			AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_13");	//В таком случае я жду от тебя ответа.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDone_No_01_14");	//Хорошо. Однако этого мало! Постарайся выяснить еще что-нибудь.
	};
	Info_ClearChoices(dia_pyrokar_runemagicnotworkdone);
};


instance DIA_PYROKAR_RUNEMAGICNOTWORKDONEAFTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicnotworkdoneafter_condition;
	information = dia_pyrokar_runemagicnotworkdoneafter_info;
	permanent = FALSE;
	description = "Дай мне какую-нибудь руну.";
};


func int dia_pyrokar_runemagicnotworkdoneafter_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicnotworkdoneafter_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_00");	//Дай мне какую-нибудь руну, чтобы я мог попробовать.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_01");	//Воспользуйся своей руной.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_RuneMagicNotWorkDoneAfter_01_03");	//(задумчиво) Хорошо. Вот, возьми эту.
		B_GiveInvItems(self,other,ItRu_Light_Pyr,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNEMAGICTESTMERESULT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagictestmeresult_condition;
	information = dia_pyrokar_runemagictestmeresult_info;
	permanent = FALSE;
	description = "Я сделал то, о чем ты просил.";
};


func int dia_pyrokar_runemagictestmeresult_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (ALLMAGESRUNEMAGICNOTWORK == TRUE) && (TESTRUNEME == TRUE) && (KNOWNHOWDESTROYRUNE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagictestmeresult_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicTestMeResult_01_00");	//Я сделал то, о чем ты просил.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicTestMeResult_01_01");	//И?
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicTestMeResult_01_02");	//Мне до сих пор удается использовать рунную магию.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicTestMeResult_01_03");	//Так я и думал! Теперь мне все ясно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Я рассказал Пирокару о том, что мне до сих пор удается использовать силу рун. Теперь ему стало ясно, что произошло.");
	KNOWNHOWDESTROYRUNE = TRUE;
};


instance DIA_PYROKAR_RUNEMAGICEXPLAIN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_runemagicexplain_condition;
	information = dia_pyrokar_runemagicexplain_info;
	permanent = FALSE;
	description = "Так что же на самом деле произошло?";
};


func int dia_pyrokar_runemagicexplain_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_Running) && (KNOWNHOWDESTROYRUNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_runemagicexplain_info()
{
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_00");	//Так что же на самом деле произошло?
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_01");	//Почему вы больше не можете использовать свою рунную магию?
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_02");	//Потому что ее больше не существует в том виде, в котором она была подвластна нам ранее.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_03");	//И я боюсь, что отчасти в этом есть и твоя вина.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_05");	//Полагаю, что, наделив тебя своим могуществом, боги отдали тебе большую часть своей силы.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_06");	//Однако тем самым они практически лишились возможности являть ту свою божественную сущность, которая и давала нам возможность использовать их магию.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_07");	//Сама структура магической связи между людьми и богами стала крайне хрупкой и неустойчивой.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_08");	//И любое небольшое магическое волнение в этом мире вполне было способно ее окончательно уничтожить!
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_11");	//Но, по всей видимости, именно твоя победа над Хранителями и явилась причиной всех этих последствий.
	AI_Output(other,self,"DIA_Pyrokar_RuneMagicExplain_01_13");	//Но почему тогда я могу использовать магические руны?
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_14");	//Это довольно легко объяснить. В тебе сейчас сосредоточена огромная божественная сила!
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_15");	//И твоя связь с самими богами куда намного больше, чем ты можешь себе представить.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_16");	//Все это и дает тебе возможность использовать магию рун!
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_23");	//Да, и еще кое-что. Прошу тебя, сообщи лорду Хагену о том, что наша рунная магия уничтожена.
	AI_Output(self,other,"DIA_Pyrokar_RuneMagicExplain_01_24");	//Безусловно, это будут для него тяжелые новости, но глава паладинов должен знать об этом!
	MIS_RUNEMAGICNOTWORK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUNEMAGICNOTWORK,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Отдав мне часть своей божественной силы, боги ослабили магическую связь между ними и людьми, что и повлекло за собой ее окончательное уничтожение. Изгнание мною Хранителей из этого мира тоже наложило отпечаток на все происходящее, но с этим ничего уже поделаешь.");
	if(MONASTERYISFREE == TRUE)
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_MONASTERYSIEDGE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedge_condition;
	information = dia_pyrokar_monasterysiedge_info;
	permanent = FALSE;
	description = "Как вы теперь попадете обратно в монастырь?";
};


func int dia_pyrokar_monasterysiedge_condition()
{
	if((MIS_RUNEMAGICNOTWORK == LOG_SUCCESS) && (MONASTERYISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_00");	//Как вы теперь попадете обратно в монастырь?
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_01");	//Да, это действительно большая проблема, поскольку без нашей магии мы и близко к нему не подойдем.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_02");	//Орки до сих пор осаждают его со всех сторон!
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_03");	//И если они вдруг пронюхают, что там сейчас нет ни одного мага, способного противостоять им, то обязательно постараются его захватить.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_04");	//О Иннос! Мне даже и подумать страшно, что будет со всеми нашими послушниками!
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_05");	//И что мы будем делать?
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_06");	//Я не знаю. Как ты понимаешь, нам самим теперь его никак не защитить.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_07");	//Поэтому вся наша надежда остается только на тебя!
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_09");	//Уверен, что тебе как избраннику богов это вполне по силам!
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_10");	//Тем более сейчас, когда эти твари лишились поддержки со стороны Хранителей.
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedge_01_14");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_15");	//В таком случае поторопись! Сейчас дорога каждая минута.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedge_01_18");	//Надеюсь, что у тебя все получится, сын мой...(с надеждой) И да хранит тебя Иннос!
	MIS_MONASTERYSIEDGE = LOG_Running;
	Log_CreateTopic(TOPIC_MONASTERYSIEDGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_Running);
	B_LogEntry(TOPIC_MONASTERYSIEDGE,"После того как все маги на острове лишились возможности использовать рунную магию, Пирокар попросил меня помочь защитить их монастырь. Мне придется самому разобраться со всеми орками, осаждающими его.");
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MONASTERYSIEDGEDONE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_monasterysiedgedone_condition;
	information = dia_pyrokar_monasterysiedgedone_info;
	permanent = FALSE;
	description = "Осада с монастыря снята!";
};


func int dia_pyrokar_monasterysiedgedone_condition()
{
	if((MONASTERYISFREE == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_monasterysiedgedone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_MonasterySiedgeDone_01_00");	//Осада с монастыря снята!
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_02");	//О Иннос! Наконец-то это случилось.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_03");	//Теперь всем нашим послушникам ничего не угрожает, и я собираюсь незамедлительно последовать к ним.
	AI_Output(self,other,"DIA_Pyrokar_MonasterySiedgeDone_01_04");	//Спасибо, сын мой, за все, что ты для нас сделал. Мы никогда этого не забудем.
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_monasterysiedgedone);
		Info_AddChoice(dia_pyrokar_monasterysiedgedone,"(закончить разговор)",dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_ALLGREATVICTORY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_allgreatvictory_condition;
	information = dia_pyrokar_allgreatvictory_info;
	permanent = FALSE;
	description = "Я уничтожил всех орков в Хоринисе!";
};


func int dia_pyrokar_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_pyrokar_allgreatvictory_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_AllGreatVictory_01_00");	//Я уничтожил всех орков в Хоринисе! А те, что остались, не представляют существенной угрозы.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_03");	//Это радостное известие, сын мой...(улыбаясь) Хотя, глядя на тебя, я в этом нисколько не сомневался!
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_04");	//Уверен, что каждый человек на этом острове будет благодарен тебе за все, что ты для нас сделал.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_05");	//Ведь ты подарил всем хоть и небольшую, но все-таки надежду на благополучный исход в этой долгой и кровопролитной войне.
	AI_Output(self,other,"DIA_Pyrokar_AllGreatVictory_01_07");	//Спасибо. И да хранит тебя Иннос!
	if((MIS_RUNEMAGICNOTWORK == FALSE) && (RUNEMAGICNOTWORK == FALSE))
	{
		RUNEMAGICNOTWORK = TRUE;
		Info_ClearChoices(dia_pyrokar_allgreatvictory);
		Info_AddChoice(dia_pyrokar_allgreatvictory,"(закончить разговор)",dia_pyrokar_whatdo_away);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_magesgomonastery();
	};
};


instance DIA_PYROKAR_BELIARCURSE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_beliarcurse_condition;
	information = dia_pyrokar_beliarcurse_info;
	permanent = FALSE;
	description = "На мне проклятье Белиара!";
};


func int dia_pyrokar_beliarcurse_condition()
{
	if((MIS_BELIARCURSE == LOG_Running) && (BELIARCURSEYOU == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_beliarcurse_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_00");	//На мне проклятие Белиара! Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_01");	//Что?! (задумчиво вглядываясь) Если ты говоришь правду, тогда это очень серьезно!
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_02");	//Я даже теряюсь в догадках - что ты мог натворить, если Белиар решил наложить на тебя проклятие.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_03");	//Однако, как служитель Инноса, я не могу остаться в стороне и подскажу тебе способ, как избавиться от проклятья Бога Тьмы.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_05");	//Тебе нужно получить благословление самого Инноса, чтобы проклятие Белиара потеряло свою силу!
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_06");	//А ты не можешь благословить меня?
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_07");	//Нет, это не поможет...(серьезно) Только сам Иннос может спасти тебя!
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_08");	//Так что отправляйся и преклони колени перед любым из его алтарей.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_09");	//А после молись до тех пор, пока Иннос не станет к тебе благосклонен настолько, чтобы помочь тебе.
	AI_Output(self,other,"DIA_Pyrokar_BeliarCurse_01_12");	//Я уверен, что тебе предстоит провести в молитве немало дней и ночей, прежде чем это произойдет.
	AI_Output(other,self,"DIA_Pyrokar_BeliarCurse_01_14");	//Хорошо, я все понял.
	B_LogEntry(TOPIC_BELIARCURSE,"Верховный маг круга Огня подсказал мне способ, как избавиться от нависшего надо мной проклятия. Для этого мне необходимо отправиться к любому алтарю Инноса и молить его о том, чтобы он спас меня. Пирокар предупредил, что Иннос должен быть ко мне более чем благосклонен, чтобы откликнуться на мои мольбы.");
	PYRIKARSENDALTAR = TRUE;
};


instance DIA_Pyrokar_IgaranzNew(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_IgaranzNew_condition;
	information = DIA_Pyrokar_IgaranzNew_info;
	permanent = FALSE;
	description = "Послушник Игарац полон решимости стать магом Огня.";
};

func int DIA_Pyrokar_IgaranzNew_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 2) && (MIS_Igaraz_OneMoreChance == LOG_Running) && (IgarazIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IgaranzNew_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Pyrokar_IgaranzNew_01_01");	//Послушник Игарац полон решимости стать магом Огня.
	AI_Output(other,self,"DIA_Pyrokar_IgaranzNew_01_02");	//Я уверен, что он достоин получить еще один шанс.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_03");	//(задумчиво) Игарац? Возможно, он и достоин, но мне сейчас некогда это выяснять.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_04");	//В исключительных ситуациях испытание можно назначить повторно, это правда.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_05");	//В таких случаях задание послушнику должен дать четвертый член совета - страж покоев монастыря.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_06");	//Как ты уже наверное понял, я говорю о Таламоне. К нему и обратись.
	AI_Output(self,other,"DIA_Pyrokar_IgaranzNew_01_07");	//Теперь ступай, - не отвлекай меня больше по таким пустякам.
	IS_PYROKAR_IGORANZINFO = TRUE;
	B_LogEntry(TOPIC_IGARANZ_NEW,"Пирокар согласился провести испытание для Игараца еще раз. Обычаи монастыря указывают на то, что задание в таком случае должен дать именно Таламон. Стоит теперь проведать старика.");
};

instance DIA_PYROKAR_PiratePray(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_condition;
	information = dia_pyrokar_PiratePray_info;
	permanent = FALSE;
	description = "Мне нужна ваша помощь.";
};

func int dia_pyrokar_PiratePray_condition()
{
	if(MIS_PiratePray == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_00");		//Мне нужна ваша помощь.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_01");		//О чем идет речь?
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_02");		//Дело очень щекотливое! Необходимо помолиться о душах людей, чьи преступления перед Инносом были довольно велики.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_03");		//А что это за люди?

	if(RhetorikSkillValue[1] >= 60)
	{
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_04");		//Пираты. Но они хотят начать новую жизнь и, прежде всего, замолить свои грехи.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_05");		//Безусловно, это похвальное рвение с их стороны...
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_06");		//Но люди такого рода обычно слишком сильно отягощены грузом своих преступлений.
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_07");		//Неужели ничего нельзя сделать?
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_08");		//Ну почему же, можно, конечно. Но тебе придется внести очень щедрое пожертвование монастырю.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_09");		//Чтобы Иннос принял эту искупительную молитву за их души.
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_10");		//Сколько?
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_11");		//Все зависит от твоей щедрости, сын мой. Но это пожертвование должно быть не меньше тысячи золотых монет!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_12");		//Понимаю.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		PyrAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray,"Пирокар согласился помолиться за души людей Грэга. Но сперва я должен внести щедрое пожертвование монастырю - не менее тысячи монет золотом.");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_13");		//Пираты. Но они хотят начать новую жизнь и, прежде всего, замолить свои грехи.
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_14");		//Пираты? Об этом не может идти и речи!
		AI_Output(other,self,"DIA_Pyrokar_PiratePray_01_15");		//Но...
		AI_Output(self,other,"DIA_Pyrokar_PiratePray_01_16");		//Никаких 'но'! И больше не смей меня просить о таком!
		PyrNotAgreePray = TRUE;
		B_LogEntry(TOPIC_PiratePray,"Пирокар отказался молиться за души людей Грэга. Придется его расстроить.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_PYROKAR_PiratePray_Gold(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_PiratePray_Gold_condition;
	information = dia_pyrokar_PiratePray_Gold_info;
	permanent = TRUE;
	description = "Тогда помолитесь за них.";
};

func int dia_pyrokar_PiratePray_Gold_condition()
{
	if((MIS_PiratePray == LOG_Running) && (PyrAgreePray == TRUE)) 
	{
		return TRUE;
	};
};

func void dia_pyrokar_PiratePray_Gold_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_01_00");		//Тогда помолитесь за них. Я внесу пожертвование.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_01_01");		//И сколько ты сможешь внести золота на это благое дело?
	Info_ClearChoices(DIA_Pyrokar_PiratePray_Gold);
	Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Я пока подумаю над этим.",DIA_Pyrokar_PiratePray_Gold_Back);

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Тысячу золотых монет.",DIA_Pyrokar_PiratePray_Gold_One);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Две тысячи золотых монет.",DIA_Pyrokar_PiratePray_Gold_Two);
	};
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Pyrokar_PiratePray_Gold,"Три тысячи золотых монет.",DIA_Pyrokar_PiratePray_Gold_Three);
	};
};

func void DIA_Pyrokar_PiratePray_Gold_Back()
{
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Back_01_00");		//Я пока подумаю над этим.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Back_01_01");		//Хорошо, сын мой. Как надумаешь, обращайся.
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_One()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_One_01_00");		//Тысячу золотых монет.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_One_01_01");		//Хорошо, сын мой.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_One_01_02");		//Я принимаю твой дар, и нами будет проведена молитва об очищении душ этих людей.
	GregBonusPray = 1;
	B_LogEntry(TOPIC_PiratePray,"Пирокар помолиться за души людей Грэга.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Two()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Two_01_00");		//Две тысячи золотых монет.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Two_01_01");		//Это очень щедро с твоей стороны, сын мой.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Two_01_02");		//Я принимаю твой дар, и нами будет проведена молитва об очищении душ этих людей.
	GregBonusPray = 2;
	B_LogEntry(TOPIC_PiratePray,"Пирокар помолится за души людей Грэга.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

func void DIA_Pyrokar_PiratePray_Gold_Three()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	AI_Output(other,self,"DIA_Pyrokar_PiratePray_Gold_Three_01_00");		//Три тысячи золотых монет.
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Three_01_01");		//(с уважением) Что же, я от всей души благодарю тебя, сын мой, за столь щедрое пожертвование!
	AI_Output(self,other,"DIA_Pyrokar_PiratePray_Gold_Three_01_02");		//Я тот же час распоряжусь, чтобы нами немедленно была проведена молитва об очищении душ этих людей.
	GregBonusPray = 3;
	B_LogEntry(TOPIC_PiratePray,"Пирокар помолится за души людей Грэга.");
	MIS_PiratePray = LOG_Success;
	Log_SetTopicStatus(TOPIC_PiratePray,LOG_Success);
	AI_StopProcessInfos(self);
};

instance DIA_PYROKAR_DarkOrden(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_condition;
	information = dia_pyrokar_DarkOrden_info;
	permanent = FALSE;
	description = "Меня прислал лорд Хаген.";
};

func int dia_pyrokar_DarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToPyro == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_00");		//Меня прислал лорд Хаген.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_01");		//Можешь не продолжать. Я уже догадываюсь, о чем пойдет речь.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_02");		//Тогда мне нужен твой мудрый совет!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_03");		//По правде говоря, я даже не знаю, чем я смогу тебе помочь. 
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_04");		//Все наши собственные изыскания на предмет происходящего не дали нам никаких точных ответов на этот вопрос.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_05");		//Однако, все-таки есть одна вещь, которая, возможно, тебя заинтересует.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_07");		//В древних рукописях, что нам удалось отыскать в библиотеке, говорится, что нечто подобное происходило уже и ранее.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_08");		//Тогда причиной всему стал один очень могущественный артефакт, который пробудил к жизни некое страшное Зло!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_09");		//Что это за артефакт?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_10");		//Судя по всему, это просто обычная книга...(загадочно) В тех рукописях ее называют Хроманином.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_11");		//Кажется, что я уже слышал об этой вещи. Правда, не помню, где.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_12");		//Как бы то ни было, это наша единственная зацепка. Так что тебе придется выяснить о ней все, что только сможешь.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_01_13");		//И как это сделать? Ведь я даже не знаю, где мне ее искать.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_14");		//Я тоже. Однако этот артефакт, вне сомнений, порождение Белиара и его слуг!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_01_15");		//Так что, если и искать ответы на интересующие нас вопросы, то только у одного из них.
	DO_SendToKriol = TRUE; 
	B_LogEntry(TOPIC_DarkOrden,"Пирокар не смог толком ответить, почему в Хоринис вторглась нежить, однако сказал мне, что некогда подобное уже случалось. И причиной тому явился древний артефакт - книга, которую Древние называли Хроманин. Пирокар посоветовал мне выяснить все, что касается этой книги. Согласно ему, этот артефакт порожден самим Белиаром, и искать ответы следует у кого-то из его служителей.");
};

instance DIA_PYROKAR_DarkOrdenKnown(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenKnown_condition;
	information = dia_pyrokar_DarkOrdenKnown_info;
	permanent = FALSE;
	description = "Я узнал причину нашествия нежити.";
};

func int dia_pyrokar_DarkOrdenKnown_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KnowAboutDO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenKnown_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_00");		//Я узнал причину нашествия нежити.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_01");		//Что же, это хорошие новости! Расскажи мне все, что знаешь, сын мой.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_02");		//Хорошо, но прежде ответь мне на один вопрос. Сколько знатных паладинов похоронено в Хоринисе?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_03");		//Ты задал довольно непростой вопрос. Дай мне подумать...
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_04");		//(задумчиво) На моей памяти их было только трое - лорды Инубис, Мират и Ульзар.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_05");		//Все они были достопочтенными членами ордена паладинов. И их усыпальницы находятся здесь, на острове.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_06");		//А почему ты спрашиваешь об этом?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_07");		//После своей смерти эти паладины восстали в виде могущественной нежити.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_08");		//Именно они насылают на Хоринис орды нежити. И только упокоив их души, мы сможем остановить вторжение.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_09");		//Ты в своем уме? О Иннос, это же чистой воды святотатство!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_10");		//Я понимаю твои чувства, но иного пути у нас нет.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_11");		//Нам необходимо проверить эти усыпальницы. Иначе будет слишком поздно!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_12");		//(взволнованно) Я наверно сошел с ума, если позволяю тебе делать это.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_13");		//Но по всей видимости, ты прав и мы не можем позволить себе так рисковать.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_14");		//Ключи, отпирающие эти усыпальницы, находятся тут, в монастыре. 
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_15");		//Вот, возьми их себе.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItKe_Hagen_Innubis,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_01,1);
	CreateInvItems(other,ItKe_Hagen_DarkOrder_02,1);
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenKnown_01_16");		//Однако я все-таки надеюсь, что ты ошибся в своих расчетах, и эти благородные люди ни в чем не виноваты.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenKnown_01_17");		//Хотелось бы в это верить.
	B_LogEntry(TOPIC_DarkOrden,"Скрепя сердце, Пирокар дал мне ключи от усыпальниц паладинов. Пора нанести им визит.");
	AI_StopProcessInfos(self);

	Wld_InsertNpc(DARKTOWER_SKELETON_LORD,"NW_FARM2_TAVERNCAVE1_09");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_10");
	Wld_InsertNpc(skeleton_warrior_dark,"NW_FARM2_TAVERNCAVE1_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM2_TAVERNCAVE1_07");

	Wld_InsertNpc(SKELETON_LORD_MIRAT,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_MAIN");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_10_01");
	Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_07_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_TROLLAREA_TROLLROCKCAVE_06");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_STONETPLATETEACH_25");
		Wld_InsertNpc(skeleton_dark,"FP_ITEM_FOREST_STPLATE_04");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_06");
		Wld_InsertNpc(skeleton_dark,"NW_FARM2_TAVERNCAVE1_04");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_09");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_08");
		Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_04");

		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_02");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_TROLLLAKECAVE_03_01");
		Wld_InsertNpc(skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
		Wld_InsertNpc(skeleton_warrior,"NW_TROLLAREA_TROLLROCKCAVE_01");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_04");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_TROLLAREA_RITUALFOREST_04_MONSTER_02");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(skeleton_warrior,"NW_FARM2_TO_TAVERNCAVE1_05");

		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_01");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_02");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_03");
		Wld_InsertNpc(skeleton,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_04");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_FARM2_TAVERNCAVE1_02_05");

		Wld_InsertNpc(skeleton,"NW_CRYPT_01");
		Wld_InsertNpc(skeleton_warrior,"CRYPT");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_10");
		Wld_InsertNpc(skeleton,"NW_CRYPT_05");
		Wld_InsertNpc(skeleton_warrior,"NW_CRYPT_03");
		Wld_InsertNpc(skeleton_dark,"NW_CRYPT_02");
	};
};

instance DIA_PYROKAR_DarkOrdenWhere(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrdenWhere_condition;
	information = dia_pyrokar_DarkOrdenWhere_info;
	permanent = FALSE;
	description = "Где мне искать эти усыпальницы?";
};

func int dia_pyrokar_DarkOrdenWhere_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (Npc_KnowsInfo(other,DIA_Pyrokar_DarkOrdenKnown) == TRUE) && (KillDeadPalAll == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrdenWhere_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DarkOrdenWhere_01_00");		//Где мне искать эти усыпальницы?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_01");		//Одна из них находится недалеко от фермы Онара.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_02");		//Вторая у развилки, в пещере, что вблизи таверны 'Мертвая Гарпия'.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrdenWhere_01_03");		//Третью ты найдешь рядом с Кругом Солнца, в небольшой лощине.
};

instance DIA_PYROKAR_DarkOrden_SLK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = dia_pyrokar_DarkOrden_SLK_condition;
	information = dia_pyrokar_DarkOrden_SLK_info;
	permanent = FALSE;
	description = "Я побывал во всех трех усыпальницах.";
};

func int dia_pyrokar_DarkOrden_SLK_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (KillDeadPalAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_DarkOrden_SLK_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_00");		//Я побывал во всех трех усыпальницах.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_01");		//И что тебе удалось выяснить?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_02");		//Как и ожидалось, все они просто кишели нежитью. Так что пришлось произвести там небольшую уборку.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_03");		//О Иннос! Значит, твои опасения все-таки подтвердились. А что с самими паладинами?
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_04");		//Надеюсь, что я навсегда упокоил их души. Больше они не побеспокоят жителей этого острова.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_05");		//Да благословит их Иннос. Все-таки при жизни они были достойными людьми!
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_06");		//Однако радоваться нам что пока рано. Недавно я получил сообщение от лорда Хагена.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_07");		//По его словам, город все так же постоянно подвергается атакам со стороны нежити. 
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_08");		//И по всей видимости, ее становится все больше и больше!
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_09");		//Как так? Неужели наш план не сработал?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_10");		//У меня нет ответа на этот вопрос.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_11");		//Но судя по всему, наши действия заставили врага еще с большим усердием обрушить на нас всю свою ярость.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_12");		//Если так пойдет и дальше, то вскоре город падет. А следом за ним и весь остров.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_13");		//Тогда что мы сможем сейчас предпринять?
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_14");		//(подавленно) Мне кажется, что мы действовали в правильном направлении. Однако, все-таки что-то упустили.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_15");		//Нечто такое, что смогло скрыться от наших глаз, не дав нам до конца разобраться в сложившейся ситуации.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_16");		//Так что единственное, что мне сейчас приходит в голову, так это отправиться в город и поговорить с самим лордом Хагеном.
	AI_Output(self,other,"DIA_Pyrokar_DarkOrden_SLK_01_17");		//Все-таки он является главой ордена паладинов! И наверняка сможет больше рассказать нам о тех людях.
	AI_Output(other,self,"DIA_Pyrokar_DarkOrden_SLK_01_18");		//Хорошо, я немедленно отправляюсь к нему.
	DO_SendToHagen = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Я сообщил Пирокару об очищении гробниц от нежити и упокоении душ проклятых паладинов. Но атаки нежити на этом не прекратились. Такое чувство, что мы ранили зверя, и сейчас он крайне опасен в своей агонии. Мне надо поговорить о тех паладинах с лордом Хагеном - возможно, он знает о них что-то, чего не знаем мы.");
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(skeleton_warrior,"FP_CAMPFIRE_NW_ATC_ORC_50");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_NW_ATC_ORC_177");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_NW_ATC_ORC_176");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_178");
		Wld_InsertNpc(Zombie02,"FP_ROAM_NW_ATC_ORC_179");
		Wld_InsertNpc(skeleton_warrior,"NW_CITY_CONNECT_FOREST");
		Wld_InsertNpc(skeleton_warrior_dark,"FP_CAMPFIRE_NW_ATC_ORC_124");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_101");
		Wld_InsertNpc(skeleton_warrior,"FP_ROAM_NW_ATC_ORC_102");
		Wld_InsertNpc(skeleton_dark,"FP_ROAM_NW_ATC_ORC_104");
		Wld_InsertNpc(Skeleton_Shadow_Priest,"NW_FARM1_CONNECT_CITY");
	};

	Wld_InsertNpc(KDW_1406_Mitras,"NW_MITRAS_JARCURSE");
	B_StartOtherRoutine(KDW_140300_Addon_Myxir_CITY,"JarCurse");
};

instance DIA_Pyrokar_MAXROBE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_condition;
	information = DIA_Pyrokar_MAXROBE_info;
	permanent = FALSE;
	description = "Как насчет робы получше?";
};

func int DIA_Pyrokar_MAXROBE_condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDF == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAXROBE_01_00");	//Как насчет робы получше?
	AI_Output(self,other,"DIA_Pyrokar_MAXROBE_01_01");	//Поскольку ты владеешь всеми шестью Кругами магии, ты достоин носить робу архимага Огня!
	AI_Output(self,other,"DIA_Pyrokar_MAXROBE_01_02");	//Однако тебе придется за нее заплатить. Ее изготовление обходится нам недешево, поэтому мы не можем отдать ее даром.
	LastRobeKDF = TRUE;
};

instance DIA_Pyrokar_MAXROBE_Buy(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_MAXROBE_Buy_condition;
	information = DIA_Pyrokar_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Продай мне робу архимага Огня. (Цена: 25000 монет)";
};

func int DIA_Pyrokar_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDF) && (LastRobeKDF == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAXROBE_Buy_01_00");	//Продай мне робу архимага Огня.

	if(Npc_HasItems(hero,ItMi_Gold) >= 25000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,25000);
		Npc_RemoveInvItems(self,ItMi_Gold,25000);
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_01");	//Хорошо. Вот, держи ее.
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_02");	//Это огромная честь носить подобное одеяние. Помни об этом.
		CreateInvItems(self,itar_kdf_sh,1);
		B_GiveInvItems(self,other,itar_kdf_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_MAXROBE_Buy_01_03");	//Извини, но у тебя недостаточно для этого золота.
	};
};
	
instance DIA_Pyrokar_Fregarah(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Condition;
	information = DIA_Pyrokar_Fregarah_Info;
	permanent = FALSE;
	description = "У меня есть один вопрос.";
};

func int DIA_Pyrokar_Fregarah_Condition()
{
	if(MIS_XRANFREG == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_00");	//У меня есть один вопрос.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_01");	//Спрашивай.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_02");	//В библиотеке монастыря мной была обнаружена запись об экспедиции в горы Хориниса.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_03");	//И как я понял, несколько магов Огня, в том числе и ты, принимали в ней участие.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_04");	//Да, ты прав. Эта экспедиция состоялась по решению Высшего Совета магов Огня.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_05");	//Нам предстояло выяснить, насколько эта местность была богата залежами магической руды.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_06");	//А также немного обрисовать общую картину тех земель, доселе нам неизвестных.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_07");	//В записях было сказано, что вы нашли какой-то древний храм, который охранял каменный голем.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_08");	//Это был не просто голем, а настоящий оживший скальный утес!
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_09");	//Который, ко всему прочему, обладал еще и невероятной силой.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_10");	//Паладины, сопровождавшие меня и других магов Огня, пытались остановить его. 
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_11");	//Но тому хватило лишь одного удара, чтобы отправить большинство из них в царство Инноса.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_01_12");	//И что же было дальше?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_13");	//Лишь чудо тогда спасло нас от гибели! Я вовремя успел прочитать заклинание телепортации, которое перенесло нас обратно в Хоринис. 
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_14");	//С тех пор об этом инциденте мы больше не вспоминаем.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_01_15");	//Правда, образ того каменного великана у меня до сих пор в голове!
	B_LogEntry(TOPIC_XRANFREG,"Пирокар рассказал мне об экспедиции и каменном исполине. По его словам, тот был невероятных размеров и обладал громаднейшей силой.");
};
	
instance DIA_Pyrokar_Fregarah_Mage(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_Fregarah_Mage_Condition;
	information = DIA_Pyrokar_Fregarah_Mage_Info;
	permanent = FALSE;
	description = "Кто еще из магов знал об этой экспедиции?";
};

func int DIA_Pyrokar_Fregarah_Mage_Condition()
{
	if((MIS_XRANFREG == LOG_Running) && (Npc_KnowsInfo(other,DIA_Pyrokar_Fregarah) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Mage_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Mage_01_00");	//Кто еще из магов знает об этой экспедиции?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_01");	//Их не так уж и много. Корристо, Дамарок, Драго и этот отступник Ксардас!
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_02");	//Но большинство из них оказались запертыми в Долине Рудников после сотворения магического барьера.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Mage_01_03");	//Так что из ныне живущих только я один знаю, что случилось в тот день.
	B_LogEntry(TOPIC_XRANFREG,"Из слов Пирокара я сделал вывод, что из ныне живущих лишь он и Ксардас были в курсе произошедшего тогда.");
	XRANFREGXAR = TRUE;

	if((Kapitel >= 5) && (XarGiveFirstTome == FALSE))
	{
		Wld_InsertItem(ItWr_Fregarah,"FP_ITEM_XARDAS_07");
		Wld_InsertItem(itke_xardasowt,"FP_ITEM_XARDAS_05");
	};
};

var int PyrokarRuneDay;
var int PyrokarRuneDo;
	
instance DIA_Pyrokar_Fregarah_Know(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_Know_Condition;
	information = DIA_Pyrokar_Fregarah_Know_Info;
	permanent = FALSE;
	description = "Насчет того каменного голема.";
};

func int DIA_Pyrokar_Fregarah_Know_Condition()
{
	if((MIS_XRANFREG == LOG_Running) && (StonnosHrAll == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_00");	//Насчет того каменного голема.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_01");	//Я узнал, что это было за создание и откуда оно взялось.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_02");	//Ты и вправду узнал обо всем? Но как?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_03");	//Это долго объяснять. Просто поверь мне на слово.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_04");	//Так вот, то существо имеет под собой божественное происхождение.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_05");	//А источник его силы - всего лишь обыкновенная магическая руда.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_06");	//О Иннос...(замявшись) А ты ведь прав!
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_07");	//Насколько я помню, все его основание действительно было покрыто породой, очень сильно напоминавшей эту руду.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_08");	//Мы тогда не придали этому особого значения, но теперь мне все становится ясно.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_09");	//Ясно и то, что у вас тогда не было ни единого шанса противостоять ему.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_10");	//Только огромнейший поток магической энергии, обладающей теми же свойствами, способен причинить ему вред.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_11");	//Ты имеешь в виду магию, содержащуюся в самой руде?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_12");	//Абсолютно верно. Только ее должно быть очень много. Но и это еще не все...
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_13");	//Остается главный вопрос - какой предмет способен вобрать в себя такое огромное количество магической энергии?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_14");	//Только магическая руна...(уверенно) И только она.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_15");	//А что насчет оружия?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_16");	//Я не уверен в том, что на свете существует подобное оружие.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_17");	//Но, даже если оно и существует, то ему все равно придется использовать руну в качестве емкости для хранения магической энергии. 
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_18");	//Без нее мечу просто негде будет ее хранить.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_19");	//А ты можешь для меня сделать такую руну?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_20");	//Так ты что, всерьез вознамерился потягаться силами с тем каменным великаном?
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_21");	//Возможно.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_22");	//Но это же чистой воды безумие!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_23");	//Так сделаешь для меня эту руну или нет?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_24");	//Ладно, дело твое...(качая головой) Конечно сделаю! И скажу даже больше.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_25");	//Тебе ведь понадобится не только руна, но и свиток с заклинанием переноса энергии.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_26");	//Я сделаю тебе руну, способную самостоятельно поглощать ее.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_27");	//Главное, находиться поблизости от самого источника магии!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_28");	//Отлично. А сколько времени займет ее изготовление?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_29");	//Полагаю, что к завтрашнему утру она будет уже готова.
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_Know_01_30");	//Хорошо, тогда я загляну к тебе завтра.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_Know_01_31");	//Как скажешь, сын мой.
	B_LogEntry(TOPIC_XRANFREG,"Я рассказал Пирокару обо всем, что мне удалось узнать о каменном големе. Он пообещал мне сделать руну, способную вобрать в себя огромное количество магической энергии и с помощью которой я смогу сразить то создание, - если, конечно, мне представится шанс его встретить.");
	PyrokarRuneDay = Wld_GetDay();
	PyrokarRuneDo = TRUE;
};

instance DIA_Pyrokar_Fregarah_RuneDo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_Fregarah_RuneDo_Condition;
	information = DIA_Pyrokar_Fregarah_RuneDo_Info;
	permanent = FALSE;
	description = "Как поживает моя руна?";
};

func int DIA_Pyrokar_Fregarah_RuneDo_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_XRANFREG == LOG_Running) && (PyrokarRuneDo == TRUE) && (PyrokarRuneDay <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Fregarah_RuneDo_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_RuneDo_01_00");	//Как поживает моя руна?
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_01");	//Она готова. Вот, возьми ее.
	B_GiveInvItems(self,other,ItMi_PyroRune,1);
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_02");	//Однако я все-таки хочу остановить тебя, пока еще не поздно.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_03");	//Встреча с этим созданием может стоить тебе жизни!
	AI_Output(other,self,"DIA_Pyrokar_Fregarah_RuneDo_01_04");	//Я подумаю над твоими словами. И, конечно, спасибо за руну.
	AI_Output(self,other,"DIA_Pyrokar_Fregarah_RuneDo_01_05");	//(вздыхая) Не за что, сын мой...
	B_LogEntry(TOPIC_XRANFREG,"Пирокар отдал мне руну. Осталось найти огромную гору магической руды и использовать рядом с ней этот камень, чтобы поглотить ее энергию. Что-то мне подсказывает, что придется найти и не одну такую гору...");
};