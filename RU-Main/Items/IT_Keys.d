
const int Value_Lockpick = 15;
const int Value_Key_01 = 0;
const int Value_Key_02 = 0;
const int Value_Key_03 = 0;

instance ItKE_lockpick(C_Item)
{
	name = "Отмычка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lockpick;
	visual = "ITKE_LOCKPICK.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//-----------------------------------------------Ключи--------------------------------

instance ItKe_City_Tower_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_HanibalKey(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ главаря разбойников, Нестора";
	inv_animate = 1;
};

instance ItKe_City_Tower_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_City_Tower_03(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_City_Tower_04(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_City_Tower_05(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_City_Tower_06(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки башни";
	inv_animate = 1;
};

instance ItKe_Valentino(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука Валентино...";
	inv_animate = 1;
};

instance ItKe_Constantino(C_Item)
{
	name = "Ключ Константино";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука алхимика Константино...";
	inv_animate = 1;
};

instance ItKe_WaterBringer(C_Item)
{
	name = "Ключ Водоноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Storage(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от склада в порту";
	inv_animate = 1;
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы воров...";
	inv_animate = 1;
};

instance ItKe_ZhiefGuildKey_MIS(C_Item)
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Похоже, что морская соль разъела этот ключ...";
	inv_animate = 1;
};

instance ItKe_XhiefGuildKey_Hotel_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от подвала гостиницы...";
	inv_animate = 1;
};

instance ItKe_Richter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука городского судьи...";
	inv_animate = 1;
};

instance ItKe_Salandril(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука алхимика Саландрила...";
	inv_animate = 1;
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ржавый ключ от комнаты Фингерса...";
	inv_animate = 1;
};

instance ItKe_Bromor(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "Ключ от комнаты в борделе...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от каюты капитана корабля паладинов 'Эсмеральда'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в башне Ксардаса...";
	inv_animate = 1;
};


instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от входа в монастырь магов огня...";
	inv_animate = 1;
};

instance ItKe_IgarazChest_Mis(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от личного сундука Игараца...";
	inv_animate = 1;
};


instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от библиотеки в монастыре...";
	inv_animate = 1;
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от монастырской кельи...";
	inv_animate = 1;
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы в монастыре...";
	inv_animate = 1;
};


instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от кладовой в монастыре...";
	inv_animate = 1;
};

instance ItKe_MonastarySecretLibrary_Mis(C_Item) //EVT_OPEN_DOOR_LIBRARY
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ из книги 'Залы Ирдората'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_Ginnok(C_Item)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от гробницы Лорда Гиннока...";
	inv_animate = 1;
};

instance ITKE_RUNE_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "Ключ от сундука под мостом...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от комнаты в таверне 'Мертвая гарпия...";
	inv_animate = 1;
};

instance ITKE_ORLAN_TELEPORTSTATION(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Орлана";
	text[4] = "Открывает дверь в пещеру к югу от его таверны...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_01(C_Item)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от гробницы Лорда Сенгаха...";
	inv_animate = 1;
};

instance ItKe_Pass_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = "Ключ Лорда Хагена";
	text[4] = "Этот ключ от лебедки ворот прохода в Долину Рудников...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука Декстера...";
	inv_animate = 1;
};

instance ITKE_DARKTOWER_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от башни Нергала...";
	inv_animate = 1;
};

instance ITKE_FORT(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от замка лебедки прохода в форт Азган...";
	inv_animate = 1;
};

instance ItKe_Hagen_Innubis(C_Item) //двойной!!!
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от склепа Лорда Инубиса...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_01(C_Item) //mob_func_necrom
{
	name = "Старый стальной ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в склепе Лорда Инубиса...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Старый латунный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в склепе Лорда Инубиса...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Старый медный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в склепе Лорда Инубиса...";
	inv_animate = 1;
};

instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в усадьбе Секоба...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_HAGEN_SECRETKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от прохода к порталу на остров Этлу...";
	inv_animate = 1;
};

instance ItKe_MagicChest(C_Item)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Очень старый железный ключ...";
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_02(C_Item)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от гробницы Лорда Ульзара...";
	inv_animate = 1;
};

instance ItKe_PrisonKey_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от тюремных камер в замке...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки ворот замка в Долине Рудников...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_FingersKey(C_Item)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "На дужке ключа выбито слово...'Фингерс'";
	inv_animate = 1;
};

instance ItKe_OC_Store(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от склада в замке...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_TWOSTORE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от внутреннего помещения склада в замке...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ERZBARONTREASURE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "На ключе выгравировано имя Гомез...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_MILTENKEY_NW(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в часовне магов в замке...";
	inv_animate = 1;
};

instance ITKE_OC_TOWERCHEST(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в башне замка Долины Рудников...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ErzBaronFlur(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "На ключе выгравировано имя Гомез...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ErzBaronRaum(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "На ключе выгравировано имя Гомез...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKEY_GOMEZTREASURE(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука Гомеза...";
	inv_animate = 1;
};

instance ITKE_NC_COOKCHEST(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ, который мне дал повар из замка...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_WaterMageDocuments(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука магов Воды в Новом лагере...";
	inv_animate = 1;
};

instance ITKE_WOLFARMOR(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука наемника Вольфа в Долине Рудников...";
	inv_animate = 1;
};

instance ItKe_StoneDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы каменного дракона...";
	inv_animate = 1;
};

instance ItKe_FireDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы огненного дракона...";
	inv_animate = 1;
};

instance ItKe_SwampDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы болотного дракона...";
	inv_animate = 1;
};

instance ItKe_IceDragon(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сокровищницы леденого дракона...";
	inv_animate = 1;
};

instance ItKe_Malbar(C_Item) //Scr_OpenChest_Malbar
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ рудного барона Мальбара...";
	inv_animate = 1;
};

instance ITKE_XARDASGOBLINKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука гоблина-призрака...";
	inv_animate = 1;
};

instance ITKE_DRAKAR_KEY_CAPITAN(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от каюты капитана дракара орков...";
	inv_animate = 1;
};

instance ITKE_DRAKAR_KEY_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ от арсенала дракара орков...";
	inv_animate = 1;
};

instance ITKE_DRAGONSNAPPER(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ из живота одного драконьего снеппера...";
	inv_animate = 1;
};

instance ITKE_Addon_Tavern_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = "Ключ Лу";
	text[4] = "Открывает кладовку в лагере бандитов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ADDON_BUDDLER_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ";
	text[4] = "Ключ от сундука из лагеря бандитов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Esteban_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ Эстебана";
	text[4] = "Ключ от сундука Эстебана...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Thorus(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ Торуса";
	text[4] = "Ключ от сундука Торуса...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ADDON_SKINNER(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ключ Скиннера";
	text[4] = "Ключ от сундука Скиннера...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_SCATTYCHEST(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Скатти";
	text[4] = "Ключ от сундука Скатти...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = "Ключ Бладвина";
	text[4] = "Ключ от сундука Бладвина...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Addon_Heiler(C_Item)	//Scr_OpenChest_Garantula
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ, найденный у каменного стража на болотах...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Странный на вид ключ, найденный у шамана орков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_Greg_ADDON_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = "Ключ Грэга";
	text[4] = "Ключ от хижины капитана Грэга...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_TARAKOT(C_Item)
{
	name = "Медный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKey_GoblinChest(C_Item)
{
	name = "Гоблинский ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Этот ключ был у вождя гоблинов, Шакзи";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука паладинов...";
	inv_animate = 1;
};

instance ItKe_Buerger(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ лежал на камине...";
	inv_animate = 1;
};

instance ItKe_Ginnok(C_Item)
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Лорда Гиннока...";
	inv_animate = 1;
};

instance ITKE_ORCSHAMAN_SHV(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука шамана-призрака в Долине Теней...";
	inv_animate = 1;
};

instance ITKE_KOD_SHV(C_Item)	//Scr_OpenChest_225 226
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Даката";
	text[4] = "Ключ от сундуков в гробнице Даката...";
	inv_animate = 1;
};

instance ItKe_AhironKey(C_Item)	//
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Ключ Ахирона";
	text[4] = "Ключ от сундука Ахирона...";
	inv_animate = 1;
};

instance ITKE_MAGE_SHV(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука жреца в Долине Теней...";
	inv_animate = 1;
};

instance ItKe_Oazis_01(C_Item)	//Scr_OpenChest_AV_01
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_02(C_Item)	//Scr_OpenChest_AV_02
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_03(C_Item)	//Scr_OpenChest_AV_03
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Oazis_04(C_Item)	//Scr_OpenChest_AV_04
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};


instance ItKe_Caracust(C_Item)
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_Masiaf_Prision(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от лебедки в пещере Осаира...";
	inv_animate = 1;
};

instance ItKe_CorGalom(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Кор Галома, демона Масиаф...";
	inv_animate = 1;
};

instance ItKe_PW_Sklad(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от кладовой в храме Масиаф...";
	inv_animate = 1;
};

instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Ур-Ватаха, военачальника орков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Лорда Архола...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Миалекса, зодчего храма Ирдората...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука хранителя чертогов Ирдората, Дементора...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Старый дверной ключ...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_FREEMINE(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сторожки свободной шахты...";
	inv_animate = 1;
};

instance ITKE_FREMINEKDW(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в Свободной шахте...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_VARUSKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от склада в форте Азган...";
	inv_animate = 1;
};

instance ITKE_GRIMKEY(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука охранника в заброшенной шахте...";
	inv_animate = 1;
};

instance ITKE_XARDASOWT(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука в затопленной башне...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_SI_SIGN(C_Item)
{
	name = "Ключ-печать";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ITKE_SEAL_SKY.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Ключ-печать от входа в часовню паладинов...";
	text[4] = "На ключе изображен вензель паладинов...";
	inv_animate = 1;
};

instance ItKe_Sleeper(C_Item)
{
	name = "Символ Спящего";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ItKe_OrcMine_Elevator(C_Item)
{
	name = "Орочий ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от лебедки в шахте орков...";
	inv_animate = 1;
};

instance ItKe_ShipOrcCap(C_Item)
{
	name = "Орочий ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ капитана орочьего дракара...";
	inv_animate = 1;
};

instance ItKe_ArDagar(C_Item)
{
	name = "Орочий ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = "Ключ Ар Дагара";
	text[4] = "Ключ от склада орков...";
	inv_animate = 1;
};

instance ItKe_OrcOreMine(C_Item)
{
	name = "Орочий ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от шахты орков...";
	inv_animate = 1;
};

instance ItKe_OldOrcKey(C_Item)
{
	name = "Орочий ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = "Старый орочий ключ";
	text[3] = "Полукруглый ключ с вырезами, сделанными под различными углами...";
	text[4] = "В основании видна надпись на орочем языке...";
	inv_animate = 1;
};

instance ITKE_PORTALTEMPELWALKTHROUGH_ADDON(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "От двери в разрушеном храме Зодчих...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Bandit(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундука Браго...";
	inv_animate = 1;
};

instance ItKe_SagittaChest(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ от сундуков Сагитты...";
	inv_animate = 1;
};

instance ItKe_DarkZhnez(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Темного Жнеца...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Garond(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Гаронда";
	inv_animate = 1;
};

//------------------эпик данж------------------------

instance ItKe_Arahar(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ Арах'Ара...";
	inv_animate = 1;
};

instance ItKe_LichKing(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Ключ стража храма...";
	inv_animate = 1;
};