
instance DIA_STRF_8119_Addon_Rollan_EXIT(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 999;
	condition = DIA_STRF_8119_Addon_Rollan_exit_condition;
	information = DIA_STRF_8119_Addon_Rollan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8119_Addon_Rollan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8119_Addon_Rollan_HELLO(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_hello_condition;
	information = DIA_STRF_8119_Addon_Rollan_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8119_Addon_Rollan_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_hello_info()
{
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_00");	//Хммм...(удивленно)
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_01");	//Что?!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_02");	//Тут нечасто можно встретить человека, спокойно разгуливающего по шахте.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_03");	//Интересно, как тебя орки вообще впустили сюда. Или ты что, работаешь на них?!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_04");	//Нет, я тут сам по себе.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_05");	//Ну тогда ты точно псих, раз под доброй воле приперся в эту дыру!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_06");	//Тут же ничего нет, приятель! Ничего, кроме смерти...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_07");	//Кстати, что же тебя все-таки привело сюда?
};

instance DIA_STRF_8119_Addon_Rollan_Who(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Who_condition;
	information = DIA_STRF_8119_Addon_Rollan_Who_info;
	permanent = FALSE;
	description = "Я ищу тут одного паладина.";
};

func int DIA_STRF_8119_Addon_Rollan_Who_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_Who_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Who_01_00");	//Я ищу тут одного паладина.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_01");	//(удивленно) Паладина?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_02");	//На твоем месте, я был бы тут поосторожнее с такими словами!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_03");	//Если орки тебя услышат, то особо церемониться не будут.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_04");	//Они ребята серьезные! Чуть что не так, сразу начинают махать своими топорами.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_05");	//В лучшем случае для тебя это все закончится парой сломанных ребер.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_06");	//Ну, а если ты очень сильно разозлишь орков, то они тебя отправят на нижний уровень шахты. 
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_07");	//А это верная смерть! Оттуда живым еще никто не возвращался...
};

instance DIA_STRF_8119_Addon_Rollan_Time(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Time_condition;
	information = DIA_STRF_8119_Addon_Rollan_Time_info;
	permanent = FALSE;
	description = "Ты уже давно работаешь в шахте?";
};

func int DIA_STRF_8119_Addon_Rollan_Time_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Time_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Time_01_00");	//Ты уже давно работаешь в шахте?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_01");	//Трудно сказать...(чешет затылок) По правде говоря, я уже и сам сбился со счету.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_02");	//Тут время летит совсем по-другому, нежели чем там, на поверхности!
};

instance DIA_STRF_8119_Addon_Rollan_LowLevel(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_LowLevel_condition;
	information = DIA_STRF_8119_Addon_Rollan_LowLevel_info;
	permanent = FALSE;
	description = "Что еще за нижний уровень шахты?";
};

func int DIA_STRF_8119_Addon_Rollan_LowLevel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_LowLevel_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_00");	//Что еще за нижний уровень шахты?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_01");	//(испуганно) Да не кричи ты так! Иначе точно беду накличешь.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_02");	//Насколько мне известно, нижний уровень шахты закрыли сами орки. 
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_03");	//Там уже давно никто не работает.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_04");	//Но всех провинившихся они отправляют именно туда, опуская на подъемнике.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_05");	//А когда подъемник поднимается обратно, то там уже никого нет.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_06");	//Только лужи крови! Бррр...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_07");	//Слушай, давай лучше сменим тему, а то мне уже стало как-то не по себе.
};

instance DIA_STRF_8119_Addon_Rollan_TellMore(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_TellMore_condition;
	information = DIA_STRF_8119_Addon_Rollan_TellMore_info;
	permanent = FALSE;
	description = "Ты можешь рассказать мне больше о шахте?";
};

func int DIA_STRF_8119_Addon_Rollan_TellMore_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_LowLevel) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_TellMore_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_00");	//Ты можешь рассказать мне больше о шахте?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_01");	//Конечно. Но для начала, принеси мне что-нибудь поесть.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_02");	//А то я уже почти забыл вкус нормальной еды.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_03");	//Орки нас тут особо не балуют. Вот считай, одними грибами и спасаемся!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_04");	//Что тебе нужно?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_05");	//(мечтательно) Я бы не отказался от... хорошо прожаренного куска мяса, сыра, ну и бутылки вина!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_06");	//Полагаю, что для начала этого хватит. Устрою себе настоящий пир!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_07");	//Ладно, попробую найти все это для тебя.
	MIS_RollanFood = LOG_Running;
	Log_CreateTopic(TOPIC_RollanFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Running);
	B_LogEntry(TOPIC_RollanFood,"Рудокоп Роллан хочет есть. Если я принесу ему кусок жареного мяса, сыр и бутылку вина, он расскажет мне больше о шахте.");
};

instance DIA_STRF_8119_Addon_Rollan_RollanFood(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_RollanFood_condition;
	information = DIA_STRF_8119_Addon_Rollan_RollanFood_info;
	permanent = FALSE;
	description = "Я принес тебе еды.";
};

func int DIA_STRF_8119_Addon_Rollan_RollanFood_condition()
{
	if((MIS_RollanFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_RollanFood_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_00");	//Я принес тебе еды.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_01");	//Отлично...(довольно) Тут все, как я и просил?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_02");	//Конечно. Вот тебе кусок мяса, сыр и бутылка вина.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Cheese,1);
	Npc_RemoveInvItems(other,ItFo_Wine,1);
	CreateInvItems(self,ItFoMutton,1);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_03");	//Ну, наконец-то я поем по-человечески...
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_04");	//Мммм...(довольно) Как вкусно! После тех чертовых грибов это мясо мне кажется просто пищей богов!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_05");	//Спасибо тебе, приятель.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_06");	//Наслаждайся!
	RT_Respect = RT_Respect + 1;
	MIS_RollanFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Success);
	B_LogEntry(TOPIC_RollanFood,"Я принес Роллану еды. Он радовался ей как ребенок!");
};

instance DIA_STRF_8119_Addon_Rollan_Perm(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Perm_condition;
	information = DIA_STRF_8119_Addon_Rollan_Perm_info;
	permanent = TRUE;
	description = "Ну, как дела в шахте?";
};

func int DIA_STRF_8119_Addon_Rollan_Perm_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Perm_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Perm_01_00");	//Ну, как дела в шахте?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Perm_01_01");	//Пока все без изменений.
};

var int CountMineAll;
var int RolTellChief;
var int RolTellHowMany;
var int RolTellSlaves;
var int RolTellPal;

instance DIA_STRF_8119_Addon_Rollan_AboutMine(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_AboutMine_condition;
	information = DIA_STRF_8119_Addon_Rollan_AboutMine_info;
	permanent = TRUE;
	description = "Расскажи мне больше о шахте.";
};

func int DIA_STRF_8119_Addon_Rollan_AboutMine_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_00");	//Расскажи мне больше о шахте.

	if(CountMineAll == FALSE)
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_01");	//А что ты хочешь узнать?
		Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
		Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,Dialog_Back,DIA_STRF_8119_Addon_Rollan_AboutMine_Back);

		
		if(RolTellChief == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Кто здесь всем заправляет?",DIA_STRF_8119_Addon_Rollan_AboutMine_Chief);
		};
		if(RolTellHowMany == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Много тут орков?",DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany);
		};
		if(RolTellSlaves == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Много ли тут вас, рабов?",DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves);
		};
		if((MIS_TrustMe == FALSE) && (RolTellPal == FALSE))
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Так что насчет паладина?",DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin);
		};
		if(MIS_LowLevel == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Что там на нижнем уровне шахты?",DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev);
		};
		if(MIS_EscapeMine == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"А вы не пробовали выбраться отсюда?",DIA_STRF_8119_Addon_Rollan_AboutMine_Escape);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_02");	//Все, что знал, я уже тебе рассказал. 
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Back()
{
	Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Chief()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_01");	//Кто здесь всем заправляет?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_02");	//Эта скотина по имени Ар Дагар! Он главный среди орков.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_03");	//Но лучше не попадаться ему на глаза. Он не очень любит людей!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_04");	//Понимаю.
	RolTellChief = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_01");	//Много тут орков?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_02");	//Эх, приятель...(качая головой) Этого добра тут хватает!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_03");	//Я, конечно, сам не считал, но полагаю, что по меньшей мере десятка два.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_04");	//Если не больше...
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_05");	//Ясно.
	RolTellHowMany = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_01");	//Много ли тут вас, рабов?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_02");	//Поговаривают, что раньше было много. Пока орки совсем не озверели.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_03");	//А что случилось?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_04");	//Это все Ар Дагар! Он навел тут такие чудовищные порядки, что многие просто не выдержали.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_05");	//Полагаю, что сейчас нас тут осталось не больше полусотни. А того гляди и меньше.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_06");	//Все ясно.
	RolTellSlaves = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_01");	//Так что насчет паладина?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_02");	//Я тебе так скажу...(задумчиво) Даже если он тут и есть, то тебе об этом все равно никто не расскажет.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_03");	//Это почему?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_04");	//Все просто. Во-первых, ты тут новенький, тебя никто не знает. 
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_05");	//Во вторых, судя по всему, ты ведешь какие-то дела с орками, раз они тебя пустили сюда.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_06");	//А это, сам понимаешь, наводит на определенные мысли.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_07");	//Так что пока большинство из нас не начнет тебе доверять, задавать тут подобные вопросы будет дохлым номером.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_08");	//И как же мне заслужить ваше доверие?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_09");	//Как, как... Походи, поспрашивай парней. Может быть, кому-то из них нужна помощь.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_10");	//Докажи, что ты свой человек и что на тебя можно положиться!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_11");	//Тогда, глядишь, и узнаешь, что тебе нужно. Смекаешь?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_12");	//Да, я тебя понимаю.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_13");	//Ну, вот и славно! Тогда закончим этот разговор.
	RolTellPal = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Пока я не заслужу доверие среди рабов, расспрашивать о паладине будет совершенно бесполезно.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_01");	//Что там, на нижнем уровне шахты?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_02");	//Я практически не отхожу от своей жилы, поэтому мало что смогу рассказать про него.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_03");	//Лучше поговори об этом с Хильдуром. Он точно знает больше об этом!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_04");	//А кто такой Хильдур?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_05");	//Это наш плавильщик руды. Ты найдешь его внизу, недалеко от склада.
	MIS_LowLevel = LOG_Running;
	Log_CreateTopic(TOPIC_LowLevel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Running);
	B_LogEntry(TOPIC_LowLevel,"Роллан обмолвился про нижний уровень шахт, куда отправляют провинившихся перед орками рудокопов. По его словам, это очень страшное место. Хильдур, плавильщик руды, может рассказать о нем больше.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Escape()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_01");	//А вы не пробовали выбраться отсюда?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_02");	//Ты что, шутишь, приятель?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_03");	//Мы даже не успеем дойти до выхода из шахты, как нас всех перебьют орки. 
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_04");	//Особенно те, что с арбалетами. Ты видел, что делает с человеком болт, выпущенный из орочьего арбалета?!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_05");	//Ну...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_06");	//Тебе лучше и не знать...(испугано) Видок, прямо скажу тебе, не из приятных!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_07");	//Ко всему прочему, у нас нет подходящего оружия. Не с голыми же кулаками лезть на их топоры.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_08");	//А никто раньше не пробовал устроить побег?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_09");	//Хммм...(задумчиво) Помнится, кто-то уже пытался устроить подобное. 
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_10");	//Но об этом тебе лучше расскажет Ферд. Он был тогда свидетелем всего этого.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_11");	//Хорошо, поговорю с ним.
	MIS_EscapeMine = LOG_Running;
	Log_CreateTopic(TOPIC_EscapeMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Running);
	B_LogEntry(TOPIC_EscapeMine,"По всей видимости, рабы даже не помышляют о побеге. У них нет ни оружия, ни желания сражаться с элитными орками. По словам Роллана, рудокоп Ферд знает об этом больше.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};