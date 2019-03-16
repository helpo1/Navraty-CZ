
instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
  	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_EXIT_Info()
{
	Kardif_OneQuestion = FALSE;
	AI_StopProcessInfos(self);
};

instance DIA_Kardif_PICKPOCKET(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 900;
	condition = DIA_Kardif_PICKPOCKET_Condition;
	information = DIA_Kardif_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kardif_PICKPOCKET_Condition()
{
	return C_Beklauen(55,85);
};

func void DIA_Kardif_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,Dialog_Back,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

var int KardifInf;

instance DIA_Kardif_Hi(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = "Как дела?";
};

func int DIA_Kardif_Hi_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Если ты хочешь что-нибудь выпить, заказывай.

	if(KardifInf == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Кардиф торгует напитками в таверне в гавани.");
		KardifInf = TRUE;
	};
};


instance DIA_Kardif_Hallo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = "Готов побиться об заклад, ты многое здесь слышишь...";
};


func int DIA_Kardif_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi) && (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Готов побиться об заклад, ты многое здесь слышишь...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//А тебе какое до этого дело?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Мои уши всегда открыты для новостей.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//А кошелек у тебя тоже открыт?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить десять золотых монет.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Кардиф, владелец кабака в гавани, приторговывает информацией.");
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Я не готов платить за информацию больше пяти монет.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo,"Забудь об этом - я найду нужную мне информацию в другом месте.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo,"Хорошо, договорились.",DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Хорошо, договорились.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Ты заключил выгодную сделку (усмехается). Я всегда к твоим услугам.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Я не готов платить за информацию больше пяти монет.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Что, пять золотых монет? Ты хочешь разорить меня? Давай сойдемся на семи!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Нет, так не пойдет. Давай лучше шесть!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo,"Договорились, семь золотых монет - неплохая цена.",DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Забудь об этом - я найду нужную мне информацию в другом месте.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Хорошо, хорошо... я согласен и на семь.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Договорились, семь золотых монет - неплохая цена.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo,"Нет, мне не так уж сильно нужна твоя информация.",DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Договорились, семь золотых монет - неплохая цена.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//Мудрое решение...(усмехается) Ну, если тебе нужно будет что-то узнать, обращайся ко мне.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Нет, мне не так уж сильно нужна твоя информация.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Эй, подожди... (вздыхает) - хорошо, 5 золотых монет. Но это моя последняя цена!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"И почему нельзя было сразу сказать об этом?",DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//И почему нельзя было сразу сказать об этом?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ох, я просто сейчас не в лучшей форме. Но, как бы то ни было - сделка есть сделка.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Нет, так не пойдет. Давай лучше шесть!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ты отъявленный негодяй, скажу я тебе. Ну, если ты так настаиваешь, информация тебе обойдется в шесть золотых монет.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Дай мне что-нибудь выпить.";
};

func int DIA_Kardif_TRADE_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	var int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Дай мне что-нибудь выпить.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));

	if(KardifGiveLockPick < daynow)
	{
		CreateInvItems(self,ItKE_lockpick,5);
		KardifGiveLockPick = Wld_GetDay();
	};
};


instance DIA_Kardif_TradeInfo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = "Мне нужна информация.";
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if((Kardif_OneQuestion == FALSE) && (Kardif_Deal > 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Мне нужна информация.
	Kardif_OneQuestion = TRUE;
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Возвращайся, когда у тебя будет достаточно золота.
};


instance DIA_Kardif_Buerger(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Buerger_Condition;
	information = DIA_Kardif_Buerger_Info;
	permanent = TRUE;
	description = "Кого считают влиятельными людьми в этом городе?";
};


var int DIA_Kardif_Buerger_permanent;

func int DIA_Kardif_Buerger_Condition()
{
	if((DIA_Kardif_Buerger_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Buerger_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Кого считают влиятельными людьми в этом городе?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Здесь, в порту, ты никого из них не найдешь. Единственный влиятельный человек здесь - это Лемар.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Этот ростовщик не очень популярен, но у него есть золото, и другие влиятельные горожане должны ему деньги.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Торговцы и мастера тоже очень влиятельные люди - и даже слишком, если тебе интересно мое мнение.
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lehmar(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lehmar_Condition;
	information = DIA_Kardif_Lehmar_Info;
	permanent = TRUE;
	description = "Кто должен Лемару?";
};


var int DIA_Kardif_Lehmar_permanent;

func int DIA_Kardif_Lehmar_Condition()
{
	if((DIA_Kardif_Lehmar_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Buerger_permanent == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Кто должен Лемару?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(смеется) Если ты хочешь узнать это, тебе стоит заглянуть в его гроссбух.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Только это будет очень непросто сделать незаметно.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Насколько мне известно, он всегда носит его с собой...
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Arbeit(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Arbeit_Condition;
	information = DIA_Kardif_Arbeit_Info;
	permanent = TRUE;
	description = "Где я могу найти работу?";
};


var int DIA_Kardif_Arbeit_permanent;

func int DIA_Kardif_Arbeit_Condition()
{
	if((DIA_Kardif_Arbeit_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Где я могу найти работу?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Ты вряд ли найдешь работу здесь, в порту. Тебе нужно обратиться к мастерам в нижней части города.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Но если у тебя есть приличный меч, ты можешь вызвать Альрика на поединок. Ты найдешь его за складом, он сражается за золото.
		DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Addon_Kardif_MissingPeople(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Addon_Kardif_MissingPeople_Condition;
	information = DIA_Addon_Kardif_MissingPeople_Info;
	permanent = TRUE;
	description = "Что ты знаешь о пропавших горожанах?";
};


var int DIA_Addon_Kardif_MissingPeople_permanent;

func int DIA_Addon_Kardif_MissingPeople_Condition()
{
	if((DIA_Addon_Kardif_MissingPeople_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Что ты знаешь о пропавших горожанах?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Все, что я знаю, - это то, что за последние дни исчезли несколько людей.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Говорят, что больше всего пропавших здесь, в порту. Думаю, тебе стоит расспросить местных.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//В нижней части города тоже исчезали люди.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Если хочешь знать больше, поговори с Корагоном.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//У него пивная в нижней части города, и думаю, что от его уха не укрываются такие новости.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Халвор, торговец рыбой из лавки на пристани, тоже может кое-что знать - к нему заходит много людей.
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Кардиф говорит, что мне стоит поговорить о пропавших людях с Корагоном, владельцем трактира в нижней части города, а также с Халвором, торгующим рыбой в гавани.");
		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lernen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lernen_Condition;
	information = DIA_Kardif_Lernen_Info;
	permanent = TRUE;
	description = "А у кого здесь можно поучиться чему-нибудь?";
};


var int DIA_Kardif_Lernen_permanent;

func int DIA_Kardif_Lernen_Condition()
{
	if((DIA_Kardif_Lernen_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lernen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//А у кого здесь можно поучиться чему-нибудь?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Здесь, в портовом квартале есть несколько знающих людей.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Карл, кузнец, - крепкий парень. Ручаюсь, он сможет помочь тебе стать сильнее.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Альрик опытен в боевых искусствах. А Ларес - мошенник, каких свет не видывал. Он тоже заходит иногда в порт.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//А если ты настолько выжил из ума, чтобы пойти к старому Игнацу - он знает толк в алхем...эхи алхи...(запинается) как-то, зельях.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//И где мне найти всех этих людей?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(стонет) Боже, король успеет выиграть войну против орков, прежде чем я тебе объясню все это.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Просто осмотрись в портовом квартале, ты обязательно найдешь их. А если ты хочешь лучше ориентироваться здесь, зайди к Ибрагиму и купи у него карту.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//Его совсем легко найти. Он живет в соседнем доме направо от моего трактира. (бормочет) Я должен был взять в два раза больше за эту информацию.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Карл, кузнец в портовом квартале, может сделать меня сильнее.");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Ларес может помочь мне повысить мою ловкость.");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Альрик может обучить меня искусству владения одноручным оружием. Он ошивается за складом!");
		B_LogEntry_Quiet(TOPIC_CityTeacher,"Игнац может показать мне рецепты приготовления зелий.");
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry_Quiet(TOPIC_CityTrader,"Ибрагим рисует и продает карты.");
		DIA_Kardif_Lernen_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk_Condition;
	information = DIA_Kardif_Diebeswerk_Info;
	permanent = TRUE;
	description = "А нет ли здесь какой-нибудь 'особой' работы?";
};


var int DIA_Kardif_Diebeswerk_permanent;

func int DIA_Kardif_Diebeswerk_Condition()
{
	if((DIA_Kardif_Diebeswerk_permanent == FALSE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//А нет ли здесь какой-нибудь 'особой' работы, мне бы хотелось побыстрее заработать денег?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Чего-нибудь особого, говоришь? Хмм...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...попробуй поговорить с Нагуром. Возможно, он сможет помочь тебе.
		DIA_Kardif_Diebeswerk_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk2(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk2_Condition;
	information = DIA_Kardif_Diebeswerk2_Info;
	permanent = TRUE;
	description = "Есть что-нибудь 'особенное' для меня?";
};


var int DIA_Kardif_Diebeswerk2_permanent;

func int DIA_Kardif_Diebeswerk2_Condition()
{
	if((DIA_Kardif_Diebeswerk2_permanent == FALSE) && (DIA_Kardif_Diebeswerk_permanent == TRUE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Есть что-нибудь 'особенное' для меня?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Да, есть кое-что - но это заинтересует тебя, только если ты блещешь разносторонними талантами.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Выкладывай, что там у тебя?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Ну, у Зуриса, торговца зельями на рынке, сейчас гостит Дарон, Маг Огня.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//И?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//При нем есть новый сундучок, сделанный специально для него Торбеном плотником.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Говорят, что этот Дарон носит с собой несметные сокровища. Но ты ничего не слышал от меня, понятно?
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Zurueck(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_Zurueck_Condition;
	information = DIA_Kardif_Zurueck_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int DIA_Kardif_Zurueck_Condition()
{
	if(Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zurueck_Info()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices(DIA_Kardif_Zurueck);
};


instance DIA_Kardif_DOPE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_DOPE_Condition;
	information = DIA_Kardif_DOPE_Info;
	permanent = TRUE;
	description = "Где мне здесь купить травки?";
};


var int DIA_Kardif_DOPE_perm;

func int DIA_Kardif_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DOPE_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Где мне здесь купить травки?
	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Только не здесь - я не имею дела с подобными вещами.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Только не здесь.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Ладно, тогда где?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Я бы на твоем месте поговорил с Мелдором - он дымит тут днями напролет.
		DIA_Kardif_DOPE_perm = TRUE;
	};
};


instance DIA_Kardif_Paket(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_Kardif_Paket_Condition;
	information = DIA_Kardif_Paket_Info;
	permanent = TRUE;
	description = "Ты что-нибудь слышал о тюке болотной травы?";
};


var int DIA_Kardif_Paket_perm;

func int DIA_Kardif_Paket_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Paket_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Paket_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Ты что-нибудь слышал о тюке болотной травы?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Тот, кто владеет этим тюком - богатый человек. И, возможно, весьма расслабленный также!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Не пытайся провести меня. Ты что-то знаешь. Давай, выкладывай!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Хорошо, хорошо - этот парень недавно заходил в мой трактир. Он из наемников.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Он сказал, что продал тюк болотной травы в гавани, но, конечно же, он был обкуренный в хлам. Это все, что я знаю.
		DIA_Kardif_Paket_perm = TRUE;
		B_LogEntry(TOPIC_Warehouse,"Кардиф говорил с наемником. У этого парня есть тюк болотной травы, который он хотел продать.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_SENDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || ((Diebesgilde_Okay >= 3) && Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Эй, ты, иди сюда. У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Один парень очень хочет поговорить с тобой.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Так как он не нашел тебя здесь, он попросил меня передать тебе записку.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Он хочет встретиться с тобой. За рыбной лавкой Халвора.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Эта информация бесплатна - но это исключение! Цена на все остальное осталась прежней.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Как выглядел этот парень?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//Я мог бы сказать тебе - но тебе придется заплатить за это, мой друг. (усмехается)

	if(Kardif_Deal == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить десять золотых монет.
		Kardif_Deal = 10;
	};

	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_Kardif_Kerl(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Kerl_Condition;
	information = DIA_Kardif_Kerl_Info;
	permanent = TRUE;
	description = "Как выглядел этот парень?";
};


var int DIA_Kardif_Kerl_permanent;

func int DIA_Kardif_Kerl_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA) && (Attila.aivar[AIV_TalkedToPlayer] == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Как выглядел этот парень?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Ну, он довольно высокий, темнокожий и сильный - но он не носит униформы. Какой-то он... зловещий.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//А его лицо?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Его лицо? Когда он глядел на меня, я был рад, что он пришел не за мной.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//В его глазах было что-то пугающее - ну, как бы то ни было, я думаю, ты должен пойти, повидаться с ним. Это должно быть интересно.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Да... весь вопрос в том, для кого...
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = "Этот ублюдок пытался убить меня!";
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Hallo) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Этот ублюдок пытался убить меня!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Эй, откуда мне было знать? Я просто передал информацию.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Если кто-то решил насолить тебе, я думаю, у него были веские причины.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
	B_KillNpc(Attila);
	Npc_RemoveInvItem(Attila,ItMi_OldCoin);
};


instance DIA_Kardif_Zeichen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Kardif_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ах, ты имеешь дела с бандой. Хорошо. В таком случае, у меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//Если тебе понадобятся отмычки, намекни. Я припас несколько на всякий случай. Просто попроси меня налить тебе выпивки.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	CreateInvItems(self,ItKE_lockpick,20);
};


instance DIA_Kardif_Crew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = "Мне все еще нужны матросы.";
};


func int DIA_Kardif_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Мне все еще нужны матросы.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Настали плохие времена, дружище. Ты не найдешь матросов во всем Хоринисе. Большинство из них давно покинули город.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Но с хорошим капитаном будет нетрудно набрать несколько смышленных парней, и довольно быстро сделать из них неплохую команду.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Где я могу найти капитана?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Ты обращаешься не по адресу. Я простой трактирщик.
	if(Npc_IsDead(Jack) == FALSE)
	{
		if(SCGotCaptain == FALSE)
		{
			Log_CreateTopic(Topic_Captain,LOG_MISSION);
			Log_SetTopicStatus(Topic_Captain,LOG_Running);
			B_LogEntry(Topic_Captain,"Кардиф отправил меня к старому Джеку. Возможно, он сможет помочь мне");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Иди, поговори со Старым Джеком. Он ошивается в этом порту, сколько я себя помню. В том, что касается морского дела, это тот человек, что тебе нужен.
	};
};


instance DIA_KARDIF_PERMJOB(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 4;
	condition = dia_kardif_permjob_condition;
	information = dia_kardif_permjob_info;
	permanent = FALSE;
	description = "Есть работа?";
};


func int dia_kardif_permjob_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Kardif_Hi) && (Npc_IsDead(VLK_432_Moe) == FALSE) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_permjob_info()
{
	AI_Output(other,self,"DIA_Kardif_PermJob_01_00");	//Есть работа?
	AI_Output(self,other,"DIA_Kardif_PermJob_01_05");	//Мне сейчас нужен какой-нибудь человек на место вышибалы в моей таверне.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_06");	//Я, конечно, понимаю, что работа довольно пыльная, но за это я и плачу довольно хорошие деньги!
	AI_Output(self,other,"DIA_Kardif_PermJob_01_09");	//Гэйверн, безусловно, парень то, что надо, но бывают случаи, что и ему не помешала бы помощь.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_10");	//Хотя, судя по твоему виду, тебя трудно назвать крепким парнем.
	AI_Output(other,self,"DIA_Kardif_PermJob_01_12");	//Что мне нужно сделать, чтобы убедить тебя в обратном?
	AI_Output(self,other,"DIA_Kardif_PermJob_01_13");	//Хммм. Хороший вопрос. Ну, хотя бы...
	AI_Output(self,other,"DIA_Kardif_PermJob_01_14");	//Скажи, ты видел парня, что стоит у входа в мою таверну?
	AI_Output(other,self,"DIA_Kardif_PermJob_01_15");	//Да, видел. Кажется, его зовут Мо.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_18");	//Этот амбал требует плату со всех, кто пытается сюда зайти.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_19");	//И это не очень хорошо сказывается на репутации моего заведения.
	AI_Output(self,other,"DIA_Kardif_PermJob_01_20");	//Вот я и подумал, что, если ты сможешь проучить этого засранца, надрав ему задницу, - то я без вопросов возьму тебя к себе на работу.
	MIS_MOEBORED = LOG_Running;
	Log_CreateTopic(TOPIC_MOEBORED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MOEBORED,LOG_Running);
	if(MOEISBEATEN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Kardif_PermJob_01_22");	//Я уже имел дело с этим парнем! Он оказался не таким уж и сильным.
		AI_Output(self,other,"DIA_Kardif_PermJob_01_25");	//(смеется) Ну, раз так, тогда просто пойди и скажи ему, что если я еще раз увижу его рядом с моей таверной, ему достанется еще больше!
		B_LogEntry(TOPIC_MOEBORED,"Если я хочу устроиться на работу к Кардифу, мне нужно проучить типа по имени Мо. Этот парень весь день торчит у входа в таверну и постоянно вымогает деньги у посетителей. Правда, в свое время я ему уже намял бока, когда он попытался выкинуть этот номер непосредственно со мной. Думаю, на этот раз стоит просто поговорить с ним и попытаться убедить его перестать заниматься вымогательством.");
	}
	else
	{
		AI_Output(other,self,"DIA_Kardif_PermJob_01_30");	//Ладно, постараюсь уладить для тебя эту проблему.
		AI_Output(self,other,"DIA_Kardif_PermJob_01_31");	//И еще передай ему, что, если я еще раз увижу его рядом с моей таверной, - ему достанется еще больше!
		AI_Output(self,other,"DIA_Kardif_PermJob_01_32");	//Если, конечно, у тебя вообще это получится сделать...(смеется) В чем я очень сильно сомневаюсь!
		B_LogEntry(TOPIC_MOEBORED,"Если я хочу устроиться на работу к Кардифу, мне нужно проучить типа по имени Мо. Этот парень весь день торчит у входа в таверну и постоянно вымогает деньги у посетителей.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PERMJOBDONE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 1;
	condition = dia_kardif_permjobdone_condition;
	information = dia_kardif_permjobdone_info;
	permanent = FALSE;
	description = "Насчет того парня, Мо...";
};


func int dia_kardif_permjobdone_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (Kardif_OneQuestion == FALSE) && ((MOEBEATME == TRUE) || (MOEISAWAYFROMTAVERNE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobdone_info()
{
	AI_Output(other,self,"DIA_Kardif_PermJobDone_01_00");	//Насчет того парня, Мо...

	if(MOEISAWAYFROMTAVERNE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_01");	//Да?! Есть новости?
		AI_Output(other,self,"DIA_Kardif_PermJobDone_01_02");	//Я тут поговорил с ним... и он пообещал, что больше не будет доставлять беспокойство тебе и твоим клиентам.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_03");	//Что же, это отличные новости, приятель!
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_07");	//Думаю, что мне вполне бы могли пригодиться услуги такого парня, как ты.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_10");	//Но для начала давай обговорим условия твоей работы.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_12");	//Думаю, что десять золотых монет в день тебя должны устроить.
		AI_Output(other,self,"DIA_Kardif_PermJobDone_01_15");	//Неплохо.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_16");	//Вот и отлично!
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_18");	//Наведывайся ко мне в таверну - возможно, у меня будут для тебя небольшие поручения.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_19");	//Да, и вот - возьми свою долю за сегодня.
		B_GiveInvItems(self,other,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_20");	//Ты ее честно заработал, разобравшись с этим Мо.
		KARDIFPAYDAY = Wld_GetDay();
		MIS_MOEBORED = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_MOEBORED,LOG_SUCCESS);
		B_LogEntry(TOPIC_MOEBORED,"Кардиф взял меня к себе на работу. Каждый день я буду получать от него по десять золотых монет.");
		AI_StopProcessInfos(self);
	}
	else if(MOEBEATME == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_24");	//Да, да...(разочарованно) Слышал, что тебе от него здорово досталось.
		AI_Output(self,other,"DIA_Kardif_PermJobDone_01_25");	//Извини, но ты мне не подходишь.
		MIS_MOEBORED = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_MOEBORED);
	};
};

instance DIA_KARDIF_PERMJOBPAY(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 100;
	condition = dia_kardif_permjobpay_condition;
	information = dia_kardif_permjobpay_info;
	permanent = TRUE;
	description = "Как насчет моей оплаты?";
};

func int dia_kardif_permjobpay_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_permjobpay_info()
{
	var int daynow;
	var int sumpay;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Kardif_PermJobPay_01_00");	//Как насчет моей оплаты?

	if(KARDIFPAYDAY < daynow)
	{
		AI_Output(self,other,"DIA_Kardif_PermJobPay_01_01");	//Конечно, приятель! Вот, держи свою долю.
		sumpay = 10 * (daynow - KARDIFPAYDAY);
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		KARDIFPAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_PermJobPay_01_03");	//(удивленно) Но ты ведь уже сегодня получил свою долю!
	};
};


instance DIA_KARDIF_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = dia_kardif_aboutkillignaz_condition;
	information = dia_kardif_aboutkillignaz_info;
	permanent = FALSE;
	description = "Тебе что-нибудь известно о убийстве алхимика Игнаца?";
};


func int dia_kardif_aboutkillignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kardif_AboutKillIgnaz_01_00");	//Тебе что-нибудь известно о убийстве алхимика Игнаца?
	AI_Output(self,other,"DIA_Kardif_AboutKillIgnaz_01_01");	//Хммм...(задумчиво) Боюсь, что не очень много.
	AI_Output(self,other,"DIA_Kardif_AboutKillIgnaz_01_03");	//Я знаю столько же, сколько и все остальные.
	B_LogEntry(TOPIC_KILLIGNAZ,"Кардиф также не слышал ничего необычного касательно этого дела.");
	ASKKILLTHIRD = TRUE;
};

var int KardifBuyMeat;
var int KardifBuyMeatDay;

instance DIA_KARDIF_BUYMEAT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 15;
	condition = dia_kardif_buymeat_condition;
	information = dia_kardif_buymeat_info;
	permanent = FALSE;
	description = "Как насчет каких-нибудь поручений?";
};

func int dia_kardif_buymeat_condition()
{
	if((MIS_MOEBORED == LOG_SUCCESS) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_buymeat_info()
{
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_00");	//Как насчет каких-нибудь поручений?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_01");	//Ну, если хочешь еще немного подзаработать, то можешь отправиться на охоту и добыть мне немного сырого мяса.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_02");	//А то в последнее время в моей таверне стало очень уж много посетителей. Вот на всех и не хватает.
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_03");	//И сколько тебе его нужно?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_04");	//(задумчиво) Примерно двадцать кусков каждый день.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_05");	//Но не больше! Иначе мне негде будет его хранить, и в итоге оно просто испортится.
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_06");	//Хорошо. А что насчет моей оплаты?
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_07");	//За одну такую партию мяса я готов заплатить тебе около ста монет. Извини, больше не смогу.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_08");	//Это и так почти вдвое больше, чем тебе даст любой торговец на рыночной площади.
	AI_Output(self,other,"DIA_Kardif_BuyMeat_01_09");	//Но только не вздумай притащить мне жареное мясо! Иначе ты его просто испортишь...
	AI_Output(other,self,"DIA_Kardif_BuyMeat_01_10");	//Ладно. Я подумаю над твоим предложением.
	KardifBuyMeat = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Кардиф готов покупать у меня порции сырого мяса по двадцать кусков каждый день по цене в сто золотых монет.");
};

instance DIA_Kardif_SellMeat(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 16;
	condition = DIA_Kardif_SellMeat_condition;
	information = DIA_Kardif_SellMeat_info;
	permanent = TRUE;
	description = "Насчет твоего мяса...";
};

func int DIA_Kardif_SellMeat_condition()
{
	if((KardifBuyMeat == TRUE) && (Npc_HasItems(other,ItFoMuttonRaw) >= 20) && (Kardif_OneQuestion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SellMeat_info()
{
	AI_Output(other,self,"DIA_Kardif_SellMeat_01_00");	//Насчет твоего мяса...

	if(KardifBuyMeatDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Kardif_SellMeat_01_01");	//Да? Ты принес его?
		AI_Output(other,self,"DIA_KARDIF_SellMeat_01_02");	//Конечно. Вот, как ты и просил - двадцать кусков свежего мяса.
		B_GiveInvItems(other,self,ItFoMuttonRaw,20);
		Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
		AI_Output(self,other,"DIA_KARDIF_SellMeat_01_03");	//Отлично. На сегодня мне этого хватит.
		AI_Output(self,other,"DIA_KARDIF_SellMeat_01_04");	//Вот, возьми свое золото. И не забудь: завтра я жду от тебя следующей поставки.
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(other,self,"DIA_KARDIF_SellMeat_01_05");	//Само собой.
		KardifBuyMeatDay = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_SellMeat_01_06");	//На сегодня мне его хватит! Приходи завтра.
		AI_StopProcessInfos(self);
	};
};

//---------------------------------------------Игра------------------------------------------

instance DIA_VLK_431_Kardif_Game(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_Game_condition;
	information = DIA_VLK_431_Kardif_Game_info;
	description = "Чем тут еще можно заняться?";
};

func int DIA_VLK_431_Kardif_Game_condition()
{
	if((Npc_KnowsInfo(other,DIA_Kardif_Hi) == TRUE) && (Kardif_OneQuestion == FALSE)) 
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_Game_info()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_00");	//Чем тут еще можно заняться?
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_01");	//В смысле, кроме как целыми днями обниматься с бутылкой шнапса?
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_02");	//Ну, что-то вроде того.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_03");	//Это тебе все-таки таверна, приятель, а не бордель! Люди сюда и приходят только ради того, чтобы промочить горло.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_04");	//Однако...(замялся) Некоторым моим особенным клиентам я могу предложить еще сыграть со мной в кости.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_05");	//Это куда более интересное занятие, чем просто утопать в бутылке. И время за игрой проводить куда веселей.
	AI_Output(other,self,"DIA_VLK_431_Kardif_Game_01_06");	//А я могу с тобой сыграть?
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_07");	//Ты? Хммм...(оценивающе) Можешь. Но только при условии, что у тебя водится золото в карманах.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_08");	//Ставки в этой игре высоки, поэтому и контингент должен быть соответсвующим.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_09");	//Так что, если ты готов без сожаления расстаться с сотней другой золотых, только скажи - и мы сразу начнем игру.
	AI_Output(self,other,"DIA_VLK_431_Kardif_Game_01_10");	//В ином же случае я больше ничем тебе помочь не могу. Пить что-нибудь будешь?
	KardifPlayResult = 200;
	Menu_WriteInt("AST","SysTimer01",0);
	Log_CreateTopic(TOPIC_GameList,LOG_NOTE);
	B_LogEntry(TOPIC_GameList,"Как оказалось, Кардиф - один из немногих, кто играет в кости на деньги. Возможно, мне стоит попробовать выиграть у него.");
};

instance DIA_VLK_431_Kardif_WhatOth(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_WhatOth_condition;
	information = DIA_VLK_431_Kardif_WhatOth_info;
	description = "Знаешь еще кого-нибудь, с кем можно было бы сыграть?";
};

func int DIA_VLK_431_Kardif_WhatOth_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_431_Kardif_Game) == TRUE) && (Kardif_OneQuestion == FALSE) && (KnowOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_WhatOth_info()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_WhatOth_01_00");	//Знаешь еще кого-нибудь, с кем можно было бы сыграть?
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_01");	//Хммм...(задумчиво) Таких немного.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_02");	//Один из них - Саландрил, алхимик из верхнего квартала города. Он, хоть и помешан на своих эликсирах, но азартен еще больше.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_03");	//Кроме него, Орлан - хозяин таверны 'Мертвая Гарпия' - частенько поигрывает в кости. Причем, надо сказать, довольно неплохо!
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_04");	//Ты бы видел, как он обдирает своих клиентов до последнего гроша за игральным столом. Даже я с ним боюсь играть.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_05");	//Ну и последний из них - Рауль, наемник на ферме Онара. Этот - вообще настоящий плут!
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_06");	//Я бы не советовал тебе с ним связваться. Иначе рискуешь остаться без штанов.
	AI_Output(self,other,"DIA_VLK_431_Kardif_WhatOth_01_07");	//А так, это все, кого я знаю.
	GameOtherPlayers = TRUE;
	B_LogEntry(TOPIC_GameList,"Есть и еще игроки, с кем я могу сыграть в кости: Саландрил, алхимик из верхнего квартала, Орлан, хозяин таверны 'Мертвая Гарпия', и наемник Рауль.");
};

instance DIA_VLK_431_Kardif_GamePlay(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 900;
	condition = DIA_VLK_431_Kardif_GamePlay_condition;
	information = DIA_VLK_431_Kardif_GamePlay_info;
	permanent = TRUE;
	description = "Сыграем в кости!";
};

func int DIA_VLK_431_Kardif_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_431_Kardif_Game) == TRUE) && (Kardif_OneQuestion == FALSE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer01");

	if(CheckLastGame >= KardifPlayResult)
	{
		CheckLastSum = CheckLastGame - KardifPlayResult;
	};

	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_01_00");	//Сыграем в кости!

	if(KardifPlayResult >= CheckLastGame)
	{
		if((KardifPlayResult > 0) && (KardifDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_01");	//Ну давай, сыграем...
			PlayPocker(1,self);
		}
		else
		{
			if(KardifDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_02");	//Хватит на сегодня игр! Я и так уже слишком много тебе проиграл.
				KardifDayPlay = Wld_GetDay();
				KardifDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_03");	//Извини, приятель, но мне пока не до игр.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_04");	//В прошлый раз ты проиграл мне приличную сумму. Или, ты думаешь, я забыл об этом?
		AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_01_05");	//Так что, пока не отдашь мне ее, - игры не будет!
		Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_431_Kardif_GamePlay,"Вот твои деньги.",DIA_VLK_431_Kardif_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_431_Kardif_GamePlay,"У меня нет столько денег.",DIA_VLK_431_Kardif_GamePlay_No);
	};
};

func void DIA_VLK_431_Kardif_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	KardifPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_Here_01_01");	//Вот твои деньги.
	AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_Here_01_02");	//Хорошо. Теперь можно и сыграть...
	PlayPocker(1,self);
};

func void DIA_VLK_431_Kardif_GamePlay_No()
{
	AI_Output(other,self,"DIA_VLK_431_Kardif_GamePlay_No_01_01");	//У меня нет столько денег.
	AI_Output(self,other,"DIA_VLK_431_Kardif_GamePlay_No_01_02");	//Тогда найди их! Сам понимаешь, долг платежом красен...
	Info_ClearChoices(DIA_VLK_431_Kardif_GamePlay);
};

instance DIA_VLK_431_Kardif_GameEnd(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_VLK_431_Kardif_GameEnd_condition;
	information = DIA_VLK_431_Kardif_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_431_Kardif_GameEnd_condition()
{
	if((MustTellResult_Kardif == TRUE) && ((KardifLost == TRUE) || (KardifWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VLK_431_Kardif_GameEnd_info()
{
	if(KardifLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GameEnd_00");	//Проклятье! По всей видимости, сегодня просто не мой день...
		KardifLost = FALSE;
	}
	else if(KardifWon == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_431_Kardif_GameEnd_01");	//Похоже, удача на моей стороне, приятель! Но ты, если хочешь, можешь вновь попытать свою удачу.
		KardifWon = FALSE;
	};

	MustTellResult_Kardif = FALSE;
};

instance DIA_Kardif_DiscoverLH(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_DiscoverLH_Condition;
	information = DIA_Kardif_DiscoverLH_Info;
	description = "Мне нужен твой совет.";
};

func int DIA_Kardif_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (Kardif_OneQuestion == TRUE) && (CanGoLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DiscoverLH_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_00");	//Мне нужен твой совет.
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_01");	//Всегда рад помочь. Тем более, ты за него уже заплатил.
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_02");	//Ты, случайно, не знаешь, кто бы мог тут в порту рассказать что-нибудь о... пиратах.
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_03");	//О пиратах?! Ух, парень, ну и вопрос ты задаешь. Хммм...(задумчиво) Боюсь, что никто. Но можешь поговорить с Джеком.
	AI_Output(self,other,"DIA_Kardif_DiscoverLH_01_04");	//Он старый моряк, много видел, да и с пиратами ему наверняка приходилось иметь дело.
	AI_Output(other,self,"DIA_Kardif_DiscoverLH_01_05");	//Благодарю.
	KnowStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Кардиф сказал, что, если кто-то и смог бы мне рассказать о пиратах, то только смотритель маяка Джек.");
};