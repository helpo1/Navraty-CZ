
instance DIA_Cipher_EXIT(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 999;
	condition = DIA_Cipher_EXIT_Condition;
	information = DIA_Cipher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cipher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_Hello(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 1;
	condition = DIA_Cipher_Hello_Condition;
	information = DIA_Cipher_Hello_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Cipher_Hello_Condition()
{
	return TRUE;
};

func void DIA_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Эй, я тебя откуда-то знаю?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Возможно...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//Я торговал болотной травой в колонии, помнишь?
};


instance DIA_Cipher_TradeWhat(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TradeWhat_Condition;
	information = DIA_Cipher_TradeWhat_Info;
	permanent = FALSE;
	description = "А чем ты торгуешь сейчас?";
};


func int DIA_Cipher_TradeWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TradeWhat_Info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//А чем ты торгуешь сейчас?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ах, не спрашивай.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Я принес с собой из колонии целый тюк болотной травы.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Многие наемники не прочь иногда покурить травки. Я даже смог сколотить небольшое состояние на этом.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Но какой-то ублюдок украл эту траву из моего сундука!
	Log_CreateTopic(Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherPaket,LOG_Running);
	B_LogEntry(Topic_CipherPaket,"Наемник Сайфер потерял тюк болотной травы.");

	if(!Npc_IsDead(Bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Я почти уверен, что это Бодо. Он спит в той же комнате, что и я, и всегда ухмыляется при встрече, как идиот...
		B_LogEntry(Topic_CipherPaket,"Он подозревает, что его украл Бодо.");
	};
	MIS_Cipher_Paket = LOG_Running;
};

instance DIA_Cipher_MoreDrugs(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Condition;
	information = DIA_Cipher_MoreDrugs_Info;
	permanent = FALSE;
	description = "Целый пакет болотника?!";
};

func int DIA_Cipher_MoreDrugs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Info()
{
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_00");	//Целый пакет болотника?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_01");	//А тебя это удивляет? Он был крайне ходовым товаром в колонии.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_02");	//И его производством занимались не только эти чокнутые придурки на болотах.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_03");	//Кстати...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_04");	//Я даже знаю место, где можно раздобыть еще один такой пакет!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_05");	//Правда? И где же?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_06");	//(улыбается) Хочешь подзаработать, да?
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_07");	//Не отказался бы.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_08");	//В свое время, один парень по имени Джако организовал лабораторию по производству болотника, недалеко от входа в Новый лагерь.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_09");	//У него там были целые залежи этой болотной травы!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_10");	//Думаешь, там еще могло что-то остаться?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_11");	//Возможно... (задумчиво) Правда, проверить это будет довольно трудно. Ведь там сейчас кругом орки!
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_12");	//Но если вдруг все-таки решишь наведаться в Долину Рудников, можешь попробовать заглянуть и туда.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_13");	//Только не забудь, что это я рассказал тебе о том месте!
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_01_14");	//Не волнуйся. Я все понимаю.
	MIS_MoreDrugs = LOG_Running;
	Log_CreateTopic(Topic_MoreDrugs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Running);
	B_LogEntry(Topic_MoreDrugs,"Сайфер рассказал мне о секретной лаборатории по производству болотной травы. Она находилась недалеко от входа в Новый лагерь.");
};

instance DIA_Cipher_MoreDrugs_Done(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Done_Condition;
	information = DIA_Cipher_MoreDrugs_Done_Info;
	permanent = FALSE;
	description = "У меня есть с собой еще один пакет болотника.";
};

func int DIA_Cipher_MoreDrugs_Done_Condition()
{
	if((MIS_MoreDrugs == LOG_Running) && (Npc_HasItems(hero,ItMi_JointPacket_OW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_00");	//У меня есть с собой еще один пакет болотника.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_01");	//(улыбаясь) Ты все-таки побывал там! Ну ты смельчак.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_02");	//Давай поступим так: ты отдашь мне этот пакет, а я тебе половину той суммы, которую можно будет выручить за него.
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_03");	//И сколько это в золоте?
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_04");	//Дай мне подумать... Ну, порядка тысячи монет! Ну так что, по рукам?
	AI_Output(other,self,"DIA_Cipher_MoreDrugs_Done_01_05");	//Договорились! Вот, держи пакет.
	B_GiveInvItems(other,self,ItMi_JointPacket_OW,1);
	Npc_RemoveInvItems(self,ItMi_JointPacket_OW,1);
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_06");	//Отлично! (довольно) Теперь моя жизнь на этой ферме станет не такой скучной.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_Done_01_07");	//Здесь твоя доля. Только не пропей ее сразу! (смеется)
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_MoreDrugs = LOG_Success;
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Success);
	B_LogEntry(Topic_MoreDrugs,"Я продал Сайферу пакет с болотником за тысячу золотых монет.");
	AI_StopProcessInfos(self);
};

instance DIA_Cipher_DoWithThief(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DoWithThief_Condition;
	information = DIA_Cipher_DoWithThief_Info;
	permanent = FALSE;
	description = "И что ты собираешься делать с вором?";
};

func int DIA_Cipher_DoWithThief_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DoWithThief_Info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//И что ты собираешься делать с вором?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Когда-нибудь я поймаю его, когда он будет курить мою траву.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//И тогда, я найду укромное местечко и преподам ему урок, который он не скоро забудет.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Если я вырублю его прямо здесь, посреди двора, на глазах у фермеров, я могу поплатиться за это.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Это почему?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//Вес просто. Мы не можем досаждать фермерам, иначе Ли заставит нас заплатить солидный штраф. Так распорядился Онар.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//И чем больше свидетелей, тем больший шум поднимется. И штраф будет больше.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Так что это нужно будет сделать аккуратно и тихо...
};


instance DIA_Cipher_WannaJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_WannaJoin_Condition;
	information = DIA_Cipher_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к людям Ли!";
};


func int DIA_Cipher_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Я хочу присоединиться к людям Ли!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Людям ЛИ?! Если Ли будет продолжать в том же духе, они скоро перестанут быть его людьми!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Почему?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Ли всегда был очень спокойным. И в колонии он вел себя так же.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Но последнее время это стало уж слишком. Он хочет просто сидеть здесь и ждать, пока паладины не помрут с голоду.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Сильвио думает, что мы должны пошерстить немного на небольших фермах у города.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Я думаю, это была бы превосходная смена обстановки.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//А сейчас большинство из нас просто бьют баклуши здесь. И ты все равно хочешь присоединиться?
};


instance DIA_Cipher_YesJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_YesJoin_Condition;
	information = DIA_Cipher_YesJoin_Info;
	permanent = FALSE;
	description = "Я все равно хочу стать одним из вас!";
};


func int DIA_Cipher_YesJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_YesJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Я все равно хочу стать одним из вас!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Ты уже знаешь, что мы голосуем за каждого новобранца?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//Ну, я уже давно ничего не курил. Принеси мне несколько косяков из болотной травы, и ты получишь мой голос.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Я уверен, тебе удастся что-нибудь найти.
	MIS_Cipher_BringWeed = LOG_Running;
	Log_CreateTopic(Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_Running);
	B_LogEntry(Topic_CipherHerb,"Сайфер отдаст свой голос за меня, если я принесу ему несколько косяков болотной травы.");
};


instance DIA_Cipher_Joints(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_Joints_Condition;
	information = DIA_Cipher_Joints_Info;
	permanent = TRUE;
	description = "Насчет болотной травы...";
};


func int DIA_Cipher_Joints_Condition()
{
	if(MIS_Cipher_BringWeed == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cipher_Joints_Info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Насчет болотной травы...
	if(MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Ты принес назад мой тюк! Теперь все будет отлично!

		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Я обязательно проголосую за тебя.
			B_LogEntry(TOPIC_SLDRespekt,"Сайфер проголосует за меня, когда я решу присоединиться к наемникам.");
		};

		MIS_Cipher_BringWeed = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(DIA_Cipher_Joints);
		Info_AddChoice(DIA_Cipher_Joints,"Я посмотрю, что можно сделать.",DIA_Cipher_Joints_Running);

		if(Npc_HasItems(other,ItMi_Joint) > 0)
		{
			Info_AddChoice(DIA_Cipher_Joints,"Вот несколько косяков для тебя...",DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Посмотрим, что можно сделать.
	Info_ClearChoices(DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Вот несколько косяков для тебя.
	if(B_GiveInvItems(other,self,ItMi_Joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ах! Ты наш человек!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Ты получишь мой голос.
			B_LogEntry(TOPIC_SLDRespekt,"Сайфер проголосует за меня, когда я решу присоединиться к наемникам.");
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//Это все? Да я выкурю это за один присест!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//Мне нужно хотя бы десять косяков.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//Ладно, ты получишь мой голос.
		};
	};
	Info_ClearChoices(DIA_Cipher_Joints);
};

instance DIA_Cipher_TRADE(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TRADE_Condition;
	information = DIA_Cipher_TRADE_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Cipher_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && Wld_IsTime(7,35,23,35))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Покажи мне свои товары.

	if(Npc_HasItems(self,ItMi_Joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Конечно! Выбирай.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//У меня сейчас нет болотной травы. Ты хочешь что-нибудь еще?
	};
};


instance DIA_Cipher_DarDieb(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarDieb_Condition;
	information = DIA_Cipher_DarDieb_Info;
	permanent = FALSE;
	description = "Я знаю, кто взял твою траву.";
};


func int DIA_Cipher_DarDieb_Condition()
{
	if(((Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE)) && !Npc_IsDead(Dar))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Я знаю, кто взял твою траву.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Кто? Это был Бодо?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Нет, это сделал один из наемников - Дар.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//Этот ублюдок! Где он?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Даже если ты найдешь его, это тебе не поможет, у него больше нет этого тюка. Он продал его в Хоринисе.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//ГДЕ ОН?!

	if(Npc_GetDistToWP(Dar,"NW_BIGFARM_KITCHEN_DAR") < 300)
	{
		AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//За кухней, на углу...
	};

	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//Я ПРИКОНЧУ ЕГО!
	AI_StopProcessInfos(self);
	CipherGoDar = TRUE;
};

instance DIA_Cipher_DarLOST(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarLOST_Condition;
	information = DIA_Cipher_DarLOST_Info;
	permanent = FALSE;
	description = "Ты сделал из Дара отбивную... Теперь тебе лучше?";
};


func int DIA_Cipher_DarLOST_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarLOST_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Ты сделал из Дара отбивную... Теперь тебе лучше?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(вздыхает) Да, немного лучше.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Но не для НЕГО, я полагаю...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Этот мерзкий воришка не должен был лазить в мой сундук!
	B_GivePlayerXP(XP_Ambient * 2);
};


instance DIA_Cipher_KrautPaket(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_KrautPaket_Condition;
	information = DIA_Cipher_KrautPaket_Info;
	permanent = FALSE;
	description = "Это случайно не твой тюк болотной травы?";
};


func int DIA_Cipher_KrautPaket_Condition()
{
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cipher_KrautPaket_Info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Это случайно не твой тюк болотной травы?
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//Да, мой! Где ты нашел его?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//Это долгая история...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//Ладно, это не важно, но теперь я знаю, что ты наш человек.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Эй, возьми это в награду.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_GivePlayerXP(XP_Cipher_KrautPaket);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Сейчас я скручу пару косячков...
	CreateInvItems(self,ItMi_Joint,40);
	Npc_RemoveInvItems(self,ItMi_HerbPaket,1);
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};


instance DIA_CipherSLD_PICKPOCKET(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 900;
	condition = DIA_CipherSLD_PICKPOCKET_Condition;
	information = DIA_CipherSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_CipherSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(65,65);
};

func void DIA_CipherSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,Dialog_Back,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

