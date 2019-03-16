
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Заходи попозже. Я уверен, что смогу приготовить что-нибудь интересное для тебя.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};

instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его секстант)";
};

func int DIA_Brahim_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItMi_Sextant,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Меня зовут Ибрагим. Я рисую карты и продаю их.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Так как ты недавно здесь, возможно, тебе пригодится карта города.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Это очень недорого и очень полезно, пока ты здесь не освоишься.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
};

instance DIA_Brahim_HelpPath(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Condition;
	information = DIA_Brahim_HelpPath_Info;
	permanent = FALSE;
	description = "А тебе никакая помощь не нужна?";
};

func int DIA_Brahim_HelpPath_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brahim_GREET) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Info()
{
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_00");	//А тебе никакая помощь не нужна?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_01");	//Хорошо, что спросил. Еще как нужна!
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_02");	//Тогда выкладывай - в чем дело?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_03");	//Да, понимаешь...(чешет затылок) Недавно я получил заказ на карту всего этого острова.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_04");	//Покупатель платит очень приличную сумму за нее. Почти полтысячи золотых!
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_05");	//А у меня, как оказалось, закончились чернила, чтобы подписать ее.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_06");	//Вот теперь сижу и гадаю, где их мне отыскать...
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_07");	//А купить их не пробовал?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_08");	//В этой части города такие вещи не продаются, а в верхний квартал меня не пускают.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_09");	//Понимаю! Ладно, попробую их для тебя достать.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_10");	//Кстати, а что за человек так щедро платит за твою карту?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_11");	//По правде говоря, никогда его раньше тут не видел.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_12");	//Кажется, его зовут то ли Гоалес, то ли Гонслес. В общем, я так и не запомнил его имени.
	MIS_BrahimWax = LOG_Running;
	Log_CreateTopic(TOPIC_BrahimWax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Running);
	B_LogEntry(TOPIC_BrahimWax,"Ибрагиму срочно нужны чернила. Без них он не может подписать обозначения на карте, которую ему заказали. Думаю, что стоит поискать их где-нибудь на рыночной площади или у торговцев.");
};

instance DIA_Brahim_HelpPath_Done(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Done_Condition;
	information = DIA_Brahim_HelpPath_Done_Info;
	permanent = FALSE;
	description = "Вот твои чернила.";
};

func int DIA_Brahim_HelpPath_Done_Condition()
{
	if((MIS_BrahimWax == LOG_Running) && (Npc_HasItems(other,ItMi_Wax) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_00");	//Вот твои чернила.
	B_GiveInvItems(other,self,ItMi_Wax,1);
	Npc_RemoveInvItems(self,ItMi_Wax,1);
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_01");	//Благодарю тебя! Ты меня просто выручил.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_02");	//Теперь я наконец-то закончу эту карту и получу огромную кучу золота.
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_03");	//А мне что-нибудь перепадет?
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_04");	//К сожалению, у меня сейчас для тебя нет ничего ценного.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_05");	//Хотя постой. Вот, возьми эту бумагу.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_06");	//Она вовсе не такая простая, как кажется на первый взгляд!
	B_GiveInvItems(self,other,itwr_magicpaper,3);
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_07");	//С ее помощью можно делать магические свитки.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_08");	//Но большего у меня ничего нет.
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_09");	//Ладно, сойдет и это.
	CreateInvItems(self,itwr_map_newworld_1,1);
	MIS_BrahimWax = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Success);
	B_LogEntry(TOPIC_BrahimWax,"Я принес Ибрагиму чернила.");
};

instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "А правда, что некоторые жители таинственным образом исчезли?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//А правда, что некоторые жители таинственным образом исчезли?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Я слышал об этом! Но я не уверен, что это правда.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Оглядись вокруг! Неужели ты хочешь провести в этой дыре свои лучшие годы жизни?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Не удивительно, что люди уезжают отсюда.
};


var int brahimowmapready;

instance DIA_BRAHIM_COAST_MAP(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = dia_brahim_coast_map_condition;
	information = dia_brahim_coast_map_info;
	permanent = FALSE;
	description = "Не хочешь скопировать хорошую карту рудниковой долины?";
};

func int dia_brahim_coast_map_condition()
{
	if((Npc_HasItems(other,itwr_map_oldworld_forest_1) >= 1) && Npc_KnowsInfo(other,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void dia_brahim_coast_map_info()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_00");	//Не хочешь скопировать хорошую карту рудниковой долины? У тебя такой точно нет.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_01");	//Дай-ка глянуть...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_02");	//Очень интересно!
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_03");	//Что ты за это хочешь? Денег у меня немного, но могу что-нибудь подарить.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_04");	//Вот, выбирай...
	Info_ClearChoices(dia_brahim_coast_map);
	Info_AddChoice(dia_brahim_coast_map,"Лечебный эликсир",dia_brahim_coast_map_health_03);
	Info_AddChoice(dia_brahim_coast_map,"Эликсир маны",dia_brahim_coast_map_mana_03);
	Info_AddChoice(dia_brahim_coast_map,"Тридцать золотых монет",dia_brahim_coast_map_gold_03);
};

func void dia_brahim_coast_give()
{
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_05");	//Отлично, возьми.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_06");	//И дай-ка я еще раз гляну, чтобы получше запомнить.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_07");	//Все понятно. Приходи завтра к обеду - карта уже будет в продаже.
	Info_ClearChoices(dia_brahim_coast_map);
	B_GivePlayerXP(XP_Ambient);
	BRAHIMOWMAPREADY = Wld_GetDay() + 1;
};

func void dia_brahim_coast_map_mana_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_01");	//Дай мне напиток маны.
	B_GiveInvItems(self,other,ItPo_Mana_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_health_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_02");	//Дай мне лечебный напиток.
	B_GiveInvItems(self,other,ItPo_Health_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_gold_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_03");	//Дай мне золото.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	dia_brahim_coast_give();
};

instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне твои карты.";
};

func int DIA_Brahim_BUY_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Brahim_GREET) == TRUE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	var int today;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	today = Wld_GetDay();

	if((BRAHIMOWMAPREADY != 0) && (Npc_HasItems(self,itwr_map_oldworld_forest_1) == 0) && ((today > BRAHIMOWMAPREADY) || ((today == BRAHIMOWMAPREADY) && Wld_IsTime(12,0,23,59))))
	{
		CreateInvItems(self,itwr_map_oldworld_forest_1,1);
		BRAHIMOWMAPREADY = 0;
	};

	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Покажи мне свои карты.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Ты не найдешь лучше даже в монастыре.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Хорошая карта - это очень важно, особенно для людей, прибывших с материка, мистер Паладин.
	};

	Brahim_ShowedMaps = TRUE;
	B_GiveTradeInv(self);
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || (Npc_HasItems(other,itwr_shatteredgolem_mis_1) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Я знал, что этот клочок бумаги заинтересует тебя.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Какой клочок?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Ну, та старая карта, что ты только что купил.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Я знаю таких людей, как ты. Вы используете каждый шанс, чтобы найти сокровища.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Где ты взял эту карту?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Что это за карта?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Почему ты не оставил ее себе?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Где ты взял эту карту?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Ох, я нашел ее в стопке старых карт, что я купил недавно.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Продавец, должно быть, проглядел ее.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Что это за карта?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Похоже, это карта сокровищ или что-то вроде.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Но, похоже, ты из тех, кто способен выяснить это самостоятельно.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Почему ты не оставил ее себе?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Я старый человек, и времена, когда я сам искал сокровища, давно прошли.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Пусть этим занимаются те, кто помоложе.
};

instance DIA_Brahim_NeedWorldMap(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_NeedWorldMap_Condition;
	information = DIA_Brahim_NeedWorldMap_Info;
	permanent = FALSE;
	description = "Мне нужна морская карта.";
};

func int DIA_Brahim_NeedWorldMap_Condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordNeedMap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_NeedWorldMap_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_00");	//Мне нужна морская карта, на которой проложен точный курс до материка.
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_01");	//Хммм...(удивленно) И откуда же мне ее взять?
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_02");	//Но ты же картограф!
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_03");	//Да, но не моряк! Я рисую карты только тех мест, где бывал сам.
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_04");	//А я даже и в море ни разу не был.
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_05");	//Может, хотя бы подскажешь, где мне ее взять?
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_06");	//Возможно, она есть у паладинов. Они ведь как-то приплыли сюда.
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_07");	//Да, у них она вполне может быть.
	B_LogEntry(Topic_SylvioCrew,"У картографа Ибрагима нет нужной мне карты, но по его словам, она может быть у паладинов.");
};