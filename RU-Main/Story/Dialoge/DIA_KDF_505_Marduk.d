
instance DIA_Marduk_Kap1_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_NoEnter_PissOff(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = DIA_Marduk_NoEnter_PissOff_Condition;
	information = DIA_Marduk_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Marduk_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Marduk_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Marduk_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Marduk_JOB(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_JOB_Condition;
	information = DIA_Marduk_JOB_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};

func int DIA_Marduk_JOB_Condition()
{
	return TRUE;
};

func void DIA_Marduk_JOB_Info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Я готовлю паладинов к сражению против Зла.
};


instance DIA_Marduk_Arbeit(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Arbeit_Condition;
	information = DIA_Marduk_Arbeit_Info;
	permanent = FALSE;
	description = "Могу я сделать что-нибудь для тебя, мастер?";
};


func int DIA_Marduk_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Могу я сделать что-нибудь для тебя, мастер?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Для меня? Нет, мне не нужна твоя помощь. Лучше помолись за воинов Инноса, отправившихся в Долину Рудников.
	MIS_MardukBeten = LOG_Running;
	B_StartOtherRoutine(Sergio,"WAIT");
	Log_CreateTopic(Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus(Topic_MardukBeten,LOG_Running);
	B_LogEntry(Topic_MardukBeten,"У мастера Мардука нет заданий для меня. Он сказал, что мне лучше пойти помолиться за паладинов.");
};


instance DIA_Marduk_Gebetet(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Gebetet_Condition;
	information = DIA_Marduk_Gebetet_Info;
	permanent = FALSE;
	description = "Я помолился за паладинов.";
};


func int DIA_Marduk_Gebetet_Condition()
{
	if((MIS_MardukBeten == LOG_Running) && Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Gebetet_Info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Я помолился за паладинов.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//Это хорошо. А теперь возвращайся к своей работе.
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP(XP_MardukBeten);
	B_StartOtherRoutine(Sergio,"START");
};


instance DIA_Marduk_Evil(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Evil_Condition;
	information = DIA_Marduk_Evil_Info;
	permanent = TRUE;
	description = "Что такое 'Зло'?";
};


func int DIA_Marduk_Evil_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Evil_Info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Что такое 'Зло'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Зло повсюду. Оно порождение Белиара, извечного противника Инноса.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//Это всепоглощающая тьма, которая пытается навсегда закрыть от нас Свет Инноса.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Белиар - Повелитель Тьмы, Ненависти и Разрушений.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Только те из нас, чьи сердца горят Святым Огнем Инноса, несут сияющий Свет Инноса в наш мир и изгоняют тьму.
};


instance DIA_Marduk_Pal(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Pal_Condition;
	information = DIA_Marduk_Pal_Info;
	permanent = FALSE;
	description = "Но в монастыре живут только маги и послушники?";
};


func int DIA_Marduk_Pal_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Pal_Info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Но в монастыре живут только маги и послушники?
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Правильно! В отличие от нашей общины, которая чтит слово Инноса...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...паладины чтят, превыше всего, дела нашего Владыки.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//Мы все - представители Инноса. Но паладины его воины, идущие в бой с его именем на устах, и прославляя его величие.
};


instance DIA_Marduk_Kap2_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_Hello(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 30;
	condition = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marduk_Kap3_Hello_Condition()
{
	if((Kapitel == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Добро пожаловать, сын мой.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//С каких это пор ты стал паладином?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Откуда ты пришел?
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
	Info_AddChoice(DIA_Marduk_Kap3_Hello,"Это не твое дело.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"Недавно.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"Я пришел с фермы.",DIA_Marduk_Kap3_Hello_DJG);
	};
};

func void DIA_Marduk_Kap3_Hello_NotYourConcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//Это не твое дело.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(ворчливо) Паладин всегда должен быть вежливым и скромным. Ты должен защищать тех, кто не может защитить себя сам.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(ворчливо) Это привилегия, и ты должен быть благодарен, что Иннос дает тебе такую возможность. Подумай об этом!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(зло) Эх, раньше всякий сброд не пускали в монастырь. Твое поведение доказывает, что это были хорошие времена.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(предупреждающе) Я предупреждаю тебя, не стоит сеять тут смуту - ты будешь немедленно наказан. Мы не будем проявлять фальшивое великодушие.
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_Soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Совсем недавно.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//Тогда добро пожаловать. В этой битве нам нужны все, у кого есть мужество противостоять злу.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Судьба всех нас лежит в руках людей вроде тебя. Да придаст тебе Иннос так необходимое тебе мужество.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_DJG()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Я пришел с фермы.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//Тогда добро пожаловать во имя гостеприимства. Надеюсь, ты оценишь его.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Но не забывай, что ты в гостях, иначе у тебя будут большие проблемы.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};


instance DIA_Marduk_TrainPals(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 32;
	condition = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};


var int Marduk_TrainPals_permanent;

func int DIA_Marduk_TrainPals_Condition()
{
	if((hero.guild == GIL_PAL) && (Marduk_TrainPals_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TrainPals_Info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Чему ты можешь обучить меня?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Естественно, я не могу обучить тебя боевым искусствам.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Но я могу, впрочем, донести сущность Инноса и его дары до тебя.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Кроме того, я мои обязанности входит подготовить тебя к Освящению Меча.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//А магии?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Здесь мы учим только нашей магии. Ты должен изучать магию паладинов в городе.
	Info_ClearChoices(DIA_Marduk_TrainPals);
	Info_AddChoice(DIA_Marduk_TrainPals,"Может быть, позже.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice(DIA_Marduk_TrainPals,"Что ты хочешь этим сказать?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice(DIA_Marduk_TrainPals,"Что такое Освящение Меча?",DIA_Marduk_TrainPals_Blessing);
};

func void DIA_Marduk_TrainPals_Later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Может быть, позже.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Добро пожаловать в любое время.
	Info_ClearChoices(DIA_Marduk_TrainPals);
};

func void DIA_Marduk_TrainPals_Meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Что ты хочешь сказать этим?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Когда Иннос покидал наш мир, он оставил человечеству частицу своей божественной силы.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Только немногим из людей позволено использовать его силу и нести в мир правосудие от его имени.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//А что ты хочешь донести до меня?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Я могу наставить тебя на правильный путь, чтобы ты познал сущность Инноса и следовал по этому пути.
};

func void DIA_Marduk_TrainPals_Blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Что такое Освящение Меча?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Освящение Меча - это один из самых священных ритуалов паладинов.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Во время этой церемонии святая сила Инноса протекает через меч паладина и придает мечу невообразимую силу.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Меч, освященный таким образом, - самое ценное, что есть у паладина, и он не расстается с ним до конца своих дней.
	Marduk_TrainPals_permanent = TRUE;
};


instance DIA_Marduk_SwordBlessing(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 33;
	condition = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent = TRUE;
	description = "Я хочу освятить мой меч.";
};


func int DIA_Marduk_SwordBlessing_Condition()
{
	if(Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Marduk_SwordBlessing_Info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Я хочу освятить мой меч.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Если ты твердо решил сделать этот шаг, тебе сначала нужно найти магический меч.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//Затем ты должен вернуться в эту часовню и молиться.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Во время молитвы и после разумного пожертвования нашему Владыке Инносу ты должен попросить у Инноса благоволения и помощи в битве против Зла.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Если Иннос будет благосклонен к тебе, твой меч в тот же момент будет освящен нашим Владыкой.
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
	Info_AddChoice(DIA_Marduk_SwordBlessing,Dialog_Back,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"Что за пожертвование?",DIA_Marduk_SwordBlessing_Donation);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"Где мне найти магический меч?",DIA_Marduk_SwordBlessing_OreBlade);
};

func void DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
};

func void DIA_Marduk_SwordBlessing_Donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Что за пожертвование?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Ну, учитывая милость, что будет оказана тебе, суммы в пять тысяч монет будет более чем достаточно.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Конечно, ты можешь пожертвовать больше.
};

func void DIA_Marduk_SwordBlessing_OreBlade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Где мне найти магический меч?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Попробуй поговорить в городе с кузнецом Харадом.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Он обеспечивает паладинов магическими клинками, пока они находятся на острове.
	if(Npc_IsDead(Harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Харад мертв.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//Мне очень жаль, но тогда тебе придется ждать возвращения на материк вместе с другими паладинами.
	};
};


instance DIA_Marduk_Kap3_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 39;
	condition = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Marduk_Kap3_PERM_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Есть новости?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Да, врагу удалось внедрить предателя в наши ряды.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Он украл Глаз Инноса, один из самых важных наших артефактов. И это только вершина айсберга.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(озабоченно) Враг, по-видимому, уже вошел в город.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Чт ты имеешь в виду?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Один из паладинов, Лотар, был убит на улице.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(зло) Прямо средь бела дня! Это зашло слишком далеко, но я боюсь, что это только начало.
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,Dialog_Back,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,"Что будет теперь?",DIA_Marduk_Kap3_PERM_AndNow);
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Беннет не виновен.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}
	else
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Убийца был пойман?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Куда побежал вор?",DIA_Marduk_Kap3_PERM_thief);
	};
};

func void DIA_Marduk_Kap3_PERM_BAck()
{
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
};

func void DIA_Marduk_Kap3_PERM_AndNow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Что будет теперь?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Мы будем преследовать вора, куда бы он не побежал. Мы найдем его, и он понесет заслуженное наказание.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Для этого сначала нужно знать, кто этот вор.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Мы скоро выясним это. И не важно, сколько времени на это понадобится, но мы найдем его.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//Клянусь Инносом.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Убийство, а тем более паладина, несомненно, одно из самых тяжелых преступлений.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Убийца наверняка будет приговорен к смерти.
	};
};

func void DIA_Marduk_Kap3_PERM_BennetisNotGuilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Беннет не виновен. Свидетель солгал.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Откуда ты это знаешь?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Я нашел доказательства.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Иногда мне кажется, что предательство и жадность - наши самые величайшие враги.
};

func void DIA_Marduk_Kap3_PERM_Murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Убийца был пойман?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//По счастью, да. Им оказался один из головорезов с фермы Онара.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Кто?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Я не знаю его имени. Но среди наемников, определенно, есть личности, от которых можно ожидать подобного.
};

func void DIA_Marduk_Kap3_PERM_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Куда побежал вор?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//Я не знаю, он выбежал из ворот как одержимый и исчез.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Не важно, где он скрывается, под каким камнем он спрятался, гнев Инноса поразит его и выжжет его черное сердце.
};


instance DIA_Marduk_Kap4_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap4U5_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Marduk_Kap4U5_PERM_Condition()
{
	if((Kapitel == 4) || (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Есть новости?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Нет, о, боже, ситуация все еще очень критическая.
};


instance DIA_Marduk_Kap5_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_PICKPOCKET(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 900;
	condition = DIA_Marduk_PICKPOCKET_Condition;
	information = DIA_Marduk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Marduk_PICKPOCKET_Condition()
{
	return C_Beklauen(36,40);
};

func void DIA_Marduk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,Dialog_Back,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};


instance DIA_MARDUK_CANTEACHARMOR(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_canteacharmor_condition;
	information = dia_marduk_canteacharmor_info;
	permanent = TRUE;
	description = "(спросить о рудных доспехах)";
};


func int dia_marduk_canteacharmor_condition()
{
	if((MARDUK_CANTEACHARMOR == FALSE) && ((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_marduk_canteacharmor_info()
{
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_00");	//Я слышал, что маги Огня обладают знаниями, способными придать рудным доспехам паладина божественную сущность.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_01");	//А от кого ты услышал это, сын мой?
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_02");	//Кузнец Харад рассказал мне об этом.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_03");	//Если бы ты не был паладином, то, скорее всего, я бы не открыл тебе эту священную тайну.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_04");	//Но ты являешься Воином Инноса...
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_05");	//Овладев этими знаниями, ты обретешь самый дорогой дар Инноса.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_07");	//Суть этого знания заключается в освящении рудных доспехов паладина через священную молитву Избранного Инносу.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_08");	//Освящение доспехов - самый священный ритуал для паладина. И только избранные могут осуществить его.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_10");	//Во время этой церемонии священная сила и мудрость Инноса протекает через доспехи, наполняя их магической силой.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_12");	//После этого ты уже просто так не сможешь снять эти доспехи и надеть другие, ибо тогда тебя постигнет смерть!
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_15");	//А что надо сделать, чтобы стать Избранным Инноса?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_16");	//Иннос сам решает, кто достоин его дара, а кто нет.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_17");	//А что необходимо для этого ритуала?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_19");	//Для начала тебе нужны рудные доспехи паладина - не имеет значение, какие.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_20");	//Затем тебе следует прийти с ними в часовню для молитвы, перед этим изучив молитву Избранного.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_21");	//Во время молитвы и после подношения нашему господину ты должен попросить Инноса о его милости и предводительстве в битве со злом.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_22");	//Если Иннос решит, что ты достоин его дара, то он сниспошлет свою божественную благодать на тебя и освятит твои доспехи.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_24");	//А что мне делать, если Иннос сочтет, что я не достоин этого дара?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_25");	//Проводи в молитвах Инносу все свое время, и, может быть, однажды он услышит твои мольбы.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_26");	//Где мне найти слова молитвы Избранного, мастер?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_27");	//Тебе не надо их искать. Я дам тебе книгу, в которой все они записаны. Просто прочитай ее и запомни слова молитвы.
	B_GiveInvItems(self,other,itwr_innospray,1);
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_29");	//Спасибо, мастер.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_30");	//Какое подношение я должен пожертвовать Инносу?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_31");	//Думаю, определенной суммы золота будет вполне достаточно. Правда, я не могу тебе сказать, сколько именно. Это решает сам Иннос.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_33");	//Это все, что ты должен знать об этом священном ритуале. Теперь ступай, сын мой.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_34");	//Да не оставит тебя Иннос без своей милости!
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_MAGICINNOSARMOR,"Маг Огня Мардук рассказал мне о священном ритуале освящения рудных доспехов паладина и сказал, что необходимо сделать, чтобы осуществить его.");
	MARDUK_CANTEACHARMOR = TRUE;
};


instance DIA_MARDUK_TELLSERGIO(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_tellsergio_condition;
	information = dia_marduk_tellsergio_info;
	permanent = FALSE;
	description = "Где паладин Сержио?";
};


func int dia_marduk_tellsergio_condition()
{
	if((MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_tellsergio_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Marduk_TellSergio_01_00");	//Где паладин Сержио?
	AI_Output(self,other,"DIA_Marduk_TellSergio_01_01");	//Здесь ты его не найдешь, сын мой. Недавно он решил покинуть наш монастырь.
	B_LogEntry(TOPIC_FARIONTEST,"Недавно паладин Сержио покинул монастырь, уйдя в неизвестном направлении.");
};


instance DIA_MARDUK_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_runemagicnotwork_condition;
	information = dia_marduk_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_marduk_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Marduk_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Marduk_RuneMagicNotWork_01_01");	//В том-то и дело, что нет! И я никак не пойму причину, по которой не могу их использовать.
	AI_Output(self,other,"DIA_Marduk_RuneMagicNotWork_01_03");	//По всей видимости, это коснулось нас всех. У других магов Огня тоже ничего не получается сделать.
	AI_Output(other,self,"DIA_Marduk_RuneMagicNotWork_01_04");	//Понятно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_MARDUK_TREVIUS(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius_condition;
	information = dia_marduk_trevius_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (COUNT_TREVIUS_DIALOG == TRUE))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius_info()
{
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_00");	//Так это ты ищешь документы Ксардаса?
	AI_Output(other,self,"DIA_Marduk_TREVIUS_01_01");	//Ну, вообще-то, да. Неужели ты хочешь мне что-то рассказать? 
	AI_Output(other,self,"DIA_Marduk_TREVIUS_01_02");	//Предыдущие мои собеседники едва не сожгли меня одним своим взглядом при упоминании о Ксардасе.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_03");	//У нас не принято говорить о таких вещах...
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_04");	//Тем более с темными магами и их подручными.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_05");	//Но этот случай совершенно особенный. Пропал наш брат Тревиус.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_06");	//Он и занимался изучением формул, оставленных Ксардасом в стенах монастыря.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_07");	//Его уже долго нет, и я боюсь, что живым нам его уже не увидеть. Найдя его, ты найдешь и свои рукописи.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_08");	//И пожалуйста, сообщи мне, что стало с Тревиусом! Все, ступай.
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Итак, среди этих высокомерных магов все-таки нашелся здравомыслящий человек. Мардук рассказал мне, что рукописи Ксардаса я найду у мага по имени Тревиус. Однако, тот куда-то пропал.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(KDF_512_Trevius,"NW_FARM2_TAVERNCAVE1_02");
	B_KillNpc(KDF_512_Trevius);
	Wld_InsertNpc(Demon,"NW_FARM2_TAVERNCAVE1_02");
};

instance DIA_MARDUK_TREVIUS1(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius1_condition;
	information = dia_marduk_trevius1_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius1_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_SUCCESS) || (Npc_HasItems(hero,itwr_xardasdocs_3) >= 1))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius1_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_00");	//Ты что-то узнал о Тревиусе?
	AI_Output(other,self,"DIA_Marduk_TREVIUS1_01_01");	//Да, он мертв. Я нашел его недалеко от странных камней в западном лесу.
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_02");	//Вот как. Да хранит Иннос его душу!
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_03");	//Спасибо, что зашел. Хотя ты и темный маг, я не могу отделаться от ощущения, что ты пришел творить добро в этом мире.
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_04");	//Возьми свою награду и ступай.
	B_GiveInvItems(self,hero,ItPo_Mana_03,1);
	AI_StopProcessInfos(self);
};

instance DIA_MARDUK_LORDS_HORINIS(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_lords_horinis_condition;
	information = dia_marduk_lords_horinis_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_lords_horinis_condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_lords_horinis_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_01");	//Брат, я чувствую, что силам зла нанесен огромный урон!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_02");	//Все выглядит так, как будто некий отважный воин отправил в царство Белиара несколько ужасных и опаснейших созданий.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_03");	//Это большая победа, и меня переполняет радость, когда я думаю об этом.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_04");	//Ты, случайно, не знаешь что-нибудь об этом?
	Info_ClearChoices(dia_marduk_lords_horinis);
	Info_AddChoice(dia_marduk_lords_horinis,"Так это же моих рук дело!",dia_marduk_lords_horinis_yes);
	Info_AddChoice(dia_marduk_lords_horinis,"Понятия не имею.",dia_marduk_lords_horinis_no);
};

func void dia_marduk_lords_horinis_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_05");	//Так это же моих рук дело!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_06");	//Правда? Что ж, похоже, мне ничего не остается, как только наградить тебя за эту работу.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_07");	//Возьми это золото в знак признательности.
	B_GiveInvItems(self,hero,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_08");	//Это же огромная сумма!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_09");	//Ты ее заслужил. Ступай брат, и да пребудет с тобой Иннос во всех твоих начинаниях.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};

func void dia_marduk_lords_horinis_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_10");	//Понятия не имею.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_11");	//Правда? Но у меня есть стойкое ощущение, что это именно твоя заслуга.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_12");	//Не скромничай, ведь это ты сотворил нечто невероятное во славу Инноса и Святого Огня?
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_13");	//Ну ладно, тебя не проведешь.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_14");	//Я знал! Спасибо огромное, брат. Ты сделал большое дело для всего острова. Получи и свою награду, ты это заслужил.

	if((hero.guild == GIL_KDF) && (hero.guild == GIL_KDW) && (hero.guild == GIL_KDM) && (hero.guild == GIL_GUR))
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Mana,1);
	}
	else
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Health,1);
	};

	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};