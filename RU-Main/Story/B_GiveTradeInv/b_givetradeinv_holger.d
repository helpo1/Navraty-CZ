
var int holger_itemsgiven_chapter_1;
var int holger_itemsgiven_chapter_2;
var int holger_itemsgiven_chapter_3;
var int holger_itemsgiven_chapter_4;
var int holger_itemsgiven_chapter_5;

func void b_givetradeinv_holger(var C_Npc slf)
{
	if((Kapitel >= 1) && (HOLGER_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItFo_Apple,2);
		CreateInvItems(slf,ItFo_Water,3);
		CreateInvItems(slf,ItSc_Firebolt,2);
		CreateInvItems(slf,ItSc_InstantFireball,1);
		CreateInvItems(slf,itfo_wineberrys,1);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItFo_Milk,1);
		CreateInvItems(slf,ItMi_Sulfur,1);
		CreateInvItems(slf,ItMi_Saw,1);
		CreateInvItems(slf,ItMi_Quartz,1);
		HOLGER_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (HOLGER_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItFo_Cheese,1);
		CreateInvItems(slf,ItFoMutton,3);
		CreateInvItems(slf,ItFo_Stew,2);
		CreateInvItems(slf,ItPl_Beet,5);
		CreateInvItems(slf,ItSc_InstantFireball,2);
		CreateInvItems(slf,ItSc_Firebolt,3);
		CreateInvItems(slf,ItPo_Health_01,10);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItFo_FishSoup,5);
		CreateInvItems(slf,ItFo_Milk,3);
		HOLGER_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (HOLGER_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItFo_Cheese,2);
		CreateInvItems(slf,ItFo_Bacon,2);
		CreateInvItems(slf,ItAt_WaranFiretongue,1);
		CreateInvItems(slf,ItPl_Beet,5);
		CreateInvItems(slf,ItFo_Stew,5);
		CreateInvItems(slf,ItSc_Firebolt,3);
		CreateInvItems(slf,itfo_wineberrys,1);
		CreateInvItems(slf,ItFo_Sausage,3);
		CreateInvItems(slf,ItPo_Health_01,15);
		CreateInvItems(slf,ItFo_Milk,5);
		HOLGER_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (HOLGER_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItFo_Wine,5);
		CreateInvItems(slf,ItFo_Milk,10);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,1);
		CreateInvItems(slf,ItMi_Quartz,1);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,ItSc_Firebolt,3);
		CreateInvItems(slf,ItPo_Health_01,20);
		CreateInvItems(slf,ItFo_Bacon,5);
		HOLGER_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (HOLGER_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItFo_Wine,2);
		CreateInvItems(slf,ItFo_Milk,5);
		CreateInvItems(slf,ItFoMutton,5);
		CreateInvItems(slf,ItFo_Stew,3);
		CreateInvItems(slf,ItPo_Health_01,25);
		CreateInvItems(slf,ItFo_Sausage,5);
		CreateInvItems(slf,itfo_wineberrys,2);
		CreateInvItems(slf,ItFo_Bacon,3);
		CreateInvItems(slf,ItFo_Milk,5);
		HOLGER_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};