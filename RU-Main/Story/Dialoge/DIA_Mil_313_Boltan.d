
instance DIA_Boltan_EXIT(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 999;
	condition = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Boltan_PICKPOCKET(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 998;
	condition = DIA_Boltan_PICKPOCKET_Condition;
	information = DIA_Boltan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Boltan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Boltan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,Dialog_Back,DIA_Boltan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Boltan_PICKPOCKET_DoIt);
};

func void DIA_Boltan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

func void DIA_Boltan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

instance DIA_Boltan_HALLO(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Что тебе нужно?
};


instance DIA_Boltan_ToConvicts(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent = TRUE;
	description = "Я хочу увидеть заключенных.";
};


func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Я хочу увидеть заключенных.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Да, иди попрощайся со своим приятелем.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Мы арестовали эту свинью, что убила паладина Лотара.
		};
	}
	else if(((Canthar_Ausgeliefert == FALSE) || (Canthar_WiederRaus == TRUE)) && (Sarah_Ausgeliefert == FALSE) && (Rengaru_Ausgeliefert == FALSE) && (Nagur_Ausgeliefert == FALSE) && (CANTHAR_AUSGELIEFERT2 == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Все камеры сейчас пусты.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Хорошо, приятель.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Конечно.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Иди, но не задерживайся там слишком долго, понятно?
	};
};


instance DIA_Boltan_HalloBennet(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloBennet_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Ты ведь пришел не затем, чтобы вызволить отсюда своего приятеля, нет?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Забудь об этом! Как только я подниму тревогу, парни будут здесь в мгновение ока!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//И тогда мы сделаем из тебя котлету! (грязный смех)
};


instance DIA_Boltan_HalloCanthar(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloCanthar_Condition()
{
	if(((Kapitel != 3) || ((Kapitel == 3) && ((MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (Canthar_WiederRaus == TRUE) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Эй, ты тот парень, что написал жалобу на Кантара, торговца.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Много людей приходило, чтобы похлопотать за него. Уважаемых людей.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Должно быть, произошло какое-то недоразумение. Такое бывает.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//В будущем тебе стоит быть тщательнее выбирать, кого ты хочешь упечь в тюрьму.
};


instance DIA_BOLTAN_SARAHELPSTWO(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = dia_boltan_sarahelpstwo_condition;
	information = dia_boltan_sarahelpstwo_info;
	permanent = FALSE;
	description = "Мне кое-что нужно от тебя!";
};


func int dia_boltan_sarahelpstwo_condition()
{
	if(MIS_SARAHELPSTWO == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwo_info()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_02");	//Ты забрал у торговки Сары кольцо. Отдай его мне!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_03");	//Что? С чего ты вообще это взял?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_04");	//Она сама мне сказала об этом.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_05");	//Да?! (злобно) Вот дрянь!
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_06");	//Поэтому не валяй дурака и давай его сюда.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_07");	//(нагло) Ага! Конечно!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_08");	//Это кольцо мое! Так что забудь об этом.
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	Info_AddChoice(dia_boltan_sarahelpstwo,"Отдай мне кольцо или пожалеешь об этом!",dia_boltan_sarahelpstwo_kill);
	Info_AddChoice(dia_boltan_sarahelpstwo,"Тогда, продай мне его!",dia_boltan_sarahelpstwo_buy);
	if(other.guild == GIL_KDF)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Ты смеешь противиться воле мага Огня?",dia_boltan_sarahelpstwo_kdf);
	};
	if(other.guild == GIL_PAL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Ты посмеешь ослушаться приказа паладина?",dia_boltan_sarahelpstwo_pal);
	};
	if(other.guild == GIL_MIL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Тогда я скажу лорду Андрэ, что ты украл это кольцо.",dia_boltan_sarahelpstwo_mil);
	};
};

func void dia_boltan_sarahelpstwo_kdf()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_KDF_01_00");	//Ты смеешь противиться воле служителя Инноса?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_KDF_01_01");	//Нет! Что ты! Я...(запинаясь)
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_KDF_01_04");	//Вот, почтенный - держи его.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Болтан не стал перечить мне, поскольку я маг Огня. Он отдал мне кольцо Сары.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_pal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_PAL_01_00");	//Ты смеешь противиться воле служителя Инноса?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_PAL_01_01");	//Нет! Что ты! Я...(запинаясь)
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_PAL_01_04");	//Вот, держи его.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Болтан не стал перечить мне, поскольку я паладин. Он отдал мне кольцо Сары.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_mil()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_MIL_01_00");	//Тогда я скажу лорду Андрэ, что ты украл это кольцо.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_MIL_01_01");	//И ты думаешь, он тебе поверит?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_MIL_01_02");	//А почему нет? В конце концов, я такой же солдат ополчения, как и ты.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_MIL_01_06");	//Хорошо...(злобно) Черт с тобой! Вот, забирай его!
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Я сумел 'уговорить' Болтана отдать мне кольцо. Теперь его нужно отнести Саре.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_buy()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_00");	//Тогда продай мне его!
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_05");	//Сколько ты хочешь за него?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_06");	//Ну...(задумчиво) предположим, я хочу за него...
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_07");	//Пятьсот золотых монет!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_09");	//(ехидно) Это неплохая цена для такой вещицы, правда?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_11");	//Хорошо, я подумаю над твоим предложением.
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Я сумел уговорить Болтана продать мне кольцо Сары за пятьсот золотых монет.");
	BOLTANTRADERING = TRUE;
};

func void dia_boltan_sarahelpstwo_kill()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Kill_01_00");	//Отдай мне кольцо или пожалеешь об этом!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_01");	//Правда? (смеется) И что же ты сделаешь?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Kill_01_02");	//Просто надеру тебе задницу, подонок!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_04");	//ЧТО?!...(злобно) Ты еще смеешь мне угрожать?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_05");	//Ну я сейчас тебе покажу, сосунок!
	CreateInvItems(self,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Я не смог уговорить Болтана отдать мне кольцо Сары. Теперь единственный способ получить его обратно - это побить его.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BOLTAN_SARAHELPSTWOBUYRING(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = dia_boltan_sarahelpstwobuyring_condition;
	information = dia_boltan_sarahelpstwobuyring_info;
	permanent = TRUE;
	description = "Продай мне кольцо Сары.";
};


func int dia_boltan_sarahelpstwobuyring_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (BOLTANTRADERING == TRUE) && (BOLTANTRADERINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwobuyring_info()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_00");	//Продай мне кольцо Сары.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_01");	//А где мои пятьсот золотых?
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_02");	//Вот твои деньги.
		AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_03");	//Хорошо! Вот, держи свою побрякушку.
		B_GiveInvItems(self,other,itri_sarafamilyring,1);
		B_LogEntry(TOPIC_SARAHELPSTWO,"Я выкупил у Болтана кольцо. Теперь его нужно отнести Саре.");
		BOLTANTRADERINGDONE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_06");	//У меня их пока нет.
		AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_07");	//Тогда приходи, когда они у тебя будут.
		AI_StopProcessInfos(self);
	};
};

