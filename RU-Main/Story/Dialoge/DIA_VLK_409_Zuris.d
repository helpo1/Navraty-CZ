
instance DIA_Zuris_EXIT(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 999;
	condition = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Zuris_Sperre(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Sperre_Condition;
	information = DIA_Zuris_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Zuris_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Ты заключенный, сбежавший из горнодобывающей колонии. Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_GREET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_GREET_Condition;
	information = DIA_Zuris_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Zuris_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Я Зурис, специалист по зельям.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Тебе нужна лечебная эссенция или магический эликсир? Тогда ты обратился по адресу.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Зурис торгует зельями на рыночной площади.");
};

var int Zuris_einmal;
var int VatrasBookIns;
var int TrollPlantUp;
var int GrokBringPotionUp;
var int ZurisAddPermMana;

instance DIA_Zuris_WAREZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_WAREZ_Condition;
	information = DIA_Zuris_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};

func int DIA_Zuris_WAREZ_Condition()
{
	if(Wld_IsTime(5,30,20,0))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Покажи мне свои товары.

	if((Zuris_einmal == FALSE) && !Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//Я только что получил несколько новых зелий! Мой гость, Мастер Дарон, Маг Огня, принес мне их из монастыря.
		Zuris_einmal = TRUE;
	};
	if((Kapitel >= 1) && (VatrasBookIns == FALSE) && (MagicBookFindTrade == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		CreateInvItems(self,ItWr_VatrasDiary,1);
		VatrasBookIns = TRUE;
	};
	if((SeekCactus == TRUE) && (ZurisAddPermMana == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_Mana,1);
		CreateInvItems(self,ItPl_Perm_Herb,1);	
		ZurisAddPermMana = TRUE;
	};
	if((XardasDoMagicRoot == TRUE) && (TrollPlantUp == FALSE))
	{
		CreateInvItems(self,ITPL_SUPER_HERB,1);
		TrollPlantUp = TRUE;
	};
	if((MIS_GrokBringPotion != FALSE) && (GrokBringPotionUp == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_STR,1);
		GrokBringPotionUp = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Zuris_Potions(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_POTIONS_Condition;
	information = DIA_Zuris_POTIONS_Info;
	permanent = FALSE;
	description = "Ты сам готовишь свои зелья?";
};


func int DIA_Zuris_POTIONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_GREET))
	{
		return TRUE;
	};
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//Ты сам готовишь свои зелья?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Нет, я получаю их из монастыря или покупаю у Константино, алхимика.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Если тебя интересуют рецепты приготовления зелий, тебе нужно поговорить с ним. Ему как раз нужен помощник.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Но он слишком туп, чтобы нанять кого-нибудь самому. И к тому же упрям как мул.
	};

	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Он всегда проходит мимо меня, когда выходит через восточные ворота собирать растения для своих зелий.
};

instance DIA_Zuris_Kraut(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kraut_Condition;
	information = DIA_Zuris_Kraut_Info;
	permanent = FALSE;
	description = "А где именно Константино собирает травы?";
};

func int DIA_Zuris_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//А где именно Константино собирает травы?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Он всегда выходит через восточные ворота города, а затем исчезает в лесу налево.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Он как-то сказал мне, что почти все, что ему нужно, растет там, за исключением царского щавеля.
	MikaHaveKey = TRUE;
	Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01,"FP_ROAM_CITY_TO_FOREST_10");
	Wld_InsertItem(ItPl_Mushroom_02,"FP_ITEM_HERB_10");
	Wld_InsertItem(ItPl_Mushroom_01,"FP_ITEM_HERB_09");
};


instance DIA_Zuris_Kronstoeckel(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kronstoeckel_Condition;
	information = DIA_Zuris_Kronstoeckel_Info;
	permanent = FALSE;
	description = "Константино говорил тебе, где можно найти царский щавель?";
};


func int DIA_Zuris_Kronstoeckel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Константино говорил тебе, где можно найти царский щавель?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Он как-то упоминал, что он растет около каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//Около фермы Лобарта, эта ферма находится неподалеку от других ворот, есть один из таких каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Насколько я помню, он стоит на холме. Там когда-то была могила, или что-то вроде этого.
	Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


instance DIA_Zuris_WHERE(C_Info)
{
	npc = VLK_409_Zuris;
	condition = DIA_Zuris_WHERE_Condition;
	information = DIA_Zuris_WHERE_Info;
	permanent = FALSE;
	description = "Где я могу найти Константино?";
};


func int DIA_Zuris_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_Potions) && (Constantino.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Где я могу найти Константино?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Его дом находится в тоннеле около кузницы Харада. Его будет нетрудно найти!
};


instance DIA_Zuris_Kloster(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kloster_Condition;
	information = DIA_Zuris_Kloster_Info;
	description = "Расскажи мне о монастыре.";
};


func int DIA_Zuris_Kloster_Condition()
{
	if(Zuris_einmal == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Расскажи мне о монастыре.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//Тебе лучше поговорить об этом с самим Мастером Дароном. Он знает больше меня.
};


instance DIA_Zuris_Minenanteil(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = DIA_Zuris_Minenanteil_Condition;
	information = DIA_Zuris_Minenanteil_Info;
	description = "Ты продаешь шахтерские акции?";
};


func int DIA_Zuris_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//Ты продаешь шахтерские акции?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Да. Это не самое прибыльное дело. Никогда больше не буду связываться с этим!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_ZURIS_TRADEPLACE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = dia_zuris_tradeplace_condition;
	information = dia_zuris_tradeplace_info;
	description = "Говорят, у тебя возникли проблемы с торговцем Джорой.";
};


func int dia_zuris_tradeplace_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_zuris_tradeplace_info()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_01_00");	//Говорят, у тебя возникли проблемы с торговцем Джорой.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_04");	//Действительно, у меня возникли некоторые трения с Джорой по одному вопросу.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_06");	//(раздраженно) Не думаю, что тебя это касается, но раз ты уже и так в курсе, то...
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_07");	//...я отказал Джоре в аренде места на площади, где он сейчас торгует.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_08");	//Конечно, ему это совсем не понравилось, как и его коллегам по торговой гильдии.
	AI_Output(self,other,"DIA_Zuris_TradePlace_01_09");	//Ты ведь уже слышал о ней?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Не думаю, что приходилось.",dia_zuris_tradeplace_hearguildno);
	Info_AddChoice(dia_zuris_tradeplace,"Да, я слышал о ней.",dia_zuris_tradeplace_hearguildyes);
};

func void dia_zuris_tradeplace_hearguildno()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildNo_01_00");	//Никогда о такой не слышал.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_01");	//Да? Интересно. Ну, неважно.
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildNo_01_02");	//Так почему ты отказал Джоре?
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_05");	//Недавно я получил выгодное предложение о покупке его места.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildNo_01_06");	//Предложение, от которого я не смог отказаться...
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Так это все из-за денег?",dia_zuris_tradeplace_ask);
};

func void dia_zuris_tradeplace_hearguildyes()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_00");	//Я кое-что слышал о ней.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_01");	//Да?! Интересно, откуда?
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_04");	//(ехидно) Только члены гильдии торговцев знают о ее существовании.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_05");	//Ну, и некоторые влиятельные торговцы вроде меня, к коим ты не относишься.
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_06");	//К чему ты клонишь?
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_07");	//Похоже, ты работаешь на этого болвана Лютеро!
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_08");	//Именно он мог рассказать тебе о моих делах с Джорой.
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_10");	//Думал, что сумеешь провести меня? Принимаешь меня за идиота?!
	AI_Output(other,self,"DIA_Zuris_TradePlace_HearGuildYes_01_11");	//Послушай...
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_12");	//...(перебивая) Я не стану тебя слушать!
	AI_Output(self,other,"DIA_Zuris_TradePlace_HearGuildYes_01_13");	//И не изменю своего решения по поводу Джоры! Так можешь Лютеро и передать!
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Лютеро очень обеспокоен этим фактом.",dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace,"Твоя месть Лютеро не решит ваших с ним проблем.",dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace,"Мы можем договориться.",dia_zuris_tradeplace_deal);
	Info_AddChoice(dia_zuris_tradeplace,"Ecли ты не передумаешь - я убью тебя!",dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_ask()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Ask_01_00");	//Выходит, проблема из-за денег?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_01");	//(ехидно) Ну, не совсем.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_02");	//В последнее время у меня напряженные отношения с гильдией торговцев.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Ask_01_04");	//А в чем дело?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_05");	//Я смотрю, тебя очень заинтересовала эта тема.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Ask_01_06");	//Скажи, почему тебя это так волнует?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Я беспокоюсь за Джору.",dia_zuris_tradeplace_jora);
	Info_AddChoice(dia_zuris_tradeplace,"Меня интересует место Джоры.",dia_zuris_tradeplace_place);
	Info_AddChoice(dia_zuris_tradeplace,"Просто стало интересно.",dia_zuris_tradeplace_interes);
	Info_AddChoice(dia_zuris_tradeplace,"Лютеро послал меня обсудить с тобой эту проблему.",dia_zuris_tradeplace_luterozuris);
};

func void dia_zuris_tradeplace_interes()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Interes_01_00");	//Ну, мне просто интересно.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_01");	//Дам тебе совет - не суй всюду свой нос!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_04");	//К тому же у меня совсем нет времени на тебя.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Interes_01_05");	//Так что оставь меня в покое!
	B_LogEntry(TOPIC_JORAHELP,"Я не смог объяснить Зурису, почему меня интересуют его проблемы с Джорой и с гильдией торговцев. Вряд ли Зурис снова станет обсуждать эту тему со мной. Похоже, я провалил это поручение. Надо сообщить об этом Лютеро.");
	ZURISPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_luterozuris()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_LuteroZuris_01_00");	//Лютеро послал меня обсудить с тобой эту проблему.
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_01");	//Что?! (гневно) Так это Лютеро прислал тебя ко мне?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_04");	//Похоже, Лютеро полагал, что ты сможешь повлиять на мое решение по поводу Джоры? (смеется)
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_06");	//Если он хочет обсудить эту проблему, то пусть приходит сам!
	AI_Output(self,other,"DIA_Zuris_TradePlace_LuteroZuris_01_10");	//Я не отменю своего решения по поводу Джоры! Так можешь Лютеро и передать.
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Лютеро очень обеспокоен этим фактом.",dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace,"Мы можем договориться!",dia_zuris_tradeplace_deal);
};

func void dia_zuris_tradeplace_lutero()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Lutero_01_00");	//Лютеро очень обеспокоен этим.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Lutero_01_01");	//Ваши разногласия могут сказаться на доходах гильдии. К тому же...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_02");	//...(перебивая) То, он чем-то обеспокоен - это его личные проблемы!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_03");	//Возможно, это его чему-нибудь научит. А тебе я все сказал.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Lutero_01_04");	//И больше я не намерен это обсуждать. Оставь меня в покое!
	B_LogEntry(TOPIC_JORAHELP,"Я случайно проболтался Зурису о том, что меня к нему подослал Лютеро. После этого Зурис не захотел говорить со мной. Похоже, я провалил это поручение. Надо сообщить об этом Лютеро.");
	ZURISFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_deal()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_00");	//Мы ведь можем договориться.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_01");	//Да? (ехидно) И каким же образом ты собираешься со мной договариваться?
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_02");	//А что, если я куплю это торговое место?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_03");	//Что? И ты думаешь, что я его тебе продам?!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_04");	//А почему бы и нет? В конце концов, все имеет свою цену. Даже твои отношение с Лютеро.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_08");	//Ну, хорошо, боюсь только, что цена будет тебе не по зубам!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_09");	//Сколько тебе предлагал тот торговец?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_10");	//Это не твоего ума дело. Для тебя цена будет совершенно другой!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_13");	//(задумался) Если все учесть и посчитать, то, думаю...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_14");	//...десять тысяч золотых монет могли бы заставить меня отказаться от предыдущего предложения.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Deal_01_15");	//Десять тысяч?! Да ты сдурел!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_16");	//Это мои условия! Примешь ты их или нет - это уже твое личное дело.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_20");	//Разумеется, у такого оборванца как ты вряд ли когда-то будет такая сумма.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Deal_01_21");	//Но гильдия, в которой ты, как я понял, состоишь - вполне способна заплатить...(смеется)
	B_LogEntry(TOPIC_JORAHELP,"Я случайно проболтался Зурису о том, что меня подослал Лютеро. Зурис уже собирался прекратить со мной разговор, но я смог убедить его в том, что еще можно прийти к обоюдному согласию в этом вопросе. Я предложил Зурису купить место Джоры, и, немного подумав, он согласился с моим предложением, правда запросив при этом просто огромную сумму - десять тысяч золотых монет! Не думаю, что Лютеро будет в восторге от этой идеи.");
	ZURISTRADEPLACEYES = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_jora()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_00");	//Я беспокоюсь за Джору.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_01");	//Да?! (удивленно) И чем же вызвано такое твое беспокойство за его персону?
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_02");	//Я знаю Джору и думаю, что он - хороший человек и честный торговец.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_03");	//Отняв у него место, ты лишаешь его главного - любимой работы.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_11");	//Я ничего не имею против Джоры! Он достойный человек, имеющий некоторые личные качества, не присущие другим торговцам.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_12");	//Но он тоже состоит в гильдии, а значит, слушается этого напыщенного болвана Лютеро.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_13");	//Поэтому его головная боль - всегда радость для меня!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Jora_01_15");	//Так значит, это все из-за твоих отношений с Лютеро?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Jora_01_16");	//А что с того? Я в любом случае проучу этого наглеца, и неважно, что из-за этого пострадают другие люди.
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Твоя месть Лютеро не решит ваших с ним проблем.",dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace,"С того, что если ты не передумаешь - я убью тебя!",dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_dead()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Dead_01_00");	//Если ты не передумаешь - я убью тебя!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Dead_01_01");	//ЧТО?! Да как ты смеешь мне угрожать?!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Dead_01_07");	//СТРАЖА!!! СТРАЖА!!!
	CreateInvItems(self,itwr_zurisdocs,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_zuris_tradeplace_place()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_00");	//Меня интересует место торговца Джоры.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_02");	//Ты бы мог продать мне его?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_03");	//(удивленно) Но у меня уже есть договоренность с другим торговцем.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_05");	//Я мог бы предложить тебе лучшую цену.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_10");	//Да? Ну, хорошо. Хммм... Если все учесть и посчитать, то, думаю...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_11");	//...пяти тысяч золотых монет будет вполне достаточно. И я забуду о старом предложении.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_12");	//Пять тысяч?! Да это грабеж!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_13");	//А как ты хотел? Приличные деньги за приличное место.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Place_01_14");	//Ладно. Но мне нужно какое-то время, чтобы собрать эту сумму.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Place_01_15");	//Времени у тебя предостаточно. Срок аренды Джоры истекает через три недели, так что все в твоих руках.
	B_LogEntry(TOPIC_JORAHELP,"Я уговорил Зуриса, и теперь он готов перепродать мне место Джоры. Он запросил пять тысяч золотых. Надо сообщить об этом Лютеро. Возможно, этот вариант решит проблемы гильдии.");
	ZURISTRADEPLACEYESCHIP = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_problem()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_00");	//Мне кажется, твоя месть Лютеро не решит ваших с ним проблем.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_02");	//Месть - это не лучший выход из сложившейся ситуации.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_05");	//Не я это начал...
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_09");	//(задумчиво) В общем, у меня с Лютеро когда-то была одна договоренность.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_11");	//Как-то он пообещал достать мне одно очень редкое зелье - Пламя Элигора.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_12");	//Тот, кто его выпьет, становится просто невосприимчив к огню.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_13");	//Но так как в Хоринисе нет нужного ингредиента, достать его - большая проблема.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_23");	//Но у Лютеро были связи на материке с другими крупными торговцами Миртаны, и через них он мог достать этот эликсир.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_24");	//Конечно, мне пришлось бы выложить просто огромную кучу золота, но поверь - эта вещь того стоила.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_28");	//Так вот. Когда этот эликсир оказался у Лютеро на руках, он заломил за него просто баснословную цену!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_29");	//Почти втрое больше, чем мы договаривались изначально!
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_30");	//(зло) Конечно, у меня не было таких денег - это же целое состояние!
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_31");	//Значит, он нарушил условия договора?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_32");	//Именно! Этот болван был так ослеплен жаждой золота, что забыл о кодексе торговца.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_33");	//Правда он так и не успел распорядится этим сокровищем должным образом.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_34");	//Пару дней спустя кто-то забрался к нему в дом и обчистил его до нитки, прихватив заодно и эликсир.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_38");	//Теперь ты понимаешь меня? Я хочу отплатить Лютеро той же монетой.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_39");	//Я понимаю, но кроме него пострадают и другие люди, непричастные к вашей ссоре.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_40");	//Возможно, Лютеро сожалеет о тогдашнем поступке.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Problem_01_43");	//Может быть, я смогу помочь тебе заполучить этот эликсир?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Problem_01_48");	//Хммм... Ну, допустим. Только зачем тебе это?
	B_LogEntry(TOPIC_JORAHELP,"Я обсудил с Зурисом проблему касательно Джоры и выяснил истинную причину того, почему Зурис решил отказать Джоре в продлении аренды торгового места на площади. Выяснилось, этот отказ ни что иное, как месть Зуриса Лютеро. Как-то раз Лютеро не выполнил условия договора, заключенного между ним и Зурисом, о приобретении последним очень редкого эликсира под названием 'Пламя Элигора'. Теперь Зурис хочет отплатить Лютеро той же монетой. После долгих разговоров, мне все-таки удалось убедить Зуриса, что в этом вопросе еще можно прийти к обоюдному согласию сторон, и предложил помочь ему в этом вопросе.");
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace,"Просто хочу помочь.",dia_zuris_tradeplace_help);
};

func void dia_zuris_tradeplace_help()
{
	AI_Output(other,self,"DIA_Zuris_TradePlace_Help_01_00");	//Просто хочу помочь.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_07");	//Хорошо. Если сможешь достать его для меня - я отменю свое решение по поводу Джоры.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_08");	//Ну и, конечно, я компенсирую тебе некоторые затраты на его поиски. В разумных пределах.
	AI_Output(other,self,"DIA_Zuris_TradePlace_Help_01_15");	//Как думаешь, куда вор дел этот эликсир?
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_16");	//Вряд ли он стал бы пить неизвестное зелье. Скорее всего, он продал его кому-нибудь за небольшую цену.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_19");	//Я совершенно не представляю, откуда начать поиски.
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_20");	//Но могу дать совет - поговори об этом с Лютеро...(ехидно)
	AI_Output(self,other,"DIA_Zuris_TradePlace_Help_01_21");	//Возможно, он подскажет тебе, с чего начать поиски.
	B_LogEntry(TOPIC_JORAHELP,"Зурис согласился, но только с тем условием, что я достану ему эликсир Пламя Элигора. Думаю, это будет совсем не легкая задача. Единственный в Хоринисе экземпляр был украден у Лютеро. Неизвестно, где он может быть сейчас. Зурис посоветовал мне узнать подробности этого дела у Лютеро.");
	ZURISGIVEMETASK = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_FUCKOFF(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_fuckoff_condition;
	information = dia_zuris_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_fuckoff_condition()
{
	if((ZURISFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_zuris_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ZURIS_GIVEMETASKOK(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_givemetaskok_condition;
	information = dia_zuris_givemetaskok_info;
	permanent = FALSE;
	description = "Я нашел утерянный эликсир.";
};


func int dia_zuris_givemetaskok_condition()
{
	if((ZURISGIVEMETASK == TRUE) && (Npc_HasItems(other,itpo_eligorfire) >= 1))
	{
		return TRUE;
	};
};

func void dia_zuris_givemetaskok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_00");	//Я нашел пламя Элигора.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_03");	//Невероятно! Не могу в это поверить!
	B_GiveInvItems(other,self,itpo_eligorfire,1);
	Npc_RemoveInvItems(self,itpo_eligorfire,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_07");	//О Иннос! Наконец-то это сокровище у меня в руках!
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_08");	//Ты сделал меня по-настоящему счастливым человеком!
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_09");	//Так значит, Джора сможет продолжать торговать на рыночной площади?
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_10");	//Можешь не беспокоиться - теперь я выполню свою часть нашей сделки.

	if(LUTEROAGREEMEETZURIS == TRUE)
	{
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_13");	//В твое отсутствие я немного пораскинул мозгами и пришел к выводу, что твоя помощь имела под собой несколько иные мотивы.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_14");	//...нежели те, о которых ты говорил ранее.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_15");	//К тому же недавно мне нанес визит Лютеро, и эта встреча окончательно убедила меня в правоте своих доводов.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_21");	//Мы долго говорили с ним. В конце концов мы пришли к единому мнению, что наши разногласия не выгодны нам обоим.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_22");	//Ну, ты же понимаешь, о чем я?
		Info_ClearChoices(dia_zuris_givemetaskok);
		Info_AddChoice(dia_zuris_givemetaskok,"Да, я в курсе...(признаться)",dia_zuris_givemetaskok_iknow);
		Info_AddChoice(dia_zuris_givemetaskok,"Не понимаю, о чем ты!",dia_zuris_givemetaskok_tellme);
	}
	else
	{
		AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_01_25");	//Так значит, Джора сможет продолжать торговать на рыночной площади?
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_26");	//Ты правильно меня понял - я продлю срок его аренды и даже немного скину цену на нее.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_27");	//Само собой, твои труды также не останутся в долгу. Вот, прими от меня это золото в качестве награды.
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_28");	//Ты заслужил его.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_01_30");	//А теперь...(задумчиво)...извини, но меня ждут дела.
		ZURISGIVEMETASKOK = TRUE;
		NoEligorBuy = TRUE;
		AI_StopProcessInfos(self);
	};
};

func void dia_zuris_givemetaskok_iknow()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Iknow_01_00");	//Да, я в курсе.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_01");	//Я так и думал! К тому же Лютеро все мне рассказал - в том числе и о твоем поручении насчет Джоры.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_14");	//Теперь я хочу отблагодарить тебя за твои хлопоты в этом деле.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_15");	//Взамен Пламени Элигора, что ты мне принес, я дам тебе другой. Конечно, он не настолько ценный, но...
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_16");	//...его свойства от этого не становятся менее ценными.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_17");	//Постарайся использовать его с умом.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Iknow_01_19");	//А теперь извини, меня ждут дела.
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	NoEligorBuy = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_givemetaskok_tellme()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_00");	//Не понимаю, о чем ты!
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_01");	//Правда? (задумчиво) Я ожидал услышать от тебя немного другой ответ.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_05");	//Лютеро все мне рассказал - в том числе и и о твоем поручении насчет Джоры.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_21");	//И я хочу отблагодарить тебя за твои хлопоты в этом деле.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_22");	//Взамен Пламени Элигора, что ты мне принес, я дам тебе другой. Конечно, он не настолько ценен, но...
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_23");	//...его свойства от этого не становятся менее ценными.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_25");	//И это еще не все.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_26");	//Немного подумав, я решил, что, оказавшись в моих руках, найденный тобой эликсир уже не представляет для меня такой ценности, как раньше.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_29");	//Теперь же он представляет для меня такую же ценность, как и другие эликсиры, что я продаю. Отличие заключается лишь в цене.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_30");	//Поэтому теперь мне бы хотелось как можно выгоднее продать эту вещицу.
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_31");	//И мне кажется, что тебя должно заинтересовать это предложение.
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_32");	//Ты мне предлагаешь купить у тебя эликсир, который добыл я?
	AI_Output(self,other,"DIA_Zuris_GiveMeTaskOk_Tellme_01_35");	//Да. Всего за семь тысяч золотых!
	AI_Output(other,self,"DIA_Zuris_GiveMeTaskOk_Tellme_01_36");	//Да, ты действительно мошенник, Зурис! Я подумаю.
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	TRADEELIGORFIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_TRADEELIGORFIRE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_tradeeligorfire_condition;
	information = dia_zuris_tradeeligorfire_info;
	permanent = TRUE;
	description = "Продай мне Пламя Элигора.";
};

func int dia_zuris_tradeeligorfire_condition()
{
	if((TRADEELIGORFIRE == TRUE) && (TRADEELIGORFIREOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_tradeeligorfire_info()
{
	AI_Output(other,self,"DIA_Zuris_TradeEligorFire_01_00");	//Продай мне Пламя Элигора.

	if(Npc_HasItems(other,ItMi_Gold) >= 7000)
	{
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_02");	//Хорошо, как и договаривались - эликсир твой!
		Npc_RemoveInvItems(other,ItMi_Gold,7000);
		B_GiveInvItems(self,other,itpo_eligorfire,1);
		AI_Output(other,self,"DIA_Zuris_TradeEligorFire_01_03");	//Спасибо!
		TRADEELIGORFIREOK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_05");	//Но подожди - у тебя же не хватает золота!
		AI_Output(self,other,"DIA_Zuris_TradeEligorFire_01_08");	//Приходи, когда у тебя будут деньги.
	};
};


instance DIA_ZURIS_ZURISTRADEPLACEME(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_zuristradeplaceme_condition;
	information = dia_zuris_zuristradeplaceme_info;
	permanent = TRUE;
	description = "Продай мне торговое место Джоры.";
};


func int dia_zuris_zuristradeplaceme_condition()
{
	if((ZURISTRADEPLACEMEOK == FALSE) && ((ZURISTRADEPLACEYES == TRUE) || (ZURISTRADEPLACEYESCHIP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_zuris_zuristradeplaceme_info()
{
	AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_00");	//Продай мне торговое место Джоры.

	if((ZURISTRADEPLACEYES == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,10000);
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_06");	//Похоже, это самая успешная моя сделка за всю прожитую жизнь!
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_08");	//Вот, возьми этот документ.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_09");	//Что за документ?
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_10");	//Это договор собственности на торговое место, где сейчас работает Джора.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_11");	//Просто впиши в него свое имя или имя другого человека - и документ обретет официальный статус.
		B_LogEntry(TOPIC_JORAHELP,"Я отдал Зурису золото, которое он запросил у меня за торговое место Джоры. Он дал мне договор собственника, в котором нужно просто указать имя будущего владельца и после этого документ обретет официальный статус. Теперь мне необходимо отнести эти бумаги Лютеро.");
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_24");	//Похоже, это одна из моих самых успешных сделок за всю прожитую жизнь!
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_26");	//Вот, возьми этот документ.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_27");	//Что за документ?
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_28");	//Это договор собственности на торговое место, где сейчас работает Джора.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_29");	//Просто впиши в него свое имя или имя другого человека - и документ обретет официальный статус.
		B_LogEntry(TOPIC_JORAHELP,"Я отдал Зурису золото, которое он запросил у меня за торговое место Джоры. Он дал мне договор собственника, в котором нужно просто указать имя будущего владельца и после этого документ обретет официальный статус. Теперь мне необходимо отнести эти бумаги Лютеро.");
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Zuris_ZurisTradePlaceMe_01_38");	//Но, кажется, у меня недостаточно денег для нашей сделки.
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_39");	//Тогда зачем ты отвлекаешь меня? (раздраженно) Я же тебе сказал...
		if(ZURISTRADEPLACEYES == TRUE)
		{
			AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_42");	//...десять тысяч золотых монет и ни монетой меньше!
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_43");	//...пять тысяч золотых монет и ни монетой меньше!
		};
		AI_Output(self,other,"DIA_Zuris_ZurisTradePlaceMe_01_44");	//А сейчас нам не о чем с тобой разговаривать.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ZURIS_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = dia_zuris_aboutkillignaz_condition;
	information = dia_zuris_aboutkillignaz_info;
	permanent = FALSE;
	description = "Насчет убийства алхимика Игнаца.";
};

func int dia_zuris_aboutkillignaz_condition()
{
	if((ASKKILLFIRST == TRUE) && (ASKKILLSECOND == TRUE) && (ASKKILLTHIRD == TRUE))
	{
		return TRUE;
	};
};

func void dia_zuris_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_01");	//Насчет убийства алхимика Игнаца...
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_06");	//Подожди... Я лишь простой торговец, и в такие дела свой нос не сую.
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_07");	//Но ведь здесь, на рыночной площади всегда полным полно слухов.
	AI_Output(other,self,"DIA_Zuris_AboutKillIgnaz_01_08");	//Может быть, ты слышал что-то необычное за последнее время?
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_09");	//Нет, ничего такого. А если бы что-нибудь и узнал, то давно бы уже сообщил об этом городской страже.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_10");	//Хотя, по правде говоря, толку от этих парней абсолютно никакого.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_12");	//Эти болваны из ополчения слишком ленивы, чтобы заниматься подобными вещами.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_13");	//Представляешь, они даже не удосужились осмотреть ту хибару, где жил Игнац.
	AI_Output(self,other,"DIA_Zuris_AboutKillIgnaz_01_14");	//А ведь там наверняка могло бы остаться что-нибудь такое, что помогло бы им найти убийцу.
	B_LogEntry(TOPIC_KILLIGNAZ,"Похоже, торговец зельями Зурис тоже ничего не знает об убийстве Игнаца.");
	Wld_InsertItem(itmi_poisonbottle,"FP_ITEM_POISONIGNAZ");
};


instance DIA_Zuris_LOKIPOTION(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_LOKIPOTION_Condition;
	information = DIA_Zuris_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Ты ведь торгуешь травами?";
};


func int DIA_Zuris_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (TradeCactus == TRUE) && (FindCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_LOKIPOTION_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_00");	//Ты ведь торгуешь травами?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_01");	//Конечно. Что конкретно тебя интересует?
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_02");	//Я ищу крайне редкий для здешних мест ингредиент - цветок кактуса. У тебя его случайно нет?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_03");	//Да, у меня был один такой.
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_04");	//Но пару дней назад его купил один маг из монастыря.
	AI_Output(other,self,"DIA_Zuris_LOKIPOTION_01_05");	//Черт, как это не вовремя. А он не сказал, для чего он ему вдруг понадобился?
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_06");	//Он сказал, что хочет использовать этот ингредиент для своих алхимических экспериментов.
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_07");	//И выложил за этот цветок приличную сумму золота.
	AI_Output(self,other,"DIA_Zuris_LOKIPOTION_01_08");	//Так что извини. Теперь уже ничем не могу помочь.
	FindCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"У торговца Зуриса было это растение, но пару дней назад он продал его какому-то магу Огня из монастыря. Мне надо как-то попытаться заполучить этот редкий экземпляр у служителей Инноса.");
};


instance DIA_Zuris_FromWhomCactus(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_FromWhomCactus_Condition;
	information = DIA_Zuris_FromWhomCactus_Info;
	permanent = FALSE;
	description = "Откуда у тебя это растение?";
};


func int DIA_Zuris_FromWhomCactus_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (FindCactus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_FromWhomCactus_Info()
{
	AI_Output(other,self,"DIA_Zuris_FromWhomCactus_01_00");	//Откуда у тебя это растение?
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_01");	//Его мне привез один знакомый торговец из Варанта. Правда, это было уже давно.
	AI_Output(other,self,"DIA_Zuris_FromWhomCactus_01_02");	//Значит, достать еще один экземпляр этого растения никак не представляется возможным?
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_03");	//Раньше это не было бы такой проблемой. А сейчас ты и сам знаешь, какие настали времена.
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_04");	//Да и единственный корабль, который зашел в наш порт за полгода, оказался боевым кораблем паладинов.
	AI_Output(self,other,"DIA_Zuris_FromWhomCactus_01_05");	//(смеется) А они вряд ли станут заниматься перевозкой каких-то растений.
};