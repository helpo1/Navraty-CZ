
var int hasan_itemsgiven_chapter_1;
var int hasan_itemsgiven_chapter_2;
var int hasan_itemsgiven_chapter_3;
var int hasan_itemsgiven_chapter_4;
var int hasan_itemsgiven_chapter_5;

func void b_givetradeinv_hasan(var C_Npc slf)
{
	if((Kapitel >= 0) && (HASAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItMw_ShortSword5,1);
		CreateInvItems(slf,ItMw_Hellebarde,1);
		CreateInvItems(slf,ItRw_Bow_L_01,1);
		CreateInvItems(slf,ItRw_Bow_L_02,1);
		CreateInvItems(slf,ItRw_Arrow,30);
		CreateInvItems(slf,ItMi_Sulfur,2);
		CreateInvItems(slf,ItMi_Pitch,1);
		CreateInvItems(slf,ItMi_Coal,1);
		CreateInvItems(slf,ItMi_Flask,5);
		CreateInvItems(slf,ItLsTorch,10);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		HASAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((Kapitel >= 2) && (HASAN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Arrow,50);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ITPO_ANPOIS,10);
		HASAN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((Kapitel >= 3) && (HASAN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,100);
		CreateInvItems(slf,ItRw_Bow_M_02,1);
		CreateInvItems(slf,ItRw_Bow_M_03,1);
		CreateInvItems(slf,ItMiSwordraw,2);
		CreateInvItems(slf,ItRw_Arrow,150);
		HASAN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((Kapitel >= 4) && (HASAN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,150);
		CreateInvItems(slf,ItRw_Bow_H_02,1);
		CreateInvItems(slf,ItRw_Bow_H_03,1);
		CreateInvItems(slf,ItRw_Arrow,100);
		HASAN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((Kapitel >= 5) && (HASAN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,ItMi_Gold,200);
		HASAN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};