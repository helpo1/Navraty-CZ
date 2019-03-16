
const int Value_Lockpick = 15;
const int Value_Key_01 = 0;
const int Value_Key_02 = 0;
const int Value_Key_03 = 0;

instance ItKE_lockpick(C_Item)
{
	name = "Paklíč";
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

//-----------------------------------------------Klyuchi--------------------------------

instance ItKe_City_Tower_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč vůdce banditů Nestora...";
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
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč od městské věže...";
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
	text[4] = "Klíč od Valentinovy truhly...";
	inv_animate = 1;
};

instance ItKe_Constantino(C_Item)
{
	name = "Constantinův klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od truhly alchymisty Constantina...";
	inv_animate = 1;
};

instance ItKe_WaterBringer(C_Item)
{
	name = "Klíč Vodonoše";
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
	text[4] = "Klíč od přístavního skladiště...";
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
	text[4] = "Klíč od pokladu zlodějů...";
	inv_animate = 1;
};

instance ItKe_ZhiefGuildKey_MIS(C_Item)
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Tenhle klíč poznamenala slaná mořská voda...";
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
	text[4] = "Klíč od hotelového sklepa...";
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
	text[4] = "Klíč od soudcovy truhly...";
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
	text[4] = "Klíč od truhly alchymisty Salandrila...";
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
	text[4] = "Rezavý klíč od Fingersova pokoje...";
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
	description = "Klíč";
	text[4] = "Klíč od pokoje v nevěstinci...";
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
	text[4] = "Klíč od kapitánské kajuty na paladinské lodi 'Esmeralda'...";
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
	text[4] = "Klíč od truhly v Xardasově věži...";
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
	text[4] = "Klíč od vstupu do kláštera mágů Ohně...";
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
	text[4] = "Klíč od Igarazovy osobní truhly...";
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
	text[4] = "Klíč od klášterní knihovny...";
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
	text[4] = "Klíč od klášterní cely...";
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
	text[4] = "Klíč od klášterní pokladnice...";
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
	text[4] = "Klíč od klášterní spižírny...";
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
	text[4] = "Klíč z knihy 'Irdorathské síně'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_Ginnok(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od hrobky lorda Ginnoka...";
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
	description = "Klíč";
	text[4] = "Klíč od truhly pod mostem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od pokoje v hostinci 'U Mrtvé harpyje'...";
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
	description = "Orlanův klíč";
	text[4] = "Otevírá dveře jeskyně jižně od jeho hostince...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_01(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od hrobky lorda Sengaha...";
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
	description = "Klíč lorda Hagena";
	text[4] = "Klíč od navijáku brány do Hornického údolí...";
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
	text[4] = "Klíč od Dexterovy truhly...";
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
	text[4] = "Klíč od Nergalovy věže...";
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
	text[4] = "Klíč od navijáku průchodu do pevnosti Azgan...";
	inv_animate = 1;
};

instance ItKe_Hagen_Innubis(C_Item) //dvoynoy!!!
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od hrobky lorda Inubise...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_01(C_Item) //mob_func_necrom
{
	name = "Starý ocelový klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od truhly v hrobce lorda Inubise...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "Starý mosazný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od truhly v hrobce lorda Inubise...";
	inv_animate = 1;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "Starý měděný klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od truhly v hrobce lorda Inubise...";
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
	text[4] = "Klíč od truhly na Sekobově farmě...";
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
	text[4] = "Klíč od průchodu k portálu na ostrov Etlu...";
	inv_animate = 1;
};

instance ItKe_MagicChest(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Velice starý železný klíč...";
	inv_animate = 1;
};

instance ItKe_Hagen_DarkOrder_02(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od hrobky lorda Ulzara...";
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
	text[4] = "Klíč od hradního vězení...";
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
	text[4] = "Klíč od strážnice hradní brány v Hornickém údolí...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_FingersKey(C_Item)
{
	name = "Starý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Je na něm vyraženo 'Fingers'...";
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
	text[4] = "Klíč od hradního skladiště...";
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
	text[4] = "Klíč od vnitřní místnosti hradního skladiště...";
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
	description = "Klíč";
	text[4] = "Na klíči je vyryto jméno 'Gomez'...";
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
	text[4] = "Klíč od truhly v kapli mágů na hradě...";
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
	text[4] = "Klíč od truhly v hradní věži v Hornickém údolí...";
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
	description = "Klíč";
	text[4] = "Na klíči je vyryto jméno 'Gomez'...";
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
	description = "Klíč";
	text[4] = "Na klíči je vyryto jméno 'Gomez'...";
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
	text[4] = "Klíč od Gomezovy truhly...";
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
	text[4] = "Klíč, který mi dal hradní kuchař...";
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
	text[4] = "Klíč od truhly mágů Vody v Novém táboře...";
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
	text[4] = "Klíč od truhly žoldáka Wolfa v Hornickém údolí...";
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
	text[4] = "Klíč od pokladu kamenného draka...";
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
	text[4] = "Klíč od pokladu ohnivého draka...";
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
	text[4] = "Klíč od pokladu bažinného draka...";
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
	text[4] = "Klíč od pokladu ledového draka...";
	inv_animate = 1;
};

instance ItKe_Malbar(C_Item) //Scr_OpenChest_Malbar
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_01_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč rudobarona Malbara...";
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
	text[4] = "Klíč od truhly přízračného goblina...";
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
	text[4] = "Klíč od kapitánské kajuty na skřetím drakaru...";
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
	text[2] = "Klíč od zbrojnice na skřetím drakaru...";
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
	text[4] = "Klíč ze žaludku dračího chňapavce...";
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
	description = "Louův klíč";
	text[4] = "Klíč od spižírny v táboře banditů...";
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
	description = "Klíč";
	text[4] = "Klíč od truhly z tábora banditů...";
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
	description = "Estebanův klíč";
	text[4] = "Klíč od Estebanovy truhly...";
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
	description = "Thorusův klíč";
	text[4] = "Klíč od Thorusovy truhly...";
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
	description = "Skinnerův klíč";
	text[4] = "Klíč od Skinnerovy truhly...";
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
	description = "Scattyho klíč";
	text[4] = "Klíč od Scattyho truhly...";
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
	description = "Bloodwynův klíč";
	text[4] = "Klíč od Bloodwynovy truhly...";
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
	text[2] = "Klíč kamenného strážce z bažin...";
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
	text[4] = "Podivně vypadající klíč skřetího šamana...";
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
	description = "Gregův klíč";
	text[4] = "Klíč od chatrče kapitána Grega...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_TARAKOT(C_Item)
{
	name = "Měděný klíč";
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
	name = "Gobliní klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Tenhle klíč měl vůdce goblinů Shakzi...";
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
	text[4] = "Klíč od truhly paladinů...";
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
	text[4] = "Tenhle klíč ležel na krbu...";
	inv_animate = 1;
};

instance ItKe_Ginnok(C_Item)
{
	name = "Rezavý klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_Key_04_Sky.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč lorda Ginnoka...";
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
	text[4] = "Klíč od truhly ducha skřetího šamana v Údolí stínů...";
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
	description = "Dakatův klíč";
	text[4] = "Klíč od truhly v Dakatově hrobce...";
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
	description = "Achironův klíč";
	text[4] = "Klíč od Achironovy truhly...";
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
	text[4] = "Klíč od truhly kněze v Údolí stínů...";
	inv_animate = 1;
};

instance ItKe_Oazis_01(C_Item)	//Scr_OpenChest_AV_01
{
	name = "Rezavý klíč";
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
	name = "Rezavý klíč";
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
	name = "Rezavý klíč";
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
	name = "Rezavý klíč";
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
	name = "Rezavý klíč";
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
	text[4] = "Klíč od navijáku v Osairově jeskyni...";
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
	text[4] = "Klíč Cor Kaloma, démona Masyafu...";
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
	text[4] = "Klíč od spižírny v Masyafském chrámu...";
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
	text[4] = "Klíč Ur-Vataha, skřetího velitele...";
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
	text[4] = "Klíč lorda Archola...";
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
	text[4] = "Klíč Mialekse, stavitele Irdorathského chrámu...";
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
	text[4] = "Klíč od truhly strážce Irdorathských síní, Dementora...";
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
	text[4] = "Starý dveřní klíč...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_FREEMINE(C_Item)
{
	name = "Klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od strážnice Svobodného dolu...";
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
	text[4] = "Klíč od truhly ve Svobodném dole...";
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
	text[4] = "Klíč od skladiště v pevnosti Azgan...";
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
	text[4] = "Klíč od truhly stráží v opuštěném dole...";
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
	text[4] = "Klíč od truhly v zatopené věži...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITKE_SI_SIGN(C_Item)
{
	name = "Pečetní klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ITKE_SEAL_SKY.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Pečetní klíč od vchodu do kaple paladinů...";
	text[4] = "Na klíči je paladinský monogram...";
	inv_animate = 1;
};

instance ItKe_Sleeper(C_Item)
{
	name = "Symbol Spáče";
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
	name = "Skřetí klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od navijáku ve skřetím dole...";
	inv_animate = 1;
};

instance ItKe_ShipOrcCap(C_Item)
{
	name = "Skřetí klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč kapitána skřetího drakaru...";
	inv_animate = 1;
};

instance ItKe_ArDagar(C_Item)
{
	name = "Skřetí klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey_02.3DS";
	material = MAT_METAL;
	description = "Klíč Ar Dagara";
	text[4] = "Klíč od skřetího skladiště...";
	inv_animate = 1;
};

instance ItKe_OrcOreMine(C_Item)
{
	name = "Skřetí klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Klíč od skřetího dolu...";
	inv_animate = 1;
};

instance ItKe_OldOrcKey(C_Item)
{
	name = "Skřetí klíč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_OrcKey.3DS";
	material = MAT_METAL;
	description = "Starý skřetí klíč";
	text[3] = "Půlkruhovitý klíč s výřezy pod rozličnými úhly...";
	text[4] = "Na spodní části je nápis ve skřetím jazyce...";
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
	text[4] = "Ode dveří v zničeném chrámu Stavitelů...";
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
	text[4] = "Klíč od Bragovy truhly...";
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
	text[4] = "Klíč od Sagittiných truhel...";
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
	text[4] = "Klíč Temného Sekáče...";
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
	text[4] = "Garondův klíč...";
	inv_animate = 1;
};

//------------------epik danzh------------------------

instance ItKe_Arahar(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Araharův klíč...";
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
	text[4] = "Klíč strážce chrámu...";
	inv_animate = 1;
};