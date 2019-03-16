
instance DIA_Kurgan_EXIT(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 999;
	condition = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(Biff,400);
};


instance DIA_Kurgan_HELLO(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_HELLO_Condition;
	information = DIA_Kurgan_HELLO_Info;
	important = TRUE;
};


func int DIA_Kurgan_HELLO_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Эй, ты! Смотри, куда идешь!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Что ты этим хочешь сказать?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Я хочу сказать, что пребывание здесь может не очень хорошо сказаться на твоем здоровье. Это место просто кишит орками и монстрами.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//Не говоря уже о драконах. Это просто дружеское предупреждение.
	B_LogEntry(TOPIC_Dragonhunter,"У входа в Долину Рудников мне встретилась группа охотников на драконов. Эти парни хорошо вооружены, но, боюсь, это не произведет особого впечатления на драконов.");
};


instance DIA_Kurgan_ELSE(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_ELSE_Condition;
	information = DIA_Kurgan_ELSE_Info;
	description = "Ты можешь сказать мне что-нибудь, чего я еще не знаю?";
};


func int DIA_Kurgan_ELSE_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Ты можешь сказать мне что-нибудь, чего я еще не знаю?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Я могу дать тебе добрый совет, причем бесплатно.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Нам здесь не нужны трусы, которые падают в обморок, как только почувствуют даже слабый запах дракона.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Возвращайся домой, это работа для настоящих мужчин.
};


instance DIA_Kurgan_Leader(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_Leader_Condition;
	information = DIA_Kurgan_Leader_Info;
	description = "Ты что здесь, за главного?";
};


func int DIA_Kurgan_Leader_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ты что здесь, за главного?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Я что, похож на главного? Конечно нет. Нам здесь не нужны важничающие кретины, раздающие приказы.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Когда Сильвио попытался вести себя как командир, мы показали ему и его парням, что мы думаем об этом.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Произошла небольшая стычка. И в конце концов им пришлось убраться.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Надеюсь, Сильвио найдет свой конец в кастрюле какого-нибудь орка.
};


instance DIA_Kurgan_KillDragon(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_KillDragon_Condition;
	information = DIA_Kurgan_KillDragon_Info;
	description = "Так вы хотите убить драконов?";
};


func int DIA_Kurgan_KillDragon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kurgan_Leader) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Kurgan_KillDragon_Day;

func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(издеваясь) Так вы хотите убить драконов?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Надо же, какой догадливый. А ты хоть знаешь, как можно завалить дракона?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//Ты думаешь, он будет спокойно сидеть на месте, когда ты будешь рубить его голову?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Такие дела требуют тщательного планирования и решительных действий.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Понимаю. И как вы собираетесь справиться с драконами?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Сначала мы должны выяснить, где они скрываются.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Только тогда можно будет подумать о лучшем способе атаковать их.
	Kurgan_KillDragon_Day = Wld_GetDay();
	Info_AddChoice(DIA_Kurgan_KillDragon,"К сожалению, мне нужно идти.",DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Как вы собираетесь пройти мимо орков?",DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Мне кажется, вы не способны найти даже слепую овцу.",DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Мне кажется, вы не способны найти даже слепую овцу.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Что? Ты хочешь схлопотать по своей тупой физиономии?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Как вы собираетесь пройти мимо орков?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Мы рассмотрим этот вопрос позже.
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//Мне бы очень хотелось посмотреть, как вы будете делать это, но, к сожалению, мне нужно идти.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Возвращайся назад, через проход. В противном случае ты рискуешь лишиться руки или ноги.
	AI_StopProcessInfos(self);
};


instance DIA_Kurgan_SEENDRAGON(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_SEENDRAGON_Condition;
	information = DIA_Kurgan_SEENDRAGON_Info;
	permanent = TRUE;
	description = "Ты еще не видел дракона?";
};


func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if((Kurgan_KillDragon_Day <= (Wld_GetDay() - 2)) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Ты еще не видел дракона?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Пока нет. Но эта тварь не может скрываться вечно.
};


instance DIA_Kurgan_AllDragonsDead(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 5;
	condition = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Драконы мертвы.";
};


func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Драконы мертвы.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ха! И кто, интересно, убил их? Паладины?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Я.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(смеется) Ха. Ты даже сам в это не веришь. Хватит нести чушь.
};


instance DIA_Kurgan_PICKPOCKET(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 900;
	condition = DIA_Kurgan_PICKPOCKET_Condition;
	information = DIA_Kurgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kurgan_PICKPOCKET_Condition()
{
	return C_Beklauen(34,120);
};

func void DIA_Kurgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,Dialog_Back,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};


instance DIA_KURGAN_THANKSFORHELP(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_thanksforhelp_condition;
	information = dia_kurgan_thanksforhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kurgan_thanksforhelp_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_thanksforhelp_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Kurgan_ThanksForHelp_01_00");	//Спасибо, что помог. Еще немного - и нам всем пришел бы конец!
	MEETKURGANAFTER = TRUE;
};


instance DIA_KURGAN_WHYHERE(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_whyhere_condition;
	information = dia_kurgan_whyhere_info;
	permanent = FALSE;
	description = "Почему вы до сих пор здесь?!";
};


func int dia_kurgan_whyhere_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_whyhere_info()
{
	AI_Output(other,self,"DIA_Kurgan_WhyHere_01_00");	//Почему вы до сих пор здесь?
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_01");	//И куда нам, по-твоему, идти? Кругом же орки!
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_02");	//Постоянно рискуешь нарваться на один из их патрулей.
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_03");	//Теперь нам даже в замке не укрыться. Я слышал, что эти мерзкие твари добрались и до него.
};


instance DIA_KURGAN_HOWAROUND(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_howaround_condition;
	information = dia_kurgan_howaround_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_kurgan_howaround_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && Npc_KnowsInfo(other,dia_kurgan_whyhere) && (DGJJOINPALADIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_kurgan_howaround_info()
{
	AI_Output(other,self,"DIA_Kurgan_HowAround_01_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Kurgan_HowAround_01_01");	//Все тихо. Орков пока не видно.
};


instance DIA_KURGAN_GOAWAY(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_goaway_condition;
	information = dia_kurgan_goaway_info;
	permanent = FALSE;
	description = "Вы могли бы присоединиться к паладинам.";
};


func int dia_kurgan_goaway_condition()
{
	if((MEETNATAN == TRUE) && (MIS_KILLDRAGONHUNTER == FALSE) && Npc_KnowsInfo(other,dia_kurgan_whyhere) && (DGJJOINPALADIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_kurgan_goaway_info()
{
	AI_Output(other,self,"DIA_Kurgan_GoAway_01_00");	//Вы могли бы присоединиться к паладинам.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_01");	//(удивленно) Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Kurgan_GoAway_01_02");	//Их отряд сейчас стоит на выходе из Долины Рудников. И с ними вам будет куда легче выбраться отсюда.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_03");	//Да? Возможно, ты прав.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_04");	//Там мы будем чувствовать себя куда спокойнее, чем здесь.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_06");	//Спасибо за новость.
	DGJMOVEPALADIN = TRUE;
};


instance DIA_KURGAN_DGJJOINPALADIN(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladin_condition;
	information = dia_kurgan_dgjjoinpaladin_info;
	permanent = FALSE;
	description = "Паладинам нужна ваша помощь.";
};


func int dia_kurgan_dgjjoinpaladin_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && Npc_KnowsInfo(other,dia_kurgan_whyhere))
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladin_info()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_00");	//Паладинам нужна ваша помощь.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_01");	//Да?! И зачем же она им понадобилась?
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_02");	//Они хотят вернуть себе крепость, поэтому им нужны еще люди.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_03");	//(ехидно) Ах вот как? Похоже, у них окончательно поехала крыша, раз они собираются выступить против целой армии орков!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_07");	//Мы не настолько глупы, чтобы понапрасну рисковать своими жизнями.
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_10");	//Может, мы все-таки сможем договориться?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_11");	//О чем тут договариваться, приятель?
	B_LogEntry(TOPIC_STURMCASTLE,"Охотникам на драконов эта идея не пришлась по душе. Они не хотят помогать паладинам штурмовать крепость, захваченную орками. Попробую убедить их.");
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Я не буду считать вас трусами!",dia_kurgan_dgjjoinpaladin_coward);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Я бы мог рассказать оркам о вашем лагере.",dia_kurgan_dgjjoinpaladin_orcs);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Как насчет золота?",dia_kurgan_dgjjoinpaladin_gold);
};

func void dia_kurgan_dgjjoinpaladin_coward()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Coward_01_00");	//Я не буду считать вас трусами!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_01");	//Ха! И ты наивно полагаешь, что меня заботит твое мнение?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_02");	//Я тебе вот что скажу: убирайся отсюда ко всем чертям!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_03");	//Мы не будем помогать паладинам! И тем более такому умнику, как ты.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_04");	//Все, разговор окончен. Проваливай!
	B_LogEntry(TOPIC_STURMCASTLE,"У меня так ничего и не вышло. Надо сообщить об этом паладинам.");
	AI_StopProcessInfos(self);
	self.aivar[93] = FALSE;
	DGJREFUSEPALADIN = TRUE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

func void dia_kurgan_dgjjoinpaladin_orcs()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_00");	//Я бы мог рассказать оркам о вашем лагере.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_01");	//(испуганно) Что?! Но ты этого не сделаешь!
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_02");	//Давай проверим!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_03");	//Ну ты и подонок! И после этого ты еще надеешься на мою помощь?!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_05");	//Аргххх, черт! Ну ладно, мы поможем паладинам.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_07");	//Когда-нибудь мы еще с тобой поквитаемся, ублюдок! Помяни мое слово.
	B_LogEntry(TOPIC_STURMCASTLE,"С помощью небольшого шантажа я смог убедить этих трусов сражаться на нашей стороне. Однако мне теперь не стоит поворачиваться к ним спиной.");
	DGJJOINPALADIN = TRUE;
	DGJREVENGEME = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kurgan_dgjjoinpaladin_gold()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Gold_01_00");	//Как насчет золота?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_01");	//Золота? Это действительно могло бы нас заинтересовать.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_02");	//Только этого золота должно быть очень много, поскольку орков в крепости тоже немало!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_06");	//Полагаю, пятидесяти тысяч золотых будет для нас в самый раз.
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"У меня не хватает золота.",dia_kurgan_dgjjoinpaladin_nogold);
	if(Npc_HasItems(other,ItMi_Gold) >= 50000)
	{
		Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Вот твои деньги.",dia_kurgan_dgjjoinpaladin_ok);
	};
};

func void dia_kurgan_dgjjoinpaladin_nogold()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_NoGold_01_00");	//У меня не хватает золота.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_NoGold_01_01");	//(недовольно) Тогда найди его.
	B_LogEntry(TOPIC_STURMCASTLE,"Охотники на драконов согласились присоединиться к паладинам только в том случае, если я заплачу им пятьдесят тысяч золотых монет!");
	DJGAWAITSGOLD = TRUE;
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
};

func void dia_kurgan_dgjjoinpaladin_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Ok_01_00");	//Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Ok_01_01");	//(довольно) Хорошо, приятель. Мы поможем паладинам!
	B_LogEntry(TOPIC_STURMCASTLE,"Я предложил им золото. Они не стали от него отказываться, и обещали помочь паладинам штурмовать крепость.");
	self.aivar[93] = FALSE;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_DGJJOINPALADINGOLD(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladingold_condition;
	information = dia_kurgan_dgjjoinpaladingold_info;
	permanent = TRUE;
	description = "Я принес тебе золото.";
};


func int dia_kurgan_dgjjoinpaladingold_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (DJGAWAITSGOLD == TRUE) && (DGJJOINPALADIN == FALSE) && (Npc_HasItems(other,ItMi_Gold) >= 50000))
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladingold_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladinGold_01_00");	//Я принес тебе золото.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladinGold_01_01");	//Правда? Покажи!
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladinGold_01_02");	//Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladinGold_01_03");	//(довольно) Хорошо, приятель. Мы поможем паладинам!
	B_LogEntry(TOPIC_STURMCASTLE,"Я отдал золото охотникам на драконов. Теперь они помогут паладинам.");
	self.aivar[93] = FALSE;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_FUCKOFF(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_fuckoff_condition;
	information = dia_kurgan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kurgan_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kurgan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

