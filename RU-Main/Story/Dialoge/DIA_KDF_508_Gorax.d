
instance DIA_Gorax_Kap1_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KAp1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gorax_NoEnter_PissOff(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_Gorax_NoEnter_PissOff_Condition;
	information = DIA_Gorax_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gorax_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Gorax_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Gorax_PICKPOCKET(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 888;
	condition = DIA_Gorax_PICKPOCKET_Condition;
	information = DIA_Gorax_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_Gorax_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,Dialog_Back,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
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
		CreateInvItems(self,ItKe_KlosterStore,1);
		B_GiveInvItems(self,other,ItKe_KlosterStore,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	}
	else
	{
		Print("Необходимая ловкость: 100");

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

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};


instance DIA_Gorax_HELP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_HELP_Condition;
	information = DIA_Gorax_HELP_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_HELP_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Могу я чем-нибудь помочь тебе?
};


instance DIA_Gorax_GOLD(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_GOLD_Condition;
	information = DIA_Gorax_GOLD_Info;
	permanent = TRUE;
	description = "Я принес целую кучу золота.";
};


var int DIA_Gorax_GOLD_perm;

func int DIA_Gorax_GOLD_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Я принес целую кучу золота.
	if(Npc_HasItems(other,ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(в предвкушении) Ах! Приношение Инносу. Это очень хорошо, сын мой.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Я использую твое пожертвование на благо монастыря, как того желает Иннос.
		DIA_Gorax_GOLD_perm = TRUE;
		B_GiveInvItems(other,self,ItMi_Gold,Summe_Kloster);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};


instance DIA_Addon_Gorax_DaronsStatue(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Addon_Gorax_DaronsStatue_Condition;
	information = DIA_Addon_Gorax_DaronsStatue_Info;
	permanent = TRUE;
	description = "Вот статуэтка, которую должен был принести в монастырь Дарон.";
};


func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Вот статуэтка, которую должен был принести в монастырь Дарон.
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(вздыхает) Поистине удивительно то, что такую драгоценность принес в монастырь неопытный послушник.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Это еще раз доказывает твою устремленность в служении Инносу.
		if(B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1))
		{
			Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Я перед тобой в долгу, юный послушник.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Статуэтку? Я не вижу никакой статуэтки. Принеси ее мне, и тогда я поверю твоему рассказу.
	};
};


instance DIA_Gorax_SLEEP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 4;
	condition = DIA_Gorax_SLEEP_Condition;
	information = DIA_Gorax_SLEEP_Info;
	description = "Я ищу место, где можно было бы поспать.";
};


func int DIA_Gorax_SLEEP_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Я ищу место, где можно было бы поспать.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Есть одна свободная кровать в следующей комнате. Первая дверь направо, рядом с входом. Ты можешь поспать там.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Ты можешь сложить свои вещи в один из пустых сундуков.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//И помни - тебе нельзя входить в опочивальни магов. Также без соответствующего разрешения тебе нельзя входить в библиотеку.
};


instance DIA_Gorax_Aufgabe(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe_Condition;
	information = DIA_Gorax_Aufgabe_Info;
	permanent = FALSE;
	description = "У тебя есть какое-нибудь задание для меня?";
};


func int DIA_Gorax_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//У тебя есть какое-нибудь задание для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Да, послушники хорошо поработали. А тот, кто хорошо работает, должен хорошо питаться.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Я дам тебе ключ от кладовой. Ты найдешь там баранью колбасу. Раздай ее послушникам - но раздели ее по справедливости!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//А когда закончишь с этим, можешь обратиться ко мне опять.
	CreateInvItems(self,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_Running;
	Log_CreateTopic(Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen,LOG_Running);
	B_LogEntry(Topic_GoraxEssen,"Мастер Горакс хочет, чтобы я разделил баранью колбасу из кладовой поровну среди послушников. Кроме меня, в монастыре есть еще тринадцать послушников.");
};


instance DIA_Gorax_Wurst(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_Wurst_Condition;
	information = DIA_Gorax_Wurst_Info;
	permanent = TRUE;
	description = "Я раздал колбасу.";
};


func int DIA_Gorax_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && (Mob_HasItems("WURSTTRUHE",ItFo_Schafswurst) == 0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Я раздал колбасу.

	if(Wurst_Gegeben >= 14)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//И разделил ее по справедливости. Вот, возьми эти свитки исцеления - и возвращайся к своей работе.
		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self,other,ItSc_LightHeal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Да? Я думаю, ты недостаточно ответственно относишься к своей работе.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Ты либо съел колбасу сам, либо дал кому-нибудь больше, чем ему причитается.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Послушай, так как ты новичок - и только по этой причине - я на первый раз прощу тебя. Но чтобы больше такого не повторялось, послушник!
		MIS_GoraxEssen = LOG_FAILED;
	};
};


instance DIA_Gorax_Aufgabe2(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe2_Condition;
	information = DIA_Gorax_Aufgabe2_Info;
	permanent = FALSE;
	description = "У тебя есть еще какое-нибудь поручение для меня?";
};


func int DIA_Gorax_Aufgabe2_Condition()
{
	if(((MIS_GoraxEssen == LOG_SUCCESS) || (MIS_GoraxEssen == LOG_FAILED)) && (Npc_IsDead(Orlan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe2_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//У тебя есть еще какое-нибудь поручение для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Да. Как ты знаешь, мы делаем здесь превосходное вино, и часть его продаем.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Орлан, хозяин трактира 'Мертвая Гарпия' заказал солидную партию. Мы договорились на сумму в двести сорок золотых монет.'
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Отнеси ему эти бутылки - но смотри, чтобы он не обсчитал тебя.
	B_GiveInvItems(self,other,ItFo_Wine,12);
	MIS_GoraxWein = LOG_Running;
	Log_CreateTopic(Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein,LOG_Running);
	B_LogEntry(Topic_GoraxWein,"Мастер Горакс хочет, чтобы я доставил Орлану, хозяину трактира, двенадцать бутылок вина. Они стоят двести сорок золотых монет.");
};


instance DIA_Gorax_Orlan(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_Condition;
	information = DIA_Gorax_Orlan_Info;
	permanent = TRUE;
	description = "Я отнес вино Орлану.";
};

var int DIA_Gorax_Orlan_permanent;

func int DIA_Gorax_Orlan_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_Wein) && (DIA_Gorax_Orlan_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Я отнес вино Орлану.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//И? Ты получил двести сорок золотых монет?
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices(DIA_Gorax_Orlan);
		Info_AddChoice(DIA_Gorax_Orlan,"Он надул меня! (Отдать 100 монет)",DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan,"Я принес золото. (Отдать 240 монет)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Он надул меня!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Ты продал ему вино дешевле? Ох, нет! И почему я послал ТЕБЯ?!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Ты совершенно ни на что не способен! Убирайся с глаз моих!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	MIS_GoraxWein = LOG_FAILED;
	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Я принес золото.
	if(B_GiveInvItems(other,self,ItMi_Gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Превосходно. Ты проявляешь некоторые способности. Вот, возьми в качестве вознаграждения свиток исцеления. А теперь иди и займись каким-нибудь делом.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxWein);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Но ты уже потратил часть этих денег, да? Ты ничтожество - пошел прочь!
		MIS_GoraxWein = LOG_FAILED;
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
	Info_ClearChoices(DIA_Gorax_Orlan);
};

instance DIA_Gorax_Wineberrys(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Condition;
	information = DIA_Gorax_Wineberrys_Info;
	permanent = FALSE;
	description = "Еще будут поручения, мастер?";
};

func int DIA_Gorax_Wineberrys_Condition()
{
	if((MIS_GoraxWein == LOG_SUCCESS) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wineberrys_01_00");	//Еще будут поручения, мастер?
	AI_Output(self,other,"DIA_Gorax_Wineberrys_01_01");	//Да. Необходимо собрать урожай винограда, который мы выращиваем тут в монастыре.
	AI_Output(self,other,"DIA_Gorax_Wineberrys_01_02");	//Мне нужно не менее десяти гроздей. Займись этим, послушник!
	MIS_GoraxWineberrys = LOG_Running;
	Log_CreateTopic(Topic_GoraxWineberrys,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_Running);
	B_LogEntry(Topic_GoraxWineberrys,"Мастер Горакс попросил меня собрать урожай винограда, который они выращивают в монастыре. Ему нужно не менее десяти гроздей.");
};

instance DIA_Gorax_Wineberrys_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Done_Condition;
	information = DIA_Gorax_Wineberrys_Done_Info;
	permanent = FALSE;
	description = "Я принес виноград.";
};

func int DIA_Gorax_Wineberrys_Done_Condition()
{
	if((MIS_GoraxWineberrys == LOG_Running) && (Npc_HasItems(hero,ITFO_WINEBERRYS) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorax_Wineberrys_Done_01_00");	//Я принес виноград.
	AI_Output(self,other,"DIA_Gorax_Wineberrys_Done_01_01");	//Отлично! Тогда, если ты не против, я заберу его.
	AI_Output(other,self,"DIA_Gorax_Wineberrys_Done_01_02");	//Конечно, мастер. Вот он.
	B_GiveInvItems(other,self,ITFO_WINEBERRYS,10);
	Npc_RemoveInvItems(self,ITFO_WINEBERRYS,10);
	AI_Output(self,other,"DIA_Gorax_Wineberrys_Done_01_03");	//Хорошая работа! Уверен, что Иннос отметит твои старания на благо нашего монастыря.
	MIS_GoraxWineberrys = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_SUCCESS);
	B_LogEntry(Topic_GoraxWineberrys,"Я принес мастеру Гораксу собранный виноград.");
};

instance DIA_Gorax_JOB(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 35;
	condition = DIA_Gorax_JOB_Condition;
	information = DIA_Gorax_JOB_Info;
	permanent = FALSE;
	description = "А что входит в твои обязанности здесь?";
};

func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//А что входит в твои обязанности здесь?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Мои обязанности многочисленны и разнообразны. Я не только управляющий, но также и казначей.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Кроме того, я заведую винным погребом, а также на моих плечах лежит обеспечение монастыря съестными припасами.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Поэтому, если тебе что-нибудь нужно, ты всегда можешь обратиться ко мне и получить все необходимое - за скромное пожертвование, конечно.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Мастер Горакс в монастыре может предоставить мне все, что мне нужно.");
};


instance DIA_Gorax_TRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_TRADE_Condition;
	information = DIA_Gorax_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужно кое-что...";
};

func int DIA_Gorax_TRADE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Gorax_JOB) == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Мне нужно кое-что...
	B_GiveTradeInv(self);
};

instance DIA_Gorax_KDF(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 5;
	condition = DIA_Gorax_KDF_Condition;
	information = DIA_Gorax_KDF_Info;
	permanent = FALSE;
	description = "Мне нужно место для сна.";
};


func int DIA_Gorax_KDF_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Мне нужно место для сна.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//У нас есть свободная комната справа отсюда. Вот, возьми ключ. Там ты найдешь все, что тебе может понадобиться.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	Wld_InsertItem(ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_Gorax_Kap2_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap3_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_KILLPEDRO(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_KILLPEDRO_Condition;
	information = DIA_Gorax_KILLPEDRO_Info;
	important = TRUE;
};


func int DIA_Gorax_KILLPEDRO_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Подожди, наемник. Мне нужно поговорить с тобой.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Чего ты хочешь?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Монастырю необходимо решить очень деликатную проблему.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//В настоящий момент, похоже, все не доверяют друг другу. И к тому же этот случай с Педро, это очень... (сглатывает)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//У меня есть поручение для тебя от первосвященников. Ты не являешься членом Братства Огня, и, следовательно, ты единственный, кто может помочь нам в решении этой проблемы.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Но я должен предупредить тебя. Если я дам тебе это поручение, ты будешь обязан выполнить его. Когда ты узнаешь, в чем оно заключается, у тебя уже не будет выбора. Ты понимаешь это?
	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Забудь об этом. Это слишком рискованное предприятие для меня.",DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Скажи мне, чего ты хочешь.",DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Забудь об этом. Это слишком рискованное предприятие для меня.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//Хорошо, в таком случае забудь о том, что я говорил.
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Скажи мне, чего ты хочешь.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Хорошо. Тогда слушай внимательно, дважды повторять я не буду.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Серпентес хочет, чтобы ты убил Педро за его предательство.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Когда ты выполнишь эту задачу, тебе немедленно будет выдано вознаграждение.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Я ничего тебе не говорил. И ты ничего не слышал. Понятно?
	MIS_Gorax_KillPedro = LOG_Running;
	Log_CreateTopic(Topic_Gorax_KillPedro,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_Running);
	B_LogEntry(Topic_Gorax_KillPedro,"Горакс сказал мне, что Серпентес хочет, чтобы я убил предателя Педро, если я повстречаюсь с ним.");
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap4_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap5_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_ARMOR(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor_condition;
	information = dia_gorax_armor_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_armor_condition()
{
	if(Npc_KnowsInfo(other,DIA_Gorax_JOB) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor_info()
{
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_01");	//Приветствую тебя, брат! Поскольку теперь ты один из нас, то я могу тебе предложить некоторые особенные товары. Например, эту робу магов Огня.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_01A");	//Она немного лучше той, что дал тебе Пирокар.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_02");	//Правда, ты должен будешь внести небольшое пожертвование для нашего монастыря.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_03");	//Обращайся ко мне, если захочешь ее купить.
};


instance DIA_GORAX_ARMOR01(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor01_condition;
	information = dia_gorax_armor01_info;
	permanent = FALSE;
	description = "Продай мне робу.";
};


func int dia_gorax_armor01_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor01_info()
{
	AI_Output(other,self,"DIA_Gorax_Armor01_15_01");	//Продай мне робу.
	AI_Output(self,other,"DIA_Gorax_Armor01_14_01");	//Поверь, ты не пожалеешь об этом.
	AI_Output(self,other,"DIA_Gorax_Armor01_14_02");	//Подожди здесь, я должен принести ее из подвала.
	AI_GotoWP(self,"NW_MONASTERY_STAIRS_05");
	AI_GotoWP(self,"NW_MONASTERY_WINEMAKER_02");
	AI_GotoFP(self,"FP_STAND_GUARDING_WINE_01");
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Gorax_Armor01_14_03");	//Вот она. Смотри - правда хороша?
};


var int gorax_kdflbought;

instance DIA_GORAX_KDFL(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_kdfl_condition;
	information = dia_gorax_kdfl_info;
	permanent = TRUE;
	description = "Купить робу Мага Огня. (Цена: 2500 монет)";
};


func int dia_gorax_kdfl_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor01) && (GORAX_KDFLBOUGHT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_kdfl_info()
{
	AI_Output(other,self,"DIA_Gorax_KDFL_15_01");	//Продай мне эту робу.

	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_KDF_M))
	{
		AI_Output(self,other,"DIA_Gorax_KDFL_12_01");	//Вот, теперь она твоя.
		B_GiveInvItems(self,other,itar_kdf_m,1);
		GORAX_KDFLBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_KDFL_12_02");	//Сожалею, но я не могу дать тебе ее безвозмездно.
	};
};


var int goraxmood;
var int goraxminprice;

instance DIA_GORAX_TRADEMEWINE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_trademewine_condition;
	information = dia_gorax_trademewine_info;
	permanent = FALSE;
	description = "Меня прислал Лютеро.";
};


func int dia_gorax_trademewine_condition()
{
	if(MIS_CHURCHDEAL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gorax_trademewine_choices()
{
	Info_ClearChoices(dia_gorax_trademewine);
	Info_AddChoice(dia_gorax_trademewine,"По рукам!",dia_gorax_trademewine_deal);
	Info_AddChoice(dia_gorax_trademewine,"(посмотреть текущую цену сделки)",dia_gorax_trademewine_current);
	Info_AddChoice(dia_gorax_trademewine,"(посмотреть настроение Горакса)",dia_gorax_trademewine_mood);

	if(GORAXCURRENTPRICE > 50)
	{
		Info_AddChoice(dia_gorax_trademewine,"Торговаться (повысить цену на 10% от текущей)",dia_gorax_trademewine_up10);
		Info_AddChoice(dia_gorax_trademewine,"Торговаться (повысить цену на 5% от текущей)",dia_gorax_trademewine_up5);
		Info_AddChoice(dia_gorax_trademewine,"Торговаться (сбросить цену на 10% от текущей)",dia_gorax_trademewine_down10);
		Info_AddChoice(dia_gorax_trademewine,"Торговаться (сбросить цену на 5% от текущей)",dia_gorax_trademewine_down5);
	};
};

func void dia_gorax_trademewine_info()
{
	GORAXCURRENTPRICE = 600;
	GORAXMOOD = 75;
	AI_Output(other,self,"DIA_Gorax_TradeMeWine_01_00");	//Меня прислал Лютеро. Я должен у тебя купить свежую партию монастырского вина.
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_04");	//Вино уже готово к отправке. Осталось лишь выяснить, сколько уважаемый господин Лютеро готов заплатить за него.
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_06");	//Хммм. Ну, думаю, шести сотен золотых монет вполне должно хватить...(хитро)
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_07");	//Что скажешь?
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up10()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 10) / 100);
	GORAXMOOD = GORAXMOOD + Hlp_Random(20);
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100;
	};
	concatText = ConcatStrings("Текущая цена за вино: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," золотых монет");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up5()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 5) / 100);
	GORAXMOOD = GORAXMOOD + Hlp_Random(10);
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100;
	};
	concatText = ConcatStrings("Текущая цена за вино: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," золотых монет");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_nodeal()
{
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_00");	//Извини, но я больше не намерен с тобой торговаться.
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_01");	//Предложить мне такую цену за вино - да это просто оскорбительно!
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_02");	//Я что, по-твоему, похож на идиота?
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_05");	//Так можешь и передать Лютеро!
	B_LogEntry(TOPIC_CHURCHDEAL,"Я перегнул палку, торгуясь с Гораксом. Мои последние условия сделки показались ему слишком оскорбительными и он отказался от дальнейшего ее обсуждения. Придется сообщить Лютеро эту неприятную новость.");
	GORAXSNOTRADEMEWINE = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gorax_trademewine_down10()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 10) / 100);
	currentmood = Hlp_Random(14);

	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings("Текущая цена за вино: ",IntToString(GORAXCURRENTPRICE));
		concatText = ConcatStrings(concatText," золотых монет");
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_down5()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 5) / 100);
	currentmood = Hlp_Random(7);
	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings("Текущая цена за вино: ",IntToString(GORAXCURRENTPRICE));
		concatText = ConcatStrings(concatText," золотых монет");
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_current()
{
	var string concatText;
	concatText = ConcatStrings("Текущая цена за вино: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," золотых монет");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_mood()
{
	var string concatText;

	if(GORAXMOOD >= 100)
	{
		concatText = "Настроение Горакса: Лучше не бывает!";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 90)
	{
		concatText = "Настроение Горакса: Отличное";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 80)
	{
		concatText = "Настроение Горакса: Замечательное";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 70)
	{
		concatText = "Настроение Горакса: Хорошее";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 60)
	{
		concatText = "Настроение Горакса: Приподнятое";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 50)
	{
		concatText = "Настроение Горакса: Нормальное";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 40)
	{
		concatText = "Настроение Горакса: Ниже среднего";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 30)
	{
		concatText = "Настроение Горакса: Недовольное";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 20)
	{
		concatText = "Настроение Горакса: Плохое";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 10)
	{
		concatText = "Настроение Горакса: Паршивое";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 5)
	{
		concatText = "Настроение Горакса: Ужасное";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD > 0)
	{
		concatText = "Настроение Горакса: Критическое!";
		AI_PrintClr(concatText,177,58,17);
	};

	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_deal()
{
	AI_Output(other,self,"DIA_Gorax_TradeMeWine_Deal_01_00");	//По рукам! Вот твои деньги за вино.

	if(Npc_HasItems(hero,ItMi_Gold) >= GORAXCURRENTPRICE)
	{
		B_GiveInvItems(other,self,ItMi_Gold,GORAXCURRENTPRICE);
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_01");	//С тобой приятно иметь дело.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_02");	//Вот, держи - двадцать пять бутылок превосходнейшего монастырского вина с моими наилушими пожеланиями для господина Лютеро!
		B_GiveInvItems(self,other,ItFo_Wine,25);
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_03");	//А теперь извини - мне пора возвращаться к своим повседневным обязанностям.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_05");	//Да пребудет с тобой Иннос!
		B_LogEntry(TOPIC_CHURCHDEAL,"Я купил вино у Горакса. Теперь мне нужно отнести его Лютеро.");
		GORAXSTRADEMEWINE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_06");	//Но у тебя же недостаточно золота!
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_07");	//Ты что, вздумал надуть меня?
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_09");	//Я никому не позволю водить меня вокруг пальца!
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_10");	//Так что можешь забыть о нашем соглашении.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_11");	//Вино я тебе не продам. Так можешь и передать Лютеро!
		B_LogEntry(TOPIC_CHURCHDEAL,"Я договорился с Гораксом о цене на вино, но в самый последний момент оказалось, что у меня не хватает денег на эту сделку. Горакс подумал, что я хочу его одурачить и отказался от дальнейших обсуждений покупки. Придется сообщить Лютеро эту неприятную новость.");
		GORAXSNOTRADEMEWINE = TRUE;
		GORAXSNOTENOUGHTGOLD = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORAX_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = dia_gorax_runemagicnotwork_condition;
	information = dia_gorax_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_gorax_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorax_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Gorax_RuneMagicNotWork_01_01");	//Нет, по какой-то непонятной причине я не могу их использовать!
	AI_Output(self,other,"DIA_Gorax_RuneMagicNotWork_01_03");	//Похоже, у других магов Огня та же проблема.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных Магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_GORAX_GoldForGorax(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_GoldForGorax_condition;
	information = DIA_GORAX_GoldForGorax_info;
	permanent = FALSE;
	description = "Я принес пожертвования от Дарона.";
};

func int DIA_GORAX_GoldForGorax_condition()
{
	if((MIS_DARON_GIVEGOLD == LOG_Running) && (Npc_HasItems(other,itmi_daron_suma) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GORAX_GoldForGorax_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GORAX_GoldForGorax_01_00");	//Я принес пожертвования от Дарона.
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_01");	//Отлично! Я уже давно жду их.
	AI_Output(other,self,"DIA_GORAX_GoldForGorax_01_02");	//Тогда возьми эту сумку. Тут все золото, что ему удалось собрать.
	B_GiveInvItems(other,self,itmi_daron_suma,1);
	Npc_RemoveInvItems(self,itmi_daron_suma,1);
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_03");	//Ну что же, судя по весу, сумма тут приличная.
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_04");	//Благодарю тебя за оказанную нам помощь. Да осветит Иннос твой путь!
	B_LogEntry(TOPIC_DARON_GIVEGOLD,"Я доставил сумку с пожертвованиями мастеру Гораксу.");
	Log_CreateTopic(TOPIC_DARON_GIVEGOLD,LOG_SUCCESS);
	MIS_DARON_GIVEGOLD = LOG_SUCCESS;
};

var int COUNTER_GORAX_PAPERS;

instance DIA_GORAX_FIND_PAPERS(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = dia_gorax_find_papers_condition;
	information = dia_gorax_find_papers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_find_papers_condition()
{
	if((GORAXSTRADEMEWINE == TRUE) && (MIS_GORAX_FIND_PAPERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_find_papers_info()
{
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_01");	//Постой. Я хочу попросить тебя об одной услуге. Ты ведь любишь золото, не так ли?
	AI_Output(other,self,"DIA_Gorax_Find_Papers_01_02");	//Ну, кто ж его не любит.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_03");	//Наш монастырь славится своим вином на весь остров, а я отвечаю за его приготовление и качество.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_04");	//Сейчас меня интересуют редкие рецепты вин, которые могут оказать полезный эффект при их потреблении.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_05");	//И, как мне стало известно, в городе сейчас можно добыть пару подобных рецептов.
	AI_Output(other,self,"DIA_Gorax_Find_Papers_01_06");	//Если мне попадутся редкие рецепты, то я обязательно принесу их тебе.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_07");	//Я рассчитываю на тебя. И конечно же, моя благодарность не будет знать границ.
	MIS_GORAX_FIND_PAPERS = LOG_Running;
	Log_CreateTopic(TOPIC_GORAX_FIND_PAPERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_Running);
	B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Мастер Горакс хочет научиться приготовлению особых сортов вин. Моя задача - снабжать его новыми рецептами, которые я смогу найти, путешествуя по острову.");
};


instance DIA_GORAX_FIND_PAPERS_OK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_FIND_PAPERS_OK_condition;
	information = DIA_GORAX_FIND_PAPERS_OK_info;
	permanent = TRUE;
	important = FALSE;
	description = "Я принес тебе рецепты вин.";
};

func int DIA_GORAX_FIND_PAPERS_OK_condition()
{
	if((MIS_GORAX_FIND_PAPERS == LOG_Running) && ((Npc_HasItems(hero,rezepturen) >= 1) || (Npc_HasItems(hero,rezepturen2) >= 1) || (Npc_HasItems(hero,itwr_glintvein) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_GORAX_FIND_PAPERS_OK_info()
{
	AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_01");	//Я принес тебе рецепты вин.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_02");	//Отлично! Какие именно?

	if(Npc_HasItems(hero,rezepturen) >= 1)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_03");	//Тут рецепт бальзама провидения.
		B_GiveInvItems(other,self,rezepturen,1);
		Npc_RemoveInvItems(self,rezepturen,1);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_04");	//Выкупить его было совсем непросто!
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_05");	//Бальзам? Как интересно. Хотя это и не совсем вино, но, тем не менее.
		COUNTER_GORAX_PAPERS += 1;

		if((hero.guild != GIL_KDF) && (hero.guild != GIL_KDM) && (hero.guild != GIL_GUR) && (hero.guild != GIL_KDW))
		{
			AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_06");	//Вот, возьми в награду эти волшебные свитки. Уверен, они тебе очень пригодятся.
			B_GiveInvItems(self,other,ItSc_Firestorm,2);
			B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Я принес Гораксу рецепт вина 'Бальзам провидения' и получил в награду пару свитков. Что ж, неплохо, учитывая что рецепты уже и так принесли мне пользу.");
		}
		else
		{
			AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_07");	//Вот, возьми в награду эти зелья маны. Уверен, однажды они спасут тебе жизнь, когда магическая энергия будет на исходе.
			B_GiveInvItems(self,other,ItPo_Mana_02,3);
			B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Я принес Гораксу рецепт вина 'Бальзам провидения' и получил в награду эликсиры маны. Что ж, неплохо, учитывая что рецепты уже и так принесли мне пользу.");
		};
	};
	if(Npc_HasItems(hero,rezepturen2) >= 1)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_08");	//Вот рецепт вина забвения.
		B_GiveInvItems(other,self,rezepturen2,1);
		Npc_RemoveInvItems(self,rezepturen2,1);
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_09");	//(задумчиво) Какой странный состав ингредиентов.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_10");	//Едва ли мы сможем приготовить такое в ближайшее время. Но все равно я благодарю тебя за труды.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_11");	//Вот, возьми этот свиток вызова огненного голема в качестве награды.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_12");	//Используй его только тогда, когда почувствуешь в себе достаточно силы, иначе это может плохо закончиться.
		B_GiveInvItems(self,other,itsc_sumfiregol,1);
		COUNTER_GORAX_PAPERS += 1;
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Я принес Гораксу рецепт 'Вина забвения' и получил в награду свиток вызова огненного голема.");
	};
	if(Npc_HasItems(hero,itwr_glintvein) >= 1)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_13");	//Это рецепт приготовления глинтвейна.
		B_GiveInvItems(other,self,itwr_glintvein,1);
		Npc_RemoveInvItems(self,itwr_glintvein,1);
		COUNTER_GORAX_PAPERS += 1;
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_14");	//(удивленно) Откуда он у тебя?
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_15");	//Это долгая история...
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_16");	//Что ж, пусть это и не совсем то, что мне нужно, но я сдержу свое слово. 
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_17");	//Держи свою награду.
		B_GiveInvItems(self,other,ItMi_Gold,250);
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Я принес Гораксу рецепт приготовления глинтвейна. Не сказать, что он был слишком впечатлен, но все же дал мне немного золота за труды.");
	};
	if(COUNTER_GORAX_PAPERS >= 3)
	{
		hero.lp = hero.lp + 1;
		AI_Print("+ 1 к очкам обучения");
		Snd_Play("LevelUp");
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_19");	//Что же, - полагаю, теперь мы значительно расширили наш ассортимент вин, и других рецептов нам пока больше не требуется.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_20");	//Я благодарю тебя от лица монастыря за твою помощь.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_21");	//И да пребудет с тобой Иннос!
		MIS_GORAX_FIND_PAPERS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_SUCCESS);
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Я полностью выполнил поручение мастера Горакса, а он в свою очередь благословил меня на новые свершения.");
	};
};

instance DIA_Gorax_LoaParty(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Condition;
	information = DIA_Gorax_LoaParty_Info;
	permanent = FALSE;
	description = "Мне нужно какое-нибудь особенное вино.";
};

func int DIA_Gorax_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Info()
{
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_01");	//Мне нужно какое-нибудь особенное вино.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_02");	//Что ты имеешь ввиду?!
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_03");	//У меня все вино особенное, потому как оно делается из того сорта винограда, который произрастает только в наших виноградниках. 
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_04");	//Ты меня не понял. Под словом особенное я имел ввиду то вино, которое ты бы не выставил на продажу, а приберег бы для себя. 
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_05");	//Ах вот оно что. Хммм...(задумчиво) Да, пожалуй у меня есть один такой особенный экземпляр.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_06");	//Но ты должен понимать, что и цена на него будет особенной.
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_07");	//Сколько?
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_08");	//Две тысячи золотых монет! И если у тебя нет таких денег, то лучше не трать мое и свое время попусту.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_09");	//Все равно дешевле я тебе его не отдам.
	B_LogEntry(TOPIC_LoaSecret,"Горакс может продать мне особенное вино. Но это будет стоить мне две тысячи золотых монет.");
};

instance DIA_Gorax_LoaParty_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Done_Condition;
	information = DIA_Gorax_LoaParty_Done_Info;
	permanent = FALSE;
	description = "Держи свое золото.";
};

func int DIA_Gorax_LoaParty_Done_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gorax_LoaParty) == TRUE) && (MakeLoaParty == TRUE) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Gorax_LoaParty_Done_01_01");	//Держи свое золото.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Gorax_LoaParty_Done_01_02");	//Отлично... Теперь эти две бутылки прекраснейшего Эверлюса твои!
	B_GiveInvItems(self,other,ItMi_LoaWine,2);
	AI_Output(other,self,"DIA_Gorax_LoaParty_Done_01_03");	//Надеюсь, оно стоит этих денег.
	AI_Output(self,other,"DIA_Gorax_LoaParty_Done_01_04");	//Стоит, не сомневайся. Лучшего вина тебе на этом острове не найти.
	B_LogEntry(TOPIC_LoaSecret,"Я купил у Горакса дорогое вино для нашего пикника.");
	LoaPartyWine = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret,"Теперь можно вернуться к Лоа и обсудить с ней остальные моменты предстоящего отдыха.");
	};

	AI_StopProcessInfos(self);
};