
var int spendeday;
var int DaronBlessMe;
var int Dar_Bonus_1;
var int Dar_Bonus_2;
var int Dar_Bonus_3;
var int Dar_Bonus_4;

func void B_DaronSegen()
{
	var string concatText;
	var int DarBonMana;

	Daron_Segen = TRUE;
	DarBonMana = SBMODE * 2;

	if((Daron_Spende >= 250) && (Dar_Bonus_1 == FALSE))
	{
		B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,DarBonMana);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		Dar_Bonus_1 = TRUE;
	}
	else if((Daron_Spende >= 500) && (Dar_Bonus_1 == TRUE) && (Dar_Bonus_2 == FALSE))
	{
		B_GivePlayerXP(XP_Ambient);
		Dar_Bonus_2 = TRUE;
	}
	else if((Daron_Spende >= 750) && (Dar_Bonus_2 == TRUE) && (Dar_Bonus_3 == FALSE))
	{
		other.lp = other.lp + SBMODE;
		concatText = ConcatStrings(PRINT_LearnLP,IntToString(SBMODE));
		AI_Print(concatText);
		Dar_Bonus_3 = TRUE;
	}
	else if((Daron_Spende >= 1000) && (Dar_Bonus_3 == TRUE) && (Dar_Bonus_4 == FALSE))
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + (SBMODE * 5);
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(SBMODE * 5));
		AI_Print(concatText);
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
		Dar_Bonus_4 = TRUE;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
		};
	};
};

instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Daron_Hallo(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//Что я могу сделать для тебя? Ты ищешь душевного комфорта?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Ты хочешь помолиться нашему владыке Инносу, или, может, хочешь пожертвовать золото его церкви?
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = "Мне нужно поговорить с паладинами.";
};


func int DIA_Daron_Paladine_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//Мне нужно поговорить с паладинами. Ты можешь помочь мне в этом?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Ну, для этого ты должен иметь доступ в верхний квартал города. Однако входить туда позволено только гражданам и городской страже.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//Ну и, конечно же, нам, Магам Огня.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//Как я могу стать Магом Огня?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//Ты должен вступить в наш орден в качестве послушника. А по прошествии некоторого времени, возможно, ты будешь принят в ряды магов.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//Однако этот путь долог, полон тяжелой работы и утомительного обучения.
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = "Я пришел, чтобы получить твое благословение!";
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//Я пришел, чтобы получить твое благословение!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//Это хорошо - тогда ты, вероятно, захочешь пожертвовать золото святой церкви Инноса, правда?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//Вообще-то, я хотел получить твое благословение, чтобы поступить в ученики к одному из мастеров в нижней части города...

	if(Daron_Segen == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//Но я уже дал тебе мое благословение, сын мой.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Ступай с Инносом, сын мой!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//Но, сын мой! Без скромного пожертвования церкви я не считаю для себя возможным благословить тебя.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//Как еще могу я увериться в твоих добрых намерениях по отношению к святой церкви Инноса?
	};
};


instance DIA_Daron_Spenden(C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = "И какое пожертвование обычно считается достаточным?";
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//И какое пожертвование обычно считается достаточным?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//Ну, это зависит от того, чем ты располагаешь. Давай посмотрим, что у тебя есть.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(смотрит в кошелек с деньгами) М-м-м хмм...

	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Хм, ты ведь бедняк, да? Оставь себе то немногое, что у тебя есть.

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben,"Маг огня Дарон не благословил меня. Мне кажется, это означает, что я должен пожертвовать ему немного золота. Без этого он не благословит меня.");
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//Ну, ты не богат, но и не беден. Десять золотых для Инноса - мы живем скромной жизнью.
			B_GiveInvItems(other,self,ItMi_Gold,10);
			Npc_RemoveInvItems(self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//У тебя больше полсотни золотых монет. Пожертвуй двадцать пять монет Инносу и получи мое благословение.
			B_GiveInvItems(other,self,ItMi_Gold,25);
			Npc_RemoveInvItems(self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//У тебя больше ста золотых монет - Владыка говорит: 'Делись, если можешь'.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//Церковь примет твое щедрое подношение.
			B_GiveInvItems(other,self,ItMi_Gold,50);
			Npc_RemoveInvItems(self,ItMi_Gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben,"Маг огня Дарон благословил меня.");
		};
	};
};


instance DIA_Daron_Woher(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Woher_Condition;
	information = DIA_Daron_Woher_Info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int DIA_Daron_Woher_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//Я пришел из монастыря магов, находящегося в горах.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//Мы принимаем к себе всех, кто чист сердцем и ощущает желание служить нашему всемогущему владыке Инносу.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = "Расскажи мне об Инносе.";
};


func int DIA_Daron_Innos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Иннос, наш всемогущий владыка, - наш свет и огонь.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//Он выбирал людей в качестве проводников своей воли на земле. Он дает им магию и законы.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//Мы говорим и действуем от его имени. Мы осуществляем правосудие согласно его воле и проповедуем его слово.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о монастыре.";
};


func int DIA_Daron_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (Npc_KnowsInfo(other,DIA_Daron_Paladine) && (other.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Расскажи мне подробнее о монастыре.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//Мы обучаем наших студентов всем формам магии. Но сила Магов Огня не ограничивается только магией.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//Мы также хорошо разбираемся в искусстве алхимии и создании рун.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//Еще мы делаем превосходное вино.
};


instance DIA_Daron_Stadt(C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = FALSE;
	description = "А что ты делаешь в городе?";
};


func int DIA_Daron_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//А что ты делаешь в городе?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//Я просвещаю паладинов и поддерживаю горожан своими советами и ободряющими словами.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//В эти тяжелые времена наш долг быть среди народа и помогать бедным.
};


instance DIA_Addon_Daron_GuildHelp(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_GuildHelp_Condition;
	information = DIA_Addon_Daron_GuildHelp_Info;
	description = "Я слышал, у вас пропала ценная статуэтка.";
};


func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if((MIS_Addon_Vatras_Go2Daron == LOG_Running) && Npc_KnowsInfo(other,DIA_Daron_Stadt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//Я слышал, у вас пропала ценная статуэтка.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Неужели? Об этом знал только маг воды Ватрас.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//В чем проблема?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//С континента в монастырь была отправлена драгоценная статуэтка. Но до нас она так и не дошла.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Корабль был ограблен?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//Нет. Он в целости и сохранности прибыл в Хоринис. Я встретил его и забрал статуэтку.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Но когда я возвращался в монастырь, на меня напали гоблины и отобрали ее у меня.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(сердито) И не надо на меня так смотреть. Маги, к твоему сведению, тоже люди.
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_Running;
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Значит, сейчас она у гоблинов?",DIA_Addon_Daron_GuildHelp_gobbos);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Где именно ты потерял статуэтку?",DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Ты не пытался вернуть статуэтку?",DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Ты не пытался вернуть статуэтку?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Конечно, пытался! Я везде ее искал. Но увы, безрезультатно.
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//Значит, сейчас она у гоблинов?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//Когда она оказалась у них в руках, они скрылись в кустарнике.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//Больше я их не видел. Наверное, они живут в какой-нибудь пещере.
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Где именно ты потерял статуэтку?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//На пути в монастырь, неподалеку от таверны Орлана.
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Я услышал достаточно. Я найду статуэтку.",DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"Таверна Орлана? Где она находится?",DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Таверна Орлана? Где она находится?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//Если ты выйдешь из города через эти ворота и пойдешь прямо по дороге, ты дойдешь до отдельно стоящего дома.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//Это и есть таверна Орлана, 'Мертвая Гарпия'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//Я услышал достаточно. Я найду статуэтку.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//Да направит тебя Иннос, и да защитит он тебя от опасностей, подстерегающих тебя за воротами города.
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Дарон был ограблен мерзкими гоблинами. У него пропала ценная статуэтка, которую он должен был доставить в монастырь. Эти гоблины, похоже, скрываются в пещере около таверны 'Мертвая Гарпия'.");
};


instance DIA_Addon_Daron_FoundStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Addon_Daron_FoundStatue_Condition;
	information = DIA_Addon_Daron_FoundStatue_Info;
	description = "Я нашел статуэтку.";
};

func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (DIA_Gorax_GOLD_perm == FALSE) && (MIS_Addon_Daron_GetStatue == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//Я нашел статуэтку.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//Хвала Инносу!
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//Что ты будешь с ней делать?
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//Я? Ничего. До сих пор она приносила мне лишь несчастья.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//ТЫ отнесешь ее в монастырь, сынок.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//Конечно, тебя не пропустят внутрь, если ты не согласишься посвятить оставшуюся жизнь служению монастырю.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//Но я уверен, что ты не откажешься. Ведь ты можешь оказать услугу МНЕ, верно?
	};
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Ступай, сынок! Да пребудет с тобой Иннос.
};

instance DIA_Addon_Daron_ReturnedStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_ReturnedStatue_Condition;
	information = DIA_Addon_Daron_ReturnedStatue_Info;
	description = "Я отнес твою статуэтку в монастырь.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (MIS_Addon_Daron_GetStatue == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//Я отнес твою статуэтку в монастырь. Можешь быть спокоен.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//Это прекрасная новость! Да хранит тебя Иннос.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//Прими вот это в знак моей благодарности.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	TOPIC_End_RangerHelpKDF = TRUE;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = "Я как раз бедный!";
};

func int DIA_Daron_arm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Stadt) && (Npc_HasItems(other,ItMi_Gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//Я как раз бедный!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//Да, ты доведен до нищеты. Это неудивительно в эти тяжелые времена. Возьми это золото, надеюсь, оно поможет тебе.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//Но ты должен найти себе работу, и тогда у тебя не будет недостатка в золоте. И ты сможешь пожертвовать это золото церкви Инноса, помня о том, как она помогала тебе.
	B_GiveInvItems(self,other,ItMi_Gold,20);

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};
};


instance DIA_DARON_CANTHAR(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = dia_daron_canthar_condition;
	information = dia_daron_canthar_info;
	permanent = TRUE;
	description = "Здесь творится несправедливость!";
};

func int dia_daron_canthar_condition()
{
	if((Canthar_Sperre == TRUE) && (KnowCantarFree == TRUE))
	{
		return TRUE;
	};
};

func void dia_daron_canthar_info()
{
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Daron_Canthar_15_00");	//Здесь творится несправедливость, брат!
	}
	else
	{
		AI_Output(other,self,"DIA_Daron_Canthar_15_01");	//Здесь творится несправедливость, отец!
	};
	if(Canthar_Ausgeliefert == TRUE)
	{
		AI_Output(other,self,"DIA_Daron_Canthar_15_02");	//Торговец Кантар, пользуясь продажностью стражи, вышел на свободу и очерняет мое имя!
	}
	else
	{
		AI_Output(other,self,"DIA_Daron_Canthar_15_03");	//Торговец Кантар очерняет мое имя!
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Daron_Canthar_10_04");	//Как он посмел?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Daron_Canthar_10_05");	//Как он посмел наговаривать на паладина?!
	}
	else if(Daron_Spende >= 750)
	{
		AI_Output(self,other,"DIA_Daron_Canthar_10_06");	//Как он посмел наговаривать на столь верного почитателя Инноса?!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Canthar_10_07");	//К сожалению, я не так хорошо знаю тебя, чтобы судить - кто здесь прав.
		return;
	};
	AI_Output(self,other,"DIA_Daron_Canthar_10_08");	//Я немедленно поговорю об этом с лордом Андрэ.
	Canthar_Sperre = FALSE;
};

var int DIA_Daron_Spende_permanent;

instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 990;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование...";
};

func int DIA_Daron_Spende_Condition()
{
	if((DIA_Daron_Spende_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Daron_Spenden) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//Я хочу сделать пожертвование...
	Info_ClearChoices(DIA_Daron_Spende);

	if(Dar_Bonus_4 == FALSE)
	{
		Info_AddChoice(DIA_Daron_Spende,"Но у меня недостаточно золота.",DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende,"Тут пятьдесят золотых монет.",DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende,"Вот сто золотых монет.",DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende,"Здесь двести золотых монет.",DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//Ты уже пожертвовал мне более тысячи золотых монет.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//Благословение Инноса всегда пребудет с тобой!
		DIA_Daron_Spende_permanent = TRUE;
	};
};

func void DIA_Daron_Spende_BACK()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//Но у меня недостаточно золота...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//Это не имеет значения, сын мой. Ты можешь принести пожертвование позже.
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//Благословляю тебя от имени Инноса. Он несет в этот мир свет и справедливость.
		Npc_RemoveInvItems(self,ItMi_Gold,50);
		if(SPENDEDAY != Wld_GetDay())
		{
			Daron_Spende = Daron_Spende + 50;
			B_DaronSegen();
			Daron_Segen = TRUE;
			SPENDEDAY = Wld_GetDay();
		};
		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//Ты можешь жертвовать несколько раз понемногу, если у тебя сейчас недостаточно золота.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Иннос, ты свет, озаряющий путь праведников.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//Я благословляю этого человека от твоего имени. Да будет твой свет сиять над ним вечно.
		Npc_RemoveInvItems(self,ItMi_Gold,100);
		Daron_Spende = Daron_Spende + 100;
		B_DaronSegen();
		Daron_Segen = TRUE;

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//Иннос говорит - если хочешь молиться, открой свою душу. А если ты хочешь пожертвовать, принеси свой дар.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Иннос, благослови этого человека. Да будет твой свет сиять над ним вечно.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Придай ему силы жить праведной жизнью.
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		Daron_Spende = Daron_Spende + 200;
		B_DaronSegen();
		Daron_Segen = TRUE;

		if((MIS_Thorben_GetBlessings == LOG_Running) && (DaronBlessMe == FALSE))
		{
			DaronBlessMe = TRUE;
			B_LogEntry(TOPIC_Thorben,"Маг огня Дарон благословил меня.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//Если ты хочешь пожертвовать столько золота, оно у тебя должно хотя бы быть.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

instance DIA_DARON_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = dia_daron_runemagicnotwork_condition;
	information = dia_daron_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_daron_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_daron_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Daron_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Daron_RuneMagicNotWork_01_01");	//В том то и дело, что нет! И я никак не пойму причину, по которой не могу их использовать.
	AI_Output(other,self,"DIA_Daron_RuneMagicNotWork_01_02");	//А что насчет остальных?
	AI_Output(self,other,"DIA_Daron_RuneMagicNotWork_01_03");	//По всей видимости, это коснулось нас всех. У других магов Огня тоже ничего не получается.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_DARON_RING_TEST(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_condition;
	information = DIA_DARON_RING_TEST_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DARON_RING_TEST_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_info()
{
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_01");	//Постой! У меня есть к тебе одно интересное предложение.
	AI_Output(other,self,"DIA_DARON_RING_TEST_01_02");	//И какое же?
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_03");	//Дело в том, что недавно я нашел одно магическое кольцо.
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_04");	//Я хотел его уже было примерить, но потом заметил довольно странные символы на его огранке.
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_05");	//И теперь я в некой растерянности. Даже и не знаю, как поступить.
	AI_Output(other,self,"DIA_DARON_RING_TEST_01_06");	//А что тебя смущает?
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_07");	//Понимаешь, я довольно осторожно отношусь к магии, смысла которой не могу понять полностью.
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_08");	//И мне нужен кто-то, кто сможет использовать это кольцо вместо меня.
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_09");	//Вот я и подумал...
	AI_Output(other,self,"DIA_DARON_RING_TEST_01_10");	//...что я могу быть тем самым человеком, который это сделает.
	AI_Output(self,other,"DIA_DARON_RING_TEST_01_11");	//Ты абсолютно прав! Естественно, я не останусь в долгу и отблагодарю тебя за твою помощь.
	AI_Output(other,self,"DIA_DARON_RING_TEST_01_12");	//Ладно, я подумаю над твоим предложением.
	DARON_RING = TRUE;
};


instance DIA_DARON_RING_TEST_Take(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_Take_condition;
	information = DIA_DARON_RING_TEST_Take_info;
	permanent = FALSE;
	description = "Хорошо, давай сюда это кольцо.";
};

func int DIA_DARON_RING_TEST_Take_condition()
{
	if(DARON_RING == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_Take_info()
{
	AI_Output(other,self,"DIA_DARON_RING_TEST_Take_01_01");	//Хорошо, давай сюда это кольцо.
	AI_Output(self,other,"DIA_DARON_RING_TEST_Take_01_02");	//Ты в этом точно уверен?
	AI_Output(other,self,"DIA_DARON_RING_TEST_Take_01_03");	//Иначе я не просил бы его у тебя.
	AI_Output(self,other,"DIA_DARON_RING_TEST_Take_01_04");	//Как скажешь. Вот, держи.
	B_GiveInvItems(self,other,ItRi_UnknownRing,1);
	Log_CreateTopic(TOPIC_DARON_RING_TEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DARON_RING_TEST,LOG_Running);
	MIS_DARON_RING_TEST = LOG_Running;
	B_LogEntry(TOPIC_DARON_RING_TEST,"Дарон предложил испытать мне одно странного вида кольцо. Я согласился сделать это.");
};


instance DIA_DARON_RING_TEST_Done(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_RING_TEST_Done_condition;
	information = DIA_DARON_RING_TEST_Done_info;
	permanent = FALSE;
	description = "Я использовал твое кольцо.";
};

func int DIA_DARON_RING_TEST_Done_condition()
{
	if((MIS_DARON_RING_TEST == LOG_Running) && (DaronRingTest == TRUE) && (Npc_HasItems(hero,ItRi_UnknownRing) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DARON_RING_TEST_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DARON_RING_TEST_Done_01_01");	//Я использовал твое кольцо.
	AI_Output(self,other,"DIA_DARON_RING_TEST_Done_01_02");	//И что произошло?
	AI_Output(other,self,"DIA_DARON_RING_TEST_Done_01_03");	//Ничего особенного. Оно перенесло меня прямо к Кругу Солнца.
	AI_Output(self,other,"DIA_DARON_RING_TEST_Done_01_04");	//Так, значит, это просто кольцо телепортации? По правде говоря, я рассчитывал на большее.
	AI_Output(self,other,"DIA_DARON_RING_TEST_Done_01_05");	//В любом случае спасибо, что помог мне разобраться с этим.
	AI_Output(other,self,"DIA_DARON_RING_TEST_Done_01_06");	//А что мне делать с кольцом?
	AI_Output(self,other,"DIA_DARON_RING_TEST_Done_01_07");	//Его можешь оставить себе. Оно мне не нужно.
	Npc_RemoveInvItems(hero,ItRi_UnknownRing,Npc_HasItems(hero,ItRi_UnknownRing));
	CreateInvItems(hero,ItRi_Teleport_Ring,1);
	AI_Output(self,other,"DIA_DARON_RING_TEST_Done_01_08");	//Возьми также несколько целебных напитков в качестве благодарности.
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	B_LogEntry(TOPIC_DARON_RING_TEST,"Я сообщил Дарону о том, что случилось, когда я одел кольцо. Разочаровавшись его действием, он позволил мне оставить его себе.");
	Log_CreateTopic(TOPIC_DARON_RING_TEST,LOG_SUCCESS);
	MIS_DARON_RING_TEST = LOG_SUCCESS;
};


instance DIA_DARON_GoldForGorax(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_GoldForGorax_condition;
	information = DIA_DARON_GoldForGorax_info;
	permanent = FALSE;
	description = "Могу ли я что-нибудь сделать для тебя?";
};

func int DIA_DARON_GoldForGorax_condition()
{
	if((Daron_Spende > 500) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_DARON_GoldForGorax_info()
{
	AI_Output(other,self,"DIA_DARON_GoldForGorax_01_00");	//Могу ли я что-нибудь сделать для тебя?
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_01");	//Твое стремление помогать служителям Инноса похвально, сын мой, и я с радостью доверюсь тебе. 
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_02");	//Ибо своими деяниями ты уже доказал, что ты достоин этого.
	AI_Output(other,self,"DIA_DARON_GoldForGorax_01_03");	//Рад это слышать.
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_04");	//Итак, мне необходимо доставить собранные пожертвования в монастырь.
	AI_Output(other,self,"DIA_DARON_GoldForGorax_01_05");	//Ты хочешь, чтобы я сопровождал тебя?
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_06");	//К сожалению, я не могу сейчас отлучиться из города.
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_07");	//Поэтому я просто дам тебе сумку с пожертвованиями, а ты отнесешь его в монастырь.
	B_GiveInvItems(self,other,itmi_daron_suma,1);
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_08");	//Передай его там мастеру Гораксу. Помимо виноделия, он занимается учетом средств в нашей сокровищнице.
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_09");	//Ты все понял?
	AI_Output(other,self,"DIA_DARON_GoldForGorax_01_10");	//Конечно.
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_11");	//Хорошо. Надеюсь, что ты доставишь золото в целости и сохранности.
	AI_Output(self,other,"DIA_DARON_GoldForGorax_01_12");	//(серьезно) И не вздумай прикарманить золото себе и сбежать. Этим ты навлечешь на себя гнев Инноса!
	Log_CreateTopic(TOPIC_DARON_GIVEGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DARON_GIVEGOLD,LOG_Running);
	MIS_DARON_GIVEGOLD = LOG_Running;
	B_LogEntry(TOPIC_DARON_GIVEGOLD,"Дарон поручил мне доставить сумку с пожертвованиями в монастырь мастеру Гораксу.");
	Wld_InsertNpc(bdt_darongivegold_mis_1,"NW_FOREST_CONNECT_MONASTERY");
	Wld_InsertNpc(bdt_darongivegold_mis_2,"NW_PATH_TO_MONASTERY_03");
	Wld_InsertNpc(bdt_darongivegold_mis_3,"NW_PATH_TO_MONASTERY_05");
	Wld_InsertNpc(bdt_darongivegold_mis_4,"NW_PATH_TO_MONASTERY_03");
	Wld_InsertNpc(bdt_darongivegold_mis_5,"NW_PATH_TO_MONASTERY_02");
};


instance DIA_DARON_GoldForGoraxOk(C_Info)
{
	npc = KDF_511_Daron;
	nr = 1;
	condition = DIA_DARON_GoldForGoraxOk_condition;
	information = DIA_DARON_GoldForGoraxOk_info;
	permanent = FALSE;
	description = "Я передал сумку с пожертвованиями мастеру Гораксу.";
};

func int DIA_DARON_GoldForGoraxOk_condition()
{
	if(MIS_DARON_GIVEGOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_DARON_GoldForGoraxOk_info()
{
	AI_Output(other,self,"DIA_DARON_GoldForGoraxOk_01_01");	//Я передал сумку с пожертвованиями мастеру Гораксу.
	AI_Output(self,other,"DIA_DARON_GoldForGoraxOk_01_02");	//Да, я уже знаю об этом. Хорошая работа!
	AI_Output(self,other,"DIA_DARON_GoldForGoraxOk_01_03");	//Но, что самое главное, ты не поддался соблазну золота. Это не может не вызывать уважения!
	AI_Output(self,other,"DIA_DARON_GoldForGoraxOk_01_04");	//И, дабы ты не счел меня неблагодарным, - вот, возьми этот свиток в качестве своей награды.
	AI_Output(self,other,"DIA_DARON_GoldForGoraxOk_01_05");	//Уверен, что ты найдешь ему достойное применение.
	AI_Output(other,self,"DIA_DARON_GoldForGoraxOk_01_06");	//Благодарю тебя.

	if(Npc_IsDead(bdt_darongivegold_mis_1) && Npc_IsDead(bdt_darongivegold_mis_2) && Npc_IsDead(bdt_darongivegold_mis_3) && Npc_IsDead(bdt_darongivegold_mis_4) && Npc_IsDead(bdt_darongivegold_mis_5))
	{
		B_GiveInvItems(self,other,ItSc_Firerain,1);
	}
	else
	{
		B_GiveInvItems(self,other,ItSc_HarmUndead,1);
	};
};

instance DIA_DARON_PICKPOCKET(C_Info)
{
	npc = KDF_511_Daron;
	nr = 900;
	condition = DIA_DARON_pickpocket_condition;
	information = DIA_DARON_pickpocket_info;
	permanent = TRUE;
	description = "(Попытаться украсть его руну)";
};

func int DIA_DARON_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_RagnarRune == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DARON_pickpocket_info()
{
	Info_ClearChoices(DIA_DARON_pickpocket);
	Info_AddChoice(DIA_DARON_pickpocket,Dialog_Back,DIA_DARON_pickpocket_back);
	Info_AddChoice(DIA_DARON_pickpocket,DIALOG_PICKPOCKET,DIA_DARON_pickpocket_doit);
};

func void DIA_DARON_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ItRu_FireBolt,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_DARON_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_DARON_pickpocket_back()
{
	Info_ClearChoices(DIA_DARON_pickpocket);
};