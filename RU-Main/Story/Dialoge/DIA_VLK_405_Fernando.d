
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Как идут дела?";
};


func int DIA_Fernando_Hello_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Не сказать, чтобы очень хорошо. Когда Барьер все еще стоял, времена были получше.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Заключенные добывали руду в шахтах, а мои корабли доставляли ее на материк.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//А на обратном пути они доставляли пищу и другие товары.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Но сейчас мы отрезаны от материка, и нам приходится рассчитывать только на фермеров в том, что касается припасов.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "И чем ты сейчас зарабатываешь на жизнь?";
};

func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//И чем ты сейчас зарабатываешь на жизнь?
	AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Ничем! Сейчас я живу только за счет накопленного ранее. Но если я не смогу найти источник дохода, скоро для меня настанут тяжелые времена.
};

instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = "Ты продаешь оружие бандитам.";
};

func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Ты продаешь оружие бандитам.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//Почему это ты так решил?...(недоуменно)
	B_LogEntry(TOPIC_Addon_Bandittrader,"Крупный торговец Фернандо признался, что поставлял оружие бандитам.");
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//На списке проданных товаров, который я нашел у бандитов, стоит твоя подпись.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//У бандитов я нашел кольцо гильдии морских торговцев Араксоса. Ты - морской торговец!
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//А на мечах, которые были у бандитов, стоят твои инициалы.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//На мечах, которые были у бандитов, стоят твои инициалы.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Теперь тебе не отвертеться. Я тебя раскрыл.

	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Так это сделал ТЫ! Ты меня выдал! Я заставлю тебя заплатить за это.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Сначала тебе придется отсюда выйти, а я думаю, что вряд ли тебя отпустят в ближайшее время.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//Ничего, мое время еще придет.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//Я не хотел этого делать! Поверь мне!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//Сначала я продавал им только еду. Дела у меня шли неважно, и это было для меня единственным выходом.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//Но потом бандиты стали агрессивными и даже угрожали убить меня, если я не продам им оружие.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//Ты не можешь обвинять меня! Я всего лишь жертва обстоятельств.

		if(Fernando_ImKnast == FALSE)
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Сколько ты мне заплатишь, если я тебя отпущу?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"С тобой разберется ополчение.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Я весь дрожу, я весь дрожу!",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Не пытайся взять меня на жалость. Ты просто отвратительный и жадный торгаш.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//За пригоршню золотых ты душу готов продать.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Но у меня множество расходов! Если я не буду платить, меня могут попросту пустить на корм рыбам.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//С тобой разберется ополчение.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Ты не можешь так поступить!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Еще как могу. Сам увидишь.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//О, Иннос! Я пропал!
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Сколько ты мне заплатишь, если я тебя отпущу?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Дела у меня идут неважно. Много я заплатить не смогу.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Скажем, двести золотых и ценное кольцо?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//Этого должно хватить. Ну что, ты отдашь мне свои улики?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Нет, пожалуй, я оставлю их себе.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Ну хорошо, я согласен.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Ну хорошо, я согласен.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Хорошо, вот золото.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//И кольцо. Мы в расчете.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Нет, пожалуй, я оставлю их себе.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Как хочешь. Но предупреждаю: если ты меня выдашь, тебе не поздоровится.
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Все в порядке?";
};

func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Да ты одержим!";
};

func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ты одержим!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Уходи. Уходи немедленно.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_FERNANDO_TALIASANLETTER(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_taliasanletter_condition;
	information = dia_fernando_taliasanletter_info;
	permanent = FALSE;
	description = "Я могу что-нибудь сделать для тебя?";
};


func int dia_fernando_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_00");	//Я могу что-нибудь сделать для тебя?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_03");	//Ну, я даже не знаю, что за работу тебе предложить...
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_04");	//По большому счету мне все равно, чем заниматься.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_06");	//Ха! Думаю, тебе очень нужны деньги, если ты так хочешь получить эту работу.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_07");	//Ну, не совсем деньги...
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_08");	//Да?! Что же тогда?
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_09");	//За мои услуги я хочу, чтобы ты похвалил Галлахада перед Лариусом.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_10");	//Лучше всего, если ты напишешь ему рекомендательное письмо.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_11");	//ЧТО?! Галлахада? (раздраженно) Я должен что-то делать для этого шарлатана?
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_17");	//Вы что-то не поделили?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_22");	//У нас с ним одна ссора...
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_23");	//...В общем, как-то раз я захотел купить у него одну книгу.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_24");	//Только он не захотел мне ее продавать. Уж не знаю, почему.
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_25");	//Я чуть ли не на коленях просил его продать мне эту книгу, но он отказался.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_26");	//А что это была за книга?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_27");	//Это был учебник по искусству риторики. Знаешь ли, в нашем деле просто необходимо уметь хорошо и точно выражать свои мысли.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_30");	//А если я достал бы тебе эту книгу - ты смог бы изменить свое решение по поводу письма для Галлахада?
	AI_Output(self,other,"DIA_Fernando_TaliasanLetter_01_36");	//Ладно. Если принесешь мне эту книгу, то я напишу для него рекомендательное письмо.
	AI_Output(other,self,"DIA_Fernando_TaliasanLetter_01_39");	//Тогда не буду терять времени.
	Wld_InsertItem(itwr_rhetorikbook,"FP_ITEM_TALIASANBOOK");
	MIS_FERNANDOHELP = LOG_Running;
	Log_CreateTopic(TOPIC_FERNANDOHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_Running);
	B_LogEntry(TOPIC_FERNANDOHELP,"Чтобы получить рекомендательное письмо от Фернандо, я должен достать ему одну очень интересующую его книгу - 'Основы риторики'. Когда-то он хотел купить ее у Галлахада, но тот ему отказал.");
};

instance DIA_FERNANDO_GOTBOOK(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = dia_fernando_gotbook_condition;
	information = dia_fernando_gotbook_info;
	permanent = FALSE;
	description = "Я принес книгу.";
};

func int dia_fernando_gotbook_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (NpcObsessedByDMT_Fernando == FALSE) && (MIS_FERNANDOHELP == LOG_Running) && (Npc_HasItems(other,itwr_rhetorikbook) >= 1) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_gotbook_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Fernando_GotBook_01_00");	//Я принес книгу.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_01");	//Да? (недоверчиво) Дай мне взглянуть на нее.
	B_GiveInvItems(other,self,itwr_rhetorikbook,1);
	B_UseItem(self,itwr_rhetorikbook);
	AI_Output(self,other,"DIA_Fernando_GotBook_01_02");	//Хммм. Это действительно та книга.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_04");	//Ты очень сильно удивил меня!
	AI_Output(other,self,"DIA_Fernando_GotBook_01_06");	//А что насчет письма?
	AI_Output(self,other,"DIA_Fernando_GotBook_01_07");	//Ах, да - твое письмо.
	B_GiveInvItems(self,other,itwr_fernandoletter,1);
	Npc_RemoveInvItems(self,itwr_rhetorikbook,Npc_HasItems(self,itwr_rhetorikbook));
	AI_Output(other,self,"DIA_Fernando_GotBook_01_09");	//Благодарю.
	AI_Output(self,other,"DIA_Fernando_GotBook_01_14");	//Мне пора. Увидимся!
	Npc_ExchangeRoutine(vlk_6027_taliasan,"Start");
	vlk_6027_taliasan.guild = GIL_VLK;
	Npc_SetTrueGuild(vlk_6027_taliasan,GIL_VLK);
	MIS_FERNANDOHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERNANDOHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERNANDOHELP,"Как и обещал, я принес Фернандо интересующую его книгу. В свою очередь он написал для Галлахада рекомендательное письмо.");
};