
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = "Послание для Ватраса";
	text[4] = "Послание тщательно запечатано...";
	inv_animate = 1;
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Ватрас!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ты был прав. Кажется, они действительно поклонялись Аданосу. Но орнамент, который мы нашли, имеет более важное значение. Кажется, это важный ключ-артефакт! Мы должны изучать его дальше. Пошли одного из наших детей из 'Кольца воды', чтобы он принес его обратно.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Сатурас");
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"У одного бандита я отнял сообщение, которое Кавалорн должен был передать магу воды Ватрасу. Теперь это мое задание.");
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Существует сообщество, которое называется 'Кольцо воды'. Кажется, им командуют маги огня.");
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater,"Кавалорн принадлежит к 'Кольцу воды'");
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = "Послание для Ватраса";
	text[4] = "Печать на послании сломана...";
	inv_animate = 1;
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Каменный осколок большого кольца с орнаментом...";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
	inv_animate = 1;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Каменный осколок большого кольца с орнаментом...";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
	inv_animate = 1;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = "Карта Нефариуса";
	text[4] = "На ней отмечены места нахождения осколков с орнаментом...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int Document;
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_DEXTER_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = "Карта Хориниса";
	text[4] = "На карте отмечено местонахождение бандитского лагеря Декстера...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Dexter()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = "Аквамариновое кольцо";
	text[3] = "Этот предмет является опознавательным знаком 'Кольца Воды'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		AI_Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[4] = "Это кольцо принадлежит Ларесу...";
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[4] = "Это кольцо принадлежит мне...";
};

instance ItRi_LanceRing(Rangerring_Prototype)
{
	text[4] = "Это кольцо принадлежит Лансу...";
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Кольцо с орнаментом";
	text[4] = "Это кольцо с орнаментом открывает магический портал...";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_animate = 1;
};

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Рекомендательное письмо Мартина";
	text[4] = "Рекомендательное письмо для главы ополчения, Лорда Андре...";
	inv_animate = 1;
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Уважаемый Лорд Андре!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"С этим письмом я представляю нового рекрута в наше ополчение. Своей надежной службой в сложных ситуациях он заслужил мое уважение. Я уверен, что он подходящий кандидат для защиты Короля и граждан этого города!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Начальник склада Мартин");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = "Предписание Ворона";
	text[4] = "Это письмо находилось у бандита Декстера...";
	inv_animate = 1;
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"Теперь у меня есть письменные доказательства. Ворон, бывший рудный барон, стоит за похищениями жителей Хориниса. Он прячется где-то в горах на северо-востоке Хориниса. Мне нужно непременно показать это письмо Ватрасу.");
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Декстер! Если тебе не удастся похитить еще больше жителей города и отправить их ко мне, у меня будут проблемы с ребятами в нашем укрытии. Мне нужно еще больше рабов, иначе парни подымут бунт. Что это означает, я тебе объяснять не буду, или? Мне уже почти удалось проникнуть в храм. Поэтому мне такие помехи тем более не нужны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ворон");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = "Рекомендательное письмо Ватраса";
	text[4] = "Это письмо поможет попасть в монастырь Магов Огня...";
	inv_animate = 1;
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Братья Огня!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"До меня дошло, что за допуск в ваши покои взимается дань. Я представляю этим письмом одного верующего человека, который хочет стать послушником в ваших рядах.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ватрас");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = "Освященная статуэтка Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 10;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_GoblinnosStatue_Daron_New(C_Item)
{
	name = "Освященная статуэтка Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 5;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Выглядит как-то подозрительно...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = "Прощальное письмо Люсии";
	inv_animate = 1;
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;

	if(MIS_LuciasLetter == FALSE)
	{
		MIS_LuciasLetter = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		B_LogEntry(TOPIC_Addon_Lucia,"Люсия написала прощальное письмо Элвриху. Оно его обязательно заинтересует!");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Любимый Элврих! Мне не хватает слов, чтобы написать, как я сожалею. Я знаю, что ты этого не поймешь, но я пришла к заключению, что для нас обоих будет лучше, если ты поищешь более приличную девушку, чем я. Оттуда, куда я направляюсь, я не вернусь обратно. Прощай!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Люсия");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = "Мотыга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "G3_Item_Tool_Rake_01.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Use_Rake()
{
	if(Npc_IsPlayer(self) && (RakeBONUS == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 50;
		AI_NoticePrint(3000,4098,NAME_Addon_RakeBonus);
		RakeBONUS = TRUE;
	};
};

instance ItRi_Addon_BanditTrader(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Гравированное кольцо";
	text[4] = "Знак торговой гильдии заморских торговцев Аракос...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[4] = "Это письмо было у бандитов за двором Секоба...";
	inv_animate = 1;
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Lieferung_Gelesen = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"15 коротких мечей");
	Doc_PrintLines(nDocID,0,"20 Шпаги");
	Doc_PrintLines(nDocID,0,"25 Булок хлеба");
	Doc_PrintLines(nDocID,0,"15 Бутылок вина");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это было в последний раз! Для меня потихоньку становится слишком опасно.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Фернандо");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Я нашел письмо, которое доказывает, что Фернандо тот торговец оружием, которого я ищу");
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = "Послание для Сатураса";
	text[4] = "Послание тщательно запечатано...";
	inv_animate = 1;
};

func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Сатурас!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я надеюсь, вы скоро будете у цели. Ситуация в городе слегка разрядилась. Но я боюсь, что спокойствие обманчиво. Вы должны поторопиться! И еще одно... Я посылаю вам помощь. Тот, кто передаст эту новость - особенный. Я не уверен, но это может быть ОН. Проверь его!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Ватрас");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = "Послание для Сатураса";
	text[4] = "Печать на послании сломана...";
	inv_animate = 1;
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_Am_DexStrg;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Амулет ищущего огонька";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = "Мясо болотных крыс";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_ItFo_Addon_Krokofleisch;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
	inv_animate = 1;
};

func void Use_ItFo_Addon_Krokofleisch()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	description = "Кольцо Моргана";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 5;
	text[4] = "На кольце выгравированы изящные руны...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
	};
};

func void UnEquip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-5);
	};
};

instance FakeUnitor(C_Item)
{
	name = "Юнитор";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Focus(C_Item)
{
	name = "Юнитор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Фокусирующий кристалл...";
	inv_animate = 1;
};

instance ItMi_UnSharp_MagicCrystal(C_Item)
{
	name = "Кусок кристалла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Содержит магическую энергию...";
	inv_animate = 1;
};

instance ItMi_MagicCrystal(C_Item)
{
	name = "Магический юнитор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Магический фокусирующий кристалл...";
	inv_animate = 1;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = "Пакет стали";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "В пакете находится толстый блок стали...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = "Древняя каменная скрижаль";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Скрижаль испещрена надписями на древнем языке...";
	text[5] = NAME_Value;
	count[5] = 10;
	inv_animate = 1;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Каста Воинов вызвала на нас гнев богов.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"РАДЕМЕС, преемник КУАРХОДРОНА, был проклят. Но его злая сила доставала нас даже с места его проклятия.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Мы были бессильны против этого.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Гнев АДАНОСА поразил ЯРКЕНДАР!");
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_01(C_Item)
{
	name = "Красная глинянная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Испещрена надписями на древнем языке зодчих...";
	inv_animate = 1;
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Мы, последние три предводителя Совета Пяти, соорудили ловушки в камерах храма и скрыли вход, чтобы меч больше никогда не увидел дневной свет.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_05(C_Item)
{
	name = "Желтая глинянная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[4] = "Испещрена надписями на древнем языке зодчих...";
	inv_animate = 1;
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Я, который был против решения Трех, соорудил первую ловушку. И только я знаю правильный путь.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_03(C_Item)
{
	name = "Голубая глинянная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Испещрена надписями на древнем языке зодчих...";
	inv_animate = 1;
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"ХАРДИМОН создал вторую ловушку. И только тот, кто до конца идет путем света, достигнет третьей камеры.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_04(C_Item)
{
	name = "Зеленая глинянная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Испещрена надписями на древнем языке зодчих...";
	inv_animate = 1;
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"Третью ловушку построил КУАРХОДРОН, и только он знает, как ее открыть.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_02(C_Item)
{
	name = "Фиолетовая глинянная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Испещрена надписями на древнем языке зодчих...";
	inv_animate = 1;
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID,0,"КУАРХОДРОН запер с помощью ХАРДИМОНА дверь в храм. Никто из них не пережил ритуала.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Только я остался, чтобы рассказать об этих событиях.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Я надеюсь, что РАДЕМЕС будет навечно проклят гнить в храме.");
	}
	else
	{
		Doc_PrintLines(nDocID,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Золотой компас";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Этот навигационный прибор сделан из чистого золота...";
	inv_animate = 1;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = NAME_Chest;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = "Сундук с сокровищами";
	text[4] = "Очень тяжелый...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void FrancisChest()
{
	CreateInvItems(hero,ItMi_ChestGold,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_CupGold,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Geldbeutel");
};

instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Учетная книга Фрэнсиса";
	text[4] = "В этой книге велись записи по разделу пиратской добычи...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
	inv_animate = 1;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Торговое судно 'Русалка'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Вся добыча: 14560 Золотых");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Команда: 9840");
	Doc_PrintLine(nDocID,0,"Офицеры: 2500");
	Doc_PrintLine(nDocID,0,"Капитан    : 1000 ");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"моя часть: 2220");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Торговый корабль 'Мириам'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Вся добыча: 4890 Золотых");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Команда: 2390");
	Doc_PrintLine(nDocID,0,"Офицеры: 500");
	Doc_PrintLine(nDocID,0,"Капитан    : 500 ");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"моя часть: 1000");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Торговый корабль 'Нико'");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Вся добыча: 9970 Золотых");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Команда: 5610");
	Doc_PrintLine(nDocID,1,"Офицеры   : 1500");
	Doc_PrintLine(nDocID,1,"Капитан    : 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"моя часть: 1860");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Торговый корабль 'Мария'");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Вся добыча: 7851 Золотых");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Команда: 4400");
	Doc_PrintLine(nDocID,1,"Офицеры: 750");
	Doc_PrintLine(nDocID,1,"Капитан    : 1000 ");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"моя часть: 1701");
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Журнал Грэга";
	text[4] = "Судовой журнал главаря пиратов...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
	inv_animate = 1;
};


func void UseGregsLogbuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Не могу больше видеть этот пляж. Повсюду песок. Не могу даже нормально спать, потому что везде чешется. Ворону давно пора выплатить деньги за пленных, чтобы мы наконец смогли выйти в море. Пора перекинутся парой серьезных слов с этим надутым индюком.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Что этот выскочка себе позволяет? Приказал своим прислужникам на воротах дать мне от ворот поворот. Он меня еще узнает! А его шестерку Бладвина я скормлю рыбам.");
	Doc_PrintLines(nDocID,0,"Если он скоро не заплатит, я найду другие способы.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Бандиты начинают потихоньку доставать. За последнюю поставку они так и не заплатили. У нас слишком мало информации о них. Мы должны узнать, чего Ворон здесь хочет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"С большей частью команды я поплыву на материк, чтобы спрятать руду в надежном месте. Фрэнсис с парой людей останется здесь и будет укреплять лагерь.");
	Doc_PrintLines(nDocID,1,"Чтобы не тратить попусту время, я дал Бонесу кольчугу. Он проникнет в бандитский лагерь и выяснит, какие у Ворона планы.");
	Greg_GaveArmorToBones = TRUE;
	Doc_Show(nDocID);
};

instance ItMi_TempelTorKey(C_Item)
{
	name = "Каменная скрижаль";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	description = "Скрижаль Куарходрона";
	text[4] = "Этот древний артефакт открывает проход в храм Аданоса...";
	inv_animate = 1;
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jhehedra Akhantar");
	Doc_Show(nDocID);
};

instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name = "Голова Бладвина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Addon_Masiafadept_Kopf(C_Item)
{
	name = "Голова послушника";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Ituseld_Kopf(C_Item)
{
	name = "Голова Иту'Зельда";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DeadManHead(C_Item)
{
	name = "Голова дезертира";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ITWR_ADDON_TREASUREMAP_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = "Карта сокровищ";
	text[4] = "На карте крестами отмечено несколько мест...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_TreasureMap()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Бутылка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = "Запечатанная бутылка";
	text[4] = "Внутри находится небольшой лист бумаги...";
	inv_animate = 1;
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(itwr_addon_treasuremap_1,1);
};


instance itmi_erolskelch(C_Item)
{
	name = "Серебряное блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice_Sky.3DS";
	material = MAT_METAL;
	description = "Серебряное блюдо";
	text[4] = "На внешней стороне имеется несколько очень сильных царапин...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_OrcHeal(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Cвиток исцеления";
	text[4] = "Магия этого свитка способна исцелить любое существо...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_OrcGonez(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItKe_OrcGonez;
	material = MAT_METAL;
	description = name;
	text[3] = "Полукруглый ключ с вырезами, сделанными под различными углами...";
	text[4] = "В основании под коркой грязи видна неразбочивая надпись...";
	inv_animate = 1;
};

func void Use_ItKe_OrcGonez()
{
	if(MIS_OldOrcKey == FALSE)
	{
		B_PlayerFindItem(ItKe_OldOrcKey,1);
		MIS_OldOrcKey = LOG_Running;
		Log_CreateTopic(TOPIC_OldOrcKey,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OldOrcKey,LOG_Running);
		B_LogEntry(TOPIC_OldOrcKey,"Я нашел очень странного вида ключ. Кажется, он был сделан каким-то орком, поскольку в его основании четко видно надпись на орочем языке. Только вот от чего он?");
	};
};

//------------------------------------------Квест Ур-Тралла------------------------------------------------

instance ItWr_AboutNagDumgar_P1(C_Item)
{
	name = "Древняя скрижаль";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Древняя орочья скрижаль";
	text[3] = "Древняя потертая орочья скрижаль...";
	text[4] = "Вся скрижаль испещрена надписями на орочьем языке...";
	on_state[0] = Use_ItWr_AboutNagDumgar_P1;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P1()
{
	var int nDocID;

	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P1 == FALSE)
		{
			if(MIS_NagDumgar == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};

				KnowAboutNagDumgar_P1 = TRUE;
				B_LogEntry(TOPIC_NagDumgar,"Я нашел странную орочью скрижаль! Похоже в ней описываются события, когда вождь орков Наг-Думгар отправился в храм в поисках злого демона, убившего его братьев. Судя по всему, причиной гибели его отряда стал какой-то злой шаман орков, которому подчинялась вся нежить в храме. Все орки, попавшие в его руки, были пренесены в жертву. Сам Наг-Думгар по всей видимости предал своих братьев и стал служить злому шаману...поэтому и остался жить!");

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar,"Кажется, ситуация начинает немного разъясняться...По всей видимости злой шаман, которому служил Наг-Думгар, и верховный шаман орков Хаш-Гор - одно лицо! Думаю, мне стоит побольше узнать о нем - но только у кого и где?! Если только в старой башне Ксардаса сохранились какие-нибудь записи, касающиеся Храма Спящего и Хаш-Гора. Попробую поискать там...");
				};
				if((CurrentLevel == OldWorld_Zen) && (KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE) && (XardasOrcBooksIns == FALSE))
				{
					Wld_InsertItem(ItWr_AboutNagDumgar_P3,"FP_ITEM_NAGDUMGAR_03");
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
			rnd = Hlp_Random(100);

			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_31 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_31 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Наш вождь повел нас дальше в глубь пещеры храма...");
		Doc_PrintLines(nDocID,0,"Все вокруг усеяно изуродованными трупами наших братьев. Кажется здесь произошла настоящая бойня!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"С огромными потерями мы дошли до внутреннего двора Храма. Здесь все просто кишит мертвыми!");
		Doc_PrintLines(nDocID,0,"В темноте постоянно мелькают чьи-то тени, а ужасные стоны сводят всех нас с ума.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"В одном из святилищ Храма, мы встретили мертвого шамана орков. Он сказал, что мы все здесь умрем!");
		Doc_PrintLines(nDocID,1,"Потом нас со всех сторон окружили мертвые. Нам осталось только сражаться или погибнуть...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Злой шаман каждый день проливает кровь моих братьев на жертвенном камне. Большим ножом он вспарывает им плоть, а потом пожирает их сердца!");
		Doc_PrintLines(nDocID,1,"Рядом с ним я видел Наг-Думгара! Теперь он служит злому шаману.");
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if((MIS_NagDumgar == LOG_Running) && (PlayerKnowsOrcLanguageNeed == FALSE))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Мне нужно выучить язык орков, чтобы прочесть это...");
		};	
	};
};

instance ItWr_AboutNagDumgar_P2(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_AboutNagDumgar_P2;
	scemeName = "MAP";
	description = "Древний орочий пергамент";
	text[4] = "На пергаменте сделано несколько надписей на языке орков...";
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P2()
{
	var int nDocID;
	
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P2 == FALSE)
		{
			if(MIS_NagDumgar == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};

				KnowAboutNagDumgar_P2 = TRUE;
				B_LogEntry(TOPIC_NagDumgar,"У одного из орочьих шаманов в Храме Спящего, я нашел странный орочий пергамент. Судя по его содержанию, орки приносили жертвоприношения своему злому демону, чтобы на них не обрушился его гнев! В письме также упоминается имя верховного шамана Хаш-Гора, который по всей видимости и проводил эти ужасные ритуалы. Кажется, он обладал огромной властью и уважением среди орков.");

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar,"Кажется, ситуация начинает немного разъясняться... По всей видимости злой шаман, которому служил Наг-Думгар, и верховный шаман орков Хаш-Гор - одно лицо! Думаю, мне стоит побольше узнать о нем - но только у кого и где?! Если только в старой башне Ксардаса сохранились какие-нибудь записи, касающиеся Храма Спящего и Хаш-Гора. Попробую поискать там...");
				};
				if((CurrentLevel == OldWorld_Zen) && (KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE) && (XardasOrcBooksIns == FALSE))
				{
					Wld_InsertItem(ItWr_AboutNagDumgar_P3,"FP_ITEM_NAGDUMGAR_03");
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
			rnd = Hlp_Random(100);

			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_32 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_32 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book_Letter);
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Варраг-Бек!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"У меня заканчиваются рабы для жертвоприношений нашему повелителю. Если на жертвенный алтарь перестанет литься кровь, то нас всех постигнет его ужасный гнев! Неужели мне постоянно надо напоминать тебе об этом. Или быть может ты хочешь сам занять их место?!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Хаш-Гор, Верховный шаман");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if((MIS_NagDumgar == LOG_Running) && (PlayerKnowsOrcLanguageNeed == FALSE))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Мне нужно выучить язык орков, чтобы прочесть это...");
		};	
	};
};

instance ItWr_AboutNagDumgar_P3(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Старый дневник Ксардаса";
	text[4] = "В нем темный маг хранил свои некоторые старые записи...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_AboutNagDumgar_P3;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P3()
{
	var int nDocID;

	if(KnowAboutNagDumgar_P3 == FALSE)
	{
		if(MIS_NagDumgar == LOG_Running)
		{
			B_GivePlayerXP(150);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			KnowAboutNagDumgar_P3 = TRUE;
			B_LogEntry(TOPIC_NagDumgar,"Думаю я нашел то, что искал! Судя по всему, Ксардас сам интересовался Хаш-Гором. В особенности его интересовал один артефакт - ритуальный нож верховного шамана, с помощью которого тот мог оживлять и подчинять себе мертвых. Возможно в этом предмете и кроется тайна Наг-Думгара. Однако для начала мне предстоит отыскать Хаш-Гора или то, что от него осталось и забрать у него жертвенный нож. Интересно, кто мне сможет ответить - где сейчас Хаш-Гор?");
		};
	}
	else
	{
		var int rnd;
		rnd = Hlp_Random(100);

		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_33 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_33 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...как мне уже стало известно, в строительстве храма принимало участие пять шаманов орков. Однако меня терзают смутные сомнения, что ими всеми руководил кто-то один. Многие орки, которых я допросил, упоминают имя Хаш-Гор! По всей видимости, он был верховным шаманом в клане, строившим Храм. Может быть он и есть тот самый главный творец Храма Спящего?!...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...мне удалось выяснить, что Хаш-Гор постоянно проводил ритуалы жертвоприношений в дар могущественному демону. Для этого у него имелся особенный ритуальный нож, с помощью которого, по словам орков, он был даже способен оживлять и подчинять себе мертвых! С точки зрения некромантии, этот предмет вызывает у меня неподдельный интерес. Однако заполучить его для себя по всей видимости навряд ли представляется возможным.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ItMi_NestorHead(C_Item)
{
	name = "Голова Нестора 'Ганибала'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_NestorHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_KriksHead(C_Item)
{
	name = "Голова Крикса 'Бритвы'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_KriksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_BartHead(C_Item)
{
	name = "Голова Барта 'Коротышки'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_BartHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_SkironHead(C_Item)
{
	name = "Голова Скирона 'Мясника'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_SkironHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_RocksHead(C_Item)
{
	name = "Голова Рокса 'Шустрого'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RocksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DexterHead(C_Item)
{
	name = "Голова Декстера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DexterHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};