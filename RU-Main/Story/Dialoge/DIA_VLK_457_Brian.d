
var int brsharpsword;

instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

var int FirstTalkBrian;

instance DIA_Brian_NoTalkAtAll(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_NoTalkAtAll_Condition;
	information = DIA_Brian_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Brian_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_NoTalkAtAll_Info()
{
	if(FirstTalkBrian == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_NoTalkAtAll_12_00");	//Тебе нечего тут делать. Вон!
		FirstTalkBrian = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_NoTalkAtAll_12_01");	//Оглох что ли? Вон отсюда.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Brian_HALLO(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//Ты недавно в городе, да? Я Брайан! Ученик мастера Харада.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = "Каково это, быть учеником кузнеца?";
};

func int DIA_Brian_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//Каково это, быть учеником кузнеца?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Почему ты спрашиваешь? Ты хочешь стать моим преемником?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Может быть.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Почему бы и нет... Я почти закончил свое обучение и собираюсь вскоре покинуть город.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//Но не из-за Харада. Он хороший мастер, я многому научился у него.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = "Почему ты хочешь покинуть город?";
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Почему ты хочешь покинуть город?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Потому что люди здесь действуют мне на нервы! А особенно остальные мастера.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//Я еще не забыл, чего это стоило - стать учеником Харада.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Каждый из этих шутников был готов вставить свою шпильку.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//Я хочу сам решать, кого могу, а кого не могу брать в ученики.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = "А кто здесь другие мастера?";
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//А кто здесь другие мастера?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//Ну, это плотник Торбен, мастер-лучник Боспер, алхимик Константино и Маттео.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//Он продает доспехи, но, в первую очередь, он торговец.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//У каждого мастера есть свой дом на этой улице.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//А лавка Константино находится в подземном проходе, ведущем к храму.
};


instance DIA_Brian_AboutHarad(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = "Расскажи мне о мастере Хараде.";
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Расскажи мне о мастере Хараде.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//Он сейчас не в лучшем расположении духа.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//Несколько дней назад пришли паладины и приказали ему ковать мечи для них.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//Они даже запретили ему продавать мечи кому-либо еще.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Теперь он, как раб, работает дни и ночи напролет, чтобы как можно быстрее закончить свою работу.
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Могу я купить оружие у тебя?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Нет. Я всего лишь помощник.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//Оружие, которое делается в этой кузнице, забирает ополчение. Они уносят его к башням, где оно хранится.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//Но во всем остальном, что касается кузнечного дела, я могу помочь.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 5;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = TRUE;
	description = "Научи меня затачивать оружие. (Очки обучения: 1, Цена: 250 монет)";
};

func int DIA_Brian_NEEDWEAPONS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && (KNOWHOWSHARPWEAPON == FALSE) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_03_89");	//Научи меня затачивать оружие.

	if((other.lp >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 250))
	{
		KNOWHOWSHARPWEAPON = TRUE;
		other.lp = other.lp - 1;
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(other,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_10");	//Хорошо, смотри внимательно, как это делается. Все, что тебе нужно, это ржавое оружие и заготовка меча.

		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_CITY_SMITH_SHARP");
			AI_AlignToWP(self);
			AI_UseMob(self,"BSSHARP",5);
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_12");	//Берешь ржавый меч, сверху прижимаешь заготовкой клинка...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_13");	//...и плавно водишь по точильному камню вправо-влево...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_14");	//...заготовка клинка нужна для более равномерного прижима меча к камню...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_15");	//...и чтобы меч не перегревался и не изгибался при заточке.
			AI_UseMob(self,"BSSHARP",-1);
			B_TurnToNpc(self,other);
		};

		AI_Print(PRINT_LearnSharp);
		Snd_Play("LevelUP");
	}
	else if(other.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 250)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_03_90");	//У тебя не хватает для этого золота! Приходи позже.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Brian_GiveSharpStone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStone_Condition;
	information = DIA_Brian_GiveSharpStone_Info;
	permanent = FALSE;
	description = "Затачивать оружие можно только в кузнице?";
};

func int DIA_Brian_GiveSharpStone_Condition()
{
	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStone_Info()
{
	AI_Output(other,self,"DIA_Brian_GiveSharpStone_01_00");	//Затачивать оружие можно только в кузнице?
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_01");	//Естественно. Если, конечно, у тебя нет с собой точильного оселка.
	AI_Output(other,self,"DIA_Brian_GiveSharpStone_01_02");	//А у тебя он есть?
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_03");	//Был, пока какой-то мерзкий вор не стащил его у меня.
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_04");	//Стоило мне только отвернуться - и вот... И зачем кому-то понадобился простой кусок камня?
	MIS_BrianSharpStone = LOG_Running;
	Log_CreateTopic(TOPIC_BrianSharpStone,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Running);
	B_LogEntry(TOPIC_BrianSharpStone,"У Брайана какой-то вор стащил точильный оселок. Похоже, парень был бы не прочь вернуть его.");
};

instance DIA_Brian_GiveSharpStoneDone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStoneDone_Condition;
	information = DIA_Brian_GiveSharpStoneDone_Info;
	permanent = FALSE;
	description = "Я нашел твой оселок.";
};

func int DIA_Brian_GiveSharpStoneDone_Condition()
{
	if((MIS_BrianSharpStone == LOG_Running) && (Npc_HasItems(hero,ItMi_ZharpStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStoneDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Brian_GiveSharpStoneDone_01_00");	//Я нашел твой оселок.
	AI_Output(self,other,"DIA_Brian_GiveSharpStoneDone_01_01");	//Правда? (удивленно) Я уж и не надеялся, что он все-таки отыщется.
	AI_Output(self,other,"DIA_Brian_GiveSharpStoneDone_01_02");	//Знаешь, что? Можешь оставь его себе. Мне он уже без надобности, а тебе может пригодиться.
	AI_Output(other,self,"DIA_Brian_GiveSharpStoneDone_01_03");	//Как скажешь.
	MIS_BrianSharpStone = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Success);
	B_LogEntry(TOPIC_BrianSharpStone,"Я рассказал Брайану, что нашел его оселок. Тот бы рад это услышать и подарил его мне.");
};

var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = "Что я могу купить у тебя?";
	trade = TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//Что я могу купить у тебя?

	if(Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Если у меня еще есть парочка лишних стальных болванок, ты можешь взять их. Боюсь, что это все.

		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//С тех пор как Харада больше нет здесь, ополчение глаз с меня не спускает.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//Мне не позволено продолжать работать в кузнице. Они боятся, что я все распродам и свалю.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Если у меня еще есть парочка лишних стальных болванок, ты можешь взять их. Боюсь, что это все.
	};

	if(Brian_Trade_einmal == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Брайан, подмастерье Харада, продает стальные заготовки.");
		Brian_Trade_einmal = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Ты можешь ремонтировать ювелирные изделия?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//Я всего лишь помощник, я радуюсь, когда мне позволяют сделать хотя бы кинжал.
	if(Npc_IsDead(Harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Ювелирные изделия? Тебе лучше обратиться к мастеру.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = "Я слышал, что ты интересовался маяком старого Джека.";
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//Я слышал, что ты интересовался маяком старого Джека.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Джек собирается выйти в море. Но ему не на кого оставить маяк.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//Но Джек должен понимать, что в его отсутствие я превращу маяк в кузницу.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Это проблема?!
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//Не для меня! Мне все равно не заполучить кузницу Харада. Я уже выбросил эту мысль из головы.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Согласен! Встретимся у Джека.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
	EquipItem(self,ItMw_1h_Vlk_Axe);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "И, что скажешь?";
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//И что скажешь?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//Боже, какой бардак. Джек не узнает это место, когда я все здесь устрою как надо.
};

instance DIA_Brian_SharpKnife(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_SharpKnife_Condition;
	information = DIA_Brian_SharpKnife_Info;
	permanent = TRUE;
	description = "Мне нужно, чтобы ты заточил этот нож.";
};

func int DIA_Brian_SharpKnife_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling) && (Npc_GetDistToWP(self,"NW_CITY_SMITH_SHARP") <= 500) && (MIS_Hilda_SharpKnife == LOG_Running) && (HildaSharpKnife == FALSE) && (Npc_HasItems(other,ItMi_HildaKnife) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_SharpKnife_Info()
{
	AI_Output(other,self,"DIA_Brian_SharpKnife_15_00");	//Мне нужно, чтобы ты заточил этот нож.
	AI_Output(self,other,"DIA_Brian_SharpKnife_04_01");	//Конечно. Но это будет стоить тебе десять золотых.
	Info_ClearChoices(DIA_Brian_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 10)
	{
		Info_AddChoice(DIA_Brian_SharpKnife,"Вот золото.",DIA_Brian_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Brian_SharpKnife,"У меня нет таких денег.",DIA_Brian_SharpKnife_No);

};

func void DIA_Brian_SharpKnife_Ok()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Brian_SharpKnife_Ok_15_00");	//Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,10);
	Npc_RemoveInvItems(self,ItMi_Gold,10);
	AI_Output(self,other,"DIA_Brian_SharpKnife_Ok_04_01");	//Хорошо! Подожди минутку...
	AI_Output(self,other,"DIA_Brian_SharpKnife_Ok_04_02");	//...ну, вот и все. Теперь этот нож острее бритвы!
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife,"Ученик кузнеца Брайн заточил для меня нож Хильды.");
	Info_ClearChoices(DIA_Brian_SharpKnife);
};

func void DIA_Brian_SharpKnife_No()
{
	AI_Output(other,self,"DIA_Brian_SharpKnife_No_15_00");	//У меня нет таких денег.
	AI_Output(self,other,"DIA_Brian_SharpKnife_No_04_01");	//Извини, тогда ничем не могу помочь.
	Info_ClearChoices(DIA_Brian_SharpKnife);
};
