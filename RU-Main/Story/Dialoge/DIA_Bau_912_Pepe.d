
instance DIA_Pepe_EXIT(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 999;
	condition = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pepe_Hallo(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = DIA_Pepe_Hallo_Condition;
	information = DIA_Pepe_Hallo_Info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int DIA_Pepe_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Pepe_Hallo_Info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(скучая) Стерегу овец! (вздыхает) И, по возможности, стараюсь держаться подальше от неприятностей.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Это не всегда возможно, да?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Да уж, особенно когда дело касается наемников. Я очень рад, что работаю здесь, на пастбище, подальше от них. Хотя и здесь не совсем безопасно.
	};
};


instance DIA_Pepe_Danger(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 2;
	condition = DIA_Pepe_Danger_Condition;
	information = DIA_Pepe_Danger_Info;
	permanent = FALSE;
	description = "А что опасного на пастбище?";
};


func int DIA_Pepe_Danger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Danger_Info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//А что опасного на пастбище?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Неподалеку бродит небольшая стая волков. Эти проклятые твари почти каждый день утаскивают одну из моих овец.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Несколько дней назад у меня было в два раза больше овец. Мне не хочется даже думать, что Онар сделает со мной, когда узнает об этом.
};


instance DIA_Pepe_WhyNotSLD(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 3;
	condition = DIA_Pepe_WhyNotSLD_Condition;
	information = DIA_Pepe_WhyNotSLD_Info;
	permanent = FALSE;
	description = "Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.";
};


func int DIA_Pepe_WhyNotSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Pepe_WhyNotSLD_Info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Да, я знаю. Я должен был сделать это. Но не сделал, черт!
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//А теперь, когда столько овец пропало, я боюсь кому-нибудь говорить об этом.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Но ты только что сказал МНЕ...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(сердито) Я уже пожалел об этом.
};


instance DIA_Pepe_KillWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 4;
	condition = DIA_Pepe_KillWolves_Condition;
	information = DIA_Pepe_KillWolves_Info;
	permanent = FALSE;
	description = "Что если я убью этих волков?";
};


func int DIA_Pepe_KillWolves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger))
	{
		return TRUE;
	};
};

func void DIA_Pepe_KillWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Что если я убью этих волков?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(насмешливо) Ты, сам? Ха ха. Я не верю в это. Я скорее поверю, что мой баран-вожак расправится с ними.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Забудь об этом. Это было всего лишь предположение. Я пойду к парням, и посмотрим, что ОНИ скажут насчет этого...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(испуганно) Подожди минутку. Хорошо, хорошо! Эээ... ты величайший воин, и ты можешь уложить сотню волков одной левой. Нет проблем!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Обычно они шныряют в лесу около пастбища. (как бы между прочим) Я думаю, их всего четверо...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_Pepe_KillWolves = LOG_Running;
	Log_CreateTopic(TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PepeWolves,LOG_Running);
	B_LogEntry(TOPIC_PepeWolves,"На овец Пепе повадились нападать волки. Я должен покончить с ними.");
};


instance DIA_Pepe_KilledWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_KilledWolves_Condition;
	information = DIA_Pepe_KilledWolves_Info;
	permanent = TRUE;
	description = "Я расправился с волками.";
};


func int DIA_Pepe_KilledWolves_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pepe_KilledWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Я расправился с волками.
	if(Npc_IsDead(PEPES_YWolf1) && Npc_IsDead(PEPES_YWolf2) && Npc_IsDead(PEPES_YWolf3) && Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(пораженно) Ты сделал это! Слава Инносу!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Но я все равно не знаю, как сказать Онару, что его овцы пропали.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(себе под нос) Это все этот чертов Булко виноват!
		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP(XP_PepeWolves);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//ты меня считаешь за идиота? Эти звери еще не все мертвы.
	};
};


instance DIA_Pepe_Bullco(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_Bullco_Condition;
	information = DIA_Pepe_Bullco_Info;
	permanent = FALSE;
	description = "Что ты сказал насчет Булко?";
};


func int DIA_Pepe_Bullco_Condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && !Npc_IsDead(Bullco) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Bullco_Info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Что ты сказал насчет Булко?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Это один из наемников. Это его работа охранять пастбище.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Но вместо этого он и его приятель Сильвио день напролет ошиваются в кухне у Теклы.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Это этот ублюдок будет виноват, если мне не заплатят за многие недели работы из-за потери овец.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Как я хотел бы набить ему морду. Но никому это не по силам. Этот парень - убийца.
	MIS_Pepe_KickBullco = LOG_Running;
	Log_CreateTopic(TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KickBullco,LOG_Running);
	B_LogEntry(TOPIC_KickBullco,"Булко плохо охраняет овец Пепе. Пепе хочет, чтобы кто-нибудь проучил его.");
};


instance DIA_Pepe_BullcoDefeated(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_BullcoDefeated_Condition;
	information = DIA_Pepe_BullcoDefeated_Info;
	permanent = FALSE;
	description = "Булко получил по заслугам.";
};


func int DIA_Pepe_BullcoDefeated_Condition()
{
	if(MIS_Pepe_KickBullco == LOG_Running)
	{
		if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pepe_BullcoDefeated_Info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Булко получил по заслугам. Я преподал ему урок.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Эта свинья заслужила это.
	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP(XP_KickBullco);
};


instance DIA_Pepe_PERM(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 6;
	condition = DIA_Pepe_PERM_Condition;
	information = DIA_Pepe_PERM_Info;
	permanent = TRUE;
	description = "Как дела, как твои овцы?";
};


func int DIA_Pepe_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Как дела, как твои овцы?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//Прекрасно. И с овцами все в порядке. Ну, с теми, что еще остались у меня, все в порядке.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Хорошо. Но могут придти другие волки. И, возможно, в большем количестве!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Я слышал странные вещи. Говорят, что на ферме Секоба появились страшные личности. Они заняли его дом.
	};
	if(Kapitel >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Я слышал, что какие-то бандиты поселились на ферме Лобарта. Кто-нибудь должен помочь ему.
	};
};


instance DIA_Pepe_Liesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 7;
	condition = DIA_Pepe_Liesel_Condition;
	information = DIA_Pepe_Liesel_Info;
	permanent = FALSE;
	description = "Могу я купить овцу?";
};


func int DIA_Pepe_Liesel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Liesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Могу я купить овцу?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Когда захочешь, если у тебя есть деньги. Овца стоит сто золотых монет.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Если ты заплатишь, можешь выбрать себе овцу. Но ты должен пообещать хорошо с ней обращаться.
};


var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 8;
	condition = DIA_Pepe_BuyLiesel_Condition;
	information = DIA_Pepe_BuyLiesel_Info;
	permanent = TRUE;
	description = "Вот сто золотых монет! Давай мне овцу.";
};

func int DIA_Pepe_BuyLiesel_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Pepe_Liesel) == TRUE) && (Pepe_SchafGekauft < 2))
	{
		return TRUE;
	};
};

func void DIA_Pepe_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Вот сто золотых монет! Давай мне овцу.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Pepe_SchafGekauft == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Хорошо. Возьми Бетси - ты найдешь ее на пастбище.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Просто скажи ей, что она должна идти за тобой. Она очень умна для овцы. Не обижай ее!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Опять? Хорошо. Возьми Бетси.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Бетси? Но последнюю овцу, что я взял у тебя, тоже звали Бетси...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Всех овец зовут Бетси.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//За исключением баранов, конечно же.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//А как их зовут?
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Брюс.
		};

		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//У тебя недостаточно золота. А я не могу продать овцу дешевле.
	};
};

instance DIA_Pepe_PICKPOCKET(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 900;
	condition = DIA_Pepe_PICKPOCKET_Condition;
	information = DIA_Pepe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Pepe_PICKPOCKET_Condition()
{
	return C_Beklauen(15,25);
};

func void DIA_Pepe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,Dialog_Back,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

instance DIA_PEPE_OGRIOB(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 10;
	condition = dia_pepe_ogriob_condition;
	information = dia_pepe_ogriob_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_ogriob_condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && (MIS_Pepe_KickBullco == LOG_SUCCESS) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void dia_pepe_ogriob_info()
{
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_01");	//Эй, приятель...(замялся) Подожди минутку.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_02");	//Чего тебе?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_03");	//Слушай, у меня тут сложилась одна неприятная ситуация. Онар с меня голову снимет, если узнает.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_04");	//Неужели у тебя опять волки овцу стащили?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_05");	//Мммм... в общем, да. Кто-то опять упер у меня овцу.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_06");	//И как же так вышло?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_07");	//Да решил я сходить в лесок по нужде. Только подошел к кустам, как вдруг там что-то зашуршало.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_08");	//А потом только чувствую... бамммс! Как будто мне наковальня Беннета на ногу упала.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_09");	//Видать, кто-то мне по ноге хорошенько так врезал. 
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_10");	//Короче, от жуткой боли я сразу вырубился, а когда очнулся, то не досчитался одной овцы.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_11");	//Кто мог такое сделать?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_12");	//К сожалению, я так ничего толком понять и не успел.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_13");	//А что ты хочешь от меня?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_14");	//Умоляю, помоги мне вернуть эту овцу! Или же просто найди ту тварь, что украла ее у меня.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_15");	//Ладно, попробую.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_16");	//Только будь осторожен: эта скотина, похоже, очень сильна!
	MIS_GRIMGASH = LOG_Running;
	Log_CreateTopic(TOPIC_GRIMGASH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_Running);
	B_LogEntry(TOPIC_GRIMGASH,"Кто-то отбил Пепе ногу и утащил одну из овец. Он не видел, кто это был, но, похоже, кто-то очень шустрый и сильный. Надо бы разобраться с этим и, по возможности, вернуть Пепе овцу.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"brokenleg");
	Wld_InsertNpc(gobbo_grandwarrior_uniq,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
};

instance DIA_BAU_912_PEPE_GRIMGASH(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_bau_912_pepe_grimgash_condition;
	information = dia_bau_912_pepe_grimgash_info;
	permanent = FALSE;
	description = "Я нашел твою овцу.";
};

func int dia_bau_912_pepe_grimgash_condition()
{
	if((MIS_GRIMGASH == LOG_Running) && Npc_IsDead(gobbo_grandwarrior_uniq) && (Npc_HasItems(other,itat_sheepgrimgash) >= 1))
	{
		return TRUE;
	};
};

func void dia_bau_912_pepe_grimgash_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_01");	//Я нашел твою овцу. Точнее, то, что от нее осталось.
	B_GiveInvItems(other,self,itat_sheepgrimgash,1);
	Npc_RemoveInvItems(self,itat_sheepgrimgash,1);
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_02");	//Вот черт! Выходит, у Онара стало на одну овцу меньше. А ты нашел вора?
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_03");	//Им оказался огромный черный гоблин. Похоже, это он долбанул тебя по ноге.
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_04");	//О Иннос! Час от часу не легче. А ты его убил?
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_05");	//Конечно! Иначе откуда, по-твоему, у меня эта овечья шкура?
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_06");	//Ладно. Он хотя бы не будет больше докучать мне и моим овцам.
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_07");	//Вот, возьми за это овечий сыр и козье молоко. 
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ItFo_Cheese,3);
	CreateInvItems(hero,ItFo_Milk,3);
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_08");	//Извини, но это все, что у меня есть.
	MIS_GRIMGASH = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_SUCCESS);
	B_LogEntry(TOPIC_GRIMGASH,"Я рассказал Пепе о гоблине, укравшем у него овцу. В знак благодарности Пепе дал мне немного сыра и несколько бутылок молока. Ладно, что же еще взять с бедного пастуха.");
};

instance DIA_PEPE_LECHENIE(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_lechenie_condition;
	information = dia_pepe_lechenie_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_lechenie_condition()
{
	if((Kapitel >= 2) && (MIS_GRIMGASH == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_pepe_lechenie_info()
{
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_01");	//Эй, подожди...
	AI_Output(other,self,"DIA_Pepe_Lechenie_01_02");	//Что еще?
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_03");	//Послушай, этот поганый гоблин так сильно отбил мне ногу, что я теперь почти не могу передвигаться!
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_04");	//Вон, погляди, - она вся синяя. И с каждым днем мне становится все хуже и хуже.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_05");	//Если так и дальше дело пойдет, то я останусь просто без ноги.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_06");	//А тогда Онар, того и гляди, просто выгонит меня с фермы взашей. 
	AI_Output(other,self,"DIA_Pepe_Lechenie_01_07");	//Тебе просто нужны хорошие лекарства.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_08");	//К сожалению, обычные зелья мне не помогают. Здесь нужно что-то особенное.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_09");	//Прошу тебя, помоги. Мне больше некого просить о помощи.
	Info_ClearChoices(dia_pepe_lechenie);
	Info_AddChoice(dia_pepe_lechenie,"Я поищу для тебя лекарство.",dia_pepe_lechenie_yes);
	Info_AddChoice(dia_pepe_lechenie,"Сам занимайся своей ногой.",dia_pepe_lechenie_no);
};

func void dia_pepe_lechenie_yes()
{
	AI_Output(other,self,"DIA_Pepe_Lechenie_yes_01_00");	//Ладно, я поищу для тебя подходящее лекарство.
	AI_Output(self,other,"DIA_Pepe_Lechenie_yes_01_01");	//Спасибо большое. Я буду ждать тебя здесь.
	MIS_LECHENIEPEPE = LOG_Running;
	Log_CreateTopic(TOPIC_LECHENIEPEPE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_Running);
	B_LogEntry(TOPIC_LECHENIEPEPE,"Пепе все еще мается со своей ногой. Он просит найти что-нибудь, что сможет залечить его рану.");
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Warg,"FP_ROAM_NW_SAGITTA_MOREMONSTER_01");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_SAGITTA_MOREMONSTER_03");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_01");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_03");
		Wld_InsertNpc(Shadowbeast,"FP_STAND_DEMENTOR_KDF_05");
	};
};

func void dia_pepe_lechenie_no()
{
	AI_Output(other,self,"DIA_Pepe_Lechenie_no_01_00");	//Сам занимайся своей ногой. Мне сейчас не до тебя.
	AI_Output(self,other,"DIA_Pepe_Lechenie_no_01_01");	//(подавленно) Ладно, прости за беспокойство.
	AI_StopProcessInfos(self);
};

instance DIA_PEPE_PLACEBO(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_placebo_condition;
	information = dia_pepe_placebo_info;
	permanent = FALSE;
	description = "Я принес тебе лекарство.";
};

func int dia_pepe_placebo_condition()
{
	if((MIS_LECHENIEPEPE == LOG_Running) && (Npc_KnowsInfo(hero,dia_sagitta_placebo)) && (Npc_HasItems(hero,ItPo_Health_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_pepe_placebo_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pepe_Placebo_01_01");	//Я принес тебе лекарство.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_02");	//Эммм... а откуда оно?
	AI_Output(other,self,"DIA_Pepe_Placebo_01_03");	//Этот эликсир сварила целительница Сагитта специально для тебя.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_04");	//Сильнейшее зелье, способное поднять на ноги даже старого больного тролля. А уж твою болячку вылечит моментально!
	AI_Output(self,other,"DIA_Pepe_Placebo_01_06");	//Зелье Сагитты? Хммм. Это действительно может сработать.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_07");	//Давай же быстрее его сюда. А то нога ноет, спасу нет.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_08");	//Вот, держи.
	B_GiveInvItems(other,self,ItPo_Health_01,1);
	B_UseItem(self,ItPo_Health_01);
	AI_Output(self,other,"DIA_Pepe_Placebo_01_09");	//Мммм... Отлично! Я уже чувствую, как уходит боль.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_10");	//Спасибо, что снова помог мне.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_11");	//Да ладно, брось! Я же не мог просто оставить тебя умирать.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_12");	//Но как бы то ни было, - вот, возьми немного золотых.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Pepe_Placebo_01_13");	//Правда, это все, что у меня есть.
	MIS_LECHENIEPEPE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_SUCCESS);
	B_LogEntry(TOPIC_LECHENIEPEPE,"Метод Сагитты помог. Пепе излечился, выпив обычное зелье. Бывает же такое.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};