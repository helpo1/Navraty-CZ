
instance DIA_Matteo_EXIT(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 999;
	condition = DIA_Matteo_EXIT_Condition;
	information = DIA_MAtteo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Matteo_PICKPOCKET(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 900;
	condition = DIA_Matteo_PICKPOCKET_Condition;
	information = DIA_Matteo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Matteo_PICKPOCKET_Condition()
{
	return C_Beklauen(80,150);
};

func void DIA_Matteo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,Dialog_Back,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

var int FirstTalkMatteo;

instance DIA_Matteo_NoTalkAtAll(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_NoTalkAtAll_Condition;
	information = DIA_Matteo_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Matteo_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_NoTalkAtAll_Info()
{
	if(FirstTalkMatteo == FALSE)
	{
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_00");	//Эй, тебе здесь нечего делать.
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_01");	//Исчезни!
		FirstTalkMatteo = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_NoTalkAtAll_12_02");	//Я сказал, уходи!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Matteo_Hallo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Hallo_Condition;
	information = DIA_MAtteo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Matteo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Hallo_Info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Чем могу помочь?
};

instance DIA_Matteo_SellWhat(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_SellWhat_Condition;
	information = DIA_MAtteo_SellWhat_Info;
	permanent = FALSE;
	description = "Что ты продаешь?";
};


func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_SellWhat_Info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Что ты продаешь?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Я могу предложить все, что может понадобиться в твоих странствиях. Оружие, факелы, провизию... даже доспехи.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//У меня есть очень хороший экземпляр на складе.

	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		Knows_Matteo = TRUE;
	};
};


instance DIA_Matteo_TRADE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 800;
	condition = DIA_Matteo_TRADE_Condition;
	information = DIA_Matteo_TRADE_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Matteo_TRADE_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_SellWhat) == TRUE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};


var int Matteo_TradeNewsPermanent;

func void DIA_Matteo_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	if((Npc_HasItems(other,ItMi_Saw) == 0) && (Npc_HasItems(self,ItMi_Saw) == 0))
	{
		CreateInvItems(self,ItMi_Saw,2);
	};
	if((Npc_HasItems(other,ItMi_Scoop) == 0) && (Npc_HasItems(self,ItMi_Scoop) == 0))
	{
		CreateInvItems(self,ItMi_Scoop,2);
	};
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Покажи мне свои товары.

	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//С тех пор, как наемники прикончили Лотара, инспекции паладинов стали значительно более строгими.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Я надеюсь, все успокоится, когда этого убийцу повесят.
		Matteo_TradeNewsPermanent = 1;
	};
	if((Kapitel == 5) && (Matteo_TradeNewsPermanent < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Похоже, паладины действительно серьезно настроены на этот раз. Они даже сократили охрану на своем корабле.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Это хорошо, что ты опять пополняешь свои запасы, кто знает, будет ли еще существовать этот город на следующей неделе.
		Matteo_TradeNewsPermanent = 2;
	};

	B_GiveTradeInv(self);
};


var int Matteo_LeatherBought;

instance DIA_Matteo_LEATHER(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 850;
	condition = DIA_Matteo_LEATHER_Condition;
	information = DIA_Matteo_LEATHER_Info;
	permanent = TRUE;
	description = "Купить одежду горожанина. (Цена: 250 монет)";
};

func int DIA_Matteo_LEATHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat) && (Matteo_LeatherBought == FALSE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Хорошо, давай мне эти доспехи.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Они тебе понравятся.
		B_GiveInvItems(self,other,ITAR_Vlk_M,1);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Эти доспехи стоят недешево, но они определенно стоят своих денег. Так что возвращайся, когда у тебя будет достаточно золота.
	};
};


instance DIA_Matteo_Paladine(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Paladine_Condition;
	information = DIA_MAtteo_Paladine_Info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int DIA_Matteo_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Paladine_Info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//С тех пор, как эти ублюдки прибыли в город, у меня от них одни проблемы.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Последний раз, когда я шел в верхний квартал, стражники преградили мне дорогу и начали выяснять, что мне там нужно!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//И?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Конечно же, они пропустили меня!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Да у меня уже была лавка в этом городе, когда эти напыщенные болваны еще пешком под стол ходили!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//А вчера эти ублюдки пришли и конфисковали половину моих товаров!
};


instance DIA_Matteo_Confiscated(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Confiscated_Condition;
	information = DIA_MAtteo_Confiscated_Info;
	permanent = FALSE;
	description = "Паладины забрали твои товары?";
};


func int DIA_Matteo_Confiscated_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Confiscated_Info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Паладины забрали твои товары?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Все, что у меня хранилось на заднем дворе.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Они просто поставили стражника перед входом во двор.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Мне еще повезло, что они не забрали все. Хотя бы доспехи оставили.
};


instance DIA_Matteo_HelpMeToOV(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeToOV_Condition;
	information = DIA_MAtteo_HelpMeToOV_Info;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};


func int DIA_Matteo_HelpMeToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeToOV_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Ты можешь помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(ошеломленно) Что? А что тебе нужно ТАМ?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//У меня важное сообщение...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//Так-так... А ты пытался пойти мимо стражников?
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(горький смех) Ох, забудь об этом!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(смеется) Это так ТИПИЧНО для этих нищих!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Я не понимаю, зачем мне даже пытаться.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Возможно, ты прав.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Я не знаю НАСКОЛЬКО важное у тебя сообщение - это меня не касается.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Но даже если ты скажешь им, что корабль, набитый орками, пришвартовался в гавани, они не пустят тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Потому что у них есть ПРИКАЗ.
};

func void B_Matteo_Preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Похоже, это очень важно для тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(лукаво) Вопрос в том: НАСКОЛЬКО это важно для тебя?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Я могу помочь тебе - я ведь, все же, один из самых влиятельных людей здесь.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Но это тебе обойдется в некоторую сумму.
};


instance DIA_Matteo_HelpMeNow(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeNow_Condition;
	information = DIA_MAtteo_HelpMeNow_Info;
	permanent = FALSE;
	description = "Так ты можешь помочь мне попасть в верхний квартал?";
};


func int DIA_Matteo_HelpMeNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeToOV) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeNow_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Так ты можешь помочь мне попасть в верхний квартал?
	B_Matteo_Preis();
};


instance DIA_Matteo_LehrlingLater(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_LehrlingLater_Condition;
	information = DIA_MAtteo_LehrlingLater_Info;
	permanent = FALSE;
	description = "Помоги мне стать учеником одного из мастеров.";
};


func int DIA_Matteo_LehrlingLater_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_LehrlingLater_Info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Помоги мне стать учеником одного из мастеров.
	B_Matteo_Preis();
};


instance DIA_Matteo_PriceOfHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_PriceOfHelp_Condition;
	information = DIA_MAtteo_PriceOfHelp_Info;
	permanent = FALSE;
	description = "Что ты хочешь за свои услуги?";
};


func int DIA_Matteo_PriceOfHelp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_PriceOfHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Что ты хочешь за свои услуги?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//Сотню золотых монет.
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"Это все чертовски...",DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"Ах ты, шельмец!",DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Воспринимай это проще! Это не ТВОЕ золото я имею в виду.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//А чье?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//В принципе, это МОЕ золото.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Гритта, племянница плотника, уже давно не отдает мне долг.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//Но эта маленькая вертихвостка постоянно дефилирует в новых платьях - это означает, что деньги у нее есть.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Я хочу, чтобы ты выбил из нее этот долг. Но мастер Торбен - плотник - тоже очень влиятельный человек.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Принеси мне эти деньги, и я помогу тебе.
	MIS_Matteo_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_Matteo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Matteo,LOG_Running);
	B_LogEntry(TOPIC_Matteo,"Племянница плотника Торбена Гритта должна Маттео сто золотых монет. Если я верну их ему, он поможет мне попасть в верхний квартал.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ах ты, шельмец!
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//Это все чертовски...
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};


instance DIA_Matteo_WoGritta(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_WoGritta_Condition;
	information = DIA_MAtteo_WoGritta_Info;
	permanent = FALSE;
	description = "Где мне найти эту Гритту?";
};


func int DIA_Matteo_WoGritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && (Gritta.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoGritta_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Где мне найти эту Гритту?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Как я уже говорил - она племянница плотника - его дом находится ниже про улице, справа от кузницы.
};


instance DIA_Matteo_GoldRunning(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 500;
	condition = DIA_Matteo_GoldRunning_Condition;
	information = DIA_MAtteo_GoldRunning_Info;
	permanent = TRUE;
	description = "Вот твои сто золотых!";
};

func int DIA_Matteo_GoldRunning_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_GoldRunning_Info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Вот твои сто золотых!

	if(Npc_IsDead(Gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//На этом золоте кровь Гритты! Я не говорил, что нужно убивать ее!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Я не хочу иметь никакого отношения к этому делу. Ты можешь забыть о нашей сделке! Не хочу даже вспоминать об этом!
		MIS_Matteo_Gold = LOG_FAILED;
		AI_StopProcessInfos(self);
		return;
	};
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Gritta_GoldGiven == TRUE)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//И? Были какие-нибудь проблемы?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Ничего такого, о чем стоило бы говорить.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Хорошо! Ты выполнил свою часть сделки.
		}
		else if(Gritta_WantPay == TRUE)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ты хочешь заплатить за нее? Хм - я бы предпочел, чтобы ты выколотил эти деньги из нее!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Но все же - сто золотых есть сто золотых.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Ты выполнил свою часть сделки.
		};

		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//У тебя проблемы со счетом? Я не вижу сто золотых монет.
	};
};


instance DIA_Matteo_Zustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_Zustimmung_Condition;
	information = DIA_MAtteo_Zustimmung_Info;
	permanent = TRUE;
	description = "Помоги мне стать учеником одного из мастеров!";
};


var int DIA_Matteo_Zustimmung_perm;

func int DIA_Matteo_Zustimmung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && ((MIS_Matteo_Gold == LOG_Running) || (MIS_Matteo_Gold == LOG_SUCCESS)) && (Player_IsApprentice == APP_NONE) && (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Помоги мне стать учеником одного из мастеров!
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Не волнуйся, я выполню свои обещания.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Другие мастера услышат от меня о тебе только хорошее.
		B_GivePlayerXP(XP_Zustimmung);
		B_LogEntry(TOPIC_Lehrling,"Маттео даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Всему своя очередь. Сначала выполни свою часть сделки и принеси мне золото!
	};
};


instance DIA_Matteo_HowCanYouHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_HowCanYouHelp_Condition;
	information = DIA_MAtteo_HowCanYouHelp_Info;
	permanent = FALSE;
	description = "Как ИМЕННО ты собираешься помочь мне?";
};


func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HowCanYouHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Как ИМЕННО ты собираешься помочь мне?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//Это просто. Я использую свое влияние, чтобы убедить других здешних мастеров взять тебя в ученики.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Став учеником, ты автоматически станешь и гражданином города и сможешь попасть в верхний квартал. Помимо этого, ты сможешь что-нибудь заработать.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Маттео может помочь мне стать учеником одного из мастеровых.");
};


instance DIA_Matteo_WoAlsLehrling(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_WoAlsLehrling_Condition;
	information = DIA_MAtteo_WoAlsLehrling_Info;
	permanent = FALSE;
	description = "А к кому я могу поступить в ученики?";
};


func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoAlsLehrling_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//А к кому я могу поступить в ученики?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//К любому мастеру на этой улице.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Это может быть кузнец Харад, мастер-лучник Боспер, плотник Торбен или алхимик Константино.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Один из них обязательно возьмет тебя.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Но важно, чтобы с этим были согласны другие мастера. Таков обычай Хориниса.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Я могу стать учеником мастера-лучника Боспера, кузнеца Харада, плотника Торбена или алхимика Константино.");
	B_LogEntry(TOPIC_Lehrling,"Прежде чем я стану учеником, я должен получить одобрение других мастеров.");
};


instance DIA_Matteo_WieZustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_Matteo_WieZustimmung_Condition;
	information = DIA_MAtteo_WieZustimmung_Info;
	permanent = FALSE;
	description = "Как мне получить одобрение других мастеров?";
};


func int DIA_Matteo_WieZustimmung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other,DIA_Matteo_WarumNichtBeiDir)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WieZustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Как мне получить одобрение других мастеров?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Ты просто должен убедить их. Иди и поговори с ними.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Но если хотя бы двое из них будут против тебя, тебе не поступить в ученики! Так что постарайся понравиться им!
	B_LogEntry(TOPIC_Lehrling,"Я смогу получить одобрение мастеров, только если я проявлю себя с лучшей стороны перед ними.");
};

instance DIA_Matteo_WarumNichtBeiDir(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_WarumNichtBeiDir_Condition;
	information = DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent = FALSE;
	description = "А почему ТЫ не возьмешь меня в ученики?";
};


func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WarumNichtBeiDir_Info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//А почему ТЫ не возьмешь меня в ученики?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Я бы взял - но другие мастера не согласятся.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Я только недавно взял еще одного ученика.
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_09_03");	//И чему ты его обучаешь?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_04");	//По сути дела ничему... Руперт не слишком умен для всего этого.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_05");	//Так что стоять за прилавком - это самое большое, что я могу от него требовать.
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_09_06");	//Ну, тогда, выходит, что он не твой ученик, а просто работает на тебя.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_07");	//Хммм...(улыбаясь) А ведь и не скажешь, что ты не прав.
};

instance DIA_Matteo_OtherWay(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_OtherWay_Condition;
	information = DIA_MAtteo_OtherWay_Info;
	permanent = FALSE;
	description = "А есть другой способ попасть в верхний квартал?";
};


func int DIA_Matteo_OtherWay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_OtherWay_Info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//А есть другой способ попасть в верхний квартал?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Возможно... если я что-нибудь придумаю, я дам тебе знать.
};


instance DIA_Matteo_Minenanteil(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_Minenanteil_Condition;
	information = DIA_MAtteo_Minenanteil_Info;
	description = "У тебя есть акции горнодобывающей компании.";
};


func int DIA_Matteo_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Я вижу, у тебя среди других товаров есть и акции горнодобывающей компании. Кто продал их тебе?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(нервно) Акции? Ох. И откуда они взялись? Понятия не имею, где я взял их. Клянусь, ваша честь.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_MATTEO_SPECWINEDONE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = dia_matteo_specwinedone_condition;
	information = dia_matteo_specwinedone_info;
	permanent = FALSE;
	description = "К тебе не приходил посыльный от паладина Фердинанда?";
};


func int dia_matteo_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) < 1))
	{
		return TRUE;
	};
};

func void dia_matteo_specwinedone_info()
{
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_00");	//К тебе не приходил посыльный от паладина Фердинанда?
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_01");	//От паладина Фердинанда? Хммм...
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_02");	//Ах да, вспомнил. Ко мне действительно заходил какой-то паренек.
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_03");	//Купил у меня две бутылки дорогого вина и ушел.
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_04");	//Куда он пошел?
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_05");	//Кажется, он что-то говорил про ферму Лобарта и, по-моему, хотел туда заглянуть.
	AI_Output(self,other,"DIA_MAtteo_SpecWineDone_01_06");	//Правда, поперся он туда на ночь глядя. Я на его месте все-таки был бы поосторожнее - за городским стенами водится немало опасных тварей.
	AI_Output(other,self,"DIA_MAtteo_SpecWineDone_01_08");	//Все ясно, спасибо за информацию.
	AI_StopProcessInfos(self);
};

instance DIA_Matteo_Jewerly(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Condition;
	information = DIA_MAtteo_Jewerly_Info;
	permanent = FALSE;
	description = "А чему бы ты смог научишь меня?";
};

func int DIA_Matteo_Jewerly_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Matteo_WarumNichtBeiDir) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_01_00");	//А если бы я все-таки стал твоим учеником - чему бы ты смог научить меня?
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_01");	//Ну, если тебя это так интересует... Когда-то я был превосходным ювелиром! 
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_02");	//Большая часть тех дорогих побрякушек, что носят эти расфуфыренные индюки из верхнего квартала, - все это моих рук дело.
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_03");	//Правда, с тех пор как какие-то воры украли у меня мои инструменты, я больше не практикую это занятие.
	AI_Output(self,other,"DIA_Matteo_Jewerly_01_04");	//Ну и, само собой, никого не обучаю этому искусcтву.
};

instance DIA_Matteo_Jewerly_Form(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Form_Condition;
	information = DIA_MAtteo_Jewerly_Form_Info;
	permanent = FALSE;
	description = "Что именно у тебя украли?";
};

func int DIA_Matteo_Jewerly_Form_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Matteo_Jewerly) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_01_00");	//Что именно у тебя украли?
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_01");	//Эх... Самое ценное из того, что у меня было - золотую форму для отлива колец и амулетов.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_02");	//Это была очень редкая и дорогая вещь! В свое время я купил ее у одного торговца, который приплыл с материка.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_03");	//Найти еще одну такую в Хоринисе мне уже навряд ли удастся.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_01_04");	//А без нее я, считай, остался как без рук. Так что у меня особо не было выбора.
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_01_05");	//Понимаю.
	MIS_JewerlyForm = LOG_Running;
	Log_CreateTopic(TOPIC_JewerlyForm,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Running);
	B_LogEntry(TOPIC_JewerlyForm,"Торговец Маттео раньше был ювелиром, но забросил это занятие, после того как у него украли инструменты. Больше всего он жалеет о золотой форме для отлива колец и амулетов.");
};

instance DIA_Matteo_Jewerly_Form_Done(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_Form_Done_Condition;
	information = DIA_MAtteo_Jewerly_Form_Done_Info;
	permanent = FALSE;
	description = "Это твоя вещь?";
};

func int DIA_Matteo_Jewerly_Form_Done_Condition()
{
	if((MIS_JewerlyForm == LOG_Running) && (Npc_HasItems(hero,ItMi_SteelForm) >= 1))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_00");	//Это твоя вещь?
	B_GiveInvItems(other,self,ItMi_SteelForm,1);
	Npc_RemoveInvItems(self,ItMi_SteelForm,1);
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_01");	//О Иннос! Глазам своим не верю! Где ты ее взял?
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_02");	//Там, где воры, ограбившие тебя, хранили все свое добро.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_03");	//Мерзавцы! Надеюсь, они поплатились за то, что сделали.
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_Done_01_04");	//Можешь не сомневаться.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_05");	//Ладно, приятель. Я и так тебе крайне благодарен за твою помощь.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_06");	//А добрые дела всегда должны быть хорошо вознаграждены! 
	AI_Output(self,other,"DIA_Matteo_Jewerly_Form_Done_01_07");	//Так что можешь выбрать все, что захочешь.
	MIS_JewerlyForm = LOG_Success;
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Success);
	B_LogEntry(TOPIC_JewerlyForm,"Я вернул Маттео его ювелирную форму. Он был несказанно счастлив!");
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Я бы не отказался от золота.",DIA_MAtteo_Jewerly_Form_Done_Gold);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"У тебя есть какие-нибудь магические зелья?",DIA_MAtteo_Jewerly_Form_Done_Potion);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Мне бы не помешало хорошее оружие.",DIA_MAtteo_Jewerly_Form_Done_Weapon);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Как насчет доспехов?",DIA_MAtteo_Jewerly_Form_Done_Armor);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done,"Лучше научи меня искусству ювелира.",DIA_MAtteo_Jewerly_Form_Done_Teach);
};

func void DIA_MAtteo_Jewerly_Form_Done_Gold()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_01");	//Я бы не отказался от золота.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_02");	//Ну конечно, золото... Оно всем нужно!
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Gold_01_03");	//Вот, возьми эти триста золотых монет. Это почти вдвое больше, чем стоит принесенная тобой вещица.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Potion()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_01");	//У тебя есть какие-нибудь магические зелья?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_02");	//Конечно. У меня как раз есть одно такое.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_03");	//Очень редкое! Я берег его исключительно для своих лучших клиентов.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Potion_01_04");	//Вот, держи. Теперь оно твое.
	B_GiveInvItems(self,other,ITPO_FALLDEFENCE,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Weapon()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_01");	//Мне бы не помешало хорошее оружие.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_02");	//Без сомнений...(деловито) Крайне важно иметь под рукой надежный меч или булаву. Особенно в наше время...
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Weapon_01_03");	//Вот, у меня тут как раз есть одно такое. Уверен, что ты не будешь в нем разочарован.
	B_GiveInvItems(self,other,ITMW_1H_MACE_107,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Armor()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_01");	//Как насчет доспехов?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_02");	//К сожалению, у меня нет доспехов, которые бы надежно защитили тебя, скажем, от орков или мракориса.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_03");	//Так что я смогу тебе дать только вот эту одежду. 
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_04");	//Но это лучше, чем ничего. Не так ли?
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_05");	//Хорошо, давай ее сюда.
	B_GiveInvItems(self,other,ITAR_Vlk_M,1);
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Armor_01_06");	//Вот, держи. Надеюсь, что она придется тебе в пору.
	Matteo_LeatherBought = TRUE;
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Teach()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_01");	//Лучше научи меня искусству ювелира.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_02");	//Признаться, я не ожидал услышать от тебя такую просьбу.
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_03");	//Остальное меня мало интересует. Так ты научишь меня?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_04");	//Ладно. В конце концов, ты доказал, что ты достойный человек и тебе можно доверять.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_05");	//Однако хочу сразу тебя предупредить, что искусство ювелира - довольно сложная штука.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_06");	//Тебе понадобится иметь некоторый опыт, чтобы постичь основы этой профессии.
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_07");	//Понимаю.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_08");	//Тогда, пожалуй, начнем с того, что я научу тебя создавать обычные стальные кольца.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_09");	//Если справишься с этим, то потом я научу тебя и всему остальному!
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_10");	//Идет.
	Matteo_TeachJewel = TRUE;
	Log_CreateTopic(TOPIC_TeachJewel,LOG_NOTE);
	B_LogEntry(TOPIC_TeachJewel,"Маттео согласился обучить меня ювелирному делу. Для начала он покажет мне, как создавать обычные стальные кольца.");
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Wld_AssignRoomToGuild("matteo",GIL_NONE);
};

instance DIA_MAtteo_Jewerly_Teach_L1(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L1_condition;
	information = DIA_MAtteo_Jewerly_Teach_L1_info;
	permanent = TRUE;
	description = "Научи меня ювелирному делу. (Очки обучения: 5)";
};

func int DIA_MAtteo_Jewerly_Teach_L1_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == FALSE) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L1_info()
{
	var int kosten;

	kosten = 5;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_00");	//Научи меня ювелирному делу.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_03_90");	//У тебя не хватает опыта! Приходи позже.
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_01");	//Итак. Хорошенько запомни, что подобное занятие не терпит спешки.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_02");	//Первым делом тебе понадобится железный слиток, чтобы сделать из него оправу для кольца.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_03");	//Далее тебе будет нужен драгоценный камень. Это - самый главный компонент в нашем деле.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_04");	//Их очень трудно отыскать! Но без него у тебя абсолютно ничего не получится.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_05");	//А где ты их доставал?
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_06");	//Обычно у торговцев, что приплывали из Варанта или Миртаны. Но стоили они, как ты понимаешь, целое состояние!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_07");	//Так что не каждый мог позволить себе подобного рода вещицу.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_08");	//Что дальше?
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_09");	//Еще тебе необходима сера, смола и кусок угля. Все они нужны для огранки самого самоцвета.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_10");	//Когда же у тебя на руках будут все компоненты, просто берешь форму для отлива заготовок и плавишь там металл.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_11");	//Затем обрабатываешь камень на верстаке до формы оправы, крепишь его туда и все - твое кольцо готово.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_12");	//Звучит не так уж сложно.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_13");	//Подожди. Это еще не все, что тебе следует знать.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_14");	//Дело в том, что все драгоценные камни содержат в себе небольшую частицу магии, которая позволяет приобретать кольцу его магические свойства.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_15");	//Каждый вид самоцвета наделяет предмет своими ОСОБЕННЫМИ свойствами. Это надо понимать!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_16");	//Конечно, обычная сталь не слишком подходит для создания по-настоящему прекрасных и могущественных артефактов.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_17");	//Но чтобы просто попрактиковаться - вполне сгодится. Ну как, все запомнил?
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_18");	//Конечно.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_19");	//Отлично. Да, и еще кое-что.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L1_01_20");	//За этот урок я с тебя денег не возьму. Но за следующие придется заплатить.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Изучен рецепт изготовления - 'Кольцо из железной руды'");
		JEWERLY_LEVEL_L1 = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel,"Теперь я умею изготавливать стальные кольца. Для этого мне понадобится железный слиток, любой из драгоценных камней, а также сера, уголь и смола как необходимые компоненты для работы. И кроме того, мне нужна форма для отлива колец.");
	};
};

instance DIA_Matteo_Jewerly_GiveForm(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_GiveForm_Condition;
	information = DIA_Matteo_Jewerly_GiveForm_Info;
	permanent = FALSE;
	description = "А где мне теперь взять форму для отлива колец?";
};

func int DIA_Matteo_Jewerly_GiveForm_Condition()
{
	if(JEWERLY_LEVEL_L1 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_GiveForm_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_GiveForm_01_00");	//А где мне теперь взять форму для отлива колец?
	AI_Output(self,other,"DIA_Matteo_Jewerly_GiveForm_01_01");	//Вот, возьми мою. В конце концов, мне она больше не нужна.
	B_GiveInvItems(self,other,ItMi_SteelForm,1);
	AI_Output(self,other,"DIA_Matteo_Jewerly_GiveForm_01_02");	//Но смотри не потеряй!
	AI_Output(other,self,"DIA_Matteo_Jewerly_GiveForm_01_03");	//Само собой.
};

instance DIA_Matteo_Jewerly_Table(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Table_Condition;
	information = DIA_Matteo_Jewerly_Table_Info;
	permanent = FALSE;
	description = "Где мне найти ювелирный верстак?";
};

func int DIA_Matteo_Jewerly_Table_Condition()
{
	if((JEWERLY_LEVEL_L1 == TRUE) && (FindJewelTable == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_Table_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_Table_01_00");	//Где мне найти ювелирный верстак?
	AI_Output(self,other,"DIA_Matteo_Jewerly_Table_01_01");	//Как где? Тут, конечно! Вон он, стоит у окна.
	AI_Output(self,other,"DIA_Matteo_Jewerly_Table_01_02");	//Но будь с ним аккуратен. Таких ты тут больше нигде не найдешь.
	FindJewelTable = TRUE;
};

instance DIA_MAtteo_Jewerly_Teach_L2(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L2_condition;
	information = DIA_MAtteo_Jewerly_Teach_L2_info;
	permanent = TRUE;
	description = "Я хочу улучшить свой навых ювелира. (Очки обучения: 10, Цена: 1000 монет)";
};

func int DIA_MAtteo_Jewerly_Teach_L2_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (Kapitel >= 4) && (JEWERLY_LEVEL_L2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L2_info()
{
	var int kosten;
	var int money;

	kosten = 10;
	money = 1000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L2_01_00");	//Я хочу улучшить свой навых ювелира.

	if(Kapitel >= 3)
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		}
		else
		{
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_01");	//Хорошо. Думаю, что пришло время тебе узнать, как делаются ювелирные украшения из золота.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_02");	//Все, что тебе понадобится, - это золотой слиток и по два куска серы, смолы и угля.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_03");	//Остальной процесс ничем не отличается от изготовления стальных украшений.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_04");	//Больше практикуйся, и у тебя обязательно все получится.
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + kosten;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print("Изучен рецепт изготовления - 'Кольцо из золота'");
			JEWERLY_LEVEL_L2 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel,"Теперь я умею изготавливать золотые кольца. Для этого мне понадобится золотой слиток, любой из драгоценных камней, а также по два куска серы, угля и смолы.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L2_01_05");	//Ты пока еще не готов к этому! Поговорим об этом позже.
	};
};

instance DIA_MAtteo_Jewerly_Teach_L3(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L3_condition;
	information = DIA_MAtteo_Jewerly_Teach_L3_info;
	permanent = TRUE;
	description = "Что я еще могу узнать о ювелирном деле? (Очки обучения: 15, Цена: 3000 монет)";
};

func int DIA_MAtteo_Jewerly_Teach_L3_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (JEWERLY_LEVEL_L2 == TRUE) && (Kapitel >= 5) && (JEWERLY_LEVEL_L3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L3_info()
{
	var int kosten;
	var int money;

	kosten = 15;
	money = 3000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L3_01_00");	//Что я еще могу узнать о ювелирном деле?

	if(Kapitel >= 4)
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		}
		else
		{
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_01");	//Только по-настоящему опытные мастера могут создавать украшения из магической руды.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_02");	//Для этого тебе понадобится рудный слиток и по три куска серы, смолы и угля.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_03");	//Не спеши. Сосредоточься на шлифовке камня и постарайся не повредить его, когда будешь вставлять в оправу.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_04");	//Все это, безусловно, непросто, но полученный результат полностью себя оправдывает.
			AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_05");	//Теперь иди и попробуй сделать какое-нибудь колечко!
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + kosten;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print("Изучен рецепт изготовления - 'Кольцо из магической руды'");
			JEWERLY_LEVEL_L3 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel,"Теперь я умею изготавливать кольца из магической руды. Для этого мне понадобится рудный слиток, любой из драгоценных камней, а также по три куска серы, угля и смолы.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_L3_01_06");	//Ты пока еще не готов к этому! Поговорим об этом позже.
	};
};

instance DIA_MAtteo_Jewerly_Teach_CanLAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_CanLAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_CanLAM_info;
	permanent = FALSE;
	description = "Больше тебе нечему меня научить?";
};

func int DIA_MAtteo_Jewerly_Teach_CanLAM_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_CanLAM_info()
{
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_00");	//Больше тебе нечему меня научить?
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_01");	//Единственное, чему еще я мог бы научить тебя, так это созданию амулетов.
	AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_CanLAM_01_02");	//Я могу тебе рассказать и об этом, - если, конечно, захочешь.
};

instance DIA_MAtteo_Jewerly_Teach_LAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_LAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_LAM_info;
	permanent = TRUE;
	description = "Научи меня изготавливать амулеты. (Очки обучения: 20, Цена: 5000 монет)";
};

func int DIA_MAtteo_Jewerly_Teach_LAM_condition()
{
	if((Npc_KnowsInfo(hero,DIA_MAtteo_Jewerly_Teach_CanLAM) == TRUE) && (Kapitel >= 5) && (JEWERLY_LEVEL_AMUL == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_LAM_info()
{
	var int kosten;
	var int money;

	kosten = 20;
	money = 5000;

	AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_LAM_01_00");	//Научи меня изготавливать амулеты.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
	}
	else
	{
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_01");	//Тогда слушай внимательно. Создание этих украшений требует настоящего искусства в ювелирном деле.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_02");	//Даже опытным мастерам это подчас не всегда удается.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_03");	//Процесс довольно прост, но требует твоего предельного внимания.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_04");	//Оправа амулета очень хрупка, поэтому одно неверное движение - и тебе придется начинать все заново!
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_05");	//Возьми рудный слиток, расплавь его и вылей форму крепежа. Потом осторожно вставь туда камень и закрепи его.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_06");	//В принципе, это все. Но тебе лучше самому попробовать изготовить хотя бы один амулет.
		AI_Output(self,other,"DIA_MAtteo_Jewerly_Teach_LAM_01_07");	//Тогда процесс его изготовления станет для тебя более понятным.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучен рецепт изготовления - 'Амулет из магической руды'");
		JEWERLY_LEVEL_AMUL = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel,"Теперь я умею изготавливать амулеты из магической руды. Для этого мне понадобится рудный слиток, любой из драгоценных камней, а также по два куска серы, угля и смолы.");
	};
};

instance DIA_Matteo_Jewerly_LoaNeacle(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacle_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacle_Info;
	permanent = FALSE;
	description = "Ты можешь сделать для меня одно украшение?";
};

func int DIA_Matteo_Jewerly_LoaNeacle_Condition()
{
	if((MIS_JewerlyForm == LOG_Success) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacle_Info()
{
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_00");	//Ты можешь для меня сделать одно украшение?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_01");	//Хммм... И о чем идет речь?
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_02");	//Мне нужно ожерелье из черного жемчуга.
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_03");	//Ага, понятно. Решил произвести впечатление на какую-нибудь молодую девицу? А?
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_04");	//Ну, не самому же его носить. Так что, сможешь его сделать?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_05");	//Конечно, без проблем. Но, как ты сам понимаешь, для этого мне потребуются сподручные материалы.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_06");	//Какие именно?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_07");	//Пять черных жемчужин и слиток золота для оправы с цепочкой. Если принесешь мне их, будет тебе ожерелье.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_08");	//Сколько ты хочешь за эту работу?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacle_01_09");	//Забудь! Денег я с тебя не возьму. Сделаю просто так, в знак благодарности за твою помощь.
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacle_01_10");	//Хорошо, договорились.
	B_LogEntry(TOPIC_LoaRomance,"Маттео сможет сделать для меня жемчужное ожерелье. Для этого потребуется пять черных жемчужин и слиток золота.");
};

instance DIA_Matteo_Jewerly_LoaNeacleDo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDo_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDo_Info;
	permanent = FALSE;
	description = "Я принес все, что ты просил.";
};

func int DIA_Matteo_Jewerly_LoaNeacleDo_Condition()
{
	if((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacle) == TRUE) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDo_01_00");	//Я принес все, что ты просил.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDo_01_01");	//Давай посмотрим... Так, вроде всего хватает.
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDo_01_02");	//Тогда я немедленно примусь за работу. Думаю, к завтрашнему утру оно будет уже готово.
	B_LogEntry(TOPIC_LoaRomance,"Я принес Маттео нужные для изготовления ожерелья материалы. Завтра его можно уже будет забрать.");
	MakeDarkPearleNeackle = Wld_GetDay();
};

instance DIA_Matteo_Jewerly_LoaNeacleDone(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDone_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDone_Info;
	permanent = FALSE;
	description = "Мое ожерелье готово?";
};

func int DIA_Matteo_Jewerly_LoaNeacleDone_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacleDo) == TRUE) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (MakeDarkPearleNeackle <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDone_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDone_01_00");	//Мое ожерелье готово?
	AI_Output(self,other,"DIA_Matteo_Jewerly_LoaNeacleDone_01_01");	//Да, можешь его забрать.
	B_GiveInvItems(self,other,ItMi_BlackPearlNeckle,1);
	AI_Output(other,self,"DIA_Matteo_Jewerly_LoaNeacleDone_01_02");	//Благодарю.
	B_LogEntry(TOPIC_LoaRomance,"Я сделал для Лоа настоящее ожерелье из черного жемчуга. Думаю, ей оно понравится.");
};