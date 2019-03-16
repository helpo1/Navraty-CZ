
instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_910_Maria;
	nr = 999;
	condition = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maria_Hallo(C_Info)
{
	npc = BAU_910_Maria;
	nr = 1;
	condition = DIA_Maria_Hallo_Condition;
	information = DIA_Maria_Hallo_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Maria_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Я жена Онара, Мария.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Что тебе нужно здесь?
};


instance DIA_Maria_Umsehen(C_Info)
{
	npc = BAU_910_Maria;
	nr = 2;
	condition = DIA_Maria_Umsehen_Condition;
	information = DIA_Maria_Umsehen_Info;
	permanent = FALSE;
	description = "Я просто хотел посмотреть, как вы живете...";
};


func int DIA_Maria_Umsehen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Я просто хотел посмотреть, как вы живете...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//Когда столько людей живет на ферме, даже в доме покоя не найдешь!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Они так и лезут сюда.
};


instance DIA_Maria_Soeldner(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = DIA_Maria_Soeldner_Condition;
	information = DIA_Maria_Soeldner_Info;
	permanent = FALSE;
	description = "Тебя беспокоят наемники?";
};


func int DIA_Maria_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Тебя беспокоят наемники?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Ох, забудь о том, что я только что сказала - с тех пор, как вы здесь, жить здесь стало значительно безопаснее.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Ох. Ну, зато с тех пор как пришли наемники, хотя бы на ферме стало безопаснее.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Когда мы еще были сами по себе, сюда постоянно приходили стражники из города и грабили нас.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Они забирали большую часть урожая. И овец тоже. И ничего не давали нам взамен.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Некоторые из них даже воровали, что плохо лежит.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Только не пойми меня неверно, солдат. Я знаю, что не все вы такие.
	};
};


instance DIA_Maria_Mission(C_Info)
{
	npc = BAU_910_Maria;
	nr = 4;
	condition = DIA_Maria_Mission_Condition;
	information = DIA_Maria_Mission_Info;
	permanent = FALSE;
	description = "А что они украли у тебя?";
};


func int DIA_Maria_Mission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Soeldner) && (MIS_Maria_BringPlate != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//А что они украли у тебя?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//В основном золото и серебро. Они даже забрали мой свадебный подарок. Золотую тарелку.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Ручаюсь, она сейчас пылится в сундуке у какого-нибудь городского стражника.
	};
	MIS_Maria_BringPlate = LOG_Running;
};


instance DIA_Maria_BringPlate(C_Info)
{
	npc = BAU_910_Maria;
	nr = 5;
	condition = DIA_Maria_BringPlate_Condition;
	information = DIA_Maria_BringPlate_Info;
	permanent = FALSE;
	description = "Я принес золотую тарелку. Это не твоя?";
};


func int DIA_Maria_BringPlate_Condition()
{
	if(Npc_HasItems(other,ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info()
{
	B_GiveInvItems(other,self,ItMi_MariasGoldPlate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Я принес золотую тарелку. Это не твоя?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Да! Это она! Огромное спасибо тебе!
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP(XP_Maria_Teller);
};


var int Maria_Belohnung;

instance DIA_Maria_Belohnung(C_Info)
{
	npc = BAU_910_Maria;
	nr = 6;
	condition = DIA_Maria_Belohnung_Condition;
	information = DIA_Maria_Belohnung_Info;
	permanent = TRUE;
	description = "А как насчет моего вознаграждения?";
};


func int DIA_Maria_Belohnung_Condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (Maria_Belohnung == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//А как насчет моего вознаграждения?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,DIA_Onar_HowMuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Ты работаешь наемником на моего мужа, да?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Точно.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Сколько мой муж платит тебе?
		B_Say_Gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//Этого недостаточно. Иди к нему и скажи, чтобы он платил тебе больше.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//Ты думаешь, он послушает?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Он знает, что будет, если не послушает. Поверь мне.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Ты хочешь стать наемником на этой ферме?
		Info_ClearChoices(DIA_Maria_Belohnung);
		Info_AddChoice(DIA_Maria_Belohnung,"Вообще-то нет.",DIA_Maria_Belohnung_Gold);
		Info_AddChoice(DIA_Maria_Belohnung,"Да.",DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Maria_Belohnung = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Вот, возьми это. Ты заслужил.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Вообще-то нет.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Maria_Belohnung = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Тогда возьми это золото в качестве награды. Ты заслужил его.
	Info_ClearChoices(DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Да.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Хорошо, если ты будешь работать здесь, я прослежу, чтобы ты получал хорошее жалование.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Зайди ко мне, когда обсудишь размер жалования с моим мужем.
	Info_ClearChoices(DIA_Maria_Belohnung);
};


instance DIA_Maria_AboutOnar(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = DIA_Maria_AboutOnar_Condition;
	information = DIA_Maria_AboutOnar_Info;
	permanent = FALSE;
	description = "Расскажи мне об Онаре.";
};


func int DIA_Maria_AboutOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Расскажи мне об Онаре.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Он хороший человек. Немного сварливый и очень раздражительный, но у нас у всех есть свои недостатки.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Я спросила своего мужа - 'Почему ты позволяешь солдатам из города так обращаться с собой?'
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'Сделай же что-нибудь', - сказала я.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//И он нанял наемников. А теперь мне кажется, что мы ведем войну.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Но если подумать, мы ведь действительно воюем, разве нет?
};


instance DIA_Maria_PERM(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = DIA_Maria_PERM_Condition;
	information = DIA_Maria_PERM_Info;
	permanent = TRUE;
	description = "Что интересного было в последнее время?";
};


func int DIA_Maria_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Что интересного было в последнее время?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Мимо прошли паладины.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Сначала мы подумали, что они собираются напасть на нашу ферму, но они прошли мимо, в Долину Рудников.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Две ночи назад Василий поймал вора. А так - все спокойно!
	};
	if((Kapitel == 4) || (Kapitel == 5))
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//С тех пор, как часть наемников ушла, здесь стало намного тише.
	};
	if(Kapitel == 6)
	{
		if(BIGBATTLEBACKPOSITION == TRUE)
		{
			AI_Output(self,other,"DIA_Maria_PERM_17_05");	//После той битвы за нашу ферму, все вроде бы успокоилось.
		}
		else
		{
			AI_Output(self,other,"DIA_Maria_PERM_17_06");	//Сейчас всех интересует только одно - когда орки решат пожаловать на нашу ферму!
			AI_Output(self,other,"DIA_Maria_PERM_17_07");	//Я и представить себе боюсь, что в таком случае будет со всеми нами.
		};
	};
};


instance DIA_Maria_PICKPOCKET(C_Info)
{
	npc = BAU_910_Maria;
	nr = 900;
	condition = DIA_Maria_PICKPOCKET_Condition;
	information = DIA_Maria_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Maria_PICKPOCKET_Condition()
{
	return C_Beklauen(60,110);
};

func void DIA_Maria_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
	Info_AddChoice(DIA_Maria_PICKPOCKET,Dialog_Back,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maria_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};

func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};


instance DIA_MARIA_LEENURSE(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = dia_maria_leenurse_condition;
	information = dia_maria_leenurse_info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int dia_maria_leenurse_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_neworders) && (LEERECOVERED == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_leenurse_info()
{
	AI_Output(other,self,"DIA_Maria_LeeNurse_01_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_01");	//Разве не видишь? Ухаживаю за раненым.
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_02");	//Иначе кто, по-твоему, будет это делать?
	AI_Output(other,self,"DIA_Maria_LeeNurse_01_03");	//Все ясно. И как здоровье Ли?
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_04");	//Пока еще неважно. Его раны оказались достаточно серьезными, хотя и не смертельными.
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_05");	//Но, думаю, в скором времени он все-таки должен будет поправиться.
};

instance DIA_MARIA_ONARPASS(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = dia_maria_onarpass_condition;
	information = dia_maria_onarpass_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_maria_onarpass_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CRYPT_05") && (ONARTOMM1 == 5) && !Npc_IsDead(BAU_910_Maria) && !Npc_IsDead(BAU_911_Elena))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_maria_onarpass_info()
{
	AI_Output(self,other,"DIA_Maria_Onarpass_17_01");	//Вот мы и пришли! Держи немного золота за хлопоты.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Maria_Onarpass_17_02");	//Можешь возвращаться к Онару. Я думаю, вам есть о чем поговорить.
	ONARTOMM1 = 6;
};

instance DIA_MARIA_TOWER(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = dia_maria_tower_condition;
	information = dia_maria_tower_info;
	permanent = FALSE;
	description = "Как обстоят дела на ферме?";
};

func int dia_maria_tower_condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_tower_info()
{
	AI_Output(other,self,"DIA_Maria_Tower_15_00");	//Здравствуй! Давно мы с тобой не виделись. Как обстоят дела на ферме?
	AI_Output(self,other,"DIA_Maria_Tower_17_01");	//О, это ты! Очень рада тебя видеть.
	AI_Output(self,other,"DIA_Maria_Tower_17_02");	//В целом, у нас все неплохо. Единственная проблема – странные личности в черных накидках, которые теперь везде и всюду.
	AI_Output(self,other,"DIA_Maria_Tower_17_03");	//Еще недавно, как я слышала, целый отряд их жил в башне рядом с нашей фермой, пока кто-то не перебил их всех.
	AI_Output(self,other,"DIA_Maria_Tower_17_04");	//Да простит меня Иннос, но, если честно, мне стало легче после этого.
	AI_Output(self,other,"DIA_Maria_Tower_17_05");	//Что-то нехорошее ощущалось в этих людях, и мне спокойнее, зная, что они мертвы.
	AI_Output(other,self,"DIA_Maria_Tower_15_06");	//А Онар ничего не предпринимал по этому поводу?
	AI_Output(self,other,"DIA_Maria_Tower_17_07");	//Мой муж-то? Нет. Он только ворчал, что подобное соседство пугает крестьян, и те хуже работают.
	AI_Output(self,other,"DIA_Maria_Tower_17_08");	//Вообще нам от этой башни одни проблемы. Сначала бандиты там жили, потом эти жуткие личности.
	AI_Output(other,self,"DIA_Maria_Tower_15_09");	//А вы не думали навести там порядок? Снова занять ее, обустроить, поставить охрану?
	AI_Output(self,other,"DIA_Maria_Tower_17_10");	//Нет, что ты! (Усмехается) Это было бы здорово, но мой муж на такое никогда не пойдет!
	AI_Output(self,other,"DIA_Maria_Tower_17_11");	//Это же сколько денег потребуется. А какой доход от нее может быть? Только одни издержки.
	AI_Output(self,other,"DIA_Maria_Tower_17_12");	//Вот если бы кто-нибудь другой этим занялся…
	AI_Output(other,self,"DIA_Maria_Tower_15_13");	//А как бы ты отнеслась к тому, если бы я взял это дело в свои руки?
	AI_Output(self,other,"DIA_Maria_Tower_17_14");	//Ты? (Удивленно) Но откуда у тебя время и деньги на это? И зачем тебе такая морока?
	Info_ClearChoices(dia_maria_tower);
	Info_AddChoice(dia_maria_tower,"Я хочу жить там.",dia_maria_tower_win);
	Info_AddChoice(dia_maria_tower,"Я хочу оборудовать там лагерь.",dia_maria_tower_fail_a);
	Info_AddChoice(dia_maria_tower,"У меня свои интересы.",dia_maria_tower_fail_b);
};

func void dia_maria_tower_win()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Maria_Tower_win_15_00");	//Ну, за время своих странствий я сумел скопить немного денег.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_01");	//Кроме того, у меня нет дома, а эта башня кажется мне довольно неплохим жильем, хоть и опасным.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_02");	//Я мог бы позаботиться об ее охране, но боюсь, что Онар не разрешит мне там поселиться.
	AI_Output(self,other,"DIA_Maria_Tower_win_17_03");	//Ооо, ну раз так, я обязательно поговорю с ним.
	AI_Output(self,other,"DIA_Maria_Tower_win_17_04");	//Ты - хороший человек, и я уверена, что в твоих руках там наконец-то все наладится. Хоть и опасная эта затея.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_05");	//Спасибо тебе!
	AI_Output(self,other,"DIA_Maria_Tower_win_17_06");	//Не за что. Если у тебя все получится, мы все от этого выиграем.	
	MARIA_APPROVES_TOWER = TRUE;
	B_LogEntry(TOPIC_MYNEWMANSION,"Мне удалось уговорить Марию замолвить за меня слово перед Онаром.");
	AI_StopProcessInfos(self);
};

func void dia_maria_tower_fail_a()
{
	AI_Output(other,self,"DIA_Maria_Tower_fail_a_15_00");	//Паладины хотят навести в башне порядок.
	AI_Output(other,self,"DIA_Maria_Tower_fail_a_15_01");	//Лорд Хаген передал ее мне, чтобы я мог восстановить ее, оборудовать, найти людей для ее охраны, чтобы никакие бандиты больше не могли там поселиться. 	
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_02");	//В каком смысле 'Лорд Хаген передал ее тебе'?  Ведь это же наша башня.
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_03");	//Ты - хороший человек, но лорд Хаген не может просто так распоряжаться нашими владениями.
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_04");	//Ты меня очень расстроил. Не нравится мне все это. Пожалуйста, оставь меня.
	AI_StopProcessInfos(self);
};

func void dia_maria_tower_fail_b()
{
	AI_Output(other,self,"DIA_Maria_Tower_fail_b_15_00");	//Боюсь, я не могу тебе всего рассказать. Скажу только, что я хочу навести в башне порядок.
	AI_Output(self,other,"DIA_Maria_Tower_fail_b_17_01");	//Но почему ты не можешь пояснить деталей? Ты что-то скрываешь?
	AI_Output(self,other,"DIA_Maria_Tower_fail_b_17_02");	//Прости, но я не буду поддерживать тебя, раз ты не хочешь рассказать мне всю правду.
	AI_StopProcessInfos(self);
};