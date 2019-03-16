
instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Камень познания";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItMi_ParlanRelic_MIS(C_Item)
{
	name = "Древняя реликвия";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Эта реликвия похоже принадлежала магу Огня...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = "Письмо Лорду Хагену";
	text[4] = "Это письмо написал Гаронд, глава отряда паладинов...";
	inv_animate = 1;
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Лорд Хаген!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Экспедиция в рудниковую долину потерпела неудачу. Мы, выжившие, заперты в замке, окруженные орками! Драконы много раз нападали на нас и полностью разрушили все вокруг замка. С помощью Инноса мы ждем подкрепления. Вылазка невозможна!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Гаронд");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = "Записка Милтена";
	inv_animate = 1;
};

func void UseLetterForGorn()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Горн!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Гаронд согласился освободить тебя за тысячу золотых монет. Если ты где-то запрятал свое золото, то самое время достать его!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Милтен ");
	Doc_Show(nDocID);
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGornsTreasure;
	description = "Кошелек Горна";
	text[4] = "Этот кошелек по всей видимости принадлежал наемнику Горну...";
	inv_animate = 1;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	Gorns_Beutel = TRUE;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = "Записка Сильвестро";
	inv_animate = 1;
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"У меня плохое предчувствие - поэтому я спрятал всю руду в тайник. Диего - единственный из нас, кто здесь хоть как-то ориентируется. Он спрячет ящики с рудой в надежное место! Я даю ему в сопровождение двух рыцарей.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Сильвестро");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItAt_ClawLeader(C_Item)
{
	name = "Когти глорха";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_Claw_Sky.3DS";
	material = MAT_LEATHER;
	description = "Когти глорха";
	text[4] = "Эти ужасные когти раньше принадлежали вожаку стаи глорхов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_CLAWBLACKSNAPPER(C_Item)
{
	name = "Когти глорха";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Когти черного глорха";
	text[4] = "Эти ужасные когти раньше принадлежали черному глорху...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_VEPRFUR(C_Item)
{
	name = "Шкура вепря";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItAt_VeprFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Эту шкуру я снял с убитого мною вепря...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_NIGHTHUNTERFUR(C_Item)
{
	name = "Шкура призрачного мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_TrollBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Эту шкуру я снял с убитого мною призрачного мракориса...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_LUKEREGG(C_Item)
{
	name = "Яйцо шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 150;
	visual = "G3_Item_Scavanger_Egg_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_Olav(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseOlav;
	description = "Кошелек Олава";
	text[4] = "Несколько монет бренчат внутри...";
	inv_animate = 1;
};

func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_Plate_MISGold(C_Item)
{
	name = "Золотое блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


instance ItWr_Bloody_MIS(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "Яд кровяного шершня";
	inv_animate = 1;
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Жало кровяного шершня содержит смертельный яд, который никто не примет находясь в здравом уме. Разве, что, этот человек обладает искусством изымать жало. Жало не глубоко надрезается острым клинком от верха к основанию. Верхний слой удаляется. Освобожденная ткань разрезается вокруг желез.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дамарок");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Теперь я знаю, что мне нужно делать, чтобы выпить лечебный сок, извлеченный из жала кровяного шершня.");
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = "Закладная";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
	text[4] = "Закладная торговца Лютеро...";
	inv_animate = 1;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для погашения возникших долгов берется залог, который своей стоимостью равен размеру долга.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Залог:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- украшенная золотая чаша из коллекции кровавых чаш");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лютеро, торговец  ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лемар, представитель залога");
	Doc_Show(nDocID);
};


instance ITWR_LUTEROLOAN(C_Item)
{
	name = "Расписка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luteroloan;
	scemeName = "MAP";
	description = name;
	text[4] = "Долговая расписка торговца Лютеро ростовщику Лемару...";
	inv_animate = 1;
};


func void use_luteroloan()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, Лютеро, взял у ростовщика Лемара ссуду в размере пяти тысяч золотых монет и обязуюсь выплатить этот долг в указанный срок с вместе прилагаемыми процентами.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лютеро, торговец  ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лемар, представитель залога");
	Doc_Show(nDocID);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS_1(C_Item)
{
	name = "Карта рудниковой долины Гаронда";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld_Oremines()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = "Свиток с записями";
	inv_animate = 1;
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Зов Доминика ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы будем восхвалять его славу ");
	Doc_PrintLines(nDocID,0,"Иннос со мной и моими братьями");
	Doc_PrintLines(nDocID,0,"Мой клинок служит только ему  ");
	Doc_PrintLines(nDocID,0,"и в этот день прозвучит его имя");
	Doc_PrintLines(nDocID,0,"Каждый, кто стоит на моем пути");
	Doc_PrintLines(nDocID,0,"умрет от моей руки");
	Doc_PrintLines(nDocID,0,"потому что я воин Инноса!");
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = "Записка";
	inv_animate = 1;
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы покинули лагерь. Теперь, когда барьер наконец рухнул, мы исследуем центр разрушения. Возможно, там мы найдем ответы, которые мы искали долгие годы. Куда заведет нас наше путешествие, знает только Аданос.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Аданос с нами!");
	Doc_PrintLine(nDocID,0,"Сатурас");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = "Записка";
	inv_animate = 1;
};


func void UseGilbertLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"С меня достаточно! Я слишком долго прятался здесь. И если я все правильно понял, барьер наконец рухнул. Вряд ли кто-то будет меня искать. С меня хватит этой пещеры и вообще всей долины. Пришло время возвращаться домой.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Гелберт");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp;
	text[4] = "Это кольцо раньше принадлежало паладину Тенгрону...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

instance ItWr_Diofant_Paper(C_Item)
{
	name = "Прах Диофанта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseDiofant_Paper;
	scemeName = "MAP";
	description = "Свиток с записями";
	inv_animate = 1;
};


func void UseDiofant_Paper()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Если хочешь выяснить,");
	Doc_PrintLine(nDocID,0,"насколько мудр человек");
	Doc_PrintLine(nDocID,0,"загадай ему эту загадку.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Прах Диофанта");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Прах Диофанта гробница покоит;");
	Doc_PrintLines(nDocID,0,"Дивись ей — и камень");
	Doc_PrintLines(nDocID,0,"Мудрым искусством его");
	Doc_PrintLines(nDocID,0,"Скажет усопшего век.");
	Doc_PrintLines(nDocID,0,"Волей богов шестую часть");
	Doc_PrintLines(nDocID,0,"жизни он прожил ребенком");
	Doc_PrintLines(nDocID,0,"И половину шестой встретил");
	Doc_PrintLines(nDocID,0,"с пушком на щеках.");
	Doc_PrintLines(nDocID,0,"Только минула седьмая, ");
	Doc_PrintLines(nDocID,0," с подругою он обручился,");
	Doc_PrintLines(nDocID,0,"С нею, пять лет проведя,");
	Doc_PrintLines(nDocID,0,"сына дождался мудрец.");
	Doc_PrintLines(nDocID,0,"Только полжизни отцовской");
	Doc_PrintLines(nDocID,0,"возлюбленный сын его прожил,");
	Doc_PrintLines(nDocID,0,"Отнят он был у отца");
	Doc_PrintLines(nDocID,0,"ранней могилой своей.");
	Doc_PrintLines(nDocID,0,"Дважды два года родители");
	Doc_PrintLines(nDocID,0,"оплакивали тяжкое горе.");
	Doc_PrintLines(nDocID,0,"Тут и увидел мудрец");
	Doc_PrintLines(nDocID,0,"предел жизни печальной своей.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Правильный ответ - 64 года.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_LukasLetter(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLukasLetter;
	scemeName = "MAP";
	description = "Великому приору";
	text[4] = "Это письмо написал Лука, прихвостень Ханиара";
	inv_animate = 1;
};

func void UseLukasLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ханиар-слепец!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Уже который час наблюдаю по вашему поручению за новым мюридом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Он ходит, все вынюхивает, и похоже, ищет союзников");
	Doc_PrintLine(nDocID,0,"С виду ничего особенного для новичка он не делает...");
	Doc_PrintLine(nDocID,0,"Однако, нам похоже везет. С последней партией продовольствия к нам попало немало разного хлама,");
	Doc_PrintLine(nDocID,0,"в котором среди прочего мой человек нашел портрет мюрида");
	Doc_PrintLine(nDocID,0,"Похоже, что его просто разыскивают бандиты");
	Doc_PrintLine(nDocID,0,"Вы прекрасно знаете, что в последнее время у нас не было пополнения из мирских.");
	Doc_PrintLine(nDocID,0,"А это значит, что он не ассасин, этого просто не может быть!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Ваш вечно преданный слуга");
	Doc_PrintLine(nDocID,0,"            Лука");
	Doc_Show(nDocID);
};