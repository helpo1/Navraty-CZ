var int HalvorInPrision;

instance DIA_Halvor_EXIT(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 999;
	condition = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Halvor_PICKPOCKET(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 900;
	condition = DIA_Halvor_PICKPOCKET_Condition;
	information = DIA_Halvor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Halvor_PICKPOCKET_Condition()
{
	return C_Beklauen(78,150);
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,Dialog_Back,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};


instance DIA_Halvor_Hallo(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hallo_Condition;
	information = DIA_Halvor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Halvor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Эй, тебе нужна рыба? У меня очень хорошая рыба - с самых глубин моря!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Халвор торгует рыбой в гавани.");
};


instance DIA_Halvor_TRADE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_TRADE_Condition;
	information = DIA_Halvor_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свою рыбу.";
};

func int DIA_Halvor_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) && Wld_IsTime(5,0,20,0) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Покажи мне свою рыбу.
	B_GiveTradeInv(self);
};


instance DIA_Halvor_Night(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Night_Condition;
	information = DIA_Halvor_Night_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Halvor_Night_Condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,ZS_Talk) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Эй, если ты хочешь купить рыбу, заходи ко мне завтра. Хорошо?
};

instance DIA_Addon_Halvor_Job(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Condition;
	information = DIA_Addon_Halvor_Job_Info;
	description = "У тебя есть для меня работенка?";
};

func int DIA_Addon_Halvor_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_Job_01_00");	//У тебя есть для меня работенка?
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_01");	//Да, думаю найдется. Мне как раз сейчас понадобились устрицы.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_02");	//Этот деликатес люди охотно разбирают.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_03");	//Так что если хочешь помочь, сходи на пляж и набери их с десяток.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_01_04");	//Только много золота за них я не обещаю. Но в долгу не останусь.
	AI_Output(other,self,"DIA_Addon_Halvor_Job_01_05");	//Договорились.
	MIS_HalvorShells = LOG_Running;
	Log_CreateTopic(TOPIC_HalvorShells,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Running);
	B_LogEntry(TOPIC_HalvorShells,"Халвору нужны устрицы. Он попросил меня сходить на пляж и набрать их порядка десяти штук.");
};

instance DIA_Addon_Halvor_Job_Done(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_Addon_Halvor_Job_Done_Condition;
	information = DIA_Addon_Halvor_Job_Done_Info;
	description = "Вот твои устрицы.";
};

func int DIA_Addon_Halvor_Job_Done_Condition()
{
	if((MIS_HalvorShells == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Shellflesh) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_Job_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Halvor_Job_Done_01_00");	//Вот твои устрицы.
	B_GiveInvItems(other,self,ItFo_Addon_Shellflesh,10);
	Npc_RemoveInvItems(self,ItFo_Addon_Shellflesh,10);
	AI_Output(self,other,"DIA_Addon_Halvor_Job_Done_01_01");	//Хорошо. За каждую из них я дам тебе пять золотых.
	AI_Output(self,other,"DIA_Addon_Halvor_Job_Done_01_02");	//Итого полсотни монет. Надеюсь, ты доволен?
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Addon_Halvor_Job_Done_01_03");	//Вполне.
	MIS_HalvorShells = LOG_Success;
	Log_SetTopicStatus(TOPIC_HalvorShells,LOG_Success);
	B_LogEntry(TOPIC_HalvorShells,"Я принес Халвору устрицы. За них он дал мне полсотни золотых.");
};

instance DIA_Addon_Halvor_MissingPeople(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 5;
	condition = DIA_Addon_Halvor_MissingPeople_Condition;
	information = DIA_Addon_Halvor_MissingPeople_Info;
	description = "Ты знаешь что-нибудь о пропавших людях?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Ты знаешь что-нибудь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Пропавших людях? Это порт, приятель. Такие события здесь не в диковинку.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Море жестоко. Оно нередко забирает человеческие жизни.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//В крупных портах, таких как Хоринис, капитаны больших кораблей набирают матросов для пополнения команды.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//А если они не находят добровольцев, людей могут затащить на корабль и против их воли. Так они и исчезают.
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,Dialog_Back,DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Но что это мог быть за корабль?",DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Ты знаешь кого-нибудь, кто пропал?",DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"А у тебя кто-нибудь пропал?",DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Ты знаешь кого-нибудь, кто пропал?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Нет. Попробуй спросить у корабельщиков.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Единственное, что смог мне посоветовать торговец рыбой Халвор - это обратиться к кораблестроителям.");
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Но что это мог быть за корабль?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Хороший вопрос. Ты прав, в последнее время корабли в Хоринис не заходят.
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//А у тебя кто-нибудь пропал?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//У меня? Нет.
};


instance DIA_Halvor_MESSAGE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_MESSAGE_Condition;
	information = DIA_Halvor_MESSAGE_Info;
	permanent = FALSE;
	description = "Я думаю, этот клочок бумаги имеет отношение к тебе...";
	trade = FALSE;
};


func int DIA_Halvor_MESSAGE_Condition()
{
	if(Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Я думаю, этот клочок бумаги имеет отношение к тебе...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Что?.. Дай посмотрю.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(в испарине) Э-э... Хорошо, давай поговорим спокойно об этом - э-э... послушай. Я перепродал товары, полученные от бандитов.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(торопливо) Но нет необходимости сообщать об этом ополчению, правда? Я уверен, мы можем прийти к взаимопониманию, разве нет?
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Ну, попробуй сделать мне предложение.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Похоже, тебе светит тюрьма.",DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Ну, попробуй сделать мне предложение.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Хорошо. Послушай меня. Я могу продать тебе не только рыбу.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Если ты отдашь мне этот клочок бумаги, э-э... и забудешь об этом, ты и я можем стать отличными торговыми партнерами.
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Хорошо, договорились.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Похоже, тебе светит тюрьма.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Да ну?! И что это за товары?",DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Похоже, тебе светит тюрьма.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Нет, подожди, ты е можешь поступить так! Ведь я... я... ты же понимаешь... я мелкая рыбешка.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//Тебе стоило подумать об этом раньше. А теперь я собираюсь сообщить о тебе лорду Андрэ.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Ты пожалеешь об этом.
	Betrayal_Halvor = TRUE;
	HalvorInPrision = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Да ну?! И что это за товары?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Ну, я мог бы предложить тебе... особенную рыбу, понимаешь? Не простую рыбешку, которая годится только для еды.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Ты имеешь в виду что-то вроде рыбы, содержащей твое тайное послание?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Ты все правильно понимаешь. У меня есть несколько таких... рыб.
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Хорошо, договорились. Я думаю, мы сохраним все это в тайне.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Спасибо. Заходи, когда опять будешь неподалеку. Я приготовлю очень интересные вещички для тебя.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
	Npc_RemoveInvItems(self,ItWr_HalvorMessage,1);
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};


instance DIA_Halvor_Zeichen(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent = FALSE;
	description = "(Показать знак воров)";
};

func int DIA_Halvor_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Понимаю! Ты пришел не просто купить рыбу.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//Я готов сделать тебе предложение...(тихо) Если у тебя есть серебряные или золотые вещи и украшения, я возьму их по хорошей цене.
	CreateInvItems(self,ItKE_lockpick,20);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Халвор купит серебряные или золотые вещи и украшения по очень хорошей цене.");
};


instance DIA_HALVOR_ZEICHEN_MURDER(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = dia_halvor_zeichen_murder_condition;
	information = dia_halvor_zeichen_murder_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_zeichen_murder_condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE) && (KILLTARGET3 == TRUE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_murder_info()
{
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_00");	//С тех пор как ты появился, были убиты некоторые влиятельные жители этого города.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_01");	//Эти убийства сильно усложнили жизнь честным ворам.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_02");	//И я подозреваю тебя в причастности к этим убийствам.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Murder_06_03");	//Я отказываюсь покупать у тебя вещи! Воры с убийцами не ведут общие дела.
	Betrayal_Halvor = TRUE;
	B_LogEntry(Topic_Diebesgilde,"Халвор подозревает о моей причастности к убийствам мирных горожан и отказался вести со мной дела.");
};


instance DIA_Halvor_Hehlerei(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent = TRUE;
	description = "(...продать золотые и серебрянные вещи)";
};

func int DIA_Halvor_Hehlerei_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Halvor_Zeichen) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0;

	if(Halvor_Day != Wld_GetDay())
	{
		if((Npc_HasItems(other,ItMi_SilverPlate) >= 1) || (Npc_HasItems(other,ItMi_SilverCup) >= 1) || (Npc_HasItems(other,ItMi_SilverRing) >= 1) || (Npc_HasItems(other,ItMi_RingGold) >= 1) || (Npc_HasItems(other,ItMi_SilverChalice) >= 1) || (Npc_HasItems(other,ItMi_SilverCandleHolder) >= 1) || (Npc_HasItems(other,ItMi_SilverNecklace) >= 1) || (Npc_HasItems(other,ItMi_HolderGoldCandle) >= 1) || (Npc_HasItems(other,ItMi_NecklaceGold) >= 1) || (Npc_HasItems(other,ItMi_PlateGold) >= 1) || (Npc_HasItems(other,ItMi_CupGold) >= 1) || (Npc_HasItems(other,ItMi_ChaliceGold) >= 1) || (Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) >= 1))
		{
			Halvor_Score = (Npc_HasItems(other,ItMi_SilverPlate) * (Value_SilverPlate / 2)) + (Npc_HasItems(other,ItMi_SilverCup) * (Value_SilverCup / 2)) + (Npc_HasItems(other,ItMi_SilverRing) * (Value_SilverRing / 2)) + (Npc_HasItems(other,ItMi_RingGold) * (Value_GoldRing / 2)) + (Npc_HasItems(other,ItMi_SilverChalice) * (Value_SilverChalice / 2)) + (Npc_HasItems(other,ItMi_SilverCandleHolder) * (Value_SilverCandleHolder / 2)) + (Npc_HasItems(other,ItMi_SilverNecklace) * (Value_SilverNecklace / 2)) + (Npc_HasItems(other,ItMi_HolderGoldCandle) * (Value_GoldCandleHolder / 2)) + (Npc_HasItems(other,ItMi_NecklaceGold) * (Value_GoldNecklace / 2)) + (Npc_HasItems(other,ItMi_PlateGold) * (Value_GoldPlate / 2)) + (Npc_HasItems(other,ItMi_CupGold) * (Value_GoldCup / 2)) + (Npc_HasItems(other,ItMi_ChaliceGold) * (Value_GoldChalice / 2));
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//За твои вещички я дам тебе...
			B_Say_Gold(self,other,Halvor_Score);
			concatText = "Хальвор предлагает вам ";
			concatText = ConcatStrings(concatText,IntToString(Halvor_Score));
			concatText = ConcatStrings(concatText," монет...");
			AI_Print(concatText);
			Info_ClearChoices(DIA_Halvor_Hehlerei);
			Info_AddChoice(DIA_Halvor_Hehlerei,"Хорошо, я продаю.",DIA_Halvor_Hehlerei_Annehmen);
			Info_AddChoice(DIA_Halvor_Hehlerei,"Я еще подумаю.",DIA_Halvor_Hehlerei_Ablehnen);
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Заходи, когда у тебя будут золотые или серебряные тарелки, либо чаши.
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Ты можешь отдать мне свое серебро завтра! Сегодня слишком рано.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Извини, но сегодня я не готов вести дела. Заходи завтра, хорошо?
	};
};

func void DIA_Halvor_Hehlerei_Annehmen()
{
	var int amount;
	var string concatText;
	amount = Npc_HasItems(other,ItMi_SilverPlate) + Npc_HasItems(other,ItMi_SilverCup) + Npc_HasItems(other,ItMi_RingGold) + Npc_HasItems(other,ItMi_SilverRing) + Npc_HasItems(other,ItMi_SilverChalice) + Npc_HasItems(other,ItMi_SilverCandleHolder) + Npc_HasItems(other,ItMi_SilverNecklace) + Npc_HasItems(other,ItMi_HolderGoldCandle) + Npc_HasItems(other,ItMi_NecklaceGold) + Npc_HasItems(other,ItMi_PlateGold) + Npc_HasItems(other,ItMi_CupGold) + Npc_HasItems(other,ItMi_ChaliceGold) + Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_SilverCup,Npc_HasItems(other,ItMi_SilverCup));
	Npc_RemoveInvItems(other,ItMi_SilverPlate,Npc_HasItems(other,ItMi_SilverPlate));
	Npc_RemoveInvItems(other,ItMi_SilverRing,Npc_HasItems(other,ItMi_SilverRing));
	Npc_RemoveInvItems(other,ItMi_RingGold,Npc_HasItems(other,ItMi_RingGold));
	Npc_RemoveInvItems(other,ItMi_SilverChalice,Npc_HasItems(other,ItMi_SilverChalice));
	Npc_RemoveInvItems(other,ItMi_SilverCandleHolder,Npc_HasItems(other,ItMi_SilverCandleHolder));
	Npc_RemoveInvItems(other,ItMi_SilverNecklace,Npc_HasItems(other,ItMi_SilverNecklace));
	Npc_RemoveInvItems(other,ItMi_HolderGoldCandle,Npc_HasItems(other,ItMi_HolderGoldCandle));
	Npc_RemoveInvItems(other,ItMi_NecklaceGold,Npc_HasItems(other,ItMi_NecklaceGold));
	Npc_RemoveInvItems(other,ItMi_PlateGold,Npc_HasItems(other,ItMi_PlateGold));
	Npc_RemoveInvItems(other,ItMi_CupGold,Npc_HasItems(other,ItMi_CupGold));
	Npc_RemoveInvItems(other,ItMi_ChaliceGold,Npc_HasItems(other,ItMi_ChaliceGold));
	B_GiveInvItems(self,other,ItMi_Gold,Halvor_Score);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Хорошо. Продано!
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Мы заключили несколько хороших сделок сегодня. Лучше не приходи ко мне до завтра, это может вызвать подозрения, понимаешь?
	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

instance DIA_Halvor_Crew(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 51;
	condition = DIA_Halvor_Crew_Condition;
	information = DIA_Halvor_Crew_Info;
	permanent = FALSE;
	description = "Я набираю команду.";
};

func int DIA_Halvor_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Я набираю команду.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//А как ты планируешь уплыть отсюда?
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,"Это мое дело.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew,"Здесь есть подходящий корабль.",DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//Это мое дело.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Как знаешь. Это действительно не мое дело.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Хочешь плыть со мной?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew,"Ты можешь помочь мне?",DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Здесь есть подходящий корабль.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Да, точно. Ты это серьезно? Паладины сделают из тебя котлету, если доберутся до тебя.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Поступай как знаешь, но я не собираюсь рисковать своей шкурой.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Хочешь плыть со мной?",DIA_Halvor_Crew_JoinMe);
	if(Npc_IsDead(Jack) == FALSE)
	{
		Info_AddChoice(DIA_Halvor_Crew,"Ты можешь помочь мне?",DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Хочешь плыть со мной?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Неет, спасибо. У меня и здесь работы хватает. Кроме того, если честно, я не хочу повстречаться с галерой, полной орков.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Но я все же желаю тебе удачи.
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Ты можешь помочь мне?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Я не очень подхожу для этого. Лучше поговори с Джеком, он должен ошиваться где-то здесь, в гавани. Он лучше знает, что тебе нужно для этого путешествия.
};

func void DIA_Halvor_Crew_BACK()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};

instance DIA_HALVOR_NEKRO_FEAR(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = dia_halvor_nekro_fear_condition;
	information = dia_halvor_nekro_fear_info;
	permanent = TRUE;
	description = "Знаешь, я тут подумал сделать из тебя скелета.";
};

func int dia_halvor_nekro_fear_condition()
{
	if((Betrayal_Halvor == TRUE) && (hero.guild == GIL_KDM) && (HalvorInPrision == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_nekro_fear_info()
{
	Betrayal_Halvor = FALSE;
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_01");	//Знаешь, я тут подумал сделать из тебя скелета.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_02");	//Мне как раз не помешает смышленый костлявый помощник.
	AI_Output(self,other,"DIA_Halvor_NEKRO_FEAR_00_03");	//Ты что, с ума сошел?!...(в панике) ТЫ НЕ МОЖЕШЬ СО МНОЙ ТАК ПОСТУПИТЬ! Я ПОЗОВУ СТРАЖУ!
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_04");	//И когда ты станешь мерзкой нежитью, прийдут паладины и превратят тебя в труху.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_05");	//Ну, это в лучшем случае!
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_06");	//Правда есть и другой вариант. Ты продолжаешь скупать у меня наворованное золото и серебро, а я тебя не трогаю.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_07");	//Ну как, смекаешь, Халвор?
	AI_Output(self,other,"DIA_Halvor_NEKRO_FEAR_00_08");	//Эээ...(замявшись) Да, конечно! Считай, что мы договорились.
	AI_Output(other,self,"DIA_Halvor_NEKRO_FEAR_00_09");	//Вот и славно.
	B_LogEntry(Topic_Diebesgilde,"Халвор был смертельно напуган мной и согласился продолжить наше милое сотрудничество. А все-таки удобно быть некромантом и заклинателем демонов...");
};

instance DIA_HALVOR_Betrayal_Down(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 1;
	condition = DIA_HALVOR_Betrayal_Down_condition;
	information = DIA_HALVOR_Betrayal_Down_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_HALVOR_Betrayal_Down_condition()
{
	if((BEKILLMASTER == TRUE) && (HalvorInPrision == FALSE) && (Betrayal_Halvor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_HALVOR_Betrayal_Down_info()
{
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_01");	//Эй, приятель...(окликивая) 
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_02");	//Ходят слухи, что ты отправил на тот свет самого Асмала!
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_03");	//Хорошая работа, скажу я тебе! Теперь многие тут смогли наконец-то вздохнуть свободно.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_04");	//Поэтому, я тут принял решение возобновить наши торговые отношения.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_05");	//Ну если ты понимаешь, о чем я.
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_06");	//Понимаю.
	AI_Output(self,other,"DIA_HALVOR_Betrayal_Down_00_07");	//Вот и отлично...(улыбаясь) Так что, если что обращайся!
	AI_Output(other,self,"DIA_HALVOR_Betrayal_Down_00_08");	//Конечно.
	Betrayal_Halvor = FALSE;
	B_LogEntry(Topic_Diebesgilde,"Халвор был рад узнать, что это я убил Асмала! Теперь он хочет возобновить наши с ним торговые отношения.");
};

instance DIA_Halvor_HauntedLH(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 3;
	condition = DIA_Halvor_HauntedLH_condition;
	information = DIA_Halvor_HauntedLH_info;
	permanent = FALSE;
	description = "Ты знаешь человека по имени Стефан?";
};

func int DIA_Halvor_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Halvor_HauntedLH_01_01");	//Ты знаешь человека по имени Стефан?
	AI_Output(self,other,"DIA_Halvor_HauntedLH_01_02");	//Никогда не слышал о нем, приятель.
	B_LogEntry(TOPIC_HauntedLighthouse,"Хальвор ничего не слышал о человеке по имени Стефан.");
};