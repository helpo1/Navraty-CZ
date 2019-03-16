
var int hosharpsword;

instance DIA_Hodges_Kap1_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap1_EXIT_Condition;
	information = DIA_Hodges_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_HALLO(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 1;
	condition = DIA_Hodges_HALLO_Condition;
	information = DIA_Hodges_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hodges_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Привет, я новичок здесь.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Не пойми меня неправильно, но сейчас у меня нет настроения разговаривать - я абсолютно измотан.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Ты ужасно занят, да?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Даже не говори. Беннет делает столько оружия, что едва успеваю полировать его.
};


instance DIA_Hodges_TellAboutFarm(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TellAboutFarm_Condition;
	information = DIA_Hodges_TellAboutFarm_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне об этой ферме?";
};


func int DIA_Hodges_TellAboutFarm_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TellAboutFarm_Info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Что ты можешь рассказать мне об этой ферме?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Это ферма Онара.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//Это большое здание - его дом. Он освободил одно крыло для наемников.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//А нам, фермерам, пришлось переселиться в сарай.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(торопливо) Но я совсем не против, хорошо ведь, что есть люди, способные защитить ферму.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Вот это здание - кухня.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Перед кухней находится кузница.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Возможно, тебе повезет и Текла приготовит тебе что-нибудь поесть.
};


instance DIA_Hodges_AboutSld(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_AboutSld_Condition;
	information = DIA_Hodges_AboutSld_Info;
	permanent = FALSE;
	description = "А что насчет наемников?";
};


func int DIA_Hodges_AboutSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//А что насчет наемников?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Онар нанял их, чтобы они не пускали сюда ополчение.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Но также они охраняют ферму, наших овец и самих фермеров.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Так что даже не думай украсть что-нибудь или пошарить в чужом сундуке.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Они только и ждут шанса, чтобы задать тебе трепку.
};


instance DIA_Hodges_TRADE(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TRADE_Condition;
	information = DIA_Hodges_TRADE_Info;
	permanent = TRUE;
	description = "Могу я купить оружие у тебя?";
	trade = TRUE;
};


func int DIA_Hodges_TRADE_Condition()
{
	if(Wld_IsTime(7,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Могу я купить оружие у тебя?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//У меня мало что есть. Мы относим почти все мечи и топоры в дом Онара.
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Hodges_Kap2_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap2_EXIT_Condition;
	information = DIA_Hodges_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap3_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap3_EXIT_Condition;
	information = DIA_Hodges_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_DontWork(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_DontWork_Condition;
	information = DIA_Hodges_DontWork_Info;
	permanent = FALSE;
	description = "Почему ты не работаешь?";
};


func int DIA_Hodges_DontWork_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Ты еще ничего не слышал? Паладины арестовали Беннета.
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"Кузнец Беннет арестован паладинами в городе.");
};


instance DIA_Hodges_BennetAndSLD(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 33;
	condition = DIA_Hodges_BennetAndSLD_Condition;
	information = DIA_Hodges_BennetAndSLD_Info;
	permanent = FALSE;
	description = "А как отреагировали наемники на ферме?";
};


func int DIA_Hodges_BennetAndSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//А как отреагировали наемники на ферме?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Естественно, я не знаю, что они планируют, но многие из них просто в ярости.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//Это понятно.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Если бы у них было право решать, они бы атаковали город уже сегодня, чтобы освободить Беннета.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Поговори с Ли, может быть, ты чем-нибудь сможешь помочь.
};

instance DIA_Hodges_WhatHappened(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 3;
	condition = DIA_Hodges_WhatHappened_Condition;
	information = DIA_Hodges_WhatHappened_Info;
	permanent = TRUE;
	description = "Научи меня затачивать оружие. (Очки обучения: 1, Цена: 250 золотых)";
};

func int DIA_Hodges_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_HALLO) && (KNOWHOWSHARPWEAPON == FALSE) && Wld_IsTime(7,0,19,0))
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info()
{
	if((other.lp >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 250))
	{
		KNOWHOWSHARPWEAPON = TRUE;
		other.lp = other.lp - 1;
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(other,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Hodges_WhatHappened_03_05");	//Хорошо, смотри внимательно как это делается. Все, что тебе нужно - это либо ржавое, либо самокованное оружие.

		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_BIGFARM_SMITH_SHARP");
			AI_AlignToWP(self);
			AI_UseMob(self,"BSSHARP",5);
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_07");	//Берешь меч, сверху прижимаешь заготовкой клинка...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_08");	//...и плавно водишь по точильному камню вправо-влево...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_09");	//...заготовка клинка нужна для более равномерного прижима меча к камню...
			AI_Output(self,other,"DIA_Hodges_WhatHappened_03_10");	//...чтобы меч не перегревался и не изгибался при заточке.
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
		AI_Output(self,other,"DIA_Hodges_WhatHappened_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Hodges_Kap4_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap4_EXIT_Condition;
	information = DIA_Hodges_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap5_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap5_EXIT_Condition;
	information = DIA_Hodges_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_PICKPOCKET(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 900;
	condition = DIA_Hodges_PICKPOCKET_Condition;
	information = DIA_Hodges_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hodges_PICKPOCKET_Condition()
{
	return C_Beklauen(15,10);
};

func void DIA_Hodges_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,Dialog_Back,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};

func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};


instance DIA_Hodges_DarkWeb(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_DarkWeb_Condition;
	information = DIA_Hodges_DarkWeb_Info;
	permanent = FALSE;
	description = "Беннет сказал, что ты вместе с ним ходил в город, когда его арестовали.";
};

func int DIA_Hodges_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (HodjesTalk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DarkWeb_Info()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_00");	//Беннет сказал, что ты вместе с ним ходил в город, когда его арестовали.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_01");	//Да, это так. У Беннета закончились стальные заготовки и мы решили немного прикупить их у торговца Хакона. 
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_02");	//У Хакона? А как же запрет паладинов на торговлю с фермой?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_03");	//Они с Беннетом старые знакомые! Так что, иногда Хакон все таки продает ему нужный материал для кузни.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_04");	//А почему ты собственно спрашиваешь об этом?
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_05");	//Вопросы сейчас задаю я. Где ты был, когда его арестовали?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_06");	//Я? Эммм... Пил шнапс в таверне Корагона. И всего то...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_01_07");	//А как же тебе удалось сбежать от ополчения?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_08");	//Когда я услышал, что Беннета арестовали за убийство паладина, то прямиком направился на ферму.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_01_09");	//Охрана у ворот не стала меня задерживать. Видимо им было достаточно того, что они схватили Беннета.
	B_LogEntry(TOPIC_DarkWeb,"По словам Ходжеса, он пил шнапс в таверне Корагона, когда Беннета арестовали. Узнав об этом, Ходжес отправился на ферму, городская стража не стала его задерживать, посчитав что настоящий убийца паладина Лотара уже пойман. Но у меня такое чувство, что Ходжес что-то скрывает. Надо попробовать как-то надавить на него, чтобы тот заговорил...");
};

instance DIA_Hodges_DarkWeb_Done(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_DarkWeb_Done_Condition;
	information = DIA_Hodges_DarkWeb_Done_Info;
	permanent = TRUE;
	description = "Ты врешь!";
};

func int DIA_Hodges_DarkWeb_Done_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(other,DIA_Hodges_DarkWeb) == TRUE) && (HodjesBookGive == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DarkWeb_Done_Info()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_00");	//Ты врешь!
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_01_01");	//Что?!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_02");	//Лорд Хаген сказал мне, что они преследовали человека, который пришел в город вместе с Беннетом.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_01_03");	//Но тому удалось сбежать от них. И я так понимаю, этим человеком был ты!
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_01_04");	//Что за вздор?! Это мог быть кто угодно... Я тут вообще не причем.
	Info_ClearChoices(DIA_Hodges_DarkWeb_Done);
	Info_AddChoice(DIA_Hodges_DarkWeb_Done,"Мы еще вернемся к этому разговору.",DIA_Hodges_DarkWeb_Done_BACK);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Hodges_DarkWeb_Done,"Послушай, это очень важно.",DIA_Hodges_DarkWeb_Done_DoIt);
	};
};

func void DIA_Hodges_DarkWeb_Done_BACK()
{
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_BACK_01_00");	//Мы еще вернемся к этому разговору.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_BACK_01_01");	//Оставь меня в покое!
	AI_StopProcessInfos(self);
};

func void DIA_Hodges_DarkWeb_Done_DoIt()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_00");	//Послушай, это очень важно.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_01");	//Лорд Хаген в ярости! Он ищет убийцу Лотара и рано или поздно он доберется до тебя.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_02");	//И тогда тебе уже никто не поможет. Ни Ли, ни его наемники.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_03");	//Так что, или ты мне рассказываешь все как было на самом деле, либо я скажу лорду Хагену, что это ты убил его паладина.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_04");	//Что?! Да как ты... Ты не сделаешь это!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_05");	//Сделаю, вот увидишь.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_06");	//Проклятье! Ладно, Белиар с тобой. Я расскажу все, что знаю.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_07");	//Но обещай, что ты никому об этом не скажешь.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_08");	//Обещаю. Так что, можешь начинать. 
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_09");	//В тот вечер я действительно пил в таверне у Карагона и после нескольких часов веселья мне захотелось отлить.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_10");	//Тогда я пошел к южным воротам города, нашел укромный кустик и только значит собрался немного облегчиться, как вдруг...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_11");	//Что?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_12");	//...недалеко от себя увидел паладина и еще какого-то странного типа в темной робе. Он был похож на мага.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_13");	//Они стояли рядом друг с другом и кажется о чем то разговаривали.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_14");	//Потом тот второй достал какой-то свиток и начал его читать, произнося абсолютно незнакомые мне слова.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_15");	//Правда от них у меня до сих пор мурашки по коже бегают!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_16");	//Что это были за слова?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_17");	//Ох... Я уже не помню, но кажется он произносил какое-то магическое заклинание.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_18");	//А что паладин?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_19");	//Сначала тот стоял как вкопаный. Я даже немного удивился его спокойной реакции на происходящее. 
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_20");	//А потом, он с видом какого-то неимоверного усилия резко выбил тот свиток из этого мага.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_21");	//Но по всей видимости было уже поздно. Его собеседник скинул руки вверх и все тело паладина вспыхнуло ярким огнем!
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_22");	//Тот упал на землю и больше не двигался. 
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_23");	//А что второй?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_24");	//Второй как будто растворился. Только что был на месте, мгновение, яркая вспышка и...его уже нет. Вот так.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_25");	//А что сделал ты?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_26");	//Обмочился от страха, что! Как все стихло, я подошел к лежащему на земле паладину. Но тот был уже мертв.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_27");	//Я поднял свиток, что обронил убийца, и хотел в него заглянуть. Уж больно мне было интересно, что там написано.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_28");	//Но в этот момент прибежала городская стража! Они попытались схватить меня, но я что есть сил дал деру от них.
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_29");	//Вот и все. Потом три дня пил в таверне у Теклы. Успокоиться не мог...
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_30");	//Ладно, не волнуйся так. Все уже позади!
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_31");	//Ты правильно сделал, что все мне рассказал. И правильно сделал, что не стал заглядывать в тот свиток.
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_32");	//Он мог бы тебя запросто убить. Кстати, он еще у тебя?
	AI_Output(self,other,"DIA_Hodges_DarkWeb_Done_DoIt_01_33");	//Да, вот он. Можешь забрать его. На меня от только ужас наводит. Но выбросить его я побоялся.
	B_GiveInvItems(self,other,ItMi_DarkScroll,1);
	AI_Output(other,self,"DIA_Hodges_DarkWeb_Done_DoIt_01_34");	//Благодарю.
	HodjesBookGive = TRUE;
	B_LogEntry(TOPIC_DarkWeb,"Я смог уговорить Ходжеса рассказать мне всю правду. Судя по всему, Лотара убил странный тип в темной одежде. И убил он его магией. Именно поэтому на земле не бьыло никаких следов борьбы. Правда сначала обездвижил, чтобы тот не смог пошевелиться. Но убийца недооценил волю паладина, тот смог разорвать магические путы и выбить свиток с заклинанием из рук нападавшего. Но было уже слишком поздно. Теперь мне надо подумать, что делать с этим свитком...");
	AI_StopProcessInfos(self);
};