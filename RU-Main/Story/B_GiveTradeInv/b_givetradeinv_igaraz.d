
var int igaraz_itemsgiven_chapter_1;
var int igaraz_itemsgiven_chapter_2;
var int igaraz_itemsgiven_chapter_3;
var int igaraz_itemsgiven_chapter_4;
var int igaraz_itemsgiven_chapter_5;

func void b_givetradeinv_igaraz(var C_Npc slf)
{
	if((Kapitel >= 1) && (IGARAZ_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,20);
		CreateInvItems(slf,ItSc_HarmUndead,1);
		IGARAZ_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (IGARAZ_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_01,20);
		CreateInvItems(slf,ItPo_Mana_02,30);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,ItSc_HarmUndead,1);
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		CreateInvItems(slf,ItSc_Firerain,1);
		IGARAZ_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (IGARAZ_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_03,25);
		CreateInvItems(slf,ItMi_RuneBlank,1);
		CreateInvItems(slf,ItSc_HarmUndead,3);
		CreateInvItems(slf,ItPo_Mana_01,40);
		CreateInvItems(slf,ItPo_Mana_02,80);
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
		IGARAZ_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (IGARAZ_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItPo_Mana_03,40);
		CreateInvItems(slf,ItPo_Mana_02,40);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		IGARAZ_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
};