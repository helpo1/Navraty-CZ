
instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hallo(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hallo_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Эй! Я знаю тебя! Ты из колонии.
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Что тебе нужно здесь?
};

instance DIA_Wolf_AboutSylvio(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_AboutSylvio_Condition;
	information = DIA_Wolf_AboutSylvio_Info;
	permanent = FALSE;
	description = "Что ты думаешь о Сильвио?";
};

func int DIA_Wolf_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2) && (Sylvio_angequatscht >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_00");	//Что ты думаешь о Сильвио?
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_01");	//Потрясающий человек! Ну... выдающийся! Ну, какой-то... немыслимый какой-то! Ну... прекраснейший...
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_02");	//Э-э... что?!
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_03");	//Ты ведь и так знаешь, что я, пришедший сюда вместе с Ли, о нем думаю.
	AI_Output(other,self,"DIA_Wolf_AboutSylvio_01_04");	//Просто я хотел...
	AI_Output(self,other,"DIA_Wolf_AboutSylvio_01_05");	//Послушай, приятель! Лучше засунь все эти свои вопросы куда подальше и займись-ка делом.
};

instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам.";
};

func int DIA_Wolf_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_01");	//Хммм...(задумчиво) Хочешь стать одним из нас? Похвально!
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_02");	//Но для начала тебе нужно показать всем, на что ты способен.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_New_08_03");	//А как насчет тебя?
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_04");	//Если хочешь произвести на меня впечатление - порази все три мишени на стрельбище!
	AI_Output(self,other,"DIA_Wolf_WannaJoin_New_08_05");	//Сделай это и считай, что мое согласие у тебя в кармане.
	MIS_AppleTest = LOG_Running;
	Log_CreateTopic(TOPIC_AppleTest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Running);
	B_LogEntry(TOPIC_AppleTest,"Вольф даст мне свое согласие, если я поражу все три мишени на стрельбище.");
	B_StartOtherRoutine(Sld_805_Cord,"WaitShoot");
};

instance DIA_Wolf_WannaJoin_Done(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Done_Condition;
	information = DIA_Wolf_WannaJoin_Done_Info;
	permanent = FALSE;
	description = "Я сделал, что ты просил.";
};

func int DIA_Wolf_WannaJoin_Done_Condition()
{
	if((MIS_AppleTest == LOG_Running) && (AIMALLISDONE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Wolf_WannaJoin_Done_15_00");	//Я сделал то, что ты просил. Теперь ты проголосуешь за меня?
	AI_Output(self,other,"DIA_Wolf_WannaJoin_Done_08_01");	//Почему бы и нет...(довольно) Нам нужны такие люди, как ты!
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Но не рассчитывай, что тебе так просто удастся получить согласие других.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Последнее время мы набрали всякого сброда. И даже многие старые наемники могут не помнить тебя.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Я сам-то еле узнал тебя, ты выглядишь ужасно изможденным.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Когда Барьер пал, мне чудом удалось остаться в живых.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Но, похоже, тебе все же повезло.
	MIS_AppleTest = LOG_Success;
	Log_SetTopicStatus(TOPIC_AppleTest,LOG_Success);
	B_LogEntry(TOPIC_AppleTest,"Вольф проголосует за меня.");
	B_LogEntry_Quiet(TOPIC_SLDRespekt,"Вольф не возражает против моего вступления в ряды наемников.");
	B_StartOtherRoutine(Sld_805_Cord,"Start");
};

instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "Ты можешь что-нибудь продать?";
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Ты можешь что-нибудь продать?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Ох, лучше не спрашивай.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//Беннет, один из новых парней, теперь заведует оружием и доспехами.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//В колонии я отвечал за весь арсенал Ли, и вот пришел хороший кузнец и - пфф - я остался без работы.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Мне очень нужна новая работа, даже если это будет охрана местных ферм.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Меня это не волнует, лишь бы только не быть баклуши здесь.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Я могу научить тебя секретам обращения с луком, если хочешь. Все равно мне сейчас нечего делать.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Вольф может обучить меня обращению с луком.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу научиться стрельбе из лука.";
};


func int DIA_Wolf_TEACH_Condition()
{
	if((Wolf_TeachBow == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Я хочу научиться стрельбе из лука.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Чему обучить тебя?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//Вот так. Твоя меткость значительно выросла.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = "Ну, как? Не нашел еще работы?";
};


func int DIA_Wolf_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Ну, как? Не нашел еще работы?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Пока нет. Дай мне знать, если подвернется какая-нибудь работа для меня.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "А ты не пытался найти работу в городе?";
};


func int DIA_Wolf_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//А ты не пытался найти работу в городе?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//В городе? (смеется) Да меня туда силком не затащишь.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Или ты думаешь, что я стану работать солдатом ополчения? Я даже представить себя не могу в этой дурацкой униформе.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//И эта их одержимость повиновением. Нет, забудь об этом - хотя здесь, на ферме, и нечем заняться, но, по крайней мере, я могу делать что хочу.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = "Я слышал, ты умеешь делать доспехи из панцирей ползунов?";
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if(Wolf_ProduceCrawlerArmor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Я слышал, ты умеешь делать доспехи из панцирей ползунов?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//Это правда. А от кого ты об этом узнал?

	if(HOKURN_ARMOR == TRUE)
	{
		AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_01A");	//Барем из лагеря охотников рассказал мне об этом.
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Мне сказал охотник Гестат.
	};

	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Ты можешь сделать такие доспехи для меня?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Конечно! Принеси мне десять панцирей ползунов, и я сделаю тебе доспехи.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//Сколько ты хочешь за них?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Забудь об этом - я сделаю их бесплатно. В память о старых временах.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"Вольф может сделать мне доспехи из десяти панцирей ползунов.");
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = "Научи меня снимать панцири с ползунов.";
};

func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Научи меня снимать панцири с ползунов.
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,Dialog_Back,DIA_Wolf_TeachCrawlerPlates_Back);
	Info_AddChoice(DIA_Wolf_TeachCrawlerPlates,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Wolf_TeachCrawlerPlates_Chest);
};

func void DIA_Wolf_TeachCrawlerPlates_Back()
{
	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

func void DIA_Wolf_TeachCrawlerPlates_Chest()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//Это просто. Верхняя часть панциря соединяется с туловищем только по краям. Просто берешь и отрезаешь его при помощи острого ножа.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Понятно?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//Вроде бы просто.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//Ну, я так и сказал.
	};

	Info_ClearChoices(DIA_Wolf_TeachCrawlerPlates);
};

instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "Я принес панцири ползунов для доспехов.";
};

func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Я принес панцири ползунов для доспехов.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Хорошо - давай их сюда.
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};

var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = "Как мои доспехи?";
};

func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Как мои доспехи?

	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() + 1;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Скоро они будут готовы. Заходи завтра.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Я закончил их - вот, держи!
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Получилось неплохо, мне кажется.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Спасибо!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Да ладно.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ты шутник. Сначала мне нужны панцири ползунов...
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};

instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wolf_BENGAR(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = "Похоже, я нашел работу для тебя на ферме Бенгара.";
};

func int DIA_Wolf_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (MIS_BengarsHelpingSLD == LOG_Running) && (Kapitel >= 3) && (Wolf_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE) && (ConcertLoaBonus == TRUE))
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	if(WOLFRECRUITEDDT == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Похоже, я нашел работу для тебя на ферме Бенгара.

		if(DIA_Wolf_BENGAR_oneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Выкладывай.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Проход в Долину Рудников начинается сразу за фермой Бенгара. Ему досаждают звери, просачивающиеся через Проход.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Нужно, чтобы кто-нибудь защищал ферму Бенгара.
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Ну, хоть что-то. Я хотя бы буду далеко от этой фермы, и не буду смотреть как идиот на здешнюю кузницу.
			DIA_Wolf_BENGAR_oneTime = TRUE;
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (RhetorikSkillValue[1] >= 25))
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Я согласен! А так как ты один из нас, я не возьму много за эту работу. Дай мне триста золотых, и я сразу же отправляюсь туда.
				Wolf_BENGAR_geld = 300;
			}
			else if(RhetorikSkillValue[1] >= 25)
			{
				AI_Output(self,other,"DIA_Wolf_BENGAR_New_08_05");	//Я согласен! Ты всегда мне нравился, парень. Поэтому, просто дай мне триста золотых, и я сразу же отправляюсь туда.
				Wolf_BENGAR_geld = 300;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Хорошо! Это будет стоить восемьсот золотых.
			AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//Неслабая цена.
			AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//Да! Для одного из нас, я сделал бы это практически бесплатно. Но для тебя...
			Wolf_BENGAR_geld = 800;
		};

		Info_ClearChoices(DIA_Wolf_BENGAR);
		Info_AddChoice(DIA_Wolf_BENGAR,"Я подумаю над этим.",DIA_Wolf_BENGAR_nochnicht);
		Info_AddChoice(DIA_Wolf_BENGAR,"Вот твое золото.",DIA_Wolf_BENGAR_geld);
	}
	else
	{
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Похоже, я нашел работу для тебя на ферме Бенгара.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Выкладывай.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Проход в Долину Рудников начинается сразу за фермой Бенгара. Ему досаждают звери, просачивающиеся через Проход.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Нужно, чтобы кто-нибудь защищал ферму Бенгара.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Хорошо! Я иду туда. Посмотрим, что там за звери.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Увидимся позже.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		AI_StopProcessInfos(self);
	};
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Вот твое золото.

	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Хорошо! Я иду туда. Посмотрим, что там за звери.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Увидимся позже.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//Если бы у тебя были деньги, я уже был бы там.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Ладно, только не обмани меня.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Все в порядке?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//Мой работодатель мертв! Пусть земля ему будет пухом. Кстати, я всегда хотел иметь свою собственную ферму.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_03");	//Хотя пока здесь орки, лучше подумать о своей шкуре. А то таким же станешь!
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//Конечно! Все спокойно.
		if(MIS_ORсGREATWAR == LOG_Running)
		{
			AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_04");	//Если не брать в расчет то, что кругом орки!
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = "А ты не хочешь отправиться со мной в путешествие на корабле?";
};


func int DIA_Wolf_SHIP_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//А ты не хочешь отправиться со мной в путешествие на корабле?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Нет. Теперь не хочу. Я нашел себе работу. Может быть, в другой раз.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//Да, конечно. Нужно сваливать отсюда. Ты не пожалеешь об этом. Я помогу тебе защитить корабль. Куда мы направляемся?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Вольфу надоел этот остров, и он готов на все, чтобы убраться отсюда. Он хороший боец.");
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я направляюсь на остров недалеко отсюда.";
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (wolf_SaidNo == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (Wolf_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Я направляюсь на остров недалеко отсюда.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//И чего мы тогда ждем? Пока мы будем в море, я могу обучить тебя стрельбе из лука и арбалета.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Я вспомнил, что у меня уже достаточно людей.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(зло) Так вот как ты поступаешь. Сначала зовешь меня с собой, а потом даешь от ворот поворот, да?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Да пошел ты. Чтоб твое корыто потонуло.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Я еще немного подумаю.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Добро пожаловать на борт!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Приходи в гавань. Мы скоро отправляемся.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Можешь считать, что я уже там.
	B_GivePlayerXP(XP_Crewmember_Success);
	Wolf_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Я еще немного подумаю.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//По-моему, ты просто болтун. Я не верю ни одному твоему слову. Проваливай.
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я решил, что ты мне не нужен.";
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Я решил, что ты мне не нужен.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Сначала ты вселяешь в меня надежду, а потом даешь от ворот поворот. Ты еще пожалеешь об этом!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = "Послушай.";
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if((Wolf_IsOnBoard == LOG_FAILED) && (CAPITANORDERDIAWAY == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Послушай.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Проваливай, ублюдок.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};


instance DIA_WOLF_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_wolf_bonusminecrawlerplates_condition;
	information = dia_wolf_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "У меня есть один вопрос.";
};


func int dia_wolf_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_AboutCrawler) && (BONUSMINECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_BonusMineCrawlerPlates_01_00");	//У меня есть один вопрос.
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_01");	//Так задавай его - не тяни!
	AI_Output(other,self,"DIA_Wolf_BonusMineCrawlerPlates_01_02");	//Говорят, если панцири ползунов добыл сам охотник, то сделанные из них доспехи обладают какими-то особенными свойствами. Это правда?
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_03");	//Нет, парень - это все сказки! (смеется) Старые байки старых охотников.
	AI_Output(self,other,"DIA_Wolf_BonusMineCrawlerPlates_01_04");	//Я бы на твоем месте не слишком бы сильно верил во все это.
};


instance DIA_WOLF_ABOUTCRAWLERAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawleragain_condition;
	information = dia_wolf_aboutcrawleragain_info;
	permanent = FALSE;
	description = "Мне нужен еще один доспех из панцирей ползунов.";
};


func int dia_wolf_aboutcrawleragain_condition()
{
	if((Player_GotCrawlerArmor == TRUE) && (GIVECRAWLERARMOR == FALSE) && ((MIS_BAREMCRAWLERARMOR == LOG_Running) || (MIS_BAREMCRAWLERARMOR == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawleragain_info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawlerAgain_01_00");	//Мне нужен еще один доспех из панцирей ползунов.
	AI_Output(self,other,"DIA_Wolf_AboutCrawlerAgain_01_01");	//Куда тебе столько, парень?!...(удивленно) Ладно, нет проблем! Но ты знаешь правила - сначала мне нужны пластины этих тварей.
	AI_Output(self,other,"DIA_Wolf_AboutCrawlerAgain_01_02");	//После этого я сделаю тебе еще один экземпляр.
};


instance DIA_WOLF_BRINGPLATESAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = dia_wolf_bringplatesagain_condition;
	information = dia_wolf_bringplatesagain_info;
	permanent = FALSE;
	description = "У меня есть панцири ползунов на доспехи.";
};


func int dia_wolf_bringplatesagain_condition()
{
	if(Npc_KnowsInfo(hero,dia_wolf_aboutcrawleragain) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10) && (GIVECRAWLERPLATE == FALSE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplatesagain_info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Я принес панцири ползунов для доспехов.
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Хорошо - давай сюда.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	GIVECRAWLERPLATE = TRUE;
	WOLF_ARMOR_DAY_AGAIN = Wld_GetDay();
};


instance DIA_WOLF_ARMORREADYAGAIN(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_armorreadyagain_condition;
	information = dia_wolf_armorreadyagain_info;
	permanent = TRUE;
	description = "Как мои доспехи?";
};

func int dia_wolf_armorreadyagain_condition()
{
	if((GIVECRAWLERPLATE == TRUE) && (GIVECRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorreadyagain_info()
{
	var int currentday;
	currentday = Wld_GetDay();
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Как мои доспехи?
	if(WOLF_ARMOR_DAY_AGAIN <= (currentday - 1))
	{
		Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Они готовы - вот!
		B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Получилось неплохо, мне кажется...
		AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Спасибо!
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Да ладно.
		GIVECRAWLERARMOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Я доделаю их завтра. Тогда и приходи.
	};
};


instance DIA_WOLF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_kapitelorcattack_condition;
	information = dia_wolf_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Что собираешься делать?";
};


func int dia_wolf_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (WOLFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_01_00");	//Что собираешься делать?
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_01_01");	//Я хочу смыться отсюда, и как можно быстрее!
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_01_02");	//Только вот как это сделать?
	Info_ClearChoices(dia_wolf_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_wolf_nw_kapitelorcattack,"Предложить руну телепортации на ферму Онара.",dia_wolf_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_wolf_nw_kapitelorcattack,"Это и понятно.",dia_wolf_nw_kapitelorcattack_nogiverune);
};

func void dia_wolf_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_01");	//Подожди! У меня с собой есть руна телепортации на ферму Онара.
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_02");	//Можешь воспользоваться ею.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_03");	//Руна?!
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_05");	//Ну ладно, давай ее сюда.
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_06");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_07");	//Эх! Надеюсь, после нее меня не будет опять неделю мутить, как после старого шнапса.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_11");	//Ладно, встретимся на ферме.
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_Farm_01_12");	//Конечно.
	WOLFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Вольфу руну телепортации на ферму Онара. Теперь я спокоен за его судьбу!");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_wolf_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Понятно.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_02");	//(вздох) Хотя я слышал, что большинство парней собралось пробиваться через город с боем.
	AI_Output(self,other,"DIA_Wolf_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Возможно, это единственный шанс для меня уйти отсюда живым!
	B_LogEntry(TOPIC_HELPCREW,"Вольф будет пробиваться с боем из захваченного города. Думаю, его шансы велики.");
	WOLFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_FUCKOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = dia_sld_811_wolf_fuckoff_condition;
	information = dia_sld_811_wolf_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (MIS_HUNTERSARMOR != LOG_Running) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_811_WOLF_YOURFREE(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_yourfree_condition;
	information = dia_sld_811_wolf_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_811_wolf_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_08");	//Чего тебе еще надо?
	AI_Output(other,self,"DIA_SLD_811_Wolf_YourFree_01_00");	//Ты свободен!
	AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_01");	//Хммм...(удивленно) Ты что, перебил всех орков в городе?!
	AI_Output(other,self,"DIA_SLD_811_Wolf_YourFree_01_02");	//Да, именно так.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_03");	//Что же, отлично приятель! А то мы уж думали, что нам всем пришел конец.
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_04");	//Только открой сначала решетки, чтобы мы смогли выйти отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_05");	//Что же, отлично приятель! А то я уж думал, что мне пришел конец.
		AI_Output(self,other,"DIA_SLD_811_Wolf_YourFree_01_06");	//Только открой сначала решетку, чтобы я смог выйти отсюда.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_811_WOLF_OPENGATENOW(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_sld_811_wolf_opengatenow_condition;
	information = dia_sld_811_wolf_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_811_wolf_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (WOLFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (WOLFISFREE == FALSE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_811_wolf_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_811_Wolf_OpenGateNow_01_00");	//Давай, приятель...(умоляюще) Выпусти меня отсюда!
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_NW_WOLFNOTCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcaptured_condition;
	information = dia_wolf_nw_wolfnotcaptured_info;
	permanent = FALSE;
	description = "У меня к тебе есть одно дело.";
};


func int dia_wolf_nw_wolfnotcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcaptured_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_00");	//У меня к тебе есть одно дело.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_01");	//Дело?! Хммм...(с интересом) И в чем же оно заключается?
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_02");	//Мне нужны еще доспехи из панцирей ползунов.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_03");	//Хорошо, принеси мне их пластины и я сделаю тебе еще один такой.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_04");	//Но мне нужно больше - не менее десяти штук.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_05");	//(удивленно) Десяти?! Но куда тебе столько?
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_06");	//Слишком долго объяснять. Так ты сделаешь их для меня?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_07");	//Хм...(задумчиво) Если ты достанешь для этого все необходимые материалы. Но на выполнение твоего заказа у меня уйдет огромная куча времени.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_09");	//Полагаю, не меньше месяца, это точно.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_10");	//Это слишком долго! Мне нужно быстрее.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_11");	//Извини, но я ничем тебе помочь не могу!
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_12");	//Может, тогда ты научишь меня, как их делать?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_13");	//Научить тебя?! Хммм...(задумчиво) Этот секрет очень дорого стоит!
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_01_14");	//Сколько?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_01_15");	//Думаю, пяти тысяч золотых монет мне должно хватить.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Наемник Вольф сказал, что на изготовку такого большого количества доспехов ему понадобится не меньше месяца. Слишком долго - и я попросил его научить меня самому делать эти доспехи. Вольф согласился, но оценил этот секрет в пять тысяч золотых.");
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
	Info_AddChoice(dia_wolf_nw_wolfnotcaptured,"У меня с собой пока нет таких денег.",dia_wolf_nw_wolfnotcaptured_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcaptured,"Договорились! Держи свое золото.",dia_wolf_nw_wolfnotcaptured_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcaptured_nomoney()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_01");	//Тогда возвращайся, когда они у тебя будут.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_NoMoney_01_02");	//Хорошо.
	WOLFNOTTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};

func void dia_wolf_nw_wolfnotcaptured_heremoney()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_00");	//Вот, держи
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_01");	//Хорошо...(улыбаясь) Тогда вот, возьми этот ключ.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_02");	//Он от моего старого сундука, где должны храниться точные чертежи выкроек для создания этих доспехов.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_04");	//И где сам сундук?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_05");	//А сундук остался в Долине Рудников! На том самом месте, где когда-то раньше стояла моя хибара.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCaptured_HereMoney_01_06");	//Надеюсь, с ним ничего не случилось.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Вольф дал мне ключ от сундука, где лежат чертежи выкроек нужных мне доспехов. Сам же сундук находится в Долине Рудников, в том самом месте, где раньше была его хижина.");
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcaptured);
};


instance DIA_WOLF_NW_WOLFNOTCAPTUREDPERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfnotcapturedperm_condition;
	information = dia_wolf_nw_wolfnotcapturedperm_info;
	permanent = TRUE;
	description = "Продай мне секрет твоих доспехов.";
};


func int dia_wolf_nw_wolfnotcapturedperm_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFNOTTEACHMEARMOR == TRUE) && (WOLFTEACHMEARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_info()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_01_00");	//Продай мне секрет твоих доспехов.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_01_01");	//Как я уже сказал, это стоит пять тысяч золотых монет. Они у тебя есть?
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
	Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm,"У меня с собой пока нет таких денег.",dia_wolf_nw_wolfnotcapturedperm_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_wolf_nw_wolfnotcapturedperm,"Договорились! Держи свое золото.",dia_wolf_nw_wolfnotcapturedperm_heremoney);
	};
};

func void dia_wolf_nw_wolfnotcapturedperm_nomoney()
{
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_01");	//Тогда возвращайся, когда они у тебя будут.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_NoMoney_01_02");	//Хорошо.
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};

func void dia_wolf_nw_wolfnotcapturedperm_heremoney()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_01");	//Ну что же, это хорошо...(улыбаясь) Тогда вот, возьми этот ключ.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_02");	//Он от моего старого сундука, где должны храниться точные чертежи выкроек для создания этих доспехов.
	AI_Output(other,self,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_04");	//И где сам сундук?
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_05");	//А сундук остался в Долине Рудников! На том самом месте, где когда-то раньше стояла моя хибара.
	AI_Output(self,other,"DIA_Wolf_NW_WolfNotCapturedPerm_HereMoney_01_06");	//Надеюсь, с ним ничего не случилось.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Вольф дал мне ключ от сундука, где лежат чертежи выкроек нужных мне доспехов. Сам же сундук находится в Долине Рудников, в том самом месте, где раньше была его хижина.");
	WOLFTEACHMEARMOR = TRUE;
	Info_ClearChoices(dia_wolf_nw_wolfnotcapturedperm);
};


instance DIA_WOLF_NW_WOLFCAPTURED(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = dia_wolf_nw_wolfcaptured_condition;
	information = dia_wolf_nw_wolfcaptured_info;
	permanent = FALSE;
	description = "Как ты тут оказался?";
};


func int dia_wolf_nw_wolfcaptured_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFCAPTURED == TRUE) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_wolfcaptured_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_00");	//Как ты тут оказался?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_01");	//Орки взяли меня в плен, когда мы с парнями прорывались из города.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_02");	//Вот только чего я до сих пор не пойму - почему они сразу меня не убили?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_04");	//Ну, а ты почему здесь?
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_05");	//У меня к тебе есть одно дело.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_06");	//Дело?! Хммм...(с интересом) И в чем же оно заключается?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_07");	//И в чем же оно заключается?
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_08");	//Мне нужны еще доспехи из панцирей ползунов.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_09");	//И как, по-твоему, я смогу тебе их сделать?!
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_10");	//Навряд ли орки выпустят меня.
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_11");	//Может, тогда ты научишь меня, как их делать?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_15");	//Вот, возьми этот ключ.
	B_GiveInvItems(self,other,itke_wolfarmor,1);
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_16");	//Он от моего старого сундука, где должны храниться точные чертежи выкроек для создания этих доспехов.
	AI_Output(other,self,"DIA_Wolf_NW_WolfCaptured_01_17");	//И где сам сундук?
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_18");	//А сундук остался в Долине Рудников! На том самом месте, где когда-то раньше стояла моя хибара.
	AI_Output(self,other,"DIA_Wolf_NW_WolfCaptured_01_19");	//Надеюсь, с ним ничего не случилось.
	WOLFMEETINPRISON = TRUE;
	WOLFTEACHMEARMOR = TRUE;
	B_LogEntry(TOPIC_HUNTERSARMOR,"Я нашел Вольфа. Орки взяли его в плен и держали в городской тюрьме. После нашего разговора на тему доспехов, он дал мне ключ от сундука, где лежат чертежи выкроек нужных мне доспехов. Сам же сундук находится в Долине Рудников, в том самом месте, где раньше была его хижина.");
};

var int CanDoCrawlwerPlateDay;
var int Player_GotCrawlerShield;

instance DIA_Wolf_CaracustPlate(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_CaracustPlate_Condition;
	information = DIA_Wolf_CaracustPlate_Info;
	permanent = FALSE;
	description = "У меня тут есть одна необычная пластина ползуна.";
};

func int DIA_Wolf_CaracustPlate_Condition()
{
	if((CanDoCrawlwerPlate == TRUE) && (Npc_HasItems(other,ItAt_ZaracustPlate) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_00");	//У меня тут есть одна необычная пластина ползуна.
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_01");	//(посмеиваясь) И чем же она, по-твоему, необычна?
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_02");	//Да вот, сам взгляни.
	B_GiveInvItems(other,self,ItAt_ZaracustPlate,1);
	Npc_RemoveInvItems(self,ItAt_ZaracustPlate,1);

	if(Trophy_CaracustPlate == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_CaracustPlate,Npc_HasItems(other,ItUt_CaracustPlate));
		Trophy_CaracustPlate = FALSE;
	};

	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_03");	//Иннос праведный! (ошеломленно) Какая же она огромная!
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_04");	//Ну что, я тебя удивил?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_05");	//Это еще слабо сказано, приятель! Таких пластин мне еще не доводилось встречать.
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_06");	//Я даже теряюсь в догадках, каких размеров была та тварь, что носила ее.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_07");	//Поверь, тебе лучше не знать.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_08");	//Но я хотел спросить тебя о другом. Можно будет сделать из нее что-нибудь полезное?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_09");	//Хммм. (задумчиво) Для доспехов она слишком большая, но, возможно, из нее получится сделать довольно сносный щит.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_11");	//Звучит неплохо. Ты сам справишься с этим?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_12");	//Конечно. Но придется повозиться с тем, чтобы обработать саму пластину должным образом.
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_13");	//И сколько времени тебе понадобится, чтобы сделать из нее щит?
	AI_Output(self,other,"DIA_Wolf_CaracustPlate_01_14");	//Если ни на что не отвлекаться, то это может занять от силы пару дней. 
	AI_Output(other,self,"DIA_Wolf_CaracustPlate_01_15");	//Ладно, тогда зайду позже.
	CanDoCrawlwerPlateDay = Wld_GetDay();
};

instance DIA_Wolf_CaracustPlate_Ready(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_CaracustPlate_Ready_Condition;
	information = DIA_Wolf_CaracustPlate_Ready_Info;
	permanent = TRUE;
	description = "Как поживает мой щит?";
};

func int DIA_Wolf_CaracustPlate_Ready_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_CaracustPlate) && (Player_GotCrawlerShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_CaracustPlate_Ready_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	AI_Output(other,self,"DIA_Wolf_CaracustPlate_Ready_01_00");	//Как поживает мой щит?

	if(CanDoCrawlwerPlateDay >= (DayNow - 2))
	{
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_01");	//Пока не готов! Так что лучше не отвлекай меня, если поскорее хочешь его получить.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_02");	//Да, он готов! Вот, держи.
		B_GiveInvItems(self,other,ItAr_Shield_Caracust,1);
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_03");	//На мой взгляд - неплохо вышло...(рассматривая) Но лучше всего, конечно, проверить его в бою!
		AI_Output(other,self,"DIA_Wolf_CaracustPlate_Ready_01_04");	//Что ж, благодарю. Я что-нибудь должен тебе за работу?
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_05");	//Нет - денег за это я с тебя не возьму. 
		AI_Output(self,other,"DIA_Wolf_CaracustPlate_Ready_01_06");	//Достаточно и того, что я неплохо провел время, делая его тебе.
		Player_GotCrawlerShield = TRUE;
	};
};

instance DIA_WOLF_NW_RECRDT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdt_condition;
	information = dia_wolf_nw_recrdt_info;
	permanent = FALSE;
	description = "Помнится, ты искал работу.";
};

func int dia_wolf_nw_recrdt_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD != LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (ConcertLoaBonus == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdt_info()
{
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_00");	//Помнится, ты искал работу.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_01");	//А устроит ли тебя такой работодатель, как я?
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_01_02");	//Все платят одним и тем же золотом, вопрос только в сумме, так что мне без разницы, на кого работать. Но тебя я хоть сколько-нибудь знаю. Это как-то связано с твоим переездом к нам по соседству?
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_15_03");	//Напрямую. Мне нужны охранники для башни на время моего отсутствия. Ну так что скажешь?
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_01_04");	//Хорошо. Я согласен. Но мне нужна оплата вперед за пару месяцев.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDT_01_05");	//Сколько?
	AI_Output(self,other,"DIA_WOLF_NW_RecrDT_15_06");	//Две тысячи золотых монет!
};

instance DIA_WOLF_NW_RECRDTFINALLY(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 23;
	condition = dia_wolf_nw_recrdtfinally_condition;
	information = dia_wolf_nw_recrdtfinally_info;
	permanent = FALSE;
	description = "Вот твои деньги!";
};

func int dia_wolf_nw_recrdtfinally_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_KnowsInfo(other,dia_wolf_nw_recrdt) && (MIS_BengarsHelpingSLD != LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_wolf_nw_recrdtfinally_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_15_00");	//Вот твои деньги! А теперь встал и пошел работать!
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_01");	//О, включил босса! Мне нравится! Да-да, шеф, я уже бегу!
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_02");	//Да, и кстати... ты не будешь против, если я подтяну для охраны твоего лагеря еще нескольких бойцов?
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_01_03");	//Конечно нет. Лишняя охрана никогда не повредит. Если только она не обойдется мне, как еще несколько Вольфов, и если будет тебе подспорьем в работе, а не в попойках.
	AI_Output(other,self,"DIA_WOLF_NW_RecrDTFinally_01_04");	//Ах, да, паролем для входа в лагерь является фраза 'Драконовы сокровища'. Не забудь ее!
	AI_Output(self,other,"DIA_WOLF_NW_RecrDTFinally_01_05");	//О, такой оригинальный пароль не забудешь и при желании. Увидимся в лагере!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Я нанял Вольфа для охраны башни.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	WOLFRECRUITEDDT = TRUE;
	WolfDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
	Wld_InsertNpc(SLD_8111_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION");
	Wld_InsertNpc(SLD_8112_Soeldner,"NW_CASTLEMINE_TOWER_NAVIGATION2");
};

instance DIA_Wolf_Bonus(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_Bonus_Condition;
	information = DIA_Wolf_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Wolf_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,10,7,54) && (WOLFRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Bonus_Info()
{
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,1);
	AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Точность стрельбы зависит от твоей ловкости. Чем выше ловкость, тем точнее стрелы летят в цель.
	AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Ну а твой навык определяет расстояние, с которого ты сможешь поразить мишень. Для того чтобы стать хорошим лучником, ты должен развивать и то, и другое.
	AI_StopProcessInfos(self);
};