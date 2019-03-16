instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "Письмо Кантара";
	text[4] = "Письмо Кантара для торговки Сары...";
	inv_animate = 1;
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я пишу вам последний раз это сообщение, с меня довольно долгих ожиданий! Я повторяю вам в последний раз, что если вы не поставите мне оружие, о котором у нас была договоренность еще неделю назад, то с вами Сара я разорву все подписанные нами ранее контракты. Будте благоразумной!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Онар");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Меч Рода";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_035_2h_sld_sword_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ItMw_2h_Rod_Fake(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2;
	damageTotal = 5000;
	damagetype = DAM_EDGE;
	range = 200;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_035_2h_sld_sword_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "Серебро Корагона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "Пакет Теклы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	AI_Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "Свадебная золотая тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_MariasGoldPlate_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "На блюде выгравировано Онар и Мария...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItMi_Ring_Gold_New_Raven.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	description = "Кольцо Валентино";
	text[2] = NAME_Prot_Phis;
	count[2] = Ri_ProtEdge;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Список";
	text[4] = "Список трав, который мне дал алхимик Константино...";
	inv_animate = 1;
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Лечебное растение ");
	Doc_PrintLine(nDocID,0,"Лечебная трава ");
	Doc_PrintLine(nDocID,0,"Лечебный корень");
	Doc_PrintLine(nDocID,0,"Огненная крапива");
	Doc_PrintLine(nDocID,0,"Огненная трава ");
	Doc_PrintLine(nDocID,0,"Огненный корень ");
	Doc_PrintLine(nDocID,0,"Ягода гоблина ");
	Doc_PrintLine(nDocID,0,"Драконий корень ");
	Doc_PrintLine(nDocID,0,"Трава глорха");
	Doc_PrintLine(nDocID,0,"Луговой горец");
	Doc_PrintLine(nDocID,0,"Царский щавель");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = "Рецепт магической эссенции";
	text[4] = "Способ изготовления магической эссенции...";
	inv_animate = 1;
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Магический напиток");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Приготовить напиток магической силы может только искусный алхимик: ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Огненная крапива");
	Doc_PrintLine(nDocID,0,"Огненная трава ");
	Doc_PrintLine(nDocID,0,"Огненный корень ");
	Doc_PrintLine(nDocID,0,"Луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мастер Неорас");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "Пропуск";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[4] = "С этой бумагой я могу без проблем пройти в город...";
	inv_animate = 1;
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Пропуск");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот документ дает его владельцу безпрепятственный и неограниченный по времени проход в нижнюю часть города.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"	Лариус, глава города Хоринис");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItMi_HerbPaket(C_Item)
{
	name = "Пакет с травой";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый липкий пакет от которого воняет болотником...";
	inv_animate = 1;
};

instance ItMi_JointPacket_OW(C_Item)
{
	name = "Пакет с болотником";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Доверху набит переработанным болотником...";
	inv_animate = 1;
};

instance ITMI_DROGENPOCKET(C_Item)
{
	name = "Пакет Идола Орана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_drogenpocket;
	material = MAT_LEATHER;
	description = name;
	text[3] = "Посылка для главы города Хоринис - Лариуса...";
	text[4] = "Непонятно, что там внутри...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_LARIUSGOLDPOCKET(C_Item)
{
	name = "Кожаная сума";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_lariusgoldpocket;
	material = MAT_LEATHER;
	description = name;
	text[3] = "Сума городского главы для Идола Орана...";
	text[4] = "Непонятно, что там внутри...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_drogenpocket()
{
	B_PlayerFindItem(ItMi_Joint,100);
	AI_Print(PRINT_FOUNDJOINTORAN);
	MIS_ORUNPACKET = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_ORUNPACKET);
};

func void use_lariusgoldpocket()
{
	B_PlayerFindItem(ItMi_Gold,1000);
	AI_Print(PRINT_FOUNDGOLD1000);
	Snd_Play("Geldbeutel");
	MIS_ORUNPACKET = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_ORUNPACKET);
};

const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "Копченая сельдь";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 1;
	text[2] = NAME_Bonus_Hp;
	count[2] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Fish;
	inv_animate = 1;
};

func void Use_SmellyFish()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);

		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = name;
	text[4] = "Такое впечатление, что в рыбу что-то вшито...";
	inv_animate = 1;
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	AI_Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "Вонючая записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[4] = "Эта записка была зашита в рыбе...";
	inv_animate = 1;
};

func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Halvor = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Вас приветствует старый торговец! Ополчение стало очень внимательно и вас ищут. Остановите нападения, пока все не успокоится!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Халвор");
	Doc_Show(nDocID);
};

instance ItWr_DexterOrder(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexterOrder;
	scemeName = "MAP";
	description = name;
	text[4] = "Это письмо я нашел у одного из главарей бандитов...";
	inv_animate = 1;
};

func void Use_ItWr_DexterOrder()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Оставайтесь на своем месте и не высовывайтесь, пока наш человек в ополчении не даст нам знать, какова сейчас ситуация в городе.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Д.");
	Doc_Show(nDocID);
};

instance ItWr_DexTrait(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexTrait;
	scemeName = "MAP";
	description = name;
	text[4] = "Это письмо я нашел у Декстера...";
	inv_animate = 1;
};

func void Use_ItWr_DexTrait()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Декстер, останови пока нападения своих людей! Вульфгар что-то начал подозревать. Лучше нам переждать некоторое время.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Пек");
	Doc_Show(nDocID);
};

instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_ShortSword2_New.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = "Это меч принадлежит Альрику...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Equip_AlriksSword()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,10);
		MELEEWEAPONINDEX = 4;
		BONUSHW = 2;
	};
};

func void UnEquip_AlriksSword()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10);
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;
	};
};


instance ItWr_VatrasMessage(C_Item)
{
	name = "Запечатанное послание";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "Запечатанное послание Ватраса для магов огня...";
	inv_animate = 1;
};


func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Исгарот!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Все больше и больше я чувствую присутствие неизвестной чужой силы. Силы, которая совсем незнакома мне. Может это слуги Белиара? Может я и ошибаюсь, но я думаю, что было бы уместно, если бы власть взял отец Пирокар.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Ватрас");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "Послание";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[4] = "Вскрытое послание Ватраса для магов огня...";
	inv_animate = 1;
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогой Исгарот!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Все больше и больше я чувствую присутствие неизвестной чужой силы. Силы, которая совсем незнакома мне. Может это слуги Белиара? Может я и ошибаюсь, но я думаю, что было бы уместно, если бы власть взял отец Пирокар.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Ватрас");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
	Doc_Show(nDocID);
};

instance ItFo_Schafswurst(C_Item)
{
	name = "Баранья колбаса";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
	inv_animate = 1;
};


func void Use_Schafswurst()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana_New.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эссенция духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_LittleMana()
{
	B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
	Npc_ChangeAttribute(self,ATR_MANA,1);
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "Предложение о мире паладинам";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[4] = "С этой бумагой я буду допущен к Лорду Хагену...";
	inv_animate = 1;
};

func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Благороднейший Лорд Хаген! ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы оба знаем о положении, в котором вы находитесь. Я предлагаю следующие действия...(большой текст)... Я прошу Вас рассмотреть мое предложение со всей данной Вам мудростью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Генерал Ли");
	Doc_PrintLine(nDocID,0,"");

	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "Сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[4] = "Предписание о розыске...";
	inv_animate = 1;
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Задерживать всех мужчин, которые приходят с гор. Если у кого-то не будет документов, то это и будет тот самый человек. Принесите мне его голову!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,".....D.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Это изображение очень сходит на мою внешность...";
	inv_animate = 1;
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damagetype = DAM_POINT | DAM_FLY;
	damage[DAM_INDEX_POINT] = Damage_Jagdbogen;
	damage[DAM_INDEX_FLY] = 1;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	on_equip = equip_bow_light;
	on_unequip = unequip_bow_light;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "Старый охотничий лук торговца Боспера...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Кольцо";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	description = "Кольцо алхимика Константино";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[4] = "Это драгоценное кольцо принадлежит городскому алхимику Константино...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Статуя Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "'Иннос, прошу защити меня и пусть несчастья обойдут меня...'";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "Книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Долговая книга Лемара";
	text[4] = "В книге записано кто и сколько должен ростовщику Лемару денег...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
	inv_animate = 1;
};


func void UseSchuldBuch()
{
	var int nDocID;

	if(LemarBookRead == FALSE)
	{
		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
		LemarBookRead = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_WOOD_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_WOOD_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Бизнес и долги");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, мастер Торбен, столяр из Хориниса, должен уважаемому господину Лемару 200 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Торбен");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, Корагон, трактирщик в Хоринисе, должен уважаемому господину Лемару 150 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Корагон");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Я, Ханна, владелица гостиницы в Хоринисе, должна уважаемому господину Лемару 250 золотых монет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ханна");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Xagitta_Herb_MIS(C_Item)
{
	name = "Солнечное алоэ";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ITPL_SAGGITA_HERB_01_NEW.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
	inv_animate = 1;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damagetype = DAM_BLUNT | DAM_POINT;
	damage[DAM_INDEX_BLUNT] = 50;
	damage[DAM_INDEX_POINT] = 15;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItRw_Crossbow_L_02.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = "Арбалет Драгомира";
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_BLUNT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[4] = "В основании упора арбалета выбито имя 'Драгомир'...";
	text[5] = NAME_Value;
	count[5] = value;
};

///////Новое///////////

instance ITMI_TALIASAN_ROBA(C_Item)
{
	name = "Роба мага";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_taliasan_roba;
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тщательно сложена";
	text[3] = "и даже выглажена";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_taliasan_roba()
{
	B_PlayerFindItem(itar_mage,1);
};

instance Holy_Hammer_MIS(C_Item)
{
	name = "Святой молот Инноса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	//visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	visual = "Holy_Hammer_MIS_New.3DS";
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH;
	inv_animate = 1;
};

instance HOLY_HAMMER_MIS_NEW(C_Item)
{
	name = "Молот Инноса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	//visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	visual = "Holy_Hammer_MIS_New.3DS";
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH;
	inv_animate = 1;
};

instance ITRI_QUEST_PAL_RING(C_Item)
{
	name = "Знак отваги и доблести";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = 1;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[4] = "Выдано за особые заслуги перед орденом";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_HOLGER_LETTER(C_Item)
{
	name = "Письмо Хольгера";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_holger_letter;
	scemeName = "MAP";
	description = "Письмо Хольгера";
	inv_animate = 1;
};

func void use_holger_letter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Простите меня непутевого!");
	Doc_PrintLine(nDocID,0,"Спасибо что спасли меня, но");
	Doc_PrintLine(nDocID,0,"я не могу больше тут находиться,");
	Doc_PrintLine(nDocID,0," тут кругом одни зануды!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITMI_DARON_SUMA(C_Item)
{
	name = "Кожаная сумка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_daron_suma;
	material = MAT_LEATHER;
	description = name;
	text[4] = "Сумка с пожертвованиями для монастыря Инноса...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_daron_suma()
{
	B_PlayerFindItem(itmi_beliar_gold,10000);
	AI_Print(PRINT_FOUNDGOLD1000);
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 100;
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	AI_PrintClr("Маги Огня объявили вас вне закона...Иннос все видит!",177,58,17);
	Snd_Play("Geldbeutel");
	MIS_DARON_GIVEGOLD = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_DARON_GIVEGOLD);
};

instance ITAM_HOLGER_AMULET(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 300;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Амулет Хольгера";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};