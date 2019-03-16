
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return C_Beklauen(118,300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Эй, если тебе нужен торговец, то ты его нашел.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Моя лавка находится за домом Эстебана. Если тебе что-нибудь понадобится, заходи.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Фиск продает самые разные товары.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


var int fiskarrowsday;

instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE)) || (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	daynow = Wld_GetDay();

	if(FISKARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (FISKARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - FISKARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			FISKARROWSDAY = daynow;
		};
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Слушай, я не имею к этому делу никакого отношения, понятно?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//У меня свои заботы. К тому же я сам стал жертвой злодеяния.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Каким образом?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//За последнюю партию товара я заплатил солидную сумму золотом.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Но товар я так и не получил! Один подонок украл его у меня.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//Меня обокрали, и это сделал кое-кто из моих же людей!
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "Что за товар ты должен был получить?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Fisk_Attentat)) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Что за товар ты должен был получить?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Пакет с отмычками. Кто-то должен был принести мне его от пиратов.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Но парень по имени Хуан украл и отмычки, и золото, которое я заплатил!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Этот ублюдок прячется где-то на болоте.
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Тип по имени Хуан участвовал в торговле с бандитами. Он скрывается где-то на болотах.");
	B_LogEntry_Quiet(Topic_Addon_Fisk,"Тип по имени Хуан перехватил поставку для Фиска (пакет отмычек). Он скрывается где-то на болотах.");
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Он мертв.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Хорошо, значит, он больше не сможет доставлять мне неприятности!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Он все еще жив...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ты оставил эту тварь в живых?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Он был не один...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Ну ладно. Я сам разберусь с этими ворами...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Думаю, что тебя это заинтересует...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//У меня хорошие отношения с Хуно.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Я поговорю с ним, и он сделает тебе скидку на доспехи.
	Huno_ArmorCheap = TRUE;
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Да, и возьми вот этот камень. Я когда-то получил его от Корристо.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Это единственная вещь, которая сохранилась у меня после путешествия через Барьер. Я думаю, ты найдешь ему применение.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//И еще я дам тебе это оружие.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//Рука руку моет! Старый принцип, который работает и по сей день.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "Я принес тебе твой пакет.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Я принес тебе твой пакет.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	Npc_RemoveInvItems(self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//Замечательно...(подозрительно) А что с Хуаном?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "Я открыл твой пакет!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Я открыл твой пакет!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//Ну конечно...(смеется) Тебе не терпелось узнать, что внутри, не так ли?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Отмычки-то ты хотя бы принес?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//И что еще более важно, что с Хуаном?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "Вот твоя дюжина отмычек.";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen) && (MIS_Lennar_Lockpick == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Вот твоя дюжина отмычек.
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Очень хорошо! Покупатели их уже заждались.
		B_Addon_Fisk_Belohnung();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//Здесь нет дюжины отмычек! Ты же не пытаешься меня обмануть, верно?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "Хуан работал на Эстебана!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Хуан работал на Эстебана!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//Что?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Не играй со мной в свои игры! Ты знал об этом!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(спокойно) Хорошо. Ты прав. Но я надеюсь, что ты понимаешь, почему я тебе об этом не сказал.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Каждый в этом лагере знает, что ты тоже работаешь на Эстебана.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//У меня нет никакого желания быть втянутым в эту историю из-за твоего дурацкого энтузиазма.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Собственно, я и не работаю на Эстебана.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Я не верю тебе!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Понимаю!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Понимаю!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Хорошо! В таком случае оставим этот вопрос. Я не хочу, чтобы нас подслушали!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Я тебе не верю!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Не верь, дело твое! Но предупреждаю тебя, приятель, проговорись ты хоть словом об этом Эстебану - тебе не жить!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Собственно, я и не работаю на Эстебана.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Кого ты хочешь тут обмануть, лопух? Не дорос еще до этого.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Мой тебе совет: не трать понапрасну время.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Когда речь заходит об Эстебане, никому не доверяй. Даже мне.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//И хватит об этом. Глядишь, подслушают еще.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "Значит, ты спланировал нападение!";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//Значит, ты спланировал нападение!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Да. Эстебан стоит на моем пути. И это нехорошо.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Он не позволяет никому из бандитов работать на меня на руднике. Он хочет, чтобы все работали только на него.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Так он хочет получать свою долю с каждой сделки и держать весь лагерь за задницу.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"Что ты собираешься делать дальше?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"И ты, я полагаю, хочешь сам контролировать лагерь.",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"Знаешь, я ведь могу тебя выдать Эстебану.",DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//И ты, я полагаю, хочешь сам контролировать лагерь.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Нет. Я ведь простой торговец. Я всего лишь хочу, чтобы моему делу никто не мешал.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Знаешь, я ведь могу тебя выдать Эстебану.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//И что? Что с того? Думаешь, что он даст все, что тебе нужно? Ха!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Забудь и выслушай меня. У меня есть идея получше?
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Что за идея?
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Мы уберем Эстебана с нашего пути. А это значит, ты его убьешь и займешь его место.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Пока с ним его охранники, он для меня недосягаем.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Тогда мы их выманим. Правдой.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Правдой?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Ты ведь выполнил свою работу. Ты узнал, что за нападением стоял я.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Скажи так Эстебану, и он отправит своих ребят сюда, чтобы покончить со мной. Тут-то я их и буду ждать.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Когда они уйдут, ты займешься ублюдком, а я - охранниками.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Эстебан мертв. Наконец-то я смогу вновь заняться своим делом.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Вот, держи, это для тебя.
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban,"Нападение на Эстебана заказал Фиск.");
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "С Эстебаном можно больше не считаться! Он мертв.";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && (Npc_IsDead(Esteban) == TRUE) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//С Эстебаном можно больше не считаться! Он мертв.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Давненько я этого ждал.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Я полагаю, у тебя дел невпроворот, да и у меня немало, так что давай расставаться.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//А если вдруг понадобится чего, ты знаешь, где меня искать.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_ADDON_FISK_RETFORD(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = dia_addon_fisk_retford_condition;
	information = dia_addon_fisk_retford_info;
	permanent = FALSE;
	description = "Рэтфорд передает тебе привет!";
};

func int dia_addon_fisk_retford_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_retford_info()
{
	B_GivePlayerXP(XP_FISKRETFORD);
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_00");	//Рэтфорд передает тебе привет!
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_03");	//Вот дьявол! Так этот пройдоха жив. И где он?
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_04");	//Я встретил его в Долине Рудников. Он там неплохо обосновался.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_05");	//Только это мне не хватало...
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_06");	//А ты чего так разнервничался?
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_07");	//Что, что... Да так, ничего. Старые долги!
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_08");	//Ты что-то должен Рэтфорду?
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_09");	//Не твое дело! Лучше будь другом - если встретишь его снова, передай ему этот пакет от меня.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_11");	//Я заплачу тебе за это.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_13");	//Скажем, сотню монет. Ну как, договорились?
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_14");	//Ладно, давай свой пакет и золото.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_15");	//Вот, держи. Только не потеряй.
	AI_Wait(self,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,itmi_fiskpacket,1);
	CreateInvItems(hero,ItMi_Gold,100);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_RATFORDFISK,"Я передал привет Фиску от Рэтфорда. Он немного занервничал, когда я заикнулся об этом, а затем попросил меня доставить Рэтфорду небольшой пакет странной формы.");
	HIFROMRATFORD = TRUE;
};

var int FiskABoutFingers;

instance DIA_ADDON_FISK_ORCINVASION(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	condition = dia_addon_fisk_orcinvasion_condition;
	information = dia_addon_fisk_orcinvasion_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_addon_fisk_orcinvasion_condition()
{
	if((FISK_TP == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_RATFORDFISK == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_orcinvasion_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_OrcInvasion_01_00");	//Я не в настроении сейчас разговаривать. Отвали!

	if((MIS_WhereFingers == LOG_SUCCESS) || (FingersMeet == TRUE) || (FiskABoutFingers == TRUE))
	{
		AI_StopProcessInfos(self);
		FISK_TP = TRUE;
	};
};

instance DIA_Addon_Fisk_WhereFingers(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_WhereFingers_condition;
	information = DIA_Addon_Fisk_WhereFingers_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о Фингерсе?";
};

func int DIA_Addon_Fisk_WhereFingers_condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == FALSE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_WhereFingers_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Fisk_WhereFingers_01_00");	//Ты что-нибудь знаешь о Фингерсе?
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_01");	//Хммм... Я его не видел с тех пор, как рухнул барьер.
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_02");	//Некоторые говорят, что он погиб. Хотя я в это лично не верю.
	AI_Output(other,self,"DIA_Addon_Fisk_WhereFingers_01_03");	//Почему?
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_04");	//Да не такой он был человек, чтобы вот так взять и сгинуть.
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_05");	//Но это просто мое мнение.
	FiskABoutFingers = TRUE;
	B_LogEntry(TOPIC_WhereFingers,"По мнению Фиска, Фингерс еще жив. Но где он, никто не знает.");
};

//---------------------------


instance DIA_NONE_1801_Fingers_EXIT(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 999;
	condition = DIA_NONE_1801_Fingers_EXIT_Condition;
	information = DIA_NONE_1801_Fingers_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_1801_Fingers_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1801_Fingers_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_1801_Fingers_PICKPOCKET(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 900;
	condition = DIA_NONE_1801_Fingers_PICKPOCKET_Condition;
	information = DIA_NONE_1801_Fingers_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1801_Fingers_PICKPOCKET_Condition()
{
	if((hero.attribute[ATR_DEXTERITY] >= 250) && (FingersPocket == FALSE) && ((MIS_TellAboutFingers == LOG_Running) || (MIS_TellAboutFingers == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,Dialog_Back,DIA_NONE_1801_Fingers_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1801_Fingers_PICKPOCKET_DoIt);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_DoIt()
{
	B_Beklauen_Fingers();
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

instance DIA_NONE_1801_Fingers_Hi(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Hi_Condition;
	information = DIA_NONE_1801_Fingers_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Hi_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_00");	//Вот так встреча!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_01");	//(грубо) Ты кто такой? Хотя подожди. Кажется, я узнаю твое лицо...
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_02");	//Ну да, вспомнил! Ты тот парень, которого я учил воровскому ремеслу в Старом лагере.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_03");	//Фингерс! Я думал, ты мертв.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_04");	//Это надо постараться, приятель, чтобы отправить меня на тот свет.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_05");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_06");	//Сам не знаю. Приплыл, наверное - как иначе? Кругом же море.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_07");	//Ты ничего не помнишь?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_08");	//Ну почему, кое-что помню.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_09");	//Когда рухнул барьер, все как один ринулись прочь из этой проклятой колонии.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_10");	//Большинство стражников и призраков ушли с Вороном. Он что-то говорил про северо-западную часть острова.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_11");	//А ты почему не пошел с ним?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_12");	//Мне были не по нраву его порядки.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_13");	//Тем более я хотел не просто выбраться из Долины Рудников, а навсегда убраться с этого острова.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_14");	//На восточном побережье я припрятал лодку на такой случай.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_15");	//И что ты сделал?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_16");	//Как что? Уплыл на ней. Правда, недалеко, как видишь.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_17");	//Налетел сильный шторм! А дальше все как в тумане.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_18");	//Очнулся я уже тут. 
	FingersMeet = TRUE;
	B_LogEntry(TOPIC_WhereFingers,"Я нашел Фингерса на берегу острова форта Азган. Эта новость обрадует Кассию.");
};

instance DIA_NONE_1801_Fingers_Place(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Place_Condition;
	information = DIA_NONE_1801_Fingers_Place_Info;
	permanent = FALSE;
	description = "Ты хоть знаешь, что это за место?";
};

func int DIA_NONE_1801_Fingers_Place_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Place_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Place_01_00");	//Ты хоть знаешь, что это за место?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_01");	//До последнего времени я этого не знал.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_02");	//Но когда сюда пришла армия паладинов, мне все стало ясно!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_03");	//Так что дальше этого места я не сунусь.
};

instance DIA_NONE_1801_Fingers_How(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_How_Condition;
	information = DIA_NONE_1801_Fingers_How_Info;
	permanent = FALSE;
	description = "И как тебе здесь?";
};

func int DIA_NONE_1801_Fingers_How_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_How_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_How_01_00");	//И как тебе здесь?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_01");	//Ничего... Уж получше, чем было в колонии!
	AI_Output(other,self,"DIA_NONE_1801_Fingers_How_01_02");	//Там сейчас хозяйничают орки.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_03");	//Я этому и не удивлен. Но сюда они вряд ли сунутся.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_04");	//Так что тут местечко хоть и не богатое, но зато спокойное.
};

instance DIA_NONE_1801_Fingers_WhatNext(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_WhatNext_Condition;
	information = DIA_NONE_1801_Fingers_WhatNext_Info;
	permanent = FALSE;
	description = "Что ты будешь делать дальше?";
};

func int DIA_NONE_1801_Fingers_WhatNext_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_WhatNext_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_WhatNext_01_00");	//Что ты будешь делать дальше?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_02");	//А что мне еще остается делать? Только сидеть тут и ждать удобного случая выбраться из этой дыры.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_WhatNext_01_03");	//Ты мог бы отправиться в форт.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_04");	//Ты шутишь?! (смеется) Да у меня на лице написано, что я преступник.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_05");	//И они меня вздернут на первом же суку.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_06");	//Нет, приятель! Я отсюда ни шагу не сделаю.
};

instance DIA_NONE_1801_Fingers_Stolen(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Stolen_Condition;
	information = DIA_NONE_1801_Fingers_Stolen_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Stolen_Condition()
{
 	if((Npc_HasItems(hero,ItMi_PocketFingers) >= 1) && (FingersPocket == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Info()
{
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_00");	//(смеясь) Ну надо же! Обокрасть самого Фингерса! Кто бы мог подумать...
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_01");	//Да, приятель. Ты зря времени не терял. Настоящий мастер своего дела!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_02");	//А теперь, будь добр, верни мне мой кошелек.
	Info_ClearChoices(DIA_NONE_1801_Fingers_Stolen);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"Нет, он мой.",DIA_NONE_1801_Fingers_Stolen_No);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"Конечно, вот он.",DIA_NONE_1801_Fingers_Stolen_Yes);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"А что я за это получу?",DIA_NONE_1801_Fingers_Stolen_What);
};

func void DIA_NONE_1801_Fingers_Stolen_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_No_01_00");	//Нет, он мой.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_No_01_01");	//Ну как знаешь.
	AI_StopProcessInfos(self);

	if(FingersInFort == FALSE)
	{
		B_Attack(self,other,AR_KILL,1);
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_Yes_01_00");	//Конечно, вот он.
	B_GiveInvItems(other,self,ItMi_PocketFingers,1);
	Npc_RemoveInvItems(self,ItMi_PocketFingers,1);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_01");	//Хорошо. Мозгами ты работаешь не хуже, чем руками.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_02");	//А раз так, возьми этот ключ.
	B_GiveInvItems(self,other,ItKe_FingersKey,1);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_03");	//Он от моего сундука, что остался в Долине Рудников.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_04");	//Мне он теперь без надобности, а ты в нем найдешь много полезных вещей.
	AI_StopProcessInfos(self);
};

func void DIA_NONE_1801_Fingers_Stolen_What()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_What_15_00");	//А что я за это получу?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_What_01_00");	//Сам увидишь!
};

instance DIA_NONE_1801_Fingers_Master(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Condition;
	information = DIA_NONE_1801_Fingers_Master_Info;
	permanent = FALSE;
	description = "Ты ведь разбераешься в замках?";
};

func int DIA_NONE_1801_Fingers_Master_Condition()
{
	if(MIS_FingersOpenDoor == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_00");	//Ты ведь разбираешься в замках?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_01");	//(смеется) В этом я лучший!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_02");	//А с чего это вдруг ты решил спросить?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_03");	//Паладины потеряли ключ от своего склада. А замок там слишком сложный.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_04");	//Вот я и подумал: правду ли говорят, что перед тобой не устоит ни один замок?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_05");	//Это правда. Но решать эту проблему им придется самим.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_06");	//Я к форту и близко не подойду!
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_07");	//А если я договорюсь с паладинами, чтобы они не трогали тебя?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_08");	//Думаешь, им можно доверять?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_09");	//А у тебя есть выбор? Или ты собираешься всю жизнь просидеть тут?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_10");	//Эх... Ладно! Я помогу им, но только при условии, что они сохранят мне жизнь.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_11");	//Хорошо, я поговорю с их предводителем.
	FingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor,"Фингерс согласился помочь паладинам с дверью при условии, что они его не тронут.");
};

instance DIA_NONE_1801_Fingers_Master_Ok(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Ok_Condition;
	information = DIA_NONE_1801_Fingers_Master_Ok_Info;
	permanent = FALSE;
	description = "Я поговорил с паладинами.";
};

func int DIA_NONE_1801_Fingers_Master_Ok_Condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (VarusFingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Ok_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_00");	//Я поговорил с паладинами.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_01");	//(с интересом) И что?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_02");	//Лорд Варус, их командующий, дал слово, что не тронет тебя, если ты поможешь им открыть эту дверь.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_03");	//Но только не вздумай красть у них! Иначе я уже не смогу тебе помочь.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_04");	//Само собой! Я что, похож на идиота?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_05");	//В таком случае они ждут тебя в форте.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_06");	//Хорошо. Только я посижу тут еще денек. Соберусь с мыслями, так сказать. А потом уже пойду к ним.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_07");	//Дело твое.
	FingersCrack = TRUE;
	FingersGoFort = Wld_GetDay();
	B_LogEntry(TOPIC_FingersOpenDoor,"Фингерс отправится в форт примерно через день. Надеюсь, паладины оценят его мастерство, когда он будет вскрывать эту дверь.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1801_Fingers_Master_Finish(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Finish_Condition;
	information = DIA_NONE_1801_Fingers_Master_Finish_Info;
	permanent = FALSE;
	description = "Ну, как все прошло?";
};

func int DIA_NONE_1801_Fingers_Master_Finish_Condition()
{
	if(FingersInFort == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Finish_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Finish_01_00");	//Ну как все прошло?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_01");	//Замок оказался действительно сложный!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_02");	//Тот, кто его делал, знает в них толк.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_03");	//Но, как ты понимаешь, меня это не остановило. Я вскрыл его даже не вспотев!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_04");	//Теперь я на хорошем счету у лорда Варуса. Что странно даже для меня...
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Finish_01_05");	//Выходит, со старыми делами покончено?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_06");	//Выходит, что так. Не скажу, что мне это совсем по душе.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_07");	//Но тут неплохо кормят, да и выпивка имеется!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_08");	//А это уж точно лучше, чем болтаться с веревкой на шее! (смеется)
	THIEF_REPUTATION = THIEF_REPUTATION + 15;

	if(MIS_FingersOpenDoor == LOG_Running)
	{
		B_LogEntry(TOPIC_FingersOpenDoor,"Как и ожидалось, Фингерс без труда вскрыл замок у склада.");
	};
};

instance DIA_NONE_1801_Fingers_OpenSkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_OpenSkald_Condition;
	information = DIA_NONE_1801_Fingers_OpenSkald_Info;
	permanent = FALSE;
	description = "Значит, склад теперь открыт?";
};

func int DIA_NONE_1801_Fingers_OpenSkald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Master_Finish) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_OpenSkald_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_OpenSkald_01_00");	//Значит, склад теперь открыт?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_OpenSkald_01_01");	//Нет. Я сделал новый ключ и отдал его Варусу.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_OpenSkald_01_02");	//Так что он под надежным замком.
	FingersTellKey = TRUE;
};

var int FingersCanGaveMeKey;

instance DIA_NONE_1801_Fingers_GetKeySkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Info;
	permanent = FALSE;
	description = "А сможешь сделать еще один такой?";
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Condition()
{
	if((FingersTellKey == TRUE) && (HavePalSkladMeKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_00");	//А сможешь сделать еще один такой?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_01");	//Хммм...(с прищуром) Что, хочешь лично осмотреть их склад?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_02");	//Можно сказать и так.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_03");	//Кммм... Сделать я конечно смогу. Но для меня это слишком рискованно! Ведь пропади у них там что-то и все обвинения лягут на меня.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_04");	//Я хорошо заплачу. К тому же я уверен, что паладины не так уж и тщательно следят за своим добром.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_05");	//У них сейчас есть дела и поважней. Например, орки!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_06");	//Ну, хорошо. Считай, что убедил меня. Но это будет тебе стоить не меньше двух тысяч золотых монет.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald,"Тогда, лучше поговорим об этом позже.",DIA_NONE_1801_Fingers_GetKeySkald_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald,"Хорошо. Вот твои деньги.",DIA_NONE_1801_Fingers_GetKeySkald_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_00");	//Тогда, лучше поговорим об этом позже.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_01");	//Как скажешь.
	FingersCanGaveMeKey = TRUE;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00");	//Хорошо. Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01");	//Отлично! А вот твой ключ.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02");	//Вот ты плут! Выходит, что он уже был у тебя. И ты наверняка сам хотел заняться этим складом.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03");	//Неважно, что я хотел, мальчик. Главное, что все получили то, что хотели.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

instance DIA_NONE_1801_Fingers_GetKeySkald_Again(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Again_Info;
	permanent = TRUE;
	description = "Продай мне ключ от склада.";
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition()
{
	if((FingersCanGaveMeKey == TRUE) && (HavePalSkladMeKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Again_01_00");	//Продай мне ключ от склада.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Again_01_01");	//Как я уже говорил, это будет тебе стоить не меньше двух тысяч золотых монет.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again,"Тогда, лучше поговорим об этом позже.",DIA_NONE_1801_Fingers_GetKeySkald_Again_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again,"Хорошо. Вот твои деньги.",DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_00");	//Тогда, лучше поговорим об этом позже.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_01");	//Как скажешь.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00");	//Хорошо. Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01");	//Отлично! А вот твой ключ.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02");	//Вот ты плут! Выходит, что он уже был у тебя. И ты наверняка сам хотел заняться этим складом.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03");	//Неважно, что я хотел, мальчик. Главное, что все получили то, что хотели.
	HavePalSkladMeKey = TRUE;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};
