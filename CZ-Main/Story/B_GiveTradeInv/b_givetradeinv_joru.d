
var int joru_itemsgiven_chapter_1;
var int joru_itemsgiven_chapter_2;
var int joru_itemsgiven_chapter_3;
var int joru_itemsgiven_chapter_4;
var int joru_itemsgiven_chapter_5;

func void b_givetradeinv_joru(var C_Npc slf)
{
	if((Kapitel >= 1) && (JORU_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_1H_Mace_L_04,1);
		CreateInvItems(slf,ItMi_AnvilPliers,1);
		CreateInvItems(slf,ItMi_Stomper,3);
		CreateInvItems(slf,ItMw_Sense,1);
		CreateInvItems(slf,ItMW_Addon_Keule_1h_01,1);
		CreateInvItems(slf,ItMw_Nagelkeule,1);
		CreateInvItems(slf,ItMw_Nagelkeule2,1);
		CreateInvItems(slf,ItMw_Streitkolben,1);
		CreateInvItems(slf,ITMW_1H_MACE_BANDOS_107,1);
		CreateInvItems(slf,ItMw_Zweihaender1,1);
		CreateInvItems(slf,ItMw_Zweihaender2,1);
		CreateInvItems(slf,ItMw_Zweihaender4,1);
		CreateInvItems(slf,ItMw_2H_Claymore,1);
		JORU_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (JORU_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		JORU_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (JORU_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		JORU_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (JORU_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		JORU_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (JORU_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		JORU_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};